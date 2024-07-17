function gray = Averaging(rgb)
gray=((rgb(:,:,1))+(rgb(:,:,2))+(rgb(:,:,3)))/3;
gray = uint8(gray);
% figure,imshow(rgb),title('Original')
% figure,imshow(gray),title('gray')