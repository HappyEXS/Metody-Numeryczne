clear all;
close all;

N = [5 10 25 50 100 200];
itmax = 1000;
delta = 1e-8;

epsilons1 = zeros(length(N),1);
times1 = zeros(length(N),1);

epsilons2 = zeros(6,1);
times2 = zeros(6,1);

i = 1;
for n = N
    [A, b] = data2(n);
    tic 
    x1 = solverLDLt2(A,b);
    times1(i) = toc;
    epsilons1(i) = norm(A*x1-b,2);

    [x2, iters, time] = GS(A,b,delta,itmax*n);
    epsilons2(i) = norm(A*x2-b,2);
    times2(i) = time;
    i = i + 1;
end

tiledlayout(2,1);

nexttile
plot(N, epsilons1, N, epsilons2);
title('Zależność błędu epsilon od liczby równań n');
xlabel('n');
ylabel('epsilon');
legend('solwer LDLt', 'GS')

nexttile
plot(N, times1, N, times2);
title('Zależność czasu obliczeń od liczby równań n');
xlabel('n');
ylabel('czas');
legend('solwer LDLt', 'GS')
