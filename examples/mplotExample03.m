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
 %   @file    mplotExample03.m
 %   @brief   mplot Example 03.
 %   @details mplot Example file, create a GIF by iterating on multiple
 %   figures
 %
 
clear all;
close all;
clc;

%% Configure MPLOT
addpath( '../mplot' );

% Start mplotUtility
run( 'mplotBEGIN' );

mplotOutdir = './figures/';

%%  *********************************************************************   
 %                         MPLOT: Example 3
 %  *********************************************************************  

% Examples Vectors
Ts = 0.001;
DeltaT = 0.05;
Tmax = 1.0;
t = 0:Ts:Tmax;
y1 = 0.7*sin( 2*pi*3*t + pi/4);
y2 = 1.1*sin( 2*pi*(3+5.0.*t).*t + pi/3);

% Plot preparation
figName     = 'Example3';
figTitle    = 'Example 3';

xLimits = [0,1];
yLimits = [-1.5, 1.5];

disp( ['-> Plotting: "', figTitle, '"'] );

for tstop=DeltaT:DeltaT:max(t)
    fig = figure( 'Name', figName, mplotcfg.opt.Figure{:}, 'Visible', 'off' );
        
        imax = find( t <= tstop, 1, 'last' );
        plot( t(1:imax), y1(1:imax), 'b', 'DisplayName'  , '$y_1(t)$', mplotcfg.opt.Plot{:} );
        hold on;
        plot( t(1:imax), y2(1:imax), 'r', 'DisplayName'  , '$y_2(t)$', mplotcfg.opt.Plot{:} );
    
        legend('show',  mplotcfg.opt.Legend{:}, 'Location', 'northeast' );
        
        set( gca, mplotcfg.opt.Axis{:} );
        title( figTitle, mplotcfg.opt.Title{:});

        xlabel( 'Time [s]', mplotcfg.opt.Axis{:} );
        xlim( xLimits );

        ylabel( 'Amplitude', mplotcfg.opt.Axis{:} );
        ylim( yLimits );

    mplotPrepareGif( fig, mplotOutdir, tstop/DeltaT );
end

mplotSaveGif( figName, mplotOutdir, 'DeleteOrigin', false, 'LoopCount', 2, 'DelayTime', 0.5 );
clear figName figTitle fig hh tstop imax;


%% END PLOTTING
run( 'mplotEND' );             
rmpath( '../mplot' );
