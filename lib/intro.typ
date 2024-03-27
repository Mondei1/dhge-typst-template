#let data(key, value) = {
  table(
    columns: (1fr, 3fr),
    stroke: none,
    align: horizon,
    key, stack(
      value,
      spacing: 8pt,
      line(length: 100%),
    )
  )

  v(1em)
}

#let tickbox(numbering, ticked) = {
  table(
    columns: (auto),
    stroke: none,
    align: horizon,
    numbering,
    rect(width: 5mm, height: 5mm, stroke: black, if ticked [✓])
  )
}

#let project_number(number) = {
  table(
    columns: (1fr, 3fr),
    stroke: none,
    align: horizon,
    [Projektarbeit Nr.:], stack(
      stack(
        dir: ltr,
        tickbox("I", number == 1),
        tickbox("II", number == 2),
        tickbox("III", number == 3),
        tickbox("IV", number == 4)
      ),
      spacing: 16pt
    )
  )
}

#let toc() = {
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(
    title: none,
    depth: 3,
    indent: 2em
  )
}
