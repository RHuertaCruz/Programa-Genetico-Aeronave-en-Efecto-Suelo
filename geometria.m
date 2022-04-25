function []=geometria(x)
global S
global B 

AR=x(1);
b1=x(2);
con=x(3);
die1=x(4);
die2=x(5);
fle=x(6);
E1=x(7);
E2=x(8);
pc=x(9);
V=((x(10))*10);
S=(B^2)/(AR);

b=B/2;
b2=b-b1;
B1=2*b1;
B2=2*b2;
Cr=S/(B1+((1+con)*B2/2));
Ct=con*Cr;

%S1=Cr*B1;
%S2=(Cr+Ct)*B2/2;

mact=((2/3)*(Cr)*((1+con+(con^2))))/(1+con);
C=(Cr+mact)/2; %%
ymact=((Cr-mact)*b2)/(Cr-Ct);
ymactr=(10*round(ymact,1)+1)+(10*round(b1,1));
x1=-0.25*Cr;
y1=0;
z1=0;
x2=-0.25*Cr;
y2=b1;
z2=b1*tand(die1);

x3=(-0.25*Ct)+(b*tand(fle));
y3=b;
z3=z2+b2*tand(die2);%

coor=[x1,y1,z1,x2,y2,z2,x3,y3,z3];
if z3>=0
    dh=0;
else 
    dh=z3;
end

adh=abs(dh);

h=(pc*C)+adh;

ii=1;
vis=1.4204e-5;
a=0:0.1:6.6;
while ii<=67
    
 if a(ii)<=b1
    Cy(ii)=Cr;
 else
    Cy(ii)=((-(Cr*(1-con))/b)*a(ii))+Cr;
 end
    Re(ii)=(V*Cy(ii))/vis;
    
    %Cdf(ii)=(1.4e-18)*((Re(ii)).^2)-((6.9e-11)*Re(ii))+(0.0051);%%%%
    %Cdf(ii)=(-3e-4)*log(Re(ii))+0.0094;%4412
    Cdf(ii)=(-5e-4)*log(Re(ii))+0.0124;%e639
    %Cdf(ii)=(-5e-4)*log(Re(ii))+0.0122;%M15
    %Cdf(ii)=(-7e-4)*log(Re(ii))+0.0157;%clarkYH
    %Cdf(ii)=(-1e-4)*log(Re(ii))+0.0063;%%%Corrección Experimental
   
  
    ii=ii+1;
end
Cdft=Cdf(ymactr);

  CDF=((((b1/b)*Cdf(1))+((Cdft)*((b2)/b)))*4.5507);

archivoAVL(C,coor,E1,E2,Cr,Ct,h,V,CDF);

end