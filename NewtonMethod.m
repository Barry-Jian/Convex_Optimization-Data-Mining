clc,
clear;
syms x1 x2;
f = 4*x1.^2+x2.^2-x1.^2*x2; %Ŀ�꺯��
f = matlabFunction(f);%ת���ɾ������
x0 = [1 1]';%��ֵ
eps = 1e-3; %�ݲ�
num = 1;
[x,result]=Min_Newton(f,x0,eps,num) 