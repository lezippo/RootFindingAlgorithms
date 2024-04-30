function [x, ierr, errore, iter] = errmysecant(f, x0, x1, tol, kmax)
% Purpose: finding the zero of a function using the secant method
%
% Syntax: [x, ierr, errore, iter] = errmysecant(f, x0, x1, tol, kmax)
% Input :
% f: name of the function for which to find the zero
% x0, x1: initial points of the iterative method. The method calculates
%         iteratively the intersection between the secant line and the
%         graph of f at points (x0, f(x0)) and (x1, f(x1))
% tol: preset tolerance (maximum error the algorithm can commit on the zero)
% kmax: maximum number of iterations (a safety factor used to avoid the risk
%       of infinite loops)
% Output:
% x: approximate zero of the function
% ierr: error indicator, returns -1 if the algorithm finds a result that
%       does not meet the desired tolerance, 0 if it does
% errore: vector containing the estimate of errors iteratively
% iter: number of iterations performed
%
% Stopping criterion: the algorithm uses as a stopping criterion an estimate
% of the error calculated on successive iterates
%
% Example:
% f = @(x) x^2 - 2;
% x0 = 1;
% x1 = 2;
% tol = 10^-8;
% kmax = 100;
%
% [x, ierr] = mysecant(f, x0, x1, tol, kmax)
%
% Author: Luigi Emanuele Zippo

ierr = -1;
k = 1;

while (k < kmax) && (ierr == -1)
     
    F1 = f(x1);
    F0 = f(x0);
    x = x1 - F1 * (x1 - x0) / (F1 - F0);
    errore(k) = abs(x - x0);

    if abs(x - x0) < tol
        ierr = 0;
        iter = k;
        break;
    else
        x0 = x1;
        F0 = F1;
        x1 = x;
    end

    k = k + 1;

end

if ierr == -1
    iter = kmax;
end

errore = errore';

end
