clear
close all
clc

%Ladda in data med impulssvar för de olika LTI FIR filtrar
load filters

%Vid problem med att få igång inspelning kör nedanstående kommandot
%audiodevreset;

%Parametrar
Fs=48000;%Samplingsfrekvensen i Hz, (1000 till 200000 i Josefs dator)
nBits=24;  %Antal bitar som går att välja 8, 16 och 24
nChannels=1; %Antal kanaler, en kanal per mikrofon
RecTime=1; %Inspelningstid i sec

myVoice = audiorecorder(Fs,nBits,nChannels);

%Skapar utskrift i Command Window för att markera när inspelning startar
%och slutar.
disp('Start speaking.');%inspelning startar en liten stund efter att denna visas i command fönstret
recordblocking(myVoice, RecTime);%startar inspelning av audio och pausar skriptet
disp('End of recording.');

%Extrahera inspelad data ur objektet myVoice
audio = getaudiodata(myVoice);%vid val av fler kanaler får vi en matris 

soundsc(audio,Fs,nBits);
pause(RecTime+1);

h=h7;%välj en av filtrarna
y=filter(h,1,audio);%filtrering av den inspelad data
soundsc(audio,Fs,nBits);
pause(RecTime+1);

%Plottar filter koefficienterna
figure
stem(0:34,h)
title('Systemets impulssvar h[n]/ filter b_k koefficienter')
xlabel('n')
ylabel('Amplitud')

%Plottar systemets freksvenssvar
figure
freqz(h,1,[],Fs)%LTI FIR systemets frekvenssvar, magnituden i dB dvs 20*log10(abs(H))

%plottar frekvensinnehållet (kräver Signal Processing Toolbox)
%mer om detta senare i kursen när vi behandlar kapitel 8
%här är den med bara för att ge lite inblick i frekvensinnehållet
figure
spectrogram(audio,Fs/4,Fs/8,[],Fs,'yaxis')
figure
spectrogram(y,Fs/4,Fs/8,[],Fs,'yaxis')