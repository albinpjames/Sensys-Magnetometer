function raw2dailyfil() 
clear all;
STN = input('Enter the station name\code(STN) >','s');
%----Scan input files----------
temp=dir('*.csv');
temp1={temp.name}';
temp2=cell2mat(temp1);
[m1,n1]=size(temp1);
%------Initialise variables-----
time_fin=0;
index1=1;
flag1=0;
tm_start=0;
f=1;
k=1;
while k<=m1
 date_time = fun_importdatetime(eval([' temp2(k,:) ']), 1, 1); 
 datetime_char = convertStringsToChars(date_time);
 data=fun_importfile(eval([' temp2(k,:) ']), 15, inf);
 [m2,n2]=size(data);

  %----Execute this only for the first iteration-------
    if flag1==0
        %------extract date & time---------------
        t1=datevec(datetime_char(1:10),'yyyy-mm-dd');
        t2=datestr(t1);
        t3=[t2 datetime_char(11:19)];
        [yy mm dd hh min sec]=datevec(t3);
        tm1=hh+(min/60)+(sec/3600);
        time_fin=tm1;
        tm_start=data(1,1);
        %-----create datenum ref--------------
        startyear=year(t2);
        refdate=[year(t2)-1, 12, 31];
        datenum_ref=datenum(refdate);
        startdaynum=datenum(t2)-datenum_ref;
        
        %-----create output file--------------
        flag1=1;
        out_fl=[datestr(datenum(t1)) '-' STN '.txt'];
        fid=fopen(out_fl,'w');
    end
     for j=1:m2
        tm2=((data(j,1)-tm_start)/3600000)+time_fin;
        fprintf(fid,'%i %14.6f %15.8e %15.8e %15.8e %15.8e\n',startdaynum,(tm2-(index1-1)*24),(data(j,2)),(data(j,3)),(data(j,4)),(data(j,5)));  %----write data into file-----
        
        %-----Construct new file name every 24 hours-----
        if(tm2>(24*index1))
            index1=index1+1;
            fclose(fid); 
            f=f+1;
            t4=datenum(t1)+(index1-1);
            t5=datestr(t4);
            %-----yearwise datenum correction--------------
            if(startyear~=year(t5))
               startyear=year(t5);
               refdate=[year(t5)-1, 12, 31];
               datenum_ref=datenum(refdate);
               startdaynum=datenum(t5)-datenum_ref;
            else
               startdaynum=datenum(t5)-datenum_ref;
            end
            
            out_fl=[datestr(t4) '-' STN '.txt'];
            fid=fopen(out_fl,'w');
        end
     end
    ime_fin=tm2-(index1-1)*24;
    k=k+1;
end
fclose(fid);
disp('END');