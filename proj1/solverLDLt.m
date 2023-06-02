function x = solverLDLt(A,b)
    % A = LDL' decomposition
    [L, D] = LDLt(A);
    % solve Ly = b for y (lower triangular matrix)
    y = solveY(L, b);
    % solve DL'x = y for x (upper triangular matrix)
    x = solveX(D*L', y);
end

function [L, D] = LDLt(A)
    [n, ~] = size(A);
    L = zeros(n);
    D = zeros(n);

    for i = 1:n
        % calculate values of the matrix D
        suml2d = 0;
        for k = 1:i-1
            suml2d = suml2d + L(i,k) ^ 2 * D(k,k);
        end
        D(i,i) = A(i,i) - suml2d;

        % calculate values of the matrix L
        for j = i+1:n
            sumldl = 0;
            for k = 1:i-1
                sumldl = sumldl - L(j,k) * D(k,k) * L(i,k);
            end
            L(j,i) = (A(j, i) - sumldl)/D(i,i);
        end
        L(i,i) = 1;
    end
end

function x = solveY(A,b)
    % linear equation solver with lower triangular matrix
    [n, ~] = size(A);
    x = zeros(n,1);

    for k = 1:n
        sumax = 0;
        for j = 1:k-1
            sumax = sumax + A(k,j) * x(j);
        end
        x(k) = (b(k) - sumax)/A(k,k);
    end
end

function x = solveX(A,b)
    % linear equation solver with upper triangular matrix
    [n, ~] = size(A);
    x = zeros(n,1);

    for k = n:-1:1
        sumax = 0;
        for j = k+1:n
            sumax = sumax + A(k,j) * x(j);
        end
        x(k) = (b(k) - sumax)/A(k,k);
    end
end

