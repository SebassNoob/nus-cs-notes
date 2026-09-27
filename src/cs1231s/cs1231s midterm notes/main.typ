= cs1231s lecture notes

== Types of statement

- *Universal:* true for all elements in set
- *Conditional:* if $P_1$ is true, another $P_2$ is also true
  - *Universal conditional:* for all $a$, if $a$ match $P_1$, then $a$ match $P_2$.
- *Existential:* at least 1 thing in a set is true
  - *Universal existential:* first part is universal, second part is existential
  - *Existential universal:* first part is existential, second is universal

- *Necessary:* It is not enough to prove $p -> q$ although $p$ being true is one of many conditions needed to prove $q$.
- *Sufficient:* It is enough to prove $p -> q$ with $p$ being true means $q$ must be true.  

=== Operations
- *Closure:* An operation on elements of a set produces a result that is also in the set.
- *Commutativity:* The order of the operands doesn't affect the result.
- *Associativity:* The way operands are grouped doesn't affect the result.
- *Distributivity:* One operation distributes over another.
- *Trichotomy:* For any two elements a and b in a totally ordered set, exactly one holds: a < b, a = b, or a > b.

== Notation

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header([priority], [symbol], [name]),
  [1],
  [\~],
  [not (negation)],
  [2],
  [$and$],
  [and (conjunction)],
  [2],
  [$or$],
  [or (disjunction)],
  [3],
  [$arrow$],
  [then/implies]
)

$a|b arrow b=\a\c$

== If/then properties

=== Operations on statement
- *Negative:* the negative of $p arrow q$ is $p and \~q$
- *Converse:* $p arrow q$ is the converse of $q arrow p$
- *Inverse:* $p arrow q$ is the inverse of $\~p arrow \~q$
- *Contrapositive:* $p arrow q$ is the contrapositive of $\~q arrow \~p$

=== Decomposition Rules
- *Biconditional Law:* $p arrow.l.r q equiv (p arrow q) and (q arrow p)$
- *Implication:* $p arrow q equiv \~p or q$
- *Contrapositive Law:* $p arrow q equiv \~q arrow \~p$

=== iff

$a "iff" b equiv a arrow b and b arrow a$

== Soundness
An argument is *sound* if it is both *true* and *valid*.

=== Truth
1. Check if all premises are true.
  - If all true, argument is true and vice-versa.

=== Validity

Assume premises are true. Is the conclusion true?

1. Construct a truth table showing the truth values of all the premises and the conclusion.
2. A row of the truth table in which all the premises are true is called a *critical row*.
   - If there is a critical row in which the conclusion is false #sym.arrow the argument form is invalid.
   - If the conclusion in every critical row is true #sym.arrow the argument form is valid.

== Rules of inference

#table(
  columns: 2,
  align: (left, left),
  stroke: 0.5pt,
  [*Rule of Inference*], [*Logical Form*],

  [Modus Ponens],
  [$p arrow q, p tack.r q$],

  [Modus Tollens],
  [$p arrow q, \~q tack.r \~p$],

  [Generalization],
  [$p tack.r p or q$; $q tack.r p or q$],

  [Specialization],
  [$p and q tack.r p$; $p and q tack.r q$],

  [Conjunction],
  [$p, q tack.r p and q$],

  [Elimination],
  [$p or q, \~q tack.r p$; $p or q, \~p tack.r q$],

  [Transitivity],
  [$p arrow q, q arrow r tack.r p arrow r$],

  [Proof by Division Into Cases],
  [$p or q, p arrow r, q arrow r tack.r r$],

  [Contradiction Rule],
  [$\~p arrow "false" tack.r p$],
)

== Logical equivalences
#table(
  columns: (2fr, 3fr, 3fr),
  stroke: 0.5pt,
  align: horizon,
  [Commutative laws], [$p and q equiv q and p$], [$p or q equiv q or p$],
  [Associative laws],
    [$p and q and r \ equiv (p and q) and r equiv p and (q and r)$],
    [$p or q or r \ equiv (p or q) or r equiv p or (q or r)$],
  [Distributive laws],
    [$p and (q or r) equiv (p and q) or (p and r)$],
    [$p or (q and r) equiv (p or q) and (p or r)$],
  [Identity laws], [$p and "true" equiv p$], [$p or "false" equiv p$],
  [Negation laws], [$p or tilde p equiv "true"$], [$p and tilde p equiv "false"$],
  [Double negative law], [$tilde tilde p equiv p$], [],
  [Idempotent laws], [$p and p equiv p$], [$p or p equiv p$],
  [Universal bound laws], [$p or "true" equiv "true"$], [$p and "false" equiv "false"$],
  [De Morgan's laws], [$ tilde (p and q) equiv tilde p or tilde q$], [$tilde (p or q) equiv tilde p and tilde q$],
  [Absorption laws], [$p or (p and q) equiv p$], [$p and (p or q) equiv p$],
  [Negation of true and false], [$tilde "true" equiv "false"$], [$tilde "false" equiv "true"$],
)

