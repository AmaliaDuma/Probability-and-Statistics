% Using a U(0, 1) (standard uniform) random number generator, generate the common discrete probability distributions:

% b) Binomial Distribution Bino(p),with parameters n ∈ IN, p ∈ (0, 1)
% Hint: A binomial Bino(n, p) variable is the sum of n independent Bern(p) variables

% Generate a discrete random variable X

n = input("Input number of trials: ");
p = input("Input p in (0,1): ");

% Return n values, one for each Bern(p) variable
U = rand(n,1);
% Compute the sum of the n independent Bern(p) variables knowing a variable Bern(p) = U < p
X = sum(U<p);

% Generate the Binomial distribution
N = input("Input number of simulations: ");

for i = 1:N
    U = rand(n,1);
    X(i) = sum(U<p);
end

% unique(A) returns the same data as in A, but with no repetitions and sorted
UX = unique(X)
% hist shows the distribution of data values
fr = hist(X, length(UX))
relative_frequency = fr/N

% Do a graphic comparison between the simulation and the distribution itself
xpdf = 0:n;
ypdf = binopdf(xpdf, n, p);

subplot(2,1,1);
plot(xpdf, ypdf);
title("Binomial distribution");
subplot(2,1,2);
plot(UX, relative_frequency);
title("Simulation of binomial distribution");
