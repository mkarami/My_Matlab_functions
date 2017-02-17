  function [lat, long] = invSinProj(x,y) 
  %A function to convert coordinates from MODIS Sinusoidal projection to
  %Latitutdes and Longitudes
  %
  %Mojtaba Karami 2017
  %moka@ign.ku.dk
  
  R = 6371007.18100; %Earth's radius

 long_0 = 0;
 lat = y/R;

 long = long_0 + x./(R*cos(lat));

 lat = lat*180/pi; %degree
 long = long*180/pi;
 end 
 
 