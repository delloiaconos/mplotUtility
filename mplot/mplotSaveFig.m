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
    
    % Local Configuration Dictionary and structure
    SaveFigExt = dictionary( ["epsc", "fig", "png", "jpg", "pdf"], ["eps", "fig", "png", "jpg", "pdf"] );
    locFields = [ "SaveFig", "SaveFigAs", "CreateOutFolder", "OutputFolder", "CloseFig" ];
    locOpts = struct();
    
    vkindex = [];

    % Check if configuration has been passed or get global configuration
    loc =  find( cellfun(@(v) ( isstring(v) || ischar(v) ) && all( strcmpi( 'mplotcfg', v ) ), varargin) );
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
        elseif isfield( globcfg, field ) 
            locOpts.(field) = globcfg.(field);
        else
            error( "MPLOT ERROR: Missing configuration field '%s'!\n", field );
        end
    end
    
    % Check if the first argument is the correct type
    if ~isa( figH, 'matlab.ui.Figure' )
        error( "MPLOT ERROR: This is not a figure!\n" );
    end
    
    figName = figH.Name;
    if length( figName ) <= 0
        error( "MPLOT ERROR: Figure without 'Name' property!" );
    end

    if ~locOpts.SaveFig 
        fprintf( "MPLOT: NOT saving '%s'...\n", figName );
        return 
    else 
        fprintf( "MPLOT: saving '%s'...\n", figName );
    end

    if ~isfolder( locOpts.OutputFolder ) 
        if locOpts.CreateOutFolder 
            mkdir( locOpts.OutputFolder );
        else
            error( "MPLOT ERROR: Output Folder Does NOT Exsists!" );
        end
    end

    for kk=1:length( locOpts.SaveFigAs ) 
        figType = locOpts.SaveFigAs{kk};
        if ismember( figType, SaveFigExt.keys() )
            fName = fullfile( locOpts.OutputFolder, sprintf( "%s.%s", figName, SaveFigExt(figType) ) ) ;
            saveas( figH, fName, figType );
        else
            fprintf(  "MPLOT WARNING: Unrecognized figure output format '%s'!\n", figType );
        end
    end
    
    if( locOpts.CloseFig )
        close( figH );
    end

end

