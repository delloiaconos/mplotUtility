function yPos = mplotY2Pos( ax, xlim, ylim, val )
%MPLOT_Y2POS mplotUtility converts y coordinate (in data units) to position.
%   This function converts the input y coordinate expressed in the axis 
%   coordinates to an absolute position referenced to the axis.
    yPos = zeros( 1, length( val ) );
    for kk=1:length(val) 
        pos = mplotPoint2Pos( ax, xlim, ylim, [xlim(1) val(kk)] );
        yPos(kk) = pos(2);
    end
end

