= 3d calculus
== Vectors
- *Component of b along a*: $"comp"_a\b = |b| cos θ =( a dot b)/(|a|) $
- *Projection of b onto a*: $"proj"_a\b = "comp"_a\b × a/(|a|)$ (multiply by unit vector)
- *Dot Product*: $a dot b = |a||b| cos theta$
  - Commutative and distributive
  - $a dot a = |a|^2$
- *Cross Product*: $a crossmark b = (|a||b| sin theta)hat(n)$
  - Distributive, $a crossmark b = -b crossmark a$
== Multivariable functions
- *Partial derivative definition*: $f_x (x,y) = lim_(h->infinity) (f(x+h,y)-f(x,y))/h$
- *Clairaut's theorem*: If $f_(\x\y)(x,y)$ and $f_(\y\x)(x,y)$ are continuous on $D$, $f_(\x\y)(x,y) = f_(\y\x)(x,y)$.
- *Second derivative test*: 
    $ D = f_(x x) f_(y y) - (f_(x y))^2 $
  1. If $D > 0$ and $f_(x x)(a, b) > 0$, then $f(a, b)$ is a local minimum.
  2. If $D > 0$ and $f_(x x)(a, b) < 0$, then $f(a, b)$ is a local maximum.
  3. If $D < 0$, then $(a, b)$ is a saddle point of $f$.
  4. If $D = 0$, then no conclusion can be drawn.

=== Properties of functions

#table(
  columns: (auto, 10fr, 9fr),
  align: (center + horizon, left, left),
  stroke: 0.5pt,
  inset: 2pt,
  
  [*Topic*], [*Level Surface* \ $F(x, y, z) = k$], [*Explicitly Defined Surface* \ $z = f(x, y)$],
  
  [*Finding Tangent Plane*

  Consider 2 vectors on the plane
  
  $vec(1, 0, f_x (a,b)) crossmark vec(0, 1, f_y (a,b)) = vec(f_x (a,b), f_y (a,b), -1)$
  ],
  [
    $ F_x (x - x_0) + F_y (y - y_0) + F_z (z - z_0) = 0 $
    
    Vector form:
    $ nabla F(bold(x_0)) dot (bold(x) - bold(x_0)) = 0 $
  ],
  [
    $ z - z_0 = f_x (x - x_0) + f_y (y - y_0) $
    
    Vector form:
    $ z - z_0 = nabla f(x_0, y_0) dot (x - x_0, y - y_0) $
  ],
  
  [*Finding Critical Points*],
  [
    $ F_x (x, y, z) = 0 \
    F_y (x, y, z) = 0 \
    F_z (x, y, z) = 0 \
    F(x, y, z) = k $
    
    Vector form:
    $ nabla F(bold(x)) = bold(0) "subject to" F(bold(x)) = k $
  ],
  [
    $ f_x (x, y) = 0 \
    f_y (x, y) = 0 $
    
    Vector form:
    $ nabla f(x, y) = bold(0) $
  ],
)


=== Differentiation

- *Chain rule*: For $u(x_1, x_2, ...)$ and $x_1 = f(t_i, ...), x_2 = g(t_i, ...)$
$ (partial u) / (partial t_i) = sum_(j=1)^n (partial u) / (partial x_j) (partial x_j) / (partial t_i) = (partial u) / (partial x_1) (partial x_1) / (partial t_i) + (partial u) / (partial x_2) (partial x_2) / (partial t_i) + dots.c + (partial u) / (partial x_n) (partial x_n) / (partial t_i) $
- *Implicit Differentiation*: If $F(x,y,z) = k$ defines $z$ implicitly as a differentiable function of $x$ and $y$, then:

$ (partial z)/(partial x) = -(F_x)/(F_z), quad (partial z)/(partial y) = -(F_y)/(F_z) $

provided $F_z != 0$.
- *Gradient Vector*: Always normal to the surface.
$ nabla f = chevron.l f_x, f_y, f_z chevron.r = (partial f)/(partial x) bold(i) + (partial f)/(partial y) bold(j) + (partial f)/(partial z) bold(k) $
- *Directional derivative*: 
$ D_bold(hat(u)) f(x_0, y_0, z_0) = lim_(h arrow 0) (f(x_0 + h a, y_0 + h b, z_0 + h c) - f(x_0, y_0, z_0))/h = nabla f(x_0, y_0, z_0) dot bold(hat(u)) = |nabla f|cos theta  $
- *Differential approximation*: Suppose $f$ is differentiable at $(a,b)$. Let $Delta x$ and $Delta y$ be small increments in $x$ and $y$ respectively from $(a,b)$. Then:

$ Delta z approx d z = f_x (a,b) Delta x + f_y (a,b) Delta y = f_x (a,b) d x + f_y (a,b) d y $

provided $Delta x$ and $Delta y$ are small and $f(x,y)$ is differentiable. Note that the differential $d z$ is the change in the *tangent plane* as $(x,y)$ changes from $(a,b)$ to $(a + Delta x, b + Delta h)$.

== Double Integrals
- *Definition*:
$ integral integral_R f(x, y) dif A = lim_(m, n -> infinity) sum_(i=1)^m sum_(j=1)^n f(x_(i j)^*, y_(i j)^*) Delta A $
- *Fubini's Theorem*: If $f$ is continuous on the rectangle $R = {(x, y) | a <= x <= b, c <= y <= d}$, then

$ integral integral_R f(x, y) dif A = integral_a^b integral_c^d f(x, y) dif y dif x = integral_c^d integral_a^b f(x, y) dif x dif y $

- *Splitting*: If $f(x, y) = g(x) h(y)$,
$ integral integral_R g(x)h(y) dif A = (integral^b_a g(x) dif x)(integral^d_c h(y) dif y) $
where $R = [a, b] times [c, d]$

- *Iterated Integrals*:
If $D = {(x, y) | a <= x <= b, g_1(x) <= y <= g_2(x)}$, 
$ integral integral_D f(x, y) dif A = integral_a^b integral_(g_1(x))^(g_2(x)) f(x, y) dif y dif x. $ 

- *Polar coordinates*: 

If $f$ is continuous on a polar rectangle $R$ given by

$ R = {(r, theta) | 0 <= a <= r <= b, alpha <= theta <= beta} $

where $0 <= beta - alpha <= 2pi$, then

$ integral integral_R f(x, y) dif A = integral_alpha^beta integral_a^b f(r cos theta, r sin theta) r dif r dif theta. $
- *Jacobian*:
$ integral integral_R f(x,y) dif x dif y = integral integral_S f(x(u,v), y(u,v)) |(partial x)/(partial u) (partial y)/(partial v) - (partial x)/(partial v) (partial y)/(partial u)| dif u dif v $

- *Surface area*: For implicit $F(x,y,z) = k$, make $z$ the subject.

$ "Surface Area" = integral integral_D d S = integral integral_D sqrt(f_x^2 + f_y^2 + 1) d A $.

== Ordinary Differential Equations


- *Separable DE*: $y' = f(x)g(y)$.
  1. $y' = f(y/x)$: use $u = y/x => y' = (u x)' = u + u' x$
  2. $y' = f(a x+b y)$: use $u = a x + b y$.

- *Linear first order ODE* $(d y)/(d x) + P(x) y = Q(x)$, define $I(x) = e^(integral P(x) d x)$.

$ y dot I(x) = integral Q(x) dot I(x) d x $

- *Bernoulli equation*: $y' + P(x)y = Q(x)y^n$, substitute $u = y^(1-n)$. Then get $u' + (1-n)P(x) u= (1-n) Q(x)$, which is first order ODE.