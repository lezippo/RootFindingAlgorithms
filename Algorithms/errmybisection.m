function [c, ierr, errore, iter] = errmybisection(f, a, b, tol, kmax)
% Purpose: finding the zero of the function f(x) in the interval [a,b]
% using the bisection method.
%
% Syntax: [c, ierr] = mybisection(f, a, b, tol, kmax)
% Input:
% f: name of the function for which to find the zero
% a, b: endpoints of the interval in which to search for the zero.
%       Note: for the bisection method to be used in the chosen interval,
%       the function f must have opposite values at the endpoints
%       (f(a)<0 and f(b)>0 or vice versa), and it must contain a
%       unique zero. If multiple zeros are present, one will be
%       randomly calculated.
% tol: preset tolerance (maximum error the algorithm can commit on the zero)
% kmax: maximum number of iterations (a safety factor used to avoid the risk
%       of infinite loops)
% Output:
% c: approximate zero of the function
% ierr: error indicator, returns -1 if the algorithm finds a result that
%       does not meet the desired tolerance, 0 if it does
% errore: vector containing the estimate of errors iteratively
% iter: number of iterations performed
%
% Stopping criterion: the algorithm uses a preset tolerance on the error
% as a stopping criterion. Since the exact position of the zero is not
% known in advance, we use the tolerance on an estimate of the error
% (computed considering the width of the intervals, see line 85).
%
% Example:
% f = @(x) x^3 - 7*x^2 + 14*x - 6;
% a = 0;
% b = 1;
% tol = 10^-2;
% kmax = 100;
% [c, ierr] = mybisection(f, a, b, tol, kmax);
%
% Author: Zippo Luigi Emanuele

ierr = -1;
k = 1;
err = tol + 1;

while (k <= kmax) && (err > tol)

   c = (b + a) / 2;

   A = f(a);
   C = f(c);

   if C == 0
       break;
   end

   if sign(C) * sign(A) > 0
       a = c;
       A = C;
   else
       b = c;
       B = C;
   end

   err = 0.5 * (b - a);
   errore(k) = err;
   k = k + 1;
   
   if k < kmax
      ierr = 0;
   end

   if(err < tol)
       iter = k;
   end

end

if ierr == -1
    iter = kmax;
end

errore = errore';

end
