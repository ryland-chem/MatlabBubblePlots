%imports the data here
rawData = readtable('C:\MatlabBubblePlots\data_for_bubbleplots.csv');

%Displays the data here
%disp(rawData)

%pulls data from the table, columns, splitting it up
%sample = rawData{:,1};
%response = rawData{:,2};

%convert to table
arrayData = table2array(rawData);
%disp(arrayData);

%find the number of rows and columns
%really only need rows
[numRows,numCols] = size(arrayData);

%column 1 only
columnOne = arrayData(:,1);
columnTwo = arrayData(:,2);

%need to convert index, column 1, into 
%integers (int64) from double
%using for loop and populating an
%empty matrix
newColOne = [];

for i = 1:numRows
    int = strcat("x", num2str(columnOne(i)));
    newColOne = [newColOne, int];
end

%transpose
newColOneVert = newColOne';

newTable = table(newColOneVert, columnTwo);

disp(newTable);

dataUnstacked = unstack(newTable, 'columnTwo', 'newColOneVert');

unique(newColOneVert);


