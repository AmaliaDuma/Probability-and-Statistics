%   b) Without the assumption on σ, does the data suggest that, on average, the number
% of files stored exceeds 5.5? (same significance level)

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7,...
   12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5, 12, 6, 10, 7];
n = length(X);

% null hypothesis is H0 : miu = 5.5
% research hypothesis is H1: miu > 5.5

fprintf("We are doing a right tailed test for the mean (sigmna unknown)\n");

m0 = 5.5;
alpha = 0.05;
[h, p, ci, stats] = ttest(X,m0,"alpha",alpha,"tail","right"); % 1, for right-tailed

% build rejection region
% RR = (tt_1-alpha, inf)
z2 = tinv(1-alpha,n-1);
RR = [z2, inf];


fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. the data suggests that the average exceeds 5.5.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. the data suggests that the average DOES NOT exceed 5.5.\n')
end   

%print the extra
fprintf('The confidence interval for mu is (%4.4f,%4.4f)\n', ci)
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic t is %4.4f\n', stats.tstat)
fprintf('The P-value of the test is %4.4f\n\n', p)
