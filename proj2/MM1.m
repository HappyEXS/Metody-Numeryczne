function [XF, FF, IEXE] = MM1(A, x0, x1, x2, delta)
%   CEL
%       Poszukiwanie pierwiastków wielomianu
%       metoda Mullera MM1
%  
%   PARAMETRY WEJSCIOWE
%       A           -  wektor współczynników wielomianu
%       x0, x1, x2  -  punkty początkowe 
%       delta       -  dokładność 
%
%   PARAMETRY WYJSCIOWE
%       Xf      -  wektor pierwiastków wielomianu
%       FF      -  wektor wartości pierwiastków
%       IEXE    -  liczba iteracji wykonanych dla każdego pierwiaskta

    n = length(A);
    XF = zeros(1, n-1);
    FF = zeros(1, n-1);
    IEXE = zeros(1, n-1);
    iexe = 0;
    X = [x0, x1, x2];
    A_i = A;
    for i = 1:n-1
        iexe = 0;
        while abs(polyval(A_i, X(3))) > delta
            z0 = X(1) - X(3);
            z1 = X(2) - X(3);

            fx0 = polyval(A_i, X(1));
            fx1 = polyval(A_i, X(2));
            c = polyval(A_i, X(3));

            b = (z0*z0*(fx1 - c) + z1*z1*(c - fx0)) / (z1*z0*z0 - z0*z1*z1);
            a = (fx0 - c - b*z0) / (z0*z0);

            sqrt_delta = sqrt(b^2 - 4 * a * c);
            if (abs(b + sqrt_delta) >= abs(b - sqrt_delta))
                zmin = - 2 * c / (b + sqrt_delta);
            else
                zmin = - 2 * c / (b - sqrt_delta);
            end
            x3 = X(3) + zmin;

            diff_max = 0;
            val_max = 0;
            for j = 1:3
                if diff_max < abs(x3 - X(j))
                    diff_max = abs(x3 - X(j));
                    val_max = X(j);
                end
            end
            X = [X(X~=val_max), x3];

            iexe = iexe + 1;
        end
        A_i = deflate(X(3), A_i);
        XF(i) = X(3);
        FF(i) = polyval(A, X(3));
        IEXE(i) = iexe;
    end
end