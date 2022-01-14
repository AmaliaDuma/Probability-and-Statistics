% write an interval : x=lower bound: step size : upper bound
x = 0:0.1:3;
y1 = x.^5 / 10;
y2 = x .* sin(x);
y3 = cos(x);

%plot them with different line styles and colors
plot(x,y1);
% hold on retains the plot so that new plots dont't delete the existing one
hold on;
plot(x,y2,'r--');
hold on;
plot(x,y3,'b:');
% add title
title('P2_part 1');
% add legend
legend('x^5/10','xsin(x)','cos(x)');

%part 2: plot them in different pictures, but the same window
%subplot(m,n,p) - divides in m by n grid and plots in pos p
subplot(3,1,1);
plot(x, y1);
title('P1');
legend('x^5/10');

subplot(3, 1, 2);
plot(x, y2);
title('P2');
legend('xsinx');

subplot(3, 1, 3);
plot(x, y3);
title('P3');
legend('cosx');

