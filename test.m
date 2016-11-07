A = [1 2 3 4; 5 6 7 8;  9 10 11 12; 13 14 15 16];
A(:, :, 2) = [-1 -2 -3 -4; -5 -6 -7 -8; -9 -10 -11 -12; -13 -14 -15 -16];
A(:, :, 3) = [100 200 300 400; 500 600 700 800; 900 1000 1100 1200; 1300 1400 1500 1600];

b = 8;
%     1    2   <- subrow = 1
%     3    4   <- subrow = 2
%     ^
% subcol=1
m = 48;
n = 64; 
p =3;
for col = 1: (n/b)*(m/b)
    for row = 1:p:p*(b^2)-2
        preRow = floor((col-1) /(n/b)) * b;
        preCol = mod(col-1, (n/b))  * b;
        index =  ceil(row/3);
        subRow = ceil(index/b);
        subCol = mod(index-1, b) + 1;
        

        
        fprintf('col=%d, row = %d\n preR = %d, preC = %d\n' , col, row, preRow, preCol);
        fprintf('index = %d, subRow = %d, subCol = %d\n', index, subRow, subCol);
        fprintf('totalRow = %d, totalCol = %d\n',subRow+preRow, subCol+preCol);
    end
end

%}










