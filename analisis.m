function [alpha,cmtot,cltot,cdtot]=analisis(CL,mach,V);

comandos = fopen( 'avl.inp', 'wt' );
fprintf(comandos,'LOAD'); 
fprintf(comandos,'\nala'); 
fprintf(comandos,'\nOPER');
fprintf(comandos,'\nm');
fprintf(comandos,'\nmn');
fprintf(comandos,'\n%f',mach);
fprintf(comandos,'\nV');
fprintf(comandos,'\n%f',V);
fprintf(comandos,'\nG');
fprintf(comandos,'\n9.81');
fprintf(comandos,'\nd');
fprintf(comandos,'\n1.225\n');
fprintf(comandos, '\nA\n' );
fprintf(comandos, 'C\n' );
Line = sprintf( '%10.6f\n' , CL );
fprintf(comandos, '%s' , Line );
fprintf(comandos, 'X\n' );
fprintf(comandos, 'FT\n' );
fprintf(comandos, 'FT.dat' );
fprintf(comandos, ' \n \n \n');
fprintf(comandos, 'Q\n');
fclose(comandos);
fclose('all')
!avl.exe < avl.inp

resultados= fopen( 'FT.dat' , 'rt' );
%resultados = fopen('FT.dat', permission);
for i = 1:15
    Line = fgetl(resultados) ;
end
Line = fgetl(resultados) ;
alpha = sscanf( Line(10:20) , '%f' ) ;
for i = 1:4
    Line = fgetl(resultados) ;
end
Line = fgetl(resultados) ;
cmtot = sscanf( Line(32:41) , '%f' ) ;
Line = fgetl(resultados);
Line = fgetl(resultados);
Line = fgetl(resultados);
cltot = sscanf( Line(10:19) , '%f' ) ;
Line = fgetl(resultados) ;
cdtot = sscanf( Line(10:19) , '%f' ) ;
fclose(resultados) ;
fclose('all');
end
