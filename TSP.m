close all;
clear;


popCount = 10;
N = 9; %Number of cities
fitness = 0;
recordDistance = inf();


%Create random cities(points)
for i = 1:N
    x(i,1) = randi(10,1,1);
    y(i,1) = randi(10,1,1);
end
x = x';
y = y';

%Calculate initial distance between all points 
evalPoints = [x; y];
%recordedDistance = calcDist(evalPoints);



%Make population
population = evalPoints;
for i = 1:popCount-1
    population = [population; evalPoints];
end
population = shuffleFunc(population,100);




% bestEverPop = population((bestEverIndex*2)-1:bestEverIndex*2,:);
% 
% %normalize fitness
% sum = 0;
% for i = 1:length(fitness)
%     sum = sum + fitness(i);
% end
% for i = 1:length(fitness)
%     fitness(i) = fitness(i)/sum;
% end

%Make next generation

%Pick two best of population
parents = pickTopTwo(fitness,population);

% crossoverPointA = round(N*(1/3));
% crossoverPointB = round(N*(2/3));

% crossoverA = crossoverFunc(fitness);
% crossoverB = crossoverFunc(fitness);


% 
% 
% %Sweet lovin'
% tempParentA = parents(1:2,1:crossoverPointA-1);
% nextGen = tempParentA;
% tempParentB = parents(3:4,crossoverPointA:crossoverPointB-1);
% nextGen = [nextGen tempParentB];
% tempParentA = parents(1:2,crossoverPointB:end);
% nextGen = [nextGen tempParentA];
% 
% chanceOfMut = randi(100,1,1);
% 
% if(chanceOfMut < 100)
%     nextGen = swap(nextGen,randi(length(nextGen),1,1),randi(length(nextGen),1,1));
% end
% 
% population = nextGen;
% 
% %Mutate
% for i = 1:popCount-1
%     chanceOfMut = randi(100,1,1);
% 
%     if(chanceOfMut < 100)
%         nextGen = swap(nextGen,randi(length(nextGen),1,1),randi(length(nextGen),1,1));
%     end
%     population = [population; nextGen];
% end
% 
% 


%Test of genetic algorithm
numberOfGenerations = 0;
for g = 1:1000
    
    %Calculate fitness
    for i = 1:length(population)
        d = calcDist(population);

        if(i < N)
            fitness(i) = 1/d(i);
        end
        if(min(d) < recordDistance)
            recordDistance = min(d)
            bestEverIndex = find(d == min(d));
            bestEverPop = population((bestEverIndex*2)-1:bestEverIndex*2,:);
            
            clf;
            plot(bestEverPop(1,:),bestEverPop(2,:),'-x k');
            axis([0 11 0 11]);
            hold on
            numberOfGenerations
        end
    end
    


    %normalize fitness
    sum = 0;
    for i = 1:length(fitness)
        sum = sum + fitness(i);
    end
    for i = 1:length(fitness)
        fitness(i) = fitness(i)/sum;
    end

    parents = pickTopTwo(fitness,population);

    %Sweet lovin'
    nextGen = shuffleFunc(parents,10);
    

    chanceOfMut = randi(100,1,1);

    if(chanceOfMut < 1)
        nextGen = swap(nextGen,randi(length(nextGen),1,1),randi(length(nextGen),1,1));
    end

    population = nextGen;

    %Mutate
    for i = 1:popCount-1
        chanceOfMut = randi(100,1,1);

        if(chanceOfMut < 1)
            nextGen = swap(nextGen,randi(length(nextGen),1,1),randi(length(nextGen),1,1));
        end
        population = [population; nextGen];
    end
    pause(0.001);
    numberOfGenerations = numberOfGenerations +1;
end


