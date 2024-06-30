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

 function mplotSaveGif(figName, outFolder, varargin )
%   mplotSaveGif( figName, outFolder )
%   mplotSaveGif( figName, outFolder, 'LoopCount', {LOOP}, 'DelayTime', {DELAY} )
%       Write prapared figures with mplotPrepareGif to a GIF Image into 
%       outFolder
%       
%   figName: string or figure handler
%       Figure Name (used in mplotPrepareGif) or an existing figure handler
%       used for the plot. 
%
%   outFolder: string output folder
%       Output Folder where the GIF will be saved, this folder should contain
%       the created sub-folder for the GIF Images. 
    
    locOpts = dictionary( ["DeleteOrigin", "DeleteExisting", "LoopCount", "DelayTime"], {true, true, Inf, 1} );

    validkeys = locOpts.keys();
    
    idx = 0;
    while idx < (nargin-2)
        idx = idx+1;
	    thisarg = varargin{idx};
	    if ischar(thisarg) || isstring(thisarg) 
            [~,loc] = ismember( lower(thisarg), lower( validkeys ) );
		    if loc > 0
                locOpts{ validkeys(loc) } = varargin{idx+1};
                idx = idx+1;
		    end
	    end
    end

    if isempty( find(strcmp(who( 'global' ), 'mplotcfg'), 1) )
        error( "MPLOT ERROR: Missing configuration 'mplotcfg'!\n" );
    end
    
    global mplotcfg;
    if ~isfield( mplotcfg, 'SaveFig' ) 
        error( "MPLOT ERROR: Missing configuration field 'mplotcfg.SaveFig'!\n" );
    end

    if isa( figName, 'matlab.ui.Figure' )
        figName = figName.Name;
    elseif isa( figName, 'char' ) || isa( figName, 'string' )
        figName = string( figName );
    else
        error( "MPLOT ERROR: This is not a figure Name neither a figure!\n" );
    end
    
    if length( figName ) <= 0
        error( "MPLOT ERROR: Figure without 'Name' property!" );
    end

    if( exist( outFolder, 'dir' ) == 0 )
        mkdir( outFolder );
    end

    inFolder = fullfile( outFolder, sprintf( "%s_PNGs", figName ) );
    if( exist( inFolder, 'dir' ) == 0 )
        fprintf( "MPLOT WARNING: '%s' not prepared for GIF...\n", figName );
        return 
    end

    fprintf( "MPLOT: Exporting '%s' as GIF...\n", figName );

    im = {};
    files =dir( sprintf( '%s/*.png', inFolder) ); 
    for idx=1:length( files )
        fName = fullfile( inFolder, files( idx ).name) ;
        im{idx} = imread( fName );
        
        if locOpts{ 'DeleteOrigin' } == true
            delete( fName );
        end
    end
    
    fName = fullfile( outFolder, sprintf( "%s.gif", figName ) ) ;
    for idx = 1:length( im )
        [Img,map] = rgb2ind(im{idx},256);
        if idx == 1 && locOpts{ 'DeleteExisting' }
            imwrite(Img, map, fName, "gif", ...
                'LoopCount', locOpts{'LoopCount'}, 'DelayTime', locOpts{'DelayTime'} );
        else
            imwrite(Img, map, fName, "gif", "WriteMode", "append", ...
                'DelayTime', locOpts{'DelayTime'} );
        end
    end
    
    if locOpts{ 'DeleteOrigin' } == true 
        rmdir( inFolder );
    end

end

