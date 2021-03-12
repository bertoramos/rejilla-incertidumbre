clc;
clear;
clf;

[pos, obs] = ExtractPathScans('mydata2021_03_06_16_52_54.log', 0);

world_size = 16;
ncell = 30;
dim_cell = world_size/ncell;

map = binaryOccupancyMap(world_size, world_size, ncell);

xobs = obs.x;
yobs = obs.y;
N = size(xobs, 2);

for c=1:N
    nobs = size(xobs{c},2);
    for o=1:nobs
        xv = xobs{c}(o) + world_size/2;
        yv = yobs{c}(o) + world_size/2;
        if ~isnan(xv) && ~isnan(yv)
            if xv > world_size; continue; end
            if yv > world_size; continue; end
            if xv < 0; continue; end
            if yv < 0; continue; end
            
            setOccupancy(map, [xv,yv], ones(1,1));
        end
    end
end

show(map)