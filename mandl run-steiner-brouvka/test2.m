clear all
clc
mandl_network = load('mandl Network.txt');
mandl_graph = build_skeleton(mandl_network,1);
[skims, back_nodes] = generate_skims(mandl_graph);
steiner = steiner_3(back_nodes);
[skims, st_back] = generate_skims(steiner);

            