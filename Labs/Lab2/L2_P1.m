% Plot the pdf and the cdf of a random variable X having a binomial distribution of parameters n and p(given by the user).

n = input("Input number of trials: ")
p = input("Input probability: ")

x = 0:1:n;
y = binopdf(x,n,p);
subplot(2,1,1);
plot(x,y);
y1 = binocdf(x,n,p);
subplot(2,1,2);
plot(x,y1);
