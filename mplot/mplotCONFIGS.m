%% 
 % Hardware/software co-design di uno stimatore dello stato di batterie 
 % agli ioni di Litio - Copyright (C) 2013, 2014 Salvatore Dello Iacono
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


%%  *********************************************************************   
 %                        FIGURE CONFIGURATION
 %  *********************************************************************  
 
mplotCnf.Figure.FontName        = 'Helvetica';
mplotCnf.Figure.FontSize        = 12;

 
%%  *********************************************************************   
 %                         PLOT CONFIGURATION
 %  *********************************************************************  

mplotCnf.Plot.LineWidth         = 2;
mplotCnf.Plot.MarkerSize        = 10;


%%  *********************************************************************   
 %                         AXIS CONFIGURATION
 %  *********************************************************************  

mplotCnf.Axis.Color             = 'black'; 
mplotCnf.Axis.FontSize          = 12;

%%  *********************************************************************   
 %                         TITLE CONFIGURATION
 %  *********************************************************************  

mplotCnf.Title.FontSize         = 14;

%%  *********************************************************************   
 %                        LEGEND CONFIGURATION
 %  *********************************************************************  

mplotCnf.Legend.TextColor       = 'black';
mplotCnf.Legend.FontSize        = 11;

mplotCnf.CloseFig               = true;

%%  *********************************************************************   
 %                        OUTPUT CONFIGURATION
 %  *********************************************************************  

mplotCnf.SaveAs.Eps             = false;
mplotCnf.SaveAs.Jpg             = true;
mplotCnf.SaveAs.Fig             = false;
