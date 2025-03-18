clear all;
close all;
clc

N=2000; %Antal sampel i signalen (obs! skriptet ?r skriven bara f?r N med j?mna heltal)
n=0:N-1; %vektor med index

%Genererar samplad sinusoid signal s[n]
A=3; %Amplitud
f=500; %Frekvens i Hz
fs=1000; %Samplingsfrekvens i Hz
fas=0; %Fas angiven i grader
s=A*cos(2*pi*(f/fs)*n+fas*(pi/180)); %ren sinusoidal signal s[n] med normaliserad frekvens, se ekv. 4.2&4.3 i boken  

Ts=1/fs;%samplingstid
Tf=1/f;%periodtid f?r s[n]
tn=0:Ts:5*Tf;%tidsvektorn med relevanta l?ngden f?r plottning i f?rsta plotten med 5 perioder

%generering av ?versamplad s[n] f?r att efterlikna "tidskontinuerlig" referens signal r(t) 
Tr=1/(40*fs);%Samplingstid f?r refferens signalen (man v?ljer n?tt som uppfyller samplingsteoremet, i detta fall 40x snabbare ?n vald samplingsfrekvens)
t=0:Tr:5*Tf;%skapar tidsvektorn f?r 5st perioder av signalen
r=A*cos(2*pi*f*t+fas*(pi/180)); %referens signal med ej vikt frekvens

%Testa f?r vikning
if(2*pi*(f/fs)<pi)%ej vikning
    rec=r;
elseif (2*pi*(f/fs)==pi)%vikt i vikningspunkten (specialfall)
    Amp=A*cos(fas*(pi/180));
    rec=Amp*cos(2*pi*f*t);
else %vikning
    l=round((2*pi*(f/fs))/(2*pi));%ber?kna hur m?nga multiplar av 2*pi ska bort
    omega=(2*pi*(f/fs)-2*pi*l)*fs;%ber?kna den vikta frekvensen i radianer
    rec=A*cos(omega*t+fas*(pi/180));%generera den idealt rekonstruerad signal med den vikta frekvensen rec(t)
end

%plottar s[n], r(t) och rec(t) i samma plott
figure
stem(tn,s(1:length(tn)));%plotta sampel f?r den samplad signal s[n]
hold on
plot(t,r,'r')%plotta referens signalen r(t)
plot(t,rec,'--k')%plotta den rekonstruerad signal rec(t)
hold off
xlabel('Time [s]')
ylabel('Amplitude')
title('Pure sine signal')
legend('Sampels s[n]','Reference r(t)','Reconstructed rec(t)')

%Ber?knar spektrum med FFT. OBS! I detta labb bara f?r att se frekvensinneh?llet
%i s[n]. Mer om FFT n?r vi behandlar kapitel 8.
S=abs(fft(s)); %OBS, vi letar efter frekvensen, d?rav magnituden av spektrat fullt duglig. FFT utf?rs p? hela signalen som ?r N sampel l?ng.
S=S(1:N/2+1)/N; %Reell data ger symetrisk spektrum, d?rf?r r?cker halva. Division med N f?r att f? r?tt amplitud samt +1 f?r att f? punkten i pi,fs/2. 

%plotta med normaliserad f p? x-axeln samt plot ger kontinuerlig kurvan
figure
plot(n(1:N/2+1)/N,S)
xlabel('Normalized frequency f/fs')
ylabel('Magnitude')
title('Spectrum of the sampled signal s[n]')

%plotta med f i Hz p? x-axeln samt stem ger plott med enbart de speifika v?rden i vektorn 
figure
stem(n(1:N/2+1)*(fs/(N)),S)
xlabel('Frequency [Hz]')
ylabel('Magnitude')
title('Spectrum of the sampled signal s[n]')