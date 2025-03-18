%Skriptet demosntrerar hur man syntetiserar en periodisk signal med den
%?ndliga Fourier Serier Syntesen med N ak koefficienter. 
close all
clear
clc

N=379; %Antal koefficienter i syntesen 
T0=4; %Periodtiden f?r signalen
t=0:0.01:3*T0; %tidsvektorn

%h?r skapas original signal i detta fall en ren fyrkantsv?g
ph=(length(t)-1)/6;
original=[ones(1,ph/2) zeros(1,ph) ones(1,ph) zeros(1,ph) ones(1,ph) zeros(1,ph) ones(1,ph/2) 1];

%Syntes for-loopen med plott f?r varje tillagd komponent ak
%fyrkantsv?gen har 0 i j?mna k komponenter.
xN=0.5*ones(size(t)); %start p? signalen xN(t) med f?rsta koefficienten a0
for k=1:2:N
    %formeln f?r ak tagen fr?n Exempel C-1 i boken
    %skriven p? formeln enligt exercise C.3 (reell signal)
    ak=sin(pi*k/2)/(pi*k);
    xN=xN+2*ak*cos(2*pi/T0*k*t); %addition av ak
    
    %plottning av den syntetiserad signal ?ver den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    %pausa med 0.25s
    pause(0.25)
end