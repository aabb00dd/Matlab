%Demo av hur man spelar in egen audiodata med datorns mikrofoner direkt in
%i MATLAB. B??r funka f??r b??de PC och Mac.
clear
close all
clc

%Parametrar
Fs=200000;%Samplingsfrekvensen i Hz (1000 till 200000 i Josefs dator)
nBits=24;  %Antal bitar som g??r att v??lja 8, 16 och 24
nChannels=2; %Antal kanaler, en kanal per mikrofon
RecTime=10; %Inspelningstid i sec

myVoice = audiorecorder(Fs,nBits,nChannels);%

%Skapar utskrift i Command Window f??r att markera n??r inspelning startar
%och slutar.
myVoice.StartFcn = 'disp(''Start speaking'')';
myVoice.StopFcn = 'disp(''End of recording'')';

record(myVoice, RecTime);%startar inspelning av audio

pause(RecTime+1);%Pausar tills inspelning ??r f??rdig (n??dv??ndig)
%play(myVoice);%Spelar upp den inspelat data

%Extrahera inslepad data ur objektet myVoice
data = getaudiodata(myVoice);%vid val av fler kanaler f??r vi en matris 
audio=data(:,1);%Ta data f??r f??rsta kanalen

%sound() och soundsc() ??r tv?? andra funktioner som kan anv??ndas f??r att
%spela upp ljud. Om n??gon av dessa ska anv??ndas kommentera bort play() p??
%rad 23. Det g??r att v??lja andra alternativ f??r Fs och nBits f??r att
%manipulera inspelningen.

%sound(audio,Fs,nBits);
soundsc(audio,Fs,nBits);

t=0:1/Fs:RecTime-1/Fs;%Tidsvektor
%plottar audio tidssignalen
figure(1)
plot(t,audio);
xlabel('Time (secs)');
ylabel('Amplitude')

%plottar frekvensinneh??llet (kr??ver Signal Processing Toolbox)
%mer om detta senare i kursen n??r vi behandlar kapitel 8
%h??r ??r den med bara f??r att ge lite inblick i frekvensinneh??llet
figure(2)
spectrogram(audio,'yaxis')