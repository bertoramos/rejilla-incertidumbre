function [path] = get_path(map, origin, target)
    path = [];
    visited = [];
    queue = [origin];
    while(~isempty(queue))
        if(isequal(queue(1), target))
            break;
        end
        neighbours = nearest_neighbours(map, queue(1, :));
        path(end+1, :) = queue(1, :);
        visited(end+1, :) = queue(1, :);
        queue(1, :) = [];
        
        % Discard already visited neigbours
        
        queue = cat(1, queue, neighbours);
    end
end

