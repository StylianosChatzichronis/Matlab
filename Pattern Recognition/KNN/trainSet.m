function whole_set = trainSet( filename )
%TRAINSET Reads data from the filename that will be used to train the
%classifier

% If file contains strings, leave them as be
% Else, convert everything from strings to numbers
try 
    [data, delimeter] = importdata(filename, ",");
    whole_set = split(data, delimeter);
    % Converting numbers of file to double (they were read as strings)
    % and leaving strings as they are
    whole_set = cellfun(@checkForNumber, whole_set, 'un',0);
catch
    whole_set = importdata(filename, ",");
    whole_set = num2cell(whole_set);
end

% Randomizing the file rows
whole_set = whole_set(randperm(size(whole_set,1)),:);

end