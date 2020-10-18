function n3 = minus1(n1,n2)
% minus1 Substract two nodes objects.
%
%   N3 = N1-N2
%
% N3 is a node class object with the same number of elements of N1 and N2.
% The resulting coordinates of N3 are the same as the coordinates of N1
% minus1 the coordinates of N2.
%
%

% Check that the length of both nodes is the same.
numel_1 = length(n1);
numel_2 = length(n2);
if numel_1 ~= numel_2
    error ('Different nodes numbers');
end

% Get the new coordinates
coordinates_1 = reshape([n1.coordinates],3,numel_1)';
coordinates_2 = reshape([n2.coordinates],3,numel_2)';
coordinates_dif = coordinates_1 - coordinates_2;
n3 = node(coordinates_dif);

