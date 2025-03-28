close all
clear
clc

N = 42; % Number of coefficients in the synthesis
T0 = 4; % Period of the signal
t = 0:0.01:3*T0; % Time vector

w = 2*pi/T0; % Angular frequency
original = max(0, sin(w*t)); % Original signal (half-wave rectified sine wave)

T = T0/2;   
xN = (1/pi) + ((1/2) * (sin(2 * pi * (1/T0) * t)); % Initial approximation of the signal

for l = 1:1:N/2
    k = 2*l;
    ak = 2 / (pi * (1 - (k)^2)); % Coefficient formula taken from Example C.27 in the book
    xN = xN + ak * cos((2 * pi * k * (1/T0) * t)); % Update the synthesized signal using Fourier series
    
    % Plotting the synthesized signal over the original signal
    plot(t, original, 'k') 
    hold on
    plot(t, xN) 
    axis([0 12 -0.2 1.2]) 
    title(num2str(k))
    hold off
    pause(0.25) 
end
