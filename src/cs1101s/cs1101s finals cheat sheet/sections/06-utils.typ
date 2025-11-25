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