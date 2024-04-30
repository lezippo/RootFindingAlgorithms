# RootFindingAlgorithms
Find functions' zeros using Bisection, Fixed Point, Newton, Secants Methods

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
