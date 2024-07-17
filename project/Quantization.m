function New_im=Quantization(im,k)
[r,c,ch]=size(im);
New_im=zeros(r,c,ch);
GrayLevel=2^k;
Gap=256/GrayLevel;
Colors=Gap:Gap:256;
for k=1:ch
    for i=1:r
        for j=1:c
            Temp=double(im(i,j,k)/Gap);
            index=floor(Temp);
            if index<=0
                index=1;
            end
            New_im(i,j,k)=Colors(index);
        end
    end
end


New_im=uint8(New_im);
% figure, imshow(im),title('original')
% figure, imshow(New_im),title('quantization image')
end
