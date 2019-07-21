% !TEX encoding = System
% !Mode:: "TeX:UTF-8"
%%
%% This file `CUGthesis.cls', which is written by Yang Bo based on `CASthesis.cls',
%% is the configuration file of the CUGthesis package with LaTeX2e.
%%
%% Author: Yang Bo, Institute of Geophysics & Geomatics, China Univ. of Geoscience, Wuhan, China.
%% Version: 0.1
%% Date: 2011/04/23
%% Copyright 2011-2015
%%2013.6     YanngYuancong  Institute of Institute of Mathematics and Physics, China Univ. of Geoscience, Wuhan, China. Modifide Form  Yang Bo‘s  CUGthesis.cls Add Some extra packages （lsting，ccmap etc. ）and new  features  such as shline  footnote  symbol , fix a bug that if  choose twoside mode,  the evensidemargin and  oddsidemargin have  opposite length
%% Special thanks to Dr. Linyun Wu and Dr. Yinnian Wu
%%
%% This file was generated from file(s) of the CUGthesis package project.
%% ----------------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Config/CUGthesis}
  [2011/04/23 v0.1 CUGthesis document class]
%%本科选项（默认为本科）
%%
\newif\ifisundergraduate\isundergraduatetrue
\DeclareOption{undergraduate}{\isundergraduatetrue}
\DeclareOption{ohno}{\isundergraduatefalse}
%%基金信息选项
\newif\ifCUGT@fundinfo \CUGT@fundinfotrue
\DeclareOption{nofundinfo}{\CUGT@fundinfofalse}
%%排版引擎选项
\newif\ifCUGT@dvips \CUGT@dvipsfalse
\DeclareOption{dvips}{\CUGT@dvipstrue}
\DeclareOption{dvipdfm}{\CUGT@dvipsfalse}
\DeclareOption{pdftex}{\CUGT@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
%%加载ctexbook文档类
\LoadClass[cs4size,a4paper,fancyhdr,fntef,punct,amstex]{ctexbook}[2005/11/25]
\CTEXoptions[today=small]  %执行\today时显示格式为2013年6月2日
\RequirePackage{etex}  %使用etex解除tex的256限制   http://ctan.org/pkg/etex/
%%定义页面参数（个人更倾向于用毫米表示） A4标准
%\RequirePackage[paperheight=270mm,paperwidth=195mm,top=25mm,bottom=25mm,left=24mm,right=24mm,headsep=10pt]{geometry}
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%一下修正奇偶页页边距反了的问题 2013.6.1
%修正奇偶页页边距反了的问题,问题描述：奇数页的页边距为左窄右宽，而偶数页却是左宽右窄，正常装订时需要的是奇数页左宽又窄，偶数页左窄右宽；解决方法，调换原来的奇偶页页边距	http://stackoverflow.com/questions/2565755/latex-book-class-twosided-document-with-wrong-margins
%注释以下四行观察结果
\let\tmp\oddsidemargin                          %参考c语言的经典问题:如何调换两个参数的值
\let\oddsidemargin\evensidemargin
\let\evensidemargin\tmp
\reversemarginpar
%%%%%%%%%%%%%%%%以上修正奇偶页页边距反响问题
%%加载宏包
%% check pdfTeX mode
\RequirePackage{ifpdf,ifxetex}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,txfonts}
\RequirePackage{Package/vector} %向量宏包，各种向量 印刷体向量 \bvec{} 单位向量 \buvec 等，具体查看宏包说明 http://mirror.bjtu.edu.cn/CTAN/macros/latex/contrib/vector/vector.pdf
\RequirePackage{yhmath}                          %更好的自适应数学符号 (比如 弧AB ,\wideparen{AB} ) ftp://tug.ctan.org/pub/tex-archive/macros/latex/contrib/yhmath/yhmath.pdf
%% graphics packages
\RequirePackage{graphicx}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage{subfigure}
%% sort and compress citations
\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage{hypernat}
%% caption packages
\RequirePackage{caption2}
%% enumitem package
\RequirePackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\RequirePackage{ccmap} %使生成的pdf文件内容可被正常复制
\RequirePackage{times}  %Times New Roman 英文字体
%%以下为非必需宏包，可删减%%%

