clear all
clc
mashhad_network = load('mashhad Network.txt');
mashhad_graph = build_skeleton(mashhad_network,1);
[skims, back_nodes] = generate_skims(mashhad_graph);
steiner = steiner_3(back_nodes);
[skims, st_back] = generate_skims(steiner);

            