clear all ;
clc;
close all;

prompt='introduzca el valor (grados)de un angulo:';
%conversion 
angDeg=input(prompt);
angRad=deg2rad(angDeg);


d='introduzca l1:';%distancia 
l1=input(d);
e='introduzca l2:';
l2=input(e);


p1= [0;0;0]'; %punto inicial (el apostrofe hace vector tipo columna)


%condicion si hay angulos negativos 
if angDeg>=0 %para angulos positivos(va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
    angVec=0:0.01:angRad;
else
    angVec= 0:-0.01:angRad;%para angulos negativos (va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
end

%saca el coseno de toda la matriz toma el coseno del primer valor sale y
%toma el segundo y le saca el coseno asi hasta el ultimo vlaor 
for i=1:length(angVec)%lenght tamaño del vector 
 
 clf
 printAxis();%imprime eje x,y
 cos(angVec(i))%i=a los valores de toda la matriz 
    
 TRz1=[cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1]; % primera rotacion
 TTx1=[1 0 0 l1;0 1 0 0;0 0 1 0;0 0 0 1];% primera traslacion
 T1=TRz1*TTx1;
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0 0 0],'linewidth',5);

%segundo eslabon 
printAxis();
TRz2=[cos(0) -sin(0) 0 0;sin(0) cos(0) 0 0;0 0 1 0;0 0 0 1];
TTx2=[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];
T2=TRz2*TTx2;
tf=T1*T2
p3=tf(1:3,4)
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 0 1],'linewidth',2.5);
pause(0.1)
end 

