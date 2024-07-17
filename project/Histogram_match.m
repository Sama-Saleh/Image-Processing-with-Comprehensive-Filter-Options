function new_im=Histogram_match(im1,im2)
%  figure, imshow(im1),title(' image');
%   figure, imshow(im2),title('mage');
[row,col,ch]=size(im2);
var1=zeros(256);
var2=zeros(256);
for k=1:ch
    for i=1:row
        for j=1:col
            while i<row && j<col
            var1(im1(i,j,k)+1)=var1(im1(i,j,k)+1)+1;
             var2(im2(i,j,k)+1)=var2(im2(i,j,k)+1)+1;%to get histogram
            end
        end
    end
end

for i=2:256        %i=2 because first will be the same and add from second i-1 wii get error becouse index0
    var1(i)=var1(i)+var1(i-1);
    var2(i)=var2(i)+var2(i-1);
end
max_val=var1(256);
max_val2=var2(256);
for i=1:256       
    var1(i)=round(double(var1(i)/max_val)*double(256));
      var2(i)=round(double(var2(i)/max_val2)*double(256));
end

    for i=1:256
        x=256;
        for j=1:256
        if(abs(var1(i)-var2(j))<x)
            x=abs(var1(i)-var2(j));
            ind=j;
        end
        end
        var1(i)=ind-1;
    end

 for k=1:ch
    for i=1:row
        for j=1:col
            im2(i,j,k)=var1(im2(i,j,k)+1);
        end
    end
end
  new_im=im2;
%  figure, imshow(new_im),title('histogram_match image');
end