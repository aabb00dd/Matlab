close all
clear
clc

b=ones(1,11)/11; %bk koefficienter f?r LTI FIR system. I detta exemlep ?r det one sample difference.

N=512;%Antal sampel, v?lj j?mn nummer
omega=-pi:(2*pi/512):pi;%skapa vektor med samplad frekvensaxeln mellan -pi och pi med N antal sampel
H=freqz(b,1,omega);%r?knar fram frekvenssvaret H f?r FIR filtret (komplex)
absH=abs(H);%Magnituden f?r FIR filtret
argH=angle(H);%Fasen f?r FIR filtret i radianer

%Plotta Magnituden
subplot(2,1,1)
plot(omega,absH)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

%Plotta Fasen
subplot(2,1,2)
plot(omega,argH)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

%Testsignal
n=0:N-1;%index vektorn
A=2; %Amplitud
l=258;%sampelposition
w=omega(l);%v?lj frekvensen f?r testsignalen ur den samplad omega vektorn (f?r N=512, b?rjar positiva omega fr?n sampel 257)
fas=0; %Fas angiven i grader
s=A*cos(w*n+fas*(pi/180)); %signal med en frekvenskomponent

y=conv(s,b,'full');%faltnin av signalen med systemet
figure
plot(n,y(1:end-length(b)+1))
hold on

%Framr?knad med ekv. 6.6 i kursboken kap.6-2
y2=absH(l)*A*cos(w*n+fas*(pi/180)+argH(l));
plot(n,y2,'--k')
hold off
xlabel('Time [s]')
ylabel('Amplitude')
legend('Convolved','Calculated')