\RequirePackage{CJK,CJKnumb}
\RequirePackage{textcomp}  %摄氏度之类的符号
\RequirePackage{booktabs}

%\RequirePackage[framed,numbered,autolinebreaks,useliterate]{Package/Mcode}
\RequirePackage{Package/Pagenote}
\RequirePackage{Package/Endnotes}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%脚注%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,bbding}% \RihtHand 等符号
\RequirePackage[%perpage, %为每页脚注单独排序
		stable,	 %避免章节标题中的脚注随同章节标题出现在目录或页眉之中
		multiple, %给正文中两个以上的并排脚注标号之间加上分隔逗号
		symbol*	  %将脚注的数字序号改为 * 号等不同的符号
		]{footmisc}
\DefineFNsymbols{lamport-mystyle}{\SnowflakeChevron \OrnamentDiamondSolid  \FourClowerOpen \FourStarOpen \SixFlowerPetalDotted \JackStarBold \NibSolidLeft \Cross \CrossClowerTips \CrossMaltese \Asterisk\FiveFlowerPetal \FiveStar  \AsteriskCenterOpen \AsteriskRoundedEnds  \SixFlowerPetalRemoved \SixFlowerRemovedOpenPetal\EightAsterisk \EightFlowerPetalRemoved \Snowflake  \S * {**} \textparagraph \textdagger \textdaggerdbl \PencilLeft }
\setfnsymbol{lamport-mystyle}
%if Specified a symbol which must be used in math enviroment ,then chang "symbol*" to "symbol" and use the define \DefineFNsymbols{lamport}[math]{....symbol....}  ---\DefineFNsymbols{lamport}[math]{*\dagger\ddagger\S\P\|{**}{\dagger\dagger}{\ddagger\ddagger}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%脚注计数器修复
%不让整个文章中出现相同的脚注     http://www.tex.ac.uk/cgi-bin/texfaq2html?label=run-fn-nos
%不使用下面这两行，则每当到新章节，脚注计数器便会重新变为0，这样章节中会出现相同的脚注符号
\RequirePackage{chngcntr}
\counterwithout*{footnote}{chapter}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%脚注%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage{multirow}    %跨行宏包

%%以下为非必需宏包，可删减%%%
\RequirePackage{diagbox}    %制作表头
\RequirePackage[figuresright]{rotating}
\RequirePackage{tagging}    %条件编译

%%以上为非必需宏包，可删减%%%


%% packages and settings depend on PDF mode
\ifxetex
  \RequirePackage[xetex]{hyperref}
  \DeclareGraphicsExtensions{.pdf,.png,.jpg}
\else
  \ifpdf   % We're running pdfTeX in PDF mode
    \RequirePackage[pdftex]{hyperref}
    \RequirePackage{CJK,CJKnumb}
    \DeclareGraphicsExtensions{.pdf,.png,.jpg}
  \else    % We're not running pdfTeX, or running pdfTeX in DVI mode
    \ifCUGT@dvips
      \RequirePackage[dvips]{hyperref}
      \RequirePackage{psfrag}
      \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
    \else
      \RequirePackage[dvipdfm]{hyperref}
    \fi
    \DeclareGraphicsExtensions{.eps,.ps}
  \fi
\fi
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=blue,%
               citecolor=blue,%
              plainpages=false,%
            pdfstartview=FitH}

%%加载参数文件
\AtEndOfPackage{\makeatletter\input{Config/CUGthesis.cfg}\makeatother}
%%自定义命令
%以下为横纵粗线定义
\RequirePackage{array}                %定义横粗线\while 和纵粗线I
\newcolumntype{I}{!{\vrule width 2pt}}
\newlength\savewidth
\newcommand\shline{\noalign{\global\savewidth\arrayrulewidth
                            \global\arrayrulewidth 2pt}%
                   \hline
                   \noalign{\global\arrayrulewidth\savewidth}}
