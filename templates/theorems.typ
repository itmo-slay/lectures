#import "@preview/showybox:2.0.4": showybox

#let definition-counter = counter("definition")
#let example-counter = counter("example")
#let lemma-counter = counter("lemma")

#let definition(..bodies) = {
  definition-counter.step()
  showybox(
    sep: (
      thickness: 0.5pt,
      dash: "solid",
    ),
    shadow: (
      color: luma(128).lighten(70%),
      offset: 3pt,
    ),
    title: context [Definition #definition-counter.display()],
    frame: (
      border-color: olive.lighten(60%),
      title-color: olive.lighten(50%),
      body-color: olive.lighten(90%),
      radius: 8pt,
    ),
    ..bodies,
  )
}

#let example(..bodies) = {
  example-counter.step()
  showybox(
    sep: (
      thickness: 0.5pt,
      dash: "solid",
    ),
    shadow: (
      color: luma(128).lighten(70%),
      offset: 3pt,
    ),
    title: context [Example #example-counter.display()],
    frame: (
      border-color: eastern.lighten(60%),
      title-color: eastern.lighten(50%),
      body-color: eastern.lighten(90%),
      radius: 8pt,
    ),
    ..bodies,
  )
}

#let lemma(statement, proof) = {
  lemma-counter.step()
  showybox(
    sep: (
      thickness: 0.5pt,
      dash: "solid",
    ),
    shadow: (
      color: luma(128).lighten(70%),
      offset: 3pt,
    ),
    title: context [Lemma #lemma-counter.display()],
    frame: (
      border-color: blue.lighten(60%),
      title-color: blue.lighten(50%),
      body-color: blue.lighten(90%),
      radius: 8pt,
    ),
  )[
    #statement
  ][
    #proof
    #h(1fr) $qed$
  ]
}

#let theorem(name, statement, proof) = showybox(
  sep: (
    thickness: 0.5pt,
    dash: "solid",
  ),
  shadow: (
    color: luma(128).lighten(70%),
    offset: 3pt,
  ),
  title: name,
  frame: (
    border-color: purple.lighten(60%),
    title-color: purple.lighten(50%),
    body-color: purple.lighten(90%),
    radius: 8pt,
  ),
)[
  #statement
][
  #proof
  #h(1fr) $qed$
];
