#import "../utils.typ": *

= Utilities
== Definitions
*Tree*: A tree of a certain data type is a list whose elements are of that data type, or trees of that data type.
#sourcecode[```ts
type Tree<T> = List<T | Tree<T> | null>
```]
*List*: A list is either null or a pair whose tail is a list.
== Take/Drop
=== Take
Take the first $n$ elements.

#sourcecode[```ts
function take<T>(xs: List<T>, n: number): List<T> {
  return n === 0
    ? null
    : pair(head(xs), take(tail(xs), n - 1));
}
```]

=== Drop
Drop the first $n$ elements.

#sourcecode[```ts
function drop<T>(xs: List<T>, n: number): List<T> {
  return n === 0
    ? xs
    : drop(tail(xs), n - 1);
}
```]

== Unique
Get all unique elements.

#sourcecode[```ts
function unique<T>(xs: List<T>): List<T> {
  return is_null(xs) 
    ? null
    : append(
        list(head(xs)), 
        unique(remove_all(head(xs), tail(xs)))
    );
}
```]

== Sinusoidal transformations (for sound)
For $f(x) = a sin(b x + c) + d$

=== Amplitude
- $a$: amplitude scaling factor
- $|a| > 1$: stretch, $0 < |a| < 1$: compress
- $a < 0$: reflect across x-axis

=== Period  
- $b$: period scaling factor
- $|b| > 1$: compress, $0 < |b| < 1$: stretch
- Period = $(2pi) / (|b|)$

=== Phase Shift
- $c$: horizontal shift factor
- Phase shift = $-c/b$ units
- $c > 0$: left shift, $c < 0$: right shift

=== Vertical Translation
- $d$: vertical shift
- $d > 0$: up, $d < 0$: down

== Parametric Curve Transformations (for curves)

For curve $x = f(t)$, $y = g(t)$ where $t$ is the parameter.

=== Scaling
$x = k_x dot f(t)$, $y = k_y dot g(t)$

- $k_x$: horizontal scaling factor
- $k_y$: vertical scaling factor  
- $k_x, k_y > 1$: stretch
- $0 < k_x, k_y < 1$: compress
- $k_x, k_y < 0$: reflect and scale

=== Translation
$x = f(t) + h$, $y = g(t) + k$

- $h$: horizontal shift (positive = right)
- $k$: vertical shift (positive = up)

=== Direction Reversal
$x = f(-t)$, $y = g(-t)$

- $t arrow -t$: reverses curve orientation

== Evaluating SKI combinatorics problems
Rules:
- $(K a b) -> a$
- $(I x) -> x$
- $(S f g x) -> (f x)(g x)$

Tips:
1. $S$ requires 3 args, $K$ requires 2 args, $I$ requires 1 arg.
2. Scan left to right. Each combinator "expects" a certain number of arguments. As soon as it is satisfied, reduce.
3. Reduce innermost complete groups. eg. $S (K I) K x = (K I x) (K x) = I(K x) = K x$

== List shifting
=== Shift element from end to start
#sourcecode[```ts
function shift<T>(xs: List<T>): List<T> {
  return is_null(xs)
    ? null
    : accumulate(pair, list(head(xs)), tail(xs));
}
```]

=== Shift element from start to end
#sourcecode[```ts
function shift<T>(xs: List<T>): List<T> {
  if (is_null(tail(xs)) || is_null(xs)) {
    return xs;
  } else {
    const wish = shift(tail(xs));
    return pair(head(wish), pair(head(xs), tail(wish)));
  }
}
```]

== Active Lists (slices)
Kind of like a Golang slice. `make_active_list(xs: List<unknown>)` returns a function with 1 argument. Calling this function with argument $n$, $0<=n<="length(xs)" - 1$ results in `xs[n]`, otherwise `null`.
=== Length
Recover length of list backing active list.
#sourcecode[```ts
function length<T>(as: ActiveList<T>): number {
  function h(as: ActiveList<T>, count: number): number {
    return is_null(as(count)) 
      ? 0
      : 1 + h(as(count), count + 1);
  }
  return h(as, 0);
}
```]
=== Delete
Delete $"as"["pos"]$ from $"as"$, resulting in a active list that is length $n-1$.
#sourcecode[```ts
function remove<T>(as: ActiveList<T>, pos: number): ActiveList<T> {
  return p => p < pos ? A(p) : A(p + 1);
}
```]
=== Append
Append active list `as` to `bs`.

Note: see active list length function in earlier section.
#sourcecode[```ts
function append<T>(as: ActiveList<T>, bs: ActiveList<T>): ActiveList<T> {
  // as has indexes from 0...(length(as) - 1)
  return p => p < length(as) ? as(p) : bs(p);
}
```]
== Vectors
=== Equality
#sourcecode[```ts
function equal(x: List<number>, y: List<number>): boolean {
  return is_pair(x) && is_pair(y)
    ? head(x) === head(y) && equal(tail(x), tail(y))
    // we have reached the end, assert length equality
    : is_null(x) && is_null(y);
}
```]

=== Dot product
Assume equal length vectors.
#sourcecode[```ts
function dot(x: List<number>, y: List<number>): number {
  return is_null(x)
    ? 0
    : head(x) * head(y) + dot(tail(x), tail(y));
}
```]
=== Distance between vectors
Assume equal length vectors. Formula is $d_v = sqrt(sum_(n=0)^(dim(v))(x_n - y_n)^2)$
#sourcecode[```ts
function dist(x: List<number>, y: List<number>): number {
  const square = x => x * x; // for some fuckass reason pow()/** operator is not available in source s2
  
  function h(x: List<number>, y: List<number>): number {
    return is_null(x)
      ? 0
      : square(head(x) - head(y)) + h(tail(x), tail(y));
  }
  return math_sqrt(h(x, y));
}
```]

== Matrices
Represented as `List<List<T>>`.
=== Getting element
#sourcecode[```ts
function get_elem<T>(M: List<List<T>>, r: number, c: number): T {
  return list_ref(list_ref(M, r), c);
}
```]

=== Transposition
Flip rows and columns.
#sourcecode[```ts
function transpose(M: List<List<T>>): List<List<T>> {
  const nR = length(M); // number of rows
  const nC = length(head(M)); // number of columns
  
  return map( c => map(r => get_elem(M, r, c), enum_list(0, nR - 1)) ,
  enum_list(0, nC - 1) );
}
```]

=== Addition
#sourcecode[```ts
function add_matrices<T extends number>(
  M1: List<List<T>>,
  M2: List<List<T>>
): List<List<T>> {
  const nR = length(M1);
  const nC = length(head(M1));

  return map(
    r => map(
      c => get_elem(M1, r, c) + get_elem(M2, r, c),
      enum_list(0, nC - 1)
    ),
    enum_list(0, nR - 1)
  );
}
```]

=== Multiplication
Assume M1 and M2 have n rows and n columns respectively.

Note: see vector `dot()`.
#sourcecode[```ts
function multiply_matrices(
  M1: List<List<number>>,
  M2: List<List<number>>
): List<List<number>> {
  const M2T = transpose(M2);
  return map(
    row => map(col => dot(row, col), M2T),
    M1
  );
}
```]

== Continuation-Passing Style

*Motivation:* A programming pattern where we convert recursive functions into iterative ones by passing the "rest of the computation" as a function argument. This deferred operation (the continuation) accumulates the work to be done after the current step completes. CPS can convert any recursive function into an iterative form.

*Recursive version:*
#sourcecode[```ts
function factorial(n: number): number {
  return n === 1
    ? 1
    : n * factorial(n - 1);
}
```]

*CPS version (iterative):*
#sourcecode[```ts
function fac<T>(n: number, c: (x: number) => T): T {
  return n === 1
    ? c(1)
    : fac(n - 1, x => c(n * x));
}

function factorial_iter(n: number): number {
  return fac(n, x => x);
}
```]

The continuation `c` accumulates the pending multiplications. Instead of building up a call stack, we build up a chain of functions that will be applied once we reach the base case.