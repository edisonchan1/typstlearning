#import "demowutben.typ":*


#show:project.with(
  kind:"硕士",
  title-zh: [论文题目],
  title-en: [ ],
  authors: [ ],
  teacher: [ ],
  college: [],
  degree: [],
  major: [],
  field: [],
  signature: "",
  classification: [],
  year: 2025,
  month: 5,
  day: 21,
  outline-depth: 3,
  security: [公开],
  abstract-zh: [论文第一页为中文摘要，800～1000字，小四号宋体字，行间距为固定值20磅。内容应包括工作目的、研究方法、成果和结论等。要突出本论文的新见解，语言力求精炼。为了便于文献检索，应在摘要下方另起一行注明论文的关键词。
  ],
  abstract-en:[与中文摘要同，Times new roman字体，小四号字体，行间距为固定值20磅。],
  acknowledgement: [
    #text([致谢对象限于在学术方面对论文的完成有较重要帮助的团体和人士（限200字）。],font: "Kaiti TC")

    #heading(level: 6, numbering: none, outlined: false)[]
  ],
  author-introduction: [
    #heading(level: 2, outlined: false, numbering: none)[基本介绍]
    XXX, X, XXXX年X月出生, 中共党员, 籍贯XX省XX市
    #heading(level: 2, outlined: false, numbering: none)[教育经历]
    XXXX年X月-XXXX年X月, 中国农业大学XX学院, XX专业, X学学士

    XXXX年X月-XXXX年X月, 中国农业大学XX学院, XX学位, X学硕士

    #heading(level: 2, outlined: false, numbering: none)[研究生期间参加的会议]
    XXXX年X月, 中国XXXX学会, 全国第X届XXXX研讨会 (浙江杭州)

    XXXX年X月, XX实验室, XXXXX会议 (北京)
    #heading(level: 2, outlined: false, numbering: none)[研究生期间主持/参与的科研项目]
    XXXX-XXXX, 中国农业大学研究生自主创新重点项目, 项目负责人, 《XXXX》
    #heading(level: 2, outlined: false, numbering: none)[研究生期间获得的奖励和荣誉]
    XXXX年, 中国农业大学三好学生

    XXXX年, 中国农业大学博士X等奖学金
  ],
  UDC: 111,
  ref-path: "../template/ref.bib", // 需要手动添加该文件
  ref-style: "emboj", 
  acro-path: ".acronyms.json", // 需要手动添加该文件
  draft: true,
  blind-review: false

  
)
= 第一章 说明文档

== Typst的模板说明
该文件提供一个案例模板，在实际的论文撰写过程中，可以直接替换这里的文字，并按照`README.md`里的说明，生成你论文的pdf文件。
