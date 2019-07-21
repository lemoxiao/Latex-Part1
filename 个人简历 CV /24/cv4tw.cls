%%

\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{cv4tw}[2014/01/19 v0.1 LaTeX CV class, with assets, social networks, and customizable styles]
\RequirePackage{newenviron}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
%\RequirePackage{navigator}
\RequirePackage{graphicx}
\RequirePackage{xstring}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[hidelinks]{hyperref}
%\RequirePackage{refcount}

%
% Quick and Dirty key values commands
%
\newcommand*{\qdprefix}{qd=}
\newcommand*{\qdsetlength}[3]{
	\expandafter\let\csname \qdprefix#2#1length\endcsname=\relax
	\expandafter\def\csname \qdprefix#2#1length\endcsname{#3}
}

\newcommand*{\qdapplylength}[2]{
	\ifcsname \qdprefix#2#1length\endcsname
	\expandafter\setlength{\csname #2\endcsname}{\csname \qdprefix#2#1length\endcsname}
	\else
	\errmessage Warning : #1 not found
	\fi
}

\newcommand*{\qdgetlength}[2]{
	\ifcsname \qdprefix#2#1length\endcsname
	\expandafter\csname \qdprefix#2#1length\endcsname
	\else
	\errmessage Warning : #1 not found
	\fi
}

\newcommand*{\qdset}[2]{
	\expandafter\let\csname \qdprefix#1\endcsname=\relax
	\expandafter\def\csname \qdprefix#1\endcsname{#2}
}
\newcommand*{\qdif}[3]{\expandafter\ifcsname \qdprefix#1\endcsname#2\else#3\fi}
\newcommand*{\qdget}[1]{\ifcsname \qdprefix#1\endcsname\expandafter\csname \qdprefix#1\endcsname\else\errmessage Warning : #1 not found\fi}
\newcommand*{\qdgetunsafe}[1]{\expandafter\csname \qdprefix#1\endcsname}
\newcommand*{\qdlink}[3]{\protect\href{#1\csname \qdprefix#2\endcsname#3}{\csname \qdprefix#2\endcsname}}

%\title{}
\newcommand*{\cvpicture}[1]{
	\def\@cvpicture{#1}
}
\newcommand*{\academictitle}[1]{
	\def\@cvacademictitle{#1}
}
\renewcommand*{\title}[1]{
	\def\@cvtitle{#1}
}
\renewcommand*{\quote}[1]{
	\def\@cvquote{#1}
}
\newcommand*{\firstname}[1]{
	\def\@cvfirstname{#1}
}
\newcommand*{\lastname}[1]{
	\def\@cvlastname{#1}
}
\newcommand*{\usetheme}[2][]{
	%Load scheme if asked
	\RequirePackage[#1]{cv4tw-scheme}
	%Apply theme
	\RequirePackage[]{cv4tw-theme-core}
	\RequirePackage[]{cv4tw-theme-#2}
}

\newcommand*{\setmystyle}[2][]{\expandafter\qdset{mystyle#1}{#2}}
\newcommand*{\mystyle}[1][]{\ignorespaces\qdget{mystyle#1}}
\newcommand*{\setmylength}[3][]{\expandafter\qdsetlength{#1}{#2}{#3}}
%\newcommand*{\getmylength}[2][]{\expandafter\qdgetlength{#1}{#2}}
%\newcommand*{\applymylength}[2][]{\ignorespaces\qdapplylength{#1}{#2}}
\raggedbottom
\onecolumn
\pagestyle{empty}

\newcommand*{\setcvasset}[2][]{\expandafter\qdset{cvasset#1}{#2}}
\newcommand*{\cvasset}[1][]{\qdget{cvasset#1}}
\newcommand*{\ifcvasset}[3][]{\qdif{cvasset#1}{#2}{#3}}
\newcommand*{\setcvcontact}[2][]{\expandafter\qdset{cvcontact#1}{#2}}
\newcommand*{\cvcontact}[1][]{\qdget{cvcontact#1}}
\newcommand*{\cvcontactlink}[1]{
\IfEqCase{#1}{
{email}{ \qdlink{mailto:}{cvcontact#1}{}}%
{homepage}{ \qdlink{http://}{cvcontact#1}{}}%
{homepagessl}{ \qdlink{http://}{cvcontact#1}{}}%
{customhomepage}{ \qdlink{}{cvcontact#1}{}}%
{vk}{ \qdlink{http://www.vk.com/}{cvcontact#1}{}}%
{pinterest}{ \qdlink{http://www.pinterest.com/}{cvcontact#1}{}}%
{linkedin}{ \qdlink{https://www.linkedin.com/in/}{cvcontact#1}{}}%
{twitter}{ \qdlink{https://www.twitter.com/}{cvcontact#1}{}}%
{github}{ \qdlink{https://www.github.com/}{cvcontact#1}{}}%
{facebook}{ \qdlink{https://www.facebook.com/}{cvcontact#1}{}}%
{googleplus}{ \qdlink{https://plus.google.com/}{cvcontact#1}{}}%
}[{\qdget{cvcontact#1}}]
}
\newcommand*{\ifcvcontact}[3][]{\qdif{cvcontact#1}{#2}{#3}}

\newcounter{assets}
\setcounter{assets}{1}

% Abstract commands, to be renew in theme package
%
\renewcommand*{\maketitle}[1]{ }
\renewcommand*{\section}[1]{ }
\renewcommand*{\subsection}[1]{ }
\newcommand*{\story}[5]{ }
\newcommand*{\renderasset}{ }
\newcommand*{\renderassetifdefined}{ }
\newcommand*{\rendercontact}{ }
\newcommand*{\rendercontactifdefined}{ }

\newenvironment{missions}{ }{ }
\newenvironment{skills}[1]{ }{ }

\makeatletter
\newcommand{\colorletifnotdef}[2]{%
  \@ifundefined{\string\color@#1}{\colorlet{#1}{#2}}{}}
\newcommand{\definecolorifnotdef}[3]{%
  \@ifundefined{\string\color@#1}{\definecolor{#1}{#2}{#3}}{}}
\makeatother



\endinput
