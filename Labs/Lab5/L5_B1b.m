%    b) Assuming nothing is known about σ, find a 100(1 − α)% confidence interval for
% the average number of files stored.

% average number of files stored => CI for population mean, miu
% sigma not known 
% s is the sample standard deviation
% quantiles refer to the T(n-1) distribution

% Compute the size of the sample and the mean
X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7,...
   12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5, 12, 6, 10, 7];

% n = size of the sample
n = length(X);

% xbar = the mean
xbar = mean(X);

% Find alpha by entering a value of the confidence level
% alpha = 1 - confidence level

alpha = 1 - input("Input the confidence level e (0,1): ");

% Find the standard deviation
s = std(X);

% Compute the quantiles referring to the T(n − 1) distribution
t1 = tinv(1-alpha/2, n-1);
t2 = tinv(alpha/2, n-1);

% Compute the confidence limits
l1 = xbar - s/sqrt(n)*t1;
l2 = xbar - s/sqrt(n)*t2; 

fprintf('The confidence interval for the average number of stored files is: (%6.3f,%6.3f)\n',l1,l2);
