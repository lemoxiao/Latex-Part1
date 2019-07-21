% \iffalse meta-comment
%
% Copyright (C) 2003
%
% Claire Connelly <cmc@math.hmc.edu>
%              and 
% Melissa O'Neill <oneill@cs.hmc.edu>
%
% Written for Harvey Mudd College's
%
%   Department of Computer Science
%   Department of Mathematics
%
% License:
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
% \fi
%%
%% Harvey Mudd College Clinic Report LaTeX class file.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newclinic}[2003/04/30 HMC Clinic Report class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %% <-- Change this if we decide to declare some
                      %%     options for this class!
\LoadClass[11pt,openright]{book}

%%% Get some useful information when errors occur.
\setcounter{errorcontextlines}{25}


%%% Load some required/very useful packages.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{bbold}
\RequirePackage{xspace}
\RequirePackage{verbatim}
\RequirePackage{booktabs}
\RequirePackage{ifthen}
\RequirePackage{graphics}

%%% Set the default typeface via a package.
\RequirePackage{palatino}

%%% Define some environments.
\newenvironment{abstract}{\chapter*{Abstract}}{}

\newenvironment{acknowledgments}{\chapter*{Acknowledgments}}{}



%%% Define the layout of the title page.



  \renewcommand\maketitle{\begin{titlepage}%
      \let\footnotesize\small
      \let\footnoterule\relax
                                %  \let \footnote \thanks
      \let\thanks\ignoreit
      \parindent0pt
      \null\vfil
      {\large \scalebox{0.55}{\includegraphics{hmclogo-color}} \\[0.5ex]%
                                % Harvey Mudd College\\[0.5ex]%
        \@department\par}%
      \vskip 60\p@
      {\large \@reporttype{} for \\[0.5ex]%
        \emph{\@sponsor}}
      \vskip 60\p@
                                %\begin{center}%
      {\LARGE \noindent\@title \par}%
      \vskip 3em%
      {\large \@date \par}%       % Set date in \large size.
      \vskip 3em%
      {\large
        \lineskip .75em%
        \let\and\par
        \textbf{Team Members} \\[0.5ex]
        \begin{tabular}[t]{l}%
          \global\let\and\\%
          \@author
        \end{tabular}%
        \par}%
      \vskip 1.5em%
      {\large
        \lineskip .75em%
        \textbf{Advisor} \\[0.5ex]
      \begin{tabular}[t]{c}%
        \@advisor
      \end{tabular}\par}%
    \vskip 1.5em%
    {\large
      \lineskip .75em%
      \textbf{Liaison} \\[0.5ex]
      \begin{tabular}[t]{c}%
        \@liaison
      \end{tabular}\par}%
    \vskip 1.5em%
                                %\end{center}
                                %\par
    \@thanks
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%%% Define some commands for specifying information for the title page
%%%  (and other parts of the document).

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\sponsor#1{\gdef\@sponsor{#1}}
\def\@sponsor{\@latex@warning@no@line{No \noexpand\sponsor given}}
\def\liaison#1{\gdef\@liaison{#1}}
\def\@liaison{\@latex@warning@no@line{No \noexpand\liaison given}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\consultant#1{\gdef\@consultant{#1}}
\def\@consultant{}
\newcommand{\reporttype}{WOW}
\def\reporttype#1{\gdef\@reporttype{#1}}
\def\@reporttype{\@latex@warning@no@line{No \noexpand\reporttype given}}



%%% Print only the chapter and section number in the Table of Contents.

\setcounter{tocdepth}{1}

%%% metafont font.  If logo not available, use the second form
%%%
%%% \font\mffont=logosl10 scaled\magstep1
\let\mffont=\sf

