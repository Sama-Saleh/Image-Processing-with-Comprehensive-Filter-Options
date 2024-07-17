function image=Edge_detiction(im)
im=rgb2gray(im);%if image is rgb use this line to convert it
%figure, imshow(im),title('original')
im=double(im);
image=zeros(size(im));
border=padarray(im,[1 1],'replicate','both');
[row,col,ch]=size(border);
mask=[0 -1 0;-1 4 -1;0 -1 0];
for k=1:ch
g=3;
for i=1:row
    h=3;
        for j=1:col
            if g>row || h>col
                break;
            end
            sub_mat=border(i:g,j:h,k);
            h=h+1;
            x=0;
            for a=1:3
                for b=1:3
                    x=x+double(sub_mat(a,b))*mask(a,b);  
                end
            end
            y=floor(x);
            image(i,j,k)=y;
        end
        g=g+1;
end
end
%  Contrast(image,255,0);
 image=uint8(image);
%  figure, imshow(image),title('Edge_detiction image')
end