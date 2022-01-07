%    b. Based on the result in part a., at the same significance level, does gas mileage
% seem to be higher, on average, when premium gasoline is used?

X1 = [22.4, 21.7,24.5,23.4,21.6,23.3,22.4,21.6 ,24.8,20.0];
X2 = [17.7, 14.8,19.6, 19.6, 12.1, 14.8,15.4, 12.6,14.0 ,12.2];

n1 = length(X1);
n2 = length(X2);

% null hypothesis is H0 : miu1 = miu2
% research hypothesis is H1: miu1 > miu2

fprintf("We are doing a right tailed test for the difference of means\n");

alpha = 0.05;
[h, p, ci, stats] = ttest2(X1, X2, "alpha", alpha, "tail", "right");
% if the variances had been different (if we reject H0 in part a), then 
% [hh, pp1, ci2, stats] = ttest2(x1, x2, alpha, 1, 'unequal');  % option "unequal" if variances are not equal

% build rejection region
% RR = (tt_1-alpha, inf)
z2 = tinv(1-alpha,n1+n2-2);
RR = [z2, inf];

fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. gas mileage IS higher with premium gasoline.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. gas mileage IS NOT higher with premium gasoline.\n')
end   

%print the extra
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic t is %4.4f\n', stats.tstat)
fprintf('The P-value of the test is %e\n\n', p)
