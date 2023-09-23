clear;
clc;

I=imread("peppers.png");
[w, h]=size(I);

I1 = padarray(I,[2,2],0, 'both');

I2=zeros(w,h,'uint8');
% 
% 
% for i=3:w-2
%     for j=3:h-2
%         k=0;
%         A = zeros([16,1]);
%         c=I(i,j,:);
%         if(I(i,j+1,:)>c)
%             k=k+1;
%         end
%         if(I(i-1,j,:)>c)
%             k=k+4;
%         end
%         if(I(i,j-1,:)>c)
%             k=k+16;
%         end
%         if(I(i+1,j,:)>c)
%             k=k+64;
%         end
%         if(I(i-2,j-2, :)>c)
%             k=k+256;
%         end
%         if(I(i-2,j+2,:)>c)
%             k=k+1024;
%         end
%         if(I(i+2,j+2,:)>c)
%             k=k+4096;
%         end
%         if(I(i+2,j-2,:)>c)
%             k=k+16384;
%         end
%         I2(i,j,:)=k;
% 
%     end
% end
% 
% subplot(2,1,1);
% imshow(I);
% subplot(2,1,2);
% imshow(I2);