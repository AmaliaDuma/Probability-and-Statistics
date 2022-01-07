%   To reach the maximum efficiency in performing an assembling operation in a manufacturing plant, new employees
% are required to take a 1-month training course. A new method was suggested, and the manager wants to compare 
% the new method with the standard one, by looking at the lengths of time required for employees to assemble a 
% certain device.
%      standard: 46 37 39 48 47 44 35 31 44 37
%      new:      35 33 31 35 34 30 27 32 31 31


% b) Find a 95% ci for the diff of the avg assembling time.

X1 = [46, 37, 39, 48, 47, 44, 35, 31, 44, 37];
X2 = [35, 33, 31, 35, 34, 30, 27, 32, 31, 31];

% Compute the size of the samples and their means

n1 = length(X1);
xbar1 = mean(X1);

n2 = length(X2);
xbar2 = mean(X2);

% 95% ci => 1-alpha=0,95 => alpha = 0.05
alpha = 0.05;

% Compute the quantile referring to the T(n) distribution
s1 = var(X1);
s2 = var(X2);
c = (s1/n1)/(s1/n1 + s2/n2);
n= 1/(c^2/(n1-1) + ((1-c)^2)/(n2-1));
t1 = tinv(1-alpha/2,n);

% Compute the confidence limits
l1 = xbar1 - xbar2 - t1 *sqrt(s1/n1 + s2/n2);
l2 = xbar1 - xbar2 + t1 *sqrt(s1/n1 + s2/n2); 

fprintf('The confidence interval for the difference of true means is: (%6.3f,%6.3f)\n',l1, l2);

