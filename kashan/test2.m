clear all
clc
kashan_network = load('kashan Network.txt');
kashan_graph = build_skeleton(kashan_network,1);
[skims, back_nodes] = generate_skims(kashan_graph);
steiner = steiner_3(back_nodes);
[skims, st_back] = generate_skims(steiner);
            