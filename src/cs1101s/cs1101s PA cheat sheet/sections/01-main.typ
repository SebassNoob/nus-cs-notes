#import "../utils.typ": *


= List and Array operations

== List to Array 

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Converts a JavaScript array into a linked list structure by iterating backwards through the array and building pairs.],
  [*Parameters:*], [`arr: Array<any>` - The array to convert],
  [*Returns:*], [`List` - A linked list representation of the array],
  [*Example:*], [```js
array_to_list([1, 2, 3]); 
// Returns: pair(1, pair(2, pair(3, null)))
```]
)

#sourcecode[```js
function array_to_list(arr) {
    let result = null;
    for (let i = array_length(arr) - 1; i >= 0; i = i - 1) {
        result = pair(arr[i], result);
    }
    return result;
}



```]
== Array to List

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Converts a linked list into a JavaScript array by recursively traversing the list and collecting elements.],
  [*Parameters:*], [`lst: List` - The linked list to convert],
  [*Returns:*], [`Array<any>` - An array containing all elements from the list],
  [*Example:*], [```js
list_to_array(list(1, 2, 3));
// Returns: [1, 2, 3]
```]
)

#sourcecode[```js
function list_to_array(lst) {
    const ret = [];
    let idx = 0;
    function h(curr) {
        if (curr === null) {
            return ret;
        }
        ret[idx] = head(curr);
        idx = idx + 1;
        return h(tail(curr));
    }
    return h(lst);
}
```]

= Permutations and combinations

== Permutations

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Generates all possible permutations of elements in a list. Each permutation is a different ordering of all elements.],
  [*Parameters:*], [`ys: List` - The list of elements to permute],
  [*Returns:*], [`List<List>` - A list of lists, where each inner list is one permutation],
  [*Example:*], [```js
permutations(list(1, 2, 3));
// Returns: list of all 6 permutations:
// list(list(1, 2, 3), list(1, 3, 2), list(2, 1, 3), 
//      list(2, 3, 1), list(3, 1, 2), list(3, 2, 1))
```]
)

#sourcecode[```js
function permutations(ys) {
    if (ys === null) {
        return list(null);
    }
    return accumulate(
        append, 
        null,
        map(x => 
            map(p => 
                pair(x, p),
                permutations(remove(x, ys))
            ),
            ys
        )
    );
    
}
```]

== Combinations

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Generates all possible subsets (combinations) of a list, including the empty set and the full set.],
  [*Parameters:*], [`ys: List` - The list of elements to find combinations of],
  [*Returns:*], [`List<List>` - A list of all possible subsets],
  [*Example:*], [```js
combinations(list(1, 2, 3));
// Returns: list(list(), list(3), list(2), list(2, 3), 
//               list(1), list(1, 3), list(1, 2), list(1, 2, 3))
```]
)

#sourcecode[```js

function combinations(ys) {
    if (ys === null) {
        return list(null);
    }
    const rest = combinations(tail(ys));
    return append(
        rest,
        map(p => pair(head(ys), p), rest)
    );
}
    
}
```]

== Combinations of length k

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Generates all combinations of exactly k elements from a list.],
  [*Parameters:*], [`ys: List` - The list of elements to choose from\ `k: number` - The number of elements in each combination],
  [*Returns:*], [`List<List>` - A list of all k-length combinations],
  [*Example:*], [```js
k_combinations(list(1, 2, 3, 4), 2);
// Returns: list(list(1, 2), list(1, 3), list(1, 4), 
//               list(2, 3), list(2, 4), list(3, 4))
```]
)

#sourcecode[```js

function k_combinations(ys, k) {
    if (k === 0) {
        return list(null);
    } else if (ys === null) {
        return null;
    } else {
        const with_head = map(
            p => pair(head(ys), p),
            k_combinations(tail(ys), k - 1)
        );
        const without_head = k_combinations(tail(ys), k);
        return append(with_head, without_head);
    }
}
```]

= Sorting and searching

== Partition

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Divides a list into two sublists: elements less than or equal to the pivot, and elements greater than the pivot.],
  [*Parameters:*], [`xs: List` - The list to partition\ `p: number` - The pivot value],
  [*Returns:*], [`Pair<List, List>` - A pair where the head is the "less than or equal" list and the tail is the "greater than" list],
  [*Example:*], [```js
