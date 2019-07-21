%
% China University of Geosciences Thesis Template
% For Master Degree
%
%
%   Version
%       Beta
%   Created 
%       2015.03.06 by seeksky@CUG
%   Last Modified
%       2015.03.06 by seeksky@CUG
%
%       $Id$
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{cugthesis}[2015/03/06 CUGthesis document class. Created: 2015.03.06 by seeksky@CUG, Last Modified: 2015.03.06 by seeksky@CUG]

%Dew class options
\newif\ifustc@basic\ustc@basicfalse
\newif\ifustc@oldfontcfg\ustc@oldfontcfgfalse
\newif\ifustc@master\ustc@masterfalse
\newif\ifustc@doctor\ustc@doctorfalse
\newif\ifustc@bachelor\ustc@bachelorfalse
\newif\ifustc@adobefont\ustc@adobefontfalse
\newif\ifustc@euler\ustc@eulerfalse
\newif\ifustc@notchinese\ustc@notchinesefalse

%Define new commands
\def\ustc@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname ustc@#1\endcsname{##1}}
  \csname #1\endcsname{}}

%By default, the template will load the extra pack which includes some commonly used packages and macros. Use `basic' option to load necessary/basic packages in case of compatibility problems.
\DeclareOption{basic}{\ustc@basictrue}
%CTeX has its own font configurations so that it is unnecessary to define font family by user. Those who want to use old font configurations of former ustcthesis should use `oldfontcfg' option.
\DeclareOption{oldfontcfg}{\ustc@oldfontcfgtrue}
%Dissertation categories - use only one option at a time, never try to use more than one options.
\DeclareOption{master}{\ustc@mastertrue}
\DeclareOption{doctor}{\ustc@doctortrue}
\DeclareOption{bachelor}{\ustc@bachelortrue}
%For English and/or other language users
\DeclareOption{notchinese}{\ustc@notchinesetrue}
%Use Euler math font
\DeclareOption{euler}{\ustc@eulertrue}


%Enhance compatibility
\DeclareOption{adobefonts}{\ustc@adobefonttrue\PassOptionsToClass{adobefonts}{ctexbook}}
\DeclareOption{adobefont}{\ustc@adobefonttrue\PassOptionsToClass{adobefonts}{ctexbook}}

%Pass all unprocessed/unknown options to ctexbook. If a wrong option is specified, perhaps ctexbook will throw an error.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

%Minimum xeCJK version:3.2.10, date:2014/03/01
\PassOptionsToPackage{CJKchecksingle}{xeCJK}
%不再鼓励使用$$...$$的方式输入公式，可能会引起奇怪的问题
%如果一定要用$$...$$输入公式。请在更新到上述版本后加入PlainEquation选项。

\LoadClass[c5size,executivepaper,fancyhdr,fntef]{ctexbook}
      
%%%%%%%%%%%%%%%%%%%%%%% begin of extra component %%%%%%%%%%%%%%%%%%%%%%
% extra pack is integreted with the main latex class.
%
% China University of Geosciences Thesis Template
% For Master
%
%   Version
%       Beta
%   Created 
%       2014.03.26 by ywg@USTC
%   Last Modified
%       2015.03.06 by seeksky@CUG
%
%       $Id$
%
\RequirePackage{times}
\RequirePackage[lined,boxed,linesnumbered,algochapter]{algorithm2e}
\RequirePackage{graphicx,psfrag}
\RequirePackage{enumerate}
\RequirePackage{subfig,epsfig}
\RequirePackage{float}
\RequirePackage{paralist}
\RequirePackage{booktabs}
\RequirePackage[perpage,symbol]{footmisc}
\RequirePackage[integrals]{wasysym}
\RequirePackage{longtable}
	% Set default longtable alignment
	\setlength\LTleft{0pt}
	\setlength\LTright{0pt}
\RequirePackage{bbm}
\RequirePackage{indentfirst}
\RequirePackage{ifthen}
%\RequirePackage{caption3}
\RequirePackage{array}
\RequirePackage{fancyvrb}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\ifustc@euler
	\usepackage[OT1,euler-digits]{eulervm}
