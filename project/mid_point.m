function new_im=mid_point(im,mask)
%  im=0.3*im(:,:,1) + 0.59*im(:,:,2) + 0.11*im(:,:,3);
[r,c,ch]=size(im);
im=padarray(im,[(mask-1)/2 (mask-1)/2],'replicate');
New_im=zeros(r,c,ch);
for k=1:ch
    for i=1:r-2
        for j=1:c-2
            x=max(max(im(i:i+mask-1,j:j+mask-1,k))); 
            y=min(min(im(i:i+mask-1,j:j+mask-1,k)));
             New_im(i+1,j+1,k)=(x+y)/2;
        end        
    end
end

new_im=uint8(New_im);
% figure,imshow(im),title('Original')
% figure,imshow(new_im),title('mid point Filter')
end