- Universal Instantiation: If some property is true of everything in the set, then it is true of any particular thing in the set.

== Predicates

- A *predicate* is a sentence that contains a finite number of variables and becomes a statement when specific values are substituted for the variables.
- The *domain* of a predicate variable is the set of all values that may be substituted in place of the variable.
  - If $D = {x_1, x_2, ..., x_n}$, then:
    - $forall x in D, Q(x) equiv Q(x_1) and Q(x_2) and ... and Q(x_n)$
    - $exists x in D, Q(x) equiv Q(x_1) or Q(x_2) or ... or Q(x_n)$

=== Operations
$tilde (forall x in D, P(x)) equiv exists x in D, tilde P(x)$. Note negative of $forall$ is $exists$ and vice-versa.

- *Negation:*
  - $tilde (forall x in D, exists y in E "such that" P(x,y)) equiv exists x in D "such that" forall y in E, tilde P(x,y)$
  - $tilde (exists x in D "such that" forall y in E, P(x,y)) equiv forall x in D, exists y in E "such that" tilde P(x,y)$
- *Contrapositive/converse/inverse* of $forall x in D, (P(x) -> Q(x))$:
  - Contrapositive: $forall x in D, (tilde Q(x) -> tilde P(x))$
  - Converse: $forall x in D, (Q(x) -> P(x))$
  - Inverse: $forall x in D, (tilde P(x) -> tilde Q(x))$

=== Sufficience/Necessity
- $forall x, r(x)$ is a *sufficient condition* for $s(x)$ means $forall x, (r(x) -> s(x))$.
- $forall x, r(x)$ is a *necessary condition* for $s(x)$ means $forall x, (tilde r(x) -> tilde s(x))$, or equivalently, $forall x, (s(x) -> r(x))$.
- $forall x, r(x)$ *only if* $s(x)$ means $forall x, (tilde s(x) -> tilde r(x))$, or equivalently, $forall x, (r(x) -> s(x))$.

== Proofs

Assume we want to prove $p arrow q$.

1. Direct proof / Counter-example
  - Suppose $p$.
  - _etc..._
  - Thus we get $p$. So $p -> q$.
2. Contraposition
  - Suppose $\~q$.
  - _...etc_
  - Thus we get $\~p$. So $\~q -> \~p equiv p -> q$.
3. Contradiction
  - Suppose $\~(p arrow q)$
  - _...etc_
  - Contradiction
  - Hence $p -> q$.

- If we want to prove $p arrow.l.r q$ then we have to prove both $p arrow q and q arrow p$ 

== Sets
- Set builder notation: ${ x in U | P(x) }$ meaning $x$ must be in $U$ and $P(x)$ is true
- Replacement notation: ${ t(x) | x in A }$ meaning the set of all $t(x)$ where $x in A$
- Roster notation: ${ a, b, c, d, ... }$ just list it out 
#table(
  columns: 2,
  stroke: 0.5pt,
  [*Symbol*], [*Description*],
  [$subset.eq$], [Subset: $A subset.eq B <=> forall x (x in A => x in B)$],
  [$subset.neq$], [Proper subset: $A subset.neq B <=> A subset.eq B and A eq.not B$],
  [$subset.eq.not$], [Not subset: $A subset.eq.not B <=> exists x (x in A and x in.not B)$],
  [$emptyset$], [Empty set: the set with no elements, ${}$],
  [$union$], [Union: $A union B = {x in U : x in A or x in B}$],
  [$inter$], [Intersection: $A inter B = {x in U : x in A and x in B}$],
  [$without$], [Set difference: $B without A = {x in U : x in B and x in.not A}$],
  [$overline(A)$], [Complement: $overline(A) = {x in U : x in.not A}$],
)
- Ordered pairs: $(a, b) equiv (x, y)$ iff $(a = x) and (b = y)$
- Cartesian product: $A times B = { (a, b) | a in A and b in B }$

