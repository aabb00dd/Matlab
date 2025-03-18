close all
clear
clc

N=42; %Antal koefficienter i syntesen 
T0=4; %Periodtiden f?r signalen
t=0:0.01:3*T0; %tidsvektorn

w= 2*pi/T0;
original = max(0, sin(w*t));

T = T0/2;   
xN = (1/pi) + ((1/2) * (sin(2 * pi * (1/T0) * t))); 

for l=1:1:N/2
    k = 2*l;
    ak = 2 / (pi * (1 - (k)^2));
    xN = xN + ak * cos((2 * pi * k * (1/T0) * t)); %formeln f?r ak tagen fr?n Exempel C.27 i boken
    
    %plottning av den syntetiserad signal ?ver den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    pause(0.25)
end