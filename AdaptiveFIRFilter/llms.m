function [A,E] = llms(x,d,mu,gamma,nord,a0)
%LLMS	Leaky LMS adaptive filtering algorithm.
%---
%USAGE [A,E] = llms(x,d,mu,gamma,nord,a0)
%
%           x    : input data to the adaptive filter.
%           d    : desired output
%           mu   : adaptive filtering update (step-size) parameter
%           gamma: leaky term
%           nord : number of filter coefficients
%           a0   : (optional) initial guess for FIR filter 
%		   coefficients - a row vector.  If a0 is omitted
%		   then a0=0 is assumed.
%
%     The output matrix A contains filter coefficients.
%        - The n'th row contains the filter coefficients at time n
%        - The m'th column contains the m'th filter coeff vs. time.
%        - The output vector E contains the error sequence versus time.
%
%  see also LMS, NLMS and RLS
%
%---------------------------------------------------------------
% copyright 1996, by M.H. Hayes.  For use with the book 
% "Statistical Digital Signal Processing and Modeling"
% (John Wiley & Sons, 1996).
%---------------------------------------------------------------
%LLMS modified LMS by Josef Ström Bartunek

X=convm(x,nord);
[M,N] = size(X);
if nargin < 6,   a0 = zeros(1,N);   end
a0   = a0(:).';
E=zeros(1,M-nord+1);%for speeding up the algorithm
A=zeros(M-nord+1,nord);%for speeding up the algorithm
E(1) = d(1) - a0*X(1,:).'; 
A(1,:) = (1-gamma)*a0 + mu*E(1)*conj(X(1,:));
if M>1
    for k=2:M-nord+1
        E(k) = d(k) - A(k-1,:)*X(k,:).';
        A(k,:) = (1-gamma)*A(k-1,:) + mu*E(k)*conj(X(k,:));
    end
end
