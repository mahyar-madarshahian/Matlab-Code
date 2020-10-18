clear all
clc
kashan_network = load('kashan Network.txt');
kashan_graph = build_skeleton(kashan_network,1);
[skims, back_nodes] = generate_skims(kashan_graph);
steiner = steiner_2(back_nodes);
for i = 1:34
    for j = 1:34
        if steiner(j,i) == 1
            steiner(i,j) = 0;
        end
    end
end

            