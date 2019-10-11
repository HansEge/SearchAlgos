close all;
clear;


popCount = 10;
N = 10; %Number of cities
fitness = 0;



%Create random cities(points)
for i = 1:N
    x(i,1) = randi(10,1,1);
    y(i,1) = randi(10,1,1);
end
x = x';
y = y';

%Calculate initial distance between all points 
evalPoints = [x; y];
recordedDistance = calcDist(evalPoints);


population = evalPoints;

%Make population
for i = 1:popCount
    [population; shuffleFunc(evalPoints,10)];
end
%population = shuffleFunc(population,100);

%Calculate distance and make it the fitness value
for i = 1:length(population)
    d = calcDist(population);
    if (d < recordedDistance)
        recordedDistance = d;
        bestEver = population(:,i);
    end
    fitness = d;
end

% 
% 
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
% 
% 
% 
