%   1. In a study of the size of various computer systems, the random variable X, the
% number of files stored (in hundreds of thousands), is considered. These data are obtained:
%      7  7  4  5  9  9
%      4 12  8  1  8  7
%      3 13  2  1 17  7
%     12  5  6  2  1 13
%     14 10  2  4  9 11
%      3  5 12  6 10  7

%   a) Assuming that past experience indicates that σ = 5, at the 5% significance level,
% does the data suggest that the standard is met? What about at 1%?

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7,...
   12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5, 12, 6, 10, 7];
n = length(X);

% null hypothesis is H0 : miu = 9
% research hypothesis is H1: miu < 9

fprintf("We are doing a left tailed test for the mean (sigmna known)\n");

sigma = 5;
m0 = 9;
alpha = 0.05;

% [h, p, ci, zval] = ztest(x, m0, sigma, alpha, -1);
[h,p,ci,zval] = ztest(X,m0,sigma,alpha,-1);

% build rejection region
% RR = (-inf, tt_alpha)
z2 = norminv(alpha);
RR = [-inf, z2];

fprintf('\n h is %d', h)
if h == 1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n')
    fprintf('i.e. the data suggests that the standard IS NOT met.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. the data suggests that the standard IS  met.\n')
end   

%print the extra
fprintf('The confidence interval for mu is (%4.4f,%4.4f)\n', ci)
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic z is %4.4f\n', zval)
fprintf('The P-value of the test is %4.4f\n\n', p)
