close all
clear
clc

N = 16; % Number of coefficients to plot
T0 = 4; % Period of the periodic signal

ak = zeros(1,N);
for l = 1:1:(N+1)/2
    k = 2*l - 1;
    ak(k) = -2 / ((k^2) * pi^2); % Formula for ak from Example C.20 in the book
end
ak = [0.5 ak]; % Add a0

% Plot coefficients with sign preserved
stem(0:N,ak)
xlabel('Coeff k');
ylabel('Amplitude');

% Plot absolute values of coefficients
figure
stem(0:N,abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

% Plot absolute values with k converted to frequency
figure
stem((0:N)*(1/T0),abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');
