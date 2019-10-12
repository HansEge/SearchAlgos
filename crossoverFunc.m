function crossover = crossoverFunc(x)

    fitness = x;
    index = 1;

    r = 1.*rand(1,1);

    while(r > 0)
        r = r - fitness(index);
        index = index + 1;
    end

    index = index - 1;
    crossover = fitness(index);
end