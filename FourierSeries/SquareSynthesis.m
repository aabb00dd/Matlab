% The script demonstrates how to synthesize a periodic signal using
% the finite Fourier Series Synthesis with N ak coefficients.
close all
clear
clc

N = 379; % Number of coefficients in the synthesis
T0 = 4; % Period of the signal
t = 0:0.01:3*T0; % Time vector

% Here, the original signal is created, in this case, a pure square wave
ph = (length(t) - 1) / 6;
original = [ones(1, ph/2) zeros(1, ph) ones(1, ph) zeros(1, ph) ones(1, ph) zeros(1, ph) ones(1, ph/2) 1];

% Synthesis loop with plotting for each added component ak
% The square wave has 0 in even k components.
xN = 0.5 * ones(size(t)); % Start of the signal xN(t) with the first coefficient a0
for k = 1:2:N
    % Formula for ak taken from Example C-1 in the book
    % Written according to the formula in exercise C.3 (real signal)
    ak = sin(pi * k / 2) / (pi * k);
    xN = xN + 2 * ak * cos(2 * pi / T0 * k * t); % Addition of ak
    
    % Plotting the synthesized signal over the original signal
    plot(t, original, 'k')
    hold on
    plot(t, xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    % Pause for 0.25 seconds
    pause(0.25)
end
