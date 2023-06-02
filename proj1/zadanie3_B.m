% Dane zadania
X = -10:2:10;
Y = [-5.460 -3.880 -1.969 -1.666 -0.076 -0.397 -1.030 -4.548 -11.528 -21.641 -34.445];
N = [3 5 7 9 10 11];

% parametry solwera GS
itmax = 1000;
delta = 1e-8;

samples = -10:0.1:10;
epsilons2 = zeros(length(N),1);
epsilonsInf = zeros(length(N),1);

tiledlayout(2,2);
nexttile([1 2])
hold on
plot(X,Y,'o');

i = 1;
for n = N
    a = approxGS(X,Y,n,delta,itmax);
    plot(samples, polyval(flip(a), samples));
    epsilons2(i) = norm(polyval(flip(a),X) - Y, 2);
    epsilonsInf(i) = norm(polyval(flip(a),X) - Y, Inf);
    i = i+1;
end

hold off
title('Funkcje aproksymujące (solwer GS)');
xlabel('x');
ylabel('y');
legend('dane', '3', '5', '7', '9', '10', '11')

nexttile
plot(N, epsilons2, '-o');
title('Błąd w normie 2 od stopnia wielomianu n');
xlabel('n');
ylabel('epsilon');

nexttile
plot(N, epsilonsInf, '-o');
title('Błąd w normie inf od stopnia wielomianu n');
xlabel('n');
ylabel('epsilon');
