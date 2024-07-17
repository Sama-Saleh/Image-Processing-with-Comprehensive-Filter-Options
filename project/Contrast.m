function output_im=Contrast(im,New_Min,New_Max)
[r,c,ch]=size(im);
output_im=zeros(r,c,ch);
old_min=255;
old_max=0;
for k=1:ch
    for i=1:r
        for j=1:c
        if(im(i,j,k)<old_min)
            old_min=im(i,j,k);
        elseif(im(i,j,k)>old_max)
            old_max=im(i,j,k);
        end
        end
    end
end
for k=1:ch
    for i=1:r
        for j=1:c       
           % New_val=double(double(im(i,j,k)-old_min)./double(old_max-old_min))*double(New_Max-New_Min)+New_Min;
            New_val=double(double(New_Max-New_Min)/double(old_max-old_min)*double(im(i,j,k)-old_min))+New_Min;
            if New_val>255
                New_val=255;
            end
            if New_val<0
                New_val=0;
            end
           output_im(i,j,k)=New_val;
        end
    end
end
output_im=uint8(output_im);
%   figure, imshow(im),title('original')
%  figure, imshow(output_im),title('contrasted image')
end
