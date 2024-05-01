# RootFindingAlgorithms
Find functions' zeros using Bisection, Fixed Point, Newton, Secants Methods
1. [Theory](#theory)
  - [Bisection Method](#bisection-method)
  - [Newton's Method](#newtons-method)
  - [Secant Method](#secant-method)
  - [Fixed-Point Method](#fixed-point-method)
  - [Comparison](#comparison)
2. [Function Documentation](#function-documentation)
  - [mybisection](#mybisection)
  - [mynewton](#mynewton)
  - [mysecant](#mysecant)
  - [myg](#myg)
  - [errmybisection](#errmybisection)
  - [errmynewton](#errmynewton)
  - [errmysecant](#errmysecant)
  - [errmyg](#errmyg)
3. [Examples](#examples)

# Theory
## Bisection Method

The bisection method is an iterative root-finding algorithm that operates by narrowing down the interval in which the root of a function lies. It does not require knowledge of the function's derivative and is guaranteed to converge to a solution if certain conditions are met.

1. **Interval Selection**: Start with an interval $[a, b]$ such that $f(a)$ and $f(b)$ have opposite signs, indicating the presence of a root between $a$ and $b$ (i.e., $f(a) \cdot f(b) < 0$).
2. **Iteration**: Divide the interval in half and evaluate the function at the midpoint $c$. If $f(c)$ is zero, $c$ is the root. Otherwise, determine which half of the interval contains the root by comparing the signs of $f(a)$ and $f(c)$.
3. **Convergence**: Repeat the process on the selected subinterval until the width of the interval is smaller than a predetermined tolerance or until a maximum number of iterations is reached

## Newton's Method

Newton's method is an iterative root-finding algorithm that uses the derivative of a function to converge quickly to a root. 

1. **Initial Guess**: Start with an initial guess $x_0$ close to the actual root.
2. **Iteration**: Iterate using the formula:
   $$x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$
   where $f(x_n)$ is the function we want to find the root of, and $f'(x_n)$ is its derivative.
3. **Convergence**: Repeat step 2 until $|f(x_n)|$ is smaller than a predetermined tolerance or until a maximum number of iterations is reached.

## Secant Method

The secant method is another iterative root-finding algorithm that doesn't require the derivative of the function. Instead, it approximates the derivative using finite differences. 

1. **Initial Guesses**: Start with two initial guesses $x_0$ and $x_1$ close to the actual root.
2. **Iteration**: Iterate using the formula:
   $$x_{n+1} = x_n - \frac{f(x_n)(x_n - x_{n-1})}{f(x_n) - f(x_{n-1})}$$
3. **Convergence**: Repeat step 2 until $|f(x_n)|$ is smaller than a predetermined tolerance or until a maximum number of iterations is reached.

## Fixed-Point Method

The fixed-point method is an iterative technique for finding the fixed point of a function. If the fixed point corresponds to a root of $g(x) = x$, it can be used to find the root of the original function. 

1. **Transformation**: Rewrite the equation $f(x) = 0$ as $g(x) = x$, where $g(x)$ is a rearrangement of $f(x)$.
2. **Initial Guess**: Start with an initial guess $x_0$.
3. **Iteration**: Iterate using the formula:
   $$x_{n+1} = g(x_n)$$
4. **Convergence**: Repeat step 3 until $|x_{n+1} - x_n|$ is smaller than a predetermined tolerance or until a maximum number of iterations is reached.

## Comparison

- **Bisection Method**:
  - Does not require knowledge of the function's derivative.
  - Guaranteed to converge to a solution if the function is continuous and changes sign over the interval.
  - Convergence rate is slower compared to Newton's method but can be more robust in certain scenarios.
- **Newton's Method**:
  - Requires the derivative of the function.
  - Generally converges faster.
  - Might fail if the derivative is close to zero or if it's not continuous.
- **Secant Method**:
  - Does not require the derivative.
  - Convergence might be slower.
  - Less sensitive to initial guesses compared to Newton's method.
- **Fixed-Point Method**:
  - Does not require the derivative.
  - Convergence can be slower than Newton's method but faster than the secant method.
  - Requires transforming the equation to find the fixed point.

All three methods are effective for finding roots of functions, with Newton's method being more efficient when the derivative is readily available and the function behaves well, the secant method being more versatile in cases where the derivative is not easily obtainable or the function is not well-behaved, and the fixed-point method providing an alternative approach when direct root-finding methods are not applicable.

# Code Structure

## mybisection

### Purpose
Find the zero of a function within an interval using the bisection method.

### Input
- `f` : The function for which the zero is to be found.
- `a`, `b` : The interval within which to search for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `c` : The approximate zero of the function within the specified interval.
- `ierr` : An indicator of whether the method converged or not.

## mynewton

### Purpose
Find the zero of a function using Newton's method.

### Input
- `f` : The function for which the zero is to be found.
- `fp` : The first derivative of the function.
- `x0` : The initial guess for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate zero of the function.
- `ierr` : An indicator of whether the method converged or not.

## mysecant

### Purpose
Find the zero of a function using the secant method.

### Input
- `f` : The function for which the zero is to be found.
- `x0`, `x1` : The initial guesses for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate zero of the function.
- `ierr` : An indicator of whether the method converged or not.

## myg

### Purpose
Find the fixed point of a function within an interval using fixed-point iteration.

### Input
- `g` : The function for which the fixed point is to be found.
- `x0` : The initial guess for the fixed point.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate fixed point of the function.
- `ierr` : An indicator of whether the method converged or not.

## errmybisection

### Purpose
Find the zero of a function within an interval using the bisection method with error estimation.

### Input
- `f` : The function for which the zero is to be found.
- `a`, `b` : The interval within which to search for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `c` : The approximate zero of the function within the specified interval.
- `ierr` : An indicator of whether the method converged or not.
- `errore` : An estimate of the error in the result.
- `iter` : The number of iterations performed.

## errmynewton

### Purpose
Find the zero of a function using Newton's method with error estimation.

### Input
- `f` : The function for which the zero is to be found.
- `fp` : The first derivative of the function.
- `x0` : The initial guess for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate zero of the function.
- `ierr` : An indicator of whether the method converged or not.
- `errore` : An estimate of the error in the result.
- `iterazioni` : The number of iterations performed.

## errmysecant

### Purpose
Find the zero of a function using the secant method with error estimation.

### Input
- `f` : The function for which the zero is to be found.
- `x0`, `x1` : The initial guesses for the zero.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate zero of the function.
- `ierr`: An indicator of whether the method converged or not.
- `errore` : An estimate of the error in the result.
- `iter`: The number of iterations performed.

## errmyg

### Purpose
Find the fixed point of a function using fixed-point iteration with error estimation.

### Input
- `g` : The function for which the fixed point is to be found.
- `x0` : The initial guess for the fixed point.
- `tol` : The desired accuracy of the result.
- `kmax` : The maximum number of iterations allowed.

### Output
- `x` : The approximate fixed point of the function.
- `ierr` : An indicator of whether the method converged or not.
- `errore` : An estimate of the error in the result.
- `iter` : The number of iterations performed.

# Examples
