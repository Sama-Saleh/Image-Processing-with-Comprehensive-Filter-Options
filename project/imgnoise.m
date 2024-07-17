function New_img=imgnoise(a)
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
imgnoise = imnoise(a,'salt & pepper');
add=1;%number of columns and rows added
Padding_org_img = padarray(imgnoise,[add add],'replicate','both');

mask_size=3;
arr=zeros(3,3);
for k=1:ch
    for i=1:r
        for j=1:c
            for fr=0:mask_size-1
               for fc=0:mask_size-1
                   arr(fr+1,fc+1)=Padding_org_img(i+fr,j+fc,k);
               end 
            end
            New_img(i,j,k)=(max(arr(:))+min(arr(:)))/2;      
        end
    end
end

New_img = uint8( New_img);
% imshow(New_img);
