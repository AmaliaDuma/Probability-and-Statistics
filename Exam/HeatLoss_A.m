%  A study is conducted to compare heat loss in glass pipes, vr steel pipes of the same size.
%  Various liquids at identical starting temperatures are run through segments of each type 
% and the heat liss (in C*) is measured. These data result
%       Steal: 4.6 0.7 4.2 1.9 4.8 6.1 4.7 5.5 5.4
%       Glass: 2.5 1.3 2.0 1.8 2.7 3.2 3.0 3.5 3.4

% a) At the 5% significance lvl, do the population variances seem to differ?

X1 = [4.6, 0.7, 4.2, 1.9, 4.8, 6.1, 4.7, 5.5, 5.4];
X2 = [2.5, 1.3, 2.0, 1.8, 2.7, 3.2, 3.0, 3.5, 3.4];
n1 = length(X1);
n2 = length(X2);

% null hypothesis is H0 : sigma1^2 = sigma2^2
% research hypothesis is H1: sigma1^2 != sigma2^2

fprintf("We are doing a two tailed test for the variances\n");

alpha = 0.05;
[h, p, ci, stats] = vartest2(X1, X2,"alpha", alpha);

% build rejection region
% RR = (−∞,tt_α/2)∪(tt_1− α/2,∞)
f1 = finv(alpha/2, n1 -1, n2-1);
f2 = finv(1 - alpha/2, n1 -1, n2-1);

fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. the variances seem to be different.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. the variances seem to be equal.\n')
end   

%print the extra
fprintf('the rejection region for F is (%6.4f, %6.4f) U (%6.4f, %6.4f)\n', -inf, f1, f2, inf)
fprintf('The value of the test statistic f is %4.4f\n', stats.fstat)
fprintf('The P-value of the test is %4.4f\n\n', p)