partition(list(3, 1, 4, 1, 5, 9, 2, 6), 4);
// Returns: pair(list(3, 1, 1, 4, 2), list(5, 9, 6))
```]
)

== Quicksort

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Sorts a list in ascending order using the quicksort algorithm.],
  [*Parameters:*], [`xs: List` - The list to sort],
  [*Returns:*], [`List` - A new sorted list],
  [*Example:*], [```js
quicksort(list(3, 1, 4, 1, 5, 9, 2, 6));
// Returns: list(1, 1, 2, 3, 4, 5, 6, 9)
```]
)

#sourcecode[```js
function partition(xs, p) {
    return accumulate(
        (curr, acc) => {
            if (curr <= p) {
                return pair(append(head(acc), list(curr)), tail(acc));
            } else {
                return pair(head(acc), append(tail(acc), list(curr)));
            }
        },
        pair(list(), list()),
        xs
    );
}

function quicksort(xs) {
    
    if (is_null(xs)) {
        return null;
    } else {
        const pivot = head(xs);
        const p = partition(tail(xs), pivot);
        const left = head(p);
        const right = tail(p);
        return append(quicksort(left), append(list(pivot), quicksort(right)));
    }
}
```]

== Binary search

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Searches for an element in a sorted list using binary search algorithm. Returns the index if found, or -Infinity if not found. Depends on `take`, `drop`.],
  [*Parameters:*], [`lst: List` - The sorted list to search in\ `elem: any` - The element to search for],
  [*Returns:*], [`number` - The index of the element, or -Infinity if not found],
  [*Example:*], [```js
binary_search(list(1, 2, 3, 4, 5, 6, 7, 8, 9), 6);
// Returns: 5
```]
)

#sourcecode[```js
function binary_search(lst, elem) {
    if (length(lst) === 0) {
        return -Infinity;
    }
    const mid = math_floor(length(lst) / 2);
    const val = list_ref(lst, mid);
    if (val === elem) {
        return mid;
    } else if (val < elem) {
        return mid + 1 + binary_search(drop(lst, mid + 1), elem);
    } else {
        return binary_search(take(lst, mid), elem);
    }
}
```]
== Take

#table(
columns: (auto, 1fr),
stroke: none,
[*Description:*], [Returns a new list containing the first *n* elements of a given list. If *n* is 0, returns `null` (the empty list).],
[*Parameters:*], [`xs: List` – The input list\ `n: number` – The number of elements to take],
[*Returns:*], [`List` – A list containing the first *n* elements of `xs`],
[*Example:*], [```js
take(list(1, 2, 3, 4, 5), 3);
// Returns: list(1, 2, 3)

```]
)  

#sourcecode[```ts
function take(xs, n) {
  return n === 0
    ? null
    : pair(head(xs), take(tail(xs), n - 1));
}
```]  

---

== Drop  

#table(  
  columns: (auto, 1fr),  
  stroke: none,  
  [*Description:*], [Removes the first *n* elements from a list and returns the remainder. If *n* is 0, returns the original list.],  
  [*Parameters:*], [`xs: List` – The input list\ `n: number` – The number of elements to skip],  
  [*Returns:*], [`List` – The list after removing the first *n* elements],  
  [*Example:*], [```js
drop(list(1, 2, 3, 4, 5), 2);
// Returns: list(3, 4, 5)
```]  
)  

#sourcecode[```ts
function drop(xs, n) {
  return n === 0
    ? xs
    : drop(tail(xs), n - 1);
}
```]  



= Binary Trees

Trees are represented as `list(<entry>, <left>, <right>)` which is equivalent to `[<entry>, [<left>, [<right>, null]]]`.

== Insert

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Inserts an item into a binary search tree while maintaining the BST property. Does not insert duplicates.],
  [*Parameters:*], [`bst: Tree` - The binary search tree\ `item: any` - The item to insert],
  [*Returns:*], [`Tree` - A new tree with the item inserted],
  [*Example:*], [```js
