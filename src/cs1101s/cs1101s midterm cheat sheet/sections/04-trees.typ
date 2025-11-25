#import "../utils.typ": *

= Binary Trees
*Definition*: left sub-tree $<$ node $<$ right sub-tree
== Insert
#sourcecode[```ts
function insert<T extends number | string>(bst: Tree<T>, item: T): Tree<T> {
  if (is_empty_tree(bst)) {
    return make_tree(item, make_empty_tree(), make_empty_tree());
  } else if (item < entry(bst)) {
    // smaller: go left
    return make_tree(entry(bst),
                    insert(left_branch(bst), item),
                    right_branch(bst));
  } else if (item > entry(bst)) {
    // bigger: go right
    return make_tree(entry(bst),
                    left_branch(bst),
                    insert(right_branch(bst), item));
  } else {
    // equal: no duplicates. immediately return.
    return bst;
  }
}
```]
== Search
Check if element in tree. Assume no duplicates.

#sourcecode[```ts
function search<T extends number | string>(bst: Tree<T>, target: T): boolean {
  if (is_empty_tree(bst)) {
    return false;
  } else if (entry(bst) === target) {
    return true;
  } else if (target < entry(bst)) {
    // smaller, search left
    return search(left_branch(bst), target);
  } else {
    // larger, search right
    return search(right_branch(bst), target);
  }
}
```]

== Traverse
- Pre-order: root, left, right
- In-order: left, root, right
- Post-order: left, right, root

#sourcecode[```ts
function append3<T extends List<unknown>>(a: T, b: T, c: T): List<T> {
  return append(
    a, append(b, c)
  );
}

function preorder<T extends number | string>(bst: Tree<T>): List<T> {
  if (is_empty_tree(bst)) {
    return make_empty_tree();
  } else {
    return append3(
      list(entry(bst)),
      preorder(left_branch(bst)),
      preorder(right_branch(bst))
    );
  }
}

function inorder<T extends number | string>(bst: Tree<T>): List<T> {
  if (is_empty_tree(bst)) {
    return make_empty_tree();
  } else {
    return append3(
      inorder(left_branch(bst)),
      list(entry(bst)),
      inorder(right_branch(bst))
    );
  }
}

function postorder<T extends number | string>(bst: Tree<T>): List<T> {
  if (is_empty_tree(bst)) {
    return make_empty_tree();
  } else {
    return append3(
      postorder(left_branch(bst)),
      postorder(right_branch(bst)),
      list(entry(bst))
    );
  }
}
```]
== Delete
#sourcecode[```ts
function delete<T extends number | string>(bst: Tree<T>, target: T): Tree<T> {
  if (is_empty_tree(bst)) {
    return bst; // nothing to delete
  } else if (target < entry(bst)) {
    // smaller: go left
    return make_tree(
      entry(bst),
      delete(left_branch(bst), target),
      right_branch(bst)
    );
  } else if (target > entry(bst)) {
    // bigger: go right
    return make_tree(
      entry(bst),
      left_branch(bst),
      delete(right_branch(bst), target)
    );
  } else {
    // found node to delete
    if (is_empty_tree(left_branch(bst))) {
      return right_branch(bst); // only right child or none
    } else if (is_empty_tree(right_branch(bst))) {
      return left_branch(bst); // only left child
    } else {
      // two children: replace with inorder successor
      // successor is leftmost number of the right branch
      const successor = find_min(right_branch(bst));
      return make_tree(
        successor,
        left_branch(bst),
        // remove the smallest number in the right branch
        delete(right_branch(bst), successor)
      );
    }
  }
}

// find the smallest number in tree
function find_min<T extends number | string>(bst: Tree<T>): T {
  if (is_empty_tree(left_branch(bst))) {
    return entry(bst);
  } else {
    return find_min(left_branch(bst));
  }
}
```]
== Invert
Swap the left and right sub-trees of every node in the tree.

#sourcecode[```ts
function invert<T extends number | string>(bst: Tree<T>): Tree<T> {
  if (is_empty_tree(bst)) {
    return bst;
  } else {
    return make_tree(
      entry(bst),
      invert(right_branch(bst)), // swap sides
      invert(left_branch(bst))
    );
  }
}```]
== Flatten

#sourcecode[```ts
function flatten_tree<T>(tree: Tree<T>): List<T> {
  return accumulate(
    (x, y) => is_list(x)
      ? append(flatten(x), y)
      : pair(x, y),
    null,
    tree);
}
```]

== Map
#sourcecode[```ts
function map_tree<T, U>(f: (x: T) => U, tree: Tree<T>): Tree<U> {
  return map(
    x => is_list(x)
      ? map_tree(f, x)
      : f(x),
    tree);
}
```]

== Accumulate/Reduce
#sourcecode[```ts
function accumulate_tree<T, U>(f: (x: T, y: U) => U, init: U, tree: Tree<T>): U {
  return accumulate(
    (x, y) => is_list(x)
      ? accumulate_tree(f, y, x)
      : f(x, y),
    init,
    tree);
}
```]