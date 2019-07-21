% 论文版面要求:
% 统一按 word 格式A4纸（页面设置按word默认值）编排、打印、制作。
% 正文内容字体为宋体；字号为小4号；字符间距为标准；行距为25磅(约0.88175cm)。
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ecnumaster}[2016/12/31 template for ECNU master]

%%%% basic document class
\LoadClass[openright]{ctexbook}

%%%%% first page style of chapter
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{}%
  \let\@evenfoot\@oddfoot
  \def\@oddhead{}%
  \let\@evenhead\@oddhead % in case a chapter starts on a left-hand page
}

%%%%% layout
%\RequirePackage[a4paper,includehead,includefoot]{geometry}
\RequirePackage[a4paper]{geometry}
\geometry{left=3.17cm,right=3.17cm,top=3.54cm,bottom=3.54cm,headsep=1cm,footskip=15mm}

\setlength{\parindent}{2em}
\setlength{\parskip}{0.5em}

%%%%% ctex
%\RequirePackage[UTF8,10pt,heading=true,cap]{ctex}
\ctexset{%
  contentsname={目\ \ 录},
  listfigurename={插\ 图\ 目\ 录},
  listtablename={表\ 格\ 目\ 录},
 % bibname={\centerline{参\ 考\ 文\ 献}},
  chapter={name={第,章},
           number=\chinese{chapter},
           nameformat={\zihao{3}\bfseries},
           titleformat={\zihao{3}\bfseries},
           beforeskip={-10pt},
           afterskip={20pt}
           },
  section={format=\raggedright,
           nameformat={\zihao{4}\bfseries},
           titleformat={\zihao{4}\bfseries},
           afterskip={1ex plus 0.2ex}
           },
  subsection={format=\raggedright,
           nameformat={\zihao{-4}\bfseries},
           titleformat={\zihao{-4}\bfseries},
           afterskip={0.5ex plus 0.1ex}
           }
}

%%%%% default font
\setmainfont{Times New Roman}
%\setsansfont{Myriad Pro} % \sffamily
%\setmonofont{Consolas}   % \ttfamily
%\setCJKmainfont[BoldFont={Microsoft YaHei},ItalicFont={KaiTi}]{SimSun}
%\setCJKsansfont{KaiTi}
%\setCJKmonofont{KaiTi}
\newcommand{\song}{\sonti}
\newcommand{\hei}{\heiti}
\newcommand{\kai}{\kaishu}
\newcommand{\you}{\youyuan}
\setCJKfamilyfont{STSong}{STZhongsong}\newcommand{\STSong}{\CJKfamily{STSong}}

%%%% math and references
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{bm}
  \allowdisplaybreaks[4]
  \numberwithin{equation}{chapter}
\RequirePackage[numbers,square,sort&compress]{natbib}
  \setlength{\bibsep}{1.0ex}

%%%%% graphics and color
\RequirePackage{graphicx}
\RequirePackage{xcolor}

%%%%% index
\RequirePackage{makeidx}\makeindex   % 索引

%%%%% hyperref
\RequirePackage[xetex,colorlinks,breaklinks,bookmarksopen]{hyperref}
%\RequirePackage[xetex,pagebackref,colorlinks,breaklinks,bookmarksopen]{hyperref}
%\renewcommand*{\backrefalt}[4]{%
%\ifcase #1 No citations.%
%\or Cited on page #2.%
%\else Cited on pages #2.%
%%\else #1 Cited on pages #2.%
%\fi
%}
\hypersetup{bookmarksnumbered=true,bookmarksopenlevel=1,linkcolor=blue,citecolor=blue}

