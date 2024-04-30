function [x, ierr, errore, iterazioni] = errmynewton(f, fp, x0, tol, kmax)
% Purpose: finding the zero of a function using the Newton's method
%
% Syntax: [x, ierr, errore, iter] = errmynewton(f, fp, x0, tol, kmax)
% Input:
% f: name of the function for which to find the zero
% fp: name of the first derivative function of f
% x0: according to the local convergence theorem, there exists a neighborhood
%     of the zero of the function in which, choosing any initial point, the
%     sequence generated with Newton's method converges to the zero of the
%     function. x0 is the starting point of the iteration formula
% tol: preset tolerance (maximum error the algorithm can commit on the zero)
% kmax: maximum number of iterations (a safety factor used to avoid the risk
%       of infinite loops)
% Output:
% x: approximate zero of the function
% ierr: error indicator, returns -1 if the algorithm finds a result that
%       does not meet the desired tolerance, 0 if it does
% errore: vector containing the estimate of errors iteratively
% iterazioni: number of iterations performed
%
% Stopping criterion: the algorithm uses as a stopping criterion an estimate
% of the error calculated on successive iterates
%
% Example:
% f = @(x) cos(2*x)^2 - x^2;
% fp = @(x) -2 * cos(2*x) * sin(2*x) - 2 * x;
% x0 = 10;
% tol = 10^-10;
% kmax = 100;
%
% [x, ierr, errore, iterazioni] = errmynewton(f, fp, x0, tol, kmax)
%
% Author: Luigi Emanuele Zippo

ierr = -1;
k = 1;

while (k < kmax) && (ierr == -1)

    x1 = x0 - f(x0) / fp(x0);
     
    errore(k) = abs(x1 - x0);

    if errore(k) < tol
        x = x1;
        ierr = 0;
        iterazioni = k;
        break;
    else
        x0 = x1;
    end

    k = k + 1;
    
end

if ierr == -1
    iterazioni = kmax;
end

errore = errore';

end
