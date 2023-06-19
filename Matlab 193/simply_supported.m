clc; clear; close all
disp('Simply Supported Beam');

disp(' ');
L = input('Length of beam in meter = ');
disp('');
disp('Type 1 for point load, Type 2 for udl')
Type = input('Load case = ');

if Type == 1
    disp('');
    W = input('Load applied in kN = ');
    disp(' ');
    a = input('Location of Load from left end of the beam in meter = ');
    c = L-a;

    R1 = W*(L-a)/L;
    R2 = W*a/L;

elseif Type == 2
    disp(' ');
    W = input('Uniformly distributed load in kN/m = ');
    disp(' ');
    b = input('Length of udl in meter = ');
    disp(' ');
    cg = input('C.G of udl from left end of the beam in meter = ');
    a = (cg-b/2);
    c = L-a-b;
    R1 = W*b*(b+2*c)/(2*L);
    R2 = W*b*(b+2*a)/(2*L);
else 
    disp('INPUT ERROR');
end
n = 1000; 
delta_x = L/n; 
x = (0:delta_x:L)';

V = zeros(size(x, 1), 1);
M = zeros(size(x, 1), 1);


if Type == 1
    for ii = 1:n+1

        V(ii) = R1;
        M(ii) = R1*x(ii);


        if x(ii) >= a
            V(ii) = R1-W;
            M(ii) = R1*x(ii)-W*(x(ii)-a);
        end
    end
x1 = a;
Mmax = W*a*(L-a)/L;
else
    for ii = 1:n+1
    
        if x(ii) < a
            V(ii) = R1;
            M(ii) = R1*x(ii);
        elseif a <= x(ii) && x(ii)< a+b
    
        V(ii) = R1-W*(x(ii)-a);
        M(ii) = R1*x(ii)-W*((x(ii)-a)^2)/2;
        elseif x(ii) >= (a+b)
    
        V(ii) = -R2;
        M(ii) = R2*(L-x(ii));
        end
    end
x1 = a+b*(b+2*c)/(2*L);
Mmax = W*b*(b+2*c)*(4*a*L+2*b*c+b^2)/(8*L^2);
end

disp(' ');disp (['Left support Reaction' ' = ' num2str(R1) ' ' 'kN'])
disp(' ');disp (['Left support Reaction' ' = ' num2str(R2) ' ' 'kN'])
disp(' ');disp (['Maximum bending moment' ' = ' num2str(Mmax) ' ' 'kNm'])

figure
subplot(2,1,1);
plot(x, V, 'r','linewidth',1.5);
grid
line([x(1) x(end)],[0 0],'Color','k');
line([0 0],[0 V(1)],'Color','r','linewidth',1.5);
line([x(end) x(end)],[0 V(end)],'Color','r','linewidth',1.5);
title('Shear Force Diagram','fontsize',16)
text(a/2,V(1),num2str(V(1)),'HorizontalAlignment','center','FontWeight','bold','fontsize',16)
text((L-c/2),V(end),num2str(V(end)),'HorizontalAlignment','center','FontWeight','bold','fontsize',16)
axis off

subplot(2,1,2);
plot(x, M, 'r','linewidth',1.5);
grid
line([x(1) x(end)],[0 0],'Color','k');
line([x1 x1],[0 Mmax],'LineStyle','--','Color','b');
title('Bending Moment Diagram','fontsize',16)
text(x1+1/L,Mmax/2,num2str(round(Mmax,-2)),'HorizontalAlignment','center','FontWeight','bold','fontsize',16)
text(x1,0,[num2str(round(x1,-2)) ' m'],'HorizontalAlignment','center','FontWeight','bold','fontsize',16)
axis off
