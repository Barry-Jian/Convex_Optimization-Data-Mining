function [x,result]=Min_TD(f,x0,tol)
%f������
%x0��ֵ
%tol���
f_sym=sym(f);             %���ż���
%��ǰ���ݶ�
h=length(x0); % ������������
FF='F_td(';
ff='f(';
f_x1='f(';
for k=1:h
    FF=[FF,'x0(',num2str(k),'),'];%����ֵ����ת��Ϊ��ʾ���ֵ��ַ�����
    ff=[ff,'x0(',num2str(k),'),'];
    f_x1=[f_x1,'x1(',num2str(k),'),'];
end
FF(end)=[];
FF=[FF,')'];
ff(end)=[];
ff=[ff,')'];
f_x1(end)=[];
f_x1=[f_x1,')'];
%% FF�����ݶ�ֵ  ff���㺯��ֵ

F_td=matlabFunction(gradient(f_sym));%�ݶȺ���
f_td=eval(FF);%���㵱ǰ�ݶ�
d_k=-f_td/norm(f_td);%�½����� 

%% Ѱ����ѵ������� alfa
while norm(f_td) > tol
    syms alfa
    x1=x0(:)+alfa*d_k;%���������뺯������alfa
    fx1=eval(f_x1);%����x1������ԭ�������ʽ
    d_x1=diff(fx1);%������������
    d_alfa=double(solve(d_x1));%�����ʽΪ0ʱ��alfa
    
    x0=x0(:)+d_alfa*d_k;
    f_td=eval(FF);%���㵱ǰ�ݶ�
    if norm(f_td) < tol
        break;
    end
    d_k=-f_td/norm(f_td);%�½�����
end

x=x0;
result=eval(ff);