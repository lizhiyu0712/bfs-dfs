function [nodeList, result] = dls(source, target, startNode, targetNode, depth)

nodeList = startNode;
result = 0;

if startNode == targetNode
    result = 1;
    return
elseif depth == 0
    return
end

children = getChildren(source, target, startNode);
for i = 1:numel(children)
    [nl, r] = dls(source, target, children(i), targetNode, depth-1);
    nodeList = [nodeList nl];
    if r == 1
        result = 1;
        return
    end
end

end

function children = getChildren(source,target,node)
    children = target(source==node);
end

% source = [1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 5, 15, 15, 15];
% target = [3, 5, 4, 2, 6, 10, 7, 9, 8, 14, 11, 12, 13, 15, 17, 16, 18];
% nodeList2 = dls(source, target, 1, 15, 2);
% 
% nodeList3 = [];
% for L = 0:2
%     nodeList3 = [nodeList3, dls(source, target, 1, 15, L)];
% end