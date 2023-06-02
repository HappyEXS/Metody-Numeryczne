
x0 = -4;
x1 = -2;
xmax = 15;
delta = 1e-8;
imax = 100;

fprintf('\nMetoda siecznych\n')
fprintf('[pp,pk]\t\t\t\t\t|\t[f(pp),f(pk)\t\t\t|\tx\t\t\t|\tf(x)\t\t\t|\tIter\t|\tTime\n');
while x1 <= xmax
    [xf, ff, iexe, texe] = sieczne(@(x) f(x), x0, x1, delta, imax);
    fprintf('[%f, %f]\t|\t[%f, %f]\t|\t%f\t|\t%.10f\t|\t%.0f\t\t|\t%f\t\n', ...
            [x0, x1, f(x0), f(x1), xf, ff, iexe, texe]);
    x0 = x0 + 2;
    x1 = x1 + 2;
end

x0 = -4;
fprintf('\nMetoda Newtona\n')
fprintf('pp\t\t\t|\tf(pp)\t\t|\tx\t\t\t|\tf(x)\t\t\t|\tIter\t|\tTime\n');
while x0 <= xmax
    [xf, ff, iexe, texe] = newton(@(x) f(x), x0, delta, imax);
    fprintf('%f\t|\t%f\t|\t%f\t|\t%.10f\t|\t%.0f\t\t|\t%f\t\n', ...
            [x0, f(x0), xf, ff, iexe, texe]);
    x0 = x0 + 2;
end
function y = f(x)
    y = -1.65 + 0.3*x - x*exp(-x/2);
end