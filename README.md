# RootFindingAlgorithms
Find functions' zeros using Bisection, Fixed Point, Newton, Secants Methods
Here's the table of contents for the readme:
1. [Theory](#theory)
  1. [Bisection Method](#bisection-method)
  2. [Newton's Method](#newtons-method)
  3. [Secant Method](#secant-method)
  4. [Fixed-Point Method](#fixed-point-method)
  5. [Comparison](#comparison)
2. [Code structure](#code-structure)
3. [Examples](#examples)

# Theory
## Bisection Method

The bisection method is an iterative root-finding algorithm that operates by narrowing down the interval in which the root of a function lies. It does not require knowledge of the function's derivative and is guaranteed to converge to a solution if certain conditions are met. Here's how it works:

1. **Interval Selection**: Start with an interval $[a, b]$ such that $f(a)$ and $f(b)$ have opposite signs, indicating the presence of a root between $a$ and $b$ (i.e., $f(a) \cdot f(b) < 0$).
2. **Iteration**: Divide the interval in half and evaluate the function at the midpoint $c$. If $f(c)$ is zero, $c$ is the root. Otherwise, determine which half of the interval contains the root by comparing the signs of $f(a)$ and $f(c)$.
3. **Convergence**: Repeat the process on the selected subinterval until the width of the interval is smaller than a predetermined tolerance or until a maximum number of iterations is reached

## Newton's Method

Newton's method is an iterative root-finding algorithm that uses the derivative of a function to converge quickly to a root. Here's how it works:

1. **Initial Guess**: Start with an initial guess $x_0$ close to the actual root.
2. **Iteration**: Iterate using the formula:
   $$x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$
   where $f(x_n)$ is the function we want to find the root of, and $f'(x_n)$ is its derivative.
3. **Convergence**: Repeat step 2 until $|f(x_n)|$ is smaller than a predetermined tolerance or until a maximum number of iterations is reached.

## Secant Method

The secant method is another iterative root-finding algorithm that doesn't require the derivative of the function. Instead, it approximates the derivative using finite differences. Here's how it works:

1. **Initial Guesses**: Start with two initial guesses $x_0$ and $x_1$ close to the actual root.
2. **Iteration**: Iterate using the formula:
   $$x_{n+1} = x_n - \frac{f(x_n)(x_n - x_{n-1})}{f(x_n) - f(x_{n-1})}$$
3. **Convergence**: Repeat step 2 until $|f(x_n)|$ is smaller than a predetermined tolerance or until a maximum number of iterations is reached.

## Fixed-Point Method

The fixed-point method is an iterative technique for finding the fixed point of a function. If the fixed point corresponds to a root of $g(x) = x$, it can be used to find the root of the original function. Here's how it works:

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

# Examples
