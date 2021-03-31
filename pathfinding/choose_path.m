function [result] = choose_path(map, path, n_neighbors)
    result = [path(1, :)];
    target = path(end, :);
    
    fullPath = path;
    
    bestNeighbor = path(1, :);
    prevBestNeighbor = [];
    bestDist = Inf;
    
    while ~isequal(bestNeighbor, target)
        neighbors = nearest_neighbours(map, bestNeighbor, n_neighbors);
        
        prevBestNeighbor = bestNeighbor;
        
        for i = 1:size(neighbors, 1)
            row = neighbors(i,:);
            
            for j = 1:size(path, 1)
                if row(1,1) == path(j, 1) && row(1,2) == path(j, 2)
                    dist = sqrt((row(1,1)-target(1,1))^2 + (row(1,2)-target(1,2))^2);
            
                    if dist <= bestDist
                        bestDist = dist;
                        bestNeighbor = row;
                    end
                end
            end
        end
        
        if isequal(prevBestNeighbor, bestNeighbor) 
            for j = 1:size(fullPath, 1)
                if row(1,1) == fullPath(j, 1) && row(1,2) == fullPath(j, 2)
                    dist = sqrt((row(1,1)-target(1,1))^2 + (row(1,2)-target(1,2))^2);
            
                    if dist <= bestDist
                        bestDist = dist;
                        bestNeighbor = row;
                    end
                end
            end
            result(end+1, :) = bestNeighbor;
        end
        
        [x, ~] = find(path(:, 1)==bestNeighbor(1,1)&path(:, 2)==bestNeighbor(1,2));
        path(x,:)=[];
        result(end+1, :) = bestNeighbor;
        bestDist = Inf;
    end
    
end

