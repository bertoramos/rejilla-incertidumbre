clc;
clear;
clf;

[pos, obs] = ExtractPathScans('mydata2021_03_06_16_31_28.log', 0);

ncell = 30;

rejilla = zeros(ncell+1, ncell+1);

xobs = obs.x;
yobs = obs.y;
N = size(xobs, 2);

X = [];
Y = [];
for c=1:N
    X = [X xobs{c}];
    Y = [Y yobs{c}];
end

incX = (max(X) - min(X))/ncell;
incY = (max(Y) - min(Y))/ncell;

for c=1:N
    nobs = size(xobs{c},2);
    
    xobs{c} = xobs{c} - min(X);
    yobs{c} = yobs{c} - min(Y);
    for o=1:nobs
        xv = xobs{c}(o);
        yv = yobs{c}(o);
        if ~isnan(xv) && ~isnan(yv)
            
            [i,j] = get_cell(xv, yv, incX, incY);
            rejilla(i,j) = rejilla(i,j) + 1;
        end
    end
end

[x,y] =meshgrid(1:ncell+1, 1:ncell+1);
surf(x,y,rejilla / max(rejilla(:)));

umbral = round(mean(rejilla(:)));

rejilla(isoutlier(rejilla, 'mean')) = umbral;

figure();
[x,y] =meshgrid(1:ncell+1, 1:ncell+1);
surf(x,y,rejilla / max(rejilla(:)));

figure();
colores = rejilla / max(rejilla(:));
altura = rejilla;
altura(altura > 0) = 1;

[x,y] =meshgrid(1:ncell+1, 1:ncell+1);
s = surf(x,y, altura, colores);
colorbar;

zticks([0 1]);

