clc;
clear;
clf;

addpath('../grid_generation');
main; % Call to grid creation file
path = get_path(altura, [3 13], [13 18]);


hold on;
figure;

altura = rejilla;
altura(altura > 0) = 1;

[x,y] =meshgrid(1:ncell+1, 1:ncell+1);
s = surf(x,y, altura);

zticks([0 1]);

for i=1:(size(path, 1)-1)
  pl = line([path(i,2) path(i+1,2)], [path(i,1) path(i+1,1)], [1 1]);
  pl.Color = 'red';
end