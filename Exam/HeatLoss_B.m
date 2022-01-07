 %  A study is conducted to compare heat loss in glass pipes, vr steel pipes of the same size.
%  Various liquids at identical starting temperatures are run through segments of each type 
% and the heat liss (in C*) is measured. These data result
%       Steal: 4.6 0.7 4.2 1.9 4.8 6.1 4.7 5.5 5.4
%       Glass: 2.5 1.3 2.0 1.8 2.7 3.2 3.0 3.5 3.4

% b) 5% significance lvl, does it seems that on avg, steel pipes lose more heat than glass pipes?

X1 = [4.6, 0.7, 4.2, 1.9, 4.8, 6.1, 4.7, 5.5, 5.4];
X2 = [2.5, 1.3, 2.0, 1.8, 2.7, 3.2, 3.0, 3.5, 3.4];
n1 = length(X1);
n2 = length(X2);

% null hypothesis is H0 : miu1 = miu2
% research hypothesis is H1: miu1 > miu2

fprintf("We are doing a right tailed test for the difference of means\n");

alpha = 0.05;
[h, p, ci, stats] = ttest2(X1, X2, alpha, 1);
% if the variances had been different (if we reject H0 in part a), then 
% [hh, pp1, ci2, stats] = ttest2(x1, x2, alpha, 1, 'unequal');  % option "unequal" if variances are not equal

% build rejection region
% RR = (tt_1-alpha, inf)
s1 = var(X1);
s2 = var(X2);
c = (s1/n1)/(s1/n1 + s2/n2);
n= 1/(c^2/(n1-1) + ((1-c)^2)/(n2-1));
z2 = tinv(1-alpha,n);
RR = [z2, inf];

fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. steel pipes lose more heat than glass pipes.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. steel pipes do not lose more heat than glass pipes.\n')
end   

%print the extra
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic t is %4.4f\n', stats.tstat)
fprintf('The P-value of the test is %4.4f\n\n', p)
