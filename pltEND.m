if( exist(outputDir,'dir') == 0 )
    mkdir( outputDir );
end

if( exist( 'figsH', 'var' ) ~= 0 )
    for pltKK=1:length(figsH)
        figH      = figsH(pltKK);
        figName   = get( figH , 'Name' );
        figPath   = strcat( outputDir, '/', figName);
        
        fprintf( 'Saving: %s...\n', fig_name );
        
        if( pltCnf.SaveAs.Jpg )
            saveas( figH, figPath, 'jpg' );
        end
        
        if( pltCnf.SaveAs.Eps )
            saveas( figH, figPath, 'epsc' );
        end
        
        if( pltCnf.SaveAs.Fig )
            saveas( figH, figPath, 'fig' );
        end
        
        if( pltCnf.CloseFig )
            close( figH );
        end
    end
else 
    disp( 'ERROR: Missing variable "figsH"!\n' )
end

clear pltKK figH figName figPath;
