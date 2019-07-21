%===============================================================================
% INTRODUCTION
%===============================================================================

\NeedsTeXFormat{LaTeX2e}  % document version
\ProvidesClass{gironslopez-cv}
\LoadClass[a4paper]{article}  % base class

%-------------------------------------------------------------------------------
% Create switches

\newif\ifswedish
\newif\ifacademic
\newif\ifpicture

%===============================================================================
% PACKAGES
%===============================================================================

%-------------------------------------------------------------------------------
% page structure

\RequirePackage[
    hmargin = 2.50cm,
    vmargin = 2.50cm
]{geometry}

\RequirePackage[
    absolute
]{textpos}

\RequirePackage{titlesec}

\RequirePackage{parskip}

%-------------------------------------------------------------------------------
% hyperlinks

\RequirePackage[
    colorlinks = true
]{hyperref}

%-------------------------------------------------------------------------------
% Language

\RequirePackage[
    swedish,
    english
]{isodate}

\RequirePackage[
    swedish,
    english
]{babel}

%-------------------------------------------------------------------------------
% Color

\RequirePackage[
    usenames,
    dvipsnames
]{xcolor}

%-------------------------------------------------------------------------------
% Fonts

\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}

%-------------------------------------------------------------------------------
% Images

\RequirePackage{graphicx}

%-------------------------------------------------------------------------------
% References

\RequirePackage{xpatch}
\RequirePackage[
    backend    = biber,
    style      = authoryear,
    sorting    = ydnt,
    dashed     = false,
    maxnames   = 10,
    url        = false,
    doi        = true,
    eprint     = false,
    firstinits = true
]{biblatex}
\addbibresource{pub/publications.bib}
\DeclareNameAlias{sortname}{family-given}

%===============================================================================
% DEFINITIONS
%===============================================================================

%-------------------------------------------------------------------------------
% Text and paragraph formatting

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

\linespread{1.1}

\titlespacing{\section}{0pt}{12pt}{0pt}
\titlespacing{\subsection}{0pt}{6pt}{0pt}

%-------------------------------------------------------------------------------
% Color

\definecolor{focus}{HTML}{4183C4}
\definecolor{text}{HTML}{1C1C1C}
\hypersetup{urlcolor = focus}

%-------------------------------------------------------------------------------
% Fonts

\setmainfont[
    Path        = fonts/Raleway/,
    UprightFont = *-Light,
    ItalicFont  = *-LightItalic,
    BoldFont    = *-SemiBold
]{Raleway}

\setsansfont[
    Path        = fonts/Lato/,
    UprightFont = *-Hairline,
    ItalicFont  = *-Light,  % Dirty hack to easily use Lato-Light if ItalicFont is not needed
    BoldFont    = *-Regular
]{Lato}

%===============================================================================
% COMMANDS
%===============================================================================

%-------------------------------------------------------------------------------
% Last modification date

\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}

\newcommand{\lastupdated}{
    \begin{textblock}{60}(155,5)
        \color{Gray}
        \fontsize{8pt}{10pt}
        \mdseries
        \ifswedish
            \selectlanguage{swedish}
            \selectfont Senast uppdaterad den \today
        \else
            \selectfont Last Updated on \today
        \fi
    \end{textblock}
}

%-------------------------------------------------------------------------------
% Section

\titleformat{\section}{
    \color{focus}
    \sffamily
    \scshape
    \bfseries
    \fontsize{18pt}{20pt}
    \selectfont
    \raggedright
}{}{0em}{}

%-------------------------------------------------------------------------------
% Subsection

\titleformat{\subsection}{
    \color{Gray}
    \sffamily
    \scshape
    \bfseries
    \fontsize{14pt}{16pt}
    \selectfont
    \raggedright
}{}{0em}{}

%-------------------------------------------------------------------------------
% Times

\newcommand{\when}[1]{
    \color{text}
    \mdseries
    \itshape
    \selectfont #1
}

%-------------------------------------------------------------------------------
% Titles

\newcommand{\where}[1]{
    \color{Gray}
    \mdseries
    \selectfont #1
}

