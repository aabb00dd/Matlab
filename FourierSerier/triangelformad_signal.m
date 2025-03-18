close all
clear
clc

N = 53; % Antal koefficienter i syntesen
T0 = 4; % Periodtiden f?r signalen
t = 0:0.01:3*T0; % Tidsvektorn
ph = (length(t)-1)/6;

original = abs(sawtooth(pi/T0*t + pi/2, 0.5));

xN = 0.5;
for l = 1:1:(N+1)/2
    k = 2*l-1;
    ak = -4/((k^2)*pi^2);
    xN = xN + ak*cos(2*pi*(1/T0)*k*t); %formeln f?r ak tagen fr?n Exempel C.21 i boken
    
    %plottning av den syntetiserad signal ?ver den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    pause(0.25)
end