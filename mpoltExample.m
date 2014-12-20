clear all;
close all;
clc;

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
set( hh,   'FontName', pltCnf.Figure.FontName, ...
           'FontSize', pltCnf.Figure.FontSize );

plot( x, y1, 'b', 'DisplayName'  , 'I_a', ...
                  'LineWidth'    , pltCnf.Plot.LineWidth, ...
                  'MarkerSize'   , pltCnf.Plot.MarkerSize );
hold on;
plot( x, y2, 'r', 'DisplayName'  , 'I_b', ...
                  'LineWidth'    , pltCnf.Plot.LineWidth, ...
                  'MarkerSize'   , pltCnf.Plot.MarkerSize );


ll = legend('show', 'Location', 'best' );
set( ll, 'FontSize'   , pltCnf.Legend.FontSize, ...
         'TextColor'  , pltCnf.Legend.TextColor );
               
            
title( figTitle, 'FontSize', pltCnf.Title.FontSize );


xlabel( 'X',  'FontSize'    , pltCnf.Axis.FontSize, ...
              'Color'       , pltCnf.Axis.Color );
ylabel( 'Y',  'FontSize'    , pltCnf.Axis.FontSize, ...
              'Color'       , pltCnf.Axis.Color );
    
mplotFigs(end+1) = fig;
clear figName figTitle fig hh ll;



%% END PLOTTING
run( 'mplotEND' );             