insert(null, 5);
// Returns: list(5, null, null)
insert(list(5, null, null), 3);
// Returns: list(5, list(3, null, null), null)
```]
)

#sourcecode[```js
function insert(bst, item) {
  if (bst === null) {
    return list(item, null, null);
  } else if (item < head(bst)) {
    // smaller: go left
    return list(head(bst),
                insert(head(tail(bst)), item),
                head(tail(tail(bst))));
  } else if (item > head(bst)) {
    // bigger: go right
    return list(head(bst),
                head(tail(bst)),
                insert(head(tail(tail(bst))), item));
  } else {
    // equal: no duplicates. immediately return.
    return bst;
  }
}
```]

== Search

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Checks if an element exists in a binary search tree. Assumes no duplicates.],
  [*Parameters:*], [`bst: Tree` - The binary search tree to search\ `target: any` - The value to search for],
  [*Returns:*], [`boolean` - True if the element is found, false otherwise],
  [*Example:*], [```js
const tree = list(5, list(3, null, null), list(7, null, null));
search(tree, 3); // Returns: true
search(tree, 10); // Returns: false
```]
)

#sourcecode[```ts
function search(bst, target) {
  if (bst === null) {
    return false;
  } else if (head(bst) === target) {
    return true;
  } else if (target < head(bst)) {
    // smaller, search left
    return search(head(tail(bst)), target);
  } else {
    // larger, search right
    return search(head(tail(tail(bst))), target);
  }
}
```]

== Traverse

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Traverses a binary tree and returns a list of values in the specified order:\ - *Pre-order:* root, left, right\ - *In-order:* left, root, right (produces sorted list for BST)\ - *Post-order:* left, right, root],
  [*Parameters:*], [`bst: Tree` - The binary tree to traverse],
  [*Returns:*], [`List` - A list of tree values in the specified traversal order],
  [*Example:*], [```js
// Tree:     5
//          / \
//         3   7
const tree = list(5, list(3, null, null), list(7, null, null));
preorder(tree);  // Returns: list(5, 3, 7)
inorder(tree);   // Returns: list(3, 5, 7)
postorder(tree); // Returns: list(3, 7, 5)
```]
)

#sourcecode[```ts
function append3(a, b, c) {
  return append(
    a, append(b, c)
  );
}

function preorder(bst) {
  if (bst === null) {
    return null;
  } else {
    return append3(
      list(head(bst)),
      preorder(head(tail(bst))),
      preorder(head(tail(tail(bst))))
    );
  }
}

function inorder(bst) {
  if (bst === null) {
    return null;
  } else {
    return append3(
      inorder(head(tail(bst))),
      list(head(bst)),
      inorder(head(tail(tail(bst))))
    );
  }
}

function postorder(bst) {
  if (bst === null) {
    return null;
  } else {
    return append3(
      postorder(head(tail(bst))),
      postorder(head(tail(tail(bst)))),
      list(head(bst))
    );
  }
}
```]

== Delete

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Removes a target value from a binary search tree while maintaining the BST property. Uses the inorder successor strategy for nodes with two children.],
  [*Parameters:*], [`bst: Tree` - The binary search tree\ `target: any` - The value to delete],
  [*Returns:*], [`Tree` - A new tree with the target removed],
  [*Example:*], [```js
// Tree:     5
//          / \
//         3   7
const tree = list(5, list(3, null, null), list(7, null, null));
delete(tree, 3); // Returns list(5, null, list(7, null, null))
```]
)

=== Find Min

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Finds the smallest (leftmost) value in a binary search tree.],
  [*Parameters:*], [`bst: Tree` - The binary search tree],
  [*Returns:*], [`any` - The minimum value in the tree],
  [*Example:*], [```js
