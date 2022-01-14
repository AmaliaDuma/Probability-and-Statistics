% Using a U(0, 1) (standard uniform) random number generator, generate the common discrete probability distributions:

% d) Pascal Distribution NB(n, p) with parameters n ∈ IN, p ∈ (0, 1)
% Hint: A Pascal NB(n, p) variable is the sum of n independent Geo(p) variables

% Generate a Pascal variable X

n = input("Input number of successes: ");
p = input("Input probability of success: ");

% Generate n independent geometric Geo(p) variables)
for i = 1:n
    Y(i) = 0;
    while rand >= p
        Y(i) = Y(i) + 1;
    end
end

X = sum(Y);

% Generate the Pascal distribution

N = input("Input number of simulations: ");

for i = 1:N
    for j = 1:n
        Y(j)=0;
        while rand >= p
            Y(j) = Y(j)+1;
        end
        X(i) = sum(Y);
    end
end

% unique(A) returns the same data as in A, but with no repetitions and sorted
UX = unique(X)
% hist shows the distribution of data values
fr = hist(X, length(UX))
relative_frequency = fr/N
