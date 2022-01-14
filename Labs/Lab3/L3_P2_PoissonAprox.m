%  Poisson approximation of the binomial distribution: If n ≥ 30 and p ≤ 0.05, then
% Bino(n, p) ≈ Poisson(λ = np)

p = input("p <= 0.05 = ");
% n = input("n >=30 = ");

for n=30:20:300
    values = 1:n;
    binoD = binopdf(values,n,p);
    subplot(2,1,1);
    plot(values, binoD);
    poissD = poisspdf(values,n*p);
    subplot(2,1,2);
    plot(values,poissD);
    pause(1)
    hold off; 
    % hold off sets the hold state to off so that new plots added to the 
    % axes clear existing plots and reset all axes properties
end
