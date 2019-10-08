function calcDist = calcDist(x) 
    %Calculate distance between all points
    evalPoints = x;
    offset = 0;
    sum = 0;
    for i = 1:length(evalPoints)-1
        evalPointsNew = [evalPoints(i+offset:i+1+offset)'  evalPoints(i+2+offset:i+3+offset)'];
        d = pdist(evalPointsNew,'euclidean');
        sum = sum+d;
        offset = offset+1;
    end
    calcDist = sum;
end