% \iffalse meta-comment
%
% 
%   stprop.cls -- A LaTeX class for writing senior thesis proposals

%   Copyright (C) 2003-2010  Department of Mathematics, Harvey
%   Mudd College.
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
%% stprop class file
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stprop}[2010/08/23 Senior Thesis Proposal Class, version 3.4]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax %% <-- fix if we decide to declare some options!
\LoadClass[11pt]{article}


%% Get some useful information about errors.
\setcounter{errorcontextlines}{25}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{lastpage}
\RequirePackage{bbold}
\RequirePackage{xspace}
\RequirePackage{verbatim}
\RequirePackage{booktabs}
\RequirePackage{ifthen}

%%% Set the default typeface via a package.
\RequirePackage[T1]{fontenc}
\RequirePackage{mathpazo}
\RequirePackage[scaled=.90]{helvet}

%%% Use Latin Modern Typewriter as the monospace typeface.
\renewcommand{\ttdefault}{lmtt}




%%% Define a command for the advisor's name.
\newcommand{\@advisor}[1]{}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\global\let\@advisor\relax


\renewcommand{\@maketitle}{%
  \newpage
  \vspace*{-1in}
  \noindent Harvey Mudd College   \hfill  Senior Thesis\par
  \noindent Mathematics           \hfill  \@date\par
  \begin{center}%
    \let \footnote \thanks
    {\LARGE \textbf{Research Proposal:\\\@title} \par}%
    \bigskip
    {\large \@author}\par
    \bigskip
    {\large Faculty Advisor: \@advisor}
  \end{center}%
  \thispagestyle{empty}
}

\endinput
  \begin{center}%
    \end{center}%
  }
}

