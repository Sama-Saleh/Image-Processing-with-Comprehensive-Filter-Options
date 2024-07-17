function gray=Decomposing(rgb)
[row,col,ch]=size(rgb);
for k=1:ch
    for i=1:row
        for j=1:col
          max_val(i,j)=max(rgb(i,j,:));
        end
    end
end
gray = max_val;
gray = uint8(gray);
% figure,imshow(rgb),title('Original')
% figure,imshow(gray),title('Decomposing')