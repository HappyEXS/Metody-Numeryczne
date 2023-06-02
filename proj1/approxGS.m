function a = approxGS(x,y,n,delta,itmax)
    % calculate matrix A
    A = calculateMatrixA(x,n);
    % solve linear equation A'Aa = A'y
    [a, ~, ~] = GS(A' * A, A' * y', delta, itmax*n);
end
