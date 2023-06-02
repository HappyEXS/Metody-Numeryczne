function a = approxSVD(x,y,n)
    % calculate matrix A
    A = calculateMatrixA(x,n);
    % decomposition of matrix A by SVD
    [U, S, V] = svd(A);
    % solve for a using SVD
    s = diag(S);
    k = rank(A);
    y_ = U' * y';
    a_ = [y_(1:k, 1) ./ s(1:k, 1); zeros(n-k,1)];
    a = V * a_;
end