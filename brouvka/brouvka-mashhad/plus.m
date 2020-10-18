function [c,indx] = plus(a,b)
% PLUS adds two sets of nodes
%
%      C = A+B;
%      [C,INDX] = A + B;
%
% C contains the nodes of A plus the nodes of B, where A, B and C are node
% objects.  Nodes at the same location are deleted.  INDX is a 3xn matrix
% where n is the total number of nodes of C.  The first column contains the
% the index of the nodes of A corresponding to each new node on C, the
% second column the index of the nodes of B and the third column the
% location of the nodes of C.
%

%% Creating the INDX matrix that show the correspondence of each DOF
numel_a = length(a);
numel_b = length(b);
coordinates_a = reshape([a.coordinates],3,numel_a)';
coordinates_b = reshape([b.coordinates],3,numel_b)';
tmpindx = find(a,coordinates_b);
nnewidx = isnan(tmpindx);
nnew = sum(nnewidx);
indx = zeros(numel_a+nnew,3);
indx(1:numel_a,1) = [1:numel_a]';
indx(numel_a+1:numel_a+nnew,2) = [find(nnewidx)]';
indx(:,3) = [1:size(indx,1)]';
indx(:,3) = [1:size(indx,1)]';

%% Creating the new node objects
coordinates_c = zeros(size(indx,1),3);
a_indx = indx(:,1) ~= 0;
coordinates_c(a_indx,:) = coordinates_a;
b_indx = indx(:,2) ~= 0;
coordinates_c(b_indx,:) = coordinates_b(nnewidx,:);
c = node(coordinates_c);

end
