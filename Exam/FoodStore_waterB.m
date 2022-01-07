% A food store owner receives 1-liter water bottles from two suppliers.
% After some complaints from customers, he wants to check the accuracy of the weights of 1-liter water bottles

% A: 1021 980 1017 988 1005 998 1014 985 995 1004 1030 1015 995 1023
% B: 1070 970 993 1013 1006 1002 1014 997 1002 1010 975

% a) Same significance lvl, on avg, does Supplier A seems to be more reliable?

X1 = [1021, 980, 1017, 988, 1005, 998, 1014, 985, 995, 1004, 1030, 1015, 995, 1023,];
X2 = [1070, 970, 993, 1013, 1006, 1002, 1014, 997, 1002, 1010, 975];

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
z2 = tinv(1-alpha,n1+n2-2);
RR = [z2, inf];

fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. Supplier A seems to be more reliable.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. Supplier A seems NOT to be more reliable.\n')
end   

%print the extra
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic t is %4.4f\n', stats.tstat)
fprintf('The P-value of the test is %4.4f\n\n', p)
