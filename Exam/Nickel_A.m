% Nickel powders areused in coatings used to shield electronic equipment. A random sample is selected, 
%and the sizes of nickel particles in each coating are  recorded:
%   3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96

% a) Find a 95% ci for the avg size of a nickel particles.

X = [3.26, 1.89, 2.42, 2.03, 3.07, 2.95, 1.39, 3.06, 2.46, 3.35, 1.56, 1.79, 1.76, 3.82, 2.42, 2.96];

% Compute the size of the samples and their means
n = length(X);
xbar = mean(X);

% 95% ci => 1-alpha = 0,95 => alpha = 0.05
alpha = 0.05;

% Compute the sample variance
s = std(X);

% Compute the quantiles referring to the T(n − 1) distribution
t1  = tinv(1-alpha/2,n-1);
t2  = tinv(alpha/2,n-1);

% Compute the confidence limits
l1 = xbar - s/sqrt(n)*t1;
l2 = xbar - s/sqrt(n)*t2;

fprintf('The confidence interval for the variance is: (%6.3f,%6.3f)\n',l1,l2);
