function [h,v,r,c]=pixel_loc(lat,lon,cells)
%The function converts latitudes and longitudes to the addresses in MODIS
%grid system. The lat/lon inputs can be scalars (1by1), vectors, or m-by-n
%matrices.

% Inputs:
% lat: Matrix of latitudes (mxn)
% lon: Matrix of longitudes (mxn)
% cells: scalar defining the number of pixels along one sample line or
% column of the modis scene. This is usually 1200 or 4800.
% 
% Outputs:
% h: matrix of horizontal tile numbers (mxn)
% v: matrix of vertical tile numbers (mxn)
% h: matrix of row numbers for the pixels (mxn)
% h: matrix of column numbers for the pixels (mxn)
% 
% 
% 
% 
% Mojtaba Karami 2015
% moka@ign.ku.dk


R = 6371007.18100; %Earth's radius in meters
tile_width = 2*pi*R / 36;
tile_height = tile_width;
pixel_size = tile_width/cells;
disp(['precision = ' num2str(pixel_size/1000) ' m'])

Y=-deg2rad(lat).*R;%global map coordinates
X=deg2rad(lon).*cos(Y./R).*R;%global map coordinates


v=(Y + (pi.*R./2))./tile_height;%vertical tile with decimal
h=(X + pi.*R)./tile_width;%horizontal tile with decimal
r=floor(rem(v,1).*cells*1000)/1000+1;%use decimal to 
c=floor(rem(h,1).*cells*1000)/1000+1;
v=floor(v);
h=floor(h);

end