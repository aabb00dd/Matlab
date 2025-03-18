%Skriptet demostrerar hur man plottar koefficienterna ak fr?n
%Fourier Serier Analysen med hj?lp av stem().
%I detta fall g?ller koefficienterna f?r en fyrkantsv?g
%OBS! Bara origo och den h?gra sidan av spektrummet ber?knas och plottas.
close all
clear
clc

N=16; %Val av antal Koefficienter vi vill plotta
T0=4; %periodtiden f?r den periodiska signalen

ak=zeros(1,N);
for k=1:N
    ak(k)=2 / (pi * (1 - 4 * k^2)); %formeln f?r ak tagen fr?n Exempel 3.34 i boken
end
ak=[2/pi ak]; %l?gg till a0

%H?r plottas koefficienterna med tecknet bevarad
stem(0:N,ak)
xlabel('Coeff k');
ylabel('Amplitude');

%H?r plottas absolutbellopet f?r koefficienterna
figure
stem(0:N,abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

%H?r plottas absolutbellopet, samt omr?knad k ordningen till frekvens
figure
stem((0:N)*(1/T0),abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');

