function delH_singlefil()
clear all;
%----Scan input files----------
temp=dir('*.txt');
temp1={temp.name}';
temp2=cell2mat(temp1);
[m1,n1]=size(temp1);

%Calculate delta_H--------------
f=1;
k=1;
delH=0;
while k<=m1 
 data=fun_secfileimport(eval([' temp2(k,:) ']), 1, inf);
 [m2,n2]=size(data);

    i=0;  
    sum=0;
    avg=0;
    for j=1:m2; 
    if(1<=data(j,2)<=3)
    i=i+1;
    sum=sum+data(j,(3:6));
    end
    end
    avg=sum(1:4)/i;
    delH=delH+avg(1:4);
    k=k+1;
end
delH=delH/m1;
disp('The value of Delta H'); 
disp('       x          y        z       total');
disp(delH);

%To write data to file after subtracted delta_H
f=1;
k=1;
dd=temp2(k,:);
sz=size(dd);
if m1==1
titl=dd(1:(sz(2)-4));
out_fl=[titl '-DeltaH.txt'];
else
titl=dd(8:(sz(2)-4));
out_fl=[titl '-DeltaH.txt'];
end
fidt=fopen(out_ft,'w');
while k<=m1 
 data=fun_secfileimport(eval([' temp2(k,:) ']), 1, inf);
 [m2,n2]=size(data);
 
     for j=1:m2
     fprintf(fidt,'%i %14.6f %15.8e %15.8e %15.8e %15.8e\n',(data(j,1)),(data(j,2)),((data(j,3))-delH(1)),((data(j,4))-delH(2)),((data(j,5))-delH(3)),((data(j,6))-delH(4)));  %----write data into file-----
     end
      
    k=k+1;
end
  fclose(fidt);
  disp('END');

