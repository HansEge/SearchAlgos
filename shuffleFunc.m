function shuffle = shuffleFunc(x,num)
    for i = 1:num
        indexA = randi(length(x),1,1);
        indexB = randi(length(x),1,1);
        
        x = swap(x,indexA,indexB);
    end
        shuffle = x;
end