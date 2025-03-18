%Skriptet demonstrerar hur man kan filtrera bort bruset i en ljudsignal
close all
clear
clc

%lada in data i Workspace
load sounddata 

y=filter(h,1,sound);%filtrerar signalen sound med systemet h (jämför med komandot conv())

soundsc(audio,fs); %spelar upp original ljudfil (för jämförelse)
pause(11)

soundsc(sound,fs);%signalen med pålagd slumpmässig brus i högre frekvensbandet
pause(11)

soundsc(y,fs);%ljudet efter brusreduktion genom filtrering med LTI FIR system h
pause(11)

%Plottar filter koefficienterna
figure
stem(0:34,h)
title('Systemets impulssvar h[n]/ filter b_k koefficienter')
xlabel('n')
ylabel('Amplitud')

%Plottar systemets freksvenssvar
figure
freqz(h,1,[],fs)%LTI FIR systemets frekvenssvar, magnituden i dB dvs 20*log10(abs(H))

%plottar frekvensinnehållet (kräver Signal Processing Toolbox)
%mer om detta senare i kursen när vi behandlar kapitel 8
%här är den med bara för att ge lite inblick i frekvensinnehållet
figure
spectrogram(audio,fs/4,fs/8,[],fs,'yaxis')
title('Original ljudfil')

figure
spectrogram(sound,fs/4,fs/8,[],fs,'yaxis')
title('Pålagd brus')

figure
spectrogram(y,fs/4,fs/8,[],fs,'yaxis')
title('Efter filtrering')