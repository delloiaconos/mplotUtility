function rectPos = mplotRec2Pos( ax, xlim, ylim, rect )
%MPLOT_REC2POS mplotUtility converts rectangle (in data units) to position.
%   This function converts the input rectangle [x y w h] array expressed in 
%   the axis coordinates to an absolute position rectangle referenced to the 
%   axis.
    pos = mplotPoint2Pos( ax, xlim, ylim, rect(1:2) );
    rectPos = [pos(1), pos(2), rect(3)/abs(diff(xlim)), rect(4)/abs(diff(ylim)) ];
end

