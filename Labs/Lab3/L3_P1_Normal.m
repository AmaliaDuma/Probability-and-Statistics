% X has the following distributions: X∈N(μ,σ) (normal)
miu = input("miu = ");
sigma = input("sigma > 0= ");
alpha = input("alpha e (0,1) = ");
beta = input("beta e (0,1) = ");

% a) P(X≤0)=cdf(0) 
pa1 = normcdf(0,miu,sigma)

% P(X≥0)=1-P(X<0)=1-P(X<=0)
pa2 = 1 - normcdf(0,miu,sigma)

% b)  P(−1 ≤ X ≤ 1) = F_X(-1) - F_X(1)
pb1 = normcdf(1,miu,sigma) - normcdf(-1,miu,sigma)

%  P(X ≤ −1 or X ≥ 1) = 1 - P(−1 ≤ X ≤ 1)
pb2 = 1 - pb1

% c) the value xα such that P(X < xα) = α, for α ∈ (0, 1) (xα = quantile of order α)
% P(X < xα) = F_X(xα) => F_X(xα) = α => xα = F^(-1)_X(α)
pc = norminv(alpha,miu,sigma)

% d) the value xβ such that P(X > xβ) = β, for β ∈ (0, 1) (xβ is the quantile of order 1 − β).
% P(X > xβ) = 1 - P(X <= xβ) = 1 - F_X(xβ) => 1 - F_X(xβ) = β ;
%                 =>  F_X(xβ) = 1-β => xβ = F^(-1)_X(1-β)
pd = norminv(1-beta,miu,sigma)
