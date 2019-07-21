%# -*- coding: utf-8-unix -*-
%==================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{csuthesis}[2019/04/30 v1.00 Central South University Bachelor Thesis Template]
\def\version{v1.00}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\PassOptionsToClass{scheme=chinese}{ctexbook}
\PassOptionsToClass{zihao=-4}{ctexbook}  
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

\AtEndOfClass{\input{csuthesis.cfg}}  % 导入csuthesis.cfg配置文件

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} 
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{sourcecodepro}
\RequirePackage{upgreek}
\RequirePackage{wasysym}
\RequirePackage{anyfontsize}
\RequirePackage{metalogo,doc}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\RequirePackage{titletoc}

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{contentsname={\csu@contentsname}}
\ctexset{listfigurename={\csu@listfigurename}}
\ctexset{listtablename={\csu@listtablename}}
\floatname{algorithm}{\csu@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{\csu@algorithmicrequire}} 
\renewcommand{\algorithmicensure}{\textbf{\csu@algorithmicensure}}
\renewcommand{\listalgorithmname}{\csu@listalgorithmname}
\renewcommand{\lstlistingname}{\csu@value@listingname}

% Title Settings at the chapter Level
\ctexset{chapter={
	format={\centering},
	name={第,章},
	number=\arabic{chapter},
	nameformat={\zihao{3}\heiti},
	titleformat={\zihao{3}\heiti},
	aftername={\quad},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}
% Title Settings at the section Level
\ctexset{section={
	format={\zihao{-4}\heiti},
	afterskip={1.0ex \@plus .2ex},
	indent=2em
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
	format={\zihao{-4}\kaishu},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	indent=2em
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	indent=2em
	}
}


% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in caption and bicaption pacakge
\DeclareCaptionFont{heiti}{\heiti}
\captionsetup{format=plain,labelformat=simple,labelsep=quad,justification=centering,font={small,heiti}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}

\DeclareCaptionOption{bi-first}[]{
    \def\tablename{\csu@tablename}
    \def\figurename{\csu@figurename}
}
\DeclareCaptionOption{bi-second}[]{
    \def\tablename{Table}
    \def\figurename{Figure}
}

% Set fontnote font size in threeparttable
\appto\TPTnoteSettings{\footnotesize}


\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}
\AtBeginDocument{\renewcommand{\thelstlisting}{\arabic{chapter}--\arabic{lstlisting}}}

% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% Setting Package siunitx
\sisetup{detect-all} % Detecting fonts

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\csu@label@algo~}[chapter]
  \newtheorem{thm}{\csu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\csu@label@lem~}
  \newtheorem{prop}[thm]{\csu@label@prop~}
  \newtheorem{cor}[thm]{\csu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\csu@label@defn~}[chapter]
  \newtheorem{conj}{\csu@label@conj~}[chapter]
  \newtheorem{exmp}{\csu@label@exmp~}[chapter]
  \newtheorem{rem}{\csu@label@rem~}
  \newtheorem{case}{\csu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\csu@label@thm~}
  \newtheorem{blem}[thm]{\csu@label@lem~}
  \newtheorem{bprop}[thm]{\csu@label@prop~}
  \newtheorem{bcor}[thm]{\csu@label@cor~}
  \renewcommand{\proofname}{\bfseries\csu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic  

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========

%==========

\renewcommand\maketitle{%
  \pdfbookmark[0]{\csu@titlepage}{titlepage}
    \makechinesetitle@bachelor
}

\newcommand\classification[1]{\def\csu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\csu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\csu@value@confidential{#1}}
\newcommand\school[1]{\def\csu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\csu@value@chinesedegree{#1}}
\renewcommand\title[1]{\def\csu@value@chinesetitle{#1}}
\renewcommand\author[1]{\def\csu@value@author{#1}}
\newcommand\advisor[1]{\def\csu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\csu@value@coadvisor{#1}}
\newcommand\major[1]{\def\csu@value@major{#1}}
\newcommand\submitdate[1]{\def\csu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\csu@value@defenddate{#1}}
\newcommand\institute[1]{\def\csu@value@institute{#1}}
\newcommand\chairman[1]{\def\csu@value@chairman{#1}}
\newcommand\englishtitle[1]{\def\csu@value@englishtitle{#1}}

\newcommand\makechinesetitle@bachelor{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{15pt} %\vskip 7pt
    \includegraphics[scale=0.5]{csulogo}
    \vskip 40pt
    {\fontsize{45}{45}\heiti{\csu@label@thesis}}%要修改
    \vskip 20pt
    {\zihao{1}\heiti\MakeUppercase{\csu@label@englishthesis}}
    \vskip 100pt
 %   \vskip \stretch{1}
    {
    \def\arraystretch{1.1}
    \begin{tabular}{cc}
    	\makebox[8em][s]{\zihao{-2}\heiti{\csu@label@title}} & \uline{\makebox[20em]{\zihao{-2}\kaishu{\csu@value@chinesetitle}}} \\
    	\makebox[8em][s]{\zihao{-2}\heiti {\csu@label@author}} & \uline{\makebox[20em]{\zihao{-2}\kaishu{\csu@value@author}}} \\
    	\makebox[8em][s]{\zihao{-2}\heiti{\csu@label@advisor}} & \uline{\makebox[20em]{\zihao{-2}\kaishu{\csu@value@advisor}}} \\
    	\makebox[8em][s]{\zihao{-2}\heiti{\csu@label@institute}}     & \uline{\makebox[20em]{\zihao{-2}\kaishu{\csu@value@institute}}} \\
    	\makebox[8em][s]{\zihao{-2}\heiti{\csu@label@major}} & \uline{\makebox[20em]{\zihao{-2}\kaishu{\csu@value@major}}} \\
    \end{tabular}         }
     \vskip 120pt
     {\zihao{2}\heiti{本科生院制}}
     \vskip 15pt
     {\zihao{-2}\heiti{\csu@value@defenddate}}
  \end{center}
  \cleardoublepage
}

% 页眉页脚设置
\def\csu@value@titlemark{\csu@value@chinesetitle}
\newcommand\csu@fancyhead{\zihao{-5}\heiti }
\newcommand\csu@fancyfoot[1]{ 第~{\thepage}~页\hspace{1em}共~{#1}~页}

\def\markboxwidth{0.75\textwidth}
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[scale=0.15]{csulogo}}
	  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\csu@fancyhead\csu@value@titlemark}}}
	  \fancyfoot[C]{\csu@fancyfoot{\pageref{last}}}
	  \renewcommand{\headheight}{32pt}
	}
  %% 英文大摘要
  \fancypagestyle{biglast}{
    \fancyhf{}
    \fancyhead[L]{\includegraphics[scale=0.15]{csulogo}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\csu@fancyhead\csu@value@titlemark}}}
    \fancyfoot[C]{\csu@fancyfoot{\pageref{biglast}}}
    \renewcommand{\headheight}{32pt}
  }
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[scale=0.15]{csulogo}}
	  \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\csu@fancyhead\csu@value@titlemark}}}
	  \fancyfoot[C]{\csu@fancyfoot{\pageref{last}}}
	  \renewcommand{\headheight}{32pt}
	}
  


% 中英文摘要
\newenvironment{abstract}{\cleardoublepage \pdfbookmark[0]{\csu@label@abstract}{abstract} 
\chapter*{\csu@value@chinesetitle\vskip 20pt\csu@label@chineseabstract}\markboth{\csu@label@chineseabstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4} \csu@label@keywords} #1}
\newenvironment{englishabstract}{\cleardoublepage
\chapter*{\csu@value@englishtitle\vskip 20pt\bfseries \MakeUppercase\csu@label@englishabstract}\markboth{\csu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4} \csu@label@englishkeywords} #1}

\titlecontents{chapter}[0pt]{\addvspace{2pt}\filright}              
{\contentspush{\thecontentslabel\ 
}}              
{}{\titlerule*[8pt]{.}\contentspage}

\renewcommand\tableofcontents{%
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{toc}
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

   
\renewenvironment{thanks}
{\chapter*{\csu@label@thanks\markboth{\csu@label@thanks}{}}\addcontentsline{toc}{chapter}{\csu@label@thanks}
}{}

\newenvironment{summary}
{\chapter*{\csu@label@summary\markboth{\csu@label@summary}{}}\addcontentsline{toc}{chapter}{\csu@label@summary}
}{}

\endinput