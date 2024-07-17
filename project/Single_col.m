function gray = Single_col(rgb)
gray=rgb(:,:,1);
gray = uint8(gray);
% figure,imshow(rgb),title('Original')
% figure,imshow(gray),title('Single color channel')