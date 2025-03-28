close all
clear
clc

b = [2 -(pi - 1) 2]; % bk coefficients for LTI FIR system

N = 512; % Number of samples, choose even number
omega = linspace(-pi, pi, N); % Create vector with sampled frequency axis between -pi and pi with N samples
H = freqz(b, 1, omega); % Calculate frequency response H for FIR filter (complex)
absH = abs(H); % Magnitude of FIR filter
argH = angle(H); % Phase of FIR filter in radians

% Plot Magnitude
subplot(2,1,1)
plot(omega, absH)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

% Plot Phase
subplot(2,1,2)
plot(omega, argH)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

% Test signal
n = 0:N-1; % Index vector
A1 = 2; % Amplitude for component 1
A2 = 2; % Amplitude for component 2
l1 = 300; % Sample position component 1
l2 = 300; % Sample position component 2
w1 = 0.66; % Select test signal frequency from sampled omega vector (for N=512, positive omega starts from sample 257)
w2 = 1; % Frequency component 2, coincides with a zero
phase1 = 0; % Phase for component 1 in degrees
phase2 = 0; % Phase for component 2 in degrees
s1 = A1*cos(w1*n + phase1*(pi/180)); % Component 1
s2 = A2*cos(w2*n + phase2*(pi/180)); % Component 2
s = s1 + s2;
y = filter(b, 1, s);

y = conv(s, b, 'full'); % Convolution of signal with system
figure
plot(n, y(1:end-length(b)+1))
hold on

% Pre-calculated using eq. 6.6 in course book chapter 6-2
y2 = absH(l1)*A1*cos(w1*n + phase1*(pi/180) + argH(l1));
y3 = absH(l2)*A2*cos(w2*n + phase2*(pi/180) + argH(l2));
y_total = y2 + y3;
plot(n, y_total, '--k')
hold off
xlabel('Time [s]')
ylabel('Amplitude')
legend('Convolved', 'Calculated')
