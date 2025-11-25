#import "@preview/knowledge-key:1.0.2": *

#set page("a4")

#show: knowledge-key.with(
  title: [CS1101S midterm cheat sheet (AY25/26)],
  authors: "sebastian ong"
)

#include "sections/01-sorting-searching.typ"
#include "sections/03-combinations.typ"
#include "sections/04-trees.typ"
#include "sections/05-t-diagrams.typ"

#include "sections/02-spacetime-complexity.typ"
#include "sections/06-utils.typ"