clear;

%% Reading Video File
vid = VideoReader("test_vid.avi");
depVideoPlayer = vision.DeployableVideoPlayer;

%% Displaying Video

while hasFrame(vid)
    vf = readFrame(vid);
    vf = imresize(vf,0.5);
    depVideoPlayer(vf);
    pause(1/vid.FrameRate);
    break;
end
close all;

[w,h,ch] = size(vf);
% vf = readframe(vid);


% Initializations
global I_drk;
global I_brtst;
I_drk = double([0,0,0]);
I_brtst = double([0,0,0]);
S_frame = zeros([w,h]);
S_vid = [];
T_desc = 2;
Ta = 0.2;
min_match = 2;
N=20;
B = zeros([N,6]); 
frame =1;
while hasFrame(vid)
    vf = readFrame(vid);
    vf = imresize(vf,0.5);
    if(frame==1)
        frame = frame+1;
        I1 = padarray(vf,[2,2],0, 'both');
        B=Background_model_intialize(vf);
        continue;
    end

    if(frame ==2)
        I_drk = min(min(vf));
        I_drk = reshape(I_drk,[1,3]);
        I_brtst = max(max(vf));
        I_brtst = reshape(I_brtst,[1,3]);
    end
%     [w, h] = size(vf);
    I1 = padarray(vf,[2,2],0, 'both');

    for j=3:w
        for k=3:h
            color_dist = 0;
            texture_dist = 0;
            n_matches=0;
            i =1;
            while(n_matches<min_match && i<N)
                 b = reshape(B(i,1:3),[1,3]); % 1:3 means taking RGB values
                 a = reshape(I1(j,k,:),[1,3]);
                 color_dist = Dist(a, b);
                 if color_dist>Ta
                     i=i+1;
                     continue;
                 end
                 
                 
                 Im1 = I1(j-2:j+2,k-2:k+2,:);
                 esilbp = zeros([1,3]);
                                  
                 for o=1:3
                     % The 3 lines below convert decimal ESILBP to binary
                     im2 = B(i,o+3);       % o+3 as ESILBP features are stored in indexes 4,5,6
                     im2 = DEC_BIN(im2);
                     esilbp(o) = ESILBP(Im1(:,:,o));
                     im1 = DEC_BIN(esilbp(o));
                     A1 = xor(im1, im2);
                     y = sum(A1==1); % calculating the hamming distance
                     texture_dist=texture_dist+y;
                 end

                 if(texture_dist > 3*T_desc)
                     i=i+1;
                     continue;
                 end
                 n_matches=n_matches+1;
            end

            if(n_matches<min_match)
                S_frame(j-2,k-2) = 1;
                disp("foreground");
            else
                disp("background");

                % Background model update
                idx = randi([1,20],1);
                B(idx,1:3)=I1(j,k,:);
                B(idx,1:3)=I1(j,k,:);
                S_frame(j-2,k-2) = 0;
            end
    
        end
    end
    S_vid(:,:,frame) = S_frame;
    frame = frame+1;
end
