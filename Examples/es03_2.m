kmax = 100;
tol = 0.5 * 10^-4;
f = @(x) cosh(x) + cos(x) - 1;
g = @(x) cosh(x) + cos(x) - 2;
h = @(x) cosh(x) + cos(x) - 3;
fp = @(x) sinh(x) - sin(x);

hold on;
fplot(f, 'm');
fplot(g, 'g');
fplot(h, 'b');
xl = xlim;
line(xl, [0,0]);
legend('gamma=1', 'gamma=2', 'gamma=3', 'x-axis');

% f does not intersect the x-axis, so it does not make sense to apply Newton's method to find a zero

% As we can see from the graph, the zero of g is at a minimum point (x=0). So, for x approaching zero, the derivative tends to zero, causing division by zero problems.

x0 = 1;
disp('gamma=2');
[x, ierr] = mynewton(g, fp, x0, tol, kmax);

% For gamma=3, we still have problems at x=0, but the zeros of the function are far enough from the minimum and we can approximate them well.

disp('gamma=3');

disp('Applying Newton for x very close to the minimum:');
x0 = 10^-10;
[x, ierr] = mynewton(h, fp, x0, tol, kmax);

disp('Negative zero:');
x0 = -1;
[x, ierr] = mynewton(h, fp, x0, tol, kmax);

x0 = 1;
disp('Positive zero:');
[x, ierr] = mynewton(h, fp, x0, tol, kmax);