%以上为横纵粗线定义
%%图表
\renewcommand{\captionlabeldelim}{} %定义如  "图(表)2: 示例" 中的间隔符号,如 ":" ,这里定义为空
\renewcommand{\captionlabelsep}{\hspace{1em}} %定义图表编号与标题间的间隔距离
\renewcommand{\captionlabelfont}{\songti\zihao{-5}} %定义图表标签的字体
\renewcommand{\captionfont}{\songti\zihao{-5}} %定义图表标题内容的字体
\newcommand{\excaption}{\songti\zihao{-5}}  %定义图表标题附加内容字号字体

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
%\bibliographystyle{plain}      %表示参考文献的格式为plain text ，取消注释后看看英文参考文献与原来的有什么不同
\newcommand\CUGTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\CUGT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\CUGTfiledate{#1}%
  \def\CUGTfileversion{#2}%
  \def\CUGTfileinfo{#3}}%
\expandafter\ifx\csname ver@CUGthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_CUGthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@CUGthesis.cls\endcsname}
\fi
\expandafter\CUGT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\CUGT@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\CUGTunderline{\@ifnextchar[\CUGT@underline\CTEXunderline}
\newcommand\schoolnumber[1]{\def\CUGT@value@schoolnumber{#1}}
\newcommand\studentnumber[1]{\def\CUGT@value@studentnumber{#1}}
\newcommand\classification[1]{\def\CUGT@value@classification{#1}}
\newcommand\confidential[1]{\def\CUGT@value@confidential{#1}}
\newcommand\UDC[1]{\def\CUGT@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\CUGT@value@serialnumber{#1}}
\newcommand\school[1]{\def\CUGT@value@school{#1}}
\newcommand\degree[1]{\def\CUGT@value@degree{#1}}
\renewcommand\title[2][\CUGT@value@title]{%
  \def\CUGT@value@title{#2}
  \def\CUGT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\CUGT@value@author{#1}}
\newcommand\advisorschool[1]{\def\CUGT@value@advisorschool{#1}}
\newcommand\advisorenterprise[1]{\def\CUGT@value@advisorenterprise{#1}}
\newcommand\fund[1]{\def\CUGT@value@fund{#1}}
\newcommand\advisorschoolinstitute[1]{\def\CUGT@value@advisorschoolinstitute{#1}}
\newcommand\advisorenterpriseinstitute[1]{\def\CUGT@value@advisorenterpriseinstitute{#1}}
\newcommand\major[1]{\def\CUGT@value@major{#1}}
\newcommand\submitdatechs[1]{\def\CUGT@value@submitdatechs{#1}}
\newcommand\submitdate[1]{\def\CUGT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\CUGT@value@defenddate{#1}}
\newcommand\institute[1]{\def\CUGT@value@institute{#1}}
\newcommand\chairman[1]{\def\CUGT@value@chairman{#1}}
\newcommand\advisorschooltitles[1]{\def\CUGT@value@advisorschooltitles{#1}}
\newcommand\advisorenterprisetitles[1]{\def\CUGT@value@advisorenterprisetitles{#1}}
\newcommand\reviewerstitles[1]{\def\CUGT@value@reviewerstitles{#1}}
\newcommand\reviewers[1]{\def\CUGT@value@reviewers{#1}}
\newcommand\authorheader[1]{\def\CUGT@value@authorheader{#1}}
%%自定义参考文献上标引用
\newcommand{\ucite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}  % 方法2
%%自定义frontmatter格式
\newif\if@frontmatter\@frontmattertrue
\renewcommand\frontmatter{%
\cleardoublepage
\@frontmattertrue
\@mainmatterfalse
\setcounter{page}{1}
\pagenumbering{Roman}
\pagestyle{plain}{}
\fancyhf{}%
\renewcommand{\headrulewidth}{0pt}
}
%%自定义mainmatter格式
\renewcommand\mainmatter{%
\cleardoublepage
\@frontmatterfalse
\@mainmattertrue
\setcounter{page}{1}
\pagenumbering{arabic}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[LO,RE]{\songti\zihao{-5} \CUGT@value@submitdate}
  \fancyhead[CO]{\songti\zihao{-5} \CUGT@value@school\CUGT@value@degree\CUGT@label@thesis}
  \fancyhead[CE]{\songti\zihao{-5} \CUGT@value@authorheader ：~~ \CUGT@value@titlemark}
  \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
}
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[LO,RE]{\songti\zihao{-5} \CUGT@value@submitdate}
  \fancyhead[CO]{\songti\zihao{-5} \CUGT@value@school\CUGT@value@degree\CUGT@label@thesis}
  \fancyhead[CE]{\songti\zihao{-5} \CUGT@value@authorheader ：~~ \CUGT@value@titlemark}
  \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
%%正文页眉双线
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[0.55\baselineskip]{\headwidth}{0.4pt}}%
\rule[0.7\baselineskip]{\headwidth}{0.4pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}
\makeatother%
}
%%设置目录格式
\setcounter{tocdepth}{3} \setcounter{secnumdepth}{3}
\dottedcontents{chapter}[3.5em]{\songti\zihao{5}}{4em}{0.5pc}
\dottedcontents{section}[5.5em]{\songti\zihao{5}}{3em}{0.5pc}
\dottedcontents{subsection}[6.1em]{\songti\zihao{5}}{1.7em}{0.5pc}
%%定义章节标题格式
\renewcommand\chaptername{第\CJKnumber{\value{chapter}}章}
\renewcommand{\thesection}{\S~\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\hspace{-3ex}\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%定义封面及固定信息页面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%中文封面1
\newcommand\makecover{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5em}
      \heiti\zihao{-1} \CUGT@value@school \CUGT@value@degree\CUGT@label@thesis \\
		\vspace{0.5em}
    \begin{center}
    \includegraphics[width=0.618\textwidth]{CUG_Logo/CUG_Logo.png}
    \end{center}
    \vspace{1.5em}
    \heiti\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
\begin{minipage}{71.8mm}
    \begin{tabular}{r@{\textbf{\zihao{3}{:}}}l}
      \CUGT@label@author~~ & ~~ \CUGT@value@author \\
      \CUGT@label@major ~~ & ~~ \CUGT@value@major  \\
      \CUGT@label@advisorschool ~~ & ~~ \CUGT@value@advisorschool \\
%      \CUGT@label@advisorenterprise ~~ & ~~ \CUGT@value@advisorenterprise &\\

	  \CUGT@label@institute ~~ & ~~ \CUGT@value@institute  \\
    \end{tabular}
\end{minipage}
	\\
	\vspace{2em}
	\songti\zihao{3}
      \CUGT@value@submitdatechs
	%\vspace{1em}	
  \end{center}
}

%%%中文封面2
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}

    \songti\zihao{3}
%      \CUGT@label@schoolnumber~\CUGT@value@schoolnumber
%        \hfill
%      \CUGT@label@studentnumber~\CUGT@value@studentnumber
%    \vskip \stretch{1.8}
%\vspace*{1.5em}
   \ \\
      \heiti\zihao{2} \CUGT@value@school\CUGT@value@degree\CUGT@label@thesis
    \vskip \stretch{0.9}
     \includegraphics[width=0.618\textwidth]{CUG_Logo/CUG_Logo.png}\\
     \vspace{2em}
      \heiti\zihao{3} ~\CUGT@value@title~\\
      \vspace{2em}
    \vskip \stretch{1}
    \begin{flushleft}
    \songti\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.0}%定义表格每行间的行间距
\begin{tabular}{l@{:}rcl@{:}r}
\CUGT@label@author~~&~~\CUGT@value@author &\hspace*{2em}&\CUGT@label@studentnumber~~&~~\CUGT@value@studentnumber\\
\CUGT@label@institute~~&~~\CUGT@value@institute &\hspace*{2em}&\CUGT@label@major~~&~~\CUGT@value@major \\
\CUGT@label@advisorschool~~&~~\CUGT@value@advisorschool &\hspace*{2em}&\CUGT@label@advisorschooltitles~~&~~\CUGT@value@advisorschooltitles \\
% \CUGT@label@advisorenterprise~~&~~\CUGT@value@advisorenterprise &\hspace*{2em}&\CUGT@label@advisorenterprisetitles\CUGT@value@advisorenterprisetitles\\
\CUGT@label@reviewers ~~&~~\CUGT@value@reviewers &\hspace*{2em}&\CUGT@label@reviewerstitles~~&~~\CUGT@value@reviewerstitles\\
\end{tabular}
    \end{flushleft}
	\vskip \stretch{2.9}
	 \ifCUGT@fundinfo
	\songti\zihao{5}
      \CUGT@label@fundhead \CUGT@value@fund \CUGT@label@fundtail
	\vskip \stretch{0.6}
	\fi
	 \vspace{3em}
	\songti\zihao{3}
      \CUGT@value@submitdatechs
	\vspace{1em}	
  \end{center}
}

%%%英文封面
\newcommand\englishtitle[1]{\def\CUGT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\CUGT@value@englishauthor{#1}}
\newcommand\englishadvisorschool[1]{\def\CUGT@value@englishadvisorschool{#1}}
% \newcommand\englishadvisorenterprise[1]{\def\CUGT@value@englishadvisorenterprise{#1}}
\newcommand\englishinstitute[1]{\def\CUGT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\CUGT@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\CUGT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\CUGT@value@englishmajor{#1}}
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
	 \heiti\zihao{2} \CUGT@label@englishstatement \\ \vspace*{1em}
	 \includegraphics[width=0.618\textwidth]{CUG_Logo/CUG_Logo.png}\\
	\vspace{2em}
      \bf\zihao{-2} \CUGT@value@englishtitle
    \vskip \stretch{1.5}
	\normalfont\zihao{4}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.0}
    \begin{tabular}{r@{:}l}         %英文使用一个空格
      \CUGT@label@englishauthor~&~\CUGT@value@englishauthor \\
      \CUGT@label@englishmajor ~ &~\CUGT@value@englishmajor \\
      \CUGT@label@englishadvisorschool~&~\CUGT@value@englishadvisorschool \\
%      \CUGT@label@englishadvisorenterprise~&~\CUGT@value@englishadvisorenterprise \\

    \end{tabular}
    \vskip \stretch{4}
      \normalfont\zihao{-3} \CUGT@label@englishschool \\
    \vskip 5pt
      \normalfont\zihao{-3} \CUGT@label@englishadress
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%%%原创性声明
\newcommand\makestatement{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  \vspace*{3em}	
	\heiti\zihao{-2}中国地质大学（武汉）\CUGT@value@degree 毕业论文原创性声明
	\vspace{1em}
  \end{center}
  \vspace{5em}
  \songti\zihao{-4}\hspace{2em} 本人郑重声明：本人所呈交的\CUGT@value@degree 毕业论文《\CUGT@value@titlemark 》，是本人在导师的指导下进行的实验性研究工作及取得的成果，论文中引用自他人的文献、数据、图像、资料等均已明确标注出，论文中的结论和结果为本人独立完成，不包含他人成果及为获得中国地质大学或其它教育机构的学位或证书而使用过的材料。同时，对本研究所做过任何贡献的老师和同学均已在论文中作了明确的说明并表示了谢意。\par
  本人所呈交的\CUGT@value@degree 毕业论文没有违反学术道德和学术规范，没有侵权行为，并愿意承担由此而产生的法律责任和法律后果。\\
   \ \\ \ \\ \  \\
      论文作者（签字）：\underline{ \hspace{5em}   }   \hspace{4em}   日期：\underline{　　}年\underline{　　}月\underline{　　}日
  }

%%%授权书
\newcommand\makeauthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}	
	\heiti\zihao{-2}中国地质大学（武汉）论文使用授权书
	\vspace{2em}
  \end{center}
  \songti\zihao{4}\hspace{2em} 本人授权中国地质大学（武汉）可采用影印、缩印、数字化或其它复制手段保存本论文；
  学校可向国家有关部门或机构送交本论文的电子版全文，编入有关数据库进行检索、下载及文献传递服务；
  同意在校园网内提供全文浏览和下载服务。

\vspace{4em}
\hspace{4em} 论文作者签名：\CUGTunderline[170pt]{}        \\

\hspace{4em} 日\hspace{6em}期：  \CUGTunderline[45pt]{\hspace{3em}}年\CUGTunderline[45pt]{\hspace{2em}}月\CUGTunderline[45pt]{\hspace{2em}}日
}%

%%中文摘要
\newenvironment{abstract}
  {%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{2em}
  \begin{center}
  \heiti\zihao{3}\CUGT@value@title \\
  \vspace{1em}
  \def\arraystretch{1.0}
 \begin{tabular}{r@{\zihao{-4}{:}}l}  %将分隔符改成小四冒号大小刚好，不然太大
  \songti\zihao{-4}\CUGT@label@authorshort~~&~~\songti\zihao{-4}\CUGT@value@author \\
  \songti\zihao{-4} \CUGT@label@advisorschoolshort~~&~~\songti\zihao{-4}\CUGT@value@advisorschool \\
   %  \songti\zihao{-4}\CUGT@label@advisorenterpriseshort~~&~~\songti\zihao{-4}\CUGT@value@advisorenterprise \\
   \end{tabular}
  \vspace{1em}\\
  \songti\zihao{4}\CUGT@label@abstract
  \end{center}
  \hspace{1.3em}
  \songti\zihao{5}
  }{}
%%中文关键词
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti\zihao{5} \CUGT@label@keywords~\heiti{\zihao{5}{\textbf{:}}}} ~~\heiti\zihao{5}#1}

%%英文摘要
\newenvironment{englishabstract}
  {%
  \cleardoublepage
  \thispagestyle{empty}
   \vspace*{2em}
  \begin{center}
   \zihao{2}\CUGT@value@englishtitle \\
 \vspace{0.2em}
\def\arraystretch{.5}
 \begin{tabular}{r@{\zihao{-4}{:}}l}  %将分隔符改成小四冒号大小刚好，不然太大
  \zihao{-4}\CUGT@label@englishauthor~&~ \zihao{-4}\CUGT@value@englishauthor \\
 \zihao{-4} \CUGT@label@englishadvisorschool~ &~\zihao{-4}\CUGT@value@englishadvisorschool \\
 %\zihao{-4}\CUGT@label@englishadvisorenterprise~&~\songti\zihao{-4}\CUGT@value@englishadvisorenterprise \\
  \end{tabular}
  \vspace{1em}\\
  \zihao{4}\MakeUppercase\CUGT@label@englishabstract
  \end{center}
  \hspace{2ex}
  \zihao{5}
  }{}

%%英文关键词
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf\zihao{5} \CUGT@label@englishkeywords~\zihao{5}{\textbf{:}}  ~~\bf \zihao{5}#1}}
%以下代码宏包（这个宏包太霸道，因此最后调用）
\RequirePackage{listings}
\lstset{
  language=Matlab,
  numberbychapter=true,
  basicstyle=\small,
  numbers=left,
  keywordstyle=\color{blue},
  numberstyle={\tiny\color{lightgray}},
  stepnumber=1,                      %行号会逐行往上递增
  numbersep=5pt,
  commentstyle=\small\color{red},
  backgroundcolor=\color[rgb]{0.95,1.0,1.0},
  showspaces=false,                  %显示空格
  showtabs=false,
  breaklines=true,                   %自动换行
  frame=shadowbox, framexleftmargin=5mm, rulesepcolor=\color{red!20!green!20!blue!20!},
    flexiblecolumns=true,
    breaklines=true,            %对过长的代码自动换行
    breakautoindent=true,
    breakindent=1em,
   keepspaces=true,
    extendedchars=false,
    columns=flexible,
    mathescape=true,
     frame=single,
%  TABframe=single,
  tabsize=4,
  aboveskip=1em,
  breaklines=tr,
  extendedchars=false %这一条命令可以解决代码跨页时，章节标题，页眉等汉字不显示的问题
}
%以上代码宏包

%设定表格宽度
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}

%%
%% End of file `CUGthesis.cls'.
