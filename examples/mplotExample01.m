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
 %   @file    mplotExample01.m
 %   @brief   mplot Example 1 file.
 %   @details mplot Example file, this script is a simple example of how to use mplot.
 %
 
clear all;
close all;
clc;

addpath( '../mplot' );



%% Configure PLOTTING
run( 'mplotCONFIGS' );
mplotOutdir = './figures/';

%% Begin PLOTTING
run( 'mplotBEGIN' );


%%  *********************************************************************   
 %                         MPLOT: Example 1
 %  *********************************************************************  

% Examples Vectors
x = 1:1:100;
y1 = 1.9*x;
y2 = 2.1*x;

% Figure generation
figName     = 'Example01';
figTitle    = 'Example 1';

fprintf( ['-> Plotting: "', figTitle, '"'] );

fig = figure( 'Name', figName, mplotcfg.opt.Figure{:} );
    
    plot( x, y1, 'b', 'DisplayName'  , '$I_a$', mplotcfg.opt.Plot{:} );
    hold on;
    plot( x, y2, 'r', 'DisplayName'  , '$I_b$', mplotcfg.opt.Plot{:} );

    ll = legend('show', 'Location', 'best' );
    set( ll, mplotcfg.opt.Legend{:} );
    set( gca, mplotcfg.opt.Axis{:} );
    title( figTitle, mplotcfg.opt.Title{:});
    xlabel( 'X', mplotcfg.opt.Axis{:} );
    ylabel( 'Y', mplotcfg.opt.Axis{:} );
        
mplotSaveFig( fig, mplotOutdir );
    
clear figName figTitle fig hh ll;



%% END PLOTTING
run( 'mplotEND' );             
rmpath( '../mplot' );
