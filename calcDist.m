function calcDist = calcDist(x) 
    %Calculate distance between all points
    evalPoints = x;
    sum = 0;
    offset = 0;
    calcDist = 0;
    
    columnSize = size(x);
    columnSize = columnSize(2);
    
    for k = 1:columnSize
        rowEvalPoints = evalPoints(k+offset:k+1+offset,:);
        
        for i = 1:length(rowEvalPoints)-1
            evalPointsNew = [rowEvalPoints(:,i)  rowEvalPoints(:,i+1)];
            d = pdist(evalPointsNew,'euclidean');
            sum = sum+d;
        end
        calcDist(k) = sum;
        sum = 0;
    end
end