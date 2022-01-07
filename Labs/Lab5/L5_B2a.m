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

% a) Assuming σ1 = σ2, find a 100(1 − α)% confidence interval for the difference of the true means.

X1 = [22.4, 21.7,24.5,23.4,21.6,23.3,22.4,21.6 ,24.8,20.0];
X2 = [17.7, 14.8,19.6, 19.6, 12.1, 14.8,15.4, 12.6,14.0 ,12.2];
  
% Compute the size of the samples and their means

n1 = length(X1);
xbar1 = mean(X1);

n2 = length(X2);
xbar2 = mean(X2);

% Find alpha by entering a value of the confidence level
% alpha = 1 - confidence level

alpha = 1 - input("Input the confidence level e (0,1): ");

% Compute the quantile referring to the T(n1 + n2 − 2) distribution
t1 = tinv(1-alpha/2,n1+n2-2);

% Compute s_p. We need the sample variances
s1 = var(X1);
s2 = var(X2);
s_p = sqrt(((n1-1)*s1+(n2-1)*s2)/(n1+n2-2));

% Compute the confidence limits
l1 = xbar1 - xbar2 - t1*s_p*sqrt(1/n1+1/n2);
l2 = xbar1 - xbar2 + t1*s_p*sqrt(1/n1+1/n2);

fprintf('The confidence interval for the difference of true means is: (%6.3f,%6.3f)\n',l1, l2);
