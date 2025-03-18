%Skriptet visar hur man estimerar ak parametrarna f?r en fyrkantsv?g
%med den Diskreta Fourier Serien, d? vi bara har tillg?ng till en samplad
%periodisk signal f[n]
close all
clear all
clc

k=2; %v?lj koefficient ak
Nmax=200; %Maximal antal sampel under signalens ena period
ak=[]; %tom vektor f?r att spara olika estimat med 

for N=1:1:Nmax %for-loop f?r att ?ka antal sampel N
    t = linspace(0, pi, N);
    f = sin(t);
    L = length(f)
    akN=0;%nollst?ll parametern
    for n=0:L-1
        akN=akN+f(n+1)*exp(-j*((2*pi)/N)*k*n);
    end
    ak(end+1)=akN/N;%spara estimatet (inte den mest effektivaste s?ttet)
end

theoretical_value = (2 / (pi * (1 - 4 * k^2)))*ones(1,length(1:1:Nmax))

plot(1:1:Nmax, theoretical_value, 'r');
hold on;
plot(1:1:Nmax, real(ak), 'b');
hold off;
xlabel('N');
ylabel('Estimated value');
title('Convergence of the discrete Fourier series for a triangular signal');
legend('Theoretical value', 'Estimate');