function [i,j] = get_cell(x, y, ncell, world_size)
    if x > world_size; x = world_size; end
    if y > world_size; y = world_size; end
    if x < 0; x = 0; end
    if y < 0; y = 0; end
    

    dimcell = world_size/ncell;
    
    i = ceil(x/dimcell);
    j = ceil(y/dimcell);
end

