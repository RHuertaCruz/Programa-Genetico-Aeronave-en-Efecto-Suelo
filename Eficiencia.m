function Cd_Cl = Eficiencia( x )
%!rm ala.avl avl.inp FT.dat ;
!del ala.avl avl.inp FT.dat ;
global S;
global B 
V=((x(10))*10);
global W
global i
global claf
global mach


geometria(x);
CL = (2.0 * W ) / ( 0.125 * V^2 * S );
[alpha, cmtot, cltot, cdtot]= analisis(CL,mach,V);
cd=cdtot+(0.0003*(alpha^2)-0.002*(alpha)+0.0004);
efi=-cltot/cd;
%cm=abs(cmtot);
a=alpha;
if a>=5;
efi=-10;
else
efi=efi;
end

if efi>=-100;
eff=efi;    
else  
eff=-10;  
end

%effcm= eff/cm;
Cd_Cl = eff;

