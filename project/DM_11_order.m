function new_pic=DM_11_order(pic,fact)
[r,c,ch]=size(pic);
new_r=r*fact;
new_c=c*fact;
new_pic=zeros(new_r,new_c,ch);
for k=1:ch
    for i=1:r
        for j=1:c
            row=fact*(i-1)+1;
            colum=fact*(j-1)+1;
            new_pic(row,colum,k)=pic(i,j,k);
        end
    end
end

for k=1:ch
    for i=1:fact:new_r
        for j=1:fact:new_c
            final_j=j+fact;
            if(final_j>=new_c)
                for z=1:(fact-1)
                    new_pic(i,(j+z),k)=new_pic(i,j,k);
                end
            else
            first=new_pic(i,j,k);   
            sec=new_pic(i,final_j,k);    
            max_val = max(first,sec);
            min_val = min(first,sec);
            if(first<=sec)
                for y=1:(fact-1)
                    p=round((( max_val - min_val)/(fact))*y + min_val);
                    new_pic(i,(j+y),k)=p;
                end
            else
                new_i=fact-1;
                for x=1:fact-1
                    p=round((( max_val - min_val)/(fact))*new_i + min_val);
                    new_pic(i,(j+x),k)=p;
                    new_i=new_i+2;
                end
            end
            end 
        end
    end
end
for k=1:ch
    for j=1:new_c
        for i=1:fact:new_r
        
            final_i=i+fact;
            if(final_i>=new_r)
                for z=1:(fact-1)
                    new_pic((i+z),j,k)=new_pic(i,j,k);
                end
            else
            first=new_pic(i,j,k);   
            sec=new_pic(final_i,j,k);    
            max_val = max(first,sec);
            min_val = min(first,sec);
            if(first<=sec)
                for y=1:(fact-1)
                    p=round((( max_val - min_val)/(fact))*y + min_val);
                    new_pic((i+y),j,k)=p;
                end
            else
                new_i=fact-1;
                for x=1:fact-1
                     p=round((( max_val - min_val)/(fact))*new_i + min_val);
                    new_pic((i+x),j,k)=p;
                    new_i=new_i+2;
                end
            end
            end 
        end
    end
end


new_pic = uint8(new_pic);
% figure,imshow(pic),title('Original')
% figure,imshow(new_pic),title('Resized')
end

