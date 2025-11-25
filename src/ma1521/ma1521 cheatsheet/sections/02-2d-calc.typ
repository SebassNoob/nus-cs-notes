= 2d calculus
== Absolute value
- $|"xy"| = |x||y| forall x, y in Re$
- $sqrt(x^2) = |x| <=> |x|^2 = x^2 forall x in Re$
- $|x + y| lt.eq |x| + |y| forall x in Re $ (Triangle Inequality)
== Functions
- *Injective*: For any $x,y in A, f(x) = f(y) => x = y$. (One-one)
- *Surjective*: For any $z in B, exists x in A$ where $f(x) = z$. (Range = Co-Domain)
- *Maximal domain/range*: The largest domain/range that the function can have in $Re$.

- *Squeeze theorem*: Suppose $I$ is an interval that contains point $c$ and $g(x)<=f(x)<=h(x)$ for $x$ near $c$.

$ lim_(x->c) g(x) = lim_(x->c) h(x) = L => lim_(x->c)f(x) = L $

- *Intermediate Value theorem*: Suppose $f$ is continuous on $[a, b]$ and $f(a)<=k<=f(b)$. This implies that $exists c in [a, b], f(c) = k$.

== Limits
- $lim_(x->c) f(x)^(g(x)) = e^(lim_(x->c) g(x) ln f(x))$

If $lim_(x->c)g(x) = 0$: 

$ lim_(x->c)((sin g(x))/g(x)) = 1 $ 

$ lim_(x->c)((tan g(x))/g(x)) = 1 $

== Derivatives
- *Definition*:
$ 
f'(x_0) = lim_(h->0) (f(x_0+h) - f(x_0))/(h) \
= lim_(x->x_0) (f(x)-f(x_0))/(x-x_0) &= "by letting" x=x_0+h
$ 
- *Inverse function*:
$
(f^(-1))'(a) = 1/(f'(f^(-1)(a)))
$
- *Concavity*: 
  1. If $f''(c) > 0$, $f$ is concave up at $c$.
  2. If $f''(c) < 0$, $f$ is concave down at $c$.
- *Critical point*: Both must be satisfied.
  1. $c$ is *not* an endpoint
  2. $f'(c) = 0$ or $exists.not f'(c)$
- *Extreme value theorem*: If $f$ is continuous on $[a,b]$, then $exists$ a local maximum and minimum in the range $[a,b]$. Note that this will not hold if interval is not of the form $[a,b]$ (e.g. $(a,b]$)

- *L'Hopital's rule*: If $lim_(x->c) g(x) = lim_(x->c) f(x) = 0 or plus.minus infinity$,
$
lim_(x->c) f(x)/g(x) = lim_(x->c) (f'(x))/(g'(x))
$
- *Rolle's theorem*: Let $f$ be differentiable on $[a,b]$, where $f(a) = f(b)$. Then there $exists c in [a,b]$ where $f'(c) = 0$.

- *Mean Value Theorem*: Let $f$ be differentiable on $[a,b]$. There $exists c in [a,b]$ where $f'(c) = (f(b) - f(a))/(b-a)$. This is because the chord between $a$ and $b$ is parallel to the tangent at $c$.

== Integrals

- *FTC 1*: $integral^a_b f(x) \dx = F(a)- F(b)$
- *FTC 2*: $d/(\dx) integral^x_a f(t) \dt = f(x)$; more generally, $d/(\dx) integral^g(x)_a f(t) \dt = f(g(x))g'(x)$

- *Area between 2 curves*: $A = integral_b^a |f(x) - g(x)| d\x$
- *Volume for rotation*:
  1. Shell method: 
$
V = pi integral_b^a (f(x))^2 d\x - pi integral_b^a (g(x))^2 d\x
$
  2. Disk method: For volume rotated about y axis, consider cylinder with circumference $2pi x$, height $f(x)$. Volume is the product of circumference and the riemann sum of $f(x)$.
$
V = 2pi integral_b^a x|f(x) - g(x)| d\x
$
- *Equation of rotation*: The surface obtained rotating $f$ about an axis is $y^2 + z^2 = f(x)^2$ (x-axis); $x^2 + z^2 = f(y)^2$ (y-axis)


=== Trigonometric substitution
$integral sqrt(a^2 - (x+b)^2) d\x$ (sub with $(x+b) = a sin theta$)

$integral sqrt(a^2 + (x+b)^2) d\x$ (sub with $(x+b) = a tan theta$)

$integral sqrt((x+b)^2 - a^2) d\x$ (sub with $(x+b) = a sec theta$)

=== Riemann sums
$
  integral^a_b f(x) \dx = lim_(n-> infinity) {sum_(k=1)^n (b-a)/n f(a + k((b-a)/n))}
$
Where $(b-a)/n$ is the small $\dx$ of the function and $f(a + k((b-a)/n))$ is the height of the small increment.



=== Arc length
- *Of a Cartesian function*: $S = integral_b^a sqrt(1+ (f'(x))^2) d\x$
- *Of a vector valued function*: $L = integral_a^b |r'(t)| d t
   = integral_a^b sqrt((x'(t))^2 + (y'(t))^2 + (z'(t))^2) d t.$

== Sequences and series
- *nth term for divergence*: If $lim_(n->infinity)a_n !=0 or $ undefined, then series $sum^infinity_(n=1)a_n$ diverges. Inconclusive if $a_n->0$.

- *Integral test*: Suppose $a_n = f(n)$; $f'(n)<0 forall n>1$ (decreasing function). If $integral^infinity_1 f(n)$ converges, so does the series $sum^infinity_1 a_n$, and vice-versa. (Reasoning: think of right bounded riemann sum to approximate integral)

- *P-series*: The p-series $sum^infinity_1 1/n^p$ converges only if $p>1$.
- *Comparison test*: Suppose $0<=a_n<=b_n$. Then, 
  1. $sum^infinity_1 b_n$ is convergent => $sum^infinity_1 a_n$ converges
  2. $sum^infinity_1 a_n$ is divergent => $sum^infinity_1 b_n$ diverges

- *Ratio test*: Suppose $sum^infinity_1 a_n$, where $lim_(n->infinity) |a_(n+1)/a_n| = L$. If,
  1. $0<=L<1$, series converge
  2. $L>1$, series diverge
  3. $L=1$, test inconclusive
- *Root test*: Suppose $sum^infinity_1 a_n$, where $lim_(n->infinity) root(n, |a_n|) = L$. If,
  1. $0<=L<1$, series converge
  2. $L>1$, series diverge
  3. $L=1$, test inconclusive
- *Alternating series test*: If $b_n$ is decreasing and $lim_(n->infinity) b_n=0$, then alternating series $sum^infinity_1(-1)^n b_n$ converges.
- *Absolute convergence test*: If $sum_(n=1)^infinity |a_n|$ is convergent, $sum_(n=1)^infinity a_n$ is also convergent.
=== Centre/radius of convergence
For a given series $sum_(n=1)^infinity c_n (x-a)^n = c_0 + c_1(x − a) + c_2(x − a)^2 + c_3(x − a)^3 +...$, *exactly 1* of the following holds:
1. Converge at $x=a$
2. Converge for all $x$
3. There exists a positive $R$ where $|x-a|<R$ converges. 
  -  radius of convergence may take a bounded or unbounded form, eg $(-1, 1]$ or $ [-1,1]$
  - centre of convergence is $a$. 

If $lim_(n->infinity) |a_(n+1)/a_n| = L$ (ratio test) or $lim_(n->infinity) root(n, |a_n|) = L$ (root test), $exists R = |x+a|$ where $L<1$.