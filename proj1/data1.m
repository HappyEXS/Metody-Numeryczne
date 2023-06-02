function [A, b] = data1(n)
    A = zeros(n,n);
    b = zeros(n,1);
    for i=1:n
        for j=1:n
            A(i,j) = i + j + 1;
        end
    end
    for i=1:n
        A(i,i) = 3*n^2 + (1.5*i+2)*n;
        b(i,1) = 2.5+0.6*i;
    end
end