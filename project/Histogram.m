function var=Histogram(in_image)
[row,col,ch]=size(in_image);
var=zeros(1,256);
for k=1:ch
    for i=1:row
        for j=1:col
            var(in_image(i,j,k)+1)=var(in_image(i,j,k)+1)+1;
        end
    end
end
graylevel=0:255;
% figure,  bar(graylevel,var,'BarWidth',4);
end