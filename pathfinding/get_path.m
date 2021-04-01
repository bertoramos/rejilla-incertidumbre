function [costes, exit_flag] = get_path(map, origin, target, n)
    costes = map;
    queue = [origin];
    
    exit_status = "Not valid path found";
    exit_flag = false;

    if map(origin(2), origin(1)) > 0
        fprintf("No valid origin point\n")
        return
    end
    if map(target(2), target(1)) > 0
        fprintf("No valid target point\n")
        return
    end
    
    costes(origin(1), origin(2)) = 2;
    
    while ~isempty(queue)
        current_node = queue(1, :);
        queue(1, :) = [];
        
        if (isequal(current_node, target))
            exit_status = "Target found";
            exit_flag = true;
            break
        end
        
        neighbors = nearest_neighbours(costes, current_node, n);
        
        for i = 1:size(neighbors, 1)
            row = neighbors(i,:);
            
            costes(row(1), row(2)) = costes(current_node(1), current_node(2)) + 1;
            
            queue = cat(1, queue, row);
        end
        
        
        %disp(current_node);
        
        %{
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
        %}
    end
    
    disp(exit_status);
end

