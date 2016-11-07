A = [1 2 3 4; 5 6 7 8;  9 10 11 12; 13 14 15 16];
A(:, :, 2) = [-1 -2 -3 -4; -5 -6 -7 -8; -9 -10 -11 -12; -13 -14 -15 -16];
A(:, :, 3) = [100 200 300 400; 500 600 700 800; 900 1000 1100 1200; 1300 1400 1500 1600];

b = 2;
%     1    2   <- subrow = 1
%     3    4   <- subrow = 2
%     ^
% subcol=1
[m,n,p] = size(A);
B = myReshape(A, 2);
%{
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
        
        fprintf('col=%d, row = %d\n preR = %d, preCol = %d\n index = %d, subRow = %d, subCol = %d\n', col, row, preRow, preCol, index, subRow, subCol);
    end
end

%}










