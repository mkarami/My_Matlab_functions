function [Sol_t]=localtime2solar(local_t,lon,dTGMT)
%Mojtaba Karami Aug 2016
%based on mod11_user_guide.pdf

Sol_t=local_t+lon./15-dTGMT;
end