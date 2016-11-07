function output = myReshape(A, blocksize)
%my reshape
%only for m/b, n/b is integer
%turn m*n*p into (p*b*b)*(m/b * n/b)
% 1 2 + 1' 2' + 1" 2" = [1 1' 1" 2 2' 2" 3 3' 3" 4 4' 4"]'
% 3 4 + 3' 4' + 3" 4"   



[m,n,p] = size(A);
b = blocksize;
%     1    2   <- subrow = 1
%     3    4   <- subrow = 2
%     ^
% subcol=1


output = zeros(p*b*b, (m/b)*(n/b));
for col = 1: (m/b)*(n/b)
    for row = 1:p:p*(b^2)-2
        preRow = floor((col-1) /(m/b)) * b;
        preCol = mod(col-1, (m/b))  * b;
        index =  ceil(row/3);
        subRow = ceil(index/b);
        subCol = mod(index-1, b) + 1;
        
        output(row,   col) = A(preRow + subRow, preCol + subCol, 1);
        output(row+1, col) = A(preRow + subRow, preCol + subCol, 2);
        output(row+2, col) = A(preRow + subRow, preCol + subCol, 3);
        
    end
end
