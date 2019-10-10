function shuffle = shuffleFunc(x,num)
    for i = 1:num
        
        columnSize = size(x);
        columnSize = columnSize(2);
        
        indexA = randi(columnSize,1,1);
        indexB = randi(columnSize,1,1);
        
        x = swap(x,indexA,indexB);
    end
        shuffle = x;
end