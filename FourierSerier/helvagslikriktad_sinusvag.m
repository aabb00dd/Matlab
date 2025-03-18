close all
clear
clc

N=36; %Antal koefficienter i syntesen 
T0=4; %Periodtiden f?r signalen
t=0:0.01:3*T0; %tidsvektorn

w= 2*pi/T0;
original = abs(sin(w*t));

xN =(2/pi) * ones(size(t));
T = T0/2
for k=1:N
    ak = 2 / (pi * (1 - 4 * k^2)); %formeln f?r ak tagen fr?n Exempel 3.34 i boken
    xN = xN + 2 * ak * cos((2 * pi * k * t) / T); %formeln f?r ak tagen fr?n Exempel 3.35.b i boken
    
    %plottning av den syntetiserad signal ?ver den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    pause(0.25)
end