// Tree:     5
//          / \
//         3   7
const tree = list(5, list(3, null, null), list(7, null, null));
find_min(tree); // Returns: 3
```]
)

#sourcecode[```ts
function delete(bst, target) {
  if (bst === null) {
    return bst; // nothing to delete
  } else if (target < head(bst)) {
    // smaller: go left
    return list(
      head(bst),
      delete(head(tail(bst)), target),
      head(tail(tail(bst)))
    );
  } else if (target > head(bst)) {
    // bigger: go right
    return list(
      head(bst),
      head(tail(bst)),
      delete(head(tail(tail(bst))), target)
    );
  } else {
    // found node to delete
    if (head(tail(bst)) === null) {
      return head(tail(tail(bst))); // only right child or none
    } else if (head(tail(tail(bst))) === null) {
      return head(tail(bst)); // only left child
    } else {
      // two children: replace with inorder successor
      // successor is leftmost number of the right branch
      const successor = find_min(head(tail(tail(bst))));
      return list(
        successor,
        head(tail(bst)),
        // remove the smallest number in the right branch
        delete(head(tail(tail(bst))), successor)
      );
    }
  }
}

// find the smallest number in tree
function find_min(bst) {
  if (head(tail(bst)) === null) {
    return head(bst);
  } else {
    return find_min(head(tail(bst)));
  }
}
```]

== Invert

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Inverts (mirrors) a binary tree by swapping the left and right subtrees of every node.],
  [*Parameters:*], [`bst: Tree` - The binary tree to invert],
  [*Returns:*], [`Tree` - A new tree that is the mirror image of the input],
  [*Example:*], [```js
// Original:    5          Inverted:    5
//             / \                     / \
//            3   7                   7   3
const tree = list(5, list(3, null, null), list(7, null, null));
invert(tree); // Returns list(5, list(7, null, null), list(3, null, null))
```]
)

#sourcecode[```ts
function invert(bst) {
  if (bst === null) {
    return bst;
  } else {
    return list(
      head(bst),
      invert(head(tail(tail(bst)))), // swap sides
      invert(head(tail(bst)))
    );
  }
}```]

== Flatten

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Flattens a nested tree structure into a single-level list by recursively processing all sublists.],
  [*Parameters:*], [`tree: Tree` - The tree structure to flatten],
  [*Returns:*], [`List` - A flat list containing all leaf values],
  [*Example:*], [```js
flatten_tree(list(1, list(2, 3), list(4, list(5, 6))));
// Returns: list(1, 2, 3, 4, 5, 6)
```]
)

#sourcecode[```ts
function flatten_tree(tree) {
  return accumulate(
    (x, y) => is_list(x)
      ? append(flatten(x), y)
      : pair(x, y),
    null,
    tree);
}
```]

== Map

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Applies a function to every leaf value in a tree structure, preserving the tree's shape.],
  [*Parameters:*], [`f: Function` - The function to apply to each leaf value\ `tree: Tree` - The tree structure to map over],
  [*Returns:*], [`Tree` - A new tree with the function applied to all leaves],
  [*Example:*], [```js
map_tree(x => x * 2, list(1, list(2, 3), 4));
// Returns: list(2, list(4, 6), 8)
```]
)

#sourcecode[```ts
function map_tree(f, tree) {
  return map(
    x => is_list(x)
      ? map_tree(f, x)
      : f(x),
    tree);
}
```]

== Accumulate/Reduce

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Description:*], [Reduces a tree structure to a single value by applying a binary function to all leaf values with an initial accumulator.],
  [*Parameters:*], [`f: Function` - Binary function `(element, accumulator) => new_accumulator`\ `init: any` - Initial accumulator value\ `tree: Tree` - The tree structure to reduce],
  [*Returns:*], [`any` - The final accumulated value],
  [*Example:*], [```js
accumulate_tree((x, y) => x + y, 0, list(1, list(2, 3), 4));
// Returns: 10 (sum of all values)
```]
)

#sourcecode[```ts
function accumulate_tree(f, init, tree) {
  return accumulate(
    (x, y) => is_list(x)
      ? accumulate_tree(f, y, x)
      : f(x, y),
    init,
    tree);
}
```]