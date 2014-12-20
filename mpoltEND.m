if( exist( 'mplotOutdir','var') == 0 )
    disp( 'MPLOT ERROR: Missing variable "mplotOutdir"!\n' );
    break;
end

if( exist( mplotOutdir,'dir') == 0 )
    mkdir( mplotOutdir );
end

if( exist( 'mplotFigs', 'var' ) ~= 0 )
    for mplotKK=1:length(mplotFigs)
        figH      = mplotFigs(mplotKK);
        figName   = get( figH , 'Name' );
        figPath   = strcat( mplotOutdir, '/', figName);
        
        fprintf( 'Saving: %s...\n', fig_name );
        
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
