#import "../utils.typ": *

= Space complexity, Time complexity

== Order of growth
*Big Theta:* The function $r$ has order of growth $Theta(g(n))$ if there are positive constants $k_1$ and $k_2$ and a number $n_0$ such that $k_1 dot g(n) <= r(n) <= k_2 dot g(n)$ for any $n > n_0$.

*Big O:* The function $r$ has order of growth $O(g(n))$ if there is a positive constant $k$ such that $r(n) <= k dot g(n)$ for any sufficiently large value of $n$.

*Big Omega:* The function $r$ has order of growth $Omega(g(n))$ if there is a positive constant $k$ such that $k dot g(n) <= r(n)$ for any sufficiently large value of $n$.

*Order (small to big):* $1$, $log n$, $n$, $n log n$, $n^k$, $k^n$, $n^n$

== Tips for analysis
*Recurrence Notation:* $T(n)$ represents the time complexity for input size $n$. The $+$ separates the work done at the current level from the recursive calls. For example, $T(n) = Theta(1) + 2T(n\/2)$ means constant work at this level, plus two recursive calls on half-sized problems. The coefficient before $T$ indicates the number of recursive calls (e.g., $k T(n-1)$ means $k$ recursive calls).
#table(
  columns: (1fr, 2fr, 1fr),
  align: (left, left, left),
  [*Case*],
  [*Recurrence / Pattern*],
  [*Complexity*],
  
  [Linear scan],
  [$T(n) = Theta(1) + T(n-1)$],
  [$Theta(n)$],
  
  [Nested loops ($k$ loops)],
  [--],
  [$Theta(n^k)$],
  
  [Divide & conquer (typical)],
  [$T(n) = Theta(n) + 2T(n\/2)$],
  [$Theta(n log n)$],
  
  [Subproblems ($k$ per step)],
  [$T(n) = k T(n-1)$],
  [$Theta(k^n)$],
  
  [Recursive calls to $f(n-k)$],
  [$T(n) = Theta(1) + T(n-a)$],
  [$Theta(n)$],
  
  [Recursive calls to $f(n-k)$ with linear work],
  [$T(n) = Theta(n) + T(n-a)$],
  [$Theta(n^2)$],
  
  [Recursive calls to $f(n\/k)$],
  [$T(n) = Theta(1) + T(n\/a)$],
  [$Theta(log n)$],
  
  [Recursive calls to $f(n\/k)$ with linear work],
  [$T(n) = Theta(n) + T(n\/a)$],
  [$Theta(n)$],
  
  [Branching recursion ($b$ subproblems of size $n-a$)],
  [$T(n) = Theta(1) + b T(n-a)$],
  [$Theta(c^n)$],
  
  [Branching recursion with linear work],
  [$T(n) = Theta(n) + b T(n-a)$],
  [$Theta(c^n)$],
  
  [Divide & conquer with constant work],
  [$T(n) = Theta(1) + a T(n\/a)$],
  [$Theta(n)$],
  
  [Divide & conquer with linear work],
  [$T(n) = Theta(n) + a T(n\/a)$],
  [$Theta(n log n)$],
  
  [Work decreases per recursive call],
  [$T(n) = g(i)$ per level, depth $= d$],
  [$Theta(sum_(i=0)^d g(i))$],
)