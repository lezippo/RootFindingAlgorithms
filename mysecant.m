function [x,ierr]=mysecant(f,x0,x1,tol,kmax)
% purpose: finding the zero of a function using the secant method
%
% syntax:  [x,ierr]=mysecant(f,x0,x1,tol,kmax)
% input :
% f:       name of the function for which you want to find the zero
% x0, x1:  initial points of the iterative method. The method calculates iteratively
%          the intersection between the secant line and the graph of f at points
%          (x0,f(x0)) and (x1,f(x1))
% tol:     preset tolerance (maximum error the algorithm can commit
%          on the zero)
% kmax:    maximum number of iterations (safety factor used to avoid
%          the risk of infinite loops)
% output:
% x:       approximated zero of the function
% ierr:    error indicator, returns -1 if the algorithm finds a
%          result that does not satisfy the desired tolerance, 0 if it does
%
% stopping criterion: the algorithm uses an estimate of the error calculated on successive iterations
%
% example:
% f=@(x) x^2-2
% x0=1;
% x1=2;
% tol=10^-8;
% kmax=100;
%
% [x,ierr]=mysecant(f,x0,x1,tol,kmax)
%
% Author: Luigi Emanuele Zippo

ierr=-1;
k=0;

while (k<kmax)&&(ierr==-1)

    % allocate f(x0) and f(x1) to perform only 2 function evaluations
    
    F1=f(x1);
    F0=f(x0);

    x=x1-F1*(x1-x0)/(F1-F0);

    % x1-F1*(x1-x0)/(F1-F0) represents, graphically, the intersection between
    % the secant through (x0,f(x0)) and (x1,f(x1)).

    if abs(x-x0)<tol

        ierr=0;
        break

    else

        % if the obtained value does not satisfy the tolerance then
        % assign x1 to x0, F1 to F0, and x to x1. This way the loop
        % will compute the next secant passing through (x1,f(x1))
        % and (x,f(x))

        x0=x1;
        F0=F1;
        x1=x;

    end

    k=k+1;

end


end
