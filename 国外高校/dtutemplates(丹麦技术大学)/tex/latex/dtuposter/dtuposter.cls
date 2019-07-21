\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtuposter}[2014/09/30 v1.0 - package to create posters]
%======================================================================
%===  dtuposter - a class to make posters tha comply with the DTU CI
%
% Written and maintained in 2011-2014 
% by Jorrit Wronski (jowr@mek.dtu.dk)
%
%
%======================================================================
%===  Setting up the class and defining the options
\RequirePackage{trace}
\newcommand\stdout[1]{\ClassInfo{dtuposter}{#1}}
%\newcommand\stdout[1]{\ClassWarningNoLine{dtuposter}{#1}}
%
% Standard options that you should pass to the class, use only kvoptions 
% to avoid problems.
%\RequirePackage{kvoptions-patch}
\RequirePackage{kvoptions}
\DeclareStringOption[This is the Poster Title]{title} % default title
\DeclareStringOption[This Ismyname]{author}           % default author
\DeclareStringOption[Subject of the Poster]{subject}  % default subject
\DeclareStringOption[poster, DTU, LaTex]{keywords}    % default keywords
\DeclareStringOption[dtucoolgrey]{bgcolor}            % default colour
\DeclareStringOption[dtured]{highlight}               % default colour
\DeclareStringOption[tex_dtu_mekanik_b_uk]{toplogo}   % default institute logo
\DeclareStringOption[tex_dtu_elektro_b_uk]{botlogo}   % default bottom logo
\DeclareStringOption[a0paper]{papersize}              % default paper size
\DeclareStringOption[3columns]{colcount}              % default number of columns
\DeclareBoolOption[false]{longtitle}
\DeclareBoolOption[false]{largecaption}
\DeclareBoolOption[false]{draft}
\DeclareComplementaryOption{final}{draft}
\DeclareBoolOption[true]{crop}
\DeclareComplementaryOption{nocrop}{crop}
%
% Default option rule
\DeclareDefaultOption{%
  \ifx\CurrentOptionValue\relax
    \ClassWarningNoLine{dtuposter}{%
      You provided and unknown option '\CurrentOption '. I will pass it on to 'scrartcl' without further processing}
    \expandafter\PassOptionsToClass
    \expandafter{\CurrentOption}{scrartcl}%
  \else
    \ClassWarningNoLine{dtuposter}{%
      You provided and unknown option '\CurrentOptionKey ' with value '\CurrentOptionValue '.
      I will pass it on to 'scrartcl' without further processing}%
    \expandafter\PassOptionsToClass{\expandafter\CurrentOptionKey = \expandafter\CurrentOptionValue}{scrartcl}%  
  \fi
}
%
\ProcessKeyvalOptions{dtuposter}\relax
%
%
%======================================================================
%===  Define functions to be called according to the options
\InputIfFileExists{dtucolours}{
  \ClassInfo{dtuposter}{Successfully loaded the DTU colours}
}{
  \ClassWarning{dtuposter}{Could not load the colours from dtucolours.sty. This compilation is likely to fail}
}%
%
\RequirePackage{etoolbox,trace}
\long\def\ifequal#1#2#3#4{\expandafter\ifstrequal\expandafter{#1}{#2}{#3}{#4}}
%
%
%======================================================================
%===  Default paper and font sizes
\RequirePackage{calc,fp,tikz}
\usetikzlibrary{shapes,calc,positioning,backgrounds,shadings}
%
%% Convert mm to pt
\FPset{\dtuposter@mmpt}{2.83464567}
\FPdiv{\dtuposter@ptmm}{1}{\dtuposter@mmpt}
\FPmul{\dtuposter@refsize}{\dtuposter@mmpt}{1189}
%
\newcommand{\getlengthmm}[1]{\strip@pt\dimexpr\dtuposter@ptmm\dimexpr#1\relax\relax}
\newcommand{\getlengthpt}[1]{\strip@pt\dimexpr1.0\dimexpr#1\relax\relax}
%\pgfdeclarelayer{background}
%\pgfdeclarelayer{foreground}
%\pgfsetlayers{background,main,foreground}
%
%
\ifequal{\dtuposter@papersize}{a0paper}{%
  \stdout{papersize switch: detected a0paper}
  %%A0 paper 841 x 1189 mm
  \FPmul\dtuposterwidth{841}{\dtuposter@mmpt}
  \FPmul\dtuposterheight{1189}{\dtuposter@mmpt}
  \FPdiv\dtuposter@sizeratio{\dtuposterheight}{\dtuposter@refsize}
  \PassOptionsToClass{a0paper}{scrartcl}
  \PassOptionsToPackage{a0paper}{geometry}}{
		\ifequal{\dtuposter@papersize}{a1paper}{%
		  \stdout{papersize switch: detected a1paper}
		  %%A1 paper 594 x 841 mm
		  \FPmul\dtuposterwidth{594}{\dtuposter@mmpt}
		  \FPmul\dtuposterheight{841}{\dtuposter@mmpt}
		  \FPdiv\dtuposter@sizeratio{\dtuposterheight}{\dtuposter@refsize}
		  \PassOptionsToClass{a1paper}{scrartcl}
		  \PassOptionsToPackage{a1paper}{geometry}}{
				\ifequal{\dtuposter@papersize}{a2paper}{%
  				\stdout{papersize switch: detected a2paper}
				  %%A4 paper 420 x 595 mm
				  \FPmul\dtuposterwidth{420}{\dtuposter@mmpt}
				  \FPmul\dtuposterheight{595}{\dtuposter@mmpt}
				  \FPdiv\dtuposter@sizeratio{\dtuposterheight}{\dtuposter@refsize}
				  \PassOptionsToClass{a2paper}{scrartcl}
				  \PassOptionsToPackage{a2paper}{geometry}}{
						\ifequal{\dtuposter@papersize}{a3paper}{%
						 \stdout{papersize switch: detected a3paper}
						  %%A4 paper 297 x 421 mm
						  \FPmul\dtuposterwidth{297}{\dtuposter@mmpt}
						  \FPmul\dtuposterheight{421}{\dtuposter@mmpt}
						  \FPdiv\dtuposter@sizeratio{\dtuposterheight}{\dtuposter@refsize}
						  \PassOptionsToClass{a3paper}{scrartcl}
						  \PassOptionsToPackage{a3paper}{geometry}}{
								\ifequal{\dtuposter@papersize}{a4paper}{%
  								\stdout{papersize switch: detected a4paper}
								  %%A4 paper 210 x 297 mm
								  \FPmul\dtuposterwidth{210}{\dtuposter@mmpt}
								  \FPmul\dtuposterheight{297}{\dtuposter@mmpt}
								  \FPdiv\dtuposter@sizeratio{\dtuposterheight}{\dtuposter@refsize}
								  \PassOptionsToClass{a4paper}{scrartcl}
								  \PassOptionsToPackage{a4paper}{geometry}}{
									   \ClassError{dtuposter}{
									     value '\dtuposter@papersize'< unkown \MessageBreak
									     possible values are: a0paper, a1paper, a2paper, a3paper or a4paper}
								}
						}
				}
		}
}
%
%======================================================================
%===  Define margins according to "DTU_Poster_A0_HOEJ_2sp.Skabelon.cs2"
%\newcommand{\dtuposter@setpapersize}{
\FPmul\dtuposter@tmp{  20}{\dtuposter@sizeratio}
\newlength{\bgmarginleftright}%
\setlength{\bgmarginleftright}{\dtuposter@tmp mm}
\stdout{background margin side: \dtuposter@tmp mm}
\FPmul\dtuposter@tmp{  30}{\dtuposter@sizeratio}
\newlength{\bgmargintop}%
\setlength{\bgmargintop}{\dtuposter@tmp mm}
\stdout{background margin top: \dtuposter@tmp mm}
%\FPmul\dtuposter@tmp{20}{\dtuposter@sizeratio}
%\newlength{\bgheight}%
%\setlength{\bgheight}{\dtuposter@tmp pt * 0}
%\addtolength{\bgheight}{\paperheight}
%
\FPmul\dtuposter@tmp{ 120}{\dtuposter@sizeratio}
\newlength{\bgfirstline}%
\setlength{\bgfirstline}{\dtuposter@tmp mm}
\stdout{background first line: \dtuposter@tmp mm}
\FPmul\dtuposter@tmp{1080}{\dtuposter@sizeratio}
\newlength{\bgsecondline}%
\setlength{\bgsecondline}{\dtuposter@tmp mm}
\stdout{background second line: \dtuposter@tmp mm}
\FPmul\dtuposter@tmp{   5}{\dtuposter@sizeratio}
\newlength{\bglinewidth}%
\setlength{\bglinewidth}{\dtuposter@tmp pt}
\stdout{background line width: \dtuposter@tmp pt}
%
\FPmul\dtuposter@tmp{  40}{\dtuposter@sizeratio}
\newlength{\textmarginleftright}%
\setlength{\textmarginleftright}{\dtuposter@tmp mm}
\stdout{text margin side: \dtuposter@tmp mm}
\FPmul\dtuposter@tmp{ 150}{\dtuposter@sizeratio}
\newlength{\textmargintop}%
\setlength{\textmargintop}{\dtuposter@tmp mm}
\stdout{text margin top: \dtuposter@tmp mm}
\FPmul\dtuposter@tmp{ 130}{\dtuposter@sizeratio}
\newlength{\textmarginbottom}%
\setlength{\textmarginbottom}{\dtuposter@tmp mm}
\stdout{text margin bottom: \dtuposter@tmp mm}
%
\FPmul\dtuposter@tmp{20}{\dtuposter@sizeratio}
\newlength{\textintercolumn}%
\setlength{\textintercolumn}{\dtuposter@tmp mm} % The design guide says 10, but that is really small
\stdout{intercolumn space: \dtuposter@tmp mm}
%
\newlength{\toplogoleft}%
\setlength{\toplogoleft}{\textmarginleftright} 
\FPmul\dtuposter@tmp{50}{\dtuposter@sizeratio}
\newlength{\toplogotop}%
\setlength{\toplogotop}{\dtuposter@tmp mm} 
\FPmul\dtuposter@tmp{43.25}{\dtuposter@sizeratio}
\newlength{\toplogoheight}%
\setlength{\toplogoheight}{\dtuposter@tmp mm} 
%
\newlength{\dtulogoright}%
\setlength{\dtulogoright}{\textmarginleftright} 
\FPmul\dtuposter@tmp{30}{\dtuposter@sizeratio}
\newlength{\dtulogotop}%
\setlength{\dtulogotop}{\dtuposter@tmp mm} 
\FPmul\dtuposter@tmp{44.5}{\dtuposter@sizeratio}
\newlength{\dtulogowidth}%
\setlength{\dtulogowidth}{\dtuposter@tmp mm}
%
\FPmul\dtuposter@tmp{1125}{\dtuposter@sizeratio}
\newlength{\footerimagetop}%
\setlength{\footerimagetop}{\dtuposter@tmp mm}
%\FPmul\dtuposter@tmp{  40}{\dtuposter@sizeratio}
%\newlength{\footerimageleft}%
%\setlength{\footerimageleft}{\dtuposter@tmp mm}
%
\newlength{\footerimagewidth}%
\setlength{\footerimagewidth}{\dtuposterwidth pt}
\addtolength{\footerimagewidth}{-2\textmarginleftright} % left and right
\addtolength{\footerimagewidth}{-3\textmarginleftright} % in between the 4 images
\addtolength{\footerimagewidth}{-0.75\footerimagewidth} % 4 images => 1/4 of length
%
\PassOptionsToPackage{%
  centering,%
  pdftex,%
  paperwidth=\dtuposterwidth pt,%
  paperheight=\dtuposterheight pt,%
  bindingoffset=0.0pt,
  footskip=0.0in,
  left=\textmarginleftright,%
  right=\textmarginleftright,%
  top=\textmargintop,%
  bottom=\textmarginbottom,%
  nohead}{geometry}
%}
%
%
%======================================================================
%===  Default cropping for oversize paper
\newlength{\cropleftright}%
\newlength{\croptopbottom}%  
\providecommand{\dtuposter@setcropsize}{}
%
\ifdtuposter@crop%
%  \renewcommand{\dtuposter@setcropsize}{
  \FPdiv\dtuposter@camwidth{\dtuposterwidth}{\dtuposter@mmpt} % back to mm
  \FPadd\dtuposter@camwidth{\dtuposter@camwidth}{30}%
  \FPdiv\dtuposter@camheight{\dtuposterheight}{\dtuposter@mmpt} % back to mm
  \FPadd\dtuposter@camheight{\dtuposter@camheight}{40}%
  \PassOptionsToPackage{cam,axes,info,width=\dtuposter@camwidth truemm,height=\dtuposter@camheight truemm,pdflatex,center}{crop}%
  %
  \FPmul\dtuposter@tmp{\dtuposter@camwidth}{\dtuposter@mmpt} % width in points
  \FPsub\dtuposter@tmp{\dtuposter@tmp}{\dtuposterwidth}%
  \FPdiv\dtuposter@tmp{\dtuposter@tmp}{2}%
  \setlength{\cropleftright}{\dtuposter@tmp pt}%
  %
  \FPmul\dtuposter@tmp{\dtuposter@camheight}{\dtuposter@mmpt} % height in points
  \FPsub\dtuposter@tmp{\dtuposter@tmp}{\dtuposterheight}%
  \FPdiv\dtuposter@tmp{\dtuposter@tmp}{2}%
  \setlength{\croptopbottom}{\dtuposter@tmp pt}%
%  }
\else%
 \setlength{\cropleftright}{0pt}%
 \setlength{\croptopbottom}{0pt}%
\fi%
%
%
%======================================================================
%===  Default font size, enlarge the font size for less than 3 columns
\ifequal{\dtuposter@colcount}{3columns}{
  \stdout{colcount switch: detected 3columns}
  \FPset\dtuposter@columncount{3}
  \FPset\dtuposter@fontsizefactor{1}}{
		\ifequal{\dtuposter@colcount}{2columns}{
		  \stdout{colcount switch: detected 2columns}
		  \FPset\dtuposter@columncount{2}
		  \FPdiv\dtuposter@fontsizefactor{48}{35}}{
				\ifequal{\dtuposter@colcount}{1column}{
				  \stdout{colcount switch: detected 1column}
				  \FPset\dtuposter@columncount{1}
				  \FPdiv\dtuposter@fontsizefactor{48}{35}}{
				    \ClassError{dtuposter}{
				      You apssed an unknown value '\dtuposter@colcount' to
				      the 'colcount' options, possible values are: 
				      3columns, 2columns or 1column}
				}
		}
}
\stdout{columncount: \dtuposter@columncount}
\stdout{fontsize factor: \dtuposter@fontsizefactor}
%
%
%======================================================================
%===  Define fonts according to "DTU_Poster_A0_HOEJ_2sp.Skabelon.cs2"
\newlength\dtuposter@tmpfontsize
\newlength\dtuposter@tmplinespace
\newcommand{\dtuposter@fs}[3]{ %
  \stdout{Setting font size: {#1} {#2} {#3}}
  \FPmul\dtuposter@tmp{\dtuposter@sizeratio}{#1} %
  \FPmul\dtuposter@tmp{\dtuposter@tmp}{#3} %
  \setlength{\dtuposter@tmpfontsize}{\dtuposter@tmp pt} %
  \FPmul\dtuposter@tmp{\dtuposter@sizeratio}{#2} %
  \FPmul\dtuposter@tmp{\dtuposter@tmp}{#3} %
  \setlength{\dtuposter@tmplinespace}{\dtuposter@tmp pt} %
  \fontsize{\dtuposter@tmpfontsize}{\dtuposter@tmplinespace}\selectfont %
}
%
\newcommand\dtuposter@setfonts{
  \ifdtuposter@longtitle%
    \setkomafont{title}{       \normalfont\dtuposter@fs{100}{120}{1}\bfseries\color{\dtuposter@highlight}} % used with title
  \else
    \setkomafont{title}{       \normalfont\dtuposter@fs{160}{170}{1}\bfseries\color{\dtuposter@highlight}} % used with title
  \fi
  \setkomafont{minisec}{     \normalfont\dtuposter@fs{ 60}{ 70}{1}\bfseries} % used for authors
  \setkomafont{dictum}{      \normalfont\dtuposter@fs{ 48}{ 60}{1}} % used for affiliation
  \setkomafont{section}{     \normalfont\dtuposter@fs{ 35}{ 45}{\dtuposter@fontsizefactor}\bfseries\color{\dtuposter@highlight}} % section
  \setkomafont{subsection}{  \normalfont\dtuposter@fs{ 35}{ 45}{\dtuposter@fontsizefactor}\bfseries} % subsection
  \ifdtuposter@largecaption%
    \setkomafont{caption}{     \normalfont\dtuposter@fs{ 24}{ 34}{1}} % table and figure caption
  \else
    \setkomafont{caption}{     \normalfont\dtuposter@fs{ 15}{ 24}{1}\bfseries} % table and figure caption
  \fi
  % Dirty hack to center the caption \hspace*{-3.5em}
  \setkomafont{captionlabel}{\color{\dtuposter@highlight}\bfseries}              % label looks the same
}
%
%
%======================================================================
%===  change the background for drafting
\providecommand\dtuposter@drawgrid{}%
%
\ifdtuposter@draft%
  \renewcommand\dtuposter@drawgrid{%
    \begin{tikzpicture}[remember picture,overlay] %
    %\begin{pgfonlayer}{foreground}
      \node [inner sep=0pt,above right] at (current page.north west){ %
        \begin{tikzpicture}[remember picture,overlay] %
          \draw[step=2cm,color=magenta!10] (0,0) grid (\paperwidth,-\paperheight); %
        \end{tikzpicture} %
      }; %
    %\end{pgfonlayer}
    \end{tikzpicture} %
  } %
  \PassOptionsToClass{draft=true}{scrartcl}%
\else
  \renewcommand\dtuposter@drawgrid{}%
  \PassOptionsToClass{draft=false}{scrartcl}%

\fi
\AtEndDocument{\dtuposter@drawgrid} 
%
%
%======================================================================
%===  Use tikz to draw the background 
\newcommand{\dtuposter@drawbg}{ %
  \begin{tikzpicture}[remember picture,overlay] %
    \begin{pgfonlayer}{background}%
	    % set base node as marker
	    \node [inner sep=0pt,above right] at (current page.north west){ %
	      \begin{tikzpicture}[remember picture,overlay]%
		      \draw (\toplogoleft,-\toplogotop) node[inner sep=0pt, below right] {\includegraphics[height=\toplogoheight]{\dtuposter@toplogo}}; %
		      \draw (\paperwidth-\dtulogoright,-\dtulogotop) node[inner sep=0pt, below left] {\includegraphics[width=\dtulogowidth]{tex_dtu_logo}}; %
		      \filldraw[inner sep=0pt,color=\dtuposter@bgcolor!10] (\bgmarginleftright,-\bgfirstline-\bglinewidth) rectangle (\paperwidth-\bgmarginleftright,-\bgsecondline); %
		      \filldraw[inner sep=0pt,color=\dtuposter@bgcolor]    (\bgmarginleftright,-\bgfirstline) rectangle (\paperwidth-\bgmarginleftright,-\bgfirstline-\bglinewidth); %
		      \filldraw[inner sep=0pt,color=\dtuposter@bgcolor]    (\bgmarginleftright,-\bgsecondline) rectangle (\paperwidth-\bgmarginleftright,-\bgsecondline-\bglinewidth); %
		      %
		      \draw (1\textmarginleftright+0\footerimagewidth,-\footerimagetop) node[inner sep=0pt, below right] {\includegraphics[width=\footerimagewidth]{\dtuposter@botlogo}}; %
		      \draw (2\textmarginleftright+1\footerimagewidth,-\footerimagetop) node[inner sep=0pt, below right] {\includegraphics[width=\footerimagewidth]{\dtuposter@botlogo}}; %
		      \draw (3\textmarginleftright+2\footerimagewidth,-\footerimagetop) node[inner sep=0pt, below right] {\includegraphics[width=\footerimagewidth]{\dtuposter@botlogo}}; %
		      \draw (4\textmarginleftright+3\footerimagewidth,-\footerimagetop) node[inner sep=0pt, below right] {\includegraphics[width=\footerimagewidth]{\dtuposter@botlogo}}; %
	      \end{tikzpicture} %
	    }; %
    \end{pgfonlayer} %
  \end{tikzpicture} %
}%

%
%
%======================================================================
%===  After parsing the options, all variables are populated
\title{\dtuposter@title}
\author{\dtuposter@author}
%\subject{\dtuposter@subject}
%\keywords{\dtuposter@keywords}
%
\FPmul\dtuposter@tmp{\dtuposter@sizeratio}{35}
\FPmul\dtuposter@basefontsize{\dtuposter@tmp}{\dtuposter@fontsizefactor}
\PassOptionsToClass{fontsize=\expandafter\dtuposter@basefontsize pt}{scrartcl}
\stdout{Loading scrartcl with \dtuposter@basefontsize pt}
%
%
%======================================================================
%===  Load the class and call the functions defined above
\LoadClass{scrartcl}
\pagestyle{empty}
\setlength\parindent{0pt}
%\dtuposter@setpapersize
\RequirePackage{geometry}
%\dtuposter@setcropsize
\RequirePackage{crop}%
%
\AtBeginDocument{\dtuposter@drawbg}
\AtBeginDocument{\dtuposter@setfonts} 
%
%======================================
%==  Details for pdf files
\RequirePackage[pdftex,       % hyper-references for pdflatex
    bookmarks=false,           % generate bookmarks ...
%    bookmarksnumbered=true,   % ... with numbers
%    bookmarksopen=false,      %
    colorlinks=false,         %
    linkcolor=black,          %
    hypertexnames=false,      % needed for correct links to figures !!!
    breaklinks=true,%         % break links if exceeding a single line
%    linkbordercolor={0 0 1}  %
    pdfborder={0 0 0},        % no red border for links
    pdfpagelayout=SinglePage  % display one page per view
]{hyperref}
\AtEndOfClass{
  \pdfminorversion=3
  \pdfcompresslevel=0
  \hypersetup{
    pdfauthor = {\dtuposter@author},
    pdftitle = {\dtuposter@title},
    pdfsubject = {\dtuposter@subject},
    pdfkeywords = {\dtuposter@keywords},
    pdfcreator = {LaTeX with dtuposter class},
    pdfproducer = {pdfTex}
  }
  \pdfadjustspacing=1
  %%%%%%%%% PDF/X-3 stuff, necessary for Blurb IF USING pdflatex %%%%%%%%%
  % ICC color profiles are embedded in the images
  \pdfinfo{
  /Title (\dtuposter@title)   % set your title here
  /Author (\dtuposter@author)       % set author name
  /Subject (\dtuposter@subject)          % set subject
  /Keywords (\dtuposter@keywords) % set keywords
  /Trapped (False)
  /GTS_PDFXVersion (PDF/X-3:2002)
  }
  % must have a trim box,
  %\pdfpageattr{%/MediaBox [0 0 693.36000 594.00000]
  %/TrimBox [0.00000 9.00000 684.36000 585.00000]}
  \pdfminorversion=5
  \pdfcatalog{
  /OutputIntents [ <<
  /Info (none)
  /Type /OutputIntent
  /S /GTS_PDFX
  /OutputConditionIdentifier (dtu.dk)
  /RegistryName (http://www.color.org/)
  >> ]
  }
}
%
%
%======================================================================
%===  New headlines
%\@startsection{<type>}{<level>}{<indent>}{<beforeskip>}{<afterskip>}{<style>} 
\renewcommand{\section}{%
  \@startsection
    {section}{1}{0pt}{1.25\baselineskip}%
    {.25\baselineskip}{\usekomafont{section}}%
}
\renewcommand{\subsection}{%
  \@startsection
    {subsection}{2}{0pt}{0.75\baselineskip}%
    {-.25\baselineskip}{\usekomafont{subsection}}%
}
%
%
%======================================================================
%===  Define the new basic environments
\newenvironment{dtuposterhead}{ %
  \flushleft {\usekomafont{title} \dtuposter@title  } \par \vspace*{2\baselineskip} %
}{ %
  \vspace*{2\baselineskip} \par %
} %
%
\RequirePackage{xparse}
\NewDocumentCommand\dtuposterauthor{ s m }{%
  \IfBooleanTF#1%
    {\vspace*{-0.75\baselineskip}\par\flushleft {\usekomafont{minisec} #2 } \par } % with star
    {\vspace*{-0.25\baselineskip}\par\flushleft {\usekomafont{minisec} #2 } \par }
}
%
\NewDocumentCommand\dtuposteraffil{ s m }{%
  \IfBooleanTF#1%
    {\vspace*{-0.75\baselineskip}\par\flushleft {\usekomafont{dictum} #2 } \par } % with star
    {\vspace*{-0.25\baselineskip}\par\flushleft {\usekomafont{dictum} #2 } \par }
}
%
\RequirePackage{etoolbox}
\RequirePackage{multicol}
\setlength{\columnsep}{\textintercolumn}
\ifnumcomp{\dtuposter@columncount}{>}{1}{%
\newenvironment{dtupostercontent}{\begin{multicols}{\dtuposter@columncount}}{\end{multicols}}
}{%
\newenvironment{dtupostercontent}{}{}%
}
%
%
%======================================================================
%===  Additional new or redefined commands and environments
\newenvironment{fadebox}%
  {\begin{lrbox}{\@tempboxa}\begin{minipage}{0.975\linewidth}} %
  {\end{minipage}\end{lrbox} % box created, now load the rest
    \begin{tikzpicture} %
      %\begin{pgfonlayer}{background} %
      % set base node as marker
      \node [inner sep=0.5ex,line width=\bglinewidth,outer color=\dtuposter@bgcolor!0,inner color=white,draw=\dtuposter@bgcolor!5,rounded corners=2\bglinewidth] { %
        \usebox{\@tempboxa} %
      }; %
      %\end{pgfonlayer} %
    \end{tikzpicture} %\par
  } %
%
%
%\RequirePackage{caption}
%
\renewenvironment{table} %
  { \par \noindent \def\@captype{table} \begin{center} \begin{minipage}{0.9\linewidth} \begin{center} } %
  { \end{center} \end{minipage} \end{center} \par } %
%
\renewenvironment{figure} %
  { \par \noindent \def\@captype{figure} \begin{center} \begin{minipage}{0.9\linewidth} \begin{center} } %
  { \end{center} \end{minipage} \end{center} \par } %
%
%
\endinput