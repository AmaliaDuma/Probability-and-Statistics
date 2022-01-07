% Nickel powders areused in coatings used to shield electronic equipment. A random sample is selected, 
%and the sizes of nickel particles in each coating are  recorded:
%   3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96

% a) 1% significance lvl, on avg, do these nickel particles seem to be smaller than 3?

X = [3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96];
n = length(X);

% null hypothesis is H0 : miu = 3
% research hypothesis is H1: miu < 3

fprintf("We are doing a left tailed test for the mean\n");

m0 = 3;
alpha = 0.01;
[h, p, ci, stats] = ttest(X,m0,alpha,-1);

% build rejection region
% RR = (-inf, tt_alpha)
z2 = tinv(alpha,n-1);
RR = [-inf,z2];

fprintf('\n H is %d', h)
if h==1 % result of the test, h = 0, if H0 is NOT rejected, h = 1, if H0 IS rejected
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. the data suggests that nickel particles seem to be smaller than 3.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. the data suggests that nickel particles seem NOT to be smaller than 3.\n')
end   

%print the extra
fprintf('The rejection region is (%4.4f, %4.4f)\n', RR)
fprintf('The value of the test statistic t is %4.4f\n', stats.tstat)
fprintf('The P-value of the test is %4.4f\n\n', p)
