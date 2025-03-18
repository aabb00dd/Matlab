clear all;
close all;
clc
load signal.mat


N=fs*2; %Antal sampel i signalen (obs! skriptet �r skriven bara f�r N med j�mna heltal)
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
%ber�kna spektrum
tic;%starta tidstagarur
S=abs(fft(s,N1)); %Obs, vi letar efter frekvensen, d�rav magnituden av spektrat fullt duglig. FFT utf�rs p� hela signalen som �r N sampel l�ng.
elapsedTime=toc;%Stoppa tidstagarur och visa tiden i sekunder i Workspace samt spara i parameter elapsedTime.
S=S(1:N1/2+1)/N1; %Reell data ger symetrisk spektrum, r�cker halvan. Division med N f�r att f� r�tt amplitud

%plotta med koefficientr k p� x-axeln
figure
stem(0:N1/2,S)
xlabel('Koefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%plotta med radianer p� x-axeln
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

s=s1+s2+s3; %signal s inneh�ller nu 3st frekvens komponenter med varsin amplitud, frekvens och fas.
figure
plot(n,s);
xlabel('Sampel')
ylabel('Amplitude')
title('Signal with multiple components')

%ber�kna spektrum
S=abs(fft(signal,N1)); %Obs, vi letar efter frekvensen, d�rav magnituden av spektrat fullt duglig
S=S(1:N1/2+1)/N1; %Reell data ger symetrisk spektrum, r�cker halvan. Division med N f�r att f� r�tt amplitud

%plotta med koefficientr k p� x-axeln
figure
stem((0:N1/2),S)
xlabel('Koefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%plotta med radianer p� x-axeln
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')

