#import "@preview/codelst:2.0.1":sourcecode
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/tablex:0.0.9": tablex, hlinex, vlinex,
#import "@preview/a2c-nums:0.0.1": int-to-cn-num, int-to-cn-simple-num

#let project(
  kind:"硕士",
  title:"武汉理工大学论文模版",
  abstract-en: [],
  abstract-zh: [],
  title-en:[],
  title-zh:[],
  authors: [],
  teacher: (姓名: "", 职称: "", 学校: "", 单位: "", 邮编: ""),
  co-teacher: (姓名: "", 职称: "", 学校: "", 单位: "", 邮编: ""),
  degree-level: "",
  major: [],
  degree:[],
  submission-date: "",
  defense_date: "",
  defense_chair:[],
  degree_level:[],
  defense_committee_members: "",
  field: [],
  degree_awarding_date:[],
  college: [],
  signature: "",
  classification:[],
  UDC: [],
  security:[],
  acknowledgement: [],
  author_introduction: [],
  appendix:[],
  student_id:[],
  year:int,
  month:int,
  day:int,
  outline-depth: 3,
  draft:true,
  blind-review: false,
  abstract-en-outlined: true,
  logo:"./image.png",
  ref-path: "",
  submission_date:[],
  ref-style:"emboj",
  acro-path: "",
  reviewers:[],
  body

)= {
  if(blind-review){
    authors = hide[#authors]
    teacher = hide[#teacher]
    major = hide[major]
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

  set text(font: ("Times New Roman", "SimSun"), size: 12pt, hyphenate: false)


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
      #text(font: ("Times New Roman", "SimHei"), weight: "bold", 16pt)[#it.body]
      #v(6pt,weak: false)
    ]
  ]

  let titlepage = {

    let justify(s) = {
      if type(s) == content and s.has("text") { s = s.text }
      assert(type(s) == type("string"))
      s.clusters().join(h(1fr))
    }

    set text(12pt)
    table(
      columns: (38pt, 1em, 1fr, 50pt, 1em, auto), 
      rows:(15.6pt, 15.6pt), 
      stroke:0pt+white,
      align: left+horizon,
      inset:0pt,
      justify[分类号], [:], [#classification], 
      justify[密级],   [:], [#security], 
      justify[UDC],   [:], [],
      justify[学校代码] , [:] , [10497]
    )

    v(pt)
align(center, box(image(logo, fit: "stretch", width: 60%)))
  align(center)[#text(18pt, weight: 700, "学位论文")]


  v(40pt)
  let table_underline(content) = [
    #set text(14pt, baseline: 5pt)
    #content
    #v(-0.5em)
    #line(length: 100%, stroke: 1pt)
  ]

  // 信息表格
  align(center)[
    #set text(14pt)
    #table(
      columns: (150pt, 2pt, 40%),
      rows: 27.3pt,
      align: center + horizon,
      stroke: none,
      justify[题目], [:], table_underline[#title-zh],
      justify[英文题目],[:], table_underline[#title-en],
      justify[合作指导教师],[:],table_underline[#co-teacher],
      justify[论文作者], [:], table_underline[#authors],  
      justify[指导教师], [:], table_underline[#teacher],
    // 副指导教师
      justify[副指导教师], [:], table_underline[#co-teacher],
    // 申请学位级别、学科专业名称
      justify[申请学位级别], [:], table_underline[#degree_level],
      justify[学科专业名称], [:], table_underline[#major],
    // 论文提交日期、答辩日期
      justify[论文提交日期], [:], table_underline[#submission_date],
      justify[论文答辩日期], [:], table_underline[#defense_date],
    // 学位授予单位（已填）、学位授予日期
      justify[学位授予单位], [:], table_underline[武汉理工大学],
      justify[学位授予日期], [:], table_underline[#degree_awarding_date],
    // 答辩委员会主席、评阅人
      justify[答辩委员会主席], [:], table_underline[#defense_chair],
      justify[评 阅 人], [:], table_underline[#reviewers],
    // 答辩委员会委员
      justify[答辩委员会委员], [:], table_underline[#defense_committee_members]
      )
  ]
    v(75pt)
    align(center, int-to-cn-simple-num(str(year)).+"年"+int-to-cn-num(month)+"月")
    pagebreak()
  }
  


}