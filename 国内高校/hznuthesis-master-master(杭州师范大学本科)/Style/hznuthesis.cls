%---------------------------------------------------------------------------%
%-                                                                         -%
%-                           Document Class                                -%
%-                                                                         -%
%---------------------------------------------------------------------------%

%---------------------------------------------------------------------------%
%->> Identification
%---------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]%
\ProvidesClass{hznuthesis}[2018/10/01 v0.1 LaTeX document class]%
%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Layout
%-
\newif\ifHZNU@singlesided \HZNU@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
    \HZNU@singlesidedtrue%
}
\newif\ifHZNU@doublesided \HZNU@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
    \HZNU@doublesidedtrue%
}
\newif\ifHZNU@printcopy \HZNU@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
    \HZNU@doublesidedtrue% auto enable double-sided style
    \HZNU@printcopytrue%
}
%-
%-> Confidential info
%-
\newif\ifHZNU@mjinfo \HZNU@mjinfofalse
\DeclareOption{showmj}{%
    \HZNU@mjinfotrue%
}
%-
%-> Draft version info
%-
\newif\ifHZNU@versioninfo \HZNU@versioninfofalse
\DeclareOption{draftversion}{%
    \HZNU@versioninfotrue%
}
%-
%-> Handle non-implemented options
%-
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%-
%-> Terminates all options processing
%-
\ProcessOptions\relax%
%---------------------------------------------------------------------------%
%->> Load class information
%---------------------------------------------------------------------------%
\ifHZNU@doublesided% if double-sided printing enabled
    \LoadClass[UTF8,a4paper,twoside,12pt]{ctexbook}
\else% if double-sided printing isn't enabled
    \LoadClass[UTF8,a4paper,oneside,12pt]{ctexbook}
