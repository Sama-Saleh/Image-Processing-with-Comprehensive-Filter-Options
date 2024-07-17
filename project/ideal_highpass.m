function Idealhigh_filtered_img=ideal_highpass(input_img,D0)

input_img=rgb2gray(input_img);


FT = fft2(input_img);    
FTS = fftshift(FT);  
Real = real(FTS);   
Imag = imag(FTS);

[M,N] = size(input_img);  
H = zeros(size(FT));

for u = 1:M
   for v = 1:N
      
       D = sqrt((u-(M/2))^2 + (v-(N/2))^2);
       
       if D > D0
           H(u,v) = 1; 
       else     
           H(u,v) = 0;
       end
        
   end
end

Real_filtered = Real .* H;
Imag_filtered = Imag .* H;

FTS_filtered = Real_filtered + i * Imag_filtered;
FT_filtered = ifftshift(FTS_filtered);
Idealhigh_filtered_img = real(ifft2(FT_filtered));
Idealhigh_filtered_img=uint8(Idealhigh_filtered_img);
% figure;
% subplot(1,2,1);
% imshow(input_img);
% title('Original Image');
% subplot(1,2,2);
% imshow(uint8(Idealhigh_filtered_img));
% title('Ideal HighPass Filtered Image');

