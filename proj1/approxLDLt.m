function a = approxLDLt(x,y,n)
    % calculate matrix A
    A = calculateMatrixA(x,n);
    % solve linear equation A'Aa = A'y
    a = solverLDLt2(A' * A, A' * y');
end