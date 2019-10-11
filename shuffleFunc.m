function shuffle = shuffleFunc(x,num)
    
    columnSize = size(x);
    columnSize = columnSize(2);
    offset = 0;
    
    for k = 1:columnSize
        for i = 1:num
            rowEvalPoints = x(k+offset:k+1+offset,:);

            indexA = randi(columnSize,1,1);
            indexB = randi(columnSize,1,1);

            x(k+offset:k+1+offset,:) = swap(rowEvalPoints,indexA,indexB);
        end
            offset = offset+1;
    end
    shuffle = x;
end