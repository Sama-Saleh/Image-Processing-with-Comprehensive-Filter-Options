function new_im=Image_Negative(im)
[r,c,ch]=size(im);
new_im=zeros(r,c,ch);
for k=1:ch
    for i=1:r
        for j=1:c
            new_im(i,j,k)=255-im(i,j,k);
        end
    end
end
   new_im=uint8(new_im);
% figure, imshow(im),title('original')
% figure, imshow(new_im),title('Negative image')     
end