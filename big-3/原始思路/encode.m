A=imread('1','jpg');
C=imread('1','jpg');

C=rgb2gray(C);
A=rgb2gray(A);

imshow(A);

for k=1:50
     for x=1:508
        for y=1:508
            x1=x+y;
            y1=x+2*y;
            if(x1>508)
                x1=mod(x1,508);
            end
            if(y1>508)
                y1=mod(y1,508);
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

     if(A==C)
        d=k;
     end
end

imshow(B);
imwrite(B,'2.png')