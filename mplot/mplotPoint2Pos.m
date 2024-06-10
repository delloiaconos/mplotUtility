function position = mplotPoint2Pos( ax, xlim, ylim, point )
%MPLOT_POINT2POS mplotUtility converts point (in data units) to position.
%   This function converts the input point expressed in the axis coordinates
%   to an absolute position referenced to the axis.
     xCoord = point(1);
     yCoord = point(2);
     pos = get( ax, 'Position');
     xPos = (xCoord - min(xlim))/diff(xlim)*pos(3) + pos(1); 
     yPos = (yCoord + abs(min(ylim)))/diff(ylim)*pos(4) + pos(2);
     position = [ xPos, yPos ];
end

