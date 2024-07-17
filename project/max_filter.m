function New_im=max_filter(im,windowSize)
[r,c,ch]=size(im);
im=padarray(im,[(windowSize-1)/2 (windowSize-1)/2],'replicate');
new_im=zeros(r,c,ch);
for k=1:ch
   for i=1:r-2
      for j=1:c-2
         new_im(i+1,j+1,k)=max(max(im(i:i+windowSize-1,j:j+windowSize-1,k)));          
      end
   end
end

New_im=uint8(new_im);
% figure,imshow(im),title('Original')
% figure,imshow(New_im),title('max Filter')

end