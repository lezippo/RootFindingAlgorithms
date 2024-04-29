function [x, ierr] = myg(g, x0, tol, kmax)
% purpose: finding the fixed point of the function g(x) in an interval [a,b]
% to which x0 belongs (see syntax->x0)
%
% syntax: [x, ierr] = myg(g, x0, tol, kmax)
% input:
% g:       name of the function for which the fixed point is to be found
% x0:      according to the global convergence theorem, if g satisfies particular
%          assumptions in the interval [a,b], for every x0 belonging to [a,b],
%          the sequence defined by x_k+1 = g(x_k) (with k>=0) converges
%          to the unique fixed point in [a,b]; x0 is thus a point
%          in the interval [a,b] mentioned by the theorem
% tol:     preset tolerance (maximum error the algorithm can
%          commit on the fixed point)
% kmax:    maximum number of iterations (security factor used to avoid
%          the risk of infinite cycles)
% output:
% x:       approximation of the fixed point
% ierr:    error indicator, returns -1 if the algorithm finds a
%          result that does not satisfy the desired tolerance, 0 if instead
%          it does satisfy it
%
% example:
% g = @(x) -x.^2./3 + x + 1;
% x0 = -0.5;
%
% [alpha, ierr] = myg(g, x0, tol, kmax);
%
% author: Luigi Emanuele Zippo

k = 0;
ierr = -1;

while (k < kmax) && (ierr == -1)

% compute the value of g at x0 and assign it to the variable x in order to
% perform a single function evaluation

   x = g(x0);

   if abs(x - x0) < tol

       ierr = 0;

       break

   else

   % if the found value still does not satisfy the tolerance, assign it to x0
   % in order to compute its image through g once the loop restarts

       x0 = x;

   end

   k = k + 1;

end

end
