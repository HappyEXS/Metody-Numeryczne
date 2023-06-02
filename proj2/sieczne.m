function [xf, ff, iexe, texe] = sieczne(f, x0, x1, delta, imax)
%   CEL
%       Poszukiwanie pierwiastka funkcji jednej zmiennej
%       metoda Newtona (stycznych)
%  
%   PARAMETRY WEJSCIOWE
%       f      -  funkcja dana jako wyrazenie  
%       x0, x1 -  przedział początkowy
%       delta  -  dokladnosc  
%       imax   -  maksymalna liczba iteracji
%
%   PARAMETRY WYJSCIOWE
%       xf     -  rozwiazanie 
%       ff     -  wartosc funkcji w xf
%       iexe   -  liczba iteracji wykonanych
%       texe   -  czas obliczen [s]

tic;
i = 0; 
x_n_1 = x0;
x_n = x1;
fx = f(x_n);
while abs(fx) > delta && i < imax
     i = i + 1;
     x_tmp = (x_n_1 * f(x_n) - x_n * f(x_n_1)) / (f(x_n) - f(x_n_1));
     x_n_1 = x_n;
     x_n = x_tmp;
     fx = f(x_n);
end
texe = toc;
iexe = i;
xf = x_n;
ff = fx;