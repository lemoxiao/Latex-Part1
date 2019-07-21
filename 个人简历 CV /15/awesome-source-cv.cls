%% Copyright 2016 Christophe Roger
%
% Author:
% Christophe Roger (Darwiin)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is M. C. Roger.
%
% Yuefeng Wu made some modification on the work experience and language section.
% Additionally, Yuefeng also added education and project sections.
%
% Zhihao Zhou commented the luatex Chinese support
% Further language support improvement to be done
%
% This work consists of the files awesome-source-cv.cls

\ProvidesClass{awesome-source-cv}[2016/11/05 v1.6 Awesome Source CV Class]

\LoadClass[a4paper]{article}

\DeclareOption{green}{
  \def\@green{green}
}

\DeclareOption{red}{
  \def\@red{red}
}

\DeclareOption{indigo}{
  \def\@indigo{indigo}
}
\DeclareOption{orange}{
  \def\@orange{orange}
}

\DeclareOption{localFont}{
  \def\@local{local}
}

\DeclareOption{alternative}{
  \def\@alternative{alternate}
}

% \DeclareOption{chinese}{
%   \def\@chinese{chinese}
% }

\ProcessOptions

% Dependences
%A Few Useful Packages
\RequirePackage[frenchb]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec}                       % for loading fonts
\RequirePackage{url,parskip}                    % other packages for formatting
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fullpage}
\RequirePackage[margin=1.5cm]{geometry}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{etoolbox}
\RequirePackage{multirow}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}

% \ifdef{\@chinese}{
% 	\RequirePackage{luatexja-fontspec}
% 	\RequirePackage{luatexja}
% }


\DeclareUnicodeCharacter{00E9}{\'{e}}
% Define default accent colors
\definecolor{basecolor}{HTML}{0080FF}       %BLUE

\ifundef{\@green} {
  \ifundef{\@red} {
    \ifundef{\@indigo}{
      \ifundef{\@orange} {}
      { \definecolor{basecolor}{HTML}{e68a00} }
    }
    { \definecolor{basecolor}{rgb}{0.2, 0.07, 0.48} }
  }
  { \definecolor{basecolor}{HTML}{b30000} }     %RED
}
{ \definecolor{basecolor}{rgb}{0.0, 0.62, 0.38} }

\definecolor{darkGrey}{HTML}{989898}

\colorlet{linkcolor}{basecolor}
\colorlet{accentcolor}{linkcolor!90}
\colorlet{symbolcolor}{linkcolor!85}

% Setup hyperref package, and colours for links
%\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{breaklinks}

\pagestyle{empty}                         % non-numbered pages

% Setup CV sections
\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em}

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Mapping=tex-text}
% \ifdef{\@chinese}{
% 	\defaultjfontfeatures{Mapping=tex-text}
% }

% Define font to use according to localFont option
\ifundef{\@local}
{
  %\setmainfont[BoldFont = Helvetica Neue, ItalicFont=Helvetica Neue Thin Italic ,SmallCapsFont = Helvetica Neue Light]{Helvetica Neue Thin}
  \setmainfont{Source Sans Pro Light}[
    BoldFont = Source Sans Pro Semibold,
    ItalicFont= Source Sans Pro Light Italic,
    SmallCapsFont = Source Sans Pro]
}
{
  \setmainfont{SourceSansPro-Light}[
  	Path = fonts/,
  	BoldFont = SourceSansPro-Semibold,
 	  ItalicFont = SourceSansPro-LightIt,
 	  SmallCapsFont = SourceSansPro-Regular]
}

% \ifdef{\@chinese}{
% 	\setmainjfont{NotoSansCJKsc-Light}[
% 	Path = fonts/cn/,
% 	BoldFont = NotoSansCJKsc-Regular,
% 	ItalicFont = STKaiti,
% 	SmallCapsFont = NotoSansCJKsc-Regular]
% }

%New length definition
\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{14.8cm}

\newlength{\leftcolumn}
\setlength{\leftcolumn}{2cm}

\newlength{\scholarshipnamelength}
\setlength{\scholarshipnamelength}{10.5cm}

\newlength{\languageright}
\setlength{\languageright}{6.15cm}

\newlength{\universitynamelength}
\setlength{\universitynamelength}{12.3cm}

\newlength{\logowidth}
\setlength{\logowidth}{2.5cm}


% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faAt}
\newcommand{\locationSymbol}{\faMapMarker}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\linkedinSymbol}{\faLinkedin}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\mobileSymbol}{\faMobilePhone}
\newcommand{\githubSymbol}{\faGithub}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black} }
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=darkGrey!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
}

