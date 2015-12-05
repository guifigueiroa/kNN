%load iris.data

%X = sparse(iris(:,1:4));
%Y = iris(:,5:5);

% Load tf-idf sparse table
X = load('tfidfSparse15-1000.txt');
X = spconvert(X);

% Load classes
Y = load('classes15-1000.txt');

disp('Aplicando holdout');
[ training_data, training_classes, testing_data, testing_classes ] = holdout( X,Y );

conf_matrix = zeros(20,20);
accuracy = zeros(size(testing_data,1),1);

disp('Classificando dados');
for i=1:size(testing_data,1)
    i
    class = kNN(training_data,training_classes,testing_data(i,:), 40)
    
    accuracy(i) = class == testing_classes(i);
    conf_matrix(testing_classes(i),class) = conf_matrix(testing_classes(i),class)+1;
    
    sum(accuracy(1:i))/i
end

perc_accuracy = sum(accuracy)/length(testing_data)