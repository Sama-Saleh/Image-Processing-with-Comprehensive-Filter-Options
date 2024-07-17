function im4=Addition(im1,im2)
[r,c,ch]=size(im1);
im3=imresize(im2,[r,c]);
im4=zeros(size(im3));
for k=1:ch
    for i=1:r
        for j=1:c
            im4(i,j,k)=im1(i,j)+im3(i,j);
        end
    end
end
im4=uint8(im4);
% figure, imshow(im1),title('original')
% figure, imshow(im4),title('New image')
end