% Render author's name
% Usage: \user{<firstanme>}{<lastname>}
% \ifdef{\@chinese}{
% 	\newcommand\user[2]{\color{accentcolor}{\LARGE\textbf{#2#1}}\color{Black}}
% 	\newcommand\userhuge[2]{\color{accentcolor}{\fontsize{35pt}{35pt}\selectfont\textbf{#2#1}}\color{Black}}
% }
% {
% 	\newcommand\user[2]{\color{accentcolor}{\LARGE #1 \textbf{#2}}\color{Black}}
% 	\newcommand\userhuge[2]{\color{accentcolor}{\fontsize{35pt}{35pt}\selectfont #1 \textbf{#2}}\color{Black}}
% }

\newcommand\user[2]{\color{accentcolor}{\LARGE #1 \textbf{#2}}\color{Black}}
\newcommand\userhuge[2]{\color{accentcolor}{\fontsize{35pt}{35pt}\selectfont #1 \textbf{#2}}\color{Black}}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}#2\hspace{1em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage \photo{<diameter>}{<photo>}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's birthday
% Usage: \birthday{<birthday>}
\newcommand*{\birthday}[1]{\socialtext{\faBirthdayCake}{#1}}

% Render CV Objective
% Usage: \objective{<object>}
\newcommand*{\objective}[1]{\socialtext{\faBullseye}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1}{linkedin.com/in/#1}}

% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{\viadeo}[1]{\sociallink{\viadeoSymbol}{http://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}}

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}}           % Github icon + URL

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}

% Render author's tagline
\newcommand\resumetitle[1]{
  \ifundef{\@alternative}{
	 \par{
	 	 \bigskip\center{\Large \color{accentcolor}\textsc{#1}\color{Black}}\par
	 }
	 \bigskip
  }{
    \color{accentcolor}\textsc{\large{#1}}\color{black}
  }
}

% Define social entries to print in header
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}

% Render CV header
% Needs \@firstname, \@lastname and \@tagline to be defined

\newcommand*{\makecvheader}{
  \ifundef{\@alternative}{
    \ifundef{\@photodiameter}{
      \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    }
    \color{accentcolor}\user{\@firstname}{\@lastname}\color{black}\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
      \end{minipage}
    }{}
    \resumetitle{\@tagline}
  }{
    \ifundef{\@photodiameter}{
      \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    }
    \user{\@firstname}{\@lastname}\\
    \resumetitle{\@tagline}
    \smallskip\\
    \small{\@socialinfo}
    \end{minipage}
    \ifdef{\@photodiameter}{
      \begin{minipage}{\@photodiameter}
        \tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
      \end{minipage}
    }{}
    \bigskip
  }
}
%Render CV title without photo

\newcommand*{\makecvheaderwithoutphoto}{
    \begin{minipage}{\linewidth}
    	\begin{minipage}{0.5\linewidth}
        	\begin{center}
        		\color{accentcolor}\userhuge{\@firstname}{\@lastname}\color{black}
        	\end{center}
    	\end{minipage}
        \begin{minipage}{0.5\linewidth}
        	\small{\@socialinfo}
        \end{minipage}
    \end{minipage}
} % \setmainfont{SourceSansPro-Light}[
% Path = fonts/,
% BoldFont = SourceSansPro-Semibold,
% ItalicFont = SourceSansPro-LightIt,
% SmallCapsFont = SourceSansPro-Regular]


% Resume part title definition
\newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{accentcolor}#2\enspace #1}{#1}}}

% Define a new column type for the scholarship environment
\newcolumntype{Y}{>{\raggedleft}p{\leftcolumn}}

% Define the 'scholarship' environment
\newenvironment{scholarship}{%
  \begin{tabular}{Y p{\scholarshipnamelength} l}
}{%
  \end{tabular}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}{<remarks>}
\newcommand\scholarshipentry[3]{
  #1    &  \textsc{#2}   &  #3\\
} % \setmainfont{SourceSansPro-Light}[
% Path = fonts/,
% BoldFont = SourceSansPro-Semibold,
% ItalicFont = SourceSansPro-LightIt,
% SmallCapsFont = SourceSansPro-Regular]

% Define the 'skills' environment
\newenvironment{skills}{%
  \begin{longtable}{R{\leftcolumn}p{\languageright}R{\leftcolumn}p{\languageright}}
}{%
  \end{longtable}
}

% Render a skill in the skills environment
% Usage: \skill{<skill>}{<level>}
\newcommand\skill[2]{
  \textsc{#1}    & \foreach \x in {1,...,5}{{\color{accentcolor!80} \ifnumgreater{\x}{#2}{\faCircleO}{\faCircle}}\enspace }
}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}

\newcommand\universitySeparator{\multicolumn{3}{c}{}\\}

\newcolumntype{U}{>{\raggedright\arraybackslash}p{\universitynamelength}}

\newcolumntype{O}{>{\centering\arraybackslash}p{\logowidth}}

% Define the 'experiences' environment
\newenvironment{experiences}{%
  \begin{longtable}{R{\leftcolumn}|U O}
}{%
  \end{longtable}
}

% Render an experience in the experiences environment
% Usage:
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Location>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
%  {<Logo parameter>}	{Logo File Name}


% \ifdef{\@chinese}{
% 	\newcommand\experience[9]{
% 		#5    & \textbf{#2\hspace{0.3em}|\hspace{0.3em}#3\hspace{0.3em}|\hspace{0.3em}#4}   			&
% 		\multirow{2}{*}{\includegraphics[#8]{#9}}						\\*
% 		#1    & \begin{minipage}[t]{\universitynamelength}
% 			#6
% 		\end{minipage}										\\*
% 		& \multicolumn{2}{l}{\footnotesize{\foreach \n in {#7}{\cvtag{\n}}}}\\
% 	}
% }
% {
% 	\newcommand\experience[9]{
% 		\textit{#1}    & \textsc{#2, #3, #4}   			&
% 		\multirow{2}{*}{\includegraphics[#8]{#9}}						\\*
% 		\textit{#5}    & \begin{minipage}[t]{\universitynamelength}
% 			#6
% 		\end{minipage}										\\*
% 		& \multicolumn{2}{l}{\footnotesize{\foreach \n in {#7}{\cvtag{\n}}}}\\
% 	}
% }

\newcommand\experience[9]{
	\textit{#1}    & \textsc{#2, #3, #4} &
	\multirow{2}{*}{\includegraphics[#8]{#9}} \\*
	\textit{#5}    & \begin{minipage}[t]{\universitynamelength} #6 \end{minipage} \\* &
  \multicolumn{2}{l}{\footnotesize{\foreach \n in {#7}{\cvtag{\n}}}} \\
}

% Define the 'education' environment
\newenvironment{educations}{%
  \begin{longtable}{R{\leftcolumn}|U O}
}{%
  \end{longtable}
}

% Render an university in the educations environment
% Usage:
% \experience
%  {<Type of degree>}      {<Name of university>, <City>, <Country>}
%  {<parameter>}     {<University logo>}
%  {<Start date>}     {<Major>}{GPA}
%  {<End date>}			{<Remarks>}
%

% \ifdef{\@chinese}{
% 	\newcommand\education[9]{
% 		#8  & \textbf{#2} 			&
% 		\multirow{3}{*}{\includegraphics[#3]{#4}}				\\*
% 		#5    & \textbf{#1\hspace{0.3em}|\hspace{0.3em}专业：#6\hspace{0.3em}|\hspace{0.3em}加权成绩：#7}						\\*
% 		    & #9	 \\
% 	}
% }
% {
% 		\newcommand\education[9]{
% 		\textsc{#1}    & \textsc{#2}   			&
% 		\multirow{3}{*}{\includegraphics[#3]{#4}}				\\*
% 		\textit{#5}    & \textsc{Specialty: #6, GPA: #7}						\\*
% 		\textit{#8}    & #9	 \\
% 	}
% }

\newcommand\education[8]{
	\textit{#1}    & \textsc{#2}   			&
	\multirow{3}{*}{\includegraphics[#3]{#4}}				\\*
	\textit{#5}    & \textsc{#6}						\\*
	\textit{#7}    & #8	 \\
}

% Define the 'projects' environment
\newenvironment{projects}{%
  \begin{longtable}{R{\leftcolumn}|E m{0cm}}
}{%
  \end{longtable}
}

% Render a project in the projects environment
% Usage:
% \project
%  {<End date>}      {<Project Title>}
%  {<Start date}     {
%                      <Contribution to the project>
%                    }
%                    {<Technology list>}

% \ifdef{\@chinese}{
% 	\newcommand\project[5]{
% 		#3    & \textbf{#2}   								\\*
% 		#1    & \begin{minipage}[t]{\rightcolumnlength}
% 			#4
% 		\end{minipage}										\\*
% 		& \footnotesize{\foreach \n in {#5}{\cvtag{\n}}} 	\\
% 	}
% }
% {
% 	\newcommand\project[5]{
% 		\textit{#1}    & \textsc{#2}   								\\*
% 		\textit{#3}    & \begin{minipage}[t]{\rightcolumnlength}
% 			#4
% 		\end{minipage}										\\*
% 		& \footnotesize{\foreach \n in {#5}{\cvtag{\n}}} 	\\
% 	}
% }

\newcommand\project[5]{
	\textit{#1}    & \textsc{#2} &  								\\*
	\textit{#3}    & \begin{minipage}[t]{\rightcolumnlength}
		#4
	\end{minipage}	&									\\*
	& \footnotesize{\foreach \n in {#5}{\cvtag{\n}}} 	& \\
}
