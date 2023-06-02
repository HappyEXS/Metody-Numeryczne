clear all;
close all;

N = [5 10 25 50 100 200];

epsilons = zeros(length(N),1);
times = zeros(length(N),1);

i = 1;
for n = N
    [A, b] = data1(n);
    tic
    x = solverLDLt2(A,b);
    time = toc;
    epsilons(i) = norm(A*x-b,2);
    times(i) = time;
    i = i + 1;
end

tiledlayout(2,1);

nexttile
plot(N, epsilons);
title('Zależność błędu epsilon od liczby równań n');
xlabel('n');
ylabel('epsilon');

nexttile
plot(N, times);
title('Zależność czasu obliczeń od liczby równań n');
xlabel('n');
ylabel('czas');