% c) Find a 100(1 − α)% confidence interval for the ratio of the variances.

X1 = [22.4, 21.7,24.5,23.4,21.6,23.3,22.4,21.6 ,24.8,20.0];
X2 = [17.7, 14.8,19.6, 19.6, 12.1, 14.8,15.4, 12.6,14.0 ,12.2];
  
% Compute the size of the samples 

n1 = length(X1);
n2 = length(X2);

% Find alpha by entering a value of the confidence level
% alpha = 1 - confidence level

alpha = 1 - input("Input the confidence level e (0,1): ");

% Compute the variance of the samples
s1 = var(X1);
s2 = var(X2);

% Compute the quantiles referring to the F(n1 − 1, n2 − 1) distribution
f1 = finv(1-alpha/2,n1-1,n2-1);
f2 = finv(alpha/2,n1-1,n2-1);

% Compute the confidence limits
l1 = 1/f1 * s1/s2;
l2 = 1/f2 * s1/s2;

fprintf('The confidence interval for the ratio of variances: (%6.3f,%6.3f)\n',l1, l2);
