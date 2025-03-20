% The script demonstrates how to plot the coefficients ak from
% Fourier Series Analysis using stem().
% In this case, the coefficients apply to a square wave.
% NOTE! Only the origin and the right side of the spectrum are calculated and plotted.
close all
clear
clc

N = 42; % Choice of the number of coefficients we want to plot
T0 = 4; % Period of the periodic signal

ak = zeros(1, N);
for l = 1:1:N/2
    k = 2*l;
    ak(k) = 1 / (pi * (1 - (k)^2)); % Formula for ak taken from Example C.26 in the book
end
ak = [(1/pi) ak]; % Add a0

% Here, the coefficients are plotted with the sign preserved
stem(0:N, ak)
xlabel('Coeff k');
ylabel('Amplitude');

% Here, the absolute value of the coefficients is plotted
figure
stem(0:N, abs(ak))
xlabel('Coeff k');
ylabel('Magnitude');

% Here, the absolute value is plotted, with the order k converted to frequency
figure
stem((0:N) * (1/T0), abs(ak))
xlabel('Freq. [Hz]');
ylabel('Magnitude');
