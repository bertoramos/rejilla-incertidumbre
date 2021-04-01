function [result] = choose_path(map, origin, target, n_neighbors)
    result = [target];
    
    bestNeighbor = target;
    
    while ~isequal(bestNeighbor, origin)
        neighbors = neighbours_cost(map, bestNeighbor, n_neighbors);
        
        
        bestDist = map(bestNeighbor(1), bestNeighbor(2));
        for i = 1:size(neighbors, 1)
            row = neighbors(i,:);
            
            dist = map(row(1), row(2));
            
            if dist <= 1
                continue
            end

            if dist <= bestDist
                bestDist = dist;
                bestNeighbor = row;
            end
        end
        
        result(end+1, :) = bestNeighbor;
        
    end
    
end

