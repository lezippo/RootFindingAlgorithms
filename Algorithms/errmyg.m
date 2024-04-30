function [x, ierr, errore, iter] = errmyg(g, x0, tol, kmax)
% Purpose: finding the fixed point of the function g(x) in an interval [a, b]
% which contains x0 (see syntax->x0)
%
% Syntax: [x, ierr] = myg(g, x0, tol, kmax)
% Input:
% g: name of the function for which to find the fixed point
% x0: according to the global convergence theorem, if g satisfies certain
%     hypotheses in the interval [a, b], for each x0 belonging to [a, b],
%     the sequence defined by x_k+1=g(x_k) (with k>=0) converges to the
%     unique fixed point in [a, b]; x0 is therefore a point in the
%     interval [a, b] mentioned in the theorem
% tol: preset tolerance (maximum error the algorithm can commit on the fixed point)
% kmax: maximum number of iterations (a safety factor used to avoid the risk
%       of infinite loops)
% Output:
% x: approximation of the fixed point
% ierr: error indicator, returns -1 if the algorithm finds a result that
%       does not meet the desired tolerance, 0 if it does
% errore: vector containing the estimate of errors iteratively
% iter: number of iterations performed
%
% Example:
% g = @(x) -x.^2./3 + x + 1;
% x0 = -0.5;
%
% [alfa, ierr, errore, iter] = myg(g, x0, tol, kmax);
%
% Author: Zippo Luigi Emanuele

k = 1;
ierr = -1;

while (k < kmax) && (ierr == -1)

   x = g(x0);

   errore(k) = abs(x - x0);

   if errore(k) < tol
       ierr = 0;
       iter = k;
       break;
   else
       x0 = x;
   end

   k = k + 1;

end

if ierr == -1
    iter = kmax;
end

errore = errore';

end
