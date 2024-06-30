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
 %   @file    mplotExample02.m
 %   @brief   mplot Example 02.
 %   @details mplot Example file, this is an example of how mplot has been 
 %   used to generate the figures of the paper:
 %   Fort, A.; Landi, E.; Moretti, R.; Mugnaini, M.; Liguori, C.; 
 %   Paciello, V.; Dello Iacono, S. "Influence of Front-End Electronics on 
 %   Metrological Performance of QCM Systems," Sensors 2024, 24, 3401. 
 %   https://doi.org/10.3390/s24113401
 %   Have a look to our work: https://www.mdpi.com/1424-8220/24/11/3401
 %
 
clear all;
close all;
clc;

%% Configure MPLOT
addpath( '../mplot' );

% Start mplotUtility
run( 'mplotBEGIN' );

% Configuration Overloadings
mplotcfg.SaveFigAs              = { "png", "fig" };
mplotcfg.CloseFig               = false;
mplotcfg.SaveFig                = true;
mplotcfg.OutputFolder           = './figures/';

%%  *********************************************************************   
 %                         MPLOT: Example 2
 %  *********************************************************************  

% Data Parameters
mult = 10;

% Data vectors generation
x = linspace(-2, 2, 100*mult );
y = abs(sinc(x)); 

x1=x(1:15*mult:end);
y1=y(1:15*mult:end);

y2=y(1:19*mult:end);
x2=x(1:19*mult:end);

% Figure generation
figName     = 'mplotExample02';
figTitle    = 'Example 2';

fprintf( "-> Plotting: '%s'\n", figTitle );

nRows = 1;
nCols = 2;

