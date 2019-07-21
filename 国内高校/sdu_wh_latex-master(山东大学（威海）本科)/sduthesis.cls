%%
%% This is file `sduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sduthesis.dtx  (with options: `class')
%% 
%% -----------------------------------
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012 -- 2014 by Liam Huang
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Liam Huang.
%%
%% 2019 03 28 Xian-Yu Wang modified this file and made a SDU(wh) test version.
%% If you encounter any problem that you can not solve it by reading sduthesis.pdf, you can report it to me.
%% My e-mail: xianyuwang7@gmail.com
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sduthesis}
  [2015/01/05 v1.2.0c Thesis Template of Shandong University]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=SDU, prefix=SDU@opt@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{SDU}{#1}}
\DeclareBoolOption[true]{chsstyle} 
\DeclareComplementaryOption{nochsstyle}{chsstyle}
\DeclareBoolOption[false]{print}
\DeclareComplementaryOption{noprint}{print}
\DeclareBoolOption[true]{double}
\DeclareComplementaryOption{single}{double}
%%\usepackage{ctexcap}
%%目录的制作是通过超链接制作的，如果没有生成合适的中文目录，可能是汉字没有解析？
\LoadClass[zihao=-4,a4paper, cs4size, space, UTF8,fancyhdr, appendix, ctexcap, hyperref, openany, scheme=chinese,fontset=none,UTF8]{ctexbook}
\RequirePackage[unicode,pdfencoding=auto]{hyperref}
%%\RequirePackage[space=true]{ctex}
%%\usepackage{ctexcap}
\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{ctexcap}}

\ProcessKeyvalOptions*\relax
\ifSDU@opt@double\relax\else
  \PassOptionsToClass{twoside}{ctexbook}
