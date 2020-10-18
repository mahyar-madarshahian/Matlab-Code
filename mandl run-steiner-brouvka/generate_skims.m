function [skims, back_nodes] = generate_skims(skeleton)
n = length(skeleton);
back_nodes = zeros(n,n);
skims = zeros(n,n);
visited = zeros(n,n);
for i = 1:n
    [skims(:,i), back_nodes(:, i), visited(:, i)] = dijkstra(skeleton, i);
end
skims = skims';