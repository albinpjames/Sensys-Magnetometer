function graphing_dailyfil()
clear all;
axisnum=input('Choose the axis number >');
%----Scan input files----------
temp=dir('*.txt');
temp1={temp.name}';
temp2=cell2mat(temp1);
[m1,n1]=size(temp1);
%------Initialise variables-----
f=1;
k=1;
while k<=m1
    data=importdata(temp2(k,:));
    doy=data(:,1)+data(:,2)/24;
    h_mf=data(:,axisnum).*10^9;
    %--------------------------
    
    
    dd=temp2(k,:);
    sz=size(dd);
    titl=dd(13:(sz(2)-4));
    date=dd(1:11);
    year=dd(8:11);
      
    figure(1)
    grid on
    plot(doy,h_mf,'*k');
    %Axis limit is set for the x axis-----------
    % axis([356 365 -inf inf])
    %-------------------------------------------
    %title(['Average Graph Kannur']) 
    title([date ' ' titl]) 
    %xlabel(['Day of the year 2019'],'fontsize',12,'fontweight','bold','fontname','times');
    xlabel(['Day of the year',' ', year],'fontsize',12,'fontweight','bold','fontname','times');
    ylabel('Magnetic field (nT)','fontsize',12,'fontweight','bold','fontname','times');  
    mff2= [date '_' titl '.png'];
    saveas(gcf,mff2);
   
    k=k+1;
end
disp('END');