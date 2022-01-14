% Using a U(0, 1) (standard uniform) random number generator, generate the common discrete probability distributions:

% a) Bernoulli Distribution -> Bern(p), with parameter p ∈ (0, 1)

% Generate X 
p = input("Input probability of success in (0,1): ");

if(p<0 || p>1)
    fprintf("Invalid value")
end

% rand returns a single uniformly distributed random number in the interval (0,1)
U = rand;
X = (U < p);

% Generate the Bernoulli distribution
N = input("Number of simulations: ");

for i = 1:N
    U = rand;
    X(i) = (U < p);
end

% unique(A) returns the same data as in A, but with no repetitions and sorted
UX = unique(X)
% hist shows the distribution of data values
fr = hist(X, length(UX))
relative_frequency = fr/N
    
