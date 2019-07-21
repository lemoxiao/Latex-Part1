\ProvidesClass{inzane_syllabus}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}
\usepackage{booktabs}
\RequirePackage{hyperref}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{myGreen}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{tableblue}{HTML}{1dc1e2}
%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\officehours}[1]{\renewcommand{\officehours}{#1}}
\newcommand{\email}[1]{\renewcommand{\email}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\office}[1]{\renewcommand{\office}{#1}}
\newcommand{\site}[1]{\renewcommand{\site}{#1}}
\newcommand{\about}[1]{\renewcommand{\about}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\classname}[1]{\renewcommand{\classname}{#1}}
\newcommand{\classnum}[1]{\renewcommand{\classnum}{#1}}

\newcommand{\profname}[1]{\renewcommand{\profname}{#1}}
\newcommand{\classhours}[1]{\renewcommand{\classhours}{#1}}
\newcommand{\labhours}[1]{\renewcommand{\labhours}{#1}}
\newcommand{\classloc}[1]{\renewcommand{\classloc}{#1}}
% \newcommand{\classhours}[1]{\renewcommand{\classhours}{#1}}

\newcommand{\classinfo}[1]{\renewcommand{\classinfo}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=myGreen,myGreen,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,myGreen](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{myGreen}\classname}

		%------------------------------------------------

		{\Large\color{myGreen}\classnum}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}


		%------------------------------------------------
        
        \profilesection{Instructor Info}      
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
        	\ifthenelse{\equal{\profname}{}}{}{\textsc{\Large\icon{\WomanFace}} & \profname\\}
			\ifthenelse{\equal{\officehours}{}}{}{\textsc{\Large\icon{\ClockLogo}} & \officehours\\}
			\ifthenelse{\equal{\office}{}}{}{\textsc{\Large\icon{\Letter}} & \office\\}
% 			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			\ifthenelse{\equal{\site}{}}{}{\textsc{\Large\icon{\ComputerMouse}} & \site\\}
			\ifthenelse{\equal{\email}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\email}{\email}}
		\end{tabular}
        
        \profilesection{Course Info}
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\classhours}{}}{}{\textsc{\Large\icon{\ClockLogo}} & \classhours\\}            
            \ifthenelse{\equal{\labhours}{}}{}{\textsc{\Large\icon{\Biohazard}} & \labhours\\}
            \ifthenelse{\equal{\classloc}{}}{}{\textsc{\Large\icon{\Letter}} & \classloc\\}
        \end{tabular}
        
		\ifthenelse{\equal{\about}{}}{}{
			\profilesection{Description}
			\begin{flushleft}
				\about
			\end{flushleft}
		}

		%------------------------------------------------

% 		\profilesection{Skills}

% 		\skills
% 		\skillstext
% 		\scriptsize
% 		(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		%------------------------------------------------
			
	\end{textblock}
}

\newcommand{\makesecond}{
%  \RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}
 \newgeometry{margin=1cm}

%text below allows the continuation of the first-page side-panel onto the second page
%uncomment to continue the panel 

% 	\begin{tikzpicture}[remember picture,overlay]
%    		\node [rectangle, fill=sidecolor, anchor=north, minimum width=0, minimum height=0] (box) at (-5cm,0.5cm){};
% 	\end{tikzpicture}

	%------------------------------------------------

% 	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
% 		\ifthenelse{\equal{\profilepic}{}}{}{
% 			\begin{center}
% 				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
% 					\clip (600/2, 567/2) circle (567/2);
% 					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
% 				\end{tikzpicture}
% 			\end{center}
		}

		%------------------------------------------------

% 		{\Huge\color{mainblue}\cvname}

		%------------------------------------------------

% 		{\Large\color{mainblue}\cvjobtitle}

		%------------------------------------------------

% 		\renewcommand{\arraystretch}{1.6}


		%------------------------------------------------
        
%         \profilesection{Instructor Info}      
        
%         \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
%         	\ifthenelse{\equal{\profname}{}}{}{\textsc{\Large\icon{\WomanFace}} & \profname\\}
% 			\ifthenelse{\equal{\officehours}{}}{}{\textsc{\Large\icon{\ClockLogo}} & \officehours\\}
% 			\ifthenelse{\equal{\office}{}}{}{\textsc{\Large\icon{\Letter}} & \office\\}
% % 			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
% 			\ifthenelse{\equal{\site}{}}{}{\textsc{\Large\icon{\ComputerMouse}} & \site\\}
% 			\ifthenelse{\equal{\email}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\email}{\email}}
% 		\end{tabular}
        
%         \profilesection{Course Info}
        
%         \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
% 			\ifthenelse{\equal{\classhours}{}}{}{\textsc{\Large\icon{\ClockLogo}} & \classhours\\}            
%             \ifthenelse{\equal{\labhours}{}}{}{\textsc{\Large\icon{\Biohazard}} & \labhours\\}
%             \ifthenelse{\equal{\classloc}{}}{}{\textsc{\Large\icon{\Letter}} & \classloc\\}
%         \end{tabular}
        
% 		\ifthenelse{\equal{\about}{}}{}{
% 			\profilesection{Description}
% 			\begin{flushleft}
% 				\about
% 			\end{flushleft}
% 		}

		%------------------------------------------------

% 	\end{textblock}
% }

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

%Change the order below to use different colors and whatnot in the headers. 
\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
% 			maingray\or%
			myGreen\or%
% 			maingray\or%
			myGreen\or%
% 			maingray\or%
			myGreen\or%
% 			maingray\or%
			myGreen\or%
            myGreen\or%
            myGreen\or%
            myGreen\or%
            myGreen\or%
%  			maingray\or%
			myGreen\else%
			maingray\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------


