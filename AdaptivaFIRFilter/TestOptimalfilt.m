clear
close all
clc

%Test
x=randn(1,4000);
h_org=[1 2 3 4 -5 6 -9 -19]';
y=filter(h_org,1,x);

[h,Emin]=WienerHopf(x,y,length(h_org));

[h_org'; h'];

d = y;
nord = length(h_org);
mu = 0.01;
gamma = 0.000000001;
beta = 0.1;

N=length(x)

[lmsA, lmsE] = lms(x(1:end-nord),d,mu,nord);
[llmsA, llmsE] = llms(x(1:end-nord),d,mu,gamma,nord);
[nlmsA, nlmsE] = nlms(x(1:end-nord),d,beta,nord);

% LMS

figure(1);
plot(0:N-1-nord, lmsA(:,1), 'b', 0:N-1-nord, lmsA(:,2), 'r', 0:N-1-nord, h_org(1)*ones(1,N-nord), '--k', 0:N-1-nord, h_org(2)*ones(1,N-nord), '--k');
xlabel('Iteration')
ylabel('Coefficients')
title(['LMS with {\mu}=', num2str(mu)])
axis([0 N-1-nord -1 3])

figure(2);
plot(0:N-1-nord, lmsE.^2)
xlabel('Iteration')
ylabel('Squared Error')
title(['LMS with {\mu}=', num2str(mu)])
axis([0 N-1-nord 0 30])

% NLMS

figure(4)
plot(0:N-1-nord, nlmsA(:,1), 'b', 0:N-1-nord, nlmsA(:,2), 'r', 0:N-1-nord, h_org(1)*ones(1,N-nord), '--k', 0:N-1-nord, h_org(2)*ones(1,N-nord), '--k');
%plot(0:N-3,A(:,1),'b',0:N-3,A(:,2),'r',0:N-3,1.2728*ones(1,N-2),'--k',0:N-3,-0.81*ones(1,N-2),'--k');
xlabel('Iteration')
ylabel('Coefficients')
title(['NLMS with {\beta}=', num2str(beta)])
axis([0 N -1 3])

figure(5)
plot(0:N-1-nord, nlmsE.^2)
xlabel('Iteration')
ylabel('Squared Error')
title(['NLMS with {\beta}=', num2str(beta)])
axis([0 N-1-nord 0 30])

% LLMS

figure(6)
plot(0:N-1-nord, llmsA(:,1), 'b', 0:N-1-nord, llmsA(:,2), 'r', 0:N-1-nord, h_org(1)*ones(1,N-nord), '--k', 0:N-1-nord, h_org(2)*ones(1,N-nord), '--k');
%plot(0:N-3,A(:,1),'b',0:N-3,A(:,2),'r',0:N-3,1.2728*ones(1,N-2),'--k',0:N-3,-0.81*ones(1,N-2),'--k');
xlabel('Iteration')
ylabel('Coefficients')
title(['LLMS with {\mu}=', num2str(mu), ' and {\gamma}=', num2str(gamma)])
axis([0 N -1 3])

figure(7)
plot(0:N-1-nord, llmsE.^2)
xlabel('Iteration')
ylabel('Squared Error')
title(['LLMS with {\mu}=', num2str(mu), ' and {\gamma}=', num2str(gamma)])
axis([0 N-1-nord 0 30])

