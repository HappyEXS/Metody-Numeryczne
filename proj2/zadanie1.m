
D = [-4:0.1:15];
Z = zeros(length(D));
x0 = -4;
x1 = 15;
delta = 1e-8;
imax = 100;


Y = zeros(length(D), 1);
for i = 1:length(D)
    Y(i) = f(D(i));
end

xf = zeros(4,1); ff= zeros(4,1); iexe= zeros(4,1); texe= zeros(4,1);

tiledlayout(2, 1);
nexttile;
hold on;
title('Metoda Siecznych');
plot(D, Y, D, Z)
[xf(1), ff(1), iexe(1), texe(1)] = sieczne(@(x) f(x), x0, 0, delta, imax);
[xf(2), ff(2), iexe(2), texe(2)] = sieczne(@(x) f(x), 0, x1, delta, imax);
scatter(xf(1), ff(1));
scatter(xf(2), ff(2));
hold off;

nexttile;
hold on;
title('Metoda Newtona');
plot(D, Y, D, Z)
[xf(3), ff(3), iexe(3), texe(3)] = newton(@(x) f(x), x0, delta, imax);
[xf(4), ff(4), iexe(4), texe(4)] = newton(@(x) f(x), x1, delta, imax);
scatter(xf(3), ff(3));
scatter(xf(4), ff(4));
hold off;

% [xf, ff, iexe, texe]
xf, ff, iexe, texe

function y = f(x)
    y = -1.65 + 0.3*x - x*exp(-x/2);
end

  