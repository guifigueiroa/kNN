function class = kNN(X,Y,newX, k)
    distances = [zeros(size(X,1),1) Y];
    for i = 1:size(X,1) 
        %distances(i) = euclidean_distance(X(i,:),newX);
        distances(i) = 1-cosine_similarity(X(i,:),newX);
    end
    
    distances = sortrows(distances);
   
    selectedClasses = distances(1:k,2:size(distances,2));
    
    class = mode(selectedClasses);
end