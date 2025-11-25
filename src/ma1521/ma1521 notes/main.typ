#set document(title:"MA1521")

= 0. Real numbers and functions
== Absolute Value

=== Properties
1. $|"xy"| = |x||y| forall x, y in Re$
2. $sqrt(x^2) = |x| <=> |x|^2 = x^2 forall x in Re$
3. $|x + y| lt.eq |x| + |y| forall x in Re $ (Triangle Inequality)

=== Example
Solve $|x+1| lt.eq |2x-1|$. (Algebraically)
$
|x+1| lt.eq |2x-1| & "Given" \
|x+1|^2 lt.eq |2x+1|^2 & "Both expressions are positive" \
x^2+2x+1 lt.eq 4x^2-4x + 1 \
3x^2-6x gt.eq 0 \
3x(x-2) gt.eq 0 \
x lt.eq 0 or x gt.eq 2
$

== Functions
Let a function be $f: A -> B$. f is bijective if it is both injective and surjective. 
=== Injective
For any $x,y in A, f(x) = f(y) => x = y$. (One-one)
=== Surjective
For any $z in B, exists x in A$ where $f(x) = z$. (Range = Co-Domain)

Note that range !== co-domain. Co-domain is potential outputs of f (in the definition); Range is the actual outputs of f.

=== Inverse Functions
If f is bijective, $exists f^-1: B -> A$. 

Why?
1. If f is not injective, the inverse function would have more than 1 output for 1 input which violates function definition.
2. If f is not surjective, the inverse function would have certain values in B that have no mapping (undefined).

=== Maximal domain/range
The largest domain/range that the function can have in the context of real numbers $Re$.

Eg. $f(x)=1/(x-1)$; maximal domain $D=Re\\{1}$; maximal range $R=Re\\{0}$

#pagebreak()

= 1. Limits

== Properties
1. Let c be an interior point (not an end point). If$lim_(x->c^-)f(x) = lim_(x->c^+)f(x) = L => exists lim_(x->c)f(x) = L$. It is said that $f(x)$ is continuous at $c$.
2. Continuity: 
  - Left end point: $exists lim_(x->c^+)f(x) = f(c)$
  - Right end point: $exists lim_(x->c^-)f(x) = f(c)$
  - Interior point: $exists lim_(x->c)f(x) = f(c)$
  - On an interval $I$: $f(x)$ is continuous $forall c in I$.
3. Results:
  - $lim_(x->c)[f(x) plus.minus g(x)] = lim_(x->c)f(x) plus.minus lim_(x->c) g(x)$
  - $lim_(x->c)k f(x) = k lim_(x->c) f(x)$
  - $lim_(x->c)[f(x)g(x)] = lim_(x->c)f(x) dot lim_(x->c)g(x)$
  - $lim_(x->c)[f(x)]^2 = [lim_(x->c)f(x)]^2$
  - $lim_(x->c)[f(x)/g(x)] = (lim_(x->c)f(x))/(lim_(x->c)g(x))$
  - If $g$ is continuous at point $b$ and $lim_(x->c)f(x) = b$, then $lim_(x->c)g dot.big f(x) = g(b)$.
4. Limits of form $(sin x)/x$ and $(tan x)/x$
If $lim_(x->c)g(x) = 0$, 
$ 
lim_(x->c)((sin g(x))/g(x)) = 1
$ 
$
lim_(x->c)((tan g(x))/g(x)) = 1
$
== Squeeze theorem
Suppose $I$ is an interval that contains point $c$ and $g(x)<=f(x)<=h(x)$ for $x$ near $c$.

$lim_(x->c) g(x) = lim_(x->c) h(x) = L => lim_(x->c)f(x) = L$

=== Example
Evaluate $lim_(x->infinity) (sin (2ln x))/(ln x)$.

Since $-1<=sin(2ln x)<=1$,
$
  -1/(ln x) <=sin(2ln x)/(ln x)<= 1/(ln x) \
  lim_(x->infinity)-1/(ln x) <=lim_(x->infinity)sin(2ln x)/(ln x)<= lim_(x->infinity)1/(ln x) \
  0<=lim_(x->infinity)sin(2ln x)/(ln x)<=0 \
  therefore lim_(x->infinity)sin(2ln x)/(ln x) = 0
