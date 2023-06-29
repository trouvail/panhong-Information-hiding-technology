clear

A=imread('2.png');

for k=1:50
     for x=1:508
        for y=1:508

            x1=2*x-y;
            y1=y-x;

            if(x1>508)
                x1=mod(x1,508);
            end

            if(y1>508)
                y1=mod(y1,508);
            end

            if x1<0
                x1=x1+508;
            end

            if y1<0
                y1=y1+508;
            end

            if x1==0
                x1=508;
            end

            if y1==0
                y1=508;
            end

            B(x1,y1)=A(x,y);
        end
     end
     A=B;
end

imshow(B);
imwrite(B,'3.png');