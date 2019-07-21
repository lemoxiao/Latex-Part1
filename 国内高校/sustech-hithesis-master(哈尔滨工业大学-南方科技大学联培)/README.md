# hithesis-sustech
# 哈尔滨工业大学-南方科技大学联培LaTeX论文模板

## 致谢

感谢这位博士大佬[@Dustin](https://github.com/dustincys)的辛勤劳动，省去了我们不少事。本仓库的主要目的说为哈工大与南方科技大学联培的硕博士们提供一个能够快速使用的模板。

原仓库地址：<a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/dustincys/hithesis" property="cc:attributionName" rel="cc:attributionURL">https://github.com/dustincys/hithesis</a> 


## 使用 （暂时只试验了windows的）

- windows下编译pdf的命令：
 
  		lualatex hithesis.ins
		xelatex main.tex
		bibtex main
		xelatex main.tex
		xelatex main.tex
		splitindex main -s hithesis.ist  # 自动生成索引，原作者这里多了两条 -
		xelatex main.tex

- 由于大多数人只是需要能够编译成功即可，对内部的代码的理解需求没那么高，因此，我直接将所有命令封装在一个 **build.bat** 批处理文件进行封装。**使用时直接双击 build.bat 即可**
- 编译过程中出现错误，根据提出错误进行修改。出现错误停止后，可以回车提过，也可以选择直接关闭命令窗口
- 在使用该模板之前直接请直接安装 [完整版TexLive](http://mirror.las.iastate.edu/tex-archive/systems/texlive/Images/)，具体安装教程请自行百度。不装TexLive的后果就是，报错报到吐，各种打死我都不知道哪里错了的报错！！！ 

## 模板的基本使用
- 封面信息文件：
 
		front/cover.tex % 根据提示修改即可
- 图片文件：
 
		figures/  % 所有图片文件都需放在该文件夹内，内部可再增设子文件夹
- 主题文件
  
		body/xxxx.tex % body文件夹内放主体内容文件，可放多个不同的tex文件

		在main.tex中添加 \include{body/xxxx}即可。 


- 章节标题对应命令
  
   
		\chapter{中文标题}[title in English] 章标题 -> 第x章
		\section{中文标题}[title in English] 节标题 -> 1.1 xxx
		\subsection{中文标题}[title in English] 条标题 -> 1.1.1 xxx
		\subsubsection{中文标题}[title in English] 款标题 -> 1.1.1.1 xxx

- 参考文献
 
		reference.bib % 论文所有的参考文献的bibtex都放在这个文件里

## 修改

- 该版本主要是为南方科技大学-哈尔滨工业大学联培的硕博士们提供。
- *《学位论文原创性声明和使用权限》* 与哈工大本部的声明存在细微差别，在该代码里做了微调。


## 论文格式注意点（模板不能帮你设置的格式）

- 硕士论文不需要英文目录，只有博士论文需要英文目录
- **表名中不允许使用标点符号，表名后不加标点，表题置于表上。**
- 表题置于表上，硕士学位论文只用中文，博士学位论文用中、英两种文字居中排写，中文在上。
- 一定要用 **三线表** 可以用这个网站在线生成表格的latex代码：[Latex Table Generator](http://www.tablesgenerator.com/latex_tables)

## 关于模板使用的一点小建议

1. 写毕业论文时，开始写的时候可以不用这个模板。自己先建一些临时的tex文件打个初稿，然后等各章节全部写完了最后再汇总到这个模板里，这样就方便很多了。
2. 后期会新建一个仓库，贡献一下自己做的比较简单版本的各章节的一个临时tex模板。

## 问题或建议
有什么关于模板的问题或者建议就直接在issue上提出来，大家一起讨论吧。小白一枚，也不是很懂这个高大上的东西。
