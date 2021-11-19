function data = fun_secfileimport(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   DEC2019KANNUR = IMPORTFILE(FILENAME) Reads data from text file FILENAME
%   for the default selection.
%
%   DEC2019KANNUR = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from
%   rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   Dec2019Kannur = importfile('23-Dec-2019_Kannur.txt', 1, 86356);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2020/05/19 00:09:01

%% Initialize variables.
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%3f%15f%16f%16f%16f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
data = [dataArray{1:end-1}];
