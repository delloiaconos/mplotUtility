%% 
 % mplotUtility: MATLAB Plot Common Comfiguration Utilities 
 % Copyright (C) 2013, 2024 Salvatore Dello Iacono
 %
 %
 % This is free software; you can redistribute it and/or modify
 % it under the terms of the GNU General Public License as published by
 % the Free Software Foundation; either version 3 of the License, or
 % (at your option) any later version.
 %
 % This is distributed in the hope that it will be useful,
 % but WITHOUT ANY WARRANTY; without even the implied warranty of
 % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 % GNU General Public License for more details.
 %
 %  You should have received a copy of the GNU General Public License
 %  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 %

function mplotSaveFig(fig, outFolder )
    
    SaveFigExt = dictionary( ["epsc", "fig", "png", "jpg"], ["eps", "fig", "png", "jpg"] );
    SaveFigAs = { "epsc" };

    if ~isa( fig, 'matlab.ui.Figure' )
        error( "This is not a figure!" );
    end
    
    figName = fig.Name;

    if length( figName ) <= 0
        error( "Figure without 'Name' property!" );
    end

    for kk=1:length( SaveFigAs ) 
        figType = SaveFigAs{kk};
        fName = fullfile( outFolder, sprintf( "%s.%s", figName, SaveFigExt(figType) ) ) ;
        saveas( fig, fName, figType );
    end

end

