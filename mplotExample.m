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
 %   @file    mplotExample.m
 %   @brief   mplot Example file.
 %   @details mplot Example file, this script is an example of how to use mplot.
 %
 
clear all;
close all;
clc;

addpath( './mplot' );

% Examples Vectors
x = 1:1:100;
y1 = 1.9*x;
y2 = 2.1*x;

%% Configure PLOTTING
run( 'mplotCONFIGS' );
%% Begin PLOTTING
run( 'mplotBEGIN' );


%%  *********************************************************************   
 %                         PLOT: Example 1
 %  *********************************************************************  

figName     = 'Example1';
figTitle    = 'Example 1';

disp( ['-> Plotting: "', figTitle, '"'] );
fig = figure( 'Name', figName, 'NumberTitle', 'off' );
hh  = gca;
set( hh,   'FontName', mplotCnf.Figure.FontName, ...
           'FontSize', mplotCnf.Figure.FontSize );

plot( x, y1, 'b', 'DisplayName'  , 'I_a', ...
                  'LineWidth'    , mplotCnf.Plot.LineWidth, ...
                  'MarkerSize'   , mplotCnf.Plot.MarkerSize );
hold on;
plot( x, y2, 'r', 'DisplayName'  , 'I_b', ...
                  'LineWidth'    , mplotCnf.Plot.LineWidth, ...
                  'MarkerSize'   , mplotCnf.Plot.MarkerSize );


ll = legend('show', 'Location', 'best' );
set( ll, 'FontSize'   , mplotCnf.Legend.FontSize, ...
         'TextColor'  , mplotCnf.Legend.TextColor );
               
            
title( figTitle, 'FontSize', mplotCnf.Title.FontSize );


xlabel( 'X',  'FontSize'    , mplotCnf.Axis.FontSize, ...
              'Color'       , mplotCnf.Axis.Color );
ylabel( 'Y',  'FontSize'    , mplotCnf.Axis.FontSize, ...
              'Color'       , mplotCnf.Axis.Color );
    
mplotFigs(end+1) = fig;
clear figName figTitle fig hh ll;



%% END PLOTTING
mplotOutdir = './example/';
run( 'mplotEND' );             

rmpath( './mplot' );