=== Intervals ($a <= b$)
$(a,b)={x : a<x<b}$, $[a,b]={x : a<=x<=b}$

=== Indexed unions/intersections
$union.big_(i=0)^n A_i = {x in U | x in A_i "for some" i}$, $inter.big_(i=0)^n A_i = {x in U | x in A_i "for all" i}$ (also for $i=0$ to $infinity$).

=== Disjoint / partition
- Disjoint: $A inter B = emptyset$
- Mutually/pairwise disjoint: $A_i inter A_j = emptyset$ whenever $i != j$
- Partition of $A$: mutually disjoint sets whose union is $A$
- [Formally] $cal(C)$ is a partition of $A$ iff: all elements of $cal(C)$ are non-empty subsets of $A$, and every $x in A$ is in exactly one $S in cal(C)$, i.e. $forall x in A, exists! S in cal(C) (x in S)$

=== Power set
- $cal(P)(A)$ = set of all subsets of $A$ (power set axiom guarantees it's a set)
- $|A|=n => |cal(P)(A)|=2^n$

=== n-tuples
- $(x_1,...,x_n)=(y_1,...,y_n) <=> x_1=y_1 and ... and x_n=y_n$
- $A_1 times ... times A_n = {(a_1,...,a_n) : a_1 in A_1 and ... and a_n in A_n}$
- $A^n = A times A times ... times A$ ($n$ times)

=== Subset relations 
- $A inter B subset.eq A, B$
- $A, B subset.eq A union B$
- $A subset.eq B and B subset.eq C -> A subset.eq C$ (transitive)

=== Procedural definitions
- $a in X union Y <=> a in X or a in Y$
- $a in X inter Y <=> a in X and a in Y$
- $a in X - Y <=> a in X and a in.not Y$
- $a in overline(X) <=> a in.not X$
- $(a,b) in X times Y <=> a in X and b in Y$

=== Set identities 
Same structure as logical equivalences ($union~or$, $inter~and$, $emptyset~"false"$, $U~"true"$), and:
- Identity: $A union emptyset = A$, $A inter U = A$
- Complement: $A union overline(A) = U$, $A inter overline(A) = emptyset$
- Double complement: $overline(overline(A)) = A$
- Complements of $U, emptyset$: $overline(U) = emptyset$, $overline(emptyset) = U$
- Set difference law: $A without B = A inter overline(B)$

== Relations
=== Definitions
- Relation from $A$ to $B$: a subset $R subset.eq A times B$
- $x R y$ (x is R-related to y) iff $(x,y) in R$
=== Properties
- Domain: $"Dom"(R) = {a in A : a R b "for some" b in B}$
- Co-domain: $"coDom"(R) = B$
- Range: $"Range"(R) = {b in B : a R b "for some" a in A}$
=== Operations
- Inverse relation $R^(-1)$ from $B$ to $A$: $R^(-1) = {(y,x) in B times A : (x,y) in R}$; just invert the ordered pair
- Relation on a set $A$: relation from $A$ to $A$, i.e. subset of $A times A$
- Composition of relations: $R subset.eq A times B$, $S subset.eq B times C$, then $S compose R subset.eq A times C$: $forall x in A, forall z in C, (x (S compose R) z <=> exists y in B (x R y and y S z))$
  - Apply $R$ first then apply $S$.

=== Reflexivity, Symmetry, Transitivity

- Reflexive: $forall x in A, x R x$
- Symmetric: $forall x,y in A, x R y => y R x$
- Transitive: $forall x,y,z in A, (x R y and y R z) => x R z$

- Transitive closure $R^t$ of $R$: smallest transitive relation containing $R$
  - $R^t$ is transitive; $R subset.eq R^t$; if $S$ transitive and $R subset.eq S$, then $R^t subset.eq S$ 
  - ie. add the smallest number of ordered pairs to the relation $R$ s.t. transitivity is satisfied for all elements

=== Equivalence partitions
- Relation induced by partition $cal(C)$ of $A$: $forall x,y in A, x R y <=> exists$ component $S in cal(C)$ s.t. $x,y in S$ 
  - ie. for all components of partition, relation forms when choosing all permutations of 2 plus pairing with each element with itself of each component
  - This relation satisfies reflexivity, symmetry and transitivity
  - Hence, $S = S^(-1); S compose S^(-1) = S$

- Equivalence relation: relation $R$ on $A$ that is reflexive, symmetric, transitive ($R$ is usually written with $~$)
- Equivalence class of $a$ under $tilde$: $[a]_tilde = {x in A : a tilde x}$
  - ie. basically a set where all elements have an equivalence relation to each other.
  - Note that the class has $a$ as well as all other elements related to it
- Congruence mod $n$: $a equiv b space (mod n) <=> a - b = n k$ for some $k in ZZ$, i.e. $n | (a-b)$
  - ie. $a mod n = b mod n$, both leave the same remainder when divided by n.
- Quotient set: $A slash tilde = {[x]_tilde : x in A}$ (set of all equivalence classes)

=== Partial Order Relations

- Antisymmetric: relation $R$ on $A$ s.t. $forall x,y in A, (x R y and y R x) => x=y$
  - ie. if $x$ and $y$ relate both ways, they must be the same element - no two *distinct* elements can relate to each other in both directions

- Partial order: relation $R$ on $A$ that is reflexive, antisymmetric, transitive (written $prec.eq$)
- Poset: set $A$ with partial order $prec.eq$, denoted $(A, prec.eq)$
- Hasse diagram: for distinct $x,y,m in A$, if $x prec.eq y$ and no $m$ with $x prec.eq m prec.eq y$, draw $x$ below $y$ joined by a line; else no line
  - Minimal: no lines below it; Maximal: no lines above it
  - Minimum: a minimal element that is comparable to all elements; Maximum: a maximal element that is comparable to all elements. Note that they are unique if they exist.
- Comparable: $x,y$ comparable iff $x prec.eq y$ or $y prec.eq x$; else noncomparable

=== Total Order Relations
- Total order: partial order $R$ on $A$ s.t. $forall x,y in A, x R y or y R x$ (every pair comparable)
- Linearization: total order $prec.eq^*$ on $A$ extending partial order $prec.eq$, i.e. $forall x,y in A, x prec.eq y => x prec.eq^* y$
  - eg. on the hasse diagram, 
    1. find any minimal/the minimum element and push it to a list. Remove the element.
    2. repeat step 1 until exhausted.
    3. stack contains linearization. $x prec.eq^* y$ iff $x$ was appears earlier than $y$.
- Well-ordered: total order $prec.eq$ on $A$ s.t. every non-empty subset has a smallest element: $forall S in cal(P)(A), S != nothing => (exists x in S, forall y in S, x prec.eq y)$

== Functions
- Function $f: X -> Y$: relation s.t. (F1) $forall x in X, exists y in Y, (x,y) in f$ and (F2) that $y$ is unique
  - ie. every $x$ maps to exactly one $y$
- $f(x) = y$: means $(x,y) in f$; $x$ is the *argument*, $y$ is the *output/image* of $x$; $x$ is a *preimage* of $y$

=== Setwise image and preimage
- Setwise image: for $A subset.eq X$, $f(A) = {f(x) : x in A}$
- Setwise preimage: for $B subset.eq Y$, $f^(-1)(B) = {x in X : f(x) in B}$
  - ie. $f(A)$ = map $f$ over $A$; $f^(-1)(B)$ = elements mapping into $B$

=== Sequences and Strings
- Sequence: $a_0,a_1,a_2,...$ represented by function $a: ZZ_(>=0) -> "codomain"$ with $a(n) = a_n$
- Fibonacci: $F_0 = 0$, $F_1 = 1$, $F_(n+2) = F_(n+1) + F_n$
- String over $A$: $a_0 a_1 ... a_(l-1)$, $a_i in A$, length $l in ZZ_(>=0)$; empty string $epsilon$ has $l=0$
- Sequence equality: $a = b$ iff $a(n) = b(n) forall n in ZZ_(>=0)$; set of all sequences over $A$ is $A^infinity$ or $"Seq"(A)$
- String equality: $s_1 = s_2$ iff same length and $a_i = b_i forall i$; set of all strings over $A$ is $A^*$ or $"Str"(A)$
- Function equality: $f=g$ iff same domain, same codomain, and $f(x)=g(x) forall x$


=== Injection and Surjection
- Injective (one-to-one): $forall x_1,x_2 in X, f(x_1)=f(x_2) => x_1=x_2$ (equiv. $x_1 != x_2 => f(x_1) != f(x_2)$)
- Surjective (onto): $forall y in Y, exists x in X, y = f(x)$
  - ie. every codomain element has a preimage, so range = codomain