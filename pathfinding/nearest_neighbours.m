function [result] = nearest_neighbours(map, point, n_neighbors)
    sz = size(map);
    result = [];
    
    if(n_neighbors == 4)
        filter1 = [-1;0;1;0];
        filter2 = [0;1;0;-1];
    else
        filter1 = [-1;0;1;-1;1;-1;0;1];
        filter2 = [-1;-1;-1;0;0;1;1;1];
    end
    
    neighbours(1:n_neighbors, 1:2) = [point(1,1)+filter1 point(1,2)+filter2];
    neighbours = neighbours(all(neighbours,2) & neighbours(:,1) <= sz(1) & neighbours(:,2) <= sz(2),:);
    for i = 1:size(neighbours, 1)
        if map(neighbours(i, 1), neighbours(i, 2)) == 0
            result(end+1,:) = neighbours(i,:);
        end
    end
end

