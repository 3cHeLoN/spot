%opDiag   Diagonal matrix.
%
%   opDiag(D) creates an operator for multiplication by the
%   diagonal matrix with D on its diagonal.

%   Copyright 2009, Ewout van den Berg and Michael P. Friedlander
%   http://www.cs.ubc.ca/labs/scl/sparco
%   $Id: opDiag.m 39 2009-06-12 20:59:05Z ewout78 $

classdef opDiag < opSpot

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Properties
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties (SetAccess = private)
       diag = []; % Diagonal entries
    end % Properties


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Methods - Public
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods
        
        % Constructor
        function op = opDiag(d)
           if nargin ~= 1
              error('Invalid number of arguments.');
           end
           
           % Vectorize d and get size
           d = d(:);
           n = length(d);
           
           % Construct object
           op = op@opSpot('Diag',n,n);
           op.cflag      = ~isreal(d);
           op.linear     = 1;
           op.diag       = d;
           op.precedence = 1;
        end
        
    end % Methods

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Methods - protected
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods( Access = protected )
       
        % Multiplication
        function y = multiply(op,x,mode)
            if mode == 1
               y = op.diag.*x;
            else
               y = conj(op.diag).*x;
            end
        end
      
    end % Methods
        
end % Classdef