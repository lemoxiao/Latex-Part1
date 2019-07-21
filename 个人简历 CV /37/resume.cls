
\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

% Customize the section headers
\RequirePackage{titlesec}

% Set the margins
\usepackage[margin=0.5in]{geometry}

% We also to use images
\usepackage[]{graphicx}
\graphicspath{{icons/}}
\usepackage{amsmath}

% We also to use hyperlinks to projects.
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=cyan,
    filecolor=magenta,
    urlcolor=blue,
}

% Turn off page numbering
\pagenumbering{gobble}

% Customize the section heading
\titleformat{\section}
	{\Large\scshape\raggedright} % Customize the size fo the section command
	{}{0em} % Provides a prefix to every section
	{} % Insert code before the heading
	[\titlerule] % Inserts a horizontal line after the heading

% Customize the subsection heading
\titleformat{\subsection}
	{\large\scshape\raggedright}
	{}{0em}
	{}

% This provides dates to certain section headers
\newcommand{\datedsection}[2]{%
	\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}%
}

% Provide a command for name and contact information
\newcommand{\name}[1]{
	\centerline{\Huge{#1}}
}
\newcommand{\imgraised}[1]{
	\raisebox{-3pt}{\includegraphics{#1}}
}

\newcommand{\contact}[6]{
	\begin{center}
		\imgraised{address} #1
		\\
		\imgraised{email} #2
		{\LARGE\textperiodcentered}
		\imgraised{email} #3
		{\LARGE\textperiodcentered}
		\imgraised{phone} #4
		{\LARGE\textperiodcentered}
		\imgraised{github} \href{#6}{#5}
	\end{center}
}

% Create some special sections now
\newcommand{\imgsection}[2]{
	\section{\protect\includegraphics{#1}\hspace{3mm}#2}
}

% Make another special section for skilss
\newcommand{\skillsubsection}[2]{
	\subsection[#1]{#1: {\normalfont\normalsize#2}}
}

% A special section for projects.
\newcommand{\projectsubsection}[3]{
	\subsection[#1]{#1
		- ({\normalfont\normalsize\textit{#2}}) -
		{\normalfont\normalsize#3}
	}
}

% A special sectino for jobs/experience
\newcommand{\jobsubsection}[4]{
	\subsection[#1]{#1 \hfill #2
		\\ {\normalfont\normalsize\textit{#3}\\#4}
	}
}
