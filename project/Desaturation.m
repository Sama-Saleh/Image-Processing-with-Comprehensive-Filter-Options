function gray=Desaturation(rgb)
[row,col,ch]=size(rgb);
for k=1:ch
    for i=1:row
        for j=1:col
          max_val(i,j)=max(rgb(i,j,:));
          min_val(i,j)=min(rgb(i,j,:));
        end
    end
end
gray = (max_val+min_val)/2;
gray = uint8(gray);
% figure,imshow(rgb),title('Original')
% figure,imshow(gray),title('Desaturation')