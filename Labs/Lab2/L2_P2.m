% A coin is tossed 3 times. Let X denote the number of heads that appear.
x = 0:3;

% a) pdf of X
y = binopdf(x,3,0.5);
subplot(2,1,1);
plot(x,y);
title('Pdf of X');

% b) cdf of X
y1 = binocdf(x,3,0.5);
subplot(2,1,2);
plot(x,y);
title('Cdf of X');

% c) P(X= 0), P(X != 1) = 1 - P(X = 1)
px0 = binopdf(0,3,0.5)
pxn1 = 1 - binopdf(1,3,0.5)

% d) P(X ≤ 2), P(X < 2) = P(X<=2) - P(X=2)
pxse2 = binocdf(2,3,0.5)
pxs2 = binocdf(2,3,0.5) - binopdf(2,3,0.5)

% e) P(X ≥ 1)= 1 - P(X<1)= 1-P(X=0)
%    P(X > 1)= 1 - P(X<=1)
pxge1 = 1 - binopdf(0,3,0.5)
pxg1 = 1 - binocdf(1,3,0.5)

% f) Write a Matlab code that simulates 3 coin tosses and computes the value of the
%variable X.
N =3;
X=0;
for i=1:N
   toss=rand;
   if toss>0.5
     X=X+1;
   end
end
X

