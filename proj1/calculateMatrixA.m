function A = calculateMatrixA(x,n)
    A = zeros(length(x), n+1);
    for i = 1:length(x)
        for j = 0:n
            A(i,j+1) = x(i)^j;
        end
    end
end