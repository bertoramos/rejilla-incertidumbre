clc;
clear;
clf;

addpath('../grid_generation');
main; % Call to grid creation file
close all;

n_neighbors = 4;
origin = [27 14];
target = [5 18];

[costes, is_valid] = get_path(altura, origin, target, n_neighbors);

if is_valid
    final_path = choose_path(costes, origin, target, n_neighbors);

    figure;
    
    map_img = altura.*ones(size(altura, 1), size(altura, 2), 3);
    
    for i=1:size(final_path, 1)
        map_img(final_path(i,1), final_path(i,2), :) = [1,0,0];
    end
    map_img(origin(1,1), origin(1,2), :) = [0,1,0];
    map_img(target(1,1), target(1,2), :) = [0,0,1];
    
    imshow(1-map_img);
    truesize([500, 500]);
end
