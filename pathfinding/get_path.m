function [path] = get_path(map, origin, target, n)
    if map(origin(2), origin(1)) > 0
        fprintf("No valid origin point\n")
        return
    end
    if map(target(2), target(1)) > 0
        fprintf("No valid origin point\n")
        return
    end

    path = [origin];
    queue = [origin];
    
    path = [origin];
    
    visited = [origin];
    
    while ~isempty(queue)
        current_node = queue(1, :);
        queue(1, :) = [];
        
        path(end+1, :) = current_node;
        if (isequal(current_node, target))
            disp("Target found");
            break
        end
        
        neighbors = nearest_neighbours(map, current_node, n);
        
        for i = 1:size(neighbors, 1)
            row = neighbors(i,:);
            
            is_row_in_visited = 0;
            for j = 1:size(visited, 1)
                if row(1) == visited(j, 1) && row(2) == visited(j, 2)
                    is_row_in_visited = 1;
                    break;
                end
            end
            
            if is_row_in_visited == 0
                visited(end+1, :) = row; 
                queue = cat(1, queue, row);
            end
        end
    end

end