fig = figure( 'Name', figName, 'Position', [100, 100, 1800, 700], ... 
              mplotcfg.opt.Figure{:}, 'ToolBar', 'none' );

    kax = 1; 
    ax(kax) = subplot( nRows, nCols, kax );
        xLimits = [-1.5 1.5];
        yLimits = [0 1.1];
        
        plot( x, y, 'b', mplotcfg.opt.Plot{:} );
        hold on;

        plot( x1, y1, 'k.', ...
            'MarkerFaceColor', [0 0 0], 'MarkerSize', 5, 'Marker', 'o',...
            'Color', [0 0 0], 'LineWidth', 2, 'LineStyle', 'none' );
        
        plot( x1, zeros(1, length(x1)), 'k.', ...
            'MarkerFaceColor', [0 0 0], 'MarkerSize', 5, 'Marker', 'o',...
            'Color', [0 0 0], 'LineWidth', 2, 'LineStyle', 'none' );
    
        for kk=1:length( x1 )
            xpos = [1 1]*x1(kk);
            ypos = [0 y1(kk)];
            plot( xpos, ypos, 'k-', 'LineWidth',  2, 'HandleVisibility', 'off' );
        end

        plot( [-2 2], [1 1], 'k--', 'LineWidth',  1, 'HandleVisibility', 'off' );
        plot( [0 0], [-1 2], 'k--', 'LineWidth',  1, 'HandleVisibility', 'off' );

        text( 0.05, 0.05, '$f_s$', ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', 'left' );

        text( x1(4)-0.05, y1(4), '$|M(K-1)|$', ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', ' right' );

        text( x1(5)+0.05, y1(5), '$|M(K)|$' , ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', 'left'  );
   
        annotation( 'doublearrow', mplotX2Pos( gca, xLimits, yLimits, [x1(4) 0] ), ...
                                   mplotY2Pos( gca, xLimits, yLimits, [1 1]*0.6 ), ...
                                   mplotcfg.opt.Arrow{:} );


        annotation( 'textbox', mplotRec2Pos( gca, xLimits, yLimits, [x1(4)/2 0.6 0.0 0.0] ), ...
                              'String', '$\delta_f$', ...
                               mplotcfg.opt.TextBox{:} );
 

        annotation( 'doublearrow', mplotX2Pos( gca, xLimits, yLimits, x1(4:5) ), ...
                                   mplotY2Pos( gca, xLimits, yLimits, [1 1]*min(y1(4:5))), ...
                                   mplotcfg.opt.Arrow{:}  );


        annotation( 'textbox', mplotRec2Pos( gca, xLimits, yLimits, [mean(x1(4:5)) min(y1(4:5)) 0.0 0.0] ), ...
                              'String', '$\Delta_f$', ...
                               mplotcfg.opt.TextBox{:} );

        xlabel( "Frequency", mplotcfg.opt.Label{:} );
        ylabel( "Magnitude", mplotcfg.opt.Label{:} );
                
        xlim( xLimits );
        ylim( yLimits );        
        
        set( gca, 'XTick', [x1(4) x1(5)], 'XTickLabel', { "$K-1$", "$K$" } );
        set( gca, 'YTick', [1] );

    kax = kax + 1;
    ax(kax) = subplot( nRows, nCols, kax );
    
        plot( x, y, 'b', mplotcfg.opt.Plot{:} );
        hold on;

        plot( x2, y2, 'k.', ...
            'MarkerFaceColor', [0 0 0], 'MarkerSize', 5, 'Marker', 'o',...
            'Color', [0 0 0], 'LineWidth', 2, 'LineStyle', 'none' );
        
        plot( x2, zeros(1, length(x2)), 'k.', ...
            'MarkerFaceColor', [0 0 0], 'MarkerSize', 5, 'Marker', 'o',...
            'Color', [0 0 0], 'LineWidth', 2, 'LineStyle', 'none' );
    
        for kk=1:length( x2 )
            xpos = [1 1]*x2(kk);
            ypos = [0 y2(kk)];
            plot( xpos, ypos, 'k-', 'LineWidth',  2, 'HandleVisibility', 'off' );
        end
        
        plot( [-2 2], [1 1], 'k--', 'LineWidth',  1, 'HandleVisibility', 'off' );
        plot( [0 0], [-1 2], 'k--', 'LineWidth',  1, 'HandleVisibility', 'off' );

        text( 0.05, 0.05, '$f_s$', ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', 'left' );
        
        text( x2(3)-0.05, y2(3), '$|M(K-1)|$', ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', 'right' );

        text( x2(4)+0.05, y2(4), '$|M(K)|$', ...
              mplotcfg.opt.TextLabel{:}, 'HorizontalAlignment', 'left'  );
        

        annotation( 'doublearrow', mplotX2Pos( ax(kax), xLimits, yLimits, [0 x2(4)] ), ...
                                   mplotY2Pos( ax(kax), xLimits, yLimits, [1 1]*0.8 ), ...
                                   mplotcfg.opt.Arrow{:} );

        annotation( 'textbox', mplotRec2Pos( ax(kax), xLimits, yLimits, [x2(4)/2 0.8 0.0 0.0] ), ... 
                               'String', '$\delta_f$', ...
                               mplotcfg.opt.TextBox{:} );
    
        annotation( 'doublearrow', mplotX2Pos( ax(kax), xLimits, yLimits, x2(3:4) ), ...
                                   mplotY2Pos( ax(kax), xLimits, yLimits, [1 1]*min(y2(3:4)) ), ...
                                   mplotcfg.opt.Arrow{:} );

        annotation( 'textbox', mplotRec2Pos( ax(kax), xLimits, yLimits, [mean(x2(3:4)) min(y2(3:4)) 0.0 0.0] ), ... 
                               'String', '$\Delta_f$',...
                               mplotcfg.opt.TextBox{:} );
    
       
        ylim( [0 1.1] );
        xlim( [-1.5 1.5] );
        xlabel( "Frequency", mplotcfg.opt.Label{:} );
        ylabel( "Magnitude", mplotcfg.opt.Label{:} );
        
        set( gca, 'XTick', [x2(3) x2(4)], 'XTickLabel', { "$K-1$", "$K$" } );
        set( gca, 'YTick', [1] ) ;

        
    for kax=1:length(ax)
        set( ax(kax), mplotcfg.opt.Ticks{:} );
        disableDefaultInteractivity( ax(kax) );
    end

mplotSaveFig( fig, mplotcfg.OutputFolder );

%% END PLOTTING
run( 'mplotEND' );             
rmpath( '../mplot' );
