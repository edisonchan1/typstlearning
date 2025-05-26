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
    margin: (left: 31.5mm, right: 31.5mm, top: 30mm, bottom: 25mm),
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



  v(60pt)
  [
 #set text(15pt,font:"kaiti TC" ,weight:"black")
    #align(center)[
    #grid(
      columns: (100pt, 20pt, 50%),
      rows: 30pt,
      align:  horizon,
      stroke: none,
      justify[培养单位], [:], [#authors],
      justify[学科专业],[:], [#teacher],
      justify[论文作者], [:], [#degree],
      justify[指导老师], [:], [#major],
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
      columns: (30pt,45pt, 90pt, 70pt,55pt, 90pt,auto), 
      rows:(20pt, 15.6pt), 
      stroke:none,
      inset:1pt,[],
      justify[分类号],  align(center)[#table.cell([10497]+place(dy:1pt,line(stroke: 0.5pt,length: 100%)))], [],
      justify[密级], align(center)[#table.cell([10497]+place(dy:1pt,line(stroke: 0.5pt,length: 100%)))],[],[],
      [UDC],align(center)[#table.cell([#UDC]+place(dy:1pt,line(stroke: 1pt,length: 100%)))], [],
      justify[学校代码], align(center)[#table.cell([10497]+place(dy:1pt,line(stroke: 1pt,length: 100%)))],[]
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
        [],[姓名],[],[#teacher],grid.hline(start:3 ,end:4),[],align(right)[职称],[],[],grid.hline(y:1,start:7,end:8 ),[],[学位],[],[],grid.hline(start: 11,end:12),[],
        align(left)[单位],[],[],grid.hline(y:2,start: 3,end:8),[],[],[],[],[],[邮编],grid.hline(start: 11,end:12)
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
      [论文提交日期],[],[],grid.hline(start: 2,end:3),[],[论文答辩日期],grid.hline(start: 6,end:8),[],[],
      [学位授予单位],[],align(center)[#text(font:"Kaiti SC","武汉理工大学",)],grid.hline(start: 2,end:3),[],[学位授予日期],grid.hline(start: 6,end:8),[],[],
      [答辩委员会主席],grid.hline(start: 2,end:3),[],align(center)[#text(font:"kaiti TC","XXX教授（研究员）")],
      [],justify[评审人],grid.hline(start: 6,end:9),[],[],
    )]
 v(-10pt)
  align(left)[
    #set text(14pt)
    #grid(
      columns: (100pt,20pt,300pt),
      rows :28pt,
      [答辩委员会委员],[],align(center)[#text(font:"Kaiti SC",[×××教授（研究员）、×××教授])],[],[],align(center)[#text(font:"Kaiti SC",[×××教授、×××教授（副研究员）])])]

  
    v(40pt)
    align(center, int-to-cn-simple-num(str(year))+"年"+int-to-cn-num(month)+"月")
    pagebreak()

  }
  let statementpage = {

    text(font:"Heiti TC", 18pt,weight: "bold")[#align(center)[研究生学位论文的独创性声明]]
    
  [
  #par(
  first-line-indent: 2em,
  leading: 14pt,
  spacing: 0.65em,
  justify: true,
  [#text([本人声明，所呈交的论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得武汉理工大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。],14pt)]
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
      
      [#set text(12.5pt)
      #set par(justify: true,
      leading: 8pt)
      #h(2em) #abstract-zh]

      v(-2pt)
      [#set text(12.5pt,weight: "bold",)
      #set par(justify: true,first-line-indent: 0em)
      关键词:#keywords
      ]
  
    align(center)[
      #heading(outlined: abstract-en-outlined, level: 1, numbering: none, [Abstract])]
      v(16pt,weak: false)


      [#set par(justify: true)
      #set text(12.5pt)
      #h(2em)
      #abstract-en]
      [#set text(12.5pt,weight: "bold",)
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
          #v(28.346pt,weak: false)
          #text(font: ("Times New Roman", "簡宋"), weight: "bold", 18pt)[#it.body]
          #v(34pt,weak: false)
        ]
      } else if it.level == 2 {
        block(breakable: false, spacing: 0em)[
          #v(14pt, weak: false)
          #text(font: ("Heiti TC"), 16pt, weight: "bold")[#it]
          #v(18pt, weak: false)
        ]
      } else if it.level == 3 {
        block(breakable: false, spacing: 0em)[
          #v(12pt, weak: false)
          #text(font: ("heiti TC"), 14pt, weight: "bold")[#it]
          #v(12pt, weak: false)
        ]
      }
       else if it.level == 4 {
        block(breakable: false, spacing: 0em)[
          #v(9pt, weak: false)
          #text(font: ("heiti TC"), 12pt, weight: "bold")[#it]
          #v(6pt, weak: false)
        ]
      }
      par(leading: 2pt)[#text(size:0.0em)[#h(0em)]]
      v(2pt)
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
      #authorpage
      #appendixpage

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
