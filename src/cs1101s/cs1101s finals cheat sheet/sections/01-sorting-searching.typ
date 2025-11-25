#import "../utils.typ": *

= Sorting and searching
== Insertion sort
Take elements from right to left, insert them in the right sorted portion of the list. This algorithm sorts *in-place*.

*Time complexity*:
- Best: $Theta(n)$; already sorted array
- Average: $Theta(n^2)$
- Worst: $Theta(n^2)$; array sorted in reverse

*Space complexity*:
Recursion depth = $n$; re-uses the tail list.
- Best / Average / Worst: $Theta(n)$

#sourcecode[```ts
function insert(x: number, xs: List<number>): List<number> {
  if (is_null(xs)) {
    return list(xs);
  } else if (x <= head(xs)) {
    // found correct position, resolve
    return pair(x, xs);
  } else {
    // move element ahead
    return pair(head(xs), insert(x, tail(xs)));
  }
}

function insertion_sort(xs: List<number>): List<number> {
  return is_null(xs)
    ? xs
    : insert(head(xs), insertion_sort(tail(xs)));
}
```]


== Selection sort
Choose the smallest element in a list. Place that element in order in a new list. 

*Time complexity*:
Number of comparisons is fixed.
- Best/Average/Worst: $Theta(n^2)$

*Space complexity*:
Recursion depth = $n$; $"remove"()$ creates an $n$ sized copy.
- Best/Average/Worst: $Theta(n^2)$

#sourcecode[```ts
function smallest(xs: List<number>): number {
  function h(xs: List<number>, min: number): number {
    return is_null(xs)
      // reached the end
      ? min
      : head(xs) < min
        // found a smaller number than min. use that
        ? h(tail(xs), head(xs))
        : h(tail(xs), min);
  }
  return h(xs, head(xs));
}

function selection_sort(xs: List<number>): List<number> {
  if (is_null(xs)) {
    return xs;
  } else {
    const s = smallest(xs);
    // smallest elem s goes in front of the list
    return pair(s, selection_sort(remove(s, xs)));
  }
}
```]

== Quick sort
A divide-and-conquer algorithm. Choose a pivot, and partition the remaining elements into 2 groups: smaller and larger. Then recursively partition the groups: $"quicksort"("smaller") + ["pivot"] + "quicksort"("larger")$.

*Time complexity*:
- Best: $Theta(n log n)$
- Average: $Theta(n log n)$
- Worst: $Theta(n^2)$; pivot always unbalanced, ie. $"smaller" << "bigger"$ or $"bigger" >> "smaller"$

*Space complexity*:
- Best: $Theta(n log n)$
- Average: $Theta(n log n)$; recursion depth = $log n$.
- Worst: $Theta(n^2)$; pivot always unbalanced, recursion depth = $n$.

#sourcecode[```ts
function partition(xs: List<number>, pivot: number): Pair<List<number>, List<number>> {
  return accumulate(
    (curr, acc) => {
      if (curr <= xs) {
        return pair(
          pair(curr, head(acc)),
          tail(acc)
        );
      } else {
        return pair(
          head(acc),
          pair(curr, tail(acc))
        );
      }
    },
    pair(list(), list()), // 0 is smaller, 1 is larger
    xs
  );
}

function quicksort(xs: List<number>): List<number> {
  if (is_null(xs)) {
    return list(null);
  } else {
    const pivot = head(xs);
    const s = partition(tail(xs), pivot);
    return append(
      quicksort(head(s)), // smaller
      append(
        list(pivot),
        quicksort(tail(s)) // larger
      )
    );
  }
}
```]


== Merge sort
Divide and conquer. Recursively split unsorted elements and then merge them back together sorted.

Note: see utilities for implementation of $"take()"$ and $"drop()"$.

*Time complexity*:
Splitting creates $log n$ problems of merging lists of size $n$
- Best/Average/Worst: $Theta(n log n)$

*Space complexity*:
Merging creates a list with total size $n$
- Best/Average/Worst: $Theta(n)$

#sourcecode[```ts
function merge(xs: List<number>, ys: List<number>): List<number> {
  // base cases: run out of elements in one of the lists, just append the other list
  if (is_null(xs)) {
    return ys;
  } else if (is_null(ys)) {
    return xs;
  }
}

function merge_sort(xs: List<number>): List<number> {
  if (is_null(xs) || is_null(tail(xs))) {
    return xs;
  } else {
    const mid = math_floor(length(xs) / 2);
    return merge(
      // continue splitting until base case
      merge_sort(take(xs, mid)),
      merge_sort(drop(xs, mid)) 
    );
  }
}
```]

== Binary search
Assume sorted list. 

*Time complexity*:
$"list_ref()"$ is an $O(n)$ operation.
- Best: $Theta(n)$; target in the middle
- Average: $Theta(n)$
- Worst: $Theta(n)$; $log n$ iterations

*Space complexity*:
$log n$ iterations asymptotically.
- Best/Average/Worst: $Theta(log n)$


#sourcecode[```ts
function binary_search(xs, target) {
  function helper(low, high) {
    if (low > high) {
      return -1;
    } else {}
    const mid = math_floor((low + high) / 2);
    const v = list_ref(xs, mid);

    if (v === target) {
      return mid;
    } else if (target < v) {
      return helper(low, mid - 1);  // search left
    } else {
      return helper(mid + 1, high); // search right
    }
  }

  return helper(0, length(xs) - 1);
}

```]