$


== Intermediate value theorem
Suppose $f$ is continuous on $[a, b]$ and $f(a)<=k<=f(b)$. This implies that $exists c in [a, b], f(c) = k$.

=== Example
Show $x^3e^x=10$ has a solution between 1 and 1.5.

Let $f(x)=x^3e^x$. 
$
  f(1) = 1^3 dot e^1 = e \
  f(1.5) = 1.5^3 dot e^1.5 = 15.1 \

  <=> f(1) <= 10 <= f(1.5) \
  therefore exists f(c) = 10, c in [1, 1.5]
$
#pagebreak()
= 2. Derivatives
== Definition
$ 
f'(x_0) = lim_(h->0) (f(x_0+h) - f(x_0))/(h) \
= lim_(x->x_0) (f(x)-f(x_0))/(x-x_0) & "by letting" x=x_0+h
$ 
Gradient of chord of $(x_0, f(x_0))$ and $(x_0+h, f(x_0+h))$ approaches the tangent of $f$.

If $f$ is differentiable on every point on $I$, it is said to be differentiable on $I$.

== Inverse functions
Let $f$ be bijective and differentiable on $I$. Then,

$
(f^(-1))'(a) = 1/(f'(f^(-1)(a)))
$

Proof: differentiate $f^(-1)(f(x)) = x$ with chain rule.

#pagebreak()

= 3. Applications of differentiation
== Straight line equation
$
y - y_1 = m(x - x_1)
$
== Concavity
1. If $f''(c) > 0$, $f$ is concave up at $c$.
2. If $f''(c) < 0$, $f$ is concave down at $c$.

== Extreme value theorem
If $f$ is continuous on $[a,b]$, then $exists$ a local maximum and minimum in the range $[a,b]$.

Note that this will not hold if $f$ is not continuous on $[a,b]$ or interval is not of the form $[a,b]$ (e.g. $(a,b]$)

== Critical point
If $f$ has a local minimum/maximum at $x=c$, $c$ is a *critical point* of $f$. 

The following conditions must be fulfilled:
1. $c$ is *not* an endpoint
2. $f'(c) = 0$ or $exists.not f'(c)$

=== Local and global maxima/minima
- Global: if $a$ is the global minima/maxima, there is no point $b$ at which $f(b)>f(a) forall f in D_f$.
- Local: if $a$ is the local minima/maxima, there may be a point $b$ (perhaps outside of the target interval) where $f(b) > f(a)$


== L'Hopital's rule
If $lim_(x->c) g(x) = lim_(x->c) f(x) = 0 or plus.minus infinity$,
$
lim_(x->c) f(x)/g(x) = lim_(x->c) (f'(x))/(g'(x))
$
== Rolle's theorem
Let $f$ be differentiable on $[a,b]$, where $f(a) = f(b)$. Then there $exists c in [a,b]$ where $f'(c) = 0$.

== Mean Value Theorem
Let $f$ be differentiable on $[a,b]$. There $exists c in [a,b]$ where $f'(c) = (f(b) - f(a))/(b-a)$. 

This is because the chord between $a$ and $b$ is parallel to the tangent at $c$.

#pagebreak()

= 4. Integrals
Techniques: IBP, u-substitution, trig-substitution, partial fractions

== Trig sub
$integral sqrt(a^2 - (x+b)^2) d\x$ (sub with $(x+b) = a sin theta$)

$integral sqrt(a^2 + (x+b)^2) d\x$ (sub with $(x+b) = a tan theta$)

$integral sqrt((x+b)^2 - a^2) d\x$ (sub with $(x+b) = a sec theta$)

== Fundamental theorem of calculus
=== FTC 1
$integral^a_b f(x) \dx = F(a)- F(b)$
=== FTC 2
$d/(\dx) integral^x_a f(t) \dt = f(x)$; assuming continuity and differentiability for $a<=x<=b$

== Riemann sums

Define single integral with:
$
  integral^a_b f(x) \dx = lim_(n-> infinity) {sum_(k=1)^n (b-a)/n f(a + k((b-a)/n))}
