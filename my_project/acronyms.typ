// https://github.com/typst/typst/issues/659
#let acronyms = json("acronyms.json")

// The state which tracks the used acronyms
#let usedAcronyms = state("usedDic", (:))

// The function which either shows the acronym or the full text for it

#let acro(body) = {
  if(acronyms.keys().contains(body) == false) {
    return highlight(fill: red, [*Warning: #body*],)
  }

  // let usedDic = context usedAcronyms.get()
  eval(acronyms.at(body).at(1), mode: "markup")
  // usedAcronyms.display(usedDic => {
  //   return eval(acronyms.at(body).at(1), mode: "markup")
  // });
  // eval(acronyms.at(body).at(1), mode: "markup")
  usedAcronyms.update(usedDic => {
    usedDic.insert(body, true)
    return usedDic
  })
}
