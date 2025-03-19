clear all
close all
clc

b=[0 1]; % bk coefficients for LTI FIR system. In this example, it is a one-sample difference
N=512; % Number of points in DFT
dw=2*pi/N; % delta omega, frequency resolution
kv=-N/2:N/2; % coefficients k in the full DFT

% System frequency response through N-point DFT
H=fft(b, N); % Fast Fourier Transform
absH=abs(H); % Absolute magnitude
argH=angle(H); % Phase of the FIR filter in radians, alternatively atan2(imag(H),real(H)), or atan2d(imag(H),real(H)) to get the answer in degrees

% System Magnitude
absH2=[absH(N/2+1:end) absH(1:N/2+1)]; % The negative part in a DFT lies in the second half of the vector, so we need to swap (see figure 8-5 in the course book)
figure
plot(kv*dw,absH2)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

% System Phase
argH2=[argH(N/2+1:end) argH(1:N/2+1)]; % The negative part in a DFT lies in the second half of the vector, so we need to swap (see figure 8-5 in the course book)
figure
plot(kv*dw,argH2)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

% Test signal
n=0:N-1;
A=2; % Amplitude
k=1; % gives the system's absH(k+1)=1.0018 and argH(k+1)=1.0462 rad (compensation for MATLAB's vector index starting at 1)
fas=0; % Phase given in degrees
s=A*cos(dw * k * n) + 1i * sin(dw * k * n); % signal with one frequency component

y=conv(s,b,'same'); % convolution of the signal with the system
figure
plot(n(1:end-1),y(1:end-1)) % y(1:end-1) may need adjustment if delayed relative to s2(2:end)
hold on

% Reference signal
s2=absH(k+1)*A*cos(dw*k*n+fas*(pi/180)+argH(k+1));
plot(n(1:end-1),s2(2:end),'--k') % s2(2:end) may need adjustment if delayed relative to y(1:end-1)
hold off
