function x = solverLDLt2(A,b)
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
        D(i,i) = A(i,i);
        for k = 1:i-1
            D(i,i) = D(i,i) - L(i,k) ^ 2 * D(k,k);
        end

        % calculate values of the matrix L
        for j = i+1:n
            L(j,i) = A(j, i);
            for k = 1:i-1
                L(j,i) = L(j,i) - (L(j,k) * D(k,k) * L(i,k));
            end
            L(j,i) = L(j,i)/D(i,i);
        end
        L(i,i) = 1;
    end
end

function x = solveY(A,b)
    % linear equation solver with lower triangular matrix
    [n, ~] = size(A);
    x = zeros(n,1);

    for k = 1:n
        x(k) = b(k);
        for j = 1:k-1
            x(k) = x(k) - A(k,j) * x(j);
        end
        x(k) = x(k)/A(k,k);
    end
end

function x = solveX(A,b)
    % linear equation solver with upper triangular matrix
    [n, ~] = size(A);
    x = zeros(n,1);

    for k = n:-1:1
        x(k) = b(k);
        for j = k+1:n
            x(k) = x(k) - A(k,j) * x(j);
        end
        x(k) = x(k)/A(k,k);
    end
end

