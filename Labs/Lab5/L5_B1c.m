%    c) Assuming the number of files stored are approximately normally distributed, find
% 100(1 − α)% confidence intervals for the variance and for the standard deviation.

% sigma^2 is the population variance
% s^2 is the sample variance
% sigma is the standard deviation

% Compute the size of the sample
X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7,...
   12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5, 12, 6, 10, 7];

% n = size of the sample
n = length(X);

% Find alpha by entering a value of the confidence level
% alpha = 1 - confidence level

alpha = 1 - input("Input the confidence level e (0,1): ");

% Compute the sample variance
s2 = var(X);

% Compute the quantiles referring to the s χ2 _(n-1) distribution
chi1 = chi2inv(1-alpha/2, n-1);
chi2 = chi2inv(alpha/2, n-1);

% Compute the confidence limits
l1 = (n-1)*s2/chi1;
l2 = (n-1)*s2/chi2;

fprintf('The confidence interval for the variance is: (%6.3f,%6.3f)\n',l1,l2);

% For the standard deviation

fprintf('The confidence interval for the standard deviation is: (%6.3f,%6.3f)\n',sqrt(l1), sqrt(l2));
