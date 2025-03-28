% The script demonstrates how to plot the coefficients ak from
% Fourier Series Analysis using stem().
% In this case, the coefficients apply to a square wave.
% NOTE! Only the origin and the right side of the spectrum are calculated and plotted.
close all
clear
clc

N=16; % Number of coefficients to plot
T0=4; % Period of the periodic signal

ak=zeros(1,N);
for k=1:N
    ak(k)=2 / (pi * (1 - 4 * k^2)); % Formula for ak from Example 3.34 in the book
end
ak=[2/pi ak]; % Add a0

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
