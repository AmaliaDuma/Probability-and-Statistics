% B. Confidence intervals

%   1. In a study of the size of various computer systems, the random variable X, the
% number of files stored (in hundreds of thousands), is considered. These data are obtained:
%      7  7  4  5  9  9
%      4 12  8  1  8  7
%      3 13  2  1 17  7
%     12  5  6  2  1 13
%     14 10  2  4  9 11
%      3  5 12  6 10  7

%   a) Assuming that past experience indicates that σ = 5, find a 100(1−α)% confidence
% interval for the average number of files stored.

% average number => CI for a population mean, miu
% sigma = 5 => sigma is known
% 1-alpha = confidence level => alpha = 1 - confidence level
% alpha = significance level

% => we go on the case 1.1 because we have a population mean and sigma is known

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

% Sigma is 5
sigma = 5;

% Compute the quantiles referring to the N(0,1) distribution
n1 = norminv(1-alpha/2,0,1);
n2 = norminv(alpha/2,0,1);

% Compute the confidence limits
l1 = xbar - sigma/sqrt(n)*n1;
l2 = xbar - sigma/sqrt(n)*n2; 

fprintf('The confidence interval for the average number of stored files is: (%6.3f,%6.3f)\n',l1,l2);
