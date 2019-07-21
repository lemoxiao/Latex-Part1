%%
%% Author: Ali Asghar Momeni Vesalian (momeni.vesalian@gmail.com)
%% 12/30/2017 AD
%%

% Preamble
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Professional graphical resume, based on article class and designed by momeni.vesalian@gmail.com]


% Base class
\LoadClassWithOptions{article}


% General packages
\RequirePackage[utf8]{inputenc}
\RequirePackage{fontspec}


% Packages and thier setting
\RequirePackage{geometry}
\geometry{margin=0pt, offset=0pt, headheight=0pt, headsep=0pt, footskip=0pt}
\geometry{textwidth=\paperwidth, textheight=\paperheight}


% Commands
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=1000
\hbadness=1000

\pagenumbering{gobble}
\setlength\topskip{0pt}
\setlength\lineskip{0pt}
\setlength{\parindent}{0pt}
\vspace*{0pt}

\setmainfont{Times}
\setromanfont{Times}
\setsansfont{Tahoma}
\setmonofont{Monaco}
