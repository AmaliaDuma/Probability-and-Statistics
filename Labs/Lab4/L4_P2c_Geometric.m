% Using a U(0, 1) (standard uniform) random number generator, generate the common discrete probability distributions:

% c) Geometric Distribution Geo(p), with parameter p ∈ (0, 1)
% Hint: A geometric Geo(p) variable represents the number of failures 
%(i.e. the number of Bernoulli trials that ended up being failures) needed to get the first success

% Generate a Geometric variable X

p = input("Input p in (0,1): ");

% Count the number of failures -> (U<p) = 0 where U is the random generated
% Number - we do it using rand here, that occur before the first success

while(rand >= p)
    X = X+1;
end

% Generate the distribution

N = input("Input the number of simulations: ");

for i = 1:N 
    X(i)=0;
    while(rand >= p)
        X(i) = X(i) + 1;
    end  
end

% unique(A) returns the same data as in A, but with no repetitions and sorted
UX = unique(X)
% hist shows the distribution of data values
fr = hist(X, length(UX))
relative_frequency = fr/N

% Do a graphic comparison between the simulation and the distribution itself
xpdf = 0:N;
ypdf = geopdf(xpdf, p);

subplot(2,1,1);
plot(xpdf, ypdf);
title("Geometric distribution");
subplot(2,1,2);
plot(UX, relative_frequency);
title("Simulation of geometric distribution");
