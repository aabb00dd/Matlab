close all
clear
clc

b=[2 -(pi - 1) 2]; %bk koefficienter för LTI FIR system

N=512;%Antal sampel, välj jämn nummer
omega=linspace(-pi,pi,N);%skapa vektor med samplad frekvensaxeln mellan -pi och pi med N antal sampel
H=freqz(b,1,omega);%räknar fram frekvenssvaret H för FIR filtret (komplex)
absH=abs(H);%Magnituden för FIR filtret
argH=angle(H);%Fasen för FIR filtret i radianer

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
A1=2; %Amplitud för komponenr 1
A2=2; %Amplitud för komponent 2
l1=300;%sampelposition komponent 1
l2=300;%sampelposition komponent 2
w1=0.66;%välj frekvensen för testsignalen ur den samplad omega vektorn (för N=512, börjar positiva omega från sampel 257)
w2=1;%frekvcens komponent 2, sammanfaller med ett nollställe
fas1=0; %Fas för komponent 1 i grader
fas2=0; %Fas för komponent 2 i grader
s1=A1*cos(w1*n+fas1*(pi/180)); %Komponent 1
s2=A2*cos(w2*n+fas2*(pi/180)); %Komponent 2
s=s1+s2;
y=filter(b,1,s);

y=conv(s,b,'full');%faltnin av signalen med systemet
figure
plot(n,y(1:end-length(b)+1))
hold on

%Framräknad med ekv. 6.6 i kursboken kap.6-2
y2=absH(l1)*A1*cos(w1*n+fas1*(pi/180)+argH(l1));
y3=absH(l2)*A2*cos(w2*n+fas2*(pi/180)+argH(l2));
y_total=y2+y3;
plot(n,y_total,'--k')
hold off
xlabel('Time [s]')
ylabel('Amplitude')
legend('Convolved','Calculated')
