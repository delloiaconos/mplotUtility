function xPos = mplotX2Pos( ax, xlim, ylim, val )
%MPLOT_X2POS mplotUtility converts x coordinate (in data units) to position.
%   This function converts the input x coordinate expressed in the axis 
%   coordinates to an absolute position referenced to the axis.
    
    xPos = zeros( 1, length( val ) );
    for kk=1:length(val) 
        pos = mplotPoint2Pos( ax, xlim, ylim, [val(kk) ylim(1)] );
        xPos(kk) = pos(1);
    end

end

