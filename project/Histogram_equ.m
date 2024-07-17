function new_im=Histogram_equ(im)
[row,col,ch]=size(im);
var=zeros(256);
for k=1:ch
    for i=1:row
        for j=1:col
            var(im(i,j,k)+1)=var(im(i,j,k)+1)+1;
        end
    end
end

for i=2:256        %i=2 because first will be the same and add from second and there is not index 0 var(0)
    var(i)=var(i)+var(i-1);
end
max_val=var(256);
for i=1:256       
    var(i)=round(double(var(i)/max_val)*double(256));
end
for k=1:ch
    for i=1:row
        for j=1:col
         im(i,j,k)=var(im(i,j,k)+1);
        end
    end
end
  new_im=im;
% figure, imshow(new_im),title('histogram_equ image');
end