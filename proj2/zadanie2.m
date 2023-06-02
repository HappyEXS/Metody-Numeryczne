A = [-1 1.5 3 1 1.5];
delta = 1e-8;

[XF, FF, iexe] = MM1(A, -2, 2, 0, delta);

d0 = -3; d1 = 5;
D = [d0:0.1:d1];
Z = zeros(length(D));
for i = 1:length(D)
    Y(i) = f(D(i));
end

hold on;
plot(D, Y, "b", D, Z, "r")
scatter(XF, FF)
axis([d0 d1 -10 15])
hold off;

[XF; FF; iexe]'

function y = f(x)
    y = -1*x^4 + 1.5*x^3 + 3*x^2 + 1*x + 1.5;
end