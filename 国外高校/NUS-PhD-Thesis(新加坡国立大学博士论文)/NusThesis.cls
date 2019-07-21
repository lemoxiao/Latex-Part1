%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% LaTeX class file for the PhD Thesis of NUS in Faculty of Science            %
% Designed by                                                                 %
%         Qian lilong  2019-07-3                                              %
% Email:  qian.lilong@u.nus.edu                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NusThesis}[2014/08/16 NUS PhD thesis  LaTeX class]
\LoadClass[openany]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% class option                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% class option:
%% loabychapter      : separate the list of algorithms by chapter
%% lotbychapter      : separate the list of tables     by chapter
%% lofbychapter      : separate the list of figures    by chapter
%% lolbychapter      : separate the list of codes      by chapter // use lstlisting environment
%% gray              : change colors to gray style
%% chapterstyletwo   : another type of chapter style
%% chapterstylethree : third type of chapter style
%% minitoc           : create a minitoc at each chapter
\DeclareOption{loabychapter}{\def\thesisloasep{true}}
\DeclareOption{lofbychapter}{\def\thesislofsep{true}}
\DeclareOption{lotbychapter}{\def\thesislotsep{true}}
\DeclareOption{lolbychapter}{\def\thesislolsep{true}}
\DeclareOption{gray}{\def\globalgray{true}}
\DeclareOption{chapterstyletwo}{\def\chapterstyletwo{true}}
\DeclareOption{chapterstylethree}{\def\chapterstylethree{true}}
\DeclareOption{minitoc}{\def\useminitoc{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % inherit book class option
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% define some color                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{xcolor}
\@ifundefined{globalgray}{
  \definecolor{pagenumber}{RGB}{255,255,255}
  \definecolor{chaptermark}{RGB}{0,102,255}
  \definecolor{headrule1}{RGB}{0,153,255}
  \definecolor{headrule2}{RGB}{0,204,255}
  \definecolor{chapterhead}{rgb}{0, 0, 0}
}
{
  \definecolor{pagenumber}{gray}{1}
  \definecolor{chaptermark}{gray}{0}
  \definecolor{headrule1}{gray}{0.2}
  \definecolor{headrule2}{gray}{0.4}
  \definecolor{chapterhead}{gray}{0.4}
}

% commands used after %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\dunderline[3][-1pt]{{%
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% configure                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{setspace}
\doublespacing             % double spacing
\setlength{\parskip}{0pt}  % 1ex plus 0.5ex minus 0.2ex}
\setlength{\parindent}{2em}
\RequirePackage{graphicx}
\graphicspath{{img/},{./}}
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}   
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} 
\RequirePackage{caption,float}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% some commands                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\newcommand*\cleartorightpage{%
  \clearpage
  \ifodd\value{page}
  \else\hbox{}\thispagestyle{empty}\newpage
  \fi
}

\makeatletter
% Define empty variables for creating title and setting PDF properties.
\RequirePackage{titling}
\def\degree#1{\def\@degree{#1}}\let\@degree\@empty
\def\authordegree#1{\def\@authordegree{#1}}\let\@authordegree\@empty
\def\subject#1{\def\@subject{#1}}\let\@subject\@empty
\def\department#1{\def\@department{#1}}\let\@department\@empty
\def\university#1{\def\@university{#1}}\let\@university\@empty
\def\declarationdate#1{\def\@declarationdate{#1}}\let\@declarationdate\@empty
\def\examinerone#1{\def\@examinerone{#1}}\let\@examinerone\@empty
\def\examinertwo#1{\def\@examinertwo{#1}}\let\@examinertwo\@empty
\def\examinerthree#1{\def\@examinerthree{#1}}\let\@examinerthree\@empty
\def\supervisor#1{\def\@supervisor{#1}}\let\@supervisor\@empty


\newcommand{\changefont}{\fontsize{9}{12}\selectfont}
\newcommand{\chapterheadfont}{\fontsize{6}{11}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% list of publication                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{bibentry}
\let\saved@bibitem\@bibitem
\nobibliography*
\newcommand{\listofpublications}[1]{%
  \chapter*{List of Publicatioins}
  \addstarredchapter{List of Publications}
%  \addcontentsline{toc}{chapter}{}
  \begin{enumerate}%
      \@for \el:=#1\do{\item \bibentry{\el}}%
  \end{enumerate}%
}

% mini toc %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\@ifundefined{useminitoc}{
   \let\addminitoc\@empty
}{
  \def\addminitoc{
    \rule{\textwidth}{1pt}\\[-2.5em]
    \startcontents[chapters]
    \printcontents[chapters]{}{1}{\contentsmargin{1em}}
    \vskip-12pt\noindent\rule{\textwidth}{1pt}
  }
}


% Set table layout and design.

\RequirePackage{booktabs, colortbl} % Tables.
\RequirePackage{tabularx}           % Auto column sizing.

\renewcommand{\arraystretch}{1.5}   % Set space between rows in a table.
\renewcommand{\tabcolsep}{0.20cm}   % Set space between columns in a table.
\heavyrulewidth = 0.15em            % Set width of heavy rules.
\lightrulewidth = 0.07em            % Set width of light rules.
\abovetopsep    = 0.1cm             % Set separation between caption and top rule.
\aboverulesep   = 0.4ex             % Set separation to use above a rule.
\belowrulesep   = 0.4ex     
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% headers                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\usetikzlibrary{decorations.fractals}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shapes}
%\renewcommand{\sectionmark}[1]{\markright{\thesection~-: ~#1}}
\fancypagestyle{basicstyle}
{%
  \fancyhf{}
  % chapter mark
  \fancyhead[OR]{\color{chaptermark} \leftmark}
  % section mark
  \fancyhead[EL]{\color{chaptermark} \changefont\slshape\rightmark}
    \renewcommand{\headrulewidth}{0pt}
  \fancyhead[EC]{
  \begin{tikzpicture}[remember picture,overlay]
    \coordinate (dia) at ([xshift=-0.7cm,yshift=-0.5mm]current page header area.south west);    
    \draw[headrule1,line width=0.3mm] ([yshift=0.5mm]dia.3) 
    -- ([yshift=0.5mm]current page header area.south east|-dia.3);
    \draw[headrule2,line width =0.2mm] (dia.355) 
    -- ([xshift=-7pt]current page header area.south east|-dia.355);
    \node[diamond,fill=headrule2] at  (dia)   {  \color{white}  {\tt\large\thepage}};
  \end{tikzpicture}
  }
  \fancyhead[OC]{
  \begin{tikzpicture}[remember picture,overlay]  
    \coordinate (dia) at ([xshift=0.7cm,yshift=-0.5mm]current page header area.south east);
    \draw[headrule1,line width=0.3mm] ([yshift=0.5mm,xshift=7pt]dia.177) 
    -- ([yshift=0.5mm]current page header area.south west|-dia.177);
    \draw[headrule2,line width =0.2mm] (dia.183) 
    -- ([xshift=7pt]current page header area.south west|-dia.183);
    \node[diamond,fill=headrule2] at (dia)    {  \color{white} \tt\large \thepage};
  \end{tikzpicture}
  }
}
% gray style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\fancypagestyle{gray}
{%
  \fancyhf{}
  % chapter mark
  \fancyhead[OR]{\leftmark}
  % section mark
  \fancyhead[EL]{\changefont\slshape\rightmark}
    \renewcommand{\headrulewidth}{0pt}
  \fancyhead[EC]{
  \begin{tikzpicture}[remember picture,overlay]
    \coordinate (dia) at ([xshift=-0.7cm,yshift=-0.5mm]current page header area.south west);    
    \draw[darkgray,line width=0.3mm] ([yshift=0.5mm]dia.3) 
    -- ([yshift=0.5mm]current page header area.south east|-dia.3);
    \draw[gray,line width =0.2mm] (dia.355) 
    -- ([xshift=-7pt]current page header area.south east|-dia.355);
    \node[diamond,fill=gray,draw=gray] at  (dia)   {  \color{white}  {\tt\large\thepage}};
  \end{tikzpicture}
  }
  \fancyhead[OC]{
  \begin{tikzpicture}[remember picture,overlay]  
    \coordinate (dia) at ([xshift=0.7cm,yshift=-0.5mm]current page header area.south east);
    \draw[darkgray,line width=0.3mm] ([yshift=0.5mm,xshift=7pt]dia.177) 
    -- ([yshift=0.5mm]current page header area.south west|-dia.177);
    \draw[gray,line width =0.2mm] (dia.183) 
    -- ([xshift=7pt]current page header area.south west|-dia.183);
    \node[diamond,fill=gray,draw=gray] at (dia)    {  \color{white} \tt\large \thepage};
  \end{tikzpicture}
  }
}
% circle style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\X}{\phantom{\large\tt\thepage}}
\newlength{\pagey}
\newlength{\marky}

\fancypagestyle{circle}
{%
  \setlength{\pagey}{0.37cm}
  \setlength{\marky}{0.2cm}
  \fancyhf{}
  % chapter mark
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[EC]{
    \begin{tikzpicture}[remember picture,overlay]  
      \node[shape=circle, fill=chaptermark!60] at
      ([xshift=-0.7cm,yshift=\pagey]current page header area.south west) 
      {\color{pagenumber}  {\large\tt\thepage}} ;
      \node[shape=circle, fill=chaptermark!40] at 
      ([xshift= 0.1cm,yshift=\pagey]current page header area.south west)  {\X} ;
      \node[shape=circle, fill=chaptermark!20] at 
      ([xshift= 0.9cm,yshift=\pagey]current page header area.south west) {\X};
      \node[shape=circle, fill=chaptermark!10] at 
      ([xshift= 1.7cm,yshift=\pagey]current page header area.south west)  {\X}; 
      \node[left ,text=chaptermark] at 
      ([xshift=1cm,yshift=\marky] current page header area.south east)  
      {\dunderline{1.5pt}{\hspace*{1em}\changefont\slshape\rightmark}}; 
    \end{tikzpicture}
  }
  \fancyhead[OC]{
    \begin{tikzpicture}[remember picture,overlay]      
      \node[shape=circle, fill=chaptermark!10] at 
      ([xshift=-1.7cm,yshift=\pagey]current page header area.south east)  {\X};
      \node[shape=circle, fill=chaptermark!20] at 
      ([xshift=-0.9cm,yshift=\pagey]current page header area.south east)  {\X};
      \node[shape=circle, fill=chaptermark!40] at 
      ([xshift=-0.1cm,yshift=\pagey]current page header area.south east)  {\X} ;
      \node[shape=circle, fill=chaptermark!60] at
      ([xshift= 0.7cm,yshift=\pagey]current page header area.south east) 
      { \color{pagenumber}  {\large\tt\thepage}};
      \node[right,text=chaptermark] at 
       ([xshift=-1cm,yshift=\marky] current page header area.south west)  
       {\dunderline{1.5pt}{\leftmark\hspace*{1em}}}; 
    \end{tikzpicture}
  }
}
% circle2 style  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{circle2}
{%
  \setlength{\pagey}{0.6cm}
  \setlength{\marky}{0.2cm}
  \fancyhf{}
  % chapter mark
  \renewcommand{\headrulewidth}{0pt}
  
  \fancyhead[EC]{
    \begin{tikzpicture}[remember picture,overlay]  
      \node[shape=circle, fill=chaptermark!50] at
      ([xshift=-2.5cm,yshift=1.7\pagey]current page header area.south west) 
      {\color{pagenumber}  {\large\tt\thepage}} ;
      \node[left ,text=chaptermark] at 
      ([xshift=1cm,yshift=\marky] current page header area.south east)  {\dunderline{1.5pt}{\hspace*{1em}\changefont\slshape\rightmark}}; 
    \end{tikzpicture}
  }
  \fancyhead[OC]{
    \begin{tikzpicture}[remember picture,overlay]      
      \node[shape=circle, fill=chaptermark!50] at
      ([xshift= 2.5cm,yshift=1.7\pagey]current page header area.south east) 
      { \color{pagenumber}  {\large\tt\thepage}};
      \node[right,text=chaptermark] at 
       ([xshift=-1cm,yshift=\marky] current page header area.south west)  {\dunderline{1.5pt}{\leftmark\hspace*{1em}}}; 
    \end{tikzpicture}
  }
}
% circle3 style  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{circle3}
{%
  \setlength{\pagey}{0.6cm}
  \setlength{\marky}{0.2cm}
  \fancyhf{}
  % chapter mark
  \renewcommand{\headrulewidth}{0pt}
  
  \fancyhead[EC]{
    \begin{tikzpicture}[remember picture,overlay]  
      \node[shape=circle, fill=chaptermark!50] at
      ([xshift=1.2cm,yshift=0\pagey]current page.west) 
      {\color{pagenumber}  {\large\tt\thepage}} ;
      \node[left ,text=chaptermark] at 
      ([xshift=1cm,yshift=\marky] current page header area.south east) 
      {\dunderline{1.5pt}{\hspace*{1em}\changefont\slshape\rightmark}}; 
    \end{tikzpicture}
  }
  \fancyhead[OC]{
    \begin{tikzpicture}[remember picture,overlay]      
      \node[shape=circle, fill=chaptermark!50] at
      ([xshift=-1.2cm,yshift=0\pagey]current page.east) 
      { \color{pagenumber}  {\large\tt\thepage}};
      \node[right,text=chaptermark] at 
      ([xshift=-1cm,yshift=\marky] current page header area.south west)
      {\dunderline{1.5pt}{\leftmark\hspace*{1em}}}; 
    \end{tikzpicture}
  }
}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Algorithms                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{algorithm}
\RequirePackage[algo2e, ruled, linesnumbered, algochapter]{algorithm2e}
\DontPrintSemicolon                     % Dont print semicolons at end of lines.
\algoheightrule       = \heavyrulewidth % Set the width of the top and bottom rules.
\algotitleheightrule  = \lightrulewidth % Set the width of the middle rule.
\SetAlgoInsideSkip{medskip}             % Set distance between middle rule and algorithm.
\interspacetitleruled = 0.2cm           % Set distance between caption and rules.
\setlength{\algomargin}{2.25em}         % Set the margin of the algorithm text.
\SetNlSkip{1.25em}                      % Set the spacing between line numbers and text.

\newenvironment{Algorithm}[1][H]
{%   

  \begin{algorithm2e}[#1]
    \SetKwInOut{Input}{Input} 
    \SetKwInOut{Output}{Output} 
    \linespread{1}                    % Set the line spacing to one and half.
    \selectfont                         % The linespread is effective only after selectfont.%
}
{%
	\end{algorithm2e}
}
\SetKwRepeat{Do}{do}{while}
\counterwithin*{algocf}{chapter}
\renewcommand{\thealgocf}{\arabic{chapter}.\arabic{algocf}}

% codes environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% using lstlisting 
\RequirePackage{listings}
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{RGB}{240,240,240}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\lstset{ %
  inputpath=algorithms,,
  backgroundcolor=\color{mygray},                  % choose the background color;
  basicstyle=\linespread{1}\footnotesize\ttfamily, % size of the fonts that are used for the code
  breakatwhitespace=false,                         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                                 % sets automatic line breaking
  captionpos=t,                                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},                    % comment style
  deletekeywords={\ldots},                         % if you want to delete keywords from the given language
                  %escapeinside={\%*}{*)},         % if you want to add LaTeX within your code
  extendedchars=true,                              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,                                    % adds a frame around the code
  keepspaces=true,                                 % keeps spaces in text, useful for keeping indentation of code 
  keywordstyle=\color{blue},                       % keyword style
                 %language=Matlab,                 % the language of the code
  otherkeywords={*,...},                           % if you want to add more keywords to the set
  numberbychapter = false,
  numbers=left,                                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                                   % how far the line-numbers are from the code
  numberstyle=\bf,                                 % the style that is used for the line-numbers
  rulecolor=\color{black},                         % if not set, the frame-color may be changed on line-breaks within not-black text 
  showspaces=false,                                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,                          % underline spaces within strings only
  showtabs=false,                                  % show tabs within strings adding particular underscores
  stepnumber=1,                                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve},                     % string literal style
  tabsize=2,                                       % sets default tabsize to 2 spaces
  title=\lstname,                                  % show the filename of files
  framextopmargin=5pt
}
\renewcommand\lstlistingname{\bf Code}
\renewcommand{\lstlistlistingname}{\bf List of Codes}
\let\oldlistofalgorithms\listofalgorithms
\renewcommand\listofalgorithms{
 \oldlistofalgorithms
 \addstarredchapter{List of Algorithms}
% \addcontentsline{toc}{chapter}{}
}
\let\oldlstlistoflistings\lstlistoflistings
\renewcommand\lstlistoflistings{
  \oldlstlistoflistings
  \addstarredchapter{List of Codes}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% D E C L A R A T I O N  P A G E
\newcommand{\AddDeclaration}[1][nosignimage]{%
	\cleartorightpage
	\thispagestyle{empty}
	\begin{center}
      \vspace*{1.5cm}
      {
        \Large \bfseries \uppercase{Declaration}
      }
    \end{center}

	\vspace{0.5cm}

	\begin{center}
      I hereby declare that this thesis is my original work and it has been written
      by me in its entirety. I have duly acknowledged all the sources of information 
      which have been used in the thesis. \newline

      This thesis has also not been submitted for any degree in any university
      previously.
	\end{center}

	\ifthenelse{\equal{#1}{nosignimage}}
	{
      \vspace{2.0cm}
      \begin{center}
         \rule{5cm}{0.2mm}
      \end{center}    
	}
	{
      \hspace*{1cm}
      \begin{center}
         \includegraphics[width=3.5cm]{#1}\\[-1.7cm]
      \vspace{0.5cm}
      \rule{5cm}{0.2mm}
      \end{center}
	}
    \vspace*{-2em}
	\begin{center} 
      \@author\\
     \@declarationdate\\
    \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% acknowledgement                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% The acknowledgments environment puts a large, bold, centered 
% "Acknowledgments" label at the top of the page. The acknowledgments
% themselves appear in a quote environment, i.e. tabbed in at both 
% sides, and on its own page.
\newenvironment{acknowledgments}%
{%
  \cleartorightpage
	\thispagestyle{plain}
    \chapter*{\uppercase{acknowledgement}}
    \addstarredchapter{Acknowledgem}
%    \addcontentsline{toc}{chapter}{Acknowledgement}
}
{%
    
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% summary                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newenvironment{summary}{%
  \cleartorightpage
  \thispagestyle{plain}
  \chapter*{summary}%
  \addstarredchapter{Summary}
%  \addcontentsline{toc}{chapter}{Summary}
}
{
  \par
}

%\setcounter{secnumdepth}{1} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%   bib                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Define a new command to include the bibliography file and 
% set the formatting options.
%\RequirePackage{natbib}
\let\IncludeBib\bibliography
\renewcommand{\bibliography}[1]
{%
	\clearpage                                   % Fix the page number in TOC.
	\phantomsection                              % Fix the link in PDF.
    \addstarredchapter{Bibliography}
%	\addcontentsline{toc}{chapter}{Bibliography} % Add the bibliography to TOC.
	\IncludeBib{#1}                            % Include the bibliography file.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% geome                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage[a4paper, left=1.5in, right=1.5in, top=1.2in, bottom=1in]{geometry}

                                          % Fix footnote spacing
\setlength{\footnotesep}{0.5cm}           % Distance between two footnotes.
\setlength{\skip\footins}{0.5cm}          % Distance between last line of text and first footnote.

\setlength{\textfloatsep}{1.5cm}          % Set the distance between a float and text.
\setlength{\floatsep}{1.0cm}              % Set the distance between two floats.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% title page                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% chapter                                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\@ifundefined{chapterstyletwo}{
  \@ifundefined{chapterstylethree}{
    %% default style
    \def\@makechapterhead#1{%
      \vspace*{-30\p@}%  								
      {\parindent \z@ \raggedright \normalfont
        \interlinepenalty\@M
        \begin{tikzpicture}
          \coordinate (x) at (0,1); 
          \coordinate (y) at (\textwidth,1);
          \coordinate (z) at (\textwidth,-0.5);
          \coordinate (w) at (0,-0.5);
          \draw[line width=1pt] (x)--(y)--(z)--(w)--cycle;
          \node[right=4pt,fill=white] at (x) {\huge{\bf C}{\bf\Large HAPTER}~~{\bf \huge\thechapter}};
          \node[left =4pt,fill=white] at (z) {\Large\bf\MakeUppercase{#1}};
        \end{tikzpicture}
        \par\nobreak
        \vskip 12.5\p@								
      }
    }
  }{
    %% chapterthree style
    \def\@makechapterhead#1{%
      \vspace*{-28\p@}%
      \begin{tikzpicture}[remember picture,overlay]   
        \coordinate (y) at ([xshift=2.38cm,yshift=-3.04cm]current page.north west);
        \coordinate (z) at ([xshift=0.7cm,yshift=-1cm]y);
        \coordinate (w) at ([xshift=0.7cm,yshift=-2cm]y);   
        \draw[line width =1pt] (w) --+(\textwidth+0.75cm,0);
        \draw[line width=1pt, draw = chapterhead,fill=chapterhead]
        (y)--+(1.4cm,0)--+(1.4cm,-4cm)--+(0,-4cm)--(y)--cycle;
        \draw[line width=1pt, draw = chapterhead]
        (z)--+(1.4cm,0)--+(1.4cm,-4cm)--+(0,-4cm)--(z)--cycle;
        \node[below] at ([xshift =7mm,yshift=-3cm]y) {\Huge\color{white}\bf \thechapter};
        
        \node[right] at ([xshift =1.8cm,yshift=-1.7cm]z) {\Huge\it\MakeUppercase{#1}};
        \node[below right,rotate=270] at ([xshift =5mm]y) {\color{white}\scshape\large \bf CHAPTER };
      \end{tikzpicture}
      \par
      \vskip160pt
    }
  }
}{
  %% chaptertwo style
  \def\@makechapterhead#1{%
    \vspace*{-28\p@}%
    \begin{tikzpicture}[remember picture,overlay]   
      \coordinate (y) at ([xshift=2.38cm,yshift=-3.295cm]current page.north west);
      \coordinate (z) at ([xshift=0.7cm,yshift=-1cm]y);
      \coordinate (w) at ([xshift=0.7cm,yshift=-2cm]y);
      \draw[line width =1pt] (w) --+(\textwidth+0.75cm,0);
      \node[above right] at ([xshift =-1.6mm]y) {\bf\chapterheadfont CHAPTER};
      \draw[line width=1pt, draw = chapterhead,fill=chapterhead]
      (y)--+(1.4cm,0)--+(1.4cm,-4cm)--+(0,-4cm)--(y)--cycle;
      \draw[line width=1pt, draw = chapterhead]
      (z)--+(1.4cm,0)--+(1.4cm,-4cm)--+(0,-4cm)--(z)--cycle;
      \node[below] at ([xshift =7mm,yshift=-6mm]y) {\Huge\color{white}\bf \thechapter};
      
      \node[right] at ([xshift =1.8cm,yshift=-1.7cm]z) {\Huge\it\MakeUppercase{#1}};
    \end{tikzpicture}
    \par
    \vskip160pt
  }
}
%% for stared chapter
\def\@makeschapterhead#1{%
  \vspace*{-30\p@}%  							
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M  
    \begin{tikzpicture}
      \coordinate (x) at (0,1); 
      \coordinate (y) at (\textwidth,1);
      \coordinate (z) at (\textwidth,0);
      \coordinate (w) at (0,0);
      \draw[line width=1pt] (x)--(y)--(z)--(w)--cycle;
      \node[left =4pt,fill=white] at (z) {\Large\bf\MakeUppercase{#1}};
    \end{tikzpicture}
    \par\nobreak
    \vskip 20\p@								
  }
}
\let\stdchapter\chapter
\renewcommand*\chapter{%
  \@ifstar{\starchapter}{\@dblarg\nostarchapter}}
\newcommand*\starchapter[1]{\cleartorightpage\stdchapter*{#1}}
\def\nostarchapter[#1]#2{\cleartorightpage\stdchapter[{#1}]{#2}\addminitoc}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% section                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%\RequirePackage{titlesec}
 %\RequirePackage{mfirstuc}
% \xmakefirstuc{\mytext}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                    {\bf\scshape}}
% \titleformat{\section}
%   {\bf\normalfont}{\thesection}{1em}{\xmakefirstuc{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%   list of tables and list of figures                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
\renewcommand\listoffigures{%
    \chapter*{\listfigurename
        \@mkboth{%
           \MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
    \@starttoc{lof}%
    \addstarredchapter{List of Figures}
%    \addcontentsline{toc}{chapter}{List of Figures}
}
\renewcommand\listoftables{%
    \chapter*{\huge\listtablename
        \@mkboth{%
           \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}%
    \addstarredchapter{List of Tables}
%    \addcontentsline{toc}{chapter}{List of Tables}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% list of symbols                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage[symbols,nogroupskip,sort=use]{glossaries-extra}
\RequirePackage{glossary-mcols}
\renewcommand{\@idxitem}{\par\hangindent20pt}
\newcommand{\entry}[2]
{
  \glsxtrnewsymbol[description={#2}]{#1}{\ensuremath{#1}}
}
\input{symbols.tex}
\newcommand\cdotfill{%
    \leavevmode\cleaders\hb@xt@.44em{\hss$\cdot$\hss}\hfill\kern\z@
}


%\setlength{\glsdescwidth}{0.1\hsize}
\GlsXtrEnablePreLocationTag{\cdotfill~{\color{blue}P.}}{P.}
\makenoidxglossaries
\newcommand{\listofsymbols}{  
  \printnoidxglossary[type=symbols,style=mcolindex,title={List of Symbols}]
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% title page                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% \renewcommand\maketitle{%
% \@maketitle}
\newcommand{\MakeUpperCase}[1]{\bf\MakeUppercase{#1}}
\renewcommand\maketitle{
\normalsize
  \begin{titlepage}%
    \thispagestyle{empty}
    \vspace*{0.3in}
    \begin{center}
      { \Large \MakeUpperCase{ \@title}}\\
    
      \vfill
      {\Large \MakeUpperCase{\@author} } \\
      {\large (\emph{\@authordegree})} \\
    
      \vfill     
      \MakeUpperCase{\relsize{0.99}A Thesis Submitted}\\
      \MakeUpperCase{\relsize{0.99}for the Degree of \@degree}\\
      {\relsize{0.99}\MakeUpperCase{\@department}} \\
      {\relsize{0.99}\MakeUpperCase{\@university}} \\
      {\relsize{0.99}\bf\the\year}\\
      \vspace{1em}
      \normalfont
      \vfill
      Supervisor:\\
      \@supervisor\\
      \vspace{1em}
      Examiners:\\
      \@examinerone\\
      \@examinertwo\\
      \@examinerthree     
    \end{center}
    \vspace{0.75in}
  \end{titlepage}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  separate the list of tob, loa, ... by chapter                              % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% initial definitions of the chapter info (name and number)
\def\thischaptertitle{}\def\thischapternumber{}
\newtoggle{noFigs}

\apptocmd{\@chapter}%
  {\gdef\thischaptertitle{#1}\gdef\thischapternumber{\thechapter}%
    \global\toggletrue{noFigs}}{}{}

% the figure environment does the job: the first time it is used after a \chapter command, 
% it writes the information of the chapter to the LoF
\AtBeginDocument{%
  \AtBeginEnvironment{figure}{%
    \iftoggle{noFigs}{
      \@ifundefined{thesislofsep}{}{
        \addtocontents{lof}{\protect\contentsline {chapter}%       
          {\protect\numberline {\thischapternumber} {\thischaptertitle}}{}{} }
      }
      \@ifundefined{thesislotsep}{}{
        \addtocontents{lot}{\protect\contentsline {chapter}%       
          {\protect\numberline {\thischapternumber} {\thischaptertitle}}{}{} }
      }
      \@ifundefined{thesisloasep}{}{
        \addtocontents{loa}{\protect\contentsline {chapter}%       
          {\protect\numberline {\thischapternumber} {\thischaptertitle}}{}{} }
      }
      \@ifundefined{thesislolsep}{}{
        \addtocontents{lol}{\protect\contentsline {chapter}%       
          {\protect\numberline {\thischapternumber} {\thischaptertitle}}{}{} }
      }
      \global\togglefalse{noFigs}
    }{}
  }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% hypper ref                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage{hyperref}
\let\@bibitem\saved@bibitem
\hypersetup{unicode=true,             % non-Latin characters in Acrobat’s bookmarks
  pdftoolbar=true,                    % show Acrobat’s toolbar?
  pdfmenubar=true,                    % show Acrobat’s menu?
  pdffitwindow=false,                 % window fit to page when opened
  pdfstartview={FitH},                % fits the width of the page to the window
  pdftitle={My title},                % title
  pdfauthor={Author},                 % author
  pdfsubject={Subject},               % subject of the document
  pdfcreator={Creator},               % creator of the document
  pdfkeywords={keyword1, key2, key3}, % list of keywords
  pdfnewwindow=true,                  % links in new PDF window
  colorlinks=true,                    % false: boxed links; true: colored links
  linkcolor=blue,                     % color of internal links (change box color with linkbordercolor)
  citecolor=blue,                     % color of links to bibliography
  filecolor=blue,                     % color of file links
  urlcolor=blue,                      % color of external links
  pdfencoding=auto, psdextra 
}


\@ifundefined{addstarredchapter}{
  \newcommand\addstarredchapter[1]{ \addcontentsline{toc}{chapter}{#1}}
}{}
%%
%%
\makeatother
\endinput 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% class file ends here                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%%% Local Variables:
%%% mode: latex
%%% TeX-master: "thesis"
%%% End:
