function swapM = swap(x,i,j)

    A = x;

    swap1 = A(:,i)';
    swap2 = A(:,j)';

    A(:,i) = swap2(:);
    A(:,j) = swap1(:);

    swapM = A;
end