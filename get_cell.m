function [i,j] = get_cell(x, y, incX, incY)
    j = floor(x/incX)+1;
    i = floor(y/incY)+1;
end