\fi
\RequirePackage{url}	\def\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z\do\[\do\\\do\]\do\^\do\_\do\`\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\0\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]\do\)\do\,\do\?\do\'\do+\do\=\do\#}

\ustc@define@term{ustcloaname}
\ifustc@notchinese
	\ustcloaname{List of Algorithm}
	\renewcommand{\algorithmcfname}{Algorithm}
\else
	\ustcloaname{算法索引}
	\renewcommand{\algorithmcfname}{算法}
\fi
\renewcommand{\listalgorithmcfname}{\ustc@ustcloaname}
\newcommand\ustcloa{
\cleardoublepage\wuhao{\listofalgorithms}
  \thispagestyle{empty}
  \pagestyle{empty}}

\ifustc@oldfontcfg
	\ifustc@adobefont
		\setCJKmainfont[BoldFont={Adobe Heiti Std}, ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
		\setCJKsansfont{Adobe Heiti Std}
		\setCJKmonofont{Adobe Fangsong Std}
	
		\setCJKfamilyfont{song}{Adobe Song Std}
		\setCJKfamilyfont{hei}{Adobe Heiti Std}
		\setCJKfamilyfont{kai}{Adobe Kaiti Std}
		\setCJKfamilyfont{fs}{Adobe Fangsong Std}
		%\setCJKfamilyfont{verthei}[RawFeature={vertical:}]{Adobe Heiti Std}%{Adobe Heiti Std} 这里还是改成Adobe Heiti Std吧，在Linux下面SimHei貌似不行，改成这个就好了
	\else
		\setCJKmainfont[BoldFont={SimHei}, ItalicFont={KaiTi}]{NSimSun}
		\setCJKsansfont{SimHei}
		\setCJKmonofont{FangSong}
	
		\setCJKfamilyfont{song}{NSimSun}
		\setCJKfamilyfont{hei}{SimHei}
		\setCJKfamilyfont{kai}{KaiTi}   % XP对应 KaiTi_GB2312，Vista对应KaiTi，注意根据系统切换
		\setCJKfamilyfont{fs}{FangSong} % XP对应 FangSong_GB2312，Vista对应FangSong，注意根据系统切换
	\fi
\fi

\newcommand{\song}{\CJKfamily{song}}    % 宋体
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体

\setmainfont{Times New Roman}
\setsansfont[BoldFont={Courier New Bold}]{Courier New}
\setmonofont[BoldFont={Arial:style=Bold}]{Arial}



%在正文中无论是否在图形环境中，用 \figcaption 均可得到图形标题
%同样，无论是否在表格环境中，用 \tabcaption 均可得到表格标题。
\newcommand\figcaption{\def\@captype{figure}\caption} 
\newcommand\tabcaption{\def\@captype{table}\caption}

%提供表格环境下p{width}加强版命令，使用L{width}等可以在指定宽度的同时指定对齐方式。
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp} 
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}} 
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}} 
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}} 

%Superscript reference
\newcommand{\scite}[1]{\textsuperscript{\cite{#1}}}

\newenvironment{denotation}[1][2.5cm]{
  \cleardoublepage
  \ifustc@notchinese
  		\chapter*{Nomenclature}
  \else
  		\chapter*{主要符号对照表} % no tocline
  \fi
  \thispagestyle{empty}
  \noindent\begin{list}{}%
    {\vskip-30bp%\xiaosihao[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\dimexpr\labelwidth+\labelsep} % 左边界，zym@USTC说\dimexpr在texlive2011/12上不正常，替代方法是使用calc宏包
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}

%upStand Greek Letters
\DeclareMathSymbol{\upGamma}{\mathord}{operators}{0}
\DeclareMathSymbol{\upDelta}{\mathord}{operators}{1}
\DeclareMathSymbol{\upTheta}{\mathord}{operators}{2}
\DeclareMathSymbol{\upLambda}{\mathord}{operators}{3}
\DeclareMathSymbol{\upXi}{\mathord}{operators}{4}
\DeclareMathSymbol{\upPi}{\mathord}{operators}{5}
\DeclareMathSymbol{\upSigma}{\mathord}{operators}{6}
\DeclareMathSymbol{\upUpsilon}{\mathord}{operators}{7}
\DeclareMathSymbol{\upPhi}{\mathord}{operators}{8}
\DeclareMathSymbol{\upPsi}{\mathord}{operators}{9}
\DeclareMathSymbol{\upOmega}{\mathord}{operators}{10}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%自定义代码环境code codex 和codescript
%代码来自：陈硕 (giantchen@gmail.com)
%位于：用LaTeX排版编程技术书籍的一些个人经验
%经过小幅修改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\labelfont}{\bfseries}%定义label字体

\def\FV@SetLineWidth{%
  \if@FV@ResetMargins\else
    \advance\leftmargin\@totalleftmargin
  \fi
  \advance\leftmargin\FV@XLeftMargin\relax
  \advance\rightmargin\FV@XRightMargin\relax
  \linewidth\hsize
  %\advance\linewidth-\leftmargin
  %\advance\linewidth-\rightmargin
  \hfuzz\FancyVerbHFuzz\relax}


\def\FV@SingleFrameLine#1{%
%% DG/SR modification end
  \hbox to\z@{%
    %\kern\leftmargin
%% DG/SR modification begin - Jun. 22, 1998
    \ifnum#1=\z@
      \let\FV@Label\FV@LabelBegin
    \else
      \let\FV@Label\FV@LabelEnd
    \fi
    \ifx\FV@Label\relax
%% DG/SR modification end
      \FancyVerbRuleColor{\vrule \@width\linewidth \@height\FV@FrameRule}%
%% DG/SR modification begin - Jun. 22, 1998
    \else
      \ifnum#1=\z@
        \setbox\z@\hbox{\strut\enspace\labelfont\FV@LabelBegin\strut}%
      \else
        \setbox\z@\hbox{\strut\enspace\labelfont\FV@LabelEnd\strut}%
      \fi
      \@tempdimb=\dp\z@
      \advance\@tempdimb -.5\ht\z@
      \@tempdimc=\linewidth
      \advance\@tempdimc -\wd\z@
      %\divide\@tempdimc\tw@
      \ifnum#1=\z@              % Top line
        \ifx\FV@LabelPositionTopLine\relax
          \FancyVerbRuleColor{\vrule \@width\linewidth \@height\FV@FrameRule}%
        \else
          \FV@FrameLineWithLabel
        \fi
      \else                     % Bottom line
        \ifx\FV@LabelPositionBottomLine\relax
          \FancyVerbRuleColor{\vrule \@width\linewidth \@height\FV@FrameRule}%
        \else
          \FV@FrameLineWithLabel
        \fi
      \fi
    \fi
%% DG/SR modification end
    \hss}}


%% DG/SR modification begin - May. 19, 1998
\def\FV@FrameLineWithLabel{%
  \ht\z@\@tempdimb\dp\z@\@tempdimb%
  \FancyVerbRuleColor{%
    \raise 0.5ex\hbox{\vrule \@width\@tempdimc \@height\FV@FrameRule}%
    \raise\@tempdimb\box\z@}}
%% DG/SR modification end


\def\FV@EndListFrame@Lines{%
  \begingroup
    %\vskip 0.5ex
    \baselineskip\z@skip
    \kern\FV@FrameSep\relax
%% DG/SR modification begin - May. 19, 1998
%%    \FV@SingleFrameLine
    \FV@SingleFrameLine{\@ne}%
%% DG/SR modification end
  \endgroup}

\newskip\mytopsep
\setlength{\mytopsep}{4pt plus 2pt minus 3pt}

\def\FV@ListVSpace{%
  \@topsepadd\mytopsep
  \if@noparlist\advance\@topsepadd\partopsep\fi
  \if@inlabel
    \vskip\parskip
  \else
    \if@nobreak
      \vskip\parskip
      \clubpenalty\@M
    \else
      \addpenalty\@beginparpenalty
      \@topsep\@topsepadd
      \advance\@topsep\parskip
      \addvspace\@topsep
    \fi
  \fi
  %\showthe \@topsepadd
  %\showthe \topsep
  %\showthe \partopsep
  %\showthe \parskip
  \global\@nobreakfalse
  \global\@inlabelfalse
  \global\@minipagefalse
  \global\@newlistfalse}

\def\FV@EndList{%
  \FV@ListProcessLastLine
  \FV@EndListFrame
  %\showthe \@topsepadd
  \@endparenv
  \endgroup
  \@endpetrue}

\def\theFancyVerbLine{\sffamily\scriptsize\arabic{FancyVerbLine}}

\DefineVerbatimEnvironment%
  {Codex}{Verbatim}
  {fontsize=\small,baselinestretch=0.9,xleftmargin=3mm,%
  frame=lines,labelposition=all,framesep=5pt}

\DefineVerbatimEnvironment%
  {Code}{Verbatim}
  {fontsize=\small,baselinestretch=0.9,xleftmargin=3mm}

\DefineVerbatimEnvironment%
  {CodeScript}{Verbatim}
  {fontsize=\scriptsize,baselinestretch=0.9,xleftmargin=3mm}
\DefineVerbatimEnvironment%
  {CodexScript}{Verbatim}
  {fontsize=\scriptsize,baselinestretch=0.9,xleftmargin=3mm,%
  frame=lines,labelposition=all,framesep=5pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%code environment, from ctex-faq
%没有经过实际测试，注意大小写
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{example@bkcolor}{gray}{.875}
%
\newwrite\example@out
\def\example@start{%
  \begingroup% Lets Keep the Changes Local
  \@bsphack
  \immediate\openout \example@out \jobname.exa
  \let\do\@makeother\dospecials\catcode`\^^M\active
  \def\verbatim@processline{%
    \immediate\write\example@out{\the\verbatim@line}}%
  \verbatim@start}
