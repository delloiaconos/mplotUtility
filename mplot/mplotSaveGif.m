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

 function mplotSaveGif(figName, varargin )
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
    
    % Local Configuration Dictionary and structure
    defaultOpts = dictionary( ["DeleteOrigin", "DeleteExisting", "LoopCount", "DelayTime"],...
                          { true, true, Inf, 1} );
    locFields = [ defaultOpts.keys()', "CreateOutFolder", "OutputFolder" ];
    locOpts = struct();
    
    vkindex = [];

    % Check if configuration has been passed or get global configuration
    loc =  find( cellfun(@(v) ( isstring(v) || ischar(v) ) && strcmpi( 'mplotcfg', v ), varargin) );
    if ~isempty(loc) && (loc <= nargin-2)
        globcfg = varargin{loc+1};
        vkindex = [vkindex loc loc+1];
    else
        if isempty( find(strcmp(who( 'global' ), 'mplotcfg' ), 1) ) 
            error( "MPLOT ERROR: Missing configuration 'mplotcfg'!\n" );
        end

        global mplotcfg;
        globcfg = mplotcfg;
    end

    % Check if globcfg is the correct type
    if ~isa( globcfg, 'struct' )
        error( "MPLOT ERROR: Configuration 'mplotcfg' must be a structure!\n" );
    end

    % Check if the first argument is the output folder
    if (nargin >= 2) && ~ismember( 1, vkindex ) && ...
        ( isstring( varargin{1} ) || ischar( varargin{1} ) ) && ... 
        ~ismember( varargin{1}, locFields )
        varargin = [{"OutputFolder"}, varargin ];
    end

    % Check if any field is present
    for idx=1:length(locFields)
        field = locFields(idx);
        loc =  find( cellfun(@(v) ( isstring(v) || ischar(v) ) && strcmpi( field, v ), varargin ) );
        if ~isempty(loc) && ~ismember(loc, vkindex) && (loc <= nargin-1) 
            locOpts.(field) = varargin{loc+1};
            vkindex = [vkindex loc loc+1];
        elseif ismember( field, defaultOpts.keys )
            locOpts.(field) = cell2mat( defaultOpts(field) );
        elseif isfield( globcfg, field ) 
            locOpts.(field) = globcfg.(field);
        else
            error( "MPLOT ERROR: Missing configuration field '%s'!\n", field );
        end
    end

    
    if isa( figName, 'matlab.ui.Figure' )
        figName = figName.Name;
    elseif isstring( figName ) || ischar( figName )
        figName = string( figName );
    else
        error( "MPLOT ERROR: This is not a figure handler neither a name!\n" );
    end
    
    if length( figName ) <= 0
        error( "MPLOT ERROR: Figure without 'Name' property!" );
    end

    if ~isfolder( locOpts.OutputFolder ) 
        if locOpts.CreateOutFolder 
            mkdir( locOpts.OutputFolder );
        else
            error( "MPLOT ERROR: Output Folder Does NOT Exsists!" );
        end
    end

    inFolder = fullfile( locOpts.OutputFolder, sprintf( "%s_PNGs", figName ) );
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
        
        if locOpts.DeleteOrigin == true
            delete( fName );
        end
    end
    
    fName = fullfile( locOpts.OutputFolder, sprintf( "%s.gif", figName ) ) ;
    for idx = 1:length( im )
        [Img,map] = rgb2ind(im{idx},256);
        if idx == 1 && locOpts.DeleteExisting
            imwrite(Img, map, fName, "gif", ...
                'LoopCount', locOpts.('LoopCount'), 'DelayTime', locOpts.('DelayTime') );
        else
            imwrite(Img, map, fName, "gif", "WriteMode", "append", ...
                'DelayTime', locOpts.('DelayTime') );
        end
    end
    
    if locOpts.DeleteOrigin == true 
        rmdir( inFolder );
    end

end

