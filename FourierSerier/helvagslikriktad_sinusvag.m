close all
clear
clc

N = 36; % Number of coefficients in the synthesis 
T0 = 4; % Period of the signal
t = 0:0.01:3*T0; % Time vector

w = 2*pi/T0;
original = abs(sin(w*t)); % Full-wave rectified sine wave

xN = (2/pi) * ones(size(t)); % DC component
T = T0/2;

for k = 1:N
    ak = 2 / (pi * (1 - 4 * k^2)); % Formula for ak from Example 3.34 in the book
    xN = xN + 2 * ak * cos((2 * pi * k * t) / T); % Formula from Example 3.35.b
    
    % Plotting the synthesized signal over the original signal
    plot(t, original, 'k') % Original signal in black
    hold on
    plot(t, xN) % Synthesized signal
    axis([0 12 -0.2 1.2])
    title(num2str(k)) % Show current harmonic number
    hold off
    pause(0.25) % Pause for visualization
end
