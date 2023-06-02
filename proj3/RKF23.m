function [tout, yout, hout, dout] = RKF23(f, t_span, x0, h0, hmin, eW, eB)
%   CEL
%       Wyznaczanie rozwiązania układu równań różniczkowych zwyczajnych
%       za pomocą metody Rungego–Kutty-Fehlberga (RKF23)
%  
%   PARAMETRY WEJSCIOWE
%       f      -  funkcja przyjmująca jako parametry wartości w punkcie
%       t_span -  przedział poszukiwania rozwiązania
%       x0     -  wektor punktów startowych  
%       h0     -  początkowa wartość kroku
%       hmin   -  ustalona minimalna wielkość kroku - poniżej tego
%                 kroku kończymy program - uznajemy, że nie da się
%                 znaleźć wyniku z zadaną dokładnością
%       eW     - wartość dozwolonego błędu względnego
%       eB     - wartość dozwolonego błędu bezwzględnego
%
%   PARAMETRY WYJSCIOWE
%       tout   -  wektor kolejnych wartości czasu t 
%       yout   -  macierz kolejnych wartości x w kolejnych iteracjach
%                 algorytmu
%       hout   -  wektor kroków w kolejnych iteracjach algorytmu
%       dout   -  wektor szacowanych błędów dla wartości x w kolejnych
%                 iteracjach algorytmu

% stałe
s = 0.9;
beta = 5;

% inicjalizacja
T(1, :) = t_span(1);
Y(1, :) = x0;
H(1, :) = h0;
D(1, :) = 0;

% przechodzimy przez przedział wyznaczając kolejne punkty
n = 1;
while (T(n) <= t_span(2))
    x = Y(n, :)';
    h = H(n);
    % wyznaczenie współczynników k
    k1 = f(x);
    k2 = f(x + h * (1/4)   * (       k1                      ));
    k3 = f(x + h * (1/800) * (-189 * k1 + 729 * k2           ));
    k4 = f(x + h * (1/891) * (214  * k1 + 27  * k2 + 650 * k3));
    
    % wyznaczenie wartości dla metody rzedu 2 i 3
    x2 = x + (1/891)  * h * (214 * k1 + 27 * k2 + 650  * k3          );
    x3 = x + (1/2106) * h * (533 * k1 + 0  * k2 + 1600 * k3 - 27 * k4);

    % oszacowanie błędu metody (2 rzędu)
    delta = norm(x3 - x2, inf);

    % wyznaczenie kolejnego rozmiaru kroku
    e = abs(Y(n)) * eW + eB;
    alpha = (e/abs(delta))^(1/3);
    h1 = H(n) * s * alpha;

    if (s * alpha >= 1)
        % wyznaczenie nowego położenia
        Y(n+1, :) = x3;
        T(n+1) = T(n) + H(n);
        H(n+1) = min([h1, beta * H(n), t_span(2) - T(n)]);
        D(n+1, :) = delta;
        n = n + 1;
    else
        if (h1 < hmin)
            error("Niemożliwe rozwiązanie z zadaną dokładnością")
        else
            H(n) = h1;  % powtórzenie iteracji
            
        end
    end
end
tout = T;
yout = Y;
hout = H;
dout = D;
end