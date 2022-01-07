% A food store owner receives 1-liter water bottles from two suppliers.
% After some complaints from customers, he wants to check the accuracy of the weights of 1-liter water bottles

% A: 1021 980 1017 988 1005 998 1014 985 995 1004 1030 1015 995 1023
% B: 1070 970 993 1013 1006 1002 1014 997 1002 1010 975

% a) At the 5% significance level, do the population variances seem to differ?

X1 = [1021, 980, 1017, 988, 1005, 998, 1014, 985, 995, 1004, 1030, 1015, 995, 1023,];
X2 = [1070, 970, 993, 1013, 1006, 1002, 1014, 997, 1002, 1010, 975];

n1 = length(X1);
n2 = length(X2);

% null hypothesis is H0 : sigma1^2 = sigma2^2
% research hypothesis is H1: sigma1^2 != sigma2^2

fprintf("We are doing a two tailed test for variances\n");

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
