function out=checksum(x,i,j)

%计算特定一维向量的第m个区域的最低位的校验和
    temp=zeros(1,4);
    temp(1)=bitget(x(2*i-1,2*j-1),1);
    temp(2)=bitget(x(2*i-1,2*j),1);
    temp(3)=bitget(x(2*i,2*j-1),1);
    temp(4)=bitget(x(2*i,2*j),1);
    out=rem(sum(temp),2);

end