\newcommand{\what}[1]{
    \bfseries
    \color{focus}
    \selectfont #1
}

%-------------------------------------------------------------------------------
% Highlighted text

\newcommand{\main}[1]{
    \bfseries
    \color{text}
    \selectfont #1
}

%-------------------------------------------------------------------------------
% Normal text (descriptions)

\newcommand{\descript}[1]{
	\color{text}
    \mdseries
    \selectfont #1
}

\newcommand{\italicdescript}[1]{
    \itshape
    \mdseries
    \color{text}
    \selectfont #1
}

\newcommand{\focusdescript}[1]{
    \color{focus}
    \mdseries
    \selectfont #1
}

%-------------------------------------------------------------------------------
% Name information

\newcommand{\name}[2]{
    \centering{
        \fontsize{36pt}{40pt}
        \color{text}
        \sffamily
        \mdseries
        \selectfont #1
        \color{focus}
        \sffamily
        \itshape  % in this context it represents Lato-Light
        \selectfont #2
    }
}

%-------------------------------------------------------------------------------
% Contact information

\newcommand{\contact}[8]{
    \centering{
        \begin{tabular}{r l r l}
            \main{\ifswedish Adress \else Address \fi} & \descript{#1} &
            \main{\ifswedish Hemsida \else Website \fi} & \descript{#5} \\

            & \descript{#2} &
            \main{\ifswedish Telefon \else Telephone \fi} & \descript{#6} \\

            \main{\ifswedish Födelse \else Birth \fi} & \descript{#3} &
            \main{\ifswedish E-post \else E-mail \fi} & \descript{#7} \\

            & \descript{#4}
            & \main{\ifswedish Medborgarskap \else Citizenship \fi} & \descript{#8} \\
        \end{tabular}
    }
}

%-------------------------------------------------------------------------------
% CV items

\newcommand{\position}[4]{
    \begin{tabular}{p{0.22\textwidth} p{0.75\textwidth}}
        \when{#1} & \what{#2} \descript{•} \where{#3} \newline \descript{#4}
    \end{tabular}\\[-2mm]
}

\newcommand{\shortposition}[3]{
	\begin{tabular}{p{0.22\textwidth} p{0.75\textwidth}}
		\when{#1} & \what{#2} \descript{•} \where{#3}
	\end{tabular}\\[-2mm]
}

\newcommand{\skill}[2]{
    \begin{tabular}{p{0.24\textwidth} p{0.70\textwidth}}
        \main{#1} & \descript{#2}
    \end{tabular}\\[-2mm]
}

\newcommand{\languages}[4]{
    \begin{tabular}{p{0.24\textwidth} p{0.70\textwidth}}
        \main{\ifswedish Språk \else Languages \fi}
        & \what{\ifswedish Modersmål \else Native \fi} \descript{#1} \\[-2mm]
        & \what{\ifswedish Avancerad \else Full professional proficiency \fi} \descript{#2} \\[-2mm]
        & \what{\ifswedish Självständig \else Professional working proficiency \fi} \descript{#3} \\[-2mm]
        & \what{\ifswedish Nybörjare \else Elementary proficiency \fi} \descript{#4}
    \end{tabular}\\[-2mm]
}

%-------------------------------------------------------------------------------
% Separators

\newcommand{\sectionsep}{\vspace{6pt}}

\newcommand{\sectionline}{
    \color{focus}
    \vspace{6pt}
    \makebox[\linewidth]{
        \rule{\textwidth}{0.5pt}
    }
}

%===============================================================================
% BIBLIOGRAPHY - Use bold face for my name
%===============================================================================
% Approach by user "moewe" in Stack Exchange
% https://tex.stackexchange.com/questions/274436/highlight-an-author-in-bibliography-using-biblatex-allowing-bibliography-style-t

\newbibmacro*{name:bold}[2]{%
    \def\do##1{\iffieldequalstr{hash}{##1}{\bfseries\listbreak}{}}%
    \dolistloop{\boldnames}%
}

\newcommand*{\boldnames}{}

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

\renewcommand*{\boldnames}{}
\forcsvlist{\listadd\boldnames}
    {{0a357bfd857161ef8a274bd045039923}}
