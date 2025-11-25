#import "../utils.typ": *

== CSE

== Control
#figure(
  image("../figures/control.png", width: 70%),
  caption: [
    Evaluating `1+2;`: LHS pushed onto control before RHS, stash takes values from bottom of control
  ],
)

== Environment
=== Assignments
- `:` for `let`
- `:=` for `const` and `function`
=== Functions
- Left ball points towards frame
- Right ball contains closure with:
  1. parameters
  2. function body
== Scoping
- New frames only created if
  1. block scope has declarations
  2. function call has parameters
- function calls travel up the tree to find a declaration

