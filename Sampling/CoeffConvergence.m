% The script demonstrates how to estimate the ak parameters for a square wave
% using the Discrete Fourier Series, when we only have access to a sampled
% periodic signal f[n]
close all
clear all
clc

k = 4; % Select coefficient ak
Nmax = 64; % Maximum number of samples during one period of the signal
ak = []; % Empty vector to store different estimates

for N = 4:4:Nmax % For-loop to increase number of samples N
    f = [ones(1,N/4) zeros(1,N/2) ones(1,N/4)]; % Create sampled square wave over one period 0 to 2*pi  
    akN = 0; % Reset parameter
    for n = 0:N-1 % For-loop to estimate ak parameter
        % Formula taken from formula collection p.12 in chapter 1.6.2
        % (ck is the same as ak in the book)
        akN = akN + f(n+1)*exp(-j*((2*pi)/N)*k*n); % Iterative sum to estimate ak
    end
    ak(end+1) = akN/N; % Save estimate (not the most efficient way)
end

plot(4:4:Nmax, (sin((pi*k)/2)/(pi*k))*ones(1,length(2:4:Nmax)), 'r') % Plot theoretical value
hold on; % Keep previous plot
plot(4:4:Nmax, ak); % Plot estimates with different N values
hold off
xlabel('N');
