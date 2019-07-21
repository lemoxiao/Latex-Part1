%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developer CV - Doji edit
% LaTeX Class
% Version 1.0 (23/04/19)
%
% Authors:
% Stijn Dejongh (stijn.c.dejongh@gmail.com)
% Based on a template by Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv}[2019/01/28 Developer CV class v1.0]

\newif\if@blue
\DeclareOption{blue}{\@bluetrue}
\newif\if@square
\DeclareOption{square}{\@squaretrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.} % Dummy text

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{enumitem}
\usepackage{smartdiagram}

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=1.75cm, % Top margin
	bottom=1.75cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage[default]{gillius}
%\usepackage{roboto}

\RequirePackage{xcolor}

\definecolor{calmBlue}{HTML}{2073ba}
\definecolor{darkCalmBlue}{HTML}{1a5c95}
\definecolor{blackishBlue}{HTML}{1d2933}
\definecolor{highlightGray}{HTML}{e7e7e7}

\definecolor{vibrantGreen}{HTML}{64b613}
\definecolor{calmGreen}{HTML}{63a026}
\definecolor{darkGreen}{HTML}{356803}
\definecolor{blackishGreen}{HTML}{202917}
\definecolor{highlightGreen}{HTML}{cdd5cc}


\colorlet{background}{vibrantGreen}
\colorlet{accentbackground}{calmGreen}
\colorlet{text}{blackishGreen}
\colorlet{body}{blackishGreen}
\colorlet{soft}{highlightGreen!75!body}

\colorlet{accent}{darkGreen}
\colorlet{heading}{black}
\colorlet{emphasis}{vibrantGreen}

\if@blue
	\colorlet{background}{calmBlue}
	\colorlet{accentbackground}{darkCalmBlue}
	\colorlet{text}{blackishBlue}
	\colorlet{body}{blackishBlue}
	\colorlet{soft}{highlightGray!65!body}
	
	\colorlet{accent}{darkCalmBlue}
	\colorlet{heading}{black}
	\colorlet{emphasis}{calmBlue}
\fi

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%------------------------------------------------

\usepackage{fontawesome} % Required for FontAwesome icons

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
	\vcenteredhbox{\colorbox{background}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{\textcolor{highlightGray}{#3}}% Text
}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

\newcommand{\emailsymbol}{\faAt}
\newcommand{\phonesymbol}{\faPhone}
\newcommand{\homepagesymbol}{\faChain}
\newcommand{\locationsymbol}{\faMapMarker}
\newcommand{\linkedinsymbol}{\faLinkedin}
\newcommand{\twittersymbol}{\faTwitter}
\newcommand{\githubsymbol}{\faGithub}
\newcommand{\orcidsymbol}{\aiOrcid}
\newcommand{\mailsymbol}{\faEnvelope}

\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{ #1}\hspace{0.5em}#2\hspace{2em}}}
\newcommand{\printinfop}[2]{\parbox[t]{8cm}{\textcolor{accent}{#1}\hspace{0.5em}#2\hspace{2em}}}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\photo}[2]{\def\@photo{#2}\def\@photodiameter{#1}}
\newcommand{\email}[1]{\printinfo{\mailsymbol}{#1}}
\newcommand{\mailaddress}[1]{\printinfo{\mailsymbol}{#1}}
\newcommand{\phone}[1]{\printinfo{\phonesymbol}{#1}}
\newcommand{\homepage}[1]{\printinfo{\homepagesymbol}{#1}}
\newcommand{\twitter}[1]{\printinfo{\twittersymbol}{#1}}
\newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}
\newcommand{\github}[1]{\printinfo{\githubsymbol}{#1}}
\newcommand{\orcid}[1]{\printinfo{\orcidsymbol}{#1}}
\newcommand{\location}[1]{\printinfo{\locationsymbol}{#1}}




%----------------------------------------------------------------------------------------
%	CHARTS
%---------------------------------------------------------------------------------------- 

\newcounter{barcount}

% Environment to hold a new bar chart
\newenvironment{barchart}[1]{ % The only parameter is the maximum bar width, in cm
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	% Command to add a bar to the bar chart
	\newcommand{\baritem}[2]{ % The first argument is the bar label and the second is the percentage the current bar should take up of the total width
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult
		
		\filldraw[fill=background, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
		\node [label=180:\textbf{\textcolor{accent}{##1}}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}

%------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}
	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}\hspace{0.75cm}%
		}
	\end{tikzpicture}
	
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=accentbackground!85, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{text!80}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------

%\newtcolorbox{mybox}{colback=accentbackground,colframe=accentbackground,width=\@tempdima}

\newcommand{\mybox}[1]{%
	\setbox0=\hbox{#1}%
	\setlength{\@tempdima}{\dimexpr\wd0+13pt}%
	\begin{tcolorbox}[colback=accentbackground,colframe=accentbackground,boxrule=0.5pt,arc=4pt,
		left=6pt,right=6pt,top=6pt,bottom=6pt,boxsep=0pt,width=\@tempdima]
		#1
	\end{tcolorbox}
}
	
% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{\baselineskip} % Whitespace before the section title
	\if@square
		\colorbox{accentbackground}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
	\else
		\mybox{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}
	\fi

}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[5]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{0.175\textwidth}{% 17.5% of the text width of the page
		\textcolor{soft}{\small{#1}} % Leftmost entry date(s) text
	}%
	\parbox[t]{0.825\textwidth}{% 82.5% of the text width of the page
		\textcolor{accentbackground}{\textbf{#5}}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize \textbf{\textcolor{text}{#3}}}\\% Right-aligned entry qualifier text
		\vspace{2mm}
		\small{\textcolor{text!85}{#2}}
		\vspace{0.1cm}
		
		\normalsize{#4} % Entry description text
	}\\\\\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

\newcommand{\divider}{\textcolor{body!25}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newcommand{\itemmarker}{\textcolor{background}{\small\textbullet\space}}
\newcommand{\ratingmarker}{\faCircle}

\newcommand{\cvtag}[1]{%
	\tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

%----------------------------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------------------------

\newcommand{\relation}[1]{\printinfop{\faChain}{#1}}

\newcommand{\cvref}[4]{%
	\begin{minipage}[t]{0.45\textwidth}
		\textcolor{text!85}{\textbf{#1}}\par
		\vspace{1mm}
		\vspace{0.2cm}
			\begin{minipage}[t]{\textwidth}
				\hspace{0.75cm}  \textcolor{background}{\emailsymbol} \hspace{0.3cm} #2 
				\vspace{2mm}
				
				\hspace{0.75cm}  \textcolor{background}{\faChain} \hspace{0.3cm} #4
			\end{minipage}			
		\par
		\vspace{2mm}
		\divider \par
	\end{minipage}
		
}



%----------------------------------------------------------------------------------------
%	SKILLS AND TRAITS
%----------------------------------------------------------------------------------------


\newcommand{\skillsect}[1]{\large \textcolor{accent}{\faCheckSquare \hspace{2mm} \textbf{#1} } \normalsize \vspace{3mm}}

\newcommand{\cvskill}[2]{%
	\textcolor{text}{\textbf{#1}}\hfill
	\foreach \x in {1,...,5}{%
		\space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{emphasis}}\ratingmarker}}\par%
}

\AtBeginDocument{%
	\color{text}
}

% BUBBLIES CHART
\smartdiagramset{
	bubble center node font = \small,
	bubble node font = \tiny,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.5cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.5cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.3cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = highlightGreen,
	% define the list of colors usable in the diagram
	set color list = {highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen, highlightGreen},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.6,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 0.5,
}