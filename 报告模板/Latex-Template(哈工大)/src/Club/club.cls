\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{club}[2019/9/21 v0.1 Origazine Method Template for club]

\LoadClass{BaseSetting}[2017/1/1]

\fancyhead[L]{\heiti 哈尔滨工业大学学生社团管理办法}
\fancyhead[R]{\heiti IBM俱乐部}

\RequirePackage{CJKvert}

% 社团名称
\newcommand\infoName[1]{\def\CLUB@value@name{#1}}

\renewcommand\maketitle{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \includegraphics[width=0.9\linewidth]{figures/Banner}
        
        \vspace{2cm}
        
        \textbf{\zihao{0}\CLUB@value@name}
        
        \vspace{5cm}
        
        \textbf{{\zihao{0} 社团章程}}

        \vfill
        {\huge \textbf{冯云龙}}

        \vspace{1cm}
        
        {\huge \textbf{\today}}
    \end{center}
    \newpage
}

\endinput