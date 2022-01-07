% 2. It is thought that the gas mileage obtained by a particular model of automobile will be higher 
% if unleaded premium gasoline is used in the vehicle rather than regular unleaded gasoline. 
% To gather evidence in this matter, 10 cars are randomly selected from the assembly line and tested 
% using a specified brand of premium gasoline; 10 others are randomly selected and tested using the brand’s \
% regular gasoline. Tests are conducted under identical controlled conditions and gas mileages for both types
% of gas are assumed independent and (approximately) normally distributed. These data result:
%        Premium      Regular
%      22.4  21.7    17.7  14.8
%      24.5  23.4    19.6  19.6
%      21.6  23.3    12.1  14.8
%      22.4  21.6    15.4  12.6
%      24.8  20.0    14.0  12.2


%    a) At the 5% significance level, is there evidence that the variances of the two
% populations are equal?

X1 = [22.4, 21.7,24.5,23.4,21.6,23.3,22.4,21.6 ,24.8,20.0];
X2 = [17.7, 14.8,19.6, 19.6, 12.1, 14.8,15.4, 12.6,14.0 ,12.2];

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
