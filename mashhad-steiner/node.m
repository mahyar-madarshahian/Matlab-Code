classdef node < handle
    % NODE constructor function for nodes objects
    %
    %      N = NODE;
    %      N = NODE([X Y Z]);
    %
    % Create a new object node located at the X, Y and Z
    % coordinates. If X, Y and Z are not specified the node
    % is created at (0,0,0).
    %
    % -- Properties --
    % coordinates    [X Y Z] coordinates of the node (1x3 vector)
    % comments      Comment related to this node (char)
    % vhandle          Handler on the visual representation (Handler)
    %
    % -- Methods --
    % double   Convert to double
    % plot        Plot nodes on a matlab plot
    % find        Find node with specific coordinates
    % pluss        Adds two sets of nodes
    % minus1     Substract two nodes objects.
    % mirror    Creates a mirror image of the specified nodes.
    %
    % Mahyar Madarshahian ( Email:XXXX@XXXXX)
    % Iran University of Science & Technology - IUST
    %
    % Last Modified:
    % Augest 17, 2012
    %
    
    properties
        coordinates = [0 0 0]
        comments
        vhandle
    end
    
    methods
        % NODE class constructor
        function n = node(coordinates)
            if nargin>0 % Supports calling with 0 arguments
                [nn dim] = size(coordinates);
                % If no spatial nodes are provided, fills with zeros
                if dim<3
                    coordinates = [coordinates zeros(nn,3-dim)];
                end
                
                % Assumes coordinates provided by rows
                n = []; % One object per node
                for ii=1:nn
                    N = node;
                    N.coordinates = coordinates(ii,:);
                    n = [n; N]; % Nodes returned in row order
                end
            end
        end
        function varargout = plot(varargin)
            if or(nargin<1,nargin>4)
                error ('Wrong number of inputs')
            end
            
            % See what kind of plot is needed
            n = varargin{1};
            number = 0;
            comment = 0;
            opt = 'k.';     % Default option
            for i=2:nargin,
                switch lower(varargin{i})
                    case 'number'
                        number = 1;
                    case 'comment'
                        comment = 1;
                    otherwise
                        % Graphical options are no longer acepted through this method,
                        % instead use 'vhandle'.
                        error('Invalid plot option.')
                end
            end
            
            % Plot the nodes
            lasthold = ishold;
            if ~lasthold,
                cla
            end
            
            hold on;
            nn = length(n);
            for ii=1:nn
                coord = n(ii).coordinates;
                x = coord(1);
                y = coord(2);
                z = coord(3);
                plotopt = 'k.';
                vhandle = plot3(x,y,z,plotopt);
                n(ii).vhandle = vhandle;
                
                if number
                    text(x,y,z,sprintf(' %i',ii) ...
                        ,'VerticalAlignment','baseline');
                end
                
                if comment
                    cmnt = n(ii).comment;
                    text(x,y,z,sprintf(' %s',cmnt) ...
                        ,'VerticalAlignment','cap','color',get(n(ii).vhandle,'color'));
                end
            end
            
            if ~lasthold
                hold off
            end
            
            % Make axis equal
            axis equal
            
            if nargout
                varargout{1} = n;
            end
        end
        function d = double(n)
            % DOUBLE Converts node to double.
            %    d = double(n)
            %
            % The result is a matrix with the following columns
            % <NODE #>  <X>  <Y>  <Z>
            
            nn = length(n);
            coordinates = reshape([n.coordinates],3,nn)';
            d = [[1:nn]' coordinates];
        end
        function indxa = find(n,coord,varargin)
            % FIND node objects
            %
            %    INDX = FIND(N,COORD)
            %    INDX = FIND(N,COORD,'CLOSEST')
            %    INDX = FIND(N,COORD,'CLOSEST',TOL)
            %
            % Returns the indices of N where N(INDX) has the specific
            % coodinates specified by COORD, where COORD is a vector with 3
            % elements. If the option 'closest' is used, FIND attemps to
            % find the indices of the nodes N closest to the specified
            % coordinates within a tolerance TOL. TOL is a percentage of
            % the smallest distance between nodes, 1% by default. When no
            % node is found, a NaN is returned.
            %
            
            %
            opc = false;
            tol = 0.01;
            switch nargin
                case {3,4}
                    opc = strcmpi(varargin{1},'closest');
                    if nargin>3
                        tol = varargin{2};
                    end
            end
            
            nn = length(n);
            coords = reshape([n.coordinates],3,nn)';
            x = coords(:,1);
            y = coords(:,2);
            z = coords(:,3);
            
            dist = 0;
            if opc
                C = nchoosek(1:nn,2);
                Ni = C(:,1);
                Nj = C(:,2);
                dists = sqrt((x(Nj)-x(Ni)).^2+(y(Nj)-y(Ni)).^2+(z(Nj)-z(Ni)).^2);
                dist = min(dists);
            end
            
            indxa = [];
            for counter = 1:size(coord,1)
                indxxup = x<=coord(counter,1)+tol*dist;
                indxxlo = x>=coord(counter,1)-tol*dist;
                indxx = indxxup .* indxxlo;
                
                indxyup = y<=coord(counter,2)+tol*dist;
                indxylo = y>= coord(counter,2)-tol*dist;
                indxy = indxyup .* indxylo;
                
                indxzup = z<= coord(counter,3)+tol*dist;
                indxzlo = z>= coord(counter,3)-tol*dist;
                indxz = indxzup .* indxzlo;
                
                indx = indxx.*indxz.*indxz;
                indx = find(indx);
                if isempty(indx)
                    indx = NaN;
                elseif length(indx)>1
                    % If multiple results are obtained, chooses the closest one
                    dists = sqrt((x(indx)-coord(counter,1)).^2+...
                        (y(indx)-coord(counter,2)).^2+...
                        (z(indx)-coord(counter,3)).^2);
                    [mind idx] = min(dists);
                    indx = indx(idx);
                end
                indxa = [indxa;indx];
            end
            
            
        end
         end
end
