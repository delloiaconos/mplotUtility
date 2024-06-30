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

function mplotSaveFig(figH, outFolder )
    
    SaveFigExt = dictionary( ["epsc", "fig", "png", "jpg", "pdf"], ["eps", "fig", "png", "jpg", "pdf"] );

    if isempty( find(strcmp(who( 'global' ), 'mplotcfg'), 1) )
        error( "MPLOT ERROR: Missing configuration 'mplotcfg'!\n" );
    end
    
    global mplotcfg;
    if ~isfield( mplotcfg, 'SaveFig' ) 
        error( "MPLOT ERROR: Missing configuration field 'mplotcfg.SaveFig'!\n" );
    end

    if ~mplotcfg.SaveFig || ~isfield( mplotcfg, 'SaveFigAs' ) 
        return 
    end

    if ~isa( figH, 'matlab.ui.Figure' )
        error( "MPLOT ERROR: This is not a figure!\n" );
    end
    
    figName = figH.Name;

    if length( figName ) <= 0
        error( "MPLOT ERROR: Figure without 'Name' property!" );
    end
    

    fprintf( "MPLOT: saving '%s'...\n", figName );

    if( exist( outFolder, 'dir' ) == 0 )
        if mplotcfg.CreateOutFolder
            mkdir( outFolder );
        else
            error( "MPLOT ERROR: Output Folder Does NOT Exsists!" );
        end
    end


    for kk=1:length( mplotcfg.SaveFigAs ) 
        figType = mplotcfg.SaveFigAs{kk};
        fName = fullfile( outFolder, sprintf( "%s.%s", figName, SaveFigExt(figType) ) ) ;
        saveas( figH, fName, figType );
    end
    

    if( mplotcfg.CloseFig )
        close( figH );
    end

end

