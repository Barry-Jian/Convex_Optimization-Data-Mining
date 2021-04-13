clc,
clear;
syms x1 x2;
f = 4*x1.^2+x2.^2-x1.^2*x2; %目标函数
f = matlabFunction(f);%转换成句柄函数
x0 = [1 1]';%初值
eps = 1e-3; %容差
num = 1;
[x,result]=Min_Newton(f,x0,eps,num) 