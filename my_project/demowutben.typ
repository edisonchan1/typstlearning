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
  Times:[],
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
  keywords:[],
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
      #text(font: ("Times New Roman", "簡宋"), weight: "bold", 15pt)[#it.body]
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

    v(20pt)
  align(center)[#text(14pt, weight: 70, "(申请"+major  +"学硕士学位论文)")]
  
  v(60pt)
  [#set text(26pt,font:"Heiti TC",weight: "bold")
     #align(center)[
      #table(
      columns: (auto,150pt,auto),
      stroke: none,
      [],
      justify[#title-zh],[],
      )
    ]]


  let table_underline(content) = [
    #set text(15pt, baseline: 5pt)
    #content
    #v(1em)
  ]
  v(60pt)
  [
 #set text(15pt,font:"kaiti TC" ,weight:"black")
    #align(center)[
    #grid(
      columns: (100pt, 20pt, 50%),
      rows: 30pt,
      align:  horizon,
      stroke: none,
      justify[培养单位], [:], table_underline[#authors],
      justify[学科专业],[:], table_underline[#teacher],
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

    
 


[   #set text(font: "Kaiti TC",weight: "black",13pt)
    #table(
      columns: (45pt, 1em, 50pt, 1fr,55pt, 1em, 50pt), 
      rows:(20pt, 15.6pt), 
      stroke:none,
      inset:1pt,
      justify[分类号], [], [#classification],table.hline(y:1,start: 2,end:3  ), [],
      justify[密级], [], [#classification],table.hline(y:1,start: 6,end:7  ),
      [UDC],[], [#UDC],table.hline(start: 2,end:3  ), [],
      justify[学校代码], [],[10497],table.hline(start: 6,end:7  )
    )]
v(20pt)


    align(center, box(image(logo, fit: "stretch", width:70%)))

    v(-20pt)
    [#set text(26pt,weight: "bold")
     #align(center)[
      #table(
      columns: (auto,220pt,auto),
      stroke: none,
      [],
      justify[学位论文],[],
      )
    ]]

  [
    #set text(14pt)
    #grid(
      columns: (60pt, 30pt, 380pt),
      rows: 28pt,
      align:  center+horizon,
      stroke: none,
      justify[题目], [], [#title-zh],grid.hline(start: 2,end:3),
      justify[英文题目],[], [#title-en],grid.hline(start: 2,end:3),
      justify[论文作者], [],[#degree],grid.hline(start: 2,end:3),
      justify[指导老师],
      [#grid(
        columns:(30pt,30pt,15pt,75pt,10pt,30pt,15pt,75pt,10pt,30pt,15pt,75pt),
        rows:28pt,
        stroke: none,
        [],[姓名],[],[#teacher],grid.hline(start:3 ,end:4),[],align(right)[职称],[],[],grid.hline(start:7,end:8 ),[],[学位],[],[],grid.hline(start: 11,end:12),[],
        align(left)[单位],[],[],grid.hline(start: 3,end:8),[],[],[],[],[],[邮编],grid.hline(start: 11,end:12)
      )],[],
 
    )
  ]
  v(18pt)
    align(left)[
    #set text(14pt)
    #grid(
      columns: (75pt,15pt,380pt),
      rows: 28pt,
      [副指导教师],[#grid(
        columns:(15pt,30pt,15pt,75pt,10pt,30pt,15pt,75pt,10pt,30pt,15pt,75pt),
        rows:28pt,
        stroke: none,
        [],[姓名],[],[#teacher],grid.hline(start:3 ,end:4),[],align(right)[职称],[],[],grid.hline(start:7,end:8 ),[],[学位],[],[],grid.hline(start: 11,end:12),[],
        align(left)[单位],[],[],grid.hline(start: 3,end:8),[],[],[],[],[],[邮编],grid.hline(start: 11,end:12)
      
      )]
    )
    
  ]
  v(18pt)
  align(left)[
    #set text(14pt)
    #grid(
      columns: (100pt,20pt,135pt,10pt,90pt,20pt,95pt),
      rows:28pt,
      stroke: none,
      [申请学位级别],[],[],grid.hline(start: 2,end:3),[],[学科专业名称],[],[],grid.hline(start: 6,end:7),
      [论文提交日期],[],[],grid.hline(start: 2,end:3),[],[论文答辩日期],[],[],
      [学位授予单位],[],align(center)[#text(font:"Kaiti SC","武汉理工大学",)],grid.hline(start: 2,end:3),[],[学位授予日期],[],[],
      [答辩委员会主席],[],align(center)[#text(font:"kaiti TC","XXX教授（研究员）")],
      [],justify[评审人],[],[],
      [答辩委员会委员],
    )]

  
    v(40pt)
    align(center, int-to-cn-simple-num(str(year))+"年"+int-to-cn-num(month)+"月")
    pagebreak()

  }
  let statementpage = {

    text(font:"Heiti TC", 18pt,weight: "bold")[#align(center)[研究生学位论文的独创性声明]]
    
  [#set text(font:"簡宋",14pt)
  #par(
  first-line-indent: 2em,
  leading: 14pt,
  spacing: 0.65em,
  justify: true,
  [本人声明，所呈交的论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得武汉理工大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。]
)]
  
    v(0pt)
    grid(
      columns: (3em, auto, 150pt, auto),
      [],
      text("签名:",14pt),
      [],
      text("日期:",14pt),
    )
    v(4em)


    text(font:"Heiti TC", 18pt,weight: "bold")[#align(center)[学位论文使用授权书]]


    [#set text(font:"簡宋",14pt)
  #par(
  first-line-indent: 2em,
  leading: 14pt,
  spacing: 0.65em,
  justify: true,
  [本人完全了解武汉理工大学有关保留、使用学位论文的规定，即学校有权保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权武汉理工大学可以将本学位论文的全部内容编入有关数据库进行检索，可以采用影印、缩印或其他复制手段保存或汇编本学位论文。同时授权经武汉理工大学认可的国家有关机构或论文数据库使用或收录本学位论文，并向社会公众提供信息服务。]
)]
    text(font:"簡宋", 14pt)[(保密的论文在解密后应遵守此规定)]

    v(4em)
    grid(
      columns: (2em, auto, 60pt, auto,40pt,auto),
      [],
      text("研究生（签名):",14pt),[],text("导师（签名）:",14pt),[],
      text("日期:"+[#Times]),
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
      set text(12pt)
      set par(justify: true,
      leading: 8pt)
      [#h(2em) #abstract-zh]

      v(-2pt)
      [#set text(12pt,weight: "bold",)
      #set par(justify: true,first-line-indent:0em,)
      关键词:#keywords
      ]
  
    align(center)[
      #heading(outlined: abstract-en-outlined, level: 1, numbering: none, [Abstract])]
      v(16pt,weak: false)
      set par(justify: true)
      [#abstract-en]
      [#set text(12pt,weight: "bold",)
      #set par(justify: true,first-line-indent:0em)
      Key Words：#keywords]
  }
  

  let contentspage={
    set page(numbering: "I")
    show outline: set heading(level: 1, outlined: true)
    heading(level: 1, numbering: none,outlined: false)[目录]
    v(16pt,weak: false)
    outline(depth: 3, indent: n => 2em * n, title: none,)
  }




  let acknowledgementpage = [
    = 致谢
    #acknowledgement
  ]

  let authorpage = [
    = 科研成果目录
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
        #align(center)[
        #text("武汉理工大学"+kind+"学位论文")]
        #v(-3pt)
        #line(length: 100%, stroke: 1pt)
        #v(-8pt)
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
          #v(15pt,weak: false)
          #text(font: ("Times New Roman", "簡宋"), weight: "bold", 16pt)[#it.body]
          #v(15pt,weak: false)
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