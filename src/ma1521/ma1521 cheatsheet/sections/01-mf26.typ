= mf26

== Binomial Expansion

$ (a + b)^n = binom(n, 0) a^n + binom(n, 1) a^(n-1) b + binom(n, 2) a^(n-2) b^2 + binom(n, 3) a^(n-3) b^3 + dots $

where $n$ is a positive integer and $binom(n, r) = frac(n!, r!(n-r)!)$

== Maclaurin Expansion

$ f(x) = f(0) + x f'(0) + frac(x^2, 2!) f''(0) + dots + frac(x^n, n!) f^((n))(0) + dots $

$ f(x) = sum_(n=0)^infinity (f^(\(n\))(a))/n! (x-a)^n $

$ (1 + x)^n = 1 + n x + frac(n(n-1), 2!) x^2 + frac(n(n-1)dots.c(n-r+1), r!) x^r + dots.c = sum_(r=0)^infinity binom(n, r) x^r quad (|x| < 1) $

$ e^x = 1 + frac(x, 1!) + frac(x^2, 2!) + frac(x^3, 3!) + dots.c + frac(x^r, r!) + dots.c = sum_(r=0)^infinity frac(x^r, r!) quad ("all" x) $

$ sin x = x - frac(x^3, 3!) + frac(x^5, 5!) - dots.c + frac((-1)^r x^(2r+1), (2r+1)!) + dots.c = sum_(r=0)^infinity frac((-1)^r x^(2r+1), (2r+1)!) quad ("all" x) $

$ cos x = 1 - frac(x^2, 2!) + frac(x^4, 4!) - dots.c + frac((-1)^r x^(2r), (2r)!) + dots.c = sum_(r=0)^infinity frac((-1)^r x^(2r), (2r)!) quad ("all" x) $

$ ln(1 + x) = x - frac(x^2, 2) + frac(x^3, 3) - dots.c + frac((-1)^(r-1) x^r, r) + dots.c = sum_(r=1)^infinity frac((-1)^(r-1) x^r, r) quad (-1 < x <= 1) $


== Partial Fraction Decomposition

$ frac(p x + q, (a x + b)(c x + d)) = frac(A, a x + b) + frac(B, c x + d) $

$ frac(p x^2 + q x + r, (a x + b)^2 (c x + d)) = frac(A, a x + b) + frac(B, (a x + b)^2) + frac(C, c x + d) $

$ frac(p x^2 + q x + r, (a x + b)(x^2 + c)) = frac(A, a x + b) + frac(B x + C, x^2 + c) $

== Trigonometry

$ sin(A plus.minus B) equiv sin A cos B plus.minus cos A sin B $

$ cos(A plus.minus B) equiv cos A cos B minus.plus sin A sin B $

$ tan(A plus.minus B) equiv frac(tan A plus.minus tan B, 1 minus.plus tan A tan B) $

$ sin 2A equiv 2 sin A cos A $

$ cos 2A equiv cos^2 A - sin^2 A equiv 2 cos^2 A - 1 equiv 1 - 2 sin^2 A $

$ tan 2A equiv frac(2 tan A, 1 - tan^2 A) $

$ sin P + sin Q equiv 2 sin (frac(P + Q, 2)) cos (frac(P - Q, 2)) $

$ sin P - sin Q equiv 2 cos (frac(P + Q, 2)) sin (frac(P - Q, 2)) $

$ cos P + cos Q equiv 2 cos (frac(P + Q, 2)) cos (frac(P - Q, 2)) $

$ cos P - cos Q equiv -2 sin (frac(P + Q, 2)) sin (frac(P - Q, 2)) $

== Principal values:

$ -frac(pi, 2) <= sin^(-1) x <= frac(pi, 2) quad (|x| <= 1) $

$ 0 <= cos^(-1) x <= pi quad (|x| <= 1) $

$ -frac(pi, 2) < tan^(-1) x < frac(pi, 2) $

== Vectors

The point dividing $A B$ in the ratio $lambda : mu$ has position vector $frac(lambda bold(b) + mu bold(a), lambda + mu)$

$ bold(a) times bold(b) = mat(a_1; a_2; a_3) times mat(b_1; b_2; b_3) = mat(a_2 b_3 - a_3 b_2; a_3 b_1 - a_1 b_3; a_1 b_2 - a_2 b_1) $