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

%%
 %   @file    mplotEND.m
 %   @brief   mplot End file.
 %   @details mplot End file, this script saves every plot.
 %

if( exist( 'mplotOutdir','var') == 0 )
    error( 'MPLOT ERROR: Missing variable "mplotOutdir"!\n' );
end

if( exist( mplotOutdir,'dir') == 0 )
    mkdir( mplotOutdir );
end

if( exist( 'mplotFigs', 'var' ) ~= 0 )
    for mplotKK=1:length(mplotFigs)
        figH      = mplotFigs(mplotKK);
        figName   = get( figH , 'Name' );
        figPath   = strcat( mplotOutdir, '/', figName);
        
        fprintf( 'Saving: %s...\n', figName );
        
        if( mplotCnf.SaveAs.Jpg )
            saveas( figH, figPath, 'jpg' );
        end
        
        if( mplotCnf.SaveAs.Eps )
            saveas( figH, figPath, 'epsc' );
        end
        
        if( mplotCnf.SaveAs.Fig )
            saveas( figH, figPath, 'fig' );
        end
        
        if( mplotCnf.CloseFig )
            close( figH );
        end
    end
else 
    disp( 'MPLOT ERROR: Missing variable "mplotFigs"!\n' );
    break;
end

clear mplotKK figH figName figPath;

% Optional...
clear mplotOutdir mplotFigs;
