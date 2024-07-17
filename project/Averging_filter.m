function image=Averging_filter(im,si)
%figure, imshow(im),title('original')
im=double(im);
image=zeros(size(im));
bor=floor(si/2);
border=padarray(im,[bor bor],'replicate','both');
[row,col,ch]=size(border);
mask=ones(si,si);
for k=1:ch
    g=si;
    for i=1:row
        h=si;
        for j=1:col
            x=0;
            if g>row || h>col
                break;
            end
            sub_mat=border(i:g,j:h);
            h=h+1;
            for a=1:si
                for b=1:si,
               x=x+mask(a,b)*double(sub_mat(a,b));  
                end
            end
            y=(x/(si*si));
            image(i,j,k)=double(y);
        end
        g=g+1;
    end
end
image=uint8(image);
%figure, imshow(image),title('averging image')
end