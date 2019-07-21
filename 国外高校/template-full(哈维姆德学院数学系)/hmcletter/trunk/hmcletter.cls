% \iffalse meta-comment
%
% 
%   hmcletter.cls -- A LaTeX class to produce letters using HMC letterhead.
%   Copyright (C) 2010 Department of Mathematics, Harvey Mudd College
%
%
%   Based on modifications to the letterhead class written by Claire
%   Connelly for her personal use.
%
%   $Id: hmcletter.cls 331 2010-03-23 22:48:10Z cmc $
%
%   This program is free software; you can redistribute it and/or
%   modify it under the terms of the GNU General Public License as
%   published by the Free Software Foundation; either version 2 of the
%   License, or (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details. 
%
%   You should have received a copy of the GNU General Public License
%   along with this program; if not, write to the Free Software
%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
%   02111-1307  USA 
%
%   The license is also available on the web, from
%      <http://www.gnu.org/copyleft/gpl.html>
%
% \fi
%%
%% hmcletter class file
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hmcletter}[2010/02/15 Letterhead for Harvey Mudd College]
\newif\if@semiblock\@semiblockfalse
\newif\if@ltrhead\@ltrheadtrue

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption{block}
   {\@semiblockfalse}

\DeclareOption{semiblock}
   {\@semiblocktrue}

\DeclareOption{ltrhead}
   {\@ltrheadtrue}

\DeclareOption{noltrhead}
   {\@ltrheadfalse}

\ExecuteOptions{block,ltrhead}
\ProcessOptions
\LoadClass[11pt]{article}
\usepackage[hscale=0.6,vscale=0.8,vmarginratio=4:4]{geometry}

%% Get some useful information about errors.
\setcounter{errorcontextlines}{50}



%% Set up basic fonts.
\RequirePackage{mathpazo}
\RequirePackage[scaled=0.95]{helvet}

%% Load additional packages.
\RequirePackage{ifthen}
\RequirePackage{xspace}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{eso-pic}
\RequirePackage{graphicx}



%% Define some colors.
\definecolor{grey}{gray}{.75}
\definecolor{lightgrey}{gray}{.50}

%\setlength{\parskip}{0.5\baselineskip}

%% User-customizable fields.

%% Defining any of these commands in your LaTeX document will
%% override the values given here.
%%
%% You can also define these commands in a file called
%% hmcletter.cfg that is somewhere in your TEXMF search path.


% Name part for the \cc command.
\newcommand{\ccname}[1]{\gdef\@ccname{#1}}
\newcommand{\@ccname}{cc}

% Name for enclosures.
\newcommand{\enclname}[1]{\gdef\@enclname{#1}}
\newcommand{\@enclname}{Enclosures}

% Name for the \subject command (blank by default).
\newcommand{\subjectname}[1]{\gdef\@subjectname{#1}}
\newcommand{\@subjectname}{}

% Amount to push content on first page down to avoid collision
% with the letterhead.
\newcommand{\ltrheadheightskip}[1]{\gdef\@ltrheadheightskip{#1}}
\newcommand{\@ltrheadheightskip}{4em}

% Background file to use for the letterhead.
\newcommand{\ltrheadbkgrnd}[1]{\gdef\@ltrheadbkgrnd{#1}}
\newcommand{\@ltrheadbkgrnd}{2010-HMC-Math-Letterhead}


%% Define some additional letter-specific commands (some of these will
%%  be based on commands in the letter class):
\newcommand*{\letterto}[1]{\def\@letterto{#1}}


%% Code to add a background image to a page.
\newcommand{\BackgroundPicture}[1]{%
  \setlength{\unitlength}{1pt}%
  \put(0,\strip@pt\paperheight){%
  \parbox[t][\paperheight]{\paperwidth}{%
    \vfill
    \centering\includegraphics{#1}
    \vfill
}}} %

%% Add letterhead image to first page.
\if@ltrhead
\AtBeginDocument{%
  \AddToShipoutPicture{%
    \BackgroundPicture{\@ltrheadbkgrnd}\ClearShipoutPicture}}
\fi


%% Define the indentation for semiblock format.
\newcommand{\@semiblockindent}{0.46\textwidth}


%% Set the opening of the letter.
\newcommand{\opening}[1]{%
  \thispagestyle{empty}%
  \ifx\@ltrheadheightskip\vspace*{4em}\vfill%
  \else\vspace*{\@ltrheadheightskip}\vfill
  \fi

  \ifx\@date\@empty
  \else
    \if@semiblock
      \hspace*{\@semiblockindent}%
    \fi
    \noindent\@date
    \vspace*{1em}\vfill
  \fi

  \ifx\@letterto\@undefined\else
  \noindent\@letterto{}\\[3\medskipamount]%
  \fi%
  \noindent{}#1\\[2\medskipamount]%
  \ifdefined\@subject\noindent{\textbf{\@subjectname}~\@subject}\\[\medskipamount]\fi%
  \nobreak\par\noindent\ignorespaces}


%% Set the closing of the letter.
\newcommand{\closing}[1]{\par\bigskip\noindent
  \if@semiblock
  \hspace*{\@semiblockindent}%
  \fi
  \begin{minipage}{0.54\textwidth}%
    \noindent #1\\
    \ifx\@sigfile\@empty\\[8\medskipamount]%
    \else
    \noindent\@sigfile\\%
    \fi
    \ifdefined\@signature
      \noindent\@signature\\[2\medskipamount]
    \fi
  \end{minipage}%
  \vfill
}

%% Other letter elements.
\newcommand*{\subject}[1]{\def\@subject{#1}}

\newcommand*{\signature}[2][]{%
  \def\@signature{#2}%
  \def\@sigfile{#1}}

\newcommand*{\cc}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\@ccname: }%
    \ignorespaces #1\strut}\par}

\newcommand*{\encl}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\@enclname: }%
    \ignorespaces #1\strut}\par}

\newcommand*{\ps}[2][P.S.]{\medskip{\small\noindent #1 {#2}}}

%%% From article.cls...
%   \def\ps@headings{%
%     \let\@oddfoot\@empty
%     \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
%     \let\@mkboth\markboth
%     \def\sectionmark##1{%
%       \markright {\MakeUppercase{%
%         \ifnum \c@secnumdepth >\m@ne
%           \thesection\quad
%         \fi
%         ##1}}}}

% \newcommand{\ps@firstpage}{%
%    \renewcommand{\@oddhead}{\raggedleft\mbox{\@date}}%
%   \renewcommand{\@oddfoot}{\textcolor{lightgrey}{\@bottomaddress}}%
%   \renewcommand{\@oddfoot}{\@gpgfingerprint}%
% }

%\pagenumbering{arabic}  % but no page numbers are printed because:
%\pagestyle{empty}       % this is actually already in the kernel

% \def\ps@firstpage{%
%      \let\@oddhead\@empty
%      \def\@oddfoot{\raisebox{-45\p@}[\z@]{%
%         \hb@xt@\textwidth{\hspace*{100\p@}%
%           \ifcase \@ptsize\relax
%              \normalsize
%           \or
%              \small
%           \or
%              \footnotesize
%           \fi
%         \fromlocation \hfill \telephonenum}}\hss}}


%% Pull in any configuration options set in a configuration file.
\AtEndOfClass{
  \InputIfFileExists{hmcletter.cfg}{}{}
}
