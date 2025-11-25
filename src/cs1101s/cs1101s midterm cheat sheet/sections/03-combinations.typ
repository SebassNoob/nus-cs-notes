#import "../utils.typ": *

= Permutations and Combinations
== Permutations
Get permutations of a list. Order matters.

#sourcecode[```ts
function permutations<T>(xs: List<T>): List<List<T>> {
  if (is_null(xs)) {
    return list(null);
  } else {
    // flatten list [[[1,2]], [[2, 1]]] => [[1,2], [2, 1]]
    // x is prepended to all possible permutations
    return accumulate(
      append,
      list(),
      map(
        // choose x from xs
        x => map(
          // prepend x to the permutations of remaining
          p => pair(x, p),
          // recursively generate all permutations of remaining list
          permutations(remove(x, xs))
        ),
        xs
      )
    );
  }
}
```]


== Combinations
Get combinations of sub-lists (length $r$) of a list. 

#sourcecode[```ts
// 0 <= r <= n
function combinations<T>(xs: List<T>, r: number): List<List<T>> {
  if (r === 0) {
    return list(null);
  } else if (is_null(xs)) {
    return null;
  } else {
    // we do not choose the head(xs)
    const no = combinations(tail(xs), r);
    // choose the head(xs) and prepend it to possible combinations of length r - 1
    const yes = map(
      x => pair(head(xs), x),
      combinations(tail(xs), r - 1)
    );
    return append(no, yes);
  }
}
```]

== N Choose R

#sourcecode[```ts
// Formula: nCr = n! / (r! × (n-r)!)
// Recursive: nCr = (n-1)C(r-1) + (n-1)Cr (Pascal's triangle)
// Example: 5C3 = 4C2 + 4C3 = 6 + 4 = 10
function nCr(n, r) {
  if (r > n || r < 0) return 0;
  if (r === 0) return 1;

  // choose + dont choose
  return nCr(n - 1, r - 1) + nCr(n - 1, r);
}
```]

== N Permute R
#sourcecode[```ts
// Formula: nPr = n! / (n-r)!
// Recursive: nPr = n × (n-1)P(r-1)
// Example: 5P3 = 5 × 4P2 = 5 × 4 × 3P1 = 5 × 4 × 3 = 60
function nPr(n, r) {
  if (r > n || r < 0) return 0;
  if (r === 0) return 1;

  return n * nPr(n - 1, r - 1);
}
```]


== Subsets
Get all possible subsets of $"xs"$. Modified version of combinations.

#sourcecode[```ts
function subsets<T>(xs: List<T>): List<List<T>> {
  if (is_null(xs)) {
    return list(null);
  } else {
    const no = subsets(tail(xs));
    const yes = map(
      // prepend all head elems onto the remainder
      x => pair(head(xs), x),
      subsets(tail(xs))
    );
    return append(no, yes);
  } 
}
```]