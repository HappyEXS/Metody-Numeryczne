function [A, b] = data2(n)
    A = zeros(n, n);
    b = zeros(n, 1);
    for i=1:n
        for j=1:n
            if abs(i-j) == 3
                A(i,j) = 7.5;
            end
        end
    end
    for i=1:n
        A(i,i) = -20;
        b(i,1) = 4.0-0.5*i;
    end
end