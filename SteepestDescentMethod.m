syms x1 x2
f=@(x1,x2) 2*x1.^2+x2.^2;  
[x,result]=Min_TD(f,[1 1],1/10)
