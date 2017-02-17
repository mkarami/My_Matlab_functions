function [out]=resize_modis(in,new_size)

old_size=size(in,1);
factor=new_size/old_size;
out=nan(new_size,new_size,size(in,3));

for i=1:new_size
    for j=1:new_size
        out(i,j,:)=in(ceil(i/factor),ceil(j/factor),:);
    end
end