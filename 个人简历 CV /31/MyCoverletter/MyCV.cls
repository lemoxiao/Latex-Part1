% BEGIN OF CLASS MyCV
% COPYRIGHT BENEDICT KAISER
% The Design was inspired by posquit0's awesome-cv class:
% https://github.com/posquit0/Awesome-CV

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{MyCV}[2016/01/30 v1.5 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% Has to be done before loading 3rd party packages.
% Also: Inherit arguments from LaTeX's article class.
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
% Inherit from article class
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Provide flexibility for tables with fixed width
\RequirePackage{array}
% Needed to handle text alignment
\RequirePackage{ragged2e}
%Change page layout
\RequirePackage[
	%showframe=true
	]{geometry}
% Requiered for the header
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage[table]{xcolor}
% Manages fonts
\RequirePackage[quiet]{fontspec}
% For Latex quoting style
\defaultfontfeatures{Ligatures=TeX}
% Manages math fonts
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% FontAwesome: Provides the little symbols
\RequirePackage{fontawesome}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed for table placement
\RequirePackage{float}

% For hyperlinks
\RequirePackage[hidelinks]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Global variables and new commands
%-------------------------------------------------------------------------------
% Define a P type column that is a p type with centered text
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

% Set a short command for \newline, usful for manual line breaks
% in tables.
\newcommand{\nl}{\newline}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% This is only to be used, when the fonts are NOT installed on the system, but
% are only located in some folder.
% Configure a directory location for fonts(default: 'fonts/')
%\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
%\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{lightgray}{HTML}{E6E6E6}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{darkCerulean}{HTML}{0B5394}



%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  %Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
 % Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

% Set font for footer (default is Source Sans Pro)
\newfontfamily\footerfont[
 % Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold
]{SourceSansPro}

% Set font for body (default is Source Sans Pro)
\newfontfamily\bodyfont[
  %Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}

%\newfontfamily\bodyfontlight[
% % Path=\@fontdir,
%  UprightFont=*-Light,
%  ItalicFont=*-LightIt,
%  BoldFont=*-Semibold,
%  BoldItalicFont=*-SemiboldIt
%]{SourceSansPro}

\newfontfamily\themainfont[
  %Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]{SourceSansPro}

% Set main font
\setmainfont[
  %Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]{SourceSansPro}

% Create bold variations of some of the fonts
\newcommand{\boldBody}{\bf\bodyfont}
\newcommand{\headerfontbold}{\bf\headerfont}

% Define a new fontsize \HUGE for the header
\makeatletter
	\newcommand\HUGE{\@setfontsize\Huge{30}{47}} 
\makeatother

%-------------------------------------------------------------------------------
%                Configure the custom section style
%-------------------------------------------------------------------------------
% usage: \cvSection{Personal skills}

% Define the style
\newcommand{\cvSectionStyle}[1]{
	\begingroup
		\Large
		\bodyfont
		\bfseries
		\textcolor{black}{
			{#1}
		}
	\endgroup
}

% Define the command, apply the style
\newcommand{\cvSection}[1]{
	\phantomsection
	\cvSectionStyle{#1}
	\textcolor{black}{
	\hrulefill
	\hspace*{-5pt}
	\small
		\raisebox{0.715pt}{\faStop}
	}
	\vspace*{10pt}
}




