close all
clear
clc

N=16; %Val av antal Koefficienter vi vill plotta
T0=4; %periodtiden f?r den periodiska signalen

ak=zeros(1,N);
for l=1:1:(N+1)/2
    k = 2*l - 1;
    ak(k)= -2 / ((k^2) * pi^2); %formeln f?r ak tagen fr?n Exempel C.20 i boken
end
ak=[0.5 ak]; %l?gg till a0

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