%%%%% caption
\RequirePackage[margin=2em,labelsep=space,skip=0.5em,font=small]{caption}
\DeclareCaptionFormat{mycaption}{{\heiti\color{blue} #1}#2{\kaishu #3}}
\captionsetup{format=mycaption,tablewithin=chapter,figurewithin=chapter}

%%%%% font size, from THUthesis
\RequirePackage{calc}
\newlength\sstp@linespace
\newcommand{\sstp@choosefont}[2]{%
  \setlength{\sstp@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\sstp@linespace}\selectfont}
\def\sstp@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \sstp@choosefont{##1}{#2}}}
\sstp@define@fontsize{chuhao}{42pt}
\sstp@define@fontsize{xiaochu}{36pt}
\sstp@define@fontsize{yihao}{26pt}
\sstp@define@fontsize{xiaoyi}{24pt}
\sstp@define@fontsize{erhao}{22pt}
\sstp@define@fontsize{xiaoer}{18pt}
\sstp@define@fontsize{sanhao}{16pt}
\sstp@define@fontsize{xiaosan}{15pt}
\sstp@define@fontsize{sihao}{14pt}
\sstp@define@fontsize{banxiaosi}{13pt}
\sstp@define@fontsize{xiaosi}{12pt}
\sstp@define@fontsize{dawu}{11pt}
\sstp@define@fontsize{wuhao}{10.5pt}
\sstp@define@fontsize{xiaowu}{9pt}
\sstp@define@fontsize{liuhao}{7.5pt}
\sstp@define@fontsize{xiaoliu}{6.5pt}
\sstp@define@fontsize{qihao}{5.5pt}
\sstp@define@fontsize{bahao}{5pt}

%%%%% contents
%\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{3}
\RequirePackage{titletoc}
\contentsmargin{2em}
\titlecontents{chapter}[4em]%
  {\vspace*{0.8ex}\heiti}%
  {\color{blue}\contentslabel{4em}}%
  {\hspace*{-4em}}%
  {\hspace{5pt}\titlerule*[5pt]{}\contentspage}%
  [\addvspace{0pt}]
\titlecontents{section}
  [4em]%
  {\vspace*{0ex}}%
  {\color{blue}\contentslabel[\thecontentslabel]{2.5em}}%
  {\hspace*{-1.8em}}%
  {\hspace{5pt}\titlerule*[8pt]{.}\contentspage}%
  [\addvspace{-1ex}]
%\titlecontents{subsection}
%  [7.0em]%
%  {\vspace*{0.5ex}\kaishu}%
%  {\contentslabel[\thecontentslabel]{3.0em}}%
%  {}%
%  {\hspace{5pt}\titlerule*[5pt]{.}\contentspage}%
%  [\addvspace{-3pt}]

%%%%% preface
%\def\prefacename{前言}
%\newcommand{\preface}[1][\prefacename]{\chapter*{#1}\markboth{#1}{#1}}

%%%%% list
\RequirePackage{enumitem}
\setlist{itemsep=0.05\baselineskip,itemindent=1.5em,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setlist[enumerate,1]{label=(\arabic*), ref=(\arabic*)}
\setlist[enumerate,2]{label=\emph{\alph*}), ref=\theenumi.\emph{\alph*}}
\setlist[enumerate,3]{label=\roman*), ref=\theenumii.\roman*}
%\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
%\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}

%%%%% Theorems
\usepackage[amsmath,thref,thmmarks,hyperref]{ntheorem}
\theorempostskipamount0em
\theoremstyle{plain}
\theoremheaderfont{\normalfont\heiti\color{black}}
\theorembodyfont{\normalfont\kaishu\color{black}}
\theoremindent0em
\theoremseparator{\hspace{0.2em}}
\theoremnumbering{arabic}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{proposition}[theorem]{命题}
\newtheorem{property}[theorem]{性质}
\newtheorem{definition}{定义}[chapter]
\newtheorem{remark}{注记}[chapter]
%
%\theoremheaderfont{\normalfont\itshape\color{blue}}
\theorembodyfont{\normalfont\rmfamily\color{black}}
\newtheorem{example}{例}[chapter]

\theoremstyle{nonumberplain}
\theorempreskip{0em}
\theoremsymbol{\ensuremath{\Box}}
\newtheorem{proof}{证明}

%%%%% heading
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}  % 清除以前对页眉页脚的设置
\fancyhead[CO,CE]{华东师范大学硕士学位论文}
\fancyfoot[RO,LE]{{\thepage}}
%\newcommand{\makeheadrule}{%% 定义页眉与正文间双隔线
%  \makebox[0pt][l]{\rule[.7\baselineskip]{\headwidth}{0.3pt}}%0.4
%  \rule[0.85\baselineskip]{\headwidth}{1.0pt}\vskip-.8\baselineskip}
%\renewcommand{\headrule}{%
%  {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi\makeheadrule}}
%\renewcommand{\chaptermark}[1]{\markboth{\CTEXthechapter \ #1}{}}
%\renewcommand{\sectionmark}[1]{\markright{\thesection \ #1}{}}
%\fancyhead[RO,LE]{{\small\songti\rightmark}}     % 节标题
%\fancyhead[RE]{{\small\songti\leftmark}}      % 章标题
%\fancyhead[RO,LE]{$\cdot$ {\small\thepage} $\cdot$}

%%%% tabular
\RequirePackage{booktabs} % toprule, midrule, bottomrule
\RequirePackage{varwidth} % 可变宽度的 parbox

%%%%% float
\RequirePackage{float}

%%%%% underline
\RequirePackage{ulem}
\def\ULthickness{1pt}

%%%%% algorithm
\RequirePackage{algorithm,algpseudocode}
\floatname{algorithm}{\color{blue} 算法}
\algrenewcommand{\algorithmiccomment}[1]{\quad{\color{red}\%\ #1}}
\numberwithin{algorithm}{chapter}
\renewcommand{\listalgorithmname}{算\ 法\ 目\ 录}

%%%%% cover
\def\class#1{\def\@class{#1}}\def\@class{}
\def\security#1{\def\@security{#1}}\def\@security{}
\def\graduateyear#1{\def\@graduateyear{#1}}\def\@graduateyear{}
\def\ctitle#1{\def\@ctitle{#1}}\def\@ctitle{}
\def\caffil#1{\def\@caffil{#1}}\def\@caffil{}
\def\cmajor#1{\def\@cmajor{#1}}\def\@cmajor{}
\def\cdirection#1{\def\@cdirection{#1}}\def\@cdirection{}
\def\cauthor#1{\def\@cauthor{#1}}\def\@cauthor{}
\def\studentid#1{\def\@studentid{#1}}\def\@studentid{}
\def\csupervisor#1{\def\@csupervisor{#1}}\def\@csupervisor{}
\def\cdate#1{\def\@cdate{#1}}\def\@cdate{}
\def\edegree#1{\def\@edegree{#1}}\def\@edegree{}
\def\etitle#1{\def\@etitle{#1}}\def\@etitle{}
\def\eaffil#1{\def\@eaffil{#1}}\def\@eaffil{}
\def\emajor#1{\def\@emajor{#1}}\def\@emajor{}
\def\edirection#1{\def\@edirection{#1}}\def\@edirection{}
\def\eauthor#1{\def\@eauthor{#1}}\def\@eauthor{}
\def\esupervisor#1{\def\@esupervisor{#1}}\def\@esupervisor{}
\def\edate#1{\def\@edate{#1}}\def\@edate{}

\newcommand{\ecnumcc}[1]{\multicolumn{1}{c}{\underline{\makebox[10em][l]{#1}}}}
\newcommand{\ecnumce}[1]{\multicolumn{1}{c}{\underline{\makebox[15em][l]{#1}}}}

\def\makecover{
  \begin{titlepage}
  %%%%% ===== 中文封面
  \phantomsection
  \pdfbookmark[0]{中文封面}{ccover}
  \linespread{1.1}\zihao{4}\ziju{0.05}
  \noindent{\!\@graduateyear\,届研究生硕士学位论文}\smallskip
  \par\noindent\hspace*{-12pt}
  \setlength{\tabcolsep}{2pt}
  \begin{tabular}[t]{rl}
    分\hspace{7.5pt}类\hspace{7.5pt}号：
                      &\ \underline{\makebox[6em][l]{\,\@class}}  \\[1.5ex]
    密\hspace{2em}级：&\ \underline{\makebox[6em][l]{\@security}}
  \end{tabular}
  \hfill
  \begin{tabular}[t]{rl}
    学校代码：&\ \underline{\makebox[6em][l]{\,10269}} \\[1.5ex]
    学\hspace{2em}号：&\ \underline{\makebox[6em][l]{\,\@studentid}}
  \end{tabular}

  \vspace{4em}
  \begin{center}
    \raisebox{1ex}[0pt][0pt]{
    \includegraphics[width=0.15\textwidth]{ecnu_logo}}\ \
    \includegraphics[width=0.75\textwidth,height=5em]{ecnu}

    \bigskip
    {\STSong
      \zihao{-2}\textbf{East China Normal University} \\[0.5ex]
      \zihao{2} 硕士学位论文\\[1ex]
      \zihao{-2} \textbf{MASTER'S  DISSERTATION}

    % title
    \vspace{3em}\noindent
    \parbox[t]{0.25\textwidth}{\zihao{1} 论文题目：}
    \begin{varwidth}[t]{.75\linewidth}\linespread{1.3}\zihao{1} \@ctitle \linebreak\end{varwidth}


    \vfill\linespread{1.5}\selectfont\zihao{4}
    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}{p{0cm}p{5.5em}@{\extracolsep{0.5ex}}cc}
     ~ & 院 \hfill 系： & & \ecnumcc{\@caffil } \\
     ~ & 专 \hfill 业： & & \ecnumcc{\@cmajor}\\
     ~ & 研 \hfill 究 \hfill 方 \hfill 向：& & \ecnumcc{\@cdirection}\\
     ~ & 指\hfill 导\hfill 老\hfill 师：& & \ecnumcc{\@csupervisor}\\
     ~ & 学\hfill 位\hfill 申\hfill 请\hfill 人：& & \ecnumcc{\@cauthor}\\
    \end{tabular}
    }

    \vfill\@cdate
  \end{center}

  \clearpage{\pagestyle{empty}\cleardoublepage}
  %%%%% ===== 英文封面
  \thispagestyle{empty}
  \phantomsection
  \pdfbookmark[0]{英文封面}{ecover}
  \noindent Dissertation for master degree in \@graduateyear
  \hfill University Code:\, 10269\par\medskip
  \mbox{}\hfill Student ID:\, \@studentid

  \vspace{5em}
  \begin{center}
    {\zihao{-0} East China Normal University}
    %\scalebox{1.15}[1.6]{\bfseries EAST CHINA NORMAL UNIVERSITY}

    % title
    \vspace{6em}{\bfseries
    \parbox[t]{0.125\textwidth}{\zihao{2} Title：}
    \begin{varwidth}[t]{.75\linewidth}\linespread{1.4}\zihao{2} \@etitle \linebreak\end{varwidth}}

    \vfill\linespread{1.5}\selectfont\mdseries

    \renewcommand{\arraystretch}{1.1}
    \scalebox{1}[1.0]{\setlength{\tabcolsep}{0.5ex}
    \begin{tabular}{rl}
     Department: &  \ecnumce{\@eaffil } \\
     Major:      &  \ecnumce{\@emajor}\\
     Research Direction: &  \ecnumce{\@edirection}\\
     Supervisor: &  \ecnumce{\@esupervisor}\\
     Candidate:  & \ecnumce{\@eauthor}\\
    \end{tabular}
    }

    \vfill
    \@edate
  \end{center}
\end{titlepage}
}

%%%%% baselineskip
\linespread{1.4}
