function OneMinAvg_dailyfil()
clear all;
%----Scan input files----------
temp=dir('*.txt');
temp1={temp.name}';
temp2=cell2mat(temp1);
[m1,n1]=size(temp1);
%------Initialise variables-----
f=1;
k=1;
while k<=m1
    data=fun_secfileimport(eval([' temp2(k,:) ']), 1, inf);
    [m2,n2]=size(data);
    
    %Day wise file----
        dd=temp2(k,:);
        sz=size(dd);
        titl=dd(1:(sz(2)-4));
    out_fl=[titl '-OneMinAvg.txt'];
    fid=fopen(out_fl,'w');
    
    j=1;
    while (j <= m2 )
        dn=zeros([1 6]);
        i=1;
        while(i<=60 & j<=m2)
            dn=dn(1,:)+data(j,:);
            j=j+1;
            i=i+1;
        end   
        dn=dn(1,:)/(i-1);
        
    
    fprintf(fid,'%i %14.6f %15.8e %15.8e %15.8e %15.8e\n',(dn(1,1)),(dn(1,2)),(dn(1,3)),(dn(1,4)),(dn(1,5)),(dn(1,6)));
    end
    fclose(fid);
    k=k+1;
end
   
disp('END');