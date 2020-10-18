function steiner = mat_esh(maseer,steiner)
for ii = 1:length(maseer) - 1
    steiner(maseer(ii),maseer(ii+1)) = 1;
    steiner(maseer(ii+1),maseer(ii)) = 1;
end