function [op] = Background_model_intialize(vf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


[w,h,ch] = size(vf);
op = zeros([20,6]);  % N color_feat+esilbp_feat
% I1 = padarray(vf,[2,2],0, 'both');
esilbp_feat = uint16(zeros([3,1]));
a=0;
b=0;


for i=1:20
    a = randi([3,w-3],1);
    b = randi([3,h-3],1);
    F = vf(a-2:a+2,b-2:b+2,:);
    for k=1:ch
        dum = ESILBP(F(:,:,k));
        esilbp_feat(k) = dum;
    end
     op(i,1:3) = vf(a,b,:);
     op(i,4:6) = esilbp_feat;

end

% 
%     for j=3:h
%         Im1 = I1(i-2:i+2,j-2:j+2,:);
%         a = randi([3,w],1);
%         b = randi([3,h],1);
%         F = I1(a-2:a+2,b-2:b+2,:);
%         for k=1:ch
%             dum = ESILBP(F(:,:,k))';
%             z = num2str(dum);
%             z(isspace(z)) = '';
%             z= uint16(bin2dec(z));
%             esilbp_feat(k) = z;
%         end
%         
% 
%         op(i,j,1:3) = I1(i,j,:);
%         op(i,j,4:6) = esilbp_feat;
%     end
end