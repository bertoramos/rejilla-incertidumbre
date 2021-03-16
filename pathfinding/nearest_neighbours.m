function [result] = nearest_neighbours(map, point)
    sz = size(map);
    result = [];
    neighbours(1:8, 1:2) = [point(1,1)+[-1;0;1;-1;1;-1;0;1] point(1,2)+[-1;-1;-1;0;0;1;1;1] ];
    neighbours = neighbours(all(neighbours,2) & neighbours(:,1) <= sz(1) & neighbours(:,2) <= sz(2),:);
    for i = 1:size(neighbours, 1)
        if map(neighbours(i, 1), neighbours(i, 2)) == 0
            result(end+1,:) = neighbours(i,:);
        end
    end
end

