% The script shows how to estimate the ak parameters for a square wave
% using the Discrete Fourier Series, when we only have access to a sampled
% periodic signal f[n]
close all
clear all
clc

k = 2; % select coefficient ak
Nmax = 200; % maximum number of samples during one period of the signal
ak = []; % empty vector to store different estimates

for N = 1:1:Nmax % for-loop to increase number of samples N
    t = linspace(0, pi, N);
    f = sin(t);
    L = length(f);
    akN = 0; % reset parameter
    for n = 0:L-1
        akN = akN + f(n+1)*exp(-j*((2*pi)/N)*k*n);
    end
    ak(end+1) = akN/N; % save estimate (not the most efficient way)
end

theoretical_value = (2 / (pi * (1 - 4 * k^2)))*ones(1,length(1:1:Nmax));

plot(1:1:Nmax, theoretical_value, 'r');
hold on;
plot(1:1:Nmax, real(ak), 'b');
hold off;
xlabel('N');
ylabel('Estimated value');
title('Convergence of the discrete Fourier series for a triangular signal');
legend('Theoretical value', 'Estimate');
