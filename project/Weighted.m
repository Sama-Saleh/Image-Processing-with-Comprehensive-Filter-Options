function image=Weighted(im,sigma)
%figure, imshow(im),title('original')
im=double(im);
image=zeros(size(im));
border=padarray(im,[1 1],'replicate','both');
[row,col,ch]=size(border);
%he smallest value = 0.5 any value less than 0.5 represent pixel opreation 1x1 
N = floor(3.7*sigma-0.5);
mask_size = 2*N+1;
t=floor(mask_size/2);
x=(-t:t);
mask=zeros(mask_size,mask_size);
ceof=(1/(2*pi*(sigma^2)));
for k=2:mask_size
    x(k)=x(k-1)+1;
end
mask=zeros(mask_size,mask_size);
for i=1:mask_size
    for j=1:mask_size
        mask(i,j)=ceof*exp(-((x(i)^2+x(j)^2))/(2*(sigma^2)));
    end
end
%%%%%%%%%%%%%%%%%
for k=1:ch
    g=mask_size;
    for i=1:row
        h=mask_size;
        for j=1:col
            x=0;
            if g>row || h>col
                break;
            end
            sub_mat=border(i:g,j:h,k);
            h=h+1;
            for a=1:mask_size
                for b=1:mask_size
               x=x+mask(a,b)*double(sub_mat(a,b));  
                end
            end
            y=floor(x/ceof);
            
            image(i,j,k)=(y);
        end
        g=g+1;
    end
end
image=uint8(image);
figure, imshow(image),title('weighted image')
end