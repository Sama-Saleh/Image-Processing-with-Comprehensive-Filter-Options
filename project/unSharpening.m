function new_image=unSharpening(image,s)
% subplot(2,2,1);
% imshow(image);
% title('Original Input Image');
image=double(image);
[r,c,ch] = size(image);
new_image=zeros(r,c,ch);
bor=floor(s/2);
border= padarray(image,[bor, bor],'replicate','both');
%figure,imshow(image),title('Old Image');
[row,col,ch]=size(border);
f=s*s;
for k=1:ch
    for i = bor+1: row-bor
        for j = bor+1: col-bor
            sum = 0;
            i_b = i-bor;
            j_b = j-bor;
            for ii = i_b:(i_b+bor+1)
                for jj = j_b:(j_b+bor+1)
                    sum = sum + border(ii,jj,k);
                end
            end
            new_image(i-bor,j-bor,k) = sum/f;
        end
    end
end
for k=1:ch
    for i = bor+1: row-bor
        for j = bor+1: col-bor
            new_image(i-bor,j-bor,k)=image(i-bor,j-bor,k)-new_image(i-bor,j-bor,k);
            if new_image(i-bor,j-bor,k)>=255
                new_image(i-bor,j-bor,k)=255;
            end
            if new_image(i-bor,j-bor,k)<=0
                new_image(i-bor,j-bor,k)=0;
            end
            
            new_image(i-bor,j-bor,k)=image(i-bor,j-bor,k)+new_image(i-bor,j-bor,k);
            if new_image(i-bor,j-bor,k)>=255
                new_image(i-bor,j-bor,k)=255;
            end
            if new_image(i-bor,j-bor,k)<=0
                new_image(i-bor,j-bor,k)=0;
            end
        end
    end
end
new_image=uint8(new_image);
%image=uint8(image);
% subplot(2,2,2);
% imshow(new_image);
% title('new unSharpening image');
                
end