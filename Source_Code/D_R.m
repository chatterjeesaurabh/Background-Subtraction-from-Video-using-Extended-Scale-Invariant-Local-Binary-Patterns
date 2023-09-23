function [Dr] = D_R(I_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global I_drk;
I_drk = double(I_drk);
global I_brtst;
I_brtst = double(I_brtst);
I_t = double(I_t);
lambda = 0.5;
eta = 1.2;
Dr=1;

m_idrk = mean(I_drk);
m_ibrtst = mean(I_brtst);
m_it = mean(I_t);

if((m_it>m_idrk) && (m_it < m_ibrtst))
   Dr = 0;
end


if(lambda*m_it <m_idrk)
    I_drk = lambda*I_t;
end

if(eta*m_it > m_ibrtst)
    I_brtst = eta*I_t;
end


% I_drk = min(lambda*I_t, I_drk);
% I_brtst = max(eta*I_t,I_brtst);

end