close all
clear all
clc

k = 1; % Choose coefficient ak
Nmax = 20; % Maximum number of samples within one period
ak=[]; %tom vektor f?r att spara olika estimat med 

%?ndrat alla 4:4:Nmax till 1 ist?llet, r?tt?

for L = 1:1:Nmax % For-loop to increase the number of samples N
    f = linspace(0, 1, L); % Create the sampled triangular wave over one period (0 to 2*pi)
    f = [f fliplr(f(1:end - 1))];
    N = length(f);
    akN = 0; % Reset parameter
    for n = 0:N-1 % For-loop to estimate ak parameter
        akN = akN + f(n+1)*exp(-1i*((2*pi)/N)*k*n); % Iterative sum to estimate ak
    end
    ak(end + 1) = akN/N; % Save the estimate
end

theoretical_value = (-2/((k^2)*pi^2)) * ones(1, length(1:1:Nmax));

plot(1:1:Nmax, theoretical_value, 'r');
hold on;
plot(1:1:Nmax, real(ak), 'b');
hold off;
xlabel('N');
ylabel('Estimated value');
title('Convergence of the discrete Fourier series for a triangular signal');
legend('Theoretical value', 'Estimate');