\fi
\RequirePackage{appendix}
\RequirePackage{fontspec}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage{ifpdf,ifxetex}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsbsy}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
\RequirePackage{booktabs}
\RequirePackage{xcolor}
\RequirePackage{makecell}
%% add more xelatex fonts
\RequirePackage{xeCJK}  %%中文字体
\setCJKfamilyfont{song}{SimSun}                                   %宋体 song
\newcommand{\song}{\CJKfamily{song}}                         
\setCJKfamilyfont{xs}{NSimSun}                                    %新宋体 xs
\newcommand{\xs}{\CJKfamily{xs}}
\setCJKfamilyfont{fs}{FangSong}                                   %仿宋 fs
\newcommand{\fs}{\CJKfamily{fs}}                                 
\setCJKfamilyfont{kai}{KaiTi}                                     %楷体2312  kai
\newcommand{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{yh}{Microsoft YaHei}                            %微软雅黑 yh
\newcommand{\yh}{\CJKfamily{yh}}
\setCJKfamilyfont{fzdahei}{FZDaHei-B02S}                           %黑体  hei
\newcommand{\fzdahei}{\CJKfamily{fzdahei}}                          
\setCJKfamilyfont{li}{LiSu}                                       %隶书  li
\newcommand{\li}{\CJKfamily{li}}                                  
\setCJKfamilyfont{hwxw}{STXinwei}                                 %华文新魏  hwxw
\newcommand{\hwxw}{\CJKfamily{hwxw}}                                  
\setCJKfamilyfont{fzchs}{FZCuSong-B09S}                            %方正粗宋	
\newcommand{\fzchs}{\CJKfamily{fzchs}}
%%                                       设置西文字体为 Times New Roman
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
%%\RequirePackage{mathspec}
%%\setallmathfont{Times New Roman}  %% 不知道为什么与上面的全局西文字体的设置发生了冲突
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
  
  
  
%% add more fonts size
\newcommand{\ershibahao}{\fontsize{28pt}{28pt}\selectfont}       % 一号, 单倍行距
\newcommand{\yihao}{\fontsize{26pt}{26pt}\selectfont}       % 一号, 单倍行距
\newcommand{\xiaoyi}{\fontsize{24pt}{24pt}\selectfont}      % 小一, 单倍行距
\newcommand{\erhao}{\fontsize{22pt}{1.25\baselineskip}\selectfont}       % 二号, 1.25倍行距
\newcommand{\xiaoer}{\fontsize{18pt}{18pt}\selectfont}      % 小二, 单倍行距
\newcommand{\sanhao}{\fontsize{16pt}{16pt}\selectfont}      % 三号, 单倍行距
\newcommand{\xiaosan}{\fontsize{15pt}{15pt}\selectfont}     % 小三, 单倍行距
\newcommand{\sihao}{\fontsize{14pt}{14pt}\selectfont}       % 四号, 单倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{12pt}\selectfont}      % 小四, 单倍行距
\newcommand{\wuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}   % 五号, 单倍行距
\newcommand{\xiaowu}{\fontsize{9pt}{9pt}\selectfont}        % 小五, 单倍行距
%% add some newcommand
\newcommand*{\me}{\ensuremath{\mathrm{e}}}
\newcommand*{\mi}{\ensuremath{\mathrm{i}}}
\newcommand*{\dif}{\ensuremath{\mathop{}\!\mathrm{d}}}
\DeclareMathAlphabet{\mathsfsl}{OT1}{cmss}{m}{sl}
\newcommand*{\VEC}[1]{\ensuremath{\boldsymbol{#1}}}
\newcommand*{\MATRIX}[1]{\ensuremath{\mathsfsl{#1}}}
\newcommand*{\TENSOR}[1]{\ensuremath{\mathsfsl{#1}}}
\newcommand*{\HUA}[1]{\ensuremath{\mathscr{{#1}}}}
\newcommand*{\SHUANG}[1]{\ensuremath{\mathbb{{#1}}}}

%% 设置西文字体为 Times New Roman
\setmainfont{Times New Roman}
%%\RequirePackage{mathspec}
%%\setallmathfont{Times New Roman}  %% 不知道为什么与上面的全局西文字体的设置发生了冲突
%%
%%%%%%%%%%%%% Contents %%%%%%%%%%%%%%%%%

\RequirePackage[titles]{tocloft}
\usepackage{titletoc}

\renewcommand{\contentsname}{\bfseries\zihao{3}目{\qquad}  录}

\titlecontents{chapter}[2em]{ \zihao{4}}{\contentslabel{2em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{section}[4em]{ \zihao{4}}{\contentslabel{3em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{subsection}[5em]{\zihao{4}}{\contentslabel{1.2em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{subsubsection}[7em]{\zihao{4}}{\contentslabel{2em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{paragraph}[8em]{\zihao{4}}{\contentslabel{1.2em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
%%控制命令解释 
%% \contentslabel{2em} 目录的名字和前面的章节数字的距离  例如一、2em大纲

%%控制目录深度
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}


\ifxetex
  \RequirePackage{graphicx}
\else
  \ifpdf
    \RequirePackage{graphicx}
    \RequirePackage{epstopdf}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi
\linespread{1.3}
\setlength{\parskip}{0.3ex}
\ifSDU@opt@double
  \geometry{left=3.18cm, right=3.18cm, top=2.54cm, bottom=2.54cm}
\else
  \geometry{left=3.18cm, right=3.18cm, top=2.54cm, bottom=2.54cm}
\fi
\AtBeginDocument{\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrule}{%
  \hrule\@height1.5pt\@width\headwidth%
  \vskip1pt%
  \hrule\@height\headrulewidth\@width\headwidth%
}
\fancyhead[C]{%
  \ifSDU@opt@chsstyle
    \chead{\zihao{-5}{}山东大学（威海）毕业论文}
  \else
    \chead{\small Shandong University Bachelor Thesis}
  \fi
}
\fancyfoot[C]{\thepage}}
%%\fancyfoot[OR, EL]{--~{\thepage}~--}}
%%\fancyfoot[CE,CO]{\thepage}
\numberwithin{equation}{chapter}
\graphicspath{{figures/}{figure/}{pictures/}
      {picture/}{pic/}{pics/}{image/}{images/}}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
\AtBeginDocument{\hypersetup{colorlinks=true, linkcolor=blue}}
\ifSDU@opt@print
  \AtBeginDocument{\hypersetup{hidelinks}}
\else\relax\fi
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand\enabstractname{ABSTRACT}
\newcommand\enkeywordsname{Key words}
\newcommand\enkeywords[1]{%
  \vspace{1cm}\noindent{\bfseries\zihao{-3}\enkeywordsname: }#1}
 %%中文摘要
\newcommand\cnabstractname{\bfseries 摘{\quad} {\quad} {\quad} 要}
\newcommand\cnkeywordsname{关{\quad} 键{\quad} 词}
\newcommand\cnkeywords[1]{%
  \vspace{1cm}\noindent{\bfseries \zihao{-4}\cnkeywordsname: }#1}
  
%%定义英文摘要格式
%\newenvironment{enabstract}{%
%  \newpage
%  \centering
%  \begin{minipage}{.9\textwidth}
%  \par \vskip 20mm \relax %%避免开头置顶
%  \centerline{\zihao{-2}\bfseries\enabstractname}\vspace{.3cm}
%  \centering
%  \begin{minipage}{.85\textwidth}
%  \setlength{\parindent}{1.2em}
%  \zihao{-3}
%}{
%\end{minipage}
%\end{minipage}
%}
\newenvironment{enabstract}{%
  \centering
  \begin{minipage}{1\textwidth}
  \vskip 20mm \relax
  \centerline{\zihao{-2}\bfseries\enabstractname}\vspace{.3cm}
  \setlength{\parindent}{2em}
  \zihao{-3}
}{
\end{minipage}
}
%%定义中文摘要格式
\newenvironment{cnabstract}{%
  \newpage
  \centering
  \begin{minipage}{1\textwidth}
  \par \vskip 20mm \relax %%避免开头置顶
  \centerline{\zihao{3}\bfseries\cnabstractname}\vspace{.3cm}
  \centering
  \begin{minipage}[c]{1\textwidth}
  \setlength{\parindent}{2em}
  \zihao{4}
}
{
\end{minipage}
\end{minipage}
}
\ifSDU@opt@chsstyle
  %%chapter setting
  \CTEXsetup[name={,、}]{chapter}
  \CTEXsetup[number={\chinese{chapter}}]{chapter}
  \CTEXsetup[format={\centering}]{chapter}
  \CTEXsetup[nameformat={\bfseries\zihao{4}}]{chapter}
  \CTEXsetup[titleformat={\bfseries\zihao{4}}]{chapter}
  \CTEXsetup[aftername={}]{chapter}
  %%\CTEXsetup[beforeskip={0pt}]{chapter}
  \CTEXsetup[afterskip={0pt}]{chapter}
  %%section setting
  \CTEXsetup[name={（,）}]{section} 
  \CTEXsetup[number={\chinese{section}}]{section}
  \CTEXsetup[aftername={}]{section}
  \CTEXsetup[format={\flushleft\zihao{4}}]{section}
  %%subsection setting
  \CTEXsetup[name={,.}]{subsection}
  \CTEXsetup[aftername={}]{subsection}
  \CTEXsetup[format={\flushleft\zihao{-4}}]{subsection}
  \CTEXsetup[number={\arabic{subsection}}]{subsection}
  %%subsubsection setting
  \CTEXsetup[name={（,）}]{subsubsection}
  \CTEXsetup[aftername={}]{subsubsection}
  \CTEXsetup[format={\flushleft\zihao{-4}}]{subsubsection}
  \CTEXsetup[number={\arabic{subsubsection}}]{subsubsection}
   %%paragraph setting
  \CTEXsetup[name={,}]{paragraph}
  \CTEXsetup[aftername={\quad}]{paragraph}
  %%\CTEXsetup[afterskip={0pt}]{paragraph}
  \CTEXsetup[format={\flushleft\zihao{-4}}]{paragraph}
  \CTEXsetup[number={\circled{\arabic{paragraph}}}]{paragraph}
  %%appendix setting
  \CTEXsetup[name={附录~}]{appendix}
  \CTEXsetup[number={{}}]{appendix}
\else
  \PassOptionsToClass{nocap, noindent}{ctexbook}
\fi
\renewcommand{\thesection}{（\chinese{section}）{\hspace*{-2em}}}
\renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thesubsubsection{（\arabic{subsubsection}）}
\renewcommand\theparagraph{\circled{\arabic{paragraph}}}
\renewcommand\bibname{\bfseries\zihao{3} 参考文献}

%%\titleformat\{\section}{\flushleft\zihao{-4}}{\chinese{section}\,、}{0em}{}{}


\input{sduthesis-cover.def}
\newcommand{\maketitlepagestatement}{%
\maketitlepage
\thispagestyle{empty}
~
\thispagestyle{empty}
~
\vfill\eject
\setcounter{page}{1}
\frontmatter
}
\let\savedtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \savedtableofcontents
    \ifSDU@opt@double
    \cleardoublepage
  \else
    \clearpage
  \fi
  \mainmatter
}


\endinput





%% 
%% Copyright (C) 2012 -- 2014 by Liam Huang
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Liam Huang.
%% 
%% -----------------------------------
%% 
%% This work consists of the file  sduthesis.dtx and sduthesis.ins
%% and the derived files           sduthesis.cls,
%%                                 sduthesis-cover.def,
%%                                 figures/,
%%                                 sduthesis-demo.tex,
%%                                 README.md,
%%                                 LICENSE.md,
%%                                 sduthesis.pdf and
%%                                 sduthesis-demo.pdf.
%%
%% End of file `sduthesis.cls'.
