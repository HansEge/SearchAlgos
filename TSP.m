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

%Make population
for i = 1:popCount
    population(:,i) = evalPoints(:,i);
end
population = shuffleFunc(population,100);

%Calculate distance and make it the fitness value
for i = 1:length(population)
    d = calcDist(population);
    if (d < recordedDistanced)
        recordedDistance = d;
        bestEver = population(:,i);
    end
    fitness = d;
end








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
% %Randomly check which candidate solution is the best
% for i = 1:100
%     
%     num1 = randi(length(x),1,1);
%     num2 = randi(length(x),1,1);
%     
%     evalPoints = swap(evalPoints,num1,num2);
%     d = calcDist(evalPoints);
%     %Plot points only if better d is found
%     if(d < recordedDistance)
%         clf;
%         recordedDistance = d;
%         for k = 1:length(N)
%             for l = 1:2
%                 plot(evalPoints(1,:),evalPoints(2,:),'-x k');
%                 hold on
%             end
%         end
%     axis([0 11 0 11]);
%     end
%     pause(0.01);
% end
% 
% 
% 