\def\example@finish{\immediate\closeout\example@out\@esphack\endgroup}
\def\example@code#1#2{%
  \colorbox{#1}{%
    \begin{minipage}[c]{#2}%
      \small\verbatiminput{\jobname.exa}%
    \end{minipage}%
  }%
}
\def\example@output#1{%
  \let\savefboxrule\fboxrule%
  \let\savefboxsep\fboxsep%
  \setlength{\fboxrule}{0.1pt}%
  \setlength{\fboxsep}{3mm}%
  \fbox{%
    \begin{minipage}[c]{#1}%
      \setlength{\fboxrule}{\savefboxrule}%
      \setlength{\fboxsep}{\savefboxsep}%
      \setlength{\parskip}{1ex plus 0.4ex minus 0.2ex}%
      \begin{trivlist}\item\small\input{\jobname.exa}\end{trivlist}
    \end{minipage}
  }%
}
\newenvironment{code}%
  {\example@start}%
  {\example@finish%
   \list{}{\itemindent-\leftmargin}\item\relax%
   \makebox[\textwidth][c]{%
     \example@code{example@bkcolor}{0.96\textwidth}%
   }%
   \endlist}
%%%%%%%%%%%%%%%%%%%%%%% end of extra component %%%%%%%%%%%%%%%%%%%%%%

% Alter some LaTeX defaults for better treatment of figures:
% See p.105 of "TeX Unbound" for suggested values.
% See pp. 199-200 of Lamport's "LaTeX" book for details.
%   General parameters, for ALL pages:
\renewcommand{\topfraction}{0.9}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}	% max fraction of floats at bottom
%   Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
\renewcommand{\textfraction}{0.07}	% allow minimal text w. figs
%   Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.7}	% require fuller float pages
% N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages
%remember to use [htp] or [htpb] for placement

%Add by xujinlai@gmail.com: set the float sep to 0pt
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
\setlength{\parskip}{0pt}
\setlength{\floatsep}{0pt}
\setlength{\textfloatsep}{5pt}
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}
\setlength{\arraycolsep}{0pt}
\setlength{\topsep}{0pt}
\setlength{\partopsep}{0pt}
\setlength{\itemsep}{0pt}
\setlength{\parsep}{0pt}

%Check if user has specified one dissertation option.
\ifustc@master\relax\else
	\ifustc@doctor\relax\else
		\ifustc@bachelor\relax\else
			\ClassError{USTCthesis}{You have to specify one of thesis options: bachelor, master or doctor.}{}
		\fi
	\fi
\fi

%Ensure only one dissertation option is specified.
\newcommand\ustc@error{\ClassError{USTCthesis}{You can ONLY specify ONE KEY option: bachelor, master or doctor!}{}}
\ifustc@doctor
	\ifustc@master
		\ustc@error
	\else
		\ifustc@bachelor
			\ustc@error
		\fi
	\fi
\else
	\ifustc@master
		\ifustc@bachelor
			\ustc@error
		\fi
	\fi
\fi
	
%load basic packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage[
  paperwidth=19.5cm,
  paperheight=27cm,
	left=2.5cm,
	right=2.5cm,
	top=2.5cm,
	bottom=2.5cm,
	headsep=0.25cm,
	headheight=1.92cm,
	footskip=1.75cm,
%	showframe%uncomment this if you want to check the page setup.
	]{geometry}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\and{and }}
\hypersetup{
	CJKbookmarks=true,%
	bookmarksnumbered=true,%
	bookmarksopen=true,
	breaklinks=true,
	colorlinks=true,%
	linkcolor=black,%
	citecolor=black,%
	plainpages=false,%
	pdfstartview=FitH,}
\AtBeginDocument{\hypersetup{%
	pdftitle={\ustc@title,\ustc@entitle},%
	pdfauthor={\ustc@author,\ustc@enauthor},%
	pdfkeywords={},%Either put keywords here or not, as you wish.
	pdfcreator={LaTeX with hyperref package, using CUG LaTeX Thesis Template for Master}}}
\RequirePackage[numbers,sort&compress,square]{natbib}
\def\bibfont{\wuhao}
\setlength{\bibsep}{0pt plus1pt minus1pt}
\setlength{\bibhang}{2\ccwd}%Applied only to author-year style
\RequirePackage[format=hang,labelsep=quad]{caption}
\DeclareCaptionFont{cs5size}{\xiaowu}
\captionsetup[table]{labelfont={cs5size,bf}}
\captionsetup[table]{textfont={cs5size,bf}}
\captionsetup[figure]{labelfont={cs5size}}
\captionsetup[figure]{textfont={cs5size}}

