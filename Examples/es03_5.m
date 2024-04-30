format long

f = @(x) x.^6 - x - 1;
fp = @(x) 6 .* x.^5 - 1;
g = @(x) x;
tol = 0.001;
kmax = 15;

% Transforming zero finding into fixed point iteration
h = @(x) x - f(x);
x0 = 1;

hold on;
axis([-3, 3, -5, 5]);
fplot(f, [-3, 3], 'm');
fplot(h, [-3, 3], 'g');
fplot(g, [-3, 3], 'k');
plot([-3, 3], [0, 0], 'k');

a = 1;
b = 1.2;

disp('Bisection')
[c, ierr, errore, iterazioni] = errmybisection(f, a, b, tol, kmax)

disp('Fixed Point')
[c, ierr, errore, iterazioni] = errmyg(h, x0, tol, kmax)

disp('Newton')
[x, ierr, errore, iterazioni] = errmynewton(f, fp, b, tol, kmax)

disp('Secant')
[x, ierr, errore, iterazioni] = errmysecant(f, a, b, tol, kmax)

% The fixed-point method does not converge for the function h in the considered interval.
% Newton's method and the secant method have the same computational cost, which is lower than that of the bisection method.
% We can conclude that the most advantageous method is Newton's method, which terminates in only 3 iterations.
