%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                	%
%  UT.UT.UT.UT.UT            UT.UT.UT.UT.UT.U  UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT""	%
%  UT.UT.UT.UT.UT          ""UT.UT.UT.UT.UT.U  UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT  	%
%  UT.UT.UT.UT.UT      ""UT.UT.UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.UT.;;    	%
%  UT.UT.UT.UT.UT      UT.UT.UT.UT.UT.UT.UT.U  UT.UT.UT.UT.UT.UT.UT.UT.UT;;      	%
%  UT.UT.UT.UT.UT    "UT.UT.UT.UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.UT        	%
%  UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.""          	%
%  UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.            	%
%  UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.UT.UT  UT.UT.UT.UT.UT.UT.UT.              	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT                UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT|  UT.UT.UT.UT.                      	%
%  UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.U    UT.UT.UT.UT.                      	%
%    UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.      UT.UT.UT.UT.                      	%
%      UT.UT.UT.UT.UT.UT.UT.UT.UT.UT.UT        UT.UT.UT.UT.                      	%
%        UT.UT.UT.UT.UT.UT.UT.UT.UT.U          UT.UT.UT.UT.                      	%
%            UT.UT.UT.UT.UT.UT.UT.U            UT.UT.UT.UT.                      	%
%-----------------------------------------------------------------------------------%
%-----------------------------------------------------------------------------------%
%	      T H E S I S	  &   	D I S S E R T A T I O N    T E M P L A T E			%
%-----------------------------------------------------------------------------------%
%-----------------------------------------------------------------------------------%
% This template is distributed with ABSOLUTELY NO WARRANTY.
% It serves as a guideline and constitutes a basic structure for a
% thesis/dissertation. The user assumes full responsibility for formatting
% and typesetting their document and for verifying that all the thesis
% requirements set by the University of Tennessee are met. Please refer to the most
% recent UT thesis guide (http://web.utk.edu/~thesis/thesisresources.shtml)
% or contact the thesis consultant (http://web.utk.edu/~thesis/).
% Please report any bugs to the thesis consultant.
\NeedsTeXFormat{LaTeX2e}%
\def\filename{utthesis.cls}%
\def\fileversion{ver 1.0.0}%
\def\filedate{March 30, 2010}%
\def\contributors{Tony Saad}%
\typeout{\filename}%
\typeout{\fileversion}%
\typeout{Created by Tony Saad}%
\typeout{\filedate}%
\typeout{Some parts and settings of this class are based on the template provided by David L. Page.}
%---------------------------------------------------------------------------------------------------%
\ProvidesClass{utthesis}
% some internal variables
\def\thesisID{1}%
\def\dissertationID{2}%
\def\theDocumentType#1{\gdef\@theDocumentType{#1}}%
\def\documentID#1{\gdef\@documentID{#1}}% documentID is either 1 (for thesis) or 2 (for dissertation)
% declare package options
\DeclareOption{thesis}{%
    \def\@theDocumentType{thesis}%
    \def\@documentID{\thesisID}}%
\DeclareOption{dissertation}{%
    \def\@theDocumentType{dissertation}%
    \def\@documentID{\dissertationID}}%
\DeclareOption{linespacing}{\@lnspacing}
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{color}}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ExecuteOptions{dissertation,letterpaper,12pt}% execute default options
\ProcessOptions%
\LoadClass{report} % single-sided
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	Main Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\copyrightYear#1{\gdef\@copyrightYear{#1}}%
\def\graduationMonth#1{\gdef\@graduationMonth{#1}}%
\def\majorProfessor#1{\gdef\@majorProfessor{#1}}%
\def\keywords#1{\gdef\@keywords{#1}}%
\def\viceProvost#1{\gdef\@viceProvost{#1}} %
\def\major#1{\gdef\@major{#1}}%
\def\degree#1{\gdef\@degree{#1}}%
\def\college#1{\gdef\@college{#1}}%
\def\dept#1{\gdef\@dept{#1}}%
\def\university#1{\gdef\@university{#1}}%
\def\numberOfCommitteeMembers#1{\gdef\@numberOfCommitteeMembers{#1}} % enter the number of committee members
\def\committeeMemberA#1 {\gdef\@committeeMemberA{#1}}% first committee member
\def\committeeMemberB#1 {\gdef\@committeeMemberB{#1}}% second committee member
\def\committeeMemberC#1 {\gdef\@committeeMemberC{#1}}% ... you get the trend!
\def\committeeMemberD#1 {\gdef\@committeeMemberD{#1}}%
\def\committeeMemberE#1 {\gdef\@committeeMemberE{#1}}%
% initialize macros
\def\@title{My Title}
\def\@author{My Name}
\def\@keywords{My Keywords}
\def\@graduationMonth{May}
\def\@copyrightYear{2009}
\def\@majorProfessor{My Advisor}
\def\@degree{Doctor of Philosophy}	% degree type
\def\@college{Engineering}           % college
\def\@dept{Mechanical, Aerospace and Biomedical Engineering}	% department
\def\@viceProvost{Carolyn R. Hodges}    % vice provost name
\def\@major{Mechanical Engineering}	% major
\def\@university{The University  of Tennessee, Knoxville}	% school
\def\@numberOfCommitteeMembers{3}
\def\@committeeMemberA {Committee member A}	% first committee member
\def\@committeeMemberB {Committee member B}	% second committee member
\def\@committeeMemberC {Committee member C}	% ... you get the trend!
\def\@committeeMemberD {Committee member D}	%
\def\@committeeMemberE {Committee member E}	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	LOAD PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsthm,amssymb}     % AMS math, AMS theorem, AMS fonts
\RequirePackage{setspace}                   % line spacing
\RequirePackage[vcentering,dvips]{geometry}	% help with margins
\RequirePackage[pdftex,plainpages=false,pdfpagelabels=true,breaklinks=true,pagebackref]{hyperref} % for pdf bookmarks
\RequirePackage{color}
%----------------------------------------------------------------------------------------------------%
% define theorem, corollary, and lemma environments
\theoremstyle{plain}
\newtheorem*{theorem*}{Theorem}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}{Lemma}[theorem]
%----------------------------------------------------------------------------------------------------%
% allow empty pages before chapters (i.e. no page numbers)
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage
%----------------------------------------------------------------------------------------------------%
\hypersetup{%
	bookmarksnumbered = true,
	pdftitle={\@title},
	pdfauthor={\@author},
	pdfsubject={\@dept},
	pdfkeywords={\@keywords},
	pdfpagelayout=SinglePage,
    bookmarksopen=False,
	%pdfview=FitV,
	pdfborder=0 0 0, 		% make all links invisible, so the pdf looks good when printed	
    pdffitwindow=true,      % window fit to page when opened
    %pdfstartview={FitV},   % fits the width of the page to the window
    pdfcreator={\@author},  % creator of the document
    pdfnewwindow=true,      % links in new window
    colorlinks=true,        % false: boxed links; true: colored links
    linkcolor=blue,         % color of internal links
    citecolor=magenta,      % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=cyan           % color of external links
}
%----------------------------------------------------------------------------------------------------%
\geometry{
    letterpaper,
    left = 1.5in,
    right = 1.0in,
    top = 1.0in,
    bottom = 1.375in
}
%\hyphenation{example, pa-ra-me-ter} % Over-ride Latex hyphenation, define hyphenated words
\hyphenpenalty=5000	% reduce hyphenation as much as possible
\tolerance=1000     % goes with the previous command
% Widow/orphan protection
\clubpenalty=10000    % Minimize orphans orphans(eliminate 10000)
\widowpenalty=10000   % Minimize widows
\brokenpenalty=10000  % Do not allow hyphen across pages
% Use cool footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\raggedbottom
\pagestyle{plain}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% makeTitlePage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeTitlePage} {
	\thispagestyle{empty}
    \begin{spacing}{1.5}
	\vspace*{0.3in}
	\begin{center}
		\huge
		\bf
		\@title%
		%\vspace*{1.5in} \mbox{} \\
        \vfill
		\Large \rm
        \ifnum\@documentID=\thesisID {
            A Thesis Presented for

            The \@degree
        } \else {
            A Dissertation

            Presented for the

            \@degree
        } \fi
		
		Degree
		
		\@university
		
		\vspace*{1.0in}%
		
		\@author %
		\\%
		\@graduationMonth\ \@copyrightYear
	\end{center}
    \end{spacing}
    \cleardoublepage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		makeApprovalPage: this macro will make the approval page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand {\makeApprovalPage} {
	\thispagestyle{empty}
	\begin{spacing}{1.1}
    	\noindent To the Graduate Council:

    	\noindent I am submitting herewith a \@theDocumentType\ written by \@author \, entitled ``\@title.''
    	I have examined the final paper copy of this \@theDocumentType\ for form and
    	content and recommend that it be accepted in partial fulfillment
    	of the requirements for the degree of \@degree, with a major in \@major.
    	\vspace*{.35in} \noindent
    	\newline
    	\hspace*{3.5in}\underline{\hspace*{2.5in}}
    	\newline
    	\hspace*{3.5in}\@majorProfessor, Major Professor %
    	\begin{singlespace}
    		\noindent We have read this \@theDocumentType
    		\newline  and recommend its acceptance:
            \addCommitteeMember{\@committeeMemberA}
            \addCommitteeMember{\@committeeMemberB}
            \ifnum\@numberOfCommitteeMembers>2
                \addCommitteeMember{\@committeeMemberC}
            \fi
            \ifnum\@numberOfCommitteeMembers>3
                \addCommitteeMember{\@committeeMemberD}
            \fi
            \ifnum\@numberOfCommitteeMembers>4
                \addCommitteeMember{\@committeeMemberE}
            \fi
            \vfill
            {\noindent \hspace*{2.65in}Accepted for the Council:
            \\[20pt]
        	\hspace*{2.65in}\underline{\hspace*{2.5in}}
            \newline
    		\hspace*{2.65in}\@viceProvost
            \\[6pt]
    		\hspace*{2.6in} Vice Provost and Dean of the Graduate School}
    	\end{singlespace}
    \end{spacing}
	\pagebreak%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		makeETDApprovalPage: this macro will make the ETD approval page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand {\makeETDApprovalPage} {
	\thispagestyle{empty}
    \begin{spacing}{1.1}
    	\noindent To the Graduate Council:

    	\noindent I am submitting herewith a \@theDocumentType\ written by \@author \, entitled ``\@title.''
    	I have examined the final electronic copy of this \@theDocumentType\ for form and
    	content and recommend that it be accepted in partial fulfillment
    	of the requirements for the degree of \@degree, with a major in \@major.
    	\vspace*{.05in} \noindent
    	{\begin{flushright} \@majorProfessor, Major Professor \end{flushright}} %
        \vspace*{.1in} \noindent
    	\begin{singlespace}
        	\noindent We have read this \@theDocumentType
        	\newline  and recommend its acceptance:        	
            \addCommitteeMemberETD{\@committeeMemberA}
            \addCommitteeMemberETD{\@committeeMemberB}
            \ifnum\@numberOfCommitteeMembers>2
                \addCommitteeMemberETD{\@committeeMemberC}
            \fi
            \ifnum\@numberOfCommitteeMembers>3
                \addCommitteeMemberETD{\@committeeMemberD}
            \fi
            \ifnum\@numberOfCommitteeMembers>4
                \addCommitteeMemberETD{\@committeeMemberE}
            \fi
            \vfill
                \noindent \hspace*{2.65in}Accepted for the Council:
                \newline
                \\[-2pt]
                \noindent \hspace*{2.65in}\@viceProvost
                \\[-8pt]
            	\noindent \hspace*{2.65in}\underline{\hspace*{2.5in}}
                \newline		
                \newline
        		\hspace*{2.65in}Vice Provost and Dean of the Graduate School
                \begin{center}
                    (Original signatures are on file with official student records.)
                \end{center}
    	\end{singlespace}
    \end{spacing}
	\pagebreak%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\addCommitteeMember}[1] {
	\vspace*{.3in}%
    \newline%
	\underline{\hspace*{2.5in}}%
	\\[8pt]%
	\noindent #1%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\addCommitteeMemberETD}[1] {
    \vspace*{.25in}%
    \newline%
	\noindent #1%
    \\[-8pt]%
	\underline{\hspace*{2.5in}}%
    \newline%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeAppendixPage}{
    \newpage
    \vspace*{2.0in}
    \begin{center}\Huge \bf{Appendix} \end{center}
    \newpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeBibliographyPage}{
    \newpage % create a new page for the bibliography title
    \addToTOC{Bibliography} % add bibliography to table of contents
    \vspace*{2.0in} % move down the page 2.0 inches
    \begin{center}\Huge\bf{Bibliography}\end{center} % make the bibliography title
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addToTOC: macro that adds an entry to the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand {\addToTOC}[1] {
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{#1}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addToPDFBookmarks: macro that adds a bookmark to the PDF file
%                   without including it in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand {\addToPDFBookmarks}[3] {
	\cleardoublepage
	\phantomsection
	\pdfbookmark[#1]{#2}{#3}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% makeCopyrightPage: this macro will make the copyright page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand {\makeCopyrightPage} {
    %\thispagestyle{empty}
    \phantom{.}
    \vspace*{4in}
    \begin{center}
        \copyright\ by \@author, \@copyrightYear \\
        All Rights Reserved.
    \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput 
