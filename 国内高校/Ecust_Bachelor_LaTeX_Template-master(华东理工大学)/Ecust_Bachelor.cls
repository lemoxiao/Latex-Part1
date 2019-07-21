\ProvidesPackage{Ecust_Bachelor}[2017/5/11 v1.0 The framework of Ecust bachelor thesis by Yunong Liu]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[cs4size, a4paper, winfonts,fancyhdr]{ctexart}

\setmainfont{Times New Roman}

\newcommand{\thesistype}{}
\newcommand{\thesistitle}{}

\RequirePackage[left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm,headheight=15pt, headsep=0.3cm, footskip=0.5cm]{geometry}


\RequirePackage[hang,flushmargin]{footmisc}
\RequirePackage{longtable}
\RequirePackage{datetime}
\RequirePackage{multirow}
\RequirePackage{paralist}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\setstretch{1.35}



\setlength{\abovedisplayskip}{0cm}
\setlength{\belowdisplayskip}{0cm}
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\RequirePackage[hidelinks,bookmarksnumbered,hypertexnames=false]{hyperref}
% 页眉页脚
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \fancyhead[L]{
    \zihao{5}{\thesistitle\thesistype}
  }
  \fancyhead[R]{\zihao{-5}{\thepage}}
  \fancyfoot[C]{}
  \renewcommand{\headrulewidth}{0.75pt}
}
\fancypagestyle{head}{
  \fancyhead[L]{}
  \fancyhead[R]{}
  \fancyfoot[C]{\zihao{-5}{\thepage{}}}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}


\RequirePackage{caption}
\DeclareCaptionFont{capfont}{\songti\zihao{-5}\bfseries\selectfont}
\captionsetup{font=capfont,skip=4pt}
\captionsetup[table]{position=top}
\renewcommand {\thetable} {\thesection{}.\arabic{table}}
\renewcommand {\thefigure} {\thesection{}.\arabic{figure}}

\RequirePackage{titlesec}
\titleformat{\section}{\centering\heiti\zihao{-2}}{\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{0pt}{12pt}
\titleformat{\subsection}{\songti\zihao{4}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{12pt}{0pt}
\titleformat{\subsubsection}{\bfseries\zihao{-4}}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{12pt}{0pt}


% 论文的摘要，分中文摘要和英文摘要，新定义环境zh和en
\RequirePackage{titletoc}
\contentsmargin{0cm}

\titlecontents{section}
[0cm]% left margin
{}% above code
{\heiti\zihao{4}\thecontentslabel}% numbered format
{\heiti\zihao{4}\thecontentslabel}% unnumbered format
%{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{0pt}}
{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{0pt}}

\titlecontents{subsection}
[0em]
{}
{\heiti\zihao{-4}\thecontentslabel\ }
{}
{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{-1pt}}
\setcounter{tocdepth}{2}

\newenvironment{abstractzh}[1]{
  \def\keywordszh{#1}
  \clearpage\phantomsection
  \addcontentsline{toc}{section}{摘要}
  \pagenumbering{Roman}
  \thispagestyle{head}
  \vspace*{102pt}
  {\centering\heiti\zihao{-2} 摘要\par}
  \vspace*{12pt}\par
  \setstretch{1.35}
  \songti\zihao{-4}
}{
  \vspace*{12pt}\par
  {\heiti\zihao{-4} 关键词：}
  {\songti\zihao{-4} \keywordszh}
}
\newenvironment{abstracten}[1]{
  \def\keywordsen{#1}
  \clearpage\phantomsection
  \addcontentsline{toc}{section}{Abstract}
  \thispagestyle{head}
  \vspace*{102pt}
  {\centering\bfseries\zihao{-2} Abstract\par}
  \vspace*{12pt}\par
  \setstretch{1.35}
  \zihao{-4}
}{
  \vspace*{12pt}\par
  {\bfseries\zihao{-4} Keywords:}
  {\zihao{-4} \keywordsen}
}
% 设置文献翻译和开题报告中的标题和摘要等
\newcommand{\mktitle}[2]{{\vspace*{-17pt}\centering\heiti{\bfseries\zihao{-2}{#1}\\}{\vspace{6pt}\zihao{4}{#2}\\}}}
\newcommand{\mkabstract}[2]{{\vspace{6pt}{\setstretch{1.35}\noindent\heiti{摘要：}\songti #1\\\heiti{关键词：}\songti #2\par}}\vspace{13pt}}


\newcommand{\mktableofcontents}{
  \clearpage
  %\pagenumbering{Roman}
  \pagestyle{head}
  \pdfbookmark[0]{\contentsname}{contents}
  \tableofcontents
  \thispagestyle{head}
  \clearpage
  \pagenumbering{arabic}
  \pagestyle{plain}
}


\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\setlength{\bibitemsep}{0pt}
\newenvironment{acknowledgement}
		{\vspace*{-26bp}
		\begin{center}
			{\heiti\zihao{-2}{致谢}}
		\vspace*{12bp}
		\end{center}
		\par}
		{\par
		    \clearpage
		}

    %代码环境定义
        \RequirePackage[x11names, rgb, html]{xcolor}

        % Solarized colors
        \definecolor{sbase03}{HTML}{002B36}
        \definecolor{sbase02}{HTML}{073642}
        \definecolor{sbase01}{HTML}{586E75}
        \definecolor{sbase00}{HTML}{657B83}
        \definecolor{sbase0}{HTML}{839496}
        \definecolor{sbase1}{HTML}{93A1A1}
        \definecolor{sbase2}{HTML}{EEE8D5}
        \definecolor{sbase3}{HTML}{FDF6E3}
        \definecolor{syellow}{HTML}{B58900}
        \definecolor{sorange}{HTML}{CB4B16}
        \definecolor{sred}{HTML}{DC322F}
        \definecolor{smagenta}{HTML}{D33682}
        \definecolor{sviolet}{HTML}{6C71C4}
        \definecolor{sblue}{HTML}{268BD2}
        \definecolor{scyan}{HTML}{2AA198}
        \definecolor{sgreen}{HTML}{859900}
        \RequirePackage{listings}

        \lstset{
            % How/what to match
            sensitive=true,
            % code number
            numbers=left,
            % Border (above and below)
            frame=lines,
            % Extra margin on line (align with paragraph)
            xleftmargin=\parindent,
            % Put extra space under caption
            belowcaptionskip=1\baselineskip,
            % Colors
            backgroundcolor=\color{sbase3},
            basicstyle=\color{sbase00}\ttfamily,
            keywordstyle=\color{scyan},
            commentstyle=\color{sbase1},
            stringstyle=\color{sblue},
            numberstyle=\color{sviolet},
            identifierstyle=\color{sbase00},
            % Break long lines into multiple lines?
            breaklines=true,
            % Show a character for spaces?
            showstringspaces=false,
            tabsize=2
        }
