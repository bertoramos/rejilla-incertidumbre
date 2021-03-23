function [path] = get_path(map, origin, target)
    path = [origin];
    visited = [origin];
    queue = [origin];
    while(~isempty(queue))
        if(isequal(queue(1), target))
            path(end+1, :) = queue(1);
            break;
        end
        neighbours = nearest_neighbours(map, queue(1, :));
       
        for i = size(neighbours, 1)
            row = neighbours(i, :);
            
            for j = size(visited, 1)
                if row(1) ~= visited(j, 1) && row(2) ~= visited(j, 2)
                    visited(end+1, :) = row;
                    path(end+1, :) = row;                  
                    queue = cat(1, queue, row);
                end
            end
        end
        
        queue(1, :) = [];
        
    end
end

