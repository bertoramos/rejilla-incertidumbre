[pos, obs] = ExtractPathScans('mydata2021_03_05_16_11_08.log', 0);

world_size = 16;
ncell = 20;
dim_cell = world_size/ncell;

rejilla = zeros(ncell, ncell);

xobs = obs.x;
yobs = obs.y;
N = size(xobs, 2);

for c=1:N
    xv = nanmean(xobs{c} + world_size/2);
    yv = nanmean(yobs{c} + world_size/2);
    [i,j] = get_cell(xv, yv, ncell, world_size);
    rejilla(i,j) = rejilla(i,j) + 1;
end

rejilla = rejilla / max(rejilla(:));

[x,y] =meshgrid(1:ncell, 1:ncell);
surf(x,y,rejilla);

