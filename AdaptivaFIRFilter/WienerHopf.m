function [w,Emin]=WienerHopf(x,d,P)
%This function calculates the P sizes Wiener-Hopf FIR filter weigths w and the
%corresponding min-square-error Emin based on the input signal x and the
%desired signal d.

xxc = xcorr(x,x,P-1,'biased');
rxx = xxc(P:end);
Rxx = toeplitz(rxx,conj(rxx));%Auto-correlation matrix

dxc = xcorr(x,d,P-1,'biased');
rdx=dxc(P:-1:1);
rdx=rdx';%cross-correlation vector

w=Rxx\rdx;%optimal weights

rdd0 = xcorr(d,d,0,'biased');
Emin=rdd0-rdx'*w;%min square error
