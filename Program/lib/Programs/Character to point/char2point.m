function char2point()
clear all;
%----Scan input files----------
temp=dir('*.csv');
temp1={temp.name}';
temp2=cell2mat(temp1);
[m1,n1]=size(temp1);
%------Initialise variables-----
k=1;
char = input('Character to be replaced >','s');
while k<=m1
    % Note that the file is overwritten, which is the price for high speed.
 
    file    = memmapfile(eval([' temp2(k,:) ']), 'writable', true );
        char   = uint8(char); 
        point   = uint8('.');
        file.Data( transpose( file.Data==char) ) = point;
        
    k=k+1;
end
disp('END');