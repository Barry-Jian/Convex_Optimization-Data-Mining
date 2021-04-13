% 二次优化
function [x,result]=Min_Newton(f,x0,eps,num)
%目标函数
%x0初值
%eps容差
%num最大迭代次数，防止死循环

f_sym = sym(f);
F_td = matlabFunction(gradient(f_sym));%梯度函数句柄
F_hessian = matlabFunction(hessian(f_sym));%hessian矩阵

%进行迭代
while num < 2
    f_td = F_td(x0(1),x0(2));
    f_hessian = F_hessian(x0(1),x0(2));
    if norm(f_td) < eps
        break;
    end
    x0 = x0 - f_hessian\f_td;
    num = num+1;
end

x = x0;
result = f(x(1),x(2));