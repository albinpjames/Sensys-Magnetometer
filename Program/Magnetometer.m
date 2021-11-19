clc;
clear all;
addpath(genpath('lib'));
disp('1: Convert any character to point in csv file');
disp('2: Convert raw data to daily seconds');
disp('3: Convert sec data to Delta H Corrected');
disp('4: Convert to one min average file');
disp('5: Graphing');

num1=input('Choose the function >');
switch num1
    case 1
    %Convert to point
    char2point();
    
    case 2
    %Convert Data 
    disp('1: Create daily file');
    disp('2: Create a single file'); 
    num2=input('Choose the function >');
        switch num2
            case 1
            %Output Daily file
            raw2dailyfil()
            case 2
            %Output single file
            raw2singlefil()
        end
        

    case 3
    %Delta_H
    disp('1: Create daily file');
    disp('2: Create a single file');   
    num3=input('Choose the function >');
        switch num3
            case 1
            %Output Daily file
            delH_dailyfil()
            case 2
            %Output single file
            delH_singlefil()
        end
    
    case 4
    %One min average file
    disp('1: Create daily file');
    disp('2: Create a single file using daily file');  
    num4=input('Choose the function >');
        switch num4
        case 1
            %Output Daily file
            OneMinAvg_dailyfil()
        case 2
            %Output single file
            OneMinAvg_singlefil()
        end
    
    case 5
    %Graphing
    disp('1: Create daily file');
    disp('2: Create a single file');  
    num5=input('Choose the function >');
        switch num5
        case 1
            %Output daily graph
            graphing_dailyfil()
        case 2
            %Output single graph
            graphing_singlefil()
        end
end



