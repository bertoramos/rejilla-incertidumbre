clc;
clear;
clf;
close all;

addpath('../grid_generation');
main; % Call to grid creation file

n_neighbors = 4; % 4 or 8
origin = [17 6];
target = [11 5];

path = get_path(altura, origin, target, n_neighbors);

figure;

altura = rejilla;
altura(altura > 0) = 1;

[x,y] =meshgrid(1:ncell+1, 1:ncell+1);
s = surf(y, x, altura);
hold on;

zticks([0 1]);

init = plot3(origin(1,1), origin(1,2), 1.1, 'gx');
init.MarkerSize = 10;

finish = plot3(target(1,1), target(1,2), 1.1, 'cx');
finish.MarkerSize = 10;

plot3(path(:, 1), path(:, 2), ones(size(path, 1), 1), 'ro');