% �����Ż�
function [x,result]=Min_Newton(f,x0,eps,num)
%Ŀ�꺯��
%x0��ֵ
%eps�ݲ�
%num��������������ֹ��ѭ��

f_sym = sym(f);
F_td = matlabFunction(gradient(f_sym));%�ݶȺ������
F_hessian = matlabFunction(hessian(f_sym));%hessian����

%���е���
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