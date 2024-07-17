function New_im=power_low(im,gamma)
[r,c,ch]=size(im);
New_im=zeros(r,c,ch);
for k=1:ch
    for i=1:r
        for j=1:c
            old_value=double(im(i,j,k));
            New_val=(old_value).^gamma;
            New_im(i,j,k)=(New_val);
        end
    end
end
 New_im=Contrast(New_im,0,255);
%  figure, imshow(im),title('original')
% figure, imshow(New_im),title('power')

end