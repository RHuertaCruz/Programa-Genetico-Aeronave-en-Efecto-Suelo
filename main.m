clear
clc

format long
global B 
global W
global i
global claf
global nombre;
B = 13.2;
W  = 4820; %MTOW
i = 0;
claf=0.9821; %perfil e639.dat
%{
x(1)=AR; 
x(2)=b1;
x(3)=con;
x(4)=die1;  
x(5)=die2;
x(6)=fle;
x(7)=E1;
x(8)=E2;
x(9)=h/c;
x(10)=V;
eficiencia geometria, geometria
10 variables
%}
LB  = [2   1   0.3 -5   -5   -5  -5  -5   0.15  3.5];
UB  = [4   3    1   5    5    5   5   5   0.5   5.5];
%x=   [AR  b1  con die1 die2 fle  E1  E2  h/c    V]
for c=1:10
    x(c) = LB(c) + rand* ( UB(c) - LB(c) );
end

x0 = x;
fun  = @Eficiencia; 
nvars=10;
A=[];
b=[];
Aeq=[];
beq=[];
nonlcon=[];
%Definición de Opciones, Criterios de Detención y Función de Mutación
ps=10;      %Population Size     %50 para 5 o menos sino 200 
cf=0.7;     %Crossover Fraction  %justificacion matlab
ec=2;       %Elite Count
mg=5;     %Max Generations    
msg=5;     %Max Stall Generations 
%ConstraintFunction = @simple_constraint;
%Visualización (Gráficas)
%opts = optimoptions(@ga,'UseParallel', true, 'UseVectorized', false);
opts=optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping,@gaplotbestindiv,@gaplotgenealogy,@gaplotscores,@gaplotselection,@gaplotexpectation,@gaplotrange,@gaplotdistance},'Display','iter');
opts=optimoptions(opts,'PopulationSize',ps,'CrossoverFraction',cf,'EliteCount',ec,'MaxGenerations',mg,'MaxStallGenerations',msg,'MutationFcn',@mutationadaptfeasible,'SelectionFcn',@selectionstochunif,'CrossoverFcn',@crossoverarithmetic);

%opts=optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotbestindiv},'Display','iter');


%Algoritmo Genético (función ga)
[x,Fval,exitFlag,Output,population,scores]=ga(fun,nvars,A,b,Aeq,beq,LB,UB,[],opts);
%}

