function n = mirror(n,origin,axis,option)
% MIRROR Creates a mirror image of the specified nodes.
%
%   N = MIRROR(N,[X Y Z],AXIS,OPTION);
%
% Creates a mirror of the object N with respect to the specified AXIS.  The
% vector [X Y Z] is used to measure the distance of the mirror.  AXIS can be
% either 'X', 'Y' or 'Z' and correspond to axis perpendicular to themirror.
% If OPTION is 'new' the original nodes from N.  Duplicate nodes are
% automatically deleted from the mirrored portion.
%
%

if ~exist('option'),
    option = 'none';
end

numel = length(n);
coords = reshape([n.coordinates],3,numel)';
x = coords(:,1); y = coords(:,2); z = coords(:,3);
bc = reshape([n.bc],6,numel)';
cdof = reshape([n.cdof],6,numel)';

switch upper(axis)
    case 'X'
        x = 2*origin(1)-x;
    case 'Y'
        y = 2*origin(2)-y;
    case 'Z'
        z = 2*origin(3)-z;
end

if ~strcmpi(option,'new'),
    % Delete double nodes
    todelete = zeros(1,length(x));
    for counter = 1:length(x);
        n(counter).coordinates
        indx = find(n,[x(counter) y(counter) z(counter)]);
        if ~isnan(indx),
            todelete(counter) = 1;
        end
    end
    indx = find(todelete);
    x(indx) = [];
    y(indx) = [];
    z(indx) = [];
    bc(indx,:) = [];
    cdof(indx,:) = [];
end

newcoords = [x y z];
nn = size(newcoords,1);
newn = node(newcoords);
for ii=1:nn
    newn(ii).bc = bc(ii,:);
    newn(ii).cdof = cdof(ii,:);
end

if strcmpi(option,'new')
    n = newn;
else
    n = [n(:)]; % Makes sure to have column-ordered nodes
    n = [n; newn];
end
