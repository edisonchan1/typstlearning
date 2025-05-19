#import "@preview/codelst:2.0.1":sourcecode
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/tablex:0.0.9": tablex, hlinex, vlinex,
#import "@preview/a2c-nums:0.0.1": 
#import "./acronyms.typ": acro, usedAcronyms, acronyms
#import "@preview/a2c-nums:0.0.1": int-to-cn-num, int-to-cn-simple-num

#let project(
  kind: "硕士",
  title: "武汉理工大学论文模板",
  abstract-en: [],
  abstract-zh: [],
  title-en:[],
  title-zh:[],
  authors: [],
  teacher: [],
  // co-teacher:[],
  degree: [],
  major: [],
  field: [],
  college: [],
  secrit:[],
  signature: "",
  classification:[],
  security:[],
  acknowledgement: [],
  author-introduction: [],
  appendix:[],
  UDC:[],
  year:int,
  month:int,
  day:int,
  outline-depth: 3,
  draft:true,
  blind-review: false,
  abstract-en-outlined: true,
  logo:"./image.png",
  ref-path: "",
  ref-style:"emboj",
  acro-path: "",
  body

)= {
  if(blind-review){
    authors = hide[#authors]
    teacher = hide[#teacher]
    major = hide[#major]
    field = hide[#field]
    student-id = hide[#student-id]
    acknowledgement = hide[#acknowledgement]
    author-introduction = hide[#author-introduction]
    draft = false
  }
  

set document(title: title)
  set page(
    paper: "a4",
    margin: (left: 25mm, right: 25mm, top: 30mm, bottom: 25mm),
  )

  set text(font: ("Times New Roman", "簡宋"), size: 12pt, hyphenate: false)


  show: show-cn-fakebold
  set par(leading: 12pt, first-line-indent: 2em)
  set list(indent: 1em)
  set enum(indent: 1em)
  set highlight(fill: yellow)
  set heading(numbering: "1.1")
  set heading(numbering: (..n) => {
    if n.pos().len() > 1 { numbering("1.1", ..n) } 
  })
  show heading.where(level: 1): it => [
    //一级标题字体与格式
    #pagebreak(weak: true)
    #block(width: 100%)[
      #set align(center)
      #v(6pt,weak: false)
      #text(font: ("Times New Roman", "簡宋"), weight: "bold", 16pt)[#it.body]
      #v(6pt,weak: false)
    ]
  ]

  let titlepage1 = {

    let justify(s) = {
      if type(s) == content and s.has("text") { s = s.text }
      assert(type(s) == type("string"))
      s.clusters().join(h(1fr))
    }

    
    v(80pt)
  align(center, box(image(logo, fit: "stretch", width:70%)))
  align(center)[#text(18pt, weight: 70, "(申请"+major  +"学硕士学位论文)")]
  
  v(40pt)
    align(center)[
      #set par(leading: 14pt)
      #text(30pt, font:("Times New Roman", "簡宋"), weight: "bold", title-zh)
    ]


  let table_underline(content) = [
    #set text(15pt, baseline: 5pt)
    #content
    #v(1em)
  ]
  v(80pt)
  [
 #set text(15pt,font:"kai" ,weight:"black")
    #align(center)[
    #grid(
      columns: (100pt, 20pt, 50%),
      rows: 30pt,
      align:  horizon,
      stroke: none,
      justify[培养单位], [:], table_underline[#authors],
      justify[学科专业],[:], table_underline[#teacher],
        // justify[合作指导教师],[:],table_underline[#co-teacher],
      justify[论文作者], [:], table_underline[#degree],
      justify[指导老师], [:], table_underline[#major],
    )
  ]]
    v(60pt)
    align(center, int-to-cn-simple-num(str(year))+"年"+int-to-cn-num(month)+"月")
    pagebreak()
  }

  let titlepage2 = {
     let justify(s) = {
      if type(s) == content and s.has("text") { s = s.text }
      assert(type(s) == type("string"))
      s.clusters().join(h(1fr))
    }

    
 


[   #set text(font: "Kaiti TC",weight: "black")
    #table(
      columns: (38pt, 1em, 50pt, 1fr,50pt, 1em, 50pt), 
      rows:(15.6pt, 15.6pt), 
      stroke:none,
      inset:1pt,
      justify[分类号], [], [#classification],table.hline(y:1,start: 2,end:3  ), [],
      justify[密级], [], [#classification],table.hline(y:1,start: 6,end:7  ),
      justify[UDC],   [], [#UDC],table.hline(start: 2,end:3  ), [],
      justify[学校代码], [],[10497],table.hline(start: 6,end:7  )
    )]


    v(80pt)
    align(center, box(image(logo, fit: "stretch", width:70%)))

  
    align(center)[
      #set par(leading: 14pt)
      #text(30pt, font:("Times New Roman", "簡宋"), weight: "bold", [学位论文]
      )
      
    ]

  
  align(left)[
    #set text(14pt)
    #grid(
      columns: (70pt, 34pt, 1fr),
      rows: 27.3pt,
      align:  center+horizon,
      stroke: none,
      justify[题目], [], [#title-zh],grid.hline(start: 2,end:3),
      justify[英文题目],[], [#title-en],grid.hline(start: 2,end:3),
      justify[论文作者], [],[#degree],grid.hline(start: 2,end:3)
    )
    #v(4em)
    #grid(
      columns: (70pt,34pt,35pt,17pt,70pt,)

    )
  ]
    v(80pt)
    align(center, int-to-cn-simple-num(str(year))+"年"+int-to-cn-num(month)+"月")
    pagebreak()

  }
  let statementpage = {

    set text(font:"簡宋", 12pt)
    text(font:"Heiti TC", 16pt,weight: "bold")[#align(center)[研究生学位论文的独创性声明]]
    
    text(font:"簡宋", 15pt)[本人声明，所呈交的论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得武汉理工大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。]
    v(0pt)
    grid(
      columns: (4em, auto, 150pt, auto),
      [],
      [签名:],
      [],
      text("日期: "+str(year)+"年"+str(month)+"月"+str(day)+"日"),
    )
    v(4em)

    text(font:"Heiti TC", 16pt,weight: "bold")[#align(center)[学位论文使用授权书]]
    text(font:"簡宋", 15pt)[本人完全了解武汉理工大学有关保留、使用学位论文的规定，即学校有权保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权武汉理工大学可以将本学位论文的全部内容编入有关数据库进行检索，可以采用影印、缩印或其他复制手段保存或汇编本学位论文。同时授权经武汉理工大学认可的国家有关机构或论文数据库使用或收录本学位论文，并向社会公众提供信息服务。]
    v(0pt)
    text(font:"簡宋", 12pt)[(保密的论文在解密后应遵守此规定)]

    v(4em)
    grid(
      columns: (3em, auto, 40pt, auto,40pt,auto),
      [],
      [研究生 (签名):],[],[导师签名:],[],
      text("时间: "+str(year)+"年"+str(month)+"月"+str(day)+"日"),
    )


    if(signature != ""){
      place(top+left, dx: 29%, dy: 25%, image("../"+signature, width: 100pt))
      place(top+left, dx: 29%, dy: 68%, image("../"+signature, width: 100pt))
    }

    pagebreak()
  }
  
  let abstractpage={
    set page(numbering: "I")
    counter(page).update(1)

    align(center)[
      #heading(outlined: true, level: 1, numbering:none, [摘要])]
      v(16pt,weak: false)
      set par(justify: true)
      [#h(2em) #abstract-zh]
  
    align(center)[
      #heading(outlined: abstract-en-outlined, level: 1, numbering: none, [Abstract])]
      v(16pt,weak: false)
      set par(justify: true)
      [#abstract-en]
  }

  let contentspage={
    set page(numbering: "I")
    show outline: set heading(level: 1, outlined: true)
    heading(level: 1, numbering: none)[目录]
    v(16pt,weak: false)
    outline(depth: outline-depth, indent: n => 2em * n, title: none)
  }

  let illustrationspage={
    // set text(font: sunfont, size: 12pt)
    set page(numbering: "I")
    // set par(leading: 12pt)
    heading(level: 1, numbering: none)[插图和附表清单]
    v(16pt,weak: false)
    outline(title:none, target: figure.where(kind:image))
    set par(first-line-indent: 0em)
    outline(title:none, target: figure.where(kind:table))
  }

  let acronymspage={    
    // set text(font: sunfont, size: 12pt)
    set page(numbering: "I")
    // set par(leading: 12pt)
    heading(level: 1, numbering: none)[缩略词表]
    v(16pt,weak: false)
    set text(font: ("Times New Roman", "簡宋"), size: 10.5pt)
    line(length: 100%); v(-0.5em)
    grid(columns: (20%, 1fr, 30%), align(center)[缩略词], [英文全称], align(center)[中文全称])
    v(-0.5em); line(length: 100%)
    set text(font: ("Times New Roman", "簡宋"), size: 10.5pt)
    context {
        usedAcronyms.final()
            .pairs()
            .filter(x => x.last())
            .map(pair => pair.first())
            .sorted()
            .map(key => grid(
                columns: (20%, 1fr, 30%),
                align(center)[#eval(acronyms.at(key).at(0), mode: "markup")], 
                eval(acronyms.at(key).at(1), mode: "markup"), 
                align(center)[#eval(acronyms.at(key).at(2), mode: "markup")],
                )
            )
            .join()
    }
    line(length: 100%)
  }

  let acknowledgementpage = [
    = 致谢
    #acknowledgement
  ]

  let authorpage = [
    = 个人简介
    #author-introduction
  ]

  let appendixpage=[
    = 附录
    #appendix
    #heading(level: 6, numbering: none, outlined: false)[]
  ]


  let bodyconf() = {
    set par(justify: true)
    set page(
      numbering: "1",
      number-align: center,
      header:[
        #set text(9pt, font:("Times New Roman", "簡宋"))
        #text("中国农业大学"+kind+"学位论文")
        #h(1fr)
        #context {
            let eloc = query(selector(heading).after(here())).at(0).location()
            query(selector(heading.where(level:1)).before(eloc)).last().body.text
        }
        #v(-3.8pt)
        #line(length: 100%, stroke: 3pt)
        #v(-8pt)
        #line(length: 100%, stroke: 0.5pt)
      ],
      header-ascent: 10%,
    )

    show heading: it => {
      let levels = counter(heading).at(it.location())
      if it.level == 1 {
        if levels.at(0) != 1 {
          colbreak(weak:false)
        }
        block(width:100%, breakable: false, spacing: 0em)[
          #set align(center)
          #v(16pt,weak: false)
          #text(font: ("Times New Roman", "簡宋"), weight: "bold", 16pt)[#it.body]
          #v(16pt,weak: false)
        ]
      } else if it.level == 2 {
        block(breakable: false, spacing: 0em)[
          #v(14pt, weak: false)
          #text(font: ("簡宋"), 14pt, weight: "regular")[#it]
          #v(14pt, weak: false)
        ]
      } else if it.level == 3 {
        block(breakable: false, spacing: 0em)[
          #v(24pt, weak: false)
          #text(font: ("Times New Roman","SimHei"), 12pt, weight: "regular")[#it]
          #v(12pt, weak: false)
        ]
      }
      par()[#text(size:0.0em)[#h(0em)]]
    }

    let frame(stroke) = (x, y) => (
      left: none,
      right: none,
      top: if y < 2 { stroke } else { 0pt },
      bottom: stroke,
    )
    set table(stroke: frame(1pt))
    set table.header(repeat: true)

    show figure: set block(breakable: true)
    set figure.caption(separator: [#h(0.5em)])
    show figure.where(supplement: [表]): set figure.caption(position: top)
    // show ref.where(form: "normal"): it => {
    //   it
    //   h(-0.2em)
    //   if it.target == bibliography {
    //     h(0.2em)
    //   }
    // }
    show figure.caption: set text(font:("Times New Roman","簡宋"), 10.5pt)
    show figure.where(kind: image): set figure(
      numbering: i=> numbering("1-1", ..counter(heading.where(level: 1)).get(), i)
    )
    show figure.where(kind: table): set figure(
      numbering: i=> numbering("1-1", ..counter(heading.where(level: 1)).get(), i)
    )
    show heading.where(level: 1): it =>{
      counter(figure.where(kind: table)).update(0)
      counter(figure.where(kind: image)).update(0)
      it
    }
    show figure.where(kind: image): it => {
      set text(font:("Times New Roman","簡宋"), 10.5pt)
      it
      v(-4pt)
      par()[#text(size:0.0em)[#h(0em)]]
    }
    show figure.where(kind: table): it => {
      set text(font:("Times New Roman","簡宋"), 10.5pt)
      it
      v(-1em)
      par()[#text(size:0.0em)[#h(0em)]]
    }

    show list:it =>{
      it
      v(-1em)
      par()[#text(size:0.0em)[#h(0em)]]
    }

    show enum:it =>{
      it
      v(-1em)
      par()[#text(size:0.0em)[#h(0em)]]
    }

    show math.equation.where(block:true):it =>{
      it
      v(-1em)
      par()[#text(size:0.0em)[#h(0em)]]
    }

    // show: codly-init.with()
    show raw.where(block: true): set par(justify: false)
    show raw.where(block:true):it =>{
      it
      v(-4pt)
      par()[#text(size:0.0em)[#h(0em)]]
    }
    // codly(
    //   zebra-color: rgb("#FAFAFA"),
    //   stroke-width: 2pt,
    //   fill: rgb("#FAFAFA"),
    //   display-icon: false,
    //   padding: 0.5em,
    //   display-name: false,
    // )
    [
      #body
      #acknowledgementpage
      #appendixpage
      #authorpage
    ]
    // disable-codly()
  }

  [
    #titlepage1
    #titlepage2
    #statementpage
    #abstractpage
    #contentspage
    #illustrationspage
    #acronymspage
    #show: body => bodyconf()
  ]

}

#let l(it) = align(left)[#it]
#let u(it) = underline(offset: 5pt)[#it]
#let legend(it) = block(breakable: false, above: 8pt, inset:(x:2em))[
  #set text(size: 9pt)
  #set par(first-line-indent: 2em, leading:1em)
  #align(left)[#it]
  #par()[#text(size:0.0em)[#h(0em)]]
]
#let loadcsv(csvFilePath, columns:(), ..args) = table(
    columns: columns,
    ..csv("../template/csvdata.csv").flatten(),
  )


}