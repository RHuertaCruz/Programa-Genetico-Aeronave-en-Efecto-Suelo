function [] =archivoAVL(C,coor,E1,E2,Cr,Ct,h,V,CDF)
global S
global B 
global i
global claf
global mach
cd=CDF;
mach=V/343;

texto=fopen('ala.avl','wt');
 fprintf(texto,'\n ala'); 
 fprintf(texto,'\n 0'); 
 %fprintf(texto,'\n 0 0 0');
 fprintf(texto,'\n 0 1 %f',h);
 fprintf(texto,'\n%f %f %f',S,C,B);
 fprintf(texto,'\n0 0 0');
 fprintf(texto,'\n%f',cd);
%DEFINIMOS ALA
 fprintf(texto,'\nSURFACE');
 fprintf(texto,'\nALA');
 fprintf(texto,'\n40   1.0  20  1');
 fprintf(texto,'\nYDUPLICATE');
 fprintf(texto,'\n0.0');
 fprintf(texto,'\nANGLE');
 fprintf(texto,'\n%f',i);
%seccion 1 ALA
fprintf(texto,'\nSECTION');
fprintf(texto,'\n%f %f %f %f 0 20 1',coor(1),coor(2),coor(3),Cr); 
fprintf(texto,'\nAFILE');
fprintf(texto,'\ne639.dat');
fprintf(texto,'\nCLAF');
fprintf(texto,'\n%f',claf);
%seccion 2 ALA
fprintf(texto,'\nSECTION');
fprintf(texto,'\n%f %f %f %f %f 20 1',coor(4),coor(5),coor(6),Cr,E1); 
fprintf(texto,'\nAFILE');
fprintf(texto,'\ne639.dat');
fprintf(texto,'\nCLAF');
fprintf(texto,'\n%f',claf);
%seccion 3 ALA
fprintf(texto,'\nSECTION');
fprintf(texto,'\n%f %f %f %f %f 20 1',coor(7),coor(8),coor(9),Ct,E2); 
fprintf(texto,'\nAFILE');
fprintf(texto,'\ne639.dat');
fprintf(texto,'\nCLAF');
fprintf(texto,'\n%f',claf);
fclose(texto); 
end