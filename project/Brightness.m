function output_im=Brightness(im,offset)%%%%%%%%%%%%%%%%Brightness%%%%%%%%
[r,c,ch]=size(im);
output_im=zeros(r,c,ch);
for k=1:ch
    for i=1:r
        for j=1:c
            New_val=im(i,j,k)+offset;
            if New_val>255
                New_val=255;
            end
            if New_val<0
                New_val=o;
            end
           output_im(i,j,k)= New_val;
        end
    end
end
output_im=uint8(output_im);
% figure, imshow(im),title('original')
% figure, imshow(output_im),title('Brighted image')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55Darkness%%%%%%%%%%%
% function Darkness(im,offset)
% [r,c,ch]=size(im);
% output_im=zeros(r,c,ch);
% for k=1:ch
%     for i=1:r
%         for j=1:c
%             New_val=im(i,j,k)-offset;
%             if New_val>255
%                 New_val=255;
%             end
%             if New_val<0
%                 New_val=o;
%             end
%            output_im(i,j,k)= New_val;
%         end
%     end
% end
% output_im=uint8(output_im);
% figure, imshow(im),title('original')
% figure, imshow(output_im),title('Darkness image')
% end