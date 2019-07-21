\LoadClassWithOptions{article}

% Set page margins to 1 inch
\usepackage{geometry}
\geometry{margin=1.0in}

\setlength{\parindent}{0pt}
\setlength{\parskip}{12pt}

% Disable page numbering
\pagenumbering{gobble}

% Allow itemlist formatting
\usepackage{enumitem}

% Add new commands for title page
\newcommand{\address}[1]{
	\def\theaddress{#1}
}
\newcommand{\city}[1]{
	\def\thecity{#1}
}
\newcommand{\phone}[1]{
	\def\thephone{#1}
}
\newcommand{\company}[1]{
	\def\thecompany{#1}
}
\newcommand{\position}[1]{
	\def\theposition{#1}
}
\newcommand{\for}[1]{
	\def\thefor{#1}
}

% Necessary for \theauthor in redefined \maketitle
\usepackage{titling}

\date{\today}
% Redefine title command to fit Co-op template
\renewcommand{\maketitle}{
	\theaddress \\
	\thecity
	
	\thedate
	
	\thecompany \\
	c/p UBC Engineering Co-op Office

	Re: \theposition

	Dear \thefor:\par
}

\newcommand{\makeend}[1][R\'esum\'e, transcript]{
	Sincerely,\\
	\theauthor

	Encl. #1
}




