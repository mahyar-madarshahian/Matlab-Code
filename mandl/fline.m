classdef fline < handle
    %fline Summary of this class goes here
    % fline constructor function for nodes objects
    %
    %      L = fline(Ni,Nj);
    %
    % Create a new object fline located between Ni and Nj, which belong to
    % "node' class.
    %
    %
    % -- Properties --
    % Ni            Initial node
    % Nj            End node
    % length
    % numlane       numbers of lanes
    % Traveltime
    % comments      Comment related to this fline (char)
    % vhandle       Handler on the visual representation (Handler)
    %
    % -- Methods --
    % double   Convert to double
    % plot        Plot nodes on a matlab plot
    %
    % Mahyar Madarshahian ( Email:XXXX@XXXXX)
    % Iran University of Science & Technology - IUST
    %
    % Last Modified:
    % Augest 17, 2012
    
    properties
        Ni = node
        Nj = node
        numlane = 1
        traveltime = 1
        comment
        vhandle
        
    end
    properties(Dependent)
        length
    end
    methods
        
        function l = fline(varargin)
            if nargin == 1
                [nn dim] = size(varargin{:});
                if dim~=2;error('Two nodes are needed');end
                A=varargin{:};
                Ni=A(:,1);if ~isa(Ni,'node');error('input must belong to node class');end;
                Nj=A(:,2);if ~isa(Nj,'node');error('input must belong to node class');end;
                l = []; % One object per node
                for ii=1:nn
                    L = fline;
                    L.Ni = Ni(ii);
                    L.Nj = Nj(ii);
                    l = [l; L]; % Nodes returned in row order
                end
            end
            if nargin == 2 % Supports calling with 0 arguments
                Ni=varargin(1);if ~isa(Ni,'node');Ni=Ni{:};end;
                Nj=varargin(2);if ~isa(Nj,'node');Nj=Nj{:};end;
                [nn dim] = size([Ni,Nj]);
                % Assumes coordinates provided by rows
                l = []; % One object per node
                for ii=1:nn
                    L = fline;
                    L.Ni = Ni(ii);
                    L.Nj = Nj(ii);
                    l = [l; L]; % Nodes returned in row order
                end
            end
            if nargin > 2
                error('To define a fline you need to define two nodes')
            end
        end
        function r = get.length(obj)
            [nn dim]=size([obj]);
            l=[];
            for ii=1:nn;
                L = obj(nn);
                Ni = L.Ni;
                Nj = L.Nj;
                r = sqrt(dot(Nj.coordinates-Ni.coordinates,Nj.coordinates-Ni.coordinates));
                r = [l; r]; % Nodes returned in row order
            end
        end
        function l = plot(varargin);
            % PLOT for fline objects
            %
            %     l = PLOT(l,OPTIONS);
            %
            %  Plot the flines using the fline properties. OPTIONS are as follow
            %
            %  NUMBER       Plot the element number
            %  COLOR        Color for the plots (i.e.  ... 'color','r')
            %         
            %%% Constants %%%
            plotopt = 'b';      % Defult plot options
            plotw = 0.5;
            %%% Flags %%%
            number_flag = 0;
            
            
            l = varargin{1};
            counter2 = 2;
            colorflag = 0;
            for counter = 2:nargin,
                switch lower(varargin{counter2})
                    case 'number'
                        number_flag = 1;
                    case 'color'
                        counter2 = counter2+1;
                        plotopt = varargin{counter2};
                        colorflag = 1;
                    case 'linewidth'
                        counter2 = counter2+1;
                        plotw = varargin{counter2};
                    otherwise
                        error ('Invalid option');
                end
                counter2 = counter2+1;
                if counter2 >= nargin,
                    break
                end
            end
            
            holdbefore = ishold;
            if ~holdbefore,
                clf
            end
            hold on
            [ll dim]=size(l); ni=[];nf=[];
            for i=1:ll
               
                nni=l(i).Ni.coordinates;
                ni=[ni;nni];
                
                nnf=l(i).Nj.coordinates;
                nf=[nf;nnf];
            end
            xni = ni(:,1);
            yni = ni(:,2);
            zni = ni(:,3);
            xnf = nf(:,1);
            ynf = nf(:,2);
            znf = nf(:,3);
            if number_flag
                xnu = (xni+xnf)/2;
                ynu = (yni+ynf)/2;
                znu = (zni+znf)/2;
            end
            
            if colorflag,
                thandle = plot3([xni xnf]',[yni ynf]',[zni znf]','color',plotopt,'flineWidth',plotw);
            else
                thandle = plot3([xni xnf]',[yni ynf]',[zni znf]',plotopt,'lineWidth',plotw);
            end
            
            if number_flag
                for counter=1:length(l),
                    text(xnu(counter),ynu(counter),znu(counter) ...
                        ,num2str(counter),'VerticalAlignment','basefline' ...
                        ,'color',[0 0 1]);
                end
            end
            if holdbefore
                hold on
            else
                hold off
            end
            if nargout == 0,
                clear l
            end
        end
    end
end
    
    
