\ProvidesClass{resume}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{xifthen}
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage{parskip}
\RequirePackage[hidelinks,unicode]{hyperref}

\RequirePackage{graphicx}
\graphicspath{{logos/}}

%
% Document-wide configuration
%

\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=1.5cm, footskip=.5cm}
\pagestyle{fancy}
\pagenumbering{gobble}
\renewcommand{\headrulewidth}{0pt}

\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir
\newfontfamily\FA[Path=\@fontdir]{FontAwesome}
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{222222}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}

%
% CV header
%

\newcommand*{\headernamestyle}[1]{{\fontsize{38pt}{1em}\headerfont\color{darkgray} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{9.5pt}{1em}\headerfont\bfseries\color{gray} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{17pt}{1em}\bodyfont\bfseries\color{darkgray} #1}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{darkgray} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{11pt}{1em}\bodyfont\scshape\color{darkgray} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\slshape\color{gray} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{11pt}{1em}\bodyfont\color{darkgray} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{12pt}{1.2em}\bodyfontlight\color{darkgray} #1}}

\newcommand{\HeaderIconSep}{\enspace}
\newcommand{\HeaderSocialSep}{\quad}

\newcommand*{\makecvheader}{
  \newlength{\headertextwidth}
  \setlength{\headertextwidth}{\textwidth}
  \begin{minipage}[c]{\headertextwidth}
    \centering
    \headernamestyle{\name}\\[4mm]
    \headersocialstyle{
      \faMobile\HeaderIconSep\mobile
      \HeaderSocialSep\href{mailto:\email}{\faEnvelopeO\HeaderIconSep\email}
      \HeaderSocialSep\href{https://\homepage}{\faLink\HeaderIconSep\homepage}
      \HeaderSocialSep\href{https://github.com/\github}{\faGithub\HeaderIconSep\github}
      \HeaderSocialSep\href{https://www.linkedin.com/in/\linkedin}{\faLinkedin\HeaderIconSep\linkedin}
    }
  \end{minipage}\\[4mm]

}

%
% CV entries
%

\newcommand{\keyword}[1]{\textcolor{theme}{\textbf{#1}}}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newcommand{\cvsection}[1]{
  \vspace{3mm}
  \sectionstyle{#1}
}

\newenvironment{cventries}{
  \vspace{2mm}
  \color{lightgray}\hrule
}

% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}{<bullets as cvitems environment>}
\newcommand*{\cventry}[6]{
  \vspace{0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#2} & \entrylocationstyle{#3} \\ \entrypositionstyle{#1} & \entrydatestyle{#4} \\
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}} \\
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#6}}
  \end{tabular*}
}

% Below 3 commands are quick hacks for now, don't feel like making default arguments + logical omit (ifthenelse) for cventry command.
\newcommand*{\cventryEdu}[4]{
  \vspace{0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#2} & \entrylocationstyle{#3} \\ \entrypositionstyle{#1} & \entrydatestyle{#4}
  \end{tabular*}
}

\newcommand*{\cventryNoBullets}[5]{
  \vspace{2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#2} & \entrylocationstyle{#3} \\ \entrypositionstyle{#1} & \entrydatestyle{#4} \\ \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}
}

\newcommand*{\cventryProject}[3]{
  \vspace{2mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{12.5cm} R{4.5cm}}
    \entrytitlestyle{#1} & \entrydatestyle{#2} \\ \multicolumn{2}{L{17cm}}{\descriptionstyle{#3}} \\
  \end{tabular*}
}

\newenvironment{cvitems}{
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{3pt}
    \renewcommand{\labelitemi}{\bullet}
}{
  \end{itemize}
  \end{justify}
  \vspace{-3.0mm}
}