\fi
%---------------------------------------------------------------------------%
%->> Required packages
%---------------------------------------------------------------------------%
\RequirePackage{ifxetex}% LaTeX engine detection
%---------------------------------------------------------------------------%
%->> Load class configuration
%---------------------------------------------------------------------------%
\AtEndOfPackage{% class cfg loaded after package to make preamble commands take effect
    \makeatletter
    \InputIfFileExists{Style/hznuthesis.cfg}{}{}
    \makeatother
}
%---------------------------------------------------------------------------%
%->> Page layout
%---------------------------------------------------------------------------%
%- part one -- horizontal widths
%- left side width + textwidth + right side width = paperwidth
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- left side width of [odd, even] page = 1.0in (fixed) + hoffset + [odd, even]sidemargin
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{146.6mm}% set required text width first
\setlength{\hoffset}{0mm}% set horizontal offset
\ifHZNU@printcopy% if print copy layout enabled
    \setlength{\oddsidemargin}{12.6mm}% binding side margin
    \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
    \setlength{\oddsidemargin}{6.3mm}% left side margin
    \setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\fi
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{246.2mm}% set required text height first
\setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\topmargin}{20pt}% vertical margin above header
\setlength{\headheight}{12pt}% header height
\setlength{\headsep}{17.5pt}% vertical margin between header and body text
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
\linespread{1.5}% line space setting
\raggedbottom% prevent adding vertical white space in strange places
%- default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%---------------------------------------------------------------------------%
%->> Style control commands
%---------------------------------------------------------------------------%
%- redefine cleardoublepage to have page style argument
\renewcommand{\cleardoublepage}[1][plain]{%
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{#1}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}
%- underline
\ifxetex% use underline from xeCJKfntef
    \renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}% set underline color
    \renewcommand{\uline}[1]{\CJKunderline{#1}}% unified name
\else% use underline from ulem
    \RequirePackage{ulem}%
\fi
\newcommand{\ulenhance}[2][1pt]{% enhanced underline
    \def\ULthickness{#1}% set thickness
    \uline{#2}}
\newcommand{\ulhshift}{-4em}% horizontal shift on underline
\newcommand{\ulextend}[2][350pt]{% extend underline length
    \hbox to #1{\hfill\hspace*{\ulhshift}#2\hfill}}
%---------------------------------------------------------------------------%
%->> Titlepage
%---------------------------------------------------------------------------%
%-
%-> Chinese item commands
%-

\newcommand{\schoollogo}[2]{\def\HZNU@value@schoollogo{\includegraphics[#1]{#2}}}
\newcommand{\schoolname}[2]{\def\HZNU@value@schoolname{\includegraphics[#1]{#2}}}

%下划线
\def\HZNU@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\HZNUunderline{\@ifnextchar[\HZNU@underline\CTEXunderline}

%学校、学位
\newcommand\school[1]{\def\HZNU@value@school{#1}}
\newcommand\degree[1]{\def\HZNU@value@degree{#1}}

%题目
\renewcommand\title[2][\HZNU@value@title]{%
  \def\HZNU@value@title{#2}
  \def\HZNU@value@titlemark{\MakeUppercase{#1}}}
%培养机构-学院
\newcommand\institute[1]{\def\HZNU@value@institute{#1}}
%专业
\newcommand\major[1]{\def\HZNU@value@major{#1}}
%班级
\newcommand\class[1]{\def\HZNU@value@class{#1}}
%学生姓名
\renewcommand\author[1]{\def\HZNU@value@author{#1}}
%学号
\newcommand\id[1]{\def\HZNU@value@id{#1}}

%指导老师
\newcommand\advisor[1]{\def\HZNU@value@advisor{#1}}
%指导老师职称
\newcommand\advisortitles[1]{\def\HZNU@value@advisortitles{#1}}

%提交日期
\newcommand\submitdate[1]{\def\HZNU@value@submitdate{#1}}
%答辩日期
\newcommand\defenddate[1]{\def\HZNU@value@defenddate{#1}}


%评分
\newcommand\score[1]{\def\HZNU@value@score{#1}}
%毕业届数
\newcommand\graduates[1]{\def\HZNU@value@graduates{#1}}
%-
%-> Redefine Chinese style
%-
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \bf\songti\zihao{-1}
    {\HZNU@value@schoollogo}
    {\HZNU@value@schoolname}
    %论文风格
    %\vskip \stretch{1}
      \bf\heiti\zihao{-1}
      \HZNU@label@thesis
    %毕业届数
    \\
      \bf\heiti\zihao{2}
      \HZNU@value@graduates

    %\vskip \stretch{1}
    \vspace{50pt}
    \bf\fangsong\zihao{-3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.3}

    \begin{tabular}{lccc}
      %题目
      \bf\songti\zihao{-3}
      \HZNU@label@title &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@title}}
    \\
      %学院
      \bf\songti\zihao{-3}
      \HZNU@label@institute &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@institute}}
    \\
      %专业
      \bf\songti\zihao{-3}
      \HZNU@label@major &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@major}}
    \\
      %班级
      \bf\songti\zihao{-3}
      \HZNU@label@class &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@class}}
    \\
      %学生姓名～学号
      \bf\songti\zihao{-3}
      \HZNU@label@author &
      \HZNUunderline[100pt]{\HZNU@value@author}&
      \bf\songti\zihao{-3}
      \HZNU@label@id &
      \HZNUunderline[150pt]{\HZNU@value@id}
    \\
      %指导老师～职称
      \bf\songti\zihao{-3}
      \HZNU@label@advisor&
      \HZNUunderline[100pt]{\HZNU@value@advisor}&
      \bf\songti\zihao{-3}
      \HZNU@label@advisortitles&
      \HZNUunderline[150pt]{\HZNU@value@advisortitles}
    \\
      %完成时间
      \bf\songti\zihao{-3}
      \HZNU@label@submitdate &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@submitdate}}
    \\
      %答辩时间
      \bf\songti\zihao{-3}
      \HZNU@label@defenddate &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@defenddate}}
    \\
      %成绩
      \bf\songti\zihao{-3}
      \HZNU@label@score &
      \multicolumn{3}{c}{\HZNUunderline[320pt]{\HZNU@value@score}}
    \\
      %\HZNU@label@degree &
      %\HZNUunderline[80pt]{\HZNU@value@degree} & \hspace{5pt} &
    \\
      %\HZNU@label@school &
      %\multicolumn{4}{l}{\HZNUunderline[299pt]{\HZNU@value@school}}
    \\

    \end{tabular}
  \end{center}
  \clearpage
}
%-
%-> English item commands
%-
\newcommand\englishtitle[1]{\def\HZNU@value@englishtitle{#1}}
%\newcommand\Author[1]{\def\HZNU@value@Author{#1}}
%\newcommand\Major[1]{\def\HZNU@value@Major{#1}}
%\newcommand\Advisor[1]{\def\HZNU@value@Advisor{#1}}

%-
%-> Redefine English style
%-
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{60pt}
    %论文题目
      \sf\heiti\zihao{2} \textbf{\HZNU@value@title}
    \\
    %论文英文题目
    \vspace*{50pt}
      \Large\textbf{\HZNU@value@englishtitle}
    \\
    \vspace*{80pt}
    \bf\songti\zihao{3}
    \def\tabcolsep{10pt}
    \def\arraystretch{1.5}
    \begin{tabular}{ll}
    %学院
      \textbf{\HZNU@label@institute}：
      \textbf\HZNU@value@institute
    \\
    %专业
      \textbf{\HZNU@label@major}： 
      \textbf\HZNU@value@major
    \\
    %班级
      \textbf{\HZNU@label@class}：
      \textbf\HZNU@value@class
    \\
    %学号
      \textbf{\HZNU@label@id}：
      \textbf{\HZNU@value@id}
    \\
    %学生姓名
      \textbf{\HZNU@label@author}：
      \textbf\HZNU@value@author
    \\
    %指导老师
      \textbf{\HZNU@label@advisor}： 
      \textbf\HZNU@value@advisor

    \\
    \end{tabular}
  \end{center}

  \begin{center}
      \vspace*{40pt}
      \bf\songti\zihao{-3}
      %完成时间
      %\textit\HZNU@label@submitdate：
      \textbf~\HZNU@value@submitdate
  \end{center}

  \clearpage
}
%---------------------------------------------------------------------------%
%->> Author's declaration
%---------------------------------------------------------------------------%
\newcommand{\makedeclaration}{%
    \cleardoublepage
    \thispagestyle{empty}
    {
        \linespread{1.5}
        \zihao{-5}

        \vspace*{2ex}

        \begin{center}
            {\zihao{5}\bfseries\sffamily \HZNU@value@declare@create}
        \end{center}

        {\HZNU@value@declare@creativity}

        \vspace*{3ex}

        {\hfill{} {\HZNU@value@declare@s \hspace*{14em}}}

        {\hfill{} {\HZNU@value@declare@d \hspace*{14em}}}

        \vspace*{6ex}

        \begin{center}
            {\zihao{5}\bfseries\sffamily \HZNU@value@declare@right}
        \end{center}

        {\HZNU@value@declare@rights}

        {\HZNU@value@declare@rule}

        \vspace*{3ex}

        {\hfill{} {\HZNU@value@declare@s \hspace*{10em} \HZNU@value@declare@t \hspace*{9em}}}

        {\hfill{} {\HZNU@value@declare@d \hspace*{10em} \HZNU@value@declare@d \hspace*{9em}}}

        \vspace*{3ex}
    }
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage[empty]
    \fi
}
%---------------------------------------------------------------------------%
%->> New environments
%---------------------------------------------------------------------------%
%- define chinese abstract
%\newcommand{\abstract}[1]{%
%    \centerline\HZNU@label@abstract}
\newcommand{\Abstract}[1]{%
    \zihao{5}{\itshape#1 } }
%- define english abstract
%\newcommand{\englishabstract}[1]{%
%    \centerline\HZNU@label@englishabstract}

%- define chinese keywords
\newcommand{\keywords}[1]{%
    \noindent{\bfseries\HZNU@label@keywords}\zihao{5}\textit{#1} }
%- define engish keywords
\newcommand{\englishkeywords}[1]{%
    \noindent{\bfseries\HZNU@label@englishkeywords}#1 }
%---------------------------------------------------------------------------%
%->> Configure table of contents
%---------------------------------------------------------------------------%
%- define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{1ex}% spacing between chapter titles
%- redefine dottedtocline from classes.dtx and latex.ltx
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode \zihao{-4}\sffamily
        \@tempdima #3\relax
        \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par\penalty\@highpenalty}%
    \fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \zihao{4}\sffamily #1
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi
}
%- redefine l@chapter from book.cls to add dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip \@chaptervspace \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \zihao{4}\sffamily
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi
}
%---------------------------------------------------------------------------%
\endinput

