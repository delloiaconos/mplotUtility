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

 function mplotSaveFig( figH, varargin )
%   mplotSaveFig( figH )
%   mplotSaveFig( figH, outFolder )
%   mplotSaveFig( figH, 'mplotcfg', {CONFIGURATION} )
%       Exports a prepared figure
%       
%   figH: figure handler
%       Figure Handler to be exported.
%
%   outFolder: string output folder
%       Output Folder where the fig will be saved (overloads the
%       configuration)
      
    SaveFigExt = dictionary( ["epsc", "fig", "png", "jpg", "pdf"], ["eps", "fig", "png", "jpg", "pdf"] );
    
    vkindex = [];
    loc =  find( cellfun(@(v) ( isstring(v) || ischar(v) ) && strcmpi( 'mplotcfg', v ), varargin) );
    if loc > 0 && loc <= nargin-2
        globcfg = varargin{loc+1};
        vkindex = [vkindex loc loc+1];
    else
        if isempty( find(strcmp(who( 'global' ), 'mplotcfg' ), 1) ) 
            error( "MPLOT ERROR: Missing configuration 'mplotcfg'!\n" );
        end

        global mplotcfg;
        globcfg = mplotcfg;
    end

    if ~isa( globcfg, 'struct' )
        error( "MPLOT ERROR: Configuration 'mplotcfg' must be a structure!\n" );
    end

    if ~isfield( globcfg, 'SaveFig' ) 
        error( "MPLOT ERROR: Missing configuration field 'mplotcfg.SaveFig'!\n" );
    end

    if nargin-1 > 1 && ~ismember( 1, vkindex ) && ...
        ( isstring( varargin{1} ) || ischar( varargin{1} ) )
        outFolder = varargin{1};
    else
        if ~isfield( globcfg, 'OutputFolder' ) 
            error( "MPLOT ERROR: Missing configuration field 'mplotcfg.OutputFolder'!\n" );
        end
        outFolder = globcfg.OutputFolder;
    end
    
    if ~globcfg.SaveFig || ~isfield( globcfg, 'SaveFigAs' ) 
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
        if globcfg.CreateOutFolder
            mkdir( outFolder );
        else
            error( "MPLOT ERROR: Output Folder Does NOT Exsists!" );
        end
    end

    for kk=1:length( globcfg.SaveFigAs ) 
        figType = globcfg.SaveFigAs{kk};
        fName = fullfile( outFolder, sprintf( "%s.%s", figName, SaveFigExt(figType) ) ) ;
        saveas( figH, fName, figType );
    end
    
    if( globcfg.CloseFig )
        close( figH );
    end

end

