function output = invshape(data, m, n, p, b)
%assign the clustered value back to A(m,n,3)

output = zeros(m, n, p);
for dataCol = 1:(m/b)*(n/b)
    %fprintf('dataCol = %d)\n', dataCol);
        row = ceil(dataCol/(n/b));
        col = mod((dataCol-1), (n/b)) + 1;
        r   = (row-1)*b ;
        c   = (col-1)*b ;
        dRowind = 1;
        for subRow = 1:b
            for subCol = 1:b
                for dim = 1:p
      %              fprintf('output(%d,%d,%d)\n', r+subRow, c+subCol, dim);
                    output(r+subRow, c+subCol, dim) = data(dRowind, dataCol);
                    dRowind = dRowind + 1;
                end
            end
        end
end
