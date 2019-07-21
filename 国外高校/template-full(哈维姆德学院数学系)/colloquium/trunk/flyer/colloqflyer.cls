% \iffalse meta-comment
%
% Copyright (C) 2009 Claire M. Connelly and the 
% Department of Mathematics, Harvey Mudd College
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
% USA
%
% Contact: Claire M. Connelly <cmc@math.hmc.edu>
%          Department of Mathematics
%          Harvey Mudd College
%          1250 N Dartmouth Ave
%          Claremont, CA 91711
%          (909) 621-8754
% 
% \fi
%%
%% LaTeX class file for typesetting colloquium announcement flyers.
%%
%% $Id: colloqflyer.cls 307 2009-12-18 19:26:52Z cmc $
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{colloqflyer}[2009/01/20 LaTeX class for colloquium flyers]

\newif\if@coffee
\newif\if@dinner
\DeclareOption{coffee}{\@coffeetrue}
\DeclareOption{dinner}{\@dinnertrue}
\DeclareOption{nocoffee}{\@coffeefalse}
\DeclareOption{nodinner}{\@dinnerfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{coffee,dinner}
\ProcessOptions\relax
\LoadClass[12pt,oneside]{article}

\RequirePackage{url}
\RequirePackage{avant}
\renewcommand{\rmdefault}{pag}  % Use Avant Garde as the roman font.
\RequirePackage{soul}
\RequirePackage{eso-pic}
\RequirePackage{graphics}
\RequirePackage{microtype}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage[%
  text={6in,9.5in},
  left=2in]{geometry}
\RequirePackage{xspace}
\RequirePackage{color}
\RequirePackage{ifthen}

%%% Tinker with margins and such -- this is a flyer, not a multipage
%%% document, after all.

\setlength{\parindent}{0in}
\setlength{\parskip}{1ex}


%%% Handle the background image.
\newcommand\BackgroundPicture[1]{%
  \setlength{\unitlength}{1pt}%
  \put(0,\strip@pt\paperheight){%
  \parbox[t][\paperheight]{\paperwidth}{%
    \vspace{0pt}%
    \includegraphics{#1}
  }
}} %

\AtBeginDocument{\AddToShipoutPicture{%
    \BackgroundPicture{ccms-flyer-bg}%
    \ClearShipoutPicture}%
}


%%% Define some useful commands.

\renewcommand{\pm}{\textsc{p.m.}\xspace}
\newcommand{\am}{\textsc{a.m.}\xspace}
% \newcommand{\linesep}{\vspace{1em}\hrulefill\vspace{1em}}
% \newcommand{\linefill}{\vfill{}\vspace{1em}\hrulefill\vspace{1em}\vfill{}}


%%% Define some booleans.
\newboolean{have@phone}
\newboolean{have@email}


%%% Define some additional informational fields.

\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\newcommand{\@abstract}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\abstract given}}
\newcommand{\colloqsite}[1]{\gdef\@colloqsite{\begingroup\nobreak\indent\ttfamily#1\endgroup}}
\newcommand{\@colloqsite}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\colloqsite given}} 


