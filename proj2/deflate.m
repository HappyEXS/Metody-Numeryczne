function Q = deflate(alpha, A)
%   CEL
%       Deflacja czynnikiem liniowym - prosty Schemat Hornera
%  
%   PARAMETRY WEJSCIOWE
%       alpha  -  pierwiastek wielomianu
%       A      -  wektor współczynników wielomianu
%
%   PARAMETRY WYJSCIOWE
%       Q      -  wektor współczynników wielomianu po deflacji
    n = length(A);
    Q = zeros(1, n-1);
    Q(1, 1) = A(1);
    for i = 2:n-1
        Q(1,i) = A(i) + Q(1, i-1) * alpha;
    end
end