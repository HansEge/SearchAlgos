function pickTopTwo = pickTopTwo(fitness, population)
    
    bestFitIndex = find(fitness == max(fitness));
    
    pickTopTwo = fitness(bestFitIndex);
    fitness(bestFitIndex) = 0;
    
    nextBestFitIndex = find(fitness == max(fitness));
    
    pickTopTwoA = population((bestFitIndex*2)-1:bestFitIndex*2,:);
    pickTopTwoB = population((nextBestFitIndex*2)-1:nextBestFitIndex*2,:);
    
    pickTopTwo = [pickTopTwoA; pickTopTwoB];
end