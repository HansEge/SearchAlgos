close all;
clear;


popCount = 10;
N = 10; %Number of cities
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


%Calculate fitness
for i = 1:length(population)
    d = calcDist(population);
    
    if(i < 11)
        fitness(i) = 1/d(i);
    end
    if(min(d) < recordDistance)
        recordDistance = min(d);
        bestEverIndex = find(d == min(d));
        
        bestEverPop = population((bestEverIndex*2)-1:bestEverIndex*2,:);
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

%Make next generation
for i = 1:length(population)
    
    index = 1;
    r = 1.*rand(1,1);
    
    while(r > 0)
        r = r - fitness(index);
        index = index + 1;
    end
    index = index - 1;
    crossoverA = fitness(index);
    crossoverB = fitness(index);
    
end




% 
% optimizedNumTimes = 0;
% %Randomly check which candidate solution is the best
% for i = 1:10000
%     
%     evalPoints = shuffleFunc(evalPoints,100);
%     d = calcDist(evalPoints);
%     %Plot points only if better d is found
%     if(d < recordedDistance)
%         clf;
%         recordedDistance = d
%         for k = 1:length(N)
%             for l = 1:2
%                 plot(evalPoints(1,:),evalPoints(2,:),'-x k');
%                 hold on
%             end
%         end
%     axis([0 11 0 11]);
%     bestEver = evalPoints
%     optimizedNumTimes = optimizedNumTimes+1;
%     end
%     pause(0.001);
% end





% 
% 
% figure
% %Plot points
% for k = 1:length(N)
%     for l = 1:2
%         plot(evalPoints(1,:),evalPoints(2,:),'-x');
%         hold on
%     end
% end
% axis([0 10 0 10]);
% 
% optimizedNumTimes = 0;
% %Randomly check which candidate solution is the best
% for i = 1:10000
%     
%     evalPoints = shuffleFunc(evalPoints,100);
%     d = calcDist(evalPoints);
%     %Plot points only if better d is found
%     if(d < recordedDistance)
%         clf;
%         recordedDistance = d
%         for k = 1:length(N)
%             for l = 1:2
%                 plot(evalPoints(1,:),evalPoints(2,:),'-x k');
%                 hold on
%             end
%         end
%     axis([0 11 0 11]);
%     bestEver = evalPoints
%     optimizedNumTimes = optimizedNumTimes+1;
%     end
%     pause(0.001);
% end