%Chinese font size
\newcommand{\chuhao}    {\fontsize{42pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochu}   {\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\yihao}     {\fontsize{28pt}   {\baselineskip}\selectfont}
\newcommand{\erhao}     {\fontsize{22pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoer}    {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoerhao} {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\sanhao}    {\fontsize{15.75pt}{\baselineskip}\selectfont}
\newcommand{\xiaosan}   {\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\sihao}     {\fontsize{14pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosi}    {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosihao} {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\wuhao}     {\fontsize{10.5pt} {\baselineskip}\selectfont}
\newcommand{\xiaowu}    {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\xiaowuhao} {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\liuhao}    {\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\qihao}     {\fontsize{5.25pt} {\baselineskip}\selectfont}

%Define font for vertical typesetting.
\ifustc@adobefont
	\setCJKfamilyfont{verthei}[RawFeature={vertical:}]{Adobe Heiti Std}\relax
\else%
	\setCJKfamilyfont{verthei}[RawFeature={vertical:}]{SimHei}\relax
\fi
\newcommand{\ustc@verthei}{\CJKfamily{verthei}}

%Set section numbering to subsubsection
\setcounter{secnumdepth}{3}
%Set numbering style to X.X
\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

%Old configurations which should not be used
%\titleformat{\section}{\flushleft\hei\sihao}{\thesection}{1em}{}
%\titleformat{\subsection}{\flushleft\hei\xiaosi}{\thesubsection}{1em}{}
%\titleformat{\subsubsection}{\flushleft\hei\wuhao}{\thesubsubsection}{1em}{}
%\renewcommand\chaptername{第\,\chinese{chapter}\,章}
%\titleformat{\chapter}{\centering\sanhao\hei}{\chaptername}{1em}{}
%\titlespacing{\chapter}{0cm}{.5cm}{1.5cm} %left above below
%\titlespacing{\chapter}{0cm}{0pt}{0pt} %left above below

%Title setup
\CTEXsetup[format={\centering}]{chapter}%规定16pt，三号为15.75pt
\CTEXsetup[nameformat={\song\erhao}]{chapter}
\CTEXsetup[titleformat={\song\erhao}]{chapter}
\CTEXsetup[beforeskip={15pt}]{chapter}
\CTEXsetup[afterskip={35pt}]{chapter}
\CTEXsetup[format={\centering\hei\sanhao}]{section}%规定14pt，即四号
%\CTEXsetup[beforeskip=15pt]{section}%规定13pt
%\CTEXsetup[afterskip=35pt]{section}%规定13pt
\CTEXsetup[format={\flushleft\hei\sihao}]{subsection}%规定13pt
\CTEXsetup[beforeskip=-5pt]{subsection}%规定13pt
\CTEXsetup[afterskip=-5pt]{subsection}%规定13pt
\CTEXsetup[beforeskip=0pt]{subsubsection}%规定13pt
\CTEXsetup[afterskip=0pt]{subsubsection}%规定13pt
\CTEXsetup[format={\flushleft\hei\xiaosihao}]{subsubsection}%规定12pt，即小四号
\CTEXsetup[number={\S\arabic{chapter}.\arabic{section}}]{section}
\ifustc@notchinese
	\CTEXsetup[name={Part\space,}]{part}
	\CTEXsetup[name={Chapter\space,}]{chapter}
	\CTEXsetup[number={\Roman{part}}]{part}
	\CTEXsetup[number={\arabic{chapter}}]{chapter}
	\CTEXsetup[name={Appendix\space}]{appendix}
	\CTEXoptions[contentsname={Table of Contents}]
	\CTEXoptions[listfigurename={List of Figures}]
	\CTEXoptions[listtablename={List of Tables}]
	\CTEXoptions[figurename={Figure}]
	\CTEXoptions[tablename={Table}]
	\CTEXoptions[indexname={Indexes}]
	\CTEXoptions[bibname={References}]
\else
	\relax
\fi
\titlespacing*{\section}
  {0pt}{19pt}{19pt}
\titlespacing*{\subsection}
  {0pt}{5pt}{5pt}
\titlespacing*{\subsubsection}
  {0pt}{5pt}{5pt}


%Define new commands for List of Figures/Tables
\ustc@define@term{ustclofname}
\ustc@define@term{ustclotname}
\ifustc@notchinese
	\ustclofname{List of Figures}
	\ustclotname{List of Tables}
\else
	\ustclofname{插图索引}
	\ustclotname{表格索引}
\fi
\CTEXoptions[listfigurename={\ustc@ustclofname}]
\CTEXoptions[listtablename={\ustc@ustclotname}]
\newcommand\ustclot{\cleardoublepage
\wuhao{\listoftables}
\thispagestyle{empty}
\pagestyle{empty}}
\newcommand\ustclof{\cleardoublepage
\wuhao{\listoffigures}
  \thispagestyle{empty}
  \pagestyle{empty}}

%New mathematical environments
\ifustc@notchinese
	\newtheorem{theorem}{\textbf{\hspace{0.7cm}Theorem}}[section]
	\newtheorem{lemma}{\textbf{\hspace{0.7cm}Lemma}}[section]
	\newtheorem{example}{\textbf{\hspace{0.7cm}Example}}[section]
	\newtheorem{definition}{\textbf{\hspace{0.7cm}Definition}}[section]
	\newtheorem{axiom}{\textbf{\hspace{0.7cm}Axiom}}[section]
	\newtheorem{property}{\textbf{\hspace{0.7cm}Property}}[section]
	\newtheorem{proposition}{\textbf{\hspace{0.7cm}Proposition}}[section]
	\newtheorem{corollary}{\textbf{\hspace{0.7cm}Corollary}}[section]
	\newtheorem{remark}{\textbf{\hspace{0.7cm}Remark}}[section]
	\newtheorem{condition}{\textbf{\hspace{0.7cm}Condition}}[section]
	\newtheorem{conclusion}{\textbf{\hspace{0.7cm}Conclusion}}[section]
	\newtheorem{assumption}{\textbf{\hspace{0.7cm}Assumption}}[section]
	\newtheorem{prove}{\textbf{\hspace{0.7cm}Prove}}[section]
	\renewcommand{\proofname}{Proof}
	\renewcommand\appendixname{Appendix}
	%New autorefname
	\def\equationautorefname{Equation}
	\def\footnoteautorefname{Footnote}
	\def\itemautorefname{Item}
	\def\figureautorefname{Figure}
	\def\subfigureautorefname{Figure}
	\def\tableautorefname{Table}
	\def\partautorefname{Part}
	\def\appendixautorefname{Appendix}
	\def\chapterautorefname{Chapter}
	\def\sectionautorefname{Section}
	\def\subsectionautorefname{Subsection}
	\def\theoremautorefname{Theorem}
	\def\assumptionautorefname{Assumption}
	\def\propertyautorefname{Property}
\else
	\newtheorem{theorem}{\textbf{\hspace{0.7cm}定理}}[section]
	\newtheorem{lemma}{\textbf{\hspace{0.7cm}引理}}[section]
	\newtheorem{example}{\textbf{\hspace{0.7cm}例}}[section]
	\newtheorem{definition}{\textbf{\hspace{0.7cm}定义}}[section]
	\newtheorem{axiom}{\textbf{\hspace{0.7cm}公理}}[section]
	\newtheorem{property}{\textbf{\hspace{0.7cm}性质}}[section]
	\newtheorem{proposition}{\textbf{\hspace{0.7cm}命题}}[section]
	\newtheorem{corollary}{\textbf{\hspace{0.7cm}推论}}[section]
	\newtheorem{remark}{\textbf{\hspace{0.7cm}注解}}[section]
	\newtheorem{condition}{\textbf{\hspace{0.7cm}条件}}[section]
	\newtheorem{conclusion}{\textbf{\hspace{0.7cm}结论}}[section]
	\newtheorem{assumption}{\textbf{\hspace{0.7cm}假设}}[section]
	\newtheorem{prove}{\textbf{\hspace{0.7cm}证明}}[section]
	\renewcommand{\proofname}{证明}
	\renewcommand\appendixname{附录}
	%New autorefname
	\def\equationautorefname{式}
	\def\footnoteautorefname{脚注}
	\def\itemautorefname{项}
	\def\figureautorefname{图}
	\def\subfigureautorefname{图}
	\def\tableautorefname{表}
	\def\partautorefname{篇}
	\def\appendixautorefname{附录}
	\def\chapterautorefname{章}
	\def\sectionautorefname{节}
	\def\subsectionautorefname{小节}
	\def\theoremautorefname{定理}
	\def\assumptionautorefname{假设}
	\def\propertyautorefname{性质}
\fi

%\usepackage{caption2,caption3}
%\usepackage{subfigure}
%\renewcommand{\captionfont}{\ftcaptionfont}
%\renewcommand{\captionlabelfont}{\ftcaptionfont}
%\renewcommand{\captionlabeldelim}{}
%\renewcommand{\tablename}{表}

% add in 2015/05/07 by xujinlai 
% to satisfy the requirement of figure and table caption type "图 1-1" from original Latex "图 1.1"
\renewcommand{\thetable}{~\arabic{chapter}-\arabic{table}~}
%\renewcommand{\figurename}{图}
\renewcommand{\thefigure}{~\arabic{chapter}-\arabic{figure}~}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}~}
%\renewcommand{\subcaplabelfont}{\ftcaptionfont}
%\renewcommand{\subcapsize}{\ftcaptionfont}
%\captionsetup{font={\xiaowu\hei}}

%Line and par setup
%It seems unnecessary since CTeX has already set the \baselinestretch etc.
%\renewcommand\baselinestretch{1.4}
\newcommand\ustc@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\setlength{\parskip}{0pt plus3pt minus0pt}%{1ex plus1.5ex minus0.5ex}%{0.5\baselineskip}%{1.5pt plus1pt minus1pt}
\setlength{\parindent}{2\ccwd}
%\setlength{\parskip}{3pt plus1pt minus2pt}
%\setlength{\baselineskip}{22pt plus1pt minus1pt}
%\setlength{\textheight}{21true cm}
%\setlength{\headsep}{1 cm}
%\setlength{\textwidth}{14.5true cm} 
%\setlength{\belowcaptionskip}{5pt}

%Title page setup
\newcommand\USTCHUGE{\fontsize{56}{67.2}\selectfont}%中文扉页第二行
\newcommand\USTCLARGE{\fontsize{26}{30}\selectfont}%英文扉页第二行
\newcommand\USTCLarge{\fontsize{20}{30}\selectfont}%英文扉页第一行
\newcommand\USTCTspace{\protect\CTEX@spaceChar}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% !! Never try to set this value greater than 0.7.
% !! This value has already set previously. So, leave it here as a reminder.
%\renewcommand{\floatpagefraction}{0.80}

%Information used for title page and book spine
\renewcommand\title[1]{\def\ustc@title{#1}}
\renewcommand\author[1]{\def\ustc@author{#1}}
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{major}%硕士博士论文适用专业全称，不可用缩写。本科论文不需要此项 Not used in bachelor thesis. For master and doctor thesis, use full name -- NEVER use abbr. 
\ustc@define@term{submitdate}
\ustc@define@term{depart}%硕士博士论文用院系代号，仅用于书脊。本科论文用院系全称，仅用于扉页 For bachelor use full name(only used in title page). Currently unused for master and doctor

%English
\ustc@define@term{entitle}
\ustc@define@term{enauthor}
\ustc@define@term{enadvisor}
\ustc@define@term{encoadvisor}
\ustc@define@term{ensubmitdate}
\ustc@define@term{enmajor}
\ustc@define@term{endepart}%本科论文用院系全称，仅用于扉页。硕博暂时没有用 For bachelor use full name(only used in title page). Currently unused for master and doctor

%Other language strings
\ustc@define@term{otherustcstr}%A translation of `China University of Geosciences' in your language
\ustc@define@term{otherthesisstr}%A translation of `A dissertation for doctor's degree' in your language
\ustc@define@term{otherauthorstr}%A translation of `Author' in your language
\ustc@define@term{otherdepartmentstr}%A translation of `Department' in your language
\ustc@define@term{otherstudentidstr}%A translation of `Student ID' in your language
\ustc@define@term{othersupervisorstr}%A translation of `Supervisor' in your language
\ustc@define@term{otherfinishedtimestr}%A translation of `Finished Time' in your language
\ustc@define@term{otherspecialitystr}%A translation of `Speciality' in your language
\ustc@define@term{othertitle}
\ustc@define@term{otherauthor}
\ustc@define@term{otheradvisor}
\ustc@define@term{othercoadvisor}
\ustc@define@term{othersubmitdate}
\ustc@define@term{othermajor}
\ustc@define@term{otherdepart}%本科论文用院系全称，仅用于扉页。硕博暂时没有用 For bachelor use full name(only used in title page). Currently unused for master and doctor

\ustc@define@term{studentid}%学号，仅本科论文 Student ID, only for bachelor
\ustc@define@term{spinetitle}%书脊使用的标题，当title里含有控制字符时使用此命令输入文本标题 Use this command to generate spine when there are some control commands in \title{}
\ustc@define@term{covertitle}%封皮使用的标题，当title里存在强制换行导致标题超过了三行时，或者存在其他特殊情况时，请使用此命令输入封皮的标题。根据制本厂的规定，封皮标题最多两行。Use this command to generate cover page title when \title{} contains more than one force line break, ie. title has more than two lines, or when \title{} contains some special commands. Accroding to requirements of USTC Printer, cover page title can only have no more than two lines. 
\ustc@define@term{encovertitle}%本科专用。封皮使用的英文标题，当entitle里存在强制换行导致标题超过了四行时，或者存在其他特殊情况时，请使用此命令输入封皮的英文标题。根据制本厂的规定，封皮英文标题最多三行。For bachelor only. Use this command to generate cover page title when \entitle{} contains more than two force line breaks, ie. entitle has more than three lines, or when \entitle{} contains some special commands. Accroding to requirements of USTC Printer, cover page English title can only have no more than three lines. 

%\ustc@define@term{degree}%Not used

\RequirePackage{subfiles}
\RequirePackage{xparse}
\DeclareDocumentCommand{\makecover}{ O{17pt} O{17pt} }{\make@bookspine{#1}{#2}}

\renewcommand\maketitle{%
	\make@cntitle
	\make@entitle
	\ifustc@notchinese
		\ifx\ustc@othertitle\@empty
			\relax
		\else
			\make@othertitle
		\fi
	\fi
	\ifustc@bachelor%
		\relax
	\else
		\make@authorization
	\fi}

%Chinese title page
\def\CUGT@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\CUGTunderline{\@ifnextchar[\CUGT@underline\CTEXunderline}


\newcommand\make@cntitle{%
  \newgeometry{%
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm
  }
  \pdfbookmark[-1]{\ustc@title}{title}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	%\vspace*{0.5cm plus 0.5cm minus 1cm}
    %  \includegraphics[width=10cm]{ustc_logo_text.eps}
    \song\sanhao{分类号:}~\CUGTunderline[70pt]{} 
            \hfill
    \song\sanhao{密\hspace{1\ccwd}级:}~\CUGTunderline[70pt]{} \\
    \vspace{3em}
    \begin{spacing}{1.35}
    \centering\erhao\hei{中国地质大学} \\
    \erhao\hei\ifustc@doctor
      {博士学位论文}
    \else\ifustc@master
      {硕士学位论文}  
    \else
      {学士学位论文}
    \fi\fi \\
    \vspace{2em}
	 	\hei\sanhao{\ustc@title} \\
    \end{spacing}
	\vspace{2em}
	\song
  \end{center}
  %\vskip 1.0cm %0.6cm 0.7cm 2.3cm
  %\def\tabcolsep{1pt}
  %\def\arraystretch{1.5}
  \begin{center}
  {\begin{spacing}{1.5}
  \sanhao
  \ifustc@bachelor\begin{tabular}{lc}%
	  \bfseries{姓\hspace{2\ccwd}名：} & \ustc@author\\
	  \bfseries{院\hspace{2\ccwd}系：} & \ustc@depart\\
	  \bfseries{学\hspace{2\ccwd}号：} & \ustc@studentid\\
	  \bfseries{导\hspace{2\ccwd}师：} & \ustc@advisor\\
	  \ifx\ustc@coadvisor\@empty\else & \ustc@coadvisor\\\fi
	  \bfseries{完成时间：} & \ustc@submitdate
	\end{tabular}
  \else	\begin{tabular}{ll}%
	  {学\hspace{2\ccwd}号：} & \ustc@studentid\\
	  {硕\hspace{0.5\ccwd}士\hspace{0.5\ccwd}生：} & \ustc@author\\
	  {学科专业：} & \ustc@major\\
	  {指导教师：} & \ustc@advisor\\
	  \ifx\ustc@coadvisor\@empty\else
	                        & \ustc@coadvisor\\\fi
	  {所在学院：} & \ustc@depart
	\end{tabular}
  \fi
  \end{spacing}}
  \vskip \stretch{0.6}
  \sanhao{\ustc@submitdate}
  \vspace{1em}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
  
  %make the second page
  \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
    	%\vspace*{0.5cm plus 0.5cm minus 1cm}
      %  \includegraphics[width=10cm]{ustc_logo_text.eps}
      \song\sanhao{学校代码:}~{10491} 
              \hfill
      \song\sanhao{研究生学号:}~{\ustc@studentid} \\
      \vspace{3em}
      \begin{spacing}{1.45}
      \centering\erhao\hei\bfseries{中国地质大学 \\
      \erhao\hei\ifustc@doctor
        {博士学位论文}
      \else\ifustc@master
        {硕士学位论文}  
      \else
        {学士学位论文}
      \fi\fi }\\
      \vspace{2em}
  	 	\hei\sanhao\textmd{\ustc@title} \\
      \end{spacing}
  	\vspace{2em}
  	\song
    \end{center}
    %\vskip 1.0cm %0.6cm 0.7cm 2.3cm
    %\def\tabcolsep{1pt}
    %\def\arraystretch{1.5}
    \begin{center}
    {%
    \begin{spacing}{1.5}
    \sanhao
    \ifustc@bachelor\begin{tabular}{lc}%
  	  \bfseries{姓\hspace{2\ccwd}名：} & \ustc@underline[6cm]{\ustc@author}\\
  	  \bfseries{院\hspace{2\ccwd}系：} & \ustc@underline[6cm]{\ustc@depart}\\
  	  \bfseries{学\hspace{2\ccwd}号：} & \ustc@underline[6cm]{\ustc@studentid}\\
  	  \bfseries{导\hspace{2\ccwd}师：} & \ustc@underline[6cm]{\ustc@advisor}\\
  	  \ifx\ustc@coadvisor\@empty\else & \ustc@underline[6cm]{\ustc@coadvisor}\\\fi
  	  \bfseries{完成时间：} & \ustc@underline[6cm]{\ustc@submitdate}
  	\end{tabular}
    \else	\begin{tabular}{ll}%
  	  {硕\hspace{0.5\ccwd}士\hspace{0.5\ccwd}生：} & \ustc@author\\
  	  {学科专业：} & \ustc@major\\
  	  {指导教师：} & \ustc@advisor\\
  	  \ifx\ustc@coadvisor\@empty\else
  	                        & \ustc@coadvisor\fi
  	\end{tabular}
    \fi
    \end{spacing}}
    \vskip \stretch{0.6}
    \sanhao{\ustc@submitdate}
    \vspace{1em}
    \end{center}
	  \clearpage
	  \restoregeometry
	  \if@twoside
	    \thispagestyle{empty}
	    \cleardoublepage
	  \fi
}


%English title page
\newcommand\make@entitle{%
  \newgeometry{%
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm
  }
  %\pdfbookmark{英文标题}{etitle}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{0cm}
      \xiaosan{{A Dissertation Submitted to China University \\}
      \vskip 0.5cm
        \xiaosan{of Geosciences for}}
    %\vskip -0.2cm %-0.6cm
    {\ifustc@doctor
      {A dissertation for doctor's degree}
    \else\ifustc@master
      {~the~Master Degree of \ustc@enmajor}
    \else
      {A dissertation for bachelor's degree}
    \fi\fi}
    \vskip 1.5cm %1.25cm
      %\includegraphics[width=4.7cm]{ustc_logo_fig.eps}
    \vskip 1.5cm %2.4cm
            \begin{spacing}{1.2}
            \bfseries\xiaoer\ustc@entitle
            \end{spacing}
  \end{center}
  %\vskip 1.0cm %1.8cm 2cm 3.1cm
  \vspace{4em}
  \begin{center}
  {%
  \begin{spacing}{1.5}
  \xiaosan
  \ifustc@bachelor
	  \begin{tabular}{ll}
	  	Author :& \ustc@underline[6cm]{\ustc@enauthor}\\
	  	Department :& \ustc@underline[6cm]{\ustc@endepart}\\
	  	Student ID :& \ustc@underline[6cm]{\ustc@studentid}\\
		Supervisor :& \ustc@underline[6cm]{\ustc@enadvisor}\\
		\ifx\ustc@encoadvisor\@empty\else
	                     & \ustc@underline[6cm]{\ustc@encoadvisor}\\
	    \fi
	  	Finished Time :& \ustc@underline[6cm]{\ustc@ensubmitdate}
	  \end{tabular}
  \else
	  \begin{tabular}{l}
	  	Master Candidate :~\ustc@enauthor\\
	  	Major :~\ustc@enmajor\\
	  	Supervisor :~\ustc@enadvisor\\
		\ifx\ustc@encoadvisor\@empty\else
	                     & \ustc@underline[6cm]{\ustc@encoadvisor}\\
	    \fi
	  	
	  \end{tabular}
  \fi
  \end{spacing}}
  \vskip \stretch{2}
  \xiaosan{China University of Geosciences}\\
  \vskip 5pt
  \xiaosan{Wuhan 430074 P. R. China}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%Other language title page
\newcommand\make@othertitle{%
  \newgeometry{%
  top=3.8cm,
  bottom=3.8cm,
  left=3.2cm,
  right=3.2cm
  }
  %\pdfbookmark{英文标题}{etitle}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{0cm}
      \USTCLarge{\ttfamily{\ustc@otherustcstr}}
    \vskip -0.2cm %-0.6cm
    \USTCLARGE{\ttfamily\ustc@otherthesisstr}
    \vskip 1.5cm %1.25cm
      \includegraphics[width=4.7cm]{ustc_logo_fig.eps}
    \vskip 1.5cm %2.4cm
      %\renewcommand{\baselinestretch}{1}
      \bfseries\yihao\ustc@othertitle
  \end{center}
  \vskip 1.0cm %1.8cm 2cm 3.1cm
  \begin{center}
  {\sanhao
  \ifustc@bachelor
	  \begin{tabular}{lc}
	  	\ustc@otherauthorstr :& \ustc@underline[6cm]{\ustc@otherauthor}\\
	  	\ustc@otherdepartmentstr :& \ustc@underline[6cm]{\ustc@otherdepart}\\
	  	\ustc@otherstudentidstr :& \ustc@underline[6cm]{\ustc@studentid}\\
		\ustc@othersupervisorstr :& \ustc@underline[6cm]{\ustc@otheradvisor}\\
		\ifx\ustc@encoadvisor\@empty\else
	                     & \ustc@underline[6cm]{\ustc@othercoadvisor}\\
	    \fi
	  	\ustc@otherfinishedtimestr :& \ustc@underline[6cm]{\ustc@othersubmitdate}
	  \end{tabular}
  \else
	  \begin{tabular}{lc}
	  	\ustc@otherauthorstr :& \ustc@underline[6cm]{\ustc@otherauthor}\\
	  	\ustc@otherspecialitystr :& \ustc@underline[6cm]{\ustc@othermajor}\\
	  	\ustc@othersupervisorstr :& \ustc@underline[6cm]{\ustc@otheradvisor}\\
		\ifx\ustc@othercoadvisor\@empty\else
	                     & \ustc@underline[6cm]{\ustc@othercoadvisor}\\
	    \fi
	  	\ustc@otherfinishedtimestr :& \ustc@underline[6cm]{\ustc@othersubmitdate}
	  \end{tabular}
  \fi}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%Define head rule
\newcommand{\makeheadrule}{%
    %\rule[.7\baselineskip]{\headwidth}{1.2pt}\vskip-0.97\baselineskip%
    %\rule[.6\baselineskip]{\headwidth}{0.4pt}}%
    \makebox[0pt][l]{\rule[0.55\baselineskip]{\headwidth}{0.4pt}}%
    \rule[0.7\baselineskip]{\headwidth}{0.4pt}}
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi}%
     \makeheadrule}

%Declaration and authorization page
\newcommand{\ustc@declaretext}{%
本人郑重声明：本人所呈交的硕士学位论文《\ustc@spinetitle》，是本人在导师的指导下，在中国地质大学（武汉）攻读硕士学位期间独立进行研究工作所取得的成果。论文中除已注明部分外不包含他人已发表或撰写过的研究成果，对论文的完成提供过帮助的有关人员已在文中说明并致以谢意。

本人所呈交的硕士学位论文没有违反学术道德和学术规范，没有侵权行为，并愿意承担由此而产生的法律责任和法律后果。
}
\newcommand{\ustc@authorization}{%
本人授权中国地质大学（武汉）可采用影印、缩印、数字化或其它复制手段保存本学位论文；学校可向国家有关部门或机构送交本学位论文的电子版全文，编入有关数据库进行检索、下载及文献传递服务；同意在校园网内提供全文浏览和下载服务。

涉密论文解密后适用于本授权书。
}
\def\ustc@secret@newtitle{%
   \raisebox{-1pt}{\large\Square}\ 公开\hspace{0.5cm}\raisebox{-1pt}{\large\Square}\ 保密\ \ustc@underline[4em]\relax\hspace{0.1em}年}
\newcommand\make@authorization{%
 % \pdfbookmark{原创与授权声明}{authorization}
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{2em}
  \begin{center}\xiaoer\bfseries{中国地质大学（武汉）研究生学位论文原创性声明}\end{center}
  \vskip1.5cm
  \begin{spacing}{1.5}
  \par\sihao\ustc@declaretext\par
  \end{spacing}
  \vskip1.5cm
   \begin{flushright}
  \sihao{学位论文作者签名：\ustc@underline[6cm]{}}\\
  \vskip1cm
  \sihao{日\hspace{6\ccwd}期：\ustc@underline[6cm]{\hspace{4\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日}}
  \end{flushright}
   \clearpage
     \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
   \thispagestyle{empty}
   \vspace*{2em}
  \begin{center}\xiaoer\bfseries{中国地质大学（武汉）学位论文使用授权书}\end{center}
  \vskip1.5cm
  \begin{spacing}{1.5}
  \par\sihao\ustc@authorization\par
  \end{spacing}
  %%\ustc@secret@newtitle\par
  \vskip1.5cm
  \begin{flushright}
  \sihao{学位论文作者签名：\ustc@underline[6cm]{}}\\
  \vskip1cm
  \sihao{日\hspace{6\ccwd}期：\ustc@underline[6cm]{\hspace{4\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日}}
  \end{flushright}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%Define page style
%\fancypagestyle{plain}{}
%\pagestyle{fancy}
%  \fancyhf{}
%  \ifustc@bachelor\fancyhead[C]{\xiaowuhao{中国地质大学学士学位论文}}\relax%\else\fancyhead[C]{\small \nouppercase\leftmark}\fi
%  \renewcommand{\headrulewidth}{0.7pt}

\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  %\pagenumbering{Roman}
  \thispagestyle{empty}
  \pagestyle{empty}
  %\pagestyle{empty} 
  %\pagenumbering{} 
  %\fancyhf{}%
  % \fancyfoot{}
  % \fancyfoot[C]{\small \thepage}
  \renewcommand{\headrulewidth}{0pt}
  
}

\renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  %\setcounter{page}{1}
  \pagenumbering{arabic}
  %\fancyfoot{}
  %\fancyfoot[RO,LE]{\small \thepage}
  \fancypagestyle{plain}{%
  \fancyhf{}%
  \pagestyle{fancy}
  \fancyhead[LO,RE]{\song\xiaowu \ustc@ensubmitdate}
  \fancyhead[CO]{\song\xiaowu {中国地质大学硕士学位论文}}
  \fancyhead[CE]{\song\xiaowu \ustc@author :~~ \ustc@spinetitle}
  \fancyhead[LE,RO]{\song\xiaowu ~\thepage~}
  }
\pagestyle{plain}
  \fancyhf{}
  \pagestyle{fancy}
  \fancyhead[LO,RE]{\song\xiaowu \ustc@ensubmitdate}
  \fancyhead[CO]{\song\xiaowu {中国地质大学硕士学位论文}}
  \fancyhead[CE]{\song\xiaowu \ustc@author :~~ \ustc@spinetitle}
  \fancyhead[LE,RO]{\song\xiaowu ~\thepage~}
}

%Abstracts and thanks
\newcommand{\ustc@enabstractname}{ABSTRACT}
\newcommand{\ustc@cnabstractname}{摘\hspace{\ccwd}要}
\ifustc@notchinese
	\newcommand{\ustc@thanksname}{Thanks}
\else
	\newcommand{\ustc@thanksname}{致\hspace{\ccwd}谢}
\fi
\newcommand\keywords[1]{%
  \vspace{3.5ex}\noindent\bfseries{ 关键词：~ #1}}
\newcommand\enkeywords[1]{%
  \vspace{3.5ex}\noindent\bf{ Keywords:~ #1}}
\newenvironment{cnabstract}
  {%
    \cleardoublepage
    \thispagestyle{empty}
    %\renewcommand{\baselinestretch}{0.8}{
    \begin{spacing}{1.2}
    \begin{center}
    \vspace*{2em}
    \hei\xiaoer{\ustc@title}\\
    \vspace{1em}
    \begin{tabular}{ll}
    \song\xiaosi{硕\hspace{0.5\ccwd}士\hspace{0.5\ccwd}生:}~&\song\xiaosi{\ustc@author} \\ 
    \song\xiaosi{指导教师:}~&\song\xiaosi{\ustc@advisor}
    \end{tabular}\\
    \vspace{1em}
    \hei\sihao{\ustc@cnabstractname}
    \vspace{0.9em}
    \end{center}
    \end{spacing}
    %\renewcommand{\baselinestretch}{0.8}
  }
  %\ifustc@bachelor\chapter{\texorpdfstring{\ustc@cnabstractname}{摘要}}\else\chapter*{\protect\vskip-10pt\ustc@cnabstractname}\fi}
  {}
\newenvironment{enabstract}
  {%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{spacing}{1.2}
  \begin{center}
  \vspace*{2em}
  \song\xiaoer\textbf{\ustc@entitle}\\
  \vspace{1em}
  \begin{tabular}{l}
  \song\xiaosi{Master Candidate:}~\song\xiaosi{\ustc@enauthor} \\ 
  \song\xiaosi{Supervisor:}~\song\xiaosi{\ustc@enadvisor}
  \end{tabular}\\
  \vspace{1em}
  \vspace{5pt}
  \song\sihao{\ustc@enabstractname}
  \vspace{5pt}
  \vspace{1em}
  \end{center}
  \end{spacing}
  %\renewcommand{\baselinestretch}{0.8}
  }
  %\ifustc@bachelor\chapter{ABSTRACT}\else\chapter*{\protect\vskip-10pt{}ABSTRACT}\fi}
  {}
\renewenvironment{thanks}
  {\ifustc@bachelor\chapter[\texorpdfstring{\ustc@thanksname}{\ifustc@notchinese{}Thanks\else{}致谢\fi}]{\protect\vskip-10pt\ustc@thanksname}\else\chapter{\texorpdfstring{\ustc@thanksname}{\ifustc@notchinese{}Thanks\else{}致谢\fi}}\fi}
  {}
  
%tableofcontents
\ifustc@notchinese
	\renewcommand{\contentsname}{Table of Contents}
\else
	\renewcommand{\contentsname}{\texorpdfstring{目\hspace{\ccwd}录}{目录}}
\fi
\renewcommand\tableofcontents{%
    \cleardoublepage
    \begin{spacing}{1.0}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\protect\vskip-10pt\contentsname}%
    \thispagestyle{empty}
    \pagestyle{empty}
    %
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \end{spacing}
    }
%% tableofcontent
\titlecontents{chapter}[0em]
  {\vspace{1bp}\wuhao}%14pt，如果希望美观一些，可以无视章节标题用宋体的规定，自行添加\bfseries
  {\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.2pc]{$\cdot$}\contentspage}
\titlecontents{section}[2\ccwd]
  {\vspace{1bp} \wuhao}
  {\S\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.2pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[4.2\ccwd]%原来是2.3
  {\vspace{1bp} \wuhao}%规定三级标题是10.5pt
  {\thecontentslabel\hspace*{0.5em}}
  {}
 {\titlerule*[0.2pc]{$\cdot$}\contentspage}

%\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
%\newdimen\bibspace
%\setlength\bibspace{3pt}
%\renewenvironment{thebibliography}[1]
%     {\chapter{\bibname}%
%\renewcommand{\baselinestretch}{0.5}
 %     \xiaowu%\linestretch{1.0}
%	  %\addtolength{\bibsep}{-0.5cm}
%      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%      \list{\@biblabel{\@arabic\c@enumiv}}%
%           {\settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}%
%      \endlist}
%\newcommand{\bibfont}{\small}
%\def\bibpreamble{\linespread{0.2}}
\renewcommand{\bibsection}{
  \chapter{\bibname}
  %\setlength{\linestretch}{1.0}
  \xiaowu%%\small
  %\linespread{1.36}
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}
%\setlength{\bibsep}{0ex}
\let\OLDappendix\appendix
\newif\if@appendixinbackmatter
\renewenvironment{appendix}
{
  \if@mainmatter
     \@appendixinbackmatterfalse\OLDappendix
  \else
      \@appendixinbackmattertrue\@mainmattertrue\OLDappendix
  \fi
	\renewcommand\chaptername{\appendixname~\thechapter}}
  {\if@appendixinbackmatter\@mainmatterfalse\fi
}
\renewcommand{\baselinestretch}{1.05}
\wuhao
%\renewcommand{\listparsep}{0ex} %段落间距
%\renewcommand{\listtopsep}{0ex} %列表到上下文的垂直距离
%\renewcommand{\listitemsep}{0ex} %条目间距
%\renewcommand{\listlabelsep}{0.5em} %标号和列表项之间的距离,默认0.5em
%\renewcommand{\listitemindent}{0em} %标签缩进量
%\renewcommand{\listparindent}{0em} %段落缩进量
\endinput
%%
%%
%% End of file `USTCthesis.cls'.
