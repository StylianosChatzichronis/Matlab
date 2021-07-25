filename = "C:\Users\MnM\Dropbox\PatternRecognition\UCIdata-exercise1\pima-indians-diabetes.data";

whole_set = trainSet(filename);
% Counting the size of the data in the form of [rows columns]
data_size = size(whole_set);
% Size of data set will be the number of rows in file
n = data_size(1);
% Number of features will be the number of columns in file except last
% column, which is the class
features = data_size(2) - 1;

% Our folds
folds = 10;
remainder = 0;
remainder_counter = 0;

% If the data set size cannot be divided by folds, reserve the remainder to
% share it between the test sets
if mod(n, folds) ~= 0
    remainder_counter = mod(n, folds);
    remainder = 1;
end

% The approximate test set size in each fold
folding_size = (n - remainder_counter)/folds;
complete_accuracies = [];
for no_of_neighbours = 1 : 2 : 50
    
    remainder = 0;
    remainder_counter = 0;

    % If the data set size cannot be divided by folds, reserve the remainder to
    % share it between the test sets
    if mod(n, folds) ~= 0
        remainder_counter = mod(n, folds);
        remainder = 1;
    end

    % The approximate test set size in each fold
    test_start = 1;
    distance_array = cell(folding_size,2);
    correct = 0;
    while (test_start < n)

        % Separating our test and training sets, according to the k-fold rule
        test_set = whole_set(test_start:test_start+(folding_size + remainder) - 1,:);
        % Training set includes everything except the test set
        training_set = whole_set([1:test_start-1, (test_start + folding_size + remainder):n],:);
        
        for test = 1 : numel(test_set(:, 1))
            for trainer = 1 : numel(training_set(:,1))
                ed = 0;
                for feature = 1 : features
                    trainer_param = training_set{trainer,feature};
                    test_param = test_set{test,feature};
                    ed = ed + (trainer_param - test_param)^2;
                end
                ed = sqrt(ed);              
                distance_array(trainer,:) = {ed, training_set{trainer,feature+1}};
            end
            
            % Sorting the distance_array by eclidean distance
            sorted_distances = sortrows(distance_array, 1);
            
            % Finding the most frequent category among the kNNs
            nearest_neighbours = sorted_distances(1:no_of_neighbours, 2);
            % If classes are strings, find the most frequent one
            try
                [unique_strings, ~, string_map]= unique(nearest_neighbours);
                major_neighbour = unique_strings(mode(string_map));       
            % Else, if they are numbers, convert them to strings first
            catch
                nearest_neighbours = cellfun(@num2str, nearest_neighbours);
                [unique_strings, ~, string_map]= unique(nearest_neighbours);
                major_neighbour = unique_strings(mode(string_map));
            end
              
            
            if (isnumeric(test_set{test,features+1}))
                if (strcmp(major_neighbour, num2str(test_set{test,features+1})))
                    correct = correct + 1;
                end
            else
                if (strcmp(major_neighbour, test_set{test,features+1}))
                    correct = correct + 1;
                end
            end             
        end  
        
        test_start = test_start + (folding_size + remainder);

        % If remainder was found between the data set and the folds, substract
        % 1 until it's completely shared
        remainder_counter = remainder_counter -1;
        if remainder_counter == 1
            remainder = 0;
        end    
    end
    test_size = numel(test_set(:,1));
    accuracy = correct/(test_size*folds);  
    complete_accuracies(end+1) = accuracy; %#ok<SAGROW>   
end