\newcommand{\speaker}[1]{\gdef\@speaker{#1}}
\newcommand{\@speaker}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\speaker given}}
\newcommand{\speakerorg}[1]{\gdef\@speakerorg{#1}}
\newcommand{\@speakerorg}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\speakerorg given}}
\newcommand{\talktime}[1]{\gdef\@talktime{#1}}
\newcommand{\@talktime}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\talktime given}}
\newcommand{\talklocation}[1]{\gdef\@talklocation{#1}}
\newcommand{\@talklocation}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\talklocation given}}
\newcommand{\refreshmenttime}[1]{\gdef\@refreshmenttime{#1}}
\newcommand{\@refreshmenttime}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\refreshmenttime given}}
\newcommand{\refreshmentlocation}[1]{\gdef\@refreshmentlocation{#1}}
\newcommand{\@refreshmentlocation}{ClassWarningNoLine{colloqflyer}{No
    \noexpand\refreshmentlocation given}}
\newcommand{\host}[1]{\gdef\@host{#1}}
\newcommand{\@host}{ClassWarningNoLine{colloqflyer}{No \noexpand\host
    given}}
\newcommand{\hostphone}[1]{\setboolean{have@phone}{true}%
  \gdef\@hostphone{#1}}
\newcommand{\@hostphone}{\ClassWarningNoLine{colloqflyer}{No
    \noexpand\hostphone given}}
\newcommand{\hostemail}[1]{\setboolean{have@email}{true}%
  \gdef\@hostemail{\begingroup\nobreak\indent\ttfamily\upshape#1\endgroup}}
\newcommand{\@hostemail}{\ClassWarningNoLine{colloqflyer}{No
    \noexpand\hostemail given}}


%%% Throw errors if we don't have either an e-mail address or a
%%% telephone number for the host.
\AtBeginDocument{%
  \ifthenelse{\boolean{have@email}}{}{%
    \ifthenelse{\boolean{have@phone}}{}{%
      \ClassError{colloqflyer}{%
        Neither \noexpand\hostphone nor \noexpand\hostemail was
        defined}{%
        One or both of \noexpand\hostphone and \noexpand\hostemail
        must be defined to typeset the flyer}}}}


%%% Typeset the flyer itself.

\newcommand{\flyer}{%
\pagestyle{empty}


{\raggedright\Huge\textsc{\@title}\par}

\vspace{0.5in}
\begin{flushright}
  {\Large \@speaker\par} 
  {\large \@speakerorg{}\par}
\end{flushright}
\vfill{}

\@abstract{}

\vfill{}

{\Large \@date{}, at \@talktime{}\\
\@talklocation{}\par}

\vfill{}

\if@coffee
Coffee \& cookies at \@refreshmenttime{}\\
% Wine and cheese after the talk.\\
\@refreshmentlocation.

\vfill{}
\fi

\if@dinner
\begin{em}
  The dinner will be hosted by \@host{}.\\
  If interested in attending%
  \ifthenelse{\boolean{have@phone} \OR \boolean{have@email}}{, }{}%
  \ifthenelse{\boolean{have@phone}}{call \@hostphone}{}%
  \ifthenelse{\boolean{have@phone} \AND \boolean{have@email}}{ or }{}%
  \ifthenelse{\boolean{have@email}}{e-mail \@hostemail}{}%
.\par
\end{em}

\vfill{}
\fi

For Math Colloquium information, visit the website\\
\@colloqsite



\global\let\author\relax
\global\let\date\relax
\global\let\title\relax
\global\let\speaker\relax
\global\let\talktime\relax
\global\let\talklocation\relax
\global\let\refreshmenttime\relax
\global\let\refreshmentlocation\relax
\global\let\host\relax
\global\let\hostphone\relax
\global\let\hostemail\relax
\global\let\colloqsite\relax
\global\let\@author\relax
\global\let\@date\relax
\global\let\@title\relax
\global\let\@speaker\relax
\global\let\@talktime\relax
\global\let\@talklocation\relax
\global\let\@refreshmenttime\relax
\global\let\@refreshmentlocation\relax
\global\let\@host\relax
\global\let\@hostphone\relax
\global\let\@hostemail\relax
\global\let\@colloqsite\relax

}                               % End of \flyer command.


\definecolor{grey}{gray}{.75}

% \DeclareRobustCommand{\@backgroundimage}{%
% \begin{minipage}{6in}
% \includegraphics[scale=4]{sphere_cmc}
% Let's add some text for debugging purposes.
% \end{minipage}
% }

% \newcommand{\ps@firstpage}{%
%    \renewcommand{\@oddhead}{{\@backgroundimage}}%
% }

%%% End of class definition.
\endinput
