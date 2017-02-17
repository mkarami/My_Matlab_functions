function [ X_monthly , unique_monthINDX ] = monthlyavg( day_number, X )
%A function to resample data vector X, into monthly means.
%vector day_number, must be the size of X and store the absolute julian
%dates for the X vector.
%Mojtaba Karami 2017
% moka@ign.ku.dk

dvec=datevec(day_number);

monthINDX=dvec(:,1)*12 + dvec(:,2);
unique_monthINDX=unique(monthINDX);

X_monthly=nan(size(unique_monthINDX,1),size(X,2));

for i=1:size(X_monthly,1)
    mask=monthINDX==unique_monthINDX(i);
    X_monthly(i,:)=nanmean(X(mask,:),1);
end

month=rem(unique_monthINDX,12);
month(month==0)=12;
unique_monthINDX=datenum([(unique_monthINDX-month)/12 month eomday((unique_monthINDX-month)/12,month)/2]);   %datenum([year month (n.days.in.month)/2]

end

