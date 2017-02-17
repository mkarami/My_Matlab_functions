function [local_t]=solartime2local(Sol_t,lon,dTGMT)
%Mojtaba Karami Aug 2016
%based on mod11_user_guide.pdf


local_t=Sol_t-lon./15+dTGMT;

end