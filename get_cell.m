function [i,j] = get_cell(x, y, incX, incY)
    %dimcell = world_size/ncell;
    
    j = floor(x/incX)+1;
    i = floor(y/incY)+1;
    
    %if i <= 0; i=1; end
    %if j <= 0; j=1; end   
end

