\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csapp}[2018/3/13 v0.1 Report Template for CSAPP]

\LoadClass{BaseSetting}[2017/1/1]

\fancyhead[C]{\heiti 计算机系统实验报告}

% 姓名，专业，学号，班号
\newcommand\infoauthor[4]{\def\CSAPP@value@author{#1} \def\CSAPP@value@subject{#2} \def\CSAPP@value@ident{#3} \def\CSAPP@value@classnum{#4}}
% 指导老师，实验地点，实验序号，实验项目名称，实验日期
\newcommand\infoexp[5]{\def\CSAPP@value@teacher{#1} \def\CSAPP@value@place{#2} \def\CSAPP@value@expnum{#3} \def\CSAPP@value@title{#4} \def\CSAPP@value@expdate{#5}}

\renewcommand\maketitle{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \rule[1.10cm]{\linewidth}{0cm}
        \includegraphics[width=0.4\linewidth]{figures/Banner}
        
        \vspace{0.5cm}
        
        \textbf{\zihao{0} 实验报告}
        
        \vspace{1cm}
        
        \textbf{{\Huge 实验(\CSAPP@value@expnum)}}
        
        \begin{LARGE}
            \vspace{2cm}
            题\rule{38pt}{0pt}目 \dlmu[6cm]{\CSAPP@value@title} \\ \vspace{4pt}
            专\rule{38pt}{0pt}业 \dlmu[6cm]{\CSAPP@value@subject} \\ \vspace{4pt}
            学\rule{38pt}{0pt}号 \dlmu[6cm]{\CSAPP@value@ident}\\ \vspace{4pt}
            班\rule{38pt}{0pt}级 \dlmu[6cm]{\CSAPP@value@classnum}\\ \vspace{4pt}
            学\rule{38pt}{0pt}生 \dlmu[6cm]{\CSAPP@value@author}\\ \vspace{4pt}
            指导教师 \dlmu[6cm]{\CSAPP@value@teacher}\\ \vspace{4pt}
            实验地点 \dlmu[6cm]{\CSAPP@value@place}\\ \vspace{4pt}
            实验日期 \dlmu[6cm]{\CSAPP@value@expdate}\\ \vspace{4pt}
        \end{LARGE}
        
        \vfill
        {\huge \textbf{计算机科学与技术学院}}
    \end{center}
    \newpage
}

\endinput