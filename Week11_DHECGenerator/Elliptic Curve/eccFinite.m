function [X, Y] = eccFinite(varargin)
    % Set default values
    a = -1;
    b = 1;
    p = 23;
    low = -10;
    high = 10;
    points = 1000;

    % Override default values with user inputs
    if nargin >= 1
        a = varargin{1};
    end
    if nargin >= 2
        b = varargin{2};
    end
    if nargin >= 3
        p = varargin{3};
    end
    if nargin >= 4
        low = varargin{4};
    end
    if nargin >= 5
        high = varargin{5};
    end
    if nargin >= 6
        points = varargin{6};
    end
    % generates and returns an elliptic curve of parameters a and b 
% p is a prime number
% low and high are ranges in the plot
[x,y] = meshgrid(linspace(low,high,points));
[cm,~] = contour(x,y,mod(y.^2,p) - mod(x.^3 - x*a - b,p),'LevelList',0);
contourTable = getContourLineCoordinates(cm);
ct = table2array(contourTable);
X = ct(:,3);
Y = ct(:,4);

   
end

