function [c, ierr] = mybisection(f, a, b, tol, kmax)
% purpose: finding the zero of the function f(x) within the interval [a,b]
% using the bisection method.
%
% syntax: [c, ierr] = mybisection(f, a, b, tol, kmax)
% input:
% f:       name of the function to find the zero of
% a, b:    endpoints of the interval in which to search for the zero.
%          Note: for the bisection method to be applicable in the chosen interval,
%          the function f must have opposite values at the endpoints
%          (f(a)<0 and f(b)>0 or vice versa) and must contain a
%          single zero; if multiple zeros are present, one will be
%          randomly calculated.
% tol:     preset tolerance (maximum error the algorithm can make on the zero)
% kmax:    maximum number of iterations (safety factor used to
%          avoid the risk of infinite loops)
% output:
% c:       approximate zero of the function
% ierr:    error indicator, returns -1 if the algorithm finds a
%          result that does not meet the desired tolerance, 0 if it does.
%
% stopping criterion: the algorithm uses a preset tolerance on the error
% as the stopping criterion. Since the exact position of the zero is not known
% a priori, we use the tolerance on an error estimate (considering the width of
% the intervals - see line 85).
%
% example:
% f = @(x) x^3 - 7*x^2 + 14*x - 6;
% a = 0;
% b = 1;
% tol = 10^-2;
% kmax = 100;
% [c, ierr] = mybisection(f, a, b, tol, kmax);
%
% author: Zippo Luigi Emanuele

% initialize ierr, k, and err
ierr = -1;
k = 0;
err = tol + 1;

while (k <= kmax) && (err > tol)

   c = (b + a) / 2;

   % statically allocate f(a) and f(c) to compute the function fewer times
   % during the loop, saving computational cost. We don't need to compute f(b),
   % if f(a) and f(c) have the same sign, then f(c) and f(b) will surely have opposite signs
   A = f(a);
   C = f(c);

   if C == 0
       c
       break
   end

   if sign(C) * sign(A) > 0
       % if the function has the same signs at points a and c, continue the loop
       % on the interval [c,b], setting a = c
       a = c;
       A = C;
   else
       % if the function has opposite signs at a and c, repeat
       % the process on the interval [a,c], i.e., set b = c
       b = c;
       B = C;
   end

   err = 0.5 * (b - a);
   % err represents the maximum error that can be made during the loop.
   % If c belongs to [a,b], then its distance from one of the endpoints
   % will surely be less than (a-b)/2. If the maximum error is below the
   % tolerance, surely the actual error will be too. We make a pessimistic
   % estimate of the error.

   k = k + 1;
   
   if k < kmax
      ierr = 0;
   end

end

end
