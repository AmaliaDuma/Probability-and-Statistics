% Approximations of the Binomial distribution

%    Normal approximation of the binomial distribution: For moderate values of p (0.05 ≤ p ≤ 0.95) and 
% large values of n (n → ∞) Bino(n, p) ≈ Norm (µ = np, σ =sqrt (n*p*(1 − p))

%    Write a Matlab code to visualize how the binomial distribution gradually takes the shape of the normal 
% distribution as n → ∞

p = input("p = ");

for n = 1:20:500
    values = 1:n;
    binoD = binopdf(values, n, p);
    subplot(2,1,1);
    plot(values, binoD);
    normD = normpdf(values, n*p, sqrt(n*p*(1-p)));
    subplot(2,1,2);
    plot(values,normD);
    pause(1)
    hold off; 
    % hold off sets the hold state to off so that new plots added to the 
    % axes clear existing plots and reset all axes properties
end

    
    
    

