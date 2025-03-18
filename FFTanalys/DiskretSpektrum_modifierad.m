clear all;
close all;
clc
load signal.mat


N=fs*2; %Antal sampel i signalen (obs! skriptet är skriven bara för N med jämna heltal)
n=0:10*N; %vektor med index

%signalen
A=2; %Amplitud
k=50; %Koefficient
fas=0; %Fas angiven i grader
s=A*cos((2*pi/N)*k*n+fas*(pi/180)); %ren signal
figure
plot(n,s);
xlabel('Sampel n')
ylabel('Amplitude')
title('Pure sine signal')

N1=N;
%beräkna spektrum
tic;%starta tidstagarur
S=abs(fft(s,N1)); %Obs, vi letar efter frekvensen, därav magnituden av spektrat fullt duglig. FFT utförs på hela signalen som är N sampel lång.
elapsedTime=toc;%Stoppa tidstagarur och visa tiden i sekunder i Workspace samt spara i parameter elapsedTime.
S=S(1:N1/2+1)/N1; %Reell data ger symetrisk spektrum, räcker halvan. Division med N för att få rätt amplitud

%plotta med koefficientr k på x-axeln
figure
stem(0:N1/2,S)
xlabel('Koefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%plotta med radianer på x-axeln
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%signal1
A1=5; %Amplitud
k1=50; %Koefficient
fas1=0; %Fas angiven i grader
s1=A1*cos((2*pi/N)*k1*n+fas1*(pi/180)); %ren signal
%signal2
A2=3; %Amplitud
k2=75; %Koefficient
fas2=45; %Fas angiven i grader
s2=A2*cos((2*pi/N)*k2*n+fas2*(pi/180)); %ren signal
%signal3
A3=2; %Amplitud
k3=200; %Koefficient
fas3=90; %Fas angiven i grader
s3=A3*cos((2*pi/N)*k3*n+fas3*(pi/180)); %ren signal

s=s1+s2+s3; %signal s innehåller nu 3st frekvens komponenter med varsin amplitud, frekvens och fas.
figure
plot(n,s);
xlabel('Sampel')
ylabel('Amplitude')
title('Signal with multiple components')

%beräkna spektrum
S=abs(fft(signal,N1)); %Obs, vi letar efter frekvensen, därav magnituden av spektrat fullt duglig
S=S(1:N1/2+1)/N1; %Reell data ger symetrisk spektrum, räcker halvan. Division med N för att få rätt amplitud

%plotta med koefficientr k på x-axeln
figure
stem((0:N1/2),S)
xlabel('Koefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%plotta med radianer på x-axeln
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')

