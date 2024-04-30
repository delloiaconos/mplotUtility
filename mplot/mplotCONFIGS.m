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
 %   @file    mplotCONFIG.m
 %   @brief   mplot Configuration file.
 %   @details mplot Configuration file, this script contains every
 %   configuration for Plotting part.
 %

global mplotCnf;

%%  *********************************************************************   
 %                        FIGURE CONFIGURATION
 %  *********************************************************************  

%mplotCnf.Figure.FontName        = 'Helvetica';

mplotCnf.opt.Figure = { 'NumberTitle', 'off', 'Visible', 'on' }; %'WindowStyle', 'docked'

%%  *********************************************************************   
 %                         PLOT CONFIGURATION
 %  *********************************************************************  


mplotCnf.opt.Plot = { 'LineWidth',  2, ...
                      'MarkerSize', 10 };

mplotCnf.opt.XLine = { 'interpreter',   'latex', ...
                       'FontSize',      10, ...
                       'LabelHorizontalAlignment', 'center'};

%%  *********************************************************************   
 %                         AXIS CONFIGURATION
 %  *********************************************************************  

mplotCnf.opt.Axis =  { 'FontName',  'Times', ...
                       'FontSize',  12 };


mplotCnf.opt.Label = { 'interpreter',   'latex', ...
                       'FontName',      'Times', ...
                       'FontSize',      12 };

%%  *********************************************************************   
 %                         TITLE CONFIGURATION
 %  *********************************************************************  

mplotCnf.opt.Title = { 'interpreter',   'latex', ...
                       'FontName',      'Times', ...
                       'FontSize',      16 }; 

%%  *********************************************************************   
 %                        LEGEND CONFIGURATION
 %  *********************************************************************  

mplotCnf.opt.Legend = { 'TextColor',    'black', ...
                        'FontName',     'Times', ...
                        'FontSize',     12, ... 
                        'Location',     'best', ...
                        'interpreter',  'latex' }; 


%%  *********************************************************************   
 %                        OUTPUT CONFIGURATION
 %  *********************************************************************  

mplotCnf.CloseFig               = true;
mplotCnf.SaveFig                = true;
mplotCnf.SaveFigAs              = { "epsc", "jpg", "fig", "pdf" };
