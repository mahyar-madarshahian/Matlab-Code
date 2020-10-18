clear all
clc
mandl_network = load('mandl network.txt');
mandl_graph = build_skeleton(mandl_network,1);
[skims, back_nodes] = generate_skims(mandl_graph);
steiner = steiner_2(back_nodes);
for i = 1:15
    for j = 1:15
        if steiner(j,i) == 1
            steiner(i,j) = 0;
        end
    end
end

            