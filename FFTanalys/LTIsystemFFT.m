clear all
close all
clc

b=[1 -1]; %bk koefficienter för LTI FIR system. I detta exemlep är det one sample difference
N=512;%Antal punkter i DFT
dw=2*pi/N;%delta omega, frekvens upplösning
kv=-N/2:N/2;%koefficienter k i den fulla DFT

%Systemets frekvenssvar genom Npt-DFT 
H=fft(b,N);%Fast Fourier Transform
absH=abs(H);%Absolut beloppet
argH=angle(H);%Fasen för FIR filtret i radianer alternativt atan2(imag(H),real(H)), eller atan2d(imag(H),real(H)) för att få svar i grader

%Systemets Magnituden 
absH2=[absH(N/2+1:end) absH(1:N/2+1)];%Negativa delen i en DFT ligger i andra halvan av vktorn så måste byta plats (se figure 8-5 i kursboken)
figure
plot(kv*dw,absH2)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

%Systemets Fas
argH2=[argH(N/2+1:end) argH(1:N/2+1)];%Negativa delen i en DFT ligger i andra halvan av vktorn så måste byta plats (se figure 8-5 i kursboken)
figure
plot(kv*dw,argH2)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

%Testsignalen
n=0:N-1;
A=2; %Amplitud
k=45;%ger systemets absH(k+1)=1.0018 och argH(k+1)=1.0462 rad (kompensering för MATLABs vektor index börjar på 1)
fas=0; %Fas angiven i grader
s=A*sin((2*pi/N)*k*n+fas*(pi/180)); %ren signal

y=conv(s,b,'same');%faltnin av signalen med systemet
figure
plot(n(1:end-1),y(1:end-1))%y(1:end-1) kan behövas skjusteras om fördröjd i förhållandet till s2(2:end) 
hold on

%refferenssignal
s2=absH(k+1)*A*sin((2*pi/N)*k*n+fas*(pi/180)+argH(k+1));
plot(n(1:end-1),s2(2:end),'--k')%s2(2:end) kan behövas skjusteras om fördröjd i förhållandet till y(1:end-1)
hold off
 

