%Brendan Li, 1/9/2021
%Using Linear regression to extract the SpO2 levels from PPG
clear all; clc; close all;

%read the data from the dataset file
[X]=textread('test26.txt');
Rgraph=X(:,1);
Igraph=X(:,2);
figure(1)
plot(Rgraph, 'color','r'); hold on; plot(Igraph, 'color', 'b');
title('IR and R data');
legend('RED','IR');


%% WHILE LOOP calculates R value for each set of samples



idx=1; %index for determining set of data
fs=300; %SAMPLING RATE (CHANGE DEPENDING ON DATASET)
n=1; %index for adding R values to array

%While index is less than the data bounds
while idx < length(X)
    RE=X(idx:idx+fs,1);   % CONSIDER RED LED X
    IR=X(idx:idx+fs,2);    % CONSIDER IR LED Y

    %find regression slope (b)
        slope=polyfit(RE,IR,1); %(gives same slope as linear regression)
        b=slope(1);
    %find R
        MulN=mean(RE)/mean(IR);
        R(n)=b*MulN;
    %increment counters
        idx=idx+fs;
        n=n+1;
    %if the idx+fs would end the while loop, only take the remaining data
    %for next R calculation
    if idx+fs>length(X)
        fs=length(X)-idx;
    end
end
%% DISPLAY/PLOT
%display R values found
R;
%calculate SpO2 and display
%SpO2=104-17*R
SpO2=104-17*R;
SpO2'


Smean = mean(SpO2);
Rmean = mean(R);
SampleN=length(X);

%STANDARD DEVIATION AND RANGE
SD=std(SpO2)
Range=range(SpO2)
NumbValues=length(SpO2)

%plot both the R values and SpO2
% figure(2)
%     plot(SpO2)
%     title('SpO2')
% figure(3)
%     plot(R)
%     title('R Values')