$
Where $(b-a)/n$ is the small $\dx$ of the function and $f(a + k((b-a)/n))$ is the height of the small increment.

#pagebreak()

= 5. Applications of Integration

== Area between 2 curves
$
A = integral_b^a |f(x) - g(x)| d\x
$

== Volume formed by rotation

=== Shell method
$
V = pi integral_b^a (f(x))^2 d\x - pi integral_b^a (g(x))^2 d\x
$

=== Disk method
For volume rotated about y axis, consider cylinder with circumference $2pi x$, height $f(x)$. Volume is the product of circumference and the riemann sum of $f(x)$.
$
V = 2pi integral_b^a x|f(x) - g(x)| d\x
$

== Arc Length of curve
Consider small slanted line segments forming $f(x)$. By Pythagoras' theorem, $d\s = sqrt((d\x)^2 + (d\y)^2) = sqrt(1+((d\y)/(d\x))^2) d\x = sqrt(1+f'(x)) d\x$. Then, 
$
S = integral_b^a sqrt(1+ (f'(x))^2) d\x
$

#pagebreak()

= 6. Sequences and series
== Limits of sequence
If $a_n$ and $b_n$ are convergent (ie. limit of sequence as $n->infinity$ exists as a real number), we have the same results as 1.3.

== Series tests

=== nth term for divergence
If $lim_(n->infinity)a_n !=0 or $ undefined, then series $sum^infinity_(n=1)a_n$ diverges. Inconclusive if $a_n->0$.

=== integral test
Suppose $a_n = f(n)$; $f'(n)<0 forall n>1$ (decreasing function). If $integral^infinity_1 f(n)$ converges, so does the series $sum^infinity_1 a_n$, and vice-versa. (Reasoning: think of right bounded riemann sum to approximate integral)

The p-series $sum^infinity_1 1/n^p$ converges only if $p>1$.

=== comparison test
Suppose $0<=a_n<=b_n$ ($b_n$ is the upper bound). Then, 
1. $sum^infinity_1 b_n$ is convergent => $sum^infinity_1 a_n$ converges
2. $sum^infinity_1 b_n$ is divergent => $sum^infinity_1 a_n$ diverges

We often compare to a p-series (eg. $b_n = 1/n^k, k > 1$) or geometric series.
=== ratio test
Suppose $sum^infinity_1 a_n$, where $lim_(n->infinity) |a_(n+1)/a_n| = L$. If,
1. $0<=L<1$, series converge
2. $L>1$, series diverge
3. $L=1$, test inconclusive

ie. compare the ratio of the (n+1)th term to the nth term.

Note: remember for convergence/finding the radius of convergence, create an inequality such that the final term is less than 1.
=== root test
Suppose $sum^infinity_1 a_n$, where $lim_(n->infinity) root(n, |a_n|) = L$. If,
1. $0<=L<1$, series converge
2. $L>1$, series diverge
3. $L=1$, test inconclusive

Test functions of the form $(a_n)^(f(n))$, easier to reduce.

== Alternating series
If $b_n$ is decreasing and $lim_(n->infinity) b_n=0$, then alternating series $sum^infinity_1(-1)^n b_n$ converges.

== Absolute convergence
If $sum_(n=1)^infinity |a_n|$ is convergent, $sum_(n=1)^infinity a_n$ is also convergent.

== Power series
For a given series $sum_(n=1)^infinity c_n (x-a)^n = c_0 + c_1(x − a) + c_2(x − a)^2 + c_3(x − a)^3 +...$, *exactly 1* of the following holds:
1. Converge at $x=a$
2. Converge for all $x$
3. There exists a positive $R$ where $|x-a|<R$ converges (radius of convergence)

Note: radius of convergence may take a bounded or unbounded form, eg $(-1, 1]$ or $ [-1,1]$

Note: centre of convergence is $a$.

Note: Use ratio/root test to find R.
=== Finding R via ratio test or root test 
If $lim_(n->infinity) |a_(n+1)/a_n| = L (x-a)$ (ratio test) or $lim_(n->infinity) root(n, |a_n|) = L (x-a)$ (root test), $R=1/L$.

Note: this method only proves for the unbounded form. check the limits as $x$ approaches the endpoints to prove boundedness.

=== Power series representation
If $R>0$, $sum_(n=1)^infinity c_n (x-a)^n$ is differentiable and integrable on interval $|x-a|<R$.

Note: $1/(1-x) = sum_(n=1)^infinity x^n$.

eg. Find power series representation of $tan^(-1) x$.

$
  1/(1+x^2) = sum_(n=1)^infinity (-x^2)^n = sum_(n=1)^infinity (-1)^n x^(2n) \
  integral 1/(1+x^2) d\x = integral sum_(n=1)^infinity (-1)^n x^(2n) d\x \
  tan^(-1) x + C_1 = sum_(n=1)^infinity (-1)^n x^(2n + 1)/(2n+1) + C_2
$
Note: substitute x=0 to find C.

== Taylor, Maclaurin Series
Taylor series: $sum_(n=0)^infinity (f^(\(n\))(a))/n! (x-a)^n$

= 7. Vectors!
== Dot product
1. $a dot b = b dot a$ (commutativity)
2. $a dot (b + c) = a dot b + a dot c$ (distributive law)
3. $(\da) dot b = d(a dot b) = a dot (d\b)$
4. $0 dot a = 0$
5. $a dot a = |a|^2$

== Cross product
1. $a × b = −b × a$
2. $(\da) × b = d(a × b) = a × (\db)$
3. $a × (b + c) = a × b + a × c$
4. $(a + b) × c = a × c + b × c$

== Projection
Component of b along a:
$"comp"_a\b = |b| cos θ =( a dot b)/(|a|) $

Projection of b onto a:
$"proj"_a\b = "comp"_a\b × a/(|a|)$ (multiply by unit vector)

== Line, Plane
Parametric straight line:
$x = x_0 + \at, y = y_0 + \bt, z = z_0 + \ct$

Parametric plane:
$\ax+b\y+c\z=d$

x, y, z are any point on the line. a, b, c are any vector parallel to the line.

= 8. Multivariable functions
== Definitions
- Vector functions of 1 variable: $bold(r)(t) = f(t)bold(i) + g(t)bold(j) + h(t)bold(k)$
- Functions of 2 variables: $z = f(x, y)$
    - use a 3d graph (will look like a 3d volume)/contour plot (drawn on 2d using many values of z).
    - domain is 2d (x, y)
    - range is 1d (z)
- Cylinder: A surface is a cylinder if there is a plane P such that all the planes parallel to P intersect the surface in the same curve (when viewed in 2-dimension) 
  - ie. any equation in x, y, z and missing 1 variable is a cylinder
- Functions of 3 variables: $w = f(x, y, z)$
  - Level surface: $k = f(x, y, z)$ for some constant k. Draw $f(x,y,z)$ as k changes, will appear as shifting 3d surfaces.
== Partial derivatives
Treat $x$ or $y$ as a constant and differentiate.

- $f_x (x,y) = lim_(h->infinity) (f(x+h,y)-f(x,y))/h$
- $f_y (x,y) = lim_(h->infinity) (f(x,y+h)-f(x,y))/h$

=== Clairaut's theorem
$f$ is defined on a disk $D$ (2d xy plane as domain) that contains $(a,b)$. 

If $f_(\x\y)(x,y)$ and $f_(\y\x)(x,y)$ are continuous on $D$, $f_(\x\y)(x,y) = f_(\y\x)(x,y)$.


== Tangent planes
Consider a point on a surface $P(a,b,c)$. The tangent plane at $P$ contains lines passing through $P$ with the gradient given by the partial derivatives of x, y at $P$.

In a y-plane (y is constant), a vector parallel to plane is
$vec(1, 0, f_x (a,b))$

In an x-plane (x is constant), a vector parallel to plane is
$vec(0, 1, f_y (a,b))$

*Note*: change in $x$ of 1 unit corresponds to change in $z$ by $f_x (a,b)$ (y does not change as it is in the y-plane). Same for $y$.

Hence vector normal to the plane $vec(1, 0, f_x (a,b)) crossmark vec(0, 1, f_y (a,b)) = vec(f_x (a,b), f_y (a,b), -1)$.

Then, substitute $P$ to get the equation of the plane. $bold(n) dot vec(x-a, y-b, z-c) = 0$

$ z = f (a, b) + f_x (a, b)(x − a) + f_y (a, b)(y − b) $

*Note*: 
- The vector from $P(a,b,c)$ to any point $(x,y,z)$ on the plane is: $vec(x-a, y-b, z-c)$
- This vector lies in the plane
- Therefore, it must be perpendicular to the normal vector n (ie. dot product returns 0)

== Differentiation of multivariable functions

=== Chain rule
If $z=f(x,y)$ and $x = f(t)$ and $y=g(t)$ (single variable t),

$ "dz"/"dt" = (partial f)/(partial x) "dx"/"dt" + (partial f)/(partial y) "dy"/"dt" $

In general,
$ (partial u) / (partial t_i) = sum_(j=1)^n (partial u) / (partial x_j) (partial x_j) / (partial t_i) = (partial u) / (partial x_1) (partial x_1) / (partial t_i) + (partial u) / (partial x_2) (partial x_2) / (partial t_i) + dots.c + (partial u) / (partial x_n) (partial x_n) / (partial t_i) $

=== Implicit differentiation

If $F(x,y,z) = 0$ defines $z$ implicitly as a differentiable function of $x$ and $y$, then:

$ (partial z)/(partial x) = -(F_x)/(F_z), quad (partial z)/(partial y) = -(F_y)/(F_z) $

provided $F_z != 0$.

*Reasoning:* Differentiate $F(x,y,z) = 0$ with respect to $x$ using the chain rule:

$ (partial F)/(partial x) (partial x)/(partial x) + (partial F)/(partial y) (partial y)/(partial x) + (partial F)/(partial z) (partial z)/(partial x) = 0 $

Since $x$ and $y$ are independent variables, $(partial x)/(partial x) = 1$ and $(partial y)/(partial x) = 0$. This simplifies to:

$ F_x + F_z (partial z)/(partial x) = 0 $

Solving for $(partial z)/(partial x)$ (assuming $F_z != 0$):

$ (partial z)/(partial x) = -(F_x)/(F_z) $

The same process applied with respect to $y$ yields $(partial z)/(partial y) = -(F_y)/(F_z)$.

== Increments and Differentials
=== Increment

Let $z = f(x,y)$. Suppose $Delta x$ and $Delta y$ are increments in the independent variables $x$ and $y$ respectively.

Then the *increment* in $z$ is defined by:

$ Delta z = f(x + Delta x, y + Delta y) - f(x,y) $

=== Differential

Let $z = f(x,y)$. Suppose $Delta x$ and $Delta y$ are increments in the independent variables $x$ and $y$ respectively.

Then the *differentials* of the independent variables $x$ and $y$ are:

$ d x = Delta x, quad d y = Delta y $

The *differential* (or *total differential*) of the dependent variable $z$ is:

$ d z = f_x (x,y) d x + f_y (x,y) d y $

*Key Distinction:*

- The increment $Delta z$ is the change in *$z$* as $(x,y)$ changes from $(a,b)$ to $(a + Delta x, b + Delta h)$.

- The differential $d z$ is the change in the *tangent plane* as $(x,y)$ changes from $(a,b)$ to $(a + Delta x, b + Delta h)$.

=== Differential approximation

Suppose $f$ is differentiable at $(a,b)$. Let $Delta x$ and $Delta y$ be small increments in $x$ and $y$ respectively from $(a,b)$. Then:

$ Delta z approx d z = f_x (a,b) Delta x + f_y (a,b) Delta y = f_x (a,b) d x + f_y (a,b) d y $

provided $Delta x$ and $Delta y$ are small and $f(x,y)$ is differentiable.

== Directional Derivatives and Gradient

=== Directional Derivative

The *directional derivative* of $f(x,y)$ at $(x_0, y_0)$ in the direction of unit vector $bold(u) = chevron.l a, b chevron.r$ is:

$ D_bold(u) f(x_0, y_0) = lim_(h arrow 0) (f(x_0 + h a, y_0 + h b) - f(x_0, y_0))/h $

provided this limit exists.

=== Computing Directional Derivative

If $f(x,y)$ is a differentiable function, then $f$ has a directional derivative in the direction of any unit vector $bold(u) = chevron.l a, b chevron.r$ and:

$ D_bold(u) f(x,y) = f_x (x,y) a + f_y (x,y) b = nabla f(x,y) dot bold(u) $ (shortcut: use del f to compute)


=== Gradient

The *gradient* of $f(x,y)$ is the vector-valued function:

$ nabla f(x,y) = chevron.l f_x, f_y chevron.r = f_x bold(i) + f_y bold(j) = (partial f)/(partial x) bold(i) + (partial f)/(partial y) bold(j) $

provided both partial derivatives exist.



=== 3-D Directional Derivative

The *directional derivative* of $f(x,y,z)$ at $(x_0, y_0, z_0)$ in the direction of unit vector $bold(u) = chevron.l a, b, c chevron.r$ is:

$ D_bold(u) f(x_0, y_0, z_0) = lim_(h arrow 0) (f(x_0 + h a, y_0 + h b, z_0 + h c) - f(x_0, y_0, z_0))/h $

provided this limit exists.

*Note*: $bold(u)$ is a unit vector to standardise change to be 1 unit. If requirement is $n$ units, multiply final result by $n$.
=== Computing 3-D Directional Derivative

$ D_bold(u) f(x_0, y_0, z_0) = nabla f(x_0, y_0, z_0) dot bold(u) $

where

$ nabla f = chevron.l f_x, f_y, f_z chevron.r = (partial f)/(partial x) bold(i) + (partial f)/(partial y) bold(j) + (partial f)/(partial z) bold(k) $

is the *gradient vector*.

== Increase/decrease
$ D_bold(u) f = nabla f dot bold(u) = |nabla f|cos theta $ since $bold(u)$ is a unit vector.

- *Maximum rate of change*: When $cos theta = 1$
- *Minimum rate of change*: When $cos theta = -1$

=== Local extrema
If $f$ has a local maximum or minimum $(a, b)$, then
$ f_x (a, b) = f_y (a, b) = 0 $

=== Saddle points
Also a critical point, but not a local minimum/maximum.

*Note*: Extrema are "decisive" -- the function goes up or down in all directions; while saddle points are "indecisive" -- they're minima in some directions and maxima in others.

=== Second derivative test

Suppose $f(x, y)$ has continuous second-order partial derivatives on some open disk centered at $(a, b)$. Suppose $f_x (a, b) = f_y (a, b) = 0$ (that is $(a, b)$ is a critical point). Define the _discriminant_ $D$ for the point $(a, b)$ by

$ D = D(a, b) = f_(x x)(a, b) f_(y y)(a, b) - [f_(x y)(a, b)]^2 $

1. If $D > 0$ and $f_(x x)(a, b) > 0$, then $f(a, b)$ is a local minimum.
2. If $D > 0$ and $f_(x x)(a, b) < 0$, then $f(a, b)$ is a local maximum.
3. If $D < 0$, then $(a, b)$ is a saddle point of $f$.
4. If $D = 0$, then no conclusion can be drawn.

= Double integrals

The *double integral* of $f$ over the rectangle $R$ is

$ integral integral_R f(x, y) dif A = lim_(m, n -> infinity) sum_(i=1)^m sum_(j=1)^n f(x_(i j)^*, y_(i j)^*) Delta A $

_provided the limit exists and is the same for any choice of the sample points_ $(x_(i j)^*, y_(i j)^*)$ _in_ $R_(i j)$, _for_ $1 <= i <= m$, $1 <= j <= n$.

When this happens, we say that $f$ is *integrable* over $R$.

== Fubini's Theorem

If $f$ is continuous on the rectangle $R = {(x, y) | a <= x <= b, c <= y <= d}$, then

$ integral integral_R f(x, y) dif A = integral_a^b integral_c^d f(x, y) dif y dif x = integral_c^d integral_a^b f(x, y) dif x dif y $

In other words, the double integral can be computed as an iterated integral in either order.


== Splitting (special case)
If $f(x, y) = g(x) h(y)$,
$ integral integral_R g(x)h(y) "dA" = (integral^b_a g(x) "dx")(integral^d_c h(y) "dy") $
where $R = [a, b] times [c, d]$

== Double integral over general region

If $f$ is continuous on a Type I domain $D$ such that

$ D = {(x, y) | a <= x <= b, g_1(x) <= y <= g_2(x)} $

then

$ integral integral_D f(x, y) dif A = integral_a^b integral_(g_1(x))^(g_2(x)) f(x, y) dif y dif x. $

If $f$ is continuous on a Type II domain $D$ such that

$ D = {(x, y) | c <= y <= d, h_1(y) <= x <= h_2(y)} $

then

$ integral integral_D f(x, y) dif A = integral_c^d integral_(h_1(y))^(h_2(y)) f(x, y) dif x dif y. $


== Polar coordinates

If $f$ is continuous on a polar rectangle $R$ given by

$ R = {(r, theta) | 0 <= a <= r <= b, alpha <= theta <= beta} $

where $0 <= beta - alpha <= 2pi$, then

$ integral integral_R f(x, y) dif A = integral_alpha^beta integral_a^b f(r cos theta, r sin theta) r dif r dif theta. $

Note: remember the $r d r d theta$
=== Determining Bounds for Polar Coordinates

To convert a double integral to polar coordinates:

1. *For $r$ bounds:* Draw a ray from the origin at angle $theta$. The ray enters the region at $r = r_1(theta)$ and exits at $r = r_2(theta)$. These become your limits for $r$.

2. *For $theta$ bounds:* Determine the range of angles needed to sweep through the entire region. This gives your limits for $theta$.

=== The Jacobian and Change of Variables

For a transformation $x = x(u,v)$ and $y = y(u,v)$, the *Jacobian* is:

$ J = (partial(x,y))/(partial(u,v)) = det mat(
  (partial x)/(partial u), (partial x)/(partial v);
  (partial y)/(partial u), (partial y)/(partial v)
) = (partial x)/(partial u) (partial y)/(partial v) - (partial x)/(partial v) (partial y)/(partial u) $

The change of variables formula is:

$ integral integral_R f(x,y) dif x dif y = integral integral_S f(x(u,v), y(u,v)) |J| dif u dif v $

The Jacobian measures how the transformation distorts area. A small region with area $dif u dot dif v$ in the $u v$-plane maps to area $|J| dot dif u dot dif v$ in the $x y$-plane, which is why we multiply by $|J|$ when changing variables.

=== Surface Area
Let $arrow(P Q)$ be the vector on the tangent plane at $P$ with $x$-component $d x$, and $arrow(P R)$ the vector with $y$-component $d y$. Thus, $arrow(P Q) = chevron.l d x, 0, f_x (x, y) d x chevron.r$ and $arrow(P R) = chevron.l 0, d y, f_y (x, y) d y chevron.r$. The area of the parallelogram spanned by $arrow(P Q)$ and $arrow(P R)$ is the magnitude of the cross product $arrow(P Q) times arrow(P R)$.

$ arrow(P Q) times arrow(P R) = mat(delim: "|",
  bold(i), bold(j), bold(k);
  d x, 0, f_x d x;
  0, d y, f_y d y
) = (-f_x, -f_y, 1) d x d y. $

Therefore, $d S = |(-f_x, -f_y, 1) d x d y| = sqrt(f_x^2 + f_y^2 + 1) d A$. 

$ "Surface Area" = integral integral_D d S = integral integral_D sqrt(f_x^2 + f_y^2 + 1) d A $.


= Differential Equations

== Separable DE
Such an equation is of the form $y' = f(x)g(y)$.

Methods to separate:
1. $y' = f(y/x)$: use $u = y/x => y' = (u x)' = u + u' x$
2. $y' = f(a x+b y)$: use $u = a x + b y$.

== Linear first order ODE

Given form 
$(d y)/(d x) + P(x) y = Q(x)$, define $I(x) = e^(integral P(x) d x)$. Then,
$ y dot I(x) = integral Q(x) dot I(x) d x $

== Bernoulli equation

Given form $y' + P(x)y = Q(x)y^n$, substitute $u = y^(1-n)$.

Then get $u' + (1-n)P(x) u= (1-n) Q(x)$, which is first order ODE.