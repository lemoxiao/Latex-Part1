%% This is file `edu.cls', generated from `edu.tex' (key `class').
%% edu Documentclass for typesetting educational documents
%%
%% Copyright (C) 2012-2018 by Daniel Wunderlich <code@wu-web.de>
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The current maintainer of this work is Daniel Wunderlich.
%%
%% This work consists of the file edu.tex and the derived files:
%%  * edu.cls
%%  * edu-styles-wu.sty
%%  * edu-colors-wu.sty
%%  * edu.pdf
%%  * edu-de.pdf

\RequirePackage{expl3, l3keys2e}
\RequirePackage{xparse}

\ExplSyntaxOn

\msg_new:nnn {edu} {option-dep-enable} {If\ you\ enable\ the\ option\ #1,\ you\ have\ to\ enable\ the\ following\ option(s):\ #2.}

\cs_generate_variant:Nn \tl_if_eq:nnT { V }
\cs_generate_variant:Nn \tl_if_eq:nnF { V }
\cs_generate_variant:Nn \tl_if_eq:nnTF { V }

\cs_generate_variant:Nn \tl_if_eq:nnT { v }
\cs_generate_variant:Nn \tl_if_eq:nnF { v }
\cs_generate_variant:Nn \tl_if_eq:nnTF { v }

\dim_new:N \g_edu_temp_dim

\cs_new:Npn \__edu_keys_initial:n #1 {
  \AtBeginDocument{
    \keys_set:nn {edu} {#1}
  }
}

\DeclareExpandableDocumentCommand \@usetl { m m m } {
  \tl_use:c {g_#1_#2_#3}
}

\keys_define:nn {edu} {
  edumath .bool_gset:N = \g_edu_edumath_bool,           % use edumath package
  edumath .initial:n = false,
  edumathoptions .tl_gset:N = \g_edu_edumathoptions_tl,
  edumathoptions .initial:n = commasep,
}

\keys_define:nn {edu} {
  twoup .bool_gset:N = \g_edu_twoup_bool,                 % Print at A5-paper
  twoup .initial:n = false,
  glue .bool_gset:N = \g_edu_glue_bool,                   % Additional margin for gluing sheet into exercise book
  glue .initial:n = false,
  transparency .bool_gset:N = \g_edu_transparency_bool,   % Print at transparency
  transparency .initial:n = false
}

\ExplSyntaxOn
\tl_new:N \g_edu_rmfont_tl
\tl_new:N \g_edu_sffont_tl
\tl_new:N \g_edu_ttfont_tl

\keys_define:nn {edu} {
  rmfont .choices:nn = {
    computermodern,
    libertine,
    palatino
  }
  {
    \tl_gset:NV \g_edu_rmfont_tl \l_keys_choice_tl
  },
  rmfont .initial:n = libertine
}

%\keys_define:nn {edu} {
%  rmfont .choice_code:n = {
%    \tl_gset:NV \g_edu_rmfont_tl \l_keys_choice_tl
%  },
%  rmfont .generate_choices:n = {  % option for choosing the roman font
%    computermodern,
%    libertine,
%    palatino
%  },
%  rmfont .initial:n = libertine
%}

\keys_define:nn {edu} {
  sffont .choices:nn = {  % option for choosing the sans serif font
    computermodern,
    sourcesanspro,
    roboto,
    lato
  }{
    \tl_gset:NV \g_edu_sffont_tl \l_keys_choice_tl
  },
  sffont .initial:n = sourcesanspro
}

%\keys_define:nn {edu} {
%  sffont .choice_code:n = {
%    \tl_gset:NV \g_edu_sffont_tl \l_keys_choice_tl
%  },
%  sffont .generate_choices:n = {  % option for choosing the sans serif font
%    computermodern,
%    sourcesanspro,
%    roboto,
%    lato
%  },
%  sffont .initial:n = sourcesanspro
%}

\keys_define:nn {edu} {
  ttfont .choices:nn = {  % option for choosing the monospace font
    beramono,
    sourcecodepro
  }{
    \tl_gset:NV \g_edu_ttfont_tl \l_keys_choice_tl
  },
  ttfont .initial:n = sourcecodepro
}

%\keys_define:nn {edu} {
%  ttfont .choice_code:n = {
%    \tl_gset:NV \g_edu_ttfont_tl \l_keys_choice_tl
%  },
%  ttfont .generate_choices:n = {  % option for choosing the typewriter font
%    beramono,
%    sourcecodepro
%  },
%  ttfont .initial:n = sourcecodepro
%}

\ExplSyntaxOn
\keys_define:nn {edu} {
  sfdefault .bool_gset:N = \g_edu_sfdefault_bool,          % sans-serif als familydefault
  sfdefault .initial:n = false,
}


\keys_define:nn {edu} {
  fontsize .dim_gset:N = \g_edu_fontsize_dim,  % Fontsize
  fontsize .initial:n = 11pt,
  twoupfontsize .dim_gset:N = \g_edu_twoupfontsize_dim, % Fontsize for twoup
  twoupfontsize .initial:n = 14pt,
  transparencyfontsize .dim_gset:N = \g_edu_transparencyfontsize_dim,                    % Fontsize for transparency
  transparencyfontsize .initial:n = 20pt,
}

\keys_define:nn {edu} {
  parindent .bool_gset:N = \g_edu_parindent_bool,   % Enable/disable parindent
  parindent .initial:n = false,
  parskip .bool_gset:N = \g_edu_parskip_bool,       % Enable/disable parskip
  parskip .initial:n = true
}


\keys_define:nn {edu} {
  top .dim_gset:N = \g_edu_top_dim,
  top .initial:n = 15mm,
  right .dim_gset:N = \g_edu_right_dim,
  right .initial:n = 15mm,
  bottom .dim_gset:N = \g_edu_bottom_dim,
  bottom .initial:n = 15mm,
  left .dim_gset:N = \g_edu_left_dim,
  left .initial:n = 22.5mm,
}

\keys_define:nn {edu} {
  twouptop .dim_gset:N = \g_edu_twouptop_dim,        % Top margin A5-print
  twouptop .initial:n = 20mm,
  twoupright .dim_gset:N = \g_edu_twoupright_dim,    % Right margin A5-print
  twoupright .initial:n = 20mm,
  twoupbottom .dim_gset:N = \g_edu_twoupbottom_dim,  % Bottom margin A5-print
  twoupbottom .initial:n = 20mm,
  twoupleft .dim_gset:N = \g_edu_twoupleft_dim,      % Left margin A5-print
  twoupleft .initial:n = 25mm,
}

\keys_define:nn {edu} {
  transparencytop .dim_gset:N = \g_edu_transparencytop_dim,        % Top margin at transparency
  transparencytop .initial:n = 10mm,
  transparencyright .dim_gset:N = \g_edu_transparencyright_dim,    % Right margin at transparency
  transparencyright .initial:n = 10mm,
  transparencybottom .dim_gset:N = \g_edu_transparencybottom_dim,  % Bottom margin at transparency
  transparencybottom .initial:n = 10mm,
  transparencyleft .dim_gset:N = \g_edu_transparencyleft_dim,      % Left margin at transparency
  transparencyleft .initial:n = 22.5mm,
}

\keys_define:nn {edu} {
  gluetop .dim_gset:N = \g_edu_gluetop_dim,        % Top margin at glue
  gluetop .initial:n = 15mm,
  glueright .dim_gset:N = \g_edu_glueright_dim,    % Right margin at glue
  glueright .initial:n = 20mm,
  gluebottom .dim_gset:N = \g_edu_gluebottom_dim,  % Bottom margin at glue
  gluebottom .initial:n = 20mm,
  glueleft .dim_gset:N = \g_edu_glueleft_dim,      % Left margin at glue
  glueleft .initial:n = 15mm,
}

\keys_define:nn {edu} {
  parts .bool_gset:N = \g_edu_parts_bool,  % Set part as topmost structure element
  parts .initial:n = false
} 

\keys_define:nn {edu} {
  listarraysep .dim_gset:N = \g_edu_listarraysep_dim,
  listarraymargin .dim_gset:N = \g_edu_listarraymargin_dim,
}

\__edu_keys_initial:n {listarraysep = 0.5em}
\__edu_keys_initial:n {listarraymargin = 0.5em}

\keys_define:nn {edu} {
  authorstyle .tl_gset:N = \g_edu_authorstyle_tl,
  authorstyle .initial:n = \large\sffamily\scshape,
  classstyle .tl_gset:N = \g_edu_classstyle_tl,
  classstyle .initial:n = \large\sffamily,
  datestyle .tl_gset:N = \g_edu_datestyle_tl,
  datestyle .initial:n = \small\sffamily,
  emailstyle .tl_gset:N = \g_edu_emailstyle_tl,
  emailstyle .initial:n = \footnotesize\sffamily,
  fieldstyle .tl_gset:N = \g_edu_fieldstyle_tl,
  fieldstyle .initial:n = \large\sffamily,
  groupstyle .tl_gset:N = \g_edu_groupstyle_tl,
  groupstyle .initial:n = \Large\sffamily\bfseries,
  licensestyle .tl_gset:N = \g_edu_licensestyle_tl,
  licensestyle .initial:n = \small\sffamily,
  shortstyle .tl_gset:N = \g_edu_shortstyle_tl,
  shortstyle .initial:n = \Large\sffamily\bfseries,
  subjectstyle .tl_gset:N = \g_edu_subjectstyle_tl,
  subjectstyle .initial:n = \large\sffamily,
  subtitlestyle .tl_gset:N = \g_edu_subtitlestyle_tl,
  subtitlestyle .initial:n = \Large\sffamily\bfseries,
  timestampstyle .tl_gset:N = \g_edu_timestampstyle_tl,
  timestampstyle .initial:n = \small\sffamily,
  titlestyle .tl_gset:N = \g_edu_titlestyle_tl,
  titlestyle .initial:n = \LARGE\sffamily\bfseries,
  titlenumbersep .dim_gset:N = \g_edu_titlenumbersep_dim,
  titlenumbersep .initial:n = 0.5em,
  versionstyle .tl_gset:N = \g_edu_versionstyle_tl,
  versionstyle .initial:n = \small\sffamily,
  timestamptime .bool_gset:N = \g_edu_timestamptime_bool,
  timestamptime .initial:n = true,
  timestamptimeseparator .tl_gset:N = \g_edu_timestamptimeseparator_tl,
  timestamptimeseparator .initial:n = -,
  timestampdateseparator .tl_gset:N = \g_edu_timestampdateseparator_tl,
  timestampdateseparator .initial:n = -,
  timestampdatetimeseparator .tl_gset:N = \g_edu_timestampdatetimeseparator_tl,
  timestampdatetimeseparator .initial:n = -,
}

\__edu_keys_initial:n {
  titlenumbersep = 0.5em
}

\keys_define:nn {edu} {
  shortfg .tl_gset:N = \g_edu_shortfg_tl,
  shortfg .initial:n = white,
  shortbg .tl_gset:N = \g_edu_shortbg_tl,
  shortbg .initial:n = black,
  titlefg .tl_gset:N = \g_edu_titlefg_tl,
  titlefg .initial:n = black,
  titlebg .tl_gset:N = \g_edu_titlebg_tl,
  titlebg .initial:n = white,
  groupfg .tl_gset:N = \g_edu_groupfg_tl,
  groupfg .initial:n = white,
  groupbg .tl_gset:N = \g_edu_groupbg_tl,
  groupbg .initial:n = black,
  titleskip .skip_gset:N = \g_edu_titleskip_skip,
  titleskip .initial:n = 1.75cm,
  timestamptitle .bool_gset:N = \g_edu_timestamptitle_bool,
  timestamptitle .initial:n = false,
}

\keys_define:nn {edu} {
  headerrulewidth .dim_gset:N = \g_edu_headerrulewidth_dim,  % Width of header rule
  headerrulewidth .initial:n = 0.5pt,
  footer .bool_gset:N = \g_edu_footer_bool,                   % Enable/disable footer
  footer .initial:n = true,
  pagecount .bool_gset:N = \g_edu_pagecount_bool,             % Enable/disable pagecount at footer
  pagecount .initial:n = true,
  footskip .dim_gset:N = \g_edu_footskip_dim,                % Skip to first baseline of  footer
  footskip .initial:n = 1cm,
  twoupfootskip .dim_gset:N = \g_edu_twoupfootskip_dim,      % Skip to first baseline of  footer in twoup-mode
  twoupfootskip .initial:n = 0.75cm,
  timestampfooter .bool_gset:N = \g_edu_timestampfooter_bool,
  timestampfooter .initial:n = false,
}

\keys_define:nn {edu} {
  exetoc .bool_gset:N = \g_edu_exetoc_bool,  % Add (sub)exercises and (sub)solutions to toc?
  exetoc .initial:n = false,
}

\keys_define:nn {edu} {
  itemizefg .tl_gset:N = \g_edu_itemizefg_tl,          % Color of itemize-labels
  itemizefg .initial:n = black,
  enumeratefg .tl_gset:N = \g_edu_enumeratefg_tl,      % Color of enumerate-labels
  enumeratefg .initial:n = black,
  descriptionfg .tl_gset:N = \g_edu_descriptionfg_tl,  % Color of description-labels
  descriptionfg .initial:n = black,
}

\keys_define:nn {edu} {
  partnumbersize .tl_gset:N = \g_edu_partnumbersize_tl,              % Size of part numbers
  partnumbersize .initial:n = \Large,
  sectionnumbersize .tl_gset:N = \g_edu_sectionnumbersize_tl,        % Size of section numbers
  sectionnumbersize .initial:n = \normalsize,
  subsectionnumbersize .tl_gset:N = \g_edu_subsectionnumbersize_tl,  % Size of subsection numbers
  subsectionnumbersize .initial:n = \footnotesize,
  subsubsectionnumbersize .tl_gset:N = \g_edu_subsubsectionnumbersize_tl,  % Size of subsubsection numbers
  subsubsectionnumbersize .initial:n = \scriptsize,
}

\keys_define:nn {edu} {
  partnumberfg .tl_gset:N = \g_edu_partnumberfg_tl,             % Foreground color of part numbers
  partnumberfg .initial:n = white,
  partnumberbg .tl_gset:N = \g_edu_partnumberbg_tl,             % Background color of part numbers
  partnumberbg .initial:n = black,
  partfg .tl_gset:N = \g_edu_partfg_tl,                         % Foreground color of parts
  partfg .initial:n = black,
  sectionnumberfg .tl_gset:N = \g_edu_sectionnumberfg_tl,       % Foreground color of section numbers
  sectionnumberfg .initial:n = white,
  sectionnumberbg .tl_gset:N = \g_edu_sectionnumberbg_tl,       % Background color of section numbers
  sectionnumberbg .initial:n = black,
  sectionfg .tl_gset:N = \g_edu_sectionfg_tl,                   % Foreground color of sections
  sectionfg .initial:n = black,
  subsectionnumberfg .tl_gset:N = \g_edu_subsectionnumberfg_tl, % Foreground color of subsection numbers
  subsectionnumberfg .initial:n = white,
  subsectionnumberbg .tl_gset:N = \g_edu_subsectionnumberbg_tl, % Background color of subsection numbers
  subsectionnumberbg .initial:n = black,
  subsectionfg .tl_gset:N = \g_edu_subsectionfg_tl,             % Foreground color of subsection
  subsectionfg .initial:n = black,
  subsubsectionnumberfg .tl_gset:N = \g_edu_subsubsectionnumberfg_tl, % Foreground color of subsubsection numbers
  subsubsectionnumberfg .initial:n = white,
  subsubsectionnumberbg .tl_gset:N = \g_edu_subsubsectionnumberbg_tl, % Background color of subsection numbers
  subsubsectionnumberbg .initial:n = black,
  subsubsectionfg .tl_gset:N = \g_edu_subsubsectionfg_tl,             % Foreground color of subsubsection
  subsubsectionfg .initial:n = black,
}

\keys_define:nn {edu} {
  colorlinks .bool_gset:N = \g_edu_colorlinks_bool,
  colorlinks .initial:n = true,
  linkfg .tl_gset:N = \g_edu_linkfg_tl,
  linkfg .initial:n = black,
  linkborderfg .tl_gset:N = \g_edu_linkborderfg_tl,
  linkborderfg .initial:n = {1~0~0},
}

\keys_define:nn {edu} {
  seelabel .tl_gset:N = \g_edu_seelabel_tl,% Label of 'see'
  seelabel .initial:n = s.,
  seeappendixlabel .tl_gset:N = \g_edu_seeappendixlabel_tl,% Label of 'appendix'
  seeappendixlabel .initial:n = Anh.,
  seeexerciselabel .tl_gset:N = \g_edu_seeexerciselabel_tl,% Label of 'exercise'
  seeexerciselabel .initial:n = Aufg.,
  seefigurelabel .tl_gset:N = \g_edu_seefigurelabel_tl,      % Label of 'figure'
  seefigurelabel .initial:n = Abb.,
  seelistinglabel .tl_gset:N = \g_edu_seelistinglabel_tl,    % Label of 'listing'
  seelistinglabel .initial:n = List.,
  seesectionlabel .tl_gset:N = \g_edu_seesectionlabel_tl,    % Label of 'section'
  seesectionlabel .initial:n = Abschn.,
  seesolutionlabel .tl_gset:N = \g_edu_seesolutionlabel_tl,  % Label of 'solution'
  seesolutionlabel .initial:n = L\"os.,
  seelabelsep .tl_gset:N = \g_edu_seelabelsep_tl,            % First seperator of 'see'
  seelabelsep .initial:n = {\,},
  seerefsep .tl_gset:N = \g_edu_seerefsep_tl,                % Second seperator of 'see'
  seerefsep .initial:n = {\,},
  seeleft .tl_gset:N = \g_edu_seeleft_tl,                    % Left delimiter of 'see'
  seeleft .initial:n = (,
  seeright .tl_gset:N = \g_edu_seeright_tl,                  % Right delimiter of 'see'
  seeright .initial:n = ),
}

\keys_define:nn {edu} {
  pglabel .tl_gset:N = \g_edu_pglabel_tl,  % Label of page in 'pgno'
  pglabel .initial:n = S.,
  nolabel .tl_gset:N = \g_edu_nolabel_tl,  % Label of number in 'pgno'
  nolabel .initial:n = Nr.,
}

\keys_define:nn {edu} {
  ptolabel .tl_gset:N = \g_edu_ptolabel_tl,
  ptolabel .initial:n = Bitte~wenden\hspace*{0.25em},
  ptolabelstyle .tl_gset:N = \g_edu_ptolabelstyle_tl,
  ptolabelstyle .initial:n = \scriptsize\sffamily,
  ptosymbol .tl_gset:N = \g_ptosymbol_tl,
  ptosymbol .initial:n = $\blacktriangleright$,
  ptosymbolstyle .tl_gset:N = \g_ptosymbolstyle_tl,
  ptosymbolstyle .initial:n = \small\sffamily,
}

\keys_define:nn {edu} {
  cemphfg .tl_gset:N = \g_edu_cemphfg_tl,  % Color of cemph
  cemphfg .initial:n = wuSemiDarkRed,
}

\keys_define:nn {edu} {
  ccscale .fp_gset:N = \g_edu_ccscale_fp,    % Scaling Creative Commons Icons
  ccscale .initial:n = 1.5,
  actionfg .tl_gset:N = \g_edu_actionfg_tl,  % Color of action-symbol
  actionfg .initial:n = black,
  speechfg .tl_gset:N = \g_edu_speechfg_tl,  % Color of speech-symbol
  speechfg .initial:n = black,
}

\keys_define:nn {edu} {
  colortheme .tl_gset:N = \g_edu_colortheme_tl, % Color zheme
  colortheme .initial:n =,
  styletheme .tl_gset:N = \g_edu_styletheme_tl, % Style theme
  styletheme .initial:n =,
}

\keys_define:nn {edu} {
  graphicspath .tl_gset:N = \g_edu_graphicspath_tl,  % Path to graphics
  graphicspath .initial:n = img/,
  tikzpath .tl_gset:N = \g_edu_tikzpath_tl,          % Path to pgf-files (for tikz)
  tikzpath .initial:n = tikz/,
}

\keys_define:nn {edu} {
  exelabel .tl_gset:N = \g_edu_exelabel_tl,
  exelabel .initial:n = Aufgabe,
  subexelabel .tl_gset:N = \g_edu_subexelabel_tl,
  subexelabel .initial:n =,
}

\keys_define:nn {edu} {
  exenumberstyle .tl_gset:N = \g_edu_exenumberstyle_tl,
  exenumberstyle .initial:n = \footnotesize,
  exenumberseparator .tl_gset:N = \g_edu_exenumberseparator_tl,
  exenumberseparator .initial:n = .,
  exelabelstyle .tl_gset:N = \g_edu_exelabelstyle_tl,
  exelabelstyle .initial:n = \large\bfseries\sffamily,
  exestyle .tl_gset:N = \g_edu_exestyle_tl,
  exestyle .initial:n = \large\sffamily,
  exepointsstyle .tl_gset:N = \g_edu_exepointsstyle_tl,
  exepointsstyle .initial:n = \bfseries\sffamily,
}

\keys_define:nn {edu} {
  exenumberfg .tl_gset:N = \g_edu_exenumberfg_tl,
  exenumberfg .initial:n = white,
  exenumberbg .tl_gset:N = \g_edu_exenumberbg_tl,
  exenumberbg .initial:n = black,
  exelabelfg .tl_gset:N = \g_edu_exelabelfg_tl,
  exelabelfg .initial:n = black,
  exelabelbg .tl_gset:N = \g_edu_exelabelbg_tl,
  exelabelbg .initial:n = white,
  exefg .tl_gset:N = \g_edu_exefg_tl,
  exefg .initial:n = black,
  exebg .tl_gset:N = \g_edu_exebg_tl,
  exebg .initial:n = white,
  exepointsfg .tl_gset:N = \g_edu_exepointsfg_tl,
  exepointsfg .initial:n = black,
  execalcfg .tl_gset:N = \g_edu_execalcfg_tl,
  execalcfg .initial:n = lightgray,
  exedifffg .tl_gset:N = \g_edu_exedifffg_tl,
  exedifffg .initial:n = lightgray,
}

\keys_define:nn {edu} {
  subexenumberstyle .tl_gset:N = \g_edu_subexenumberstyle_tl,
  subexenumberstyle .initial:n = \scriptsize,
  subexenumberseparator .tl_gset:N = \g_edu_subexenumberseparator_tl,
  subexenumberseparator .initial:n =,
  subexelabelstyle .tl_gset:N = \g_edu_subexelabelstyle_tl,
  subexelabelstyle .initial:n = \bfseries\sffamily,
  subexestyle .tl_gset:N = \g_edu_subexestyle_tl,
  subexestyle .initial:n = \sffamily,
  subexepointsstyle .tl_gset:N = \g_edu_subexepointsstyle_tl,
  subexepointsstyle .initial:n = \small\bfseries\sffamily,
}

\keys_define:nn {edu} {
  subexenumberfg .tl_gset:N = \g_edu_subexenumberfg_tl,
  subexenumberfg .initial:n = white,
  subexenumberbg .tl_gset:N = \g_edu_subexenumberbg_tl,
  subexenumberbg .initial:n = black,
  subexelabelfg .tl_gset:N = \g_edu_subexelabelfg_tl,
  subexelabelfg .initial:n = black,
  subexelabelbg .tl_gset:N = \g_edu_subexelabelbg_tl,
  subexelabelbg .initial:n = white,
  subexefg .tl_gset:N = \g_edu_subexefg_tl,
  subexefg .initial:n = black,
  subexebg .tl_gset:N = \g_edu_subexebg_tl,
  subexebg .initial:n = white,
  subexepointsfg .tl_gset:N = \g_edu_subexepointsfg_tl,
  subexepointsfg .initial:n = black,
}

\keys_define:nn {edu} {
  multiexenumberstyle .tl_gset:N = \g_edu_multiexenumberstyle_tl,
  multiexenumberstyle .initial:n = \sffamily,
  multiexepointsstyle .tl_gset:N = \g_edu_multiexepointsstyle_tl,
  multiexepointsstyle .initial:n = \sffamily\footnotesize\bfseries,
}

\keys_define:nn {edu} {
  multiexenumberfg .tl_gset:N = \g_edu_multiexenumberfg_tl,
  multiexenumberfg .initial:n = black,
  multiexepointsfg .tl_gset:N = \g_edu_multiexepointsfg_tl,
  multiexepointsfg .initial:n = black,
}

\keys_define:nn {edu} {
  multiexenumberleft .tl_gset:N = \g_edu_multiexenumberleft_tl,
  multiexenumberleft .initial:n =,
  multiexenumberright .tl_gset:N = \g_edu_multiexenumberright_tl,
  multiexenumberright .initial:n = ),
}

\keys_define:nn {edu} {
  exepointslabel .tl_gset:N = \g_edu_exepointslabel_tl,
  exepointslabel .initial:n = \,P,
  subexepointslabel .tl_gset:N = \g_edu_subexepointslabel_tl,
  subexepointslabel .initial:n = \,P,
  multiexepointslabel .tl_gset:N = \g_edu_multiexepointslabel_tl,
  multiexepointslabel .initial:n =,
}

\keys_define:nn {edu} {
  exepointsleft .tl_gset:N = \g_edu_exepointsleft_tl,
  exepointsleft .initial:n = [,
  exepointsright .tl_gset:N = \g_edu_exepointsright_tl,
  exepointsright .initial:n = ],
  subexepointsleft .tl_gset:N = \g_edu_subexepointsleft_tl,
  subexepointsleft .initial:n = [,
  subexepointsright .tl_gset:N = \g_edu_subexepointsright_tl,
  subexepointsright .initial:n = ],
  multiexepointsleft .tl_gset:N = \g_edu_multiexepointsleft_tl,
  multiexepointsleft .initial:n = [,
  multiexepointsright .tl_gset:N = \g_edu_multiexepointsright_tl,
  multiexepointsright .initial:n = ],
}

\keys_define:nn {edu} {
  exepointsachieved .bool_gset:N = \g_edu_exepointsachieved_bool,
  exepointsachieved .initial:n = false,
  subexepointsachieved .bool_gset:N = \g_edu_subexepointsachieved_bool,
  subexepointsachieved .initial:n = false,
  exepointsachievedspace .dim_gset:N = \g_edu_exepointsachievedspace_dim,
  exepointsachievedspace .initial:n = 0.6cm,
  subexepointsachievedspace .dim_gset:N = \g_edu_subexepointsachievedspace_dim,
  subexepointsachievedspace .initial:n = 0.6cm,
  exepointsachievedsep .tl_gset:N = \g_edu_exepointsachievedsep_tl,
  exepointsachievedsep .initial:n = /\,,
  subexepointsachievedsep .tl_gset:N = \g_edu_subexepointsachievedsep_tl,
  subexepointsachievedsep .initial:n = /\,,
}

\keys_define:nn {edu} {
  exebeforeskip .dim_gset:N = \g_edu_exebeforeskip_dim,
  exeafterskip .dim_gset:N = \g_edu_exeafterskip_dim,
  subexebeforeskip .dim_gset:N = \g_edu_subexebeforeskip_dim,
  subexeafterskip .dim_gset:N = \g_edu_subexeafterskip_dim,
  arraybeforeskip .dim_gset:N = \g_edu_arraybeforeskip_dim,
  arrayafterskip .dim_gset:N = \g_edu_arrayafterskip_dim,
}

\__edu_keys_initial:n {
  exebeforeskip = 2.25ex,
  exeafterskip = 0.5ex,
  subexebeforeskip = 1.5ex,
  subexeafterskip = 0.5ex,
  arraybeforeskip = 0.5\baselineskip,
  arrayafterskip= 0.5\baselineskip
}

\keys_define:nn {edu} {
  sollabel .tl_gset:N = \g_edu_sollabel_tl,
  sollabel .initial:n = {L\"osung},
  subsollabel .tl_gset:N = \g_edu_subsollabel_tl,
  subsollabel .initial:n = ,
}

\keys_define:nn {edu} {
  solnumberstyle .tl_gset:N = \g_edu_solnumberstyle_tl,
  solnumberstyle .initial:n = \footnotesize,
  solnumberseparator .tl_gset:N = \g_edu_solnumberseparator_tl,
  solnumberseparator .initial:n = .,
  sollabelstyle .tl_gset:N = \g_edu_sollabelstyle_tl,
  sollabelstyle .initial:n = \large\bfseries\sffamily,
  solstyle .tl_gset:N = \g_edu_solstyle_tl,
  solstyle .initial:n = \large\sffamily,
}

\keys_define:nn {edu} {
  solnumberfg .tl_gset:N = \g_edu_solnumberfg_tl,
  solnumberfg .initial:n = white,
  solnumberbg .tl_gset:N = \g_edu_solnumberbg_tl,
  solnumberbg .initial:n = black,
  sollabelfg .tl_gset:N = \g_edu_sollabelfg_tl,
  sollabelfg .initial:n = black,
  sollabelbg .tl_gset:N = \g_edu_sollabelbg_tl,
  sollabelbg .initial:n = white,
  solfg .tl_gset:N = \g_edu_solfg_tl,
  solfg .initial:n = black,
  solbg .tl_gset:N = \g_edu_solbg_tl,
  solbg .initial:n = white,
}

\keys_define:nn {edu} {
  subsolnumberstyle .tl_gset:N = \g_edu_subsolnumberstyle_tl,
  subsolnumberstyle .initial:n = \scriptsize,
  subsolnumberseparator .tl_gset:N = \g_edu_subsolnumberseparator_tl,
  subsolnumberseparator .initial:n = ,
  subsollabelstyle .tl_gset:N = \g_edu_subsollabelstyle_tl,
  subsollabelstyle .initial:n = \bfseries\sffamily,
  subsolstyle .tl_gset:N = \g_edu_subsolstyle_tl,
  subsolstyle .initial:n = \sffamily,
}

\keys_define:nn {edu} {
  subsolnumberfg .tl_gset:N = \g_edu_subsolnumberfg_tl,
  subsolnumberfg .initial:n = white,
  subsolnumberbg .tl_gset:N = \g_edu_subsolnumberbg_tl,
  subsolnumberbg .initial:n = black,
  subsollabelfg .tl_gset:N = \g_edu_subsollabelfg_tl,
  subsollabelfg .initial:n = black,
  subsollabelbg .tl_gset:N = \g_edu_subsollabelbg_tl,
  subsollabelbg .initial:n = white,
  subsolfg .tl_gset:N = \g_edu_subsolfg_tl,
  subsolfg .initial:n = black,
  subsolbg .tl_gset:N = \g_edu_subsolbg_tl,
  subsolbg .initial:n = white,
}

\keys_define:nn {edu} {
  solbeforeskip .dim_gset:N = \g_edu_solbeforeskip_dim,
  solafterskip .dim_gset:N = \g_edu_solafterskip_dim,
  subsolbeforeskip .dim_gset:N = \g_edu_subsolbeforeskip_dim,
  subsolafterskip .dim_gset:N = \g_edu_subsolafterskip_dim,
}

\__edu_keys_initial:n {
  solbeforeskip = 2.25ex,
  solafterskip = 0.5ex,
  subsolbeforeskip = 1.5ex,
  subsolafterskip = 0.5ex,
}

\keys_define:nn {edu} {
  showresults .bool_gset:N = \g_edu_showresults_bool,
  showresults .initial:n = false,
  resultresetmultiexe .bool_gset:N = \g_edu_resultresetmultiexe_bool,
  showresults .initial:n = false,
  resultfg .tl_gset:N = \g_edu_resultfg_tl,
  resultfg .initial:n = wuRed,
  resultrule .dim_gset:N = \g_edu_resultrule_dim,
  resultrule .initial:n = 0.4pt,
  resultrulelength .dim_gset:N = \g_edu_resultrulelength_dim,
  resultrulelength .initial:n = 2cm,
  resultrulevoffset .dim_gset:N = \g_edu_resultrulevoffset_dim,
  resultrulevoffset .initial:n = -4pt,
  resultboxwidth .dim_gset:N = \g_edu_resultboxwidth_dim,
  resultboxwidth .initial:n = 2cm,
  resultboxheight .dim_gset:N = \g_edu_resultboxheight_dim,
  resultboxheight .initial:n = 0.65cm,
  resultrulevoffset .dim_gset:N = \g_edu_resultboxvoffset_dim,
  resultrulevoffset .initial:n = -5pt,
  resulttitlelabel .bool_gset:N = \g_edu_resulttitlelabel_bool,
  resulttitlelabel .initial:n = true,
  resulttitlelabellabel .tl_gset:N = \g_edu_resulttitlelabellabel_tl,
  resulttitlelabellabel .initial:n = $\star$,
  resulttitlelabelstyle .tl_gset:N = \g_edu_resulttitlelabelstyle_tl,
  resulttitlelabelstyle .initial:n = \LARGE,
  resulttitlelabelfg .tl_gset:N = \g_edu_resulttitlelabelfg_tl,
  resulttitlelabelfg .initial:n = black,
  resultlistinglabel .tl_gset:N = \g_edu_resultlistinglabel_tl,
  resultlistinglabel .initial:n = L\"osung,
}

\keys_define:nn {edu} {
  questlabel .tl_gset:N = \g_edu_questlabel_tl,
  questlabel .initial:n = Frage,
  questpointslabel .tl_gset:N = \g_edu_questpointslabel_tl,
  questpointslabel .initial:n = \,P,
}

\keys_define:nn {edu} {
  questlabelstyle .tl_gset:N = \g_edu_questlabelstyle_tl,
  questlabelstyle .initial:n = \sffamily\bfseries\small,
  queststyle .tl_gset:N = \g_edu_queststyle_tl,
  queststyle .initial:n = \sffamily\small,
  questpointsstyle .tl_gset:N = \g_edu_questpointsstyle_tl,
  questpointsstyle .initial:n = \sffamily\small,
}

\keys_define:nn {edu} {
  questlabelfg .tl_gset:N = \g_edu_questlabelfg_tl,
  questlabelfg .initial:n = black,
  questmclabelfg .tl_gset:N = \g_edu_questmclabelfg_tl,
  questmclabelfg .initial:n = black,
}

\keys_define:nn {edu} {
  questpointsleft .tl_gset:N = \g_edu_questpointsleft_tl,
  questpointsleft .initial:n = [,
  questpointsright .tl_gset:N = \g_edu_questpointsright_tl,
  questpointsright .initial:n = ],
}

\keys_define:nn {edu} {
  questpointssep .dim_gset:N = \g_edu_questpointssep_dim,
  questpointssep .initial:n = 0.25em,
  questsep .dim_gset:N = \g_edu_questsep_dim,
  questsep .initial:n = 0.5em,
}

\__edu_keys_initial:n {questpointssep = 0.25em}
\__edu_keys_initial:n {questsep = 0.5em}

\keys_define:nn {edu} {
  questbeforeskip .dim_gset:N = \g_edu_questbeforeskip_dim,
  questbeforeskip .initial:n = 1ex,
  questafterskip .dim_gset:N = \g_edu_questafterskip_dim,
  questafterskip .initial:n = 0ex,
}

\__edu_keys_initial:n {questbeforeskip = 1ex}
\__edu_keys_initial:n {questafterskip = 0ex}

\keys_define:nn {edu} {
  shownotes .bool_gset:N = \g_edu_shownotes_bool,
  shownotes .initial:n = true,
  notetstyle .tl_gset:N = \g_edu_notetstyle_tl,
  notetstyle .initial:n = \sffamily,
  notehrule .dim_gset:N = \g_edu_notehrule_dim,
  notehrule .initial:n = 0.4pt,
  notetfg .tl_gset:N = \g_edu_notetfg_tl,
  notetfg .initial:n = wuRed,
  notehrfg .tl_gset:N = \g_edu_notehrfg_tl,
  notehrfg .initial:n = wuRed,
}

\keys_define:nn {edu} {
  ttendtime .bool_gset:N = \g_edu_ttendtime_bool,
  ttendtime .initial:n = true,
}

\keys_define:nn {edu} {
  tttimelabel .tl_gset:N = \g_edu_tttimelabel_tl,
  tttimelabel .initial:n = Zeit,
  ttstagelabel .tl_gset:N = \g_edu_ttstagelabel_tl,
  ttstagelabel .initial:n = Phase,
  ttactivitylabel .tl_gset:N = \g_edu_ttactivitylabel_tl,
  ttactivitylabel .initial:n = Ablauf,
  ttmethodlabel .tl_gset:N = \g_edu_ttmethodlabel_tl,
  ttmethodlabel .initial:n = Methoden,
  ttmedialabel .tl_gset:N = \g_edu_ttmedialabel_tl,
  ttmedialabel .initial:n = Medien/Material,
}

\keys_define:nn {edu} {
  tttimewidth .dim_gset:N = \g_edu_tttimewidth_dim,
  tttimewidth .initial:n = 1cm,
  ttstagewidth .dim_gset:N = \g_edu_ttstagewidth_dim,
  ttstagewidth .initial:n = 2.25cm,
  ttmethodwidth .dim_gset:N = \g_edu_ttmethodwidth_dim,
  ttmethodwidth .initial:n = 2cm,
  ttmediawidth .dim_gset:N = \g_edu_ttmediawidth_dim,
  ttmediawidth .initial:n = 2.75cm,
}

\keys_define:nn {edu} {
  tttimewidthlscape .dim_gset:N = \g_edu_tttimewidthlscape_dim,
  tttimewidthlscape .initial:n = 1cm,
  ttstagewidthlscape .dim_gset:N = \g_edu_ttstagewidthlscape_dim,
  ttstagewidthlscape .initial:n = 3.5cm,
  ttmethodwidthlscape .dim_gset:N = \g_edu_ttmethodwidthlscape_dim,
  ttmethodwidthlscape .initial:n = 3.5cm,
  ttmediawidthlscape .dim_gset:N = \g_edu_ttmediawidthlscape_dim,
  ttmediawidthlscape .initial:n = 3.5cm,
}

\keys_define:nn {edu} {
  ttshowtime .bool_gset:N = \g_edu_ttshowtime_bool,
  ttshowtime .initial:n = true,
  ttentrytimelabel .tl_gset:N = \g_edu_ttentrytimelabel_tl,
  ttentrytimelabel .initial:n = ,
  ttdisablehyphenation .bool_gset:N = \g_edu_ttdisablehyphenation_bool,
  ttdisablehyphenation .initial:n = true,
}

\keys_define:nn {edu} {
  seqteacherlabel .tl_gset:N = \g_edu_seqteacherlabel_tl,
  seqteacherlabel .initial:n = L,
  seqstudentlabel .tl_gset:N = \g_edu_seqstudentlabel_tl,
  seqstudentlabel .initial:n = S,
}

\keys_define:nn {edu} {
  seqteacherstyle .tl_gset:N = \g_edu_seqteacherstyle_tl,
  seqteacherstyle .initial:n = \sffamily\bfseries,
  seqetudentstyle .tl_gset:N = \g_edu_seqetudentstyle_tl,
  seqetudentstyle .initial:n = \sffamily\bfseries,
}

\keys_define:nn {edu} {
  seqteacherfg .tl_gset:N = \g_edu_seqteacherfg_tl,
  seqteacherfg .initial:n = black,
  seqstudentfg .tl_gset:N = \g_edu_seqstudentfg_tl,
  seqstudentfg .initial:n = black,
}

\keys_define:nn {edu} {
  bbstyle .tl_gset:N = \g_edu_bbstyle_tl,
  bbstyle .initial:n = \sffamily,
  bbfontsize .dim_gset:N = \g_edu_bbfontsize_dim,
  bbfontsize .initial:n = 8pt,
  bbbaselineoffset .dim_gset:N = \g_edu_bbbaselineoffset_dim,
  bbbaselineoffset .initial:n = 1pt,
  bbheight .dim_gset:N = \g_edu_bbheight_dim,
  bbheight .initial:n = 0.25\linewidth - 2\fboxsep,
}

\__edu_keys_initial:n {bbheight = 0.25\linewidth - 2\fboxsep}

\keys_define:nn {edu} {
  bbsectionstyle .tl_gset:N = \g_edu_bbsectionstyle_tl,
  bbsectionstyle .initial:n = \normalsize\scshape\color{wuRed},
  bbsubsectionstyle .tl_gset:N = \g_edu_bbsubsectionstyle_tl,
  bbsubsectionstyle .initial:n = \small\scshape,
  bbsubsubsectionstyle .tl_gset:N = \g_edu_bbsubsubsectionstyle_tl,
  bbsubsubsectionstyle .initial:n = \ulined,
}

\keys_define:nn {edu} {
  examtitlefieldilabel .tl_gset:N = \g_edu_examtitlefieldilabel_tl,
  examtitlefieldilabel .initial:n = Nachname,
  examtitlefieldiilabel .tl_gset:N = \g_edu_examtitlefieldiilabel_tl,
  examtitlefieldiilabel .initial:n = Vorname,
  examtitlefieldiiilabel .tl_gset:N = \g_edu_examtitlefieldiiilabel_tl,
  examtitlefieldiiilabel .initial:n = ,
}

\keys_define:nn {edu} {
  examtitlefieldsep .dim_gset:N = \g_edu_examtitlefieldsep_dim,
  examtitlefieldsep .initial:n = 0.75cm,
  examtitlefieldiwidth .dim_gset:N = \g_edu_examtitlefieldiwidth_dim,
  examtitlefieldiwidth .initial:n = 5.5cm,
  examtitlefieldiiwidth .dim_gset:N = \g_edu_examtitlefieldiiwidth_dim,
  examtitlefieldiiwidth .initial:n = 5.5cm,
  examtitlefieldiiiwidth .dim_gset:N = \g_edu_examtitlefieldiiiwidth_dim,
  examtitlefieldiiiwidth .initial:n = 0cm,
  examtitlegraphicsscale .fp_gset:N = \g_edu_examtitlegraphicsscale_fp,
  examtitlegraphicsscale .initial:n = 0.075,
  examtitlegraphicsheight .dim_gset:N = \g_edu_examtitlegraphicsheight_dim,
  examtitlegraphicsheight .initial:n = 2cm,
}

\tl_new:N \g_edu_exampointstabletype_tl

\keys_define:nn {edu} {
  exampointstabletype .choices:nn = {
    X, C
  }{
    \tl_gset:NV \g_edu_exampointstabletype_tl \l_keys_choice_tl
  },
%  exampointstabletype .choice_code:n = {
%    \tl_gset:NV \g_edu_exampointstabletype_tl \l_keys_choice_tl
%  },
%  exampointstabletype .generate_choices:n = {
%    X,
%    C
%  },
  exampointstabletype .initial:n = X,
  exampointssecondmark .bool_gset:N = \g_edu_exampointssecondmark_bool,    % Print secondary mark
  exampointssecondmark .initial:n = true,
  exampointssignature .bool_gset:N = \g_edu_exampointssignature_bool,    % Print field for signature
  exampointssignature .initial:n = true,
}

\keys_define:nn {edu} {
  exampointsmarklabel .tl_gset:N = \g_edu_exampointsmarklabel_tl,
  exampointsmarklabel .initial:n = Note,
  exampointssecondmarklabel .tl_gset:N = \g_edu_exampointssecondmarklabel_tl,
  exampointssecondmarklabel .initial:n = M\"undlich,
  exampointsoflabel .tl_gset:N = \g_edu_exampointsoflabel_tl,
  exampointsoflabel .initial:n = von,
  exampointsaveragelabel .tl_gset:N = \g_edu_exampointsaveragelabel_tl,
  exampointsaveragelabel .initial:n = $\varnothing$,
  exampointssignaturelabel .tl_gset:N = \g_edu_exampointssignaturelabel_tl,
  exampointssignaturelabel .initial:n = Unterschrift~Erziehungberechtigte(r),
}

\keys_define:nn {edu} {
  exampointstablelabel .tl_gset:N = \g_edu_exampointstablelabel_tl,
  exampointstablelabel .initial:n = Punkteverteilung,
  exampointstableexelabel .tl_gset:N = \g_edu_exampointstableexelabel_tl,
  exampointstableexelabel .initial:n = Aufg.,
  exampointstablemaxlabel .tl_gset:N = \g_edu_exampointstablemaxlabel_tl,
  exampointstablemaxlabel .initial:n = Max.~P.,
  exampointstableachlabel .tl_gset:N = \g_edu_exampointstableachlabel_tl,
  exampointstableachlabel .initial:n = Err.~P.,
  exampointstablesumlabel .tl_gset:N = \g_edu_exampointstablesumlabel_tl,
  exampointstablesumlabel .initial:n = $\sum$,
}

\keys_define:nn {edu} {
  exampointstablewidth .tl_gset:N = \g_edu_exampointstablewidth_tl,
  exampointstablewidth .initial:n = 0.625\linewidth,
}

%\__edu_keys_initial:n {exampointstablewidth = 0.625\linewidth}

\keys_define:nn {edu} {
  lstnumberfg .tl_gset:N = \g_edu_lstnumberfg_tl,
  lstnumberfg .initial:n = black,
  lstkeywordfg .tl_gset:N = \g_edu_lstkeywordfg_tl,
  lstkeywordfg .initial:n = black,
  lstrulefg .tl_gset:N = \g_edu_lstrulefg_tl,
  lstrulefg .initial:n = gray,
  lstkeywordsprocessing .bool_gset:N = \g_edu_lstkeywordsprocessing_bool,
  lstkeywordsprocessing .initial:n = true,
}

\tl_new:N \g_edu_struktexqtree_tl

\keys_define:nn {edu} {
  struktexqtree .choices:nn = {
    struktex,
    tikz-qtree
  }{
    \tl_gset:NV \g_edu_struktexqtree_tl \l_keys_choice_tl
  },
%  struktexqtree .choice_code:n = {
%    \tl_gset:NV \g_edu_struktexqtree_tl \l_keys_choice_tl
%  },
%  struktexqtree .generate_choices:n = {  % option for choosing package
%    struktex,
%    tikz-qtree
%  },
  struktexqtree .initial:n = struktex
}

\keys_define:nn {edu} {
  usepackageverse .bool_gset:N = \g_edu_usepackage_verse_bool,    % option for loading package 'verse'
  usepackageverse .initial:n = false,
}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{scrartcl}%
}

\ProcessOptions              % LaTeX-Basics (for \PassOptionsToClass)
\ProcessKeysOptions{edu}  % l3keys2e options

\LoadClass{scrartcl}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}

\RequirePackage{calc}
\RequirePackage{etoolbox}

\RequirePackage{booktabs}
\RequirePackage{ccicons}
\RequirePackage{datetime}
\RequirePackage[inline]{enumitem}
\RequirePackage{eurosym}                                           % Euro-Sign
\RequirePackage{expdlist}
\RequirePackage{fontawesome}
\RequirePackage{geometry}
\RequirePackage[notcomma, notperiod, notquote, notquery]{hanging}  % Hanging indention of multiexe
\RequirePackage{lastpage}                                          % Number of pages with
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{pdflscape}
\RequirePackage{pifont}
\RequirePackage[newcommands]{ragged2e}
\RequirePackage{rotating}
\RequirePackage{scrpage2}
\RequirePackage{setspace}
\RequirePackage{siunitx}
\RequirePackage{tabularx}
\RequirePackage{textcomp}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage[normalem]{ulem}
\RequirePackage{xspace}

\bool_if:NT \g_edu_transparency_bool {
  \RequirePackage[none]{hyphenat}
}

% verse Package needs to be loaded before hyperref.
\bool_if:NT \g_edu_usepackage_verse_bool {
  \RequirePackage{verse}
}

\RequirePackage{graphicx}
\RequirePackage[svgnames, table]{xcolor}
\RequirePackage{subfig}
\RequirePackage{tikz}

\tl_if_eq:VnT \g_edu_struktexqtree_tl {tikz-qtree} {
  \ExplSyntaxOff
  \RequirePackage{tikz-qtree}
  \ExplSyntaxOn
}

\RequirePackage{tikzsymbols}

\AtEndPreamble{
\tl_if_empty:NF \g_edu_colortheme_tl {
  \RequirePackage{edu-colors-\g_edu_colortheme_tl}
}

\tl_if_empty:NF \g_edu_styletheme_tl {
  \RequirePackage{edu-styles-\g_edu_styletheme_tl}
}
}



\RequirePackage{listings}
\RequirePackage{xsimverb}

% menukeys needs to be loaded at the end. Otherwise there occurs an
% option clash with newtxmath/amsmath, which could not be fixed.
\AtEndPreamble{
  \RequirePackage[os=win]{menukeys}
  \renewmenumacro{\menu}[>]{angularmenus}
  \renewmenumacro{\keys}[+]{angularkeys}
}

% Temporary deactivate struktex as it overwrites libertine as math font.
%\tl_if_eq:VnT \g_edu_struktexqtree_tl {struktex} {
%  \RequirePackage{struktex}
%}

\RequirePackage{bibgerm}
\RequirePackage{hyperref}

\AtBeginEnvironment{center}{
  \medmuskip=4mu
\thickmuskip=5mu
}

\tl_if_exist:NF \c_colon_tl {
  \tl_const:Nx \c_colon_tl { \token_to_str:N : }
}

\bool_if:NT \g_edu_transparency_bool {
  \keys_set:nn {edu} {sfdefault = true}
}

\bool_if:NF \g_edu_sfdefault_bool {            % Serif fonts only if not sfdefault
\tl_if_eq:VnT \g_edu_rmfont_tl {libertine} {
  \RequirePackage[rm]{libertine}
  \tl_gput_right:Nn \g_edu_edumathoptions_tl {, rmmathfont=libertine}
}

\tl_if_eq:VnT \g_edu_rmfont_tl {palatino} {
  \RequirePackage{palatino}
  \tl_gput_right:Nn \g_edu_edumathoptions_tl {, rmmathfont=palatino}
}
}

\tl_if_eq:VnT \g_edu_sffont_tl {lato} {
  \RequirePackage[defaultsans]{lato}
}

\tl_if_eq:VnT \g_edu_sffont_tl {sourcesanspro} {
  \RequirePackage[scale=0.96]{sourcesanspro}
}

\tl_if_eq:VnT \g_edu_sffont_tl {roboto} {
  \RequirePackage[scaled=0.9]{roboto}    % Add scaled option after existing bug in roboto is fixed
}

\tl_if_eq:VnT \g_edu_ttfont_tl {beramono} {
  \RequirePackage[scaled=0.85]{beramono}
}

\tl_if_eq:VnT \g_edu_ttfont_tl {sourcecodepro} {
  \RequirePackage[scale=0.875]{sourcecodepro}
}

\bool_if:NT \g_edu_sfdefault_bool {
  \renewcommand{\familydefault}{\sfdefault}
}


\AtBeginDocument{
  \bool_if:NTF \g_edu_twoup_bool {
    \KOMAoptions{fontsize=\dim_use:N \g_edu_twoupfontsize_dim}
  }{
  \KOMAoptions{fontsize=\dim_use:N \g_edu_fontsize_dim}
  }
}


\tl_new:N \g_edu_author_tl
\tl_new:N \g_edu_class_tl
\tl_new:N \g_edu_date_tl
\tl_new:N \g_edu_email_tl
\tl_new:N \g_edu_field_tl
\tl_new:N \g_edu_group_tl
\tl_new:N \g_edu_license_tl
\tl_new:N \g_edu_short_tl
\tl_new:N \g_edu_subject_tl
\tl_new:N \g_edu_subtitle_tl
\tl_new:N \g_edu_title_tl
\tl_new:N \g_edu_titlenumber_tl
\tl_new:N \g_edu_version_tl


\tl_new:N \g_edu_authorshort_tl
\tl_new:N \g_edu_classshort_tl
\tl_new:N \g_edu_dateshort_tl
\tl_new:N \g_edu_emailshort_tl
\tl_new:N \g_edu_fieldshort_tl
\tl_new:N \g_edu_groupshort_tl
\tl_new:N \g_edu_licenseshort_tl
\tl_new:N \g_edu_shortshort_tl
\tl_new:N \g_edu_subjectshort_tl
\tl_new:N \g_edu_subtitleshort_tl
\tl_new:N \g_edu_titleshort_tl
\tl_new:N \g_edu_versionshort_tl

\DeclareDocumentCommand \author {o m} {
  \tl_gset:Nn \g_edu_author_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_authorshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_authorshort_tl {#1}
  }
}

\DeclareDocumentCommand \class {o m} {
  \tl_gset:Nn \g_edu_class_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_classshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_classshort_tl {#1}
  }
}

\DeclareDocumentCommand \date {o m} {
  \tl_gset:Nn \g_edu_date_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_dateshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_dateshort_tl {#1}
  }
}

\DeclareDocumentCommand \email {o m} {
  \tl_gset:Nn \g_edu_email_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_emailshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_emailshort_tl {#1}
  }
}

\DeclareDocumentCommand \field {o m} {
  \tl_gset:Nn \g_edu_field_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_fieldshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_fieldshort_tl {#1}
  }
}

\DeclareDocumentCommand \group {o m} {
  \tl_gset:Nn \g_edu_group_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_groupshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_groupshort_tl {#1}
  }
}

\DeclareDocumentCommand \license {o m} {
  \tl_gset:Nn \g_edu_license_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_licenseshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_licenseshort_tl {#1}
  }
}

\DeclareDocumentCommand \short {o m} {
  \tl_gset:Nn \g_edu_short_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_shortshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_shortshort_tl {#1}
  }
}

\DeclareDocumentCommand \subject {o m} {
  \tl_gset:Nn \g_edu_subject_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_subjectshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_subjectshort_tl {#1}
  }
}

\DeclareDocumentCommand \subtitle {o m} {
  \tl_gset:Nn \g_edu_subtitle_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_subtitleshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_subtitleshort_tl {#1}
  }
}

\DeclareDocumentCommand \title {o m o} {
  \tl_gset:Nn \g_edu_title_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_titleshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_titleshort_tl {#1}
  }
  \IfValueT{#3} {
    \tl_gset:Nn \g_edu_titlenumber_tl {#3}
  }
}

\DeclareDocumentCommand \version {o m} {
  \tl_gset:Nn \g_edu_version_tl {#2}
  \IfNoValueTF{#1} {
    \tl_gset:Nn \g_edu_versionshort_tl {#2}
  }{
    \tl_gset:Nn \g_edu_versionshort_tl {#1}
  }
}

\DeclareDocumentCommand \printauthor { s } {
  \IfBooleanTF{#1} {
    \g_edu_authorshort_tl\xspace
  }{
    \g_edu_author_tl\xspace
  }
}

\DeclareDocumentCommand \printclass { s } {
  \IfBooleanTF{#1} {
    \g_edu_classshort_tl\xspace
  }{
    \g_edu_class_tl\xspace
  }
}

\DeclareDocumentCommand \printdate { s } {
  \IfBooleanTF{#1} {
    \g_edu_dateshort_tl\xspace
  }{
    \g_edu_date_tl\xspace
  }
}

\DeclareDocumentCommand \printemail { s } {
  \IfBooleanTF{#1} {
    \g_edu_emailshort_tl\xspace
  }{
    \g_edu_email_tl\xspace
  }
}

\DeclareDocumentCommand \printfield { s } {
  \IfBooleanTF{#1} {
    \g_edu_fieldshort_tl\xspace
  }{
    \g_edu_field_tl\xspace
  }
}

\DeclareDocumentCommand \printgroup { s } {
  \IfBooleanTF{#1} {
    \g_edu_groupshort_tl\xspace
  }{
    \g_edu_group_tl\xspace
  }
}

\DeclareDocumentCommand \printlicense { s } {
  \IfBooleanTF{#1} {
    \g_edu_licenseshort_tl\xspace
  }{
    \g_edu_license_tl\xspace
  }
}

\DeclareDocumentCommand \printshort { s } {
  \IfBooleanTF{#1} {
    \g_edu_shortshort_tl\xspace
  }{
    \g_edu_short_tl\xspace
  }
}

\DeclareDocumentCommand \printsubject { s } {
  \IfBooleanTF{#1} {
    \g_edu_subjectshort_tl\xspace
  }{
    \g_edu_subject_tl\xspace
  }
}

\DeclareDocumentCommand \printsubtitle { s } {
  \IfBooleanTF{#1} {
    \g_edu_subtitleshort_tl\xspace
  }{
    \g_edu_subtitle_tl\xspace
  }
}

\DeclareDocumentCommand \printtitle { s } {
  \IfBooleanTF{#1} {
    \g_edu_titleshort_tl\xspace
  }{
    \g_edu_title_tl\xspace
  }
}

\DeclareDocumentCommand \printtitlenumber {  } {
  \g_edu_titlenumber_tl\xspace
}

\DeclareDocumentCommand \printversion { s } {
  \IfBooleanTF{#1} {
    \g_edu_versionshort_tl\xspace
  }{
    \g_edu_version_tl\xspace
  }
}

\renewcommand{\dateseparator}{.}

\newdateformat{ddmmyydateformat}{
  \THEDAY.\THEMONTH.\THEYEAR\xspace
}

\AtBeginDocument{
  \ddmmyydateformat
}

\newdateformat{timestampdateformat}{
  \twodigit{\THEYEAR}
  \g_edu_timestampdateseparator_tl\twodigit{\THEMONTH}
  \g_edu_timestampdateseparator_tl\twodigit{\THEDAY}
}

\newtimeformat{timestamptimeformat}{
  \twodigit{\THEHOUR}
  \g_edu_timestamptimeseparator_tl\twodigit{\THEMINUTE}
  \g_edu_timestamptimeseparator_tl\twodigit{\THESECOND}
}

\DeclareDocumentCommand \timestamp {  } {
  \timestampdateformat
  \settimeformat{timestamptimeformat}
  \today
  \bool_if:NTF \g_edu_timestamptime_bool {
    \g_edu_timestampdatetimeseparator_tl
    \currenttime
  }
  \ddmmyydate
}

\tl_new:N \g__edu_pdftitletemp_tl
\tl_gset:Nn \g__edu_pdftitletemp_tl {\g_edu_title_tl}

\tl_new:N \g__edu_pdfsubjecttemp_tl

\AtEndPreamble{

\tl_if_empty:NF \g_edu_subtitle_tl {
  \tl_gput_right:Nn \g__edu_pdftitletemp_tl {
    \ --~\g_edu_subtitle_tl
  }
}

\tl_if_empty:NF \g_edu_subject_tl {
  \tl_gput_right:Nn \g__edu_pdfsubjecttemp_tl {
    \g_edu_subject_tl
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_subject_tl && !\tl_if_empty_p:N \g_edu_field_tl} {
  \tl_gput_right:Nn \g__edu_pdfsubjecttemp_tl {
    :~
  }
}

\tl_if_empty:NF \g_edu_field_tl {
  \tl_gput_right:Nn \g__edu_pdfsubjecttemp_tl {
    \g_edu_field_tl
  }
}

\tl_if_empty:NF \g_edu_class_tl {
  \tl_gput_right:Nn \g__edu_pdfsubjecttemp_tl {
    \ (\g_edu_class_tl)
  }
}

  \hypersetup{
    breaklinks=false,
    linkcolor=\g_edu_linkfg_tl,
    citecolor=\g_edu_linkfg_tl,
    filecolor=\g_edu_linkfg_tl,
    urlcolor=\g_edu_linkfg_tl,
    linkbordercolor=\tl_use:N \g_edu_linkborderfg_tl,
    citebordercolor=\tl_use:N \g_edu_linkborderfg_tl,
    filebordercolor=\tl_use:N \g_edu_linkborderfg_tl,
    urlbordercolor=\tl_use:N \g_edu_linkborderfg_tl,
    pdftitle={\g__edu_pdftitletemp_tl},
    pdfauthor={\g_edu_author_tl},
    pdfsubject={\g__edu_pdfsubjecttemp_tl},
    linktocpage=true,
  }%

  \bool_if:NTF \g_edu_colorlinks_bool {
    \hypersetup{colorlinks=true}
  }{
    \hypersetup{colorlinks=false}
  }
} % AtEndPreamble

\setlength{\columnsep}{0.75cm}


\dim_new:N \g__edu_listsep_dim
\dim_new:N \g__edu_listmargin_dim
\dim_new:N \g__edu_listarraysep_dim
\dim_new:N \g__edu_listarraymargin_dim

\dim_new:N \g__edu_listlabelwidth_dim

\dim_new:N \g__edu_hangindention_dim

\AtBeginDocument{
  \dim_gset:Nn \g__edu_listsep_dim {\g_edu_listarraysep_dim}
  \dim_gset:Nn \g__edu_listmargin_dim {\g_edu_listarraymargin_dim}
  \dim_gset:Nn \g__edu_listlabelwidth_dim {1.2em}
}

\setlist{%
  partopsep=0ex,
  topsep=0.5\baselineskip - \parskip,
  itemsep=0.5\baselineskip - \parskip,
  parsep=\parskip,
  labelsep=\g__edu_listsep_dim,
  leftmargin=\g__edu_listlabelwidth_dim + \g__edu_listsep_dim + \g__edu_listmargin_dim
}

\setlist[2, 3, 4, 5]{
  topsep=0.5\baselineskip - \parskip,
  leftmargin=1em,
}

\setlist[itemize, 1]{label=\color{\g_edu_itemizefg_tl}\rule[0.3ex]{0.8ex}{0.8ex}}
\setlist[itemize, 2]{label=\color{\g_edu_itemizefg_tl}\rule[0.5ex]{0.8ex}{0.4ex}}
\setlist[itemize, 3]{label=\color{\g_edu_itemizefg_tl}\rule[0.55ex]{0.8ex}{0.2ex}}

\setlist[enumerate, 1]{label=\color{\g_edu_enumeratefg_tl}\textsf{\arabic*.}}
\setlist[enumerate, 2]{label=\color{\g_edu_enumeratefg_tl}\textsf{\alph*.)}}
\setlist[enumerate, 3]{label=\color{\g_edu_enumeratefg_tl}\textsf{\roman*.}}

\setlist[description]{labelsep=0.25em, font=\color{\g_edu_descriptionfg_tl}}

\newenvironment{edulist}[2][0.5\baselineskip]{
  \dim_gset:Nn \g__edu_listarraysep_dim {\g_edu_listarraysep_dim}
  \dim_gset:Nn \g__edu_listarraymargin_dim {\g_edu_listarraymargin_dim}
%
  \vspace{0.5\baselineskip}
  \begin{list}{\sffamily #2}{%
    \setlength{\partopsep}{0ex}%
    \setlength{\topsep}{0pt}%
    \setlength{\parsep}{\parskip}%
    \setlength{\itemsep}{#1 - \parskip}%
    \setlength{\labelsep}{\g__edu_listarraysep_dim}%
    \setlength{\leftmargin}{%
      \g__edu_listlabelwidth_dim + \g__edu_listarraysep_dim + \g__edu_listarraymargin_dim%
    }%
  }
}{
  \end{list}%
  \vspace{0.5\baselineskip}
}

\newenvironment{edulisti}[1][]{
  \begin{enumerate*}[#1]
}{
  \end{enumerate*}%
}

\newenvironment{itemizet}{%
  \@minipagetrue
%  \compress
  \begin{itemize}[
    topsep=0pt,
    itemsep=-0.25\baselineskip,
    leftmargin=1em,
    parsep=0.25\baselineskip,
  ]
}{%
  \vspace{-\baselineskip}
  \end{itemize}
}

%  \makeatletter
%\newcommand{\compress}{\@minipagetrue}
%  \makeatother

%    \end{macrocode}

\DeclareDocumentCommand \itemm { } {\item[\bfseries\texttt{\textminus}]}
\DeclareDocumentCommand \itemn { } {\item[\bfseries\texttt{\textasciitilde}]}
\DeclareDocumentCommand \itemp { } {\item[\bfseries\texttt{+}]}

\DeclareDocumentCommand \itemb { } {
  \item[{\lapbox[\width]{0.325em}{%
    \makebox[0.9em][l]{%
      \makebox[0pt][l]{$\square$}%
    }%
  }}]%
}

\DeclareDocumentCommand \itembcheck { } {
  \item[{\lapbox[\width]{0.325em}{%
    \makebox[0.9em][l]{%
      \makebox[0pt][l]{$\square$}%
      \raisebox{.3ex}{\hspace{0.1em}$\checkmark$}%
    }%
  }}]%
}

\DeclareDocumentCommand \itembblack { } {
  \item[{\lapbox[\width]{0.325em}{%
    \makebox[0.9em][l]{%
      \makebox[0pt][l]{$\blacksquare$}%
    }%
  }}]%
}

\newcolumntype{C}[1]{>{\centering\arraybackslash\hspace{0pt}}p{#1}}

\bool_new:N \__edu_multiexebonus_bool
\bool_gset_false:N \__edu_multiexebonus_bool

\newcolumntype{e}{%
  >{%
    {\sffamily
      \bool_if:NTF \__edu_multiexebonus_bool {
        \multiexelabelboxed*%
      }{
        \multiexelabelboxed%
      }
    }
    \bool_gset_false:N \__edu_multiexebonus_bool
    \hspace{\g__edu_listarraysep_dim}
    \hangpara{\g__edu_hangindention_dim}{1}
    \raggedright\arraybackslash%
  }%
  X%
}%

\newcolumntype{E}{%
  >{%
    {\sffamily
      \bool_if:NTF \__edu_multiexebonus_bool {
        \multiexelabelboxed*%
      }{
        \multiexelabelboxed%
      }
    }
    \bool_gset_false:N \__edu_multiexebonus_bool
    \hspace{\g__edu_listarraysep_dim}$\displaystyle%
  }%
  X%
  <{$}%
}%

\newcolumntype{q}{%
  >{%
    {\sffamily%
      \makebox[\g__edu_listlabelwidth_dim][r]{%
        \color{\g_edu_questmclabelfg_tl}%
        $\square$%
      }%
    }%
    \hspace{\g__edu_listarraysep_dim}%
    \hangpara{\g__edu_hangindention_dim}{1}\raggedright\arraybackslash%
   }%
   X%
}%

\newcolumntype{Q}{%
  >{%
    {\sffamily%
      \makebox[\g__edu_listlabelwidth_dim][r]{%
        \color{\g_edu_questmclabelfg_tl}%
        $\square$%
      }%
    }%
    \hspace{\g__edu_listarraysep_dim}$\displaystyle%
  }%
  X%
  <{$}%
}%

\newcolumntype{a}{%
  >{%
    {\sffamily\g__edu_questmclabelboxed_tl}%
      \hspace{\g__edu_listarraysep_dim}\hangpara{\g__edu_hangindention_dim}{1}\raggedright\arraybackslash%
     }%
     X%
}%

\newcolumntype{A}{%
  >{%
    {\sffamily\g__edu_questmclabelboxed_tl}%
      \hspace{\g__edu_listarraysep_dim}$\displaystyle%
     }%
     X%
    <{$}%
}%


\DeclareDocumentCommand \arraysetup { O{0ex} m } {%
  \par
  \parskipreduce

  \dim_gset:Nn \g__edu_listarraysep_dim {\g_edu_listarraysep_dim}
  \dim_gset:Nn \g__edu_listarraymargin_dim {\g_edu_listarraymargin_dim}

  \setlength{\extrarowheight}{#1}
%  \renewcommand{\arraystretch}{1.25} % War aktiviert. Warum?!
  \setlength{\tabcolsep}{\g__edu_listarraymargin_dim}
  \dim_gset:Nn \g__edu_hangindention_dim {
    \g__edu_listlabelwidth_dim+\g__edu_listarraysep_dim
  }
%
  \str_if_eq:nnTF {#2} {m} {%
      \renewcommand{\tabularxcolumn}[1]{m{##1}}
  }{
      \renewcommand{\tabularxcolumn}[1]{p{##1}}
  }%
%
  \vspace{\g_edu_arraybeforeskip_dim}
  \vspace{-#1}
}

\DeclareDocumentCommand \arraycleanup { } {%
  \vspace{\g_edu_arrayafterskip_dim}
  \parskipreduce
  \par
}

\DeclareDocumentCommand \fpbox { O{\linewidth} m } {
  \noindent\fbox{\parbox{#1}{#2}}
}

\DeclareDocumentCommand \ibox { O{2cm} O{0.65cm} O{-5pt} } {%
  \tikz[baseline=-#3] \draw (0,0) rectangle (#1, #2);
  \hspace{5pt}
}

\DeclareDocumentCommand \dbox { O{\linewidth} O{3cm} } {%
  \par
  \parskipreduce
  \fbox{%
    \noindent\parbox[t][#2]{#1}{\mbox{}}
  }
  \par
  \bool_if:NF \g_edu_parskip_bool {
    \vspace{0.5\baselineskip}
  }
}

\tl_new:N \l__edu_citetext_tl

% Adapted from TeXbook
\cs_new:Npn \__edu_moveright:n #1 {
  \group_begin:
    \leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
  \hbox{}\nobreak\hfil #1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf
  \group_end:
}

\DeclareDocumentEnvironment {citequote} { O{} O{} O{} } {
  \par
  \vspace{0.5\baselineskip}
  \parskipreduce
  \begin{addmargin}{3em}
    \begin{em}
}{
    \bool_if:nT {!\tl_if_empty_p:n {#1} || !\tl_if_empty_p:n {#2} || !\tl_if_empty_p:n {#3}} {
      \tl_clear:N \l__edu_citetext_tl
      \upshape
    \tl_if_empty:nF {#1} {
      \tl_put_right:Nn \l__edu_citetext_tl {\textsc{#1}\xspace}
    }
      \bool_if:nT {!\tl_if_empty_p:n {#2} || !\tl_if_empty_p:n {#3}} {
    \tl_if_empty:nTF {#3} {
      \tl_put_right:Nn \l__edu_citetext_tl {\cite{#2}}
    }{
      \tl_put_right:Nn \l__edu_citetext_tl {\cite[#3]{#2}}
    }
    }
    \__edu_moveright:n \l__edu_citetext_tl
    }
    \end{em}
  \end{addmargin}
  \par
  \vspace{0.5\baselineskip}
  \parskipreduce
}

\DeclareDocumentCommand \setgeometry { } {
  \bool_if:NTF \g_edu_twoup_bool {
    \geometry{a4paper,%
      top=\g_edu_twouptop_dim, bottom=\g_edu_twoupbottom_dim,%
      left=\g_edu_twoupleft_dim, right=\g_edu_twoupright_dim%
    }
  }{
    \geometry{a4paper,%
      top=\g_edu_top_dim, bottom=\g_edu_bottom_dim,%
      left=\g_edu_left_dim, right=\g_edu_right_dim%
    }
  }

  \bool_if:NTF \g_edu_footer_bool {
    \bool_if:NTF \g_edu_twoup_bool {
      \setlength{\footskip}{\g_edu_twoupfootskip_dim}
    }{
      \setlength{\footskip}{\g_edu_footskip_dim}
    }
    \geometry{includefoot}
  }{
    \setlength{\footskip}{0pt}
  }

  \bool_if:NT \g_edu_transparency_bool {
    \keys_set:nn {edu}{footer=false}
    \geometry{a4paper,%
      top=\g_edu_transparencytop_dim, bottom=\g_edu_transparencybottom_dim,%
      left=\g_edu_transparencyleft_dim, right=\g_edu_transparencyright_dim%
    }
  }
  \bool_if:NT \g_edu_glue_bool {
    \geometry{a4paper,%
      top=\g_edu_gluetop_dim, bottom=\g_edu_gluebottom_dim,%
      left=\g_edu_glueleft_dim, right=\g_edu_glueright_dim%
    }
  }
}

\AtEndPreamble{
  \setgeometry
}

\dim_new:N \g__edu_partbefore_dim
\dim_new:N \g__edu_partafter_dim
\dim_gset:Nn \g__edu_partbefore_dim {3.5ex}
\dim_gset:Nn \g__edu_partafter_dim {1.25ex}

\dim_new:N \g__edu_partnumbertempwidth_dim
\dim_new:N \g__edu_partnumberminwidth_dim
\dim_gset:Nn \g__edu_partnumberminwidth_dim {0.9em}

\titleformat{\part}
  [hang]                                                      % Shape
  {\sffamily\bfseries\LARGE\color{\g_edu_partfg_tl}}          % Format
  {\setlength{\fboxsep}{0.125em}%
    \raisebox{0.1ex}{%
      \g_edu_partnumbersize_tl\colorbox{\g_edu_partnumberbg_tl}{%
        \settowidth{\g__edu_partnumbertempwidth_dim}{\thepart}%
        \dim_compare:nNnTF
        {\g__edu_partnumbertempwidth_dim} < {\g__edu_partnumberminwidth_dim} {
          \makebox[\g__edu_partnumberminwidth_dim]{%
            \textcolor{\g_edu_partnumberfg_tl}{\thepart}%
          }
        }{
            \textcolor{\g_edu_partnumberfg_tl}{\thepart}%
        }
      }
    }
  }                                  % Label
  {0.5em}                            % Sep
  {}                                 % Before
  {}                                 % After

\titlespacing*{\part}
  {0pt}                              % Left
  {\g__edu_partbefore_dim - \parskip}  % Beforesep
  {\g__edu_partafter_dim - \parskip}   % Aftersep

\dim_new:N \g__edu_sectionbefore_dim
\dim_new:N \g__edu_sectionafter_dim
\dim_gset:Nn \g__edu_sectionbefore_dim {2.5ex}
\dim_gset:Nn \g__edu_sectionafter_dim {0.75ex}

\titleformat{\section}
  [hang]                                                % Shape
    {
    \bool_if:NTF \g_edu_transparency_bool {
      \large
    }{
      \Large
    }
    \sffamily\bfseries\color{\g_edu_sectionfg_tl}
  } % Format
  {\setlength{\fboxsep}{0.125em}%
    \raisebox{0.2ex}{%
      \g_edu_sectionnumbersize_tl%
      \colorbox{\g_edu_sectionnumberbg_tl}{%
        \textcolor{\g_edu_sectionnumberfg_tl}{\thesection}%
      }
    }
  }                                  % Label
  {0.5em}                            % Sep
  {}                                 % Before
  {}                                 % After

\titlespacing*{\section}
  {0pt}                                       % Left
  {\g__edu_sectionbefore_dim - \parskip}        % Beforesep
  {\g__edu_sectionafter_dim - \parskip}         % Aftersep

\dim_new:N \g__edu_subsectionbefore_dim
\dim_new:N \g__edu_subsectionafter_dim
\dim_gset:Nn \g__edu_subsectionbefore_dim {1.75ex}
\dim_gset:Nn \g__edu_subsectionafter_dim {0.75ex}

\titleformat{\subsection}
  [hang]                                                   % Shape
  {
    \bool_if:NTF \g_edu_transparency_bool {
      \normalsize
    }{
      \large
    }
    \sffamily\bfseries\color{\g_edu_subsectionfg_tl}
  } % Format
  {\setlength{\fboxsep}{0.125em}%
    \raisebox{0.15ex}{%
      \g_edu_subsectionnumbersize_tl%
      \colorbox{\g_edu_subsectionnumberbg_tl}{%
        \textcolor{\g_edu_subsectionnumberfg_tl}{\thesubsection}%
      }
    }
  }                                  % Label
  {0.5em}                             % Sep
  {}                                  % Before
  {}                                  % After

\titlespacing*{\subsection}
  {0pt}                                        % Left
  {\g__edu_subsectionbefore_dim - \parskip}      % Beforesep
  {\g__edu_subsectionafter_dim - \parskip}       % Aftersep

\dim_new:N \g__edu_subsubsectionbefore_dim
\dim_new:N \g__edu_subsubsectionafter_dim
\dim_gset:Nn \g__edu_subsubsectionbefore_dim {1.75ex}
\dim_gset:Nn \g__edu_subsubsectionafter_dim {0.75ex}

\titleformat{\subsubsection}
  [hang]                                                   % Shape
  {
    \bool_if:NTF \g_edu_transparency_bool {
      \small
    }{
      \normalsize
    }
    \sffamily\bfseries\color{\g_edu_subsubsectionfg_tl}
  } % Format
  {\setlength{\fboxsep}{0.125em}%
    \raisebox{0.15ex}{%
      \g_edu_subsubsectionnumbersize_tl%
      \colorbox{\g_edu_subsubsectionnumberbg_tl}{%
        \textcolor{\g_edu_subsubsectionnumberfg_tl}{\thesubsubsection}%
      }
    }
  }                                  % Label
  {0.5em}                             % Sep
  {}                                  % Before
  {}                                  % After

\titlespacing*{\subsubsection}
  {0pt}                                        % Left
  {\g__edu_subsubsectionbefore_dim - \parskip}      % Beforesep
  {\g__edu_subsubsectionafter_dim - \parskip}       % Aftersep

\DeclareDocumentCommand \setpar { } {
  \bool_if:NTF \g_edu_parindent_bool {
    \bool_if:NT \g_edu_parskip_bool {
      \KOMAoptions{parskip=half}
    }
    \setlength{\parindent}{1em} % Important: After \KOMAoptions{parskip=half}
  }{
    \bool_if:NT \g_edu_parskip_bool {
      \KOMAoptions{parskip=half}
    }
    \setlength{\parindent}{0em}
  }
}

\AtBeginDocument{%
  \setpar%
}

\DeclareDocumentCommand \parskipreduce { } {%
  \vspace{-\parskip}
}

\bool_if:NT \g_edu_parts_bool {
  \AtBeginDocument{
    \tl_gput_left:Nn \contentsname {\LARGE}
  }
}

\addtokomafont{partentry}{%
  \color{wuDarkRed}\Large
}

\AtEndPreamble{
  \bool_if:NT \g_edu_parts_bool {
    \tl_gput_right:Nn \g_edu_titlestyle_tl {
      \huge
    }
    \tl_gput_right:Nn \g_edu_subtitlestyle_tl {
      \LARGE
    }
  }
}

\tl_new:N \g__edu_titletext_tl

\DeclareDocumentCommand \maketitle {s} {

\IfBooleanTF{#1} {

\setlength{\parfillskip}{0em}
  \par
  \vspace{0.75ex}
  \parskipreduce
  \group_begin:
    \g_edu_titlestyle_tl%
    \color{\g_edu_titlefg_tl}%
    \noindent
    \tl_if_empty:NF \g_edu_titlenumber_tl {
      \g_edu_titlenumber_tl \hspace{\g_edu_titlenumbersep_dim}
      \settowidth{\g_edu_temp_dim}{\g_edu_titlenumber_tl}
      \addtolength{\g_edu_temp_dim}{\g_edu_titlenumbersep_dim}
      \setlength{\global\g_edu_temp_dim}{\g_edu_temp_dim}
    }
    \g_edu_title_tl%
  \group_end:
  \hfill%
  \tl_if_empty:NF \g_edu_short_tl {
    \group_begin:
      \g_edu_shortstyle_tl%
      \setlength{\fboxsep}{0.25em}
      \colorbox{\g_edu_shortbg_tl}{%
        \textcolor{\g_edu_shortfg_tl}{\g_edu_short_tl}%
      }%
    \group_end:
  }
  \tl_if_empty:NF \g_edu_group_tl {
    \group_begin:
      \hspace{0.5em}
      \g_edu_groupstyle_tl%
        \setlength{\fboxsep}{0.25em}
      \colorbox{\g_edu_groupbg_tl}{%
        \textcolor{\g_edu_groupfg_tl}{\g_edu_group_tl}%
      }%
    \group_end:
  }
  \bool_if:nT {
      \bool_if_p:N \g_edu_showresults_bool &&
      \bool_if_p:N \g_edu_resulttitlelabel_bool
    }{
      \group_begin:
        \hspace{0.4em}
        \g_edu_resulttitlelabelstyle_tl%
        \textcolor{\g_edu_resulttitlelabelfg_tl}{\g_edu_resulttitlelabellabel_tl}%
      \group_end:
    }
  \mbox{}
  \par
  \setlength{\parfillskip}{1em plus 1fil}

  \tl_if_empty:NF \g_edu_subtitle_tl {
    \parskipreduce
    \group_begin:
      \g_edu_subtitlestyle_tl
      \color{\g_edu_titlefg_tl}
      \noindent
    \tl_if_empty:NF \g_edu_titlenumber_tl {
      \hspace*{\g_edu_temp_dim}
    }
      \g_edu_subtitle_tl\par
    \group_end:
  }

  \bool_if:NT \g_edu_transparency_bool {
    \KOMAoption{fontsize}{\dim_use:N \g_edu_transparencyfontsize_dim}%
    \RaggedRight
    \tolerance=10000
  }

}{ % star
\tl_if_empty:NF \g_edu_title_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_titlestyle_tl \color{\g_edu_titlefg_tl}
      \noindent
      \tl_if_empty:NF \g_edu_titlenumber_tl {
      \g_edu_titlenumber_tl \hspace{\g_edu_titlenumbersep_dim}
    }
      \g_edu_title_tl
    \group_end:
    \par\parskipreduce
  }
}

\tl_if_empty:NF \g_edu_subtitle_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \vspace{1ex}
    \group_begin:
      \g_edu_subtitlestyle_tl \color{\g_edu_titlefg_tl} \noindent \g_edu_subtitle_tl
    \group_end:
    \par\parskipreduce
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_subject_tl || !\tl_if_empty_p:N \g_edu_field_tl || !\tl_if_empty_p:N \g_edu_class_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \vspace{4ex}
  }
}

\tl_if_empty:NF \g_edu_subject_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_subjectstyle_tl \noindent \g_edu_subject_tl
    \group_end:
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_subject_tl && !\tl_if_empty_p:N \g_edu_field_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \g_edu_subjectstyle_tl :~
  }
}

\tl_if_empty:NF \g_edu_field_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_fieldstyle_tl \noindent \g_edu_field_tl
    \group_end:
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_subject_tl || !\tl_if_empty_p:N \g_edu_field_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \par\parskipreduce
  }
}

\tl_if_empty:NF \g_edu_class_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_classstyle_tl \noindent \g_edu_class_tl
    \group_end:
      \par\parskipreduce
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_author_tl || !\tl_if_empty_p:N \g_edu_email_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \vspace{3ex}
  }
}

\tl_if_empty:NF \g_edu_author_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_authorstyle_tl \noindent \g_edu_author_tl
    \group_end:
      \par\parskipreduce
  }
}

\tl_if_empty:NF \g_edu_email_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_emailstyle_tl \noindent \href{mailto:\g_edu_email_tl}{\nolinkurl{\g_edu_email_tl}}
    \group_end:
      \par\parskipreduce
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_date_tl || !\tl_if_empty_p:N \g_edu_version_tl || \bool_if_p:N \g_edu_timestamptitle_bool || !\tl_if_empty_p:N \g_edu_license_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \vspace{4ex}
  }
}

\tl_if_empty:NF \g_edu_date_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_datestyle_tl \noindent \g_edu_date_tl
    \group_end:
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_date_tl && !\tl_if_empty_p:N \g_edu_version_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    ,~
  }
}

\tl_if_empty:NF \g_edu_version_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_versionstyle_tl \noindent \g_edu_version_tl
    \group_end:
  }
}

\bool_if:nT {!\tl_if_empty_p:N \g_edu_date_tl || !\tl_if_empty_p:N \g_edu_version_tl} {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \par\parskipreduce
  }
}

\bool_if:NT \g_edu_timestamptitle_bool {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_timestampstyle_tl\timestamp
    \group_end:
    \par\parskipreduce
  }
}

\tl_if_empty:NF \g_edu_license_tl {
  \tl_put_right:Nn \g__edu_titletext_tl {
    \group_begin:
      \g_edu_licensestyle_tl \noindent \g_edu_license_tl
    \group_end:
    \par\parskipreduce
  }
}

  \vspace*{1cm}
  \begin{center}
    \g__edu_titletext_tl
  \end{center}

  \skip_vertical:N \g_edu_titleskip_skip

  \bool_if:NT \g_edu_transparency_bool {
    \KOMAoption{fontsize}{\dim_use:N \g_edu_transparencyfontsize_dim}%
    \RaggedRight
    \tolerance=10000
  }
} % no star
}

\DeclareDocumentCommand \intro { } {
  \vspace{2ex}
  \parskipreduce
}

\tl_gput_right:Nn \quotation {
  \setpar
}

\bool_if:NF \g_edu_parindent_bool { 
\tl_gput_right:Nn \quotation {
  \noindent\ignorespaces
}
}

\AtEndEnvironment{abstract}{\vspace{3em}}

\DeclareDocumentCommand \makeheader { } {
  \group_begin:
    \sffamily\small
    \group_begin:
      \noindent\g_edu_subjectshort_tl \hfill \g_edu_dateshort_tl
    \group_end:\\
    \group_begin:
      \noindent\g_edu_fieldshort_tl \hfill \g_edu_classshort_tl
    \group_end:\\
  \group_end:
  \noindent\rule[0.5em]{\textwidth}{\g_edu_headerrulewidth_dim}
}



\AtBeginDocument {

\pagestyle{scrheadings}
\clearscrheadings
\clearscrheadfoot

  \bool_if:NT \g_edu_footer_bool {

  \tl_new:N \l__edu_footertextl_tl

  \tl_if_empty:NF \g_edu_licenseshort_tl {
    \tl_put_right:Nn \l__edu_footertextl_tl {
      \g_edu_licenseshort_tl\hspace{0.6em}
    }
  }

  \tl_if_empty:NF \g_edu_authorshort_tl {
    \tl_put_right:Nn \l__edu_footertextl_tl {
      \textsc{\g_edu_authorshort_tl}\hspace{0.4em}
    }
  }

  \bool_if:nT {
    !\tl_if_empty_p:N \g_edu_fieldshort_tl ||
    !\tl_if_empty_p:N \g_edu_titleshort_tl
  }{
    \tl_put_right:Nn \l__edu_footertextl_tl {
      \textbar\hspace{0.4em}
    }
  }

  \tl_if_empty:NF \g_edu_fieldshort_tl {
    \tl_put_right:Nn \l__edu_footertextl_tl {
      \g_edu_fieldshort_tl
    }
  }

  \bool_if:nT {
    !\tl_if_empty_p:N \g_edu_fieldshort_tl &&
    !\tl_if_empty_p:N \g_edu_titleshort_tl
  }{
    \tl_put_right:Nn \l__edu_footertextl_tl {
      :\
    }
  }

  \tl_if_empty:NF \g_edu_titleshort_tl {
    \tl_put_right:Nn \l__edu_footertextl_tl {
      \g_edu_titleshort_tl
    }
  }

  \refoot[]{\l__edu_footertextl_tl}  % gerade rechts
  \lofoot[]{\l__edu_footertextl_tl}  % ungerade links


  \tl_new:N \l__edu_footertextr_tl

  \bool_if:nT {
    !\tl_if_empty_p:N \g_edu_versionshort_tl ||
    \bool_if_p:N \g_edu_timestampfooter_bool
  }{
    \tl_put_right:Nn \l__edu_footertextr_tl {
      \scriptsize
      [
    }
  }

  \tl_if_empty:NF \g_edu_versionshort_tl {
    \tl_put_right:Nn \l__edu_footertextr_tl {
      \g_edu_versionshort_tl
    }
  }

  \bool_if:nT {
    !\tl_if_empty_p:N \g_edu_versionshort_tl &&
    \bool_if_p:N \g_edu_timestampfooter_bool
  }{
    \tl_put_right:Nn \l__edu_footertextr_tl {
      ,~
    }
  }

  \bool_if:NT \g_edu_timestampfooter_bool {
    \tl_put_right:Nn \l__edu_footertextr_tl {
      \timestamp
    }
  }

  \bool_if:nT {
    !\tl_if_empty_p:N \g_edu_versionshort_tl ||
    \bool_if_p:N \g_edu_timestampfooter_bool
  }{
    \tl_put_right:Nn \l__edu_footertextr_tl {
      ]
      \normalsize\quad
    }
  }

  \tl_put_right:Nn \l__edu_footertextr_tl {

    \tl_if_empty:NF \g_edu_short_tl {
      \g_edu_shortstyle_tl\small%
      \setlength{\fboxsep}{0.25em}
      \colorbox{black}{%
        \textcolor{\g_edu_shortfg_tl}{\g_edu_shortshort_tl}%
      }%
    }

    \tl_if_empty:NF \g_edu_group_tl {
      \hspace{0.25em}
      \g_edu_groupstyle_tl\small%
      \setlength{\fboxsep}{0.25em}
      \colorbox{black}{%
        \textcolor{\g_edu_groupfg_tl}{\g_edu_groupshort_tl}%
      }%
    }

    \bool_if:nT {
      \bool_if_p:N \g_edu_showresults_bool &&
      \bool_if_p:N \g_edu_resulttitlelabel_bool
    }{
      \hspace{0.4em}
      \Large%
      \textcolor{black}{\g_edu_resulttitlelabellabel_tl}%
    }
    \normalsize\quad
  }

  \bool_if:NT \g_edu_pagecount_bool {
    \rofoot[]{\l__edu_footertextr_tl\small\normalfont\sffamily%
      \pagemark/\pageref*{LastPage}}         % gerade rechts
    \lefoot[]{\l__edu_footertextr_tl\small\normalfont\sffamily%
      \pagemark/\pageref*{LastPage}}         % ungerade links
  }{
    \lefoot[]{\l__edu_footertextr_tl\pagemark}                    % gerade links
    \rofoot[]{\l__edu_footertextr_tl\pagemark}                    % ungerade rechts
  }

  \lehead[]{}  % gerade links
  \rehead[]{}  % gerade rechts
  \lohead[]{}  % ungerade links
  \rohead[]{}  % ungerade rechts

  \setkomafont{pagenumber}{
    \small\normalfont\sffamily
  }

  \setkomafont{pagefoot}{
    \footnotesize\normalfont\sffamily
  }
  }{ % \bool_if:NT \g_edu_footer_bool
    \pagestyle{empty}
  }
} % \AtBeginDocument

\DeclareDocumentCommand \textsfbf { m } {
  \text{\sffamily\bfseries #1}
}

\DeclareDocumentCommand \cemph { m } {
  \textcolor{\g_edu_cemphfg_tl}{#1}
}

\DeclareDocumentCommand \csfemph { m } {
  \textcolor{\g_edu_cemphfg_tl}{\sffamily #1}
}

% Create command \ulined working as a underlined switch (ulem)
\useunder{\uline}{\ulined}{}

\DeclareDocumentCommand \textrightarrow { } {$\rightarrow$\xspace}
\DeclareDocumentCommand \textRightarrow { } {$\Rightarrow$\xspace}

\DeclareUnicodeCharacter{20AC}{\euro}

\DeclareExpandableDocumentCommand \headrule { } {
  \midrule[\heavyrulewidth]
}

\sisetup{%
  locale=DE,%
  per-mode=fraction,%
  list-final-separator={ und },%
  list-pair-separator={ und },%
  list-separator={; },%
  range-phrase={ bis }
}

\DeclareSIUnit \scm{\square\centi\metre}
\DeclareSIUnit \sm{\square\metre}
\DeclareSIUnit \skm{\square\kilo\metre}

\DeclareSIUnit \qcm{\square\centi\metre}
\DeclareSIUnit \qm{\square\metre}
\DeclareSIUnit \qkm{\square\kilo\metre}

\DeclareSIUnit \ccm{\cubic\centi\metre}
\DeclareSIUnit \cm{\cubic\metre}
\DeclareSIUnit \ckm{\cubic\kilo\metre}

\DeclareSIUnit \cmps{\centi\metre\per\second}
\DeclareSIUnit \mps{\metre\per\second}
\DeclareSIUnit \kmps{\kilo\metre\per\second}

\DeclareSIUnit \cmph{\centi\metre\per\hour}
\DeclareSIUnit \mph{\metre\per\hour}
\DeclareSIUnit \kmph{\kilo\metre\per\hour}

\DeclareDocumentCommand \dh { } {d.\,h.\xspace}
\DeclareDocumentCommand \Dh { } {D.\,h.\xspace}
\DeclareDocumentCommand \luv { } {l.\,u.\,v.\xspace}
\DeclareDocumentCommand \Luv { } {L.\,u.\,v.\xspace}
\DeclareDocumentCommand \so { } {s.\,o.\xspace}
\DeclareDocumentCommand \So { } {S.\,o.\xspace}
\DeclareDocumentCommand \su { } {s.\,u.\xspace}
\DeclareDocumentCommand \Su { } {S.\,u.\xspace}
\DeclareDocumentCommand \ua { } {u.\,a.\xspace}
\DeclareDocumentCommand \Ua { } {U.\,a.\xspace}
\DeclareDocumentCommand \uU { } {u.\,U.\xspace}
\DeclareDocumentCommand \UU { } {U.\,U.\xspace}
\DeclareDocumentCommand \zB { } {z.\,B.\xspace}
\DeclareDocumentCommand \ZB { } {Z.\,B.\xspace}

\DeclareDocumentCommand \see { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seea { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seeappendixlabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seee { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seeexerciselabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seef { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seefigurelabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seel { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seelistinglabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seer { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \sees { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seesectionlabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}

\DeclareDocumentCommand \seesol { m } {%
  \g_edu_seeleft_tl%
  \g_edu_seelabel_tl\g_edu_seelabelsep_tl%
  \g_edu_seesolutionlabel_tl\g_edu_seerefsep_tl\ref{#1}%
  \g_edu_seeright_tl%
}


\DeclareDocumentCommand \pg { m } {
  \tl_if_empty:nF {#1} {
    \g_edu_pglabel_tl\,#1\xspace
  }
}


\DeclareDocumentCommand \no { m } {
  \tl_if_empty:nF {#1} {
    \g_edu_nolabel_tl\,#1\xspace
  }
}


\DeclareDocumentCommand \pgno { m m } {
  \g_edu_pglabel_tl\,#1,\xspace
  \g_edu_nolabel_tl\,#2\xspace
}

\DeclareDocumentCommand \pto {  } {%
\vfill
\par
\setlength{\parfillskip}{0pt}
\hfill\fbox{\g_edu_ptolabelstyle_tl \g_edu_ptolabel_tl \g_ptosymbolstyle_tl \g_ptosymbol_tl}
\par
\setlength{\parfillskip}{1em plus 1fil}
}

\cs_new:Npn \__edu_ccScale:n #1 {
  \scalebox{\fp_use:N \g_edu_ccscale_fp}{#1}
}

\cs_new_eq:NN \__edu_ccLogo \ccLogo
\cs_new_eq:NN \__edu_ccAttribution \ccAttribution
\cs_new_eq:NN \__edu_ccShareAlike \ccShareAlike
\cs_new_eq:NN \__edu_ccNoDerivatives \ccNoDerivatives
\cs_new_eq:NN \__edu_ccNonCommercial \ccNonCommercial
\cs_new_eq:NN \__edu_ccNonCommercialEU \ccNonCommercialEU
\cs_new_eq:NN \__edu_ccNonCommercialJP \ccNonCommercialJP
\cs_new_eq:NN \__edu_ccZero \ccZero
\cs_new_eq:NN \__edu_ccPublicDomain \ccPublicDomain
\cs_new_eq:NN \__edu_ccSampling \ccSampling
\cs_new_eq:NN \__edu_ccShare \ccShare
\cs_new_eq:NN \__edu_ccRemix \ccRemix
\cs_new_eq:NN \__edu_ccCopy \ccCopy

\cs_new_eq:NN \__edu_ccby \ccby
\cs_new_eq:NN \__edu_ccbysa \ccbysa
\cs_new_eq:NN \__edu_ccbynd \ccbynd
\cs_new_eq:NN \__edu_ccbync \ccbync
\cs_new_eq:NN \__edu_ccbynceu \ccbynceu
\cs_new_eq:NN \__edu_ccbyncjp \ccbyncjp
\cs_new_eq:NN \__edu_ccbyncsa \ccbyncsa
\cs_new_eq:NN \__edu_ccbyncsaeu \ccbyncsaeu
\cs_new_eq:NN \__edu_ccbyncsajp \ccbyncsajp
\cs_new_eq:NN \__edu_ccbyncnd \ccbyncnd
\cs_new_eq:NN \__edu_ccbyncndeu \ccbyncndeu
\cs_new_eq:NN \__edu_ccbyncndjp \ccbyncndjp
\cs_new_eq:NN \__edu_cczero \cczero
\cs_new_eq:NN \__edu_ccpd \ccpd

\DeclareDocumentCommand \ccLogo { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccLogo}
  }{
    \__edu_ccLogo
  }
}

\DeclareDocumentCommand \ccAttribution { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccAttribution}
  }{
    \__edu_ccAttribution
  }
}

\DeclareDocumentCommand \ccShareAlike { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccShareAlike}
  }{
    \__edu_ccShareAlike
  }
}

\DeclareDocumentCommand \ccNoDerivatives { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccNoDerivatives}
  }{
    \__edu_ccNoDerivatives
  }
}

\DeclareDocumentCommand \ccNonCommercial { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccNonCommercial}
  }{
    \__edu_ccNonCommercial
  }
}

\DeclareDocumentCommand \ccNonCommercialEU { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccNonCommercialEU}
  }{
    \__edu_ccNonCommercialEU
  }
}

\DeclareDocumentCommand \ccNonCommercialJP { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccNonCommercialJP}
  }{
    \__edu_ccNonCommercialJP
  }
}

\DeclareDocumentCommand \ccZero { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccZero}
  }{
    \__edu_ccZero
  }
}

\DeclareDocumentCommand \ccPublicDomain { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccPublicDomain}
  }{
    \__edu_ccPublicDomain
  }
}

\DeclareDocumentCommand \ccSampling { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccSampling}
  }{
    \__edu_ccSampling
  }
}

\DeclareDocumentCommand \ccShare { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccShare}
  }{
    \__edu_ccShare
  }
}

\DeclareDocumentCommand \ccRemix { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccRemix}
  }{
    \__edu_ccRemix
  }
}

\DeclareDocumentCommand \ccCopy { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccCopy}
  }{
    \__edu_ccCopy
  }
}

\DeclareDocumentCommand \ccby { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccby}
  }{
    \__edu_ccby
  }
}

\DeclareDocumentCommand \ccbysa { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbysa}
  }{
    \__edu_ccbysa
  }
}

\DeclareDocumentCommand \ccbynd { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbynd}
  }{
    \__edu_ccbynd
  }
}

\DeclareDocumentCommand \ccbync { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbync}
  }{
    \__edu_ccbync
  }
}

\DeclareDocumentCommand \ccbynceu { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbynceu}
  }{
    \__edu_ccbynceu
  }
}

\DeclareDocumentCommand \ccbyncjp { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncjp}
  }{
    \__edu_ccbyncjp
  }
}

\DeclareDocumentCommand \ccbyncsa { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncsa}
  }{
    \__edu_ccbyncsa
  }
}

\DeclareDocumentCommand \ccbyncsaeu { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncsaeu}
  }{
    \__edu_ccbyncsaeu
  }
}

\DeclareDocumentCommand \ccbyncsajp { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncsajp}
  }{
    \__edu_ccbyncsajp
  }
}

\DeclareDocumentCommand \ccbyncnd { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncnd}
  }{
    \__edu_ccbyncnd
  }
}

\DeclareDocumentCommand \ccbyncndeu { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncndeu}
  }{
    \__edu_ccbyncndeu
  }
}

\DeclareDocumentCommand \ccbyncndjp { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccbyncndjp}
  }{
    \__edu_ccbyncndjp
  }
}

\DeclareDocumentCommand \cczero { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_cczero}
  }{
    \__edu_cczero
  }
}

\DeclareDocumentCommand \ccpd { s } {
  \IfBooleanTF {#1} {
    \__edu_ccScale:n{\__edu_ccpd}
  }{
    \__edu_ccpd
  }
}

\ExplSyntaxOff % Important! TikZ has problems with expl3. Use \@usetl instead.
\DeclareDocumentCommand \action { } {%
  \raisebox{0.5ex}{%
    \resizebox{1em}{!}{%
      \tikz \draw[\@usetl{edu}{actionfg}{tl}, ->, line width=2.5pt] (0,0) .. controls (0.1, 0.1) ..  (0.5,0);%
    }%
  }\xspace%
}

\DeclareDocumentCommand \speech { }{%
  \raisebox{0.5ex}{%
    \resizebox{1em}{\heightof{L}}{%
      \tikz \node[\@usetl{edu}{speechfg}{tl}, draw, fill, ellipse callout, callout relative pointer={(0.25,-0.25)}, callout pointer arc=40, xscale=-1] {\phantom{aa}};%
    }%
  }\xspace%
}

\ExplSyntaxOn

\definecolor{wuDarkRed}{HTML}{910000}
\definecolor{wuSemiDarkRed}{HTML}{a00000}
\definecolor{wuRed}{HTML}{F22222}

\definecolor{wuDarkerGray}{RGB}{75, 75, 75}
\definecolor{wuDarkGray}{RGB}{160, 160, 160}
\definecolor{wuGray}{RGB}{210, 210, 210}
\definecolor{wuLightGray}{RGB}{227, 227, 227}
\definecolor{wuLighterGray}{RGB}{235, 235, 235}

\definecolor{wuBlue}{HTML}{3851FF}
\definecolor{wuGreen}{HTML}{009E0A}
\definecolor{wuOrange}{HTML}{FF8D29}
\definecolor{wuPink}{HTML}{FF5BF8}
\definecolor{wuViolet}{HTML}{9F32CC}
\definecolor{wuTurquoise}{HTML}{3E9DA6}
\definecolor{wuBrown}{HTML}{885704}

\AtBeginDocument{
  \graphicspath{\g_edu_graphicspath_tl}
}

\DeclareDocumentCommand \includegraphicsc { o m } {
  \group_begin:
    \centering \includegraphics[#1]{#2}
    \par
  \group_end:
}

\ExplSyntaxOff  % Important! \usetikzlibrary doesn't work within \ExplSyntax*.
\usetikzlibrary{angles}
\usetikzlibrary{calc}
\usetikzlibrary{fadings}
\usetikzlibrary{patterns}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.callouts}

\tikzset{>=stealth}
\tikzset{font=\small}
\tikzset{execute at end picture={\renewcommand{\tikzScale}{1.0}}}

\pdfpageattr{/Group << /S /Transparency /I true /CS /DeviceRGB>>}

\ExplSyntaxOn

% TODO: pgfplots?
\fp_new:N \g_edu_tikzscale_fp
\fp_gset:Nn \g_edu_tikzscale_fp {1}

\DeclareDocumentCommand \tikzXStart { } {-3}
\DeclareDocumentCommand \tikzXEnd { } {3}
\DeclareDocumentCommand \tikzYStart { } {-3}
\DeclareDocumentCommand \tikzYEnd { } {3}

\DeclareDocumentCommand \tikzscale { m } {
  \fp_gset:Nn \g_edu_tikzscale_fp {#1}
}

\DeclareExpandableDocumentCommand \tikzscalefactor { } {
  \fp_use:N \g_edu_tikzscale_fp
}

\DeclareDocumentCommand \tikzinput { s O{1.0} m } {%
  \fp_gset:Nn \g_edu_tikzscale_fp {#2}%
  \IfBooleanT {#1} {
    \begin{center}
  }
  \input{\g_edu_tikzpath_tl#3}%
  \IfBooleanT {#1} {
    \end{center}
  }
  \fp_set:Nn \g_edu_tikzscale_fp {1.0}%
}

\tikzset{cross/.style={cross out, draw=black, fill=none, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt}, cross/.default={2pt}}

\DeclareDocumentCommand{\pdfgrid} { s o m O{0.445\linewidth} } {
  \IfBooleanTF {#1} {
    \edu_create_grid_exclude:nnn {#2} {#3} {#4}
  }{
    % \edu_create_grid_include only works, if #2 is not empty
    % Otherwise, \edu_create_grid_exclude works
    \IfNoValueTF {#2} {
      \edu_create_grid_exclude:nnn {#2} {#3} {#4}
    }{
      \edu_create_grid_include:nnn {#2} {#3} {#4}
    }
  }
}

\int_new:N \l_edu_loop_count_int
\int_set:Nn \l_edu_loop_count_int {1}

\int_new:N \l_edu_break_count_int
\int_set:Nn \l_edu_break_count_int {1}

\cs_new_protected:Npn \edu_create_grid_include:nnn #1 #2 #3 {

  \setlength{\parfillskip}{0em}
\par
  \vspace{0.25\baselineskip}
  \int_set:Nn \l_edu_loop_count_int {1}
  \int_set:Nn \l_edu_break_count_int {1}

  \pdfximage{\g_edu_graphicspath_tl#2}

  \prg_replicate:nn {\the\pdflastximagepages} {
      \clist_if_in:nVT {#1} {\int_use:N \l_edu_loop_count_int} {
        \frame{\includegraphics[width=#3, page=\tl_use:N \l_edu_loop_count_int]{#2}}
        \int_if_odd:nTF {\l_edu_break_count_int} {
            \hfill
          }{
            \par
            \bigskip
            \noindent
          }
          \int_incr:N \l_edu_break_count_int
      }
      \int_incr:N \l_edu_loop_count_int
  }
  \par
\setlength{\parfillskip}{1em plus 1fil}
}

\cs_new_protected:Npn \edu_create_grid_exclude:nnn #1 #2 #3 {

  \setlength{\parfillskip}{0em}
\par
  \vspace{0.25\baselineskip}
  \int_set:Nn \l_edu_loop_count_int {1}
  \int_set:Nn \l_edu_break_count_int {1}

  \pdfximage{\g_edu_graphicspath_tl#2}

  \prg_replicate:nn {\the\pdflastximagepages} {
      \clist_if_in:nVF {#1} {\int_use:N \l_edu_loop_count_int} {
        \frame{\includegraphics[width=#3, page=\tl_use:N \l_edu_loop_count_int]{#2}}
        \int_if_odd:nTF {\l_edu_break_count_int} {
            \hfill
          }{
            \par
            \bigskip
            \noindent
          }
          \int_incr:N \l_edu_break_count_int
      }
      \int_incr:N \l_edu_loop_count_int
  }
  \par
\setlength{\parfillskip}{1em plus 1fil}
}

\definecolor{marioBrown}{HTML}{8F581F}

\definecolor{marioBlue1}{HTML}{002F5F}
\definecolor{marioBlue2}{HTML}{004994}
\definecolor{marioBlue3}{HTML}{0068D2}

\definecolor{marioRed1}{HTML}{4C040B}
\definecolor{marioRed2}{HTML}{9E0918}
\definecolor{marioRed3}{HTML}{FF0E26}

\definecolor{marioSkin}{HTML}{FFD0C0}

\cs_new:Npn \edu_mariovictory_pixel: {
\filldraw[marioRed1] (7, 27) rectangle ++(1, 1);
\filldraw[marioRed1] (8, 27) rectangle ++(1, 1);
\filldraw[marioRed1] (9, 27) rectangle ++(1, 1);
\filldraw[marioRed1] (10, 27) rectangle ++(1, 1);

\filldraw[black]   (1, 26) rectangle ++(1, 1);
\filldraw[black]   (2, 26) rectangle ++(1, 1);
\filldraw[black]   (4, 26) rectangle ++(1, 1);
\filldraw[black]   (5, 26) rectangle ++(1, 1);
\filldraw[marioRed1]   (6, 26) rectangle ++(1, 1);
\filldraw[marioRed3]   (7, 26) rectangle ++(1, 1);
\filldraw[marioRed3]   (8, 26) rectangle ++(1, 1);
\filldraw[marioRed3] (9, 26) rectangle ++(1, 1);
\filldraw[marioRed3] (10, 26) rectangle ++(1, 1);
\filldraw[marioRed1] (11, 26) rectangle ++(1, 1);
\filldraw[marioRed1] (12, 26) rectangle ++(1, 1);

\filldraw[black]   (1, 25) rectangle ++(1, 1);
\filldraw[white]   (2, 25) rectangle ++(1, 1);
\filldraw[black]   (3, 25) rectangle ++(1, 1);
\filldraw[white]   (4, 25) rectangle ++(1, 1);
\filldraw[black]   (5, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (6, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (7, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (8, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (9, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (10, 25) rectangle ++(1, 1);
\filldraw[marioRed3] (11, 25) rectangle ++(1, 1);
\filldraw[marioRed2] (12, 25) rectangle ++(1, 1);
\filldraw[marioRed1] (13, 25) rectangle ++(1, 1);

\filldraw[black]   (2, 24) rectangle ++(1, 1);
\filldraw[white]   (3, 24) rectangle ++(1, 1);
\filldraw[white]   (4, 24) rectangle ++(1, 1);
\filldraw[black]   (5, 24) rectangle ++(1, 1);
\filldraw[black]   (6, 24) rectangle ++(1, 1);
\filldraw[black]   (7, 24) rectangle ++(1, 1);
\filldraw[black]   (8, 24) rectangle ++(1, 1);
\filldraw[black]   (9, 24) rectangle ++(1, 1);
\filldraw[black]   (10, 24) rectangle ++(1, 1);
\filldraw[black]    (11, 24) rectangle ++(1, 1);
\filldraw[marioRed3] (12, 24) rectangle ++(1, 1);
\filldraw[marioRed2] (13, 24) rectangle ++(1, 1);
\filldraw[marioRed1] (14, 24) rectangle ++(1, 1);

\filldraw[black]    (1, 23) rectangle ++(1, 1);
\filldraw[black]    (2, 23) rectangle ++(1, 1);
\filldraw[black]    (3, 23) rectangle ++(1, 1);
\filldraw[white]    (4, 23) rectangle ++(1, 1);
\filldraw[black]    (5, 23) rectangle ++(1, 1);
\filldraw[black]    (6, 23) rectangle ++(1, 1);
\filldraw[black]    (7, 23) rectangle ++(1, 1);
\filldraw[black]    (8, 23) rectangle ++(1, 1);
\filldraw[black]    (9, 23) rectangle ++(1, 1);
\filldraw[black]    (10, 23) rectangle ++(1, 1);
\filldraw[black]    (11, 23) rectangle ++(1, 1);
\filldraw[black]    (12, 23) rectangle ++(1, 1);
\filldraw[marioRed2] (13, 23) rectangle ++(1, 1);
\filldraw[marioRed1] (14, 23) rectangle ++(1, 1);

\filldraw[black]    (0, 22) rectangle ++(1, 1);
\filldraw[white]    (1, 22) rectangle ++(1, 1);
\filldraw[white]    (2, 22) rectangle ++(1, 1);
\filldraw[black]    (3, 22) rectangle ++(1, 1);
\filldraw[black]    (4, 22) rectangle ++(1, 1);
\filldraw[black]    (5, 22) rectangle ++(1, 1);
\filldraw[black]    (6, 22) rectangle ++(1, 1);
\filldraw[black]    (7, 22) rectangle ++(1, 1);
\filldraw[black]    (8, 22) rectangle ++(1, 1);
\filldraw[black]    (9, 22) rectangle ++(1, 1);
\filldraw[black]    (10, 22) rectangle ++(1, 1);
\filldraw[black]    (11, 22) rectangle ++(1, 1);
\filldraw[black]    (12, 22) rectangle ++(1, 1);
\filldraw[black]    (13, 22) rectangle ++(1, 1);
\filldraw[marioRed1] (14, 22) rectangle ++(1, 1);

\filldraw[black]    (0, 21) rectangle ++(1, 1);
\filldraw[white]    (1, 21) rectangle ++(1, 1);
\filldraw[black]    (2, 21) rectangle ++(1, 1);
\filldraw[white]    (3, 21) rectangle ++(1, 1);
\filldraw[white]    (4, 21) rectangle ++(1, 1);
\filldraw[black]    (5, 21) rectangle ++(1, 1);
\filldraw[white]    (6, 21) rectangle ++(1, 1);
\filldraw[white]    (7, 21) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 21) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 21) rectangle ++(1, 1);
\filldraw[white]    (10, 21) rectangle ++(1, 1);
\filldraw[white]    (11, 21) rectangle ++(1, 1);
\filldraw[black]    (12, 21) rectangle ++(1, 1);
\filldraw[black]    (13, 21) rectangle ++(1, 1);
\filldraw[marioRed1] (14, 21) rectangle ++(1, 1);

\filldraw[black]    (0, 20) rectangle ++(1, 1);
\filldraw[black]    (1, 20) rectangle ++(1, 1);
\filldraw[black]    (2, 20) rectangle ++(1, 1);
\filldraw[black]    (3, 20) rectangle ++(1, 1);
\filldraw[white]    (4, 20) rectangle ++(1, 1);
\filldraw[black]    (5, 20) rectangle ++(1, 1);
\filldraw[white]    (6, 20) rectangle ++(1, 1);
\filldraw[black]    (7, 20) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 20) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 20) rectangle ++(1, 1);
\filldraw[black]    (10, 20) rectangle ++(1, 1);
\filldraw[white]   (11, 20) rectangle ++(1, 1);
\filldraw[marioSkin]   (12, 20) rectangle ++(1, 1);
\filldraw[marioSkin]   (13, 20) rectangle ++(1, 1);
\filldraw[black]   (14, 20) rectangle ++(1, 1);
\filldraw[marioSkin] (15, 20) rectangle ++(1, 1);

\filldraw[black]   (0, 19) rectangle ++(1, 1);
\filldraw[white]   (1, 19) rectangle ++(1, 1);
\filldraw[white]   (2, 19) rectangle ++(1, 1);
\filldraw[white]    (3, 19) rectangle ++(1, 1);
\filldraw[white]    (4, 19) rectangle ++(1, 1);
\filldraw[black]    (5, 19) rectangle ++(1, 1);
\filldraw[white]    (6, 19) rectangle ++(1, 1);
\filldraw[black]    (7, 19) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 19) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 19) rectangle ++(1, 1);
\filldraw[black]    (10, 19) rectangle ++(1, 1);
\filldraw[white]    (11, 19) rectangle ++(1, 1);
\filldraw[marioSkin] (12, 19) rectangle ++(1, 1);
\filldraw[marioSkin] (13, 19) rectangle ++(1, 1);
\filldraw[black]   (14, 19) rectangle ++(1, 1);
\filldraw[marioSkin] (15, 19) rectangle ++(1, 1);

\filldraw[marioRed1] (1, 18) rectangle ++(1, 1);
\filldraw[marioRed1] (2, 18) rectangle ++(1, 1);
\filldraw[marioRed1] (3, 18) rectangle ++(1, 1);
\filldraw[marioRed1] (4, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (5, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (6, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (7, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (10, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (11, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (12, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (13, 18) rectangle ++(1, 1);
\filldraw[black]    (14, 18) rectangle ++(1, 1);
\filldraw[marioSkin] (15, 18) rectangle ++(1, 1);

\filldraw[marioRed1]   (1, 17) rectangle ++(1, 1);
\filldraw[marioRed3] (2, 17) rectangle ++(1, 1);
\filldraw[marioRed2] (3, 17) rectangle ++(1, 1);
\filldraw[marioRed1] (4, 17) rectangle ++(1, 1);
\filldraw[black]    (5, 17) rectangle ++(1, 1);
\filldraw[black]    (6, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (7, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (10, 17) rectangle ++(1, 1);
\filldraw[black]    (11, 17) rectangle ++(1, 1);
\filldraw[black]    (12, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (13, 17) rectangle ++(1, 1);
\filldraw[black]    (14, 17) rectangle ++(1, 1);
\filldraw[marioSkin] (15, 17) rectangle ++(1, 1);

\filldraw[marioRed1]   (1, 16) rectangle ++(1, 1);
\filldraw[marioRed3] (2, 16) rectangle ++(1, 1);
\filldraw[marioRed2] (3, 16) rectangle ++(1, 1);
\filldraw[marioRed1] (4, 16) rectangle ++(1, 1);
\filldraw[black]    (5, 16) rectangle ++(1, 1);
\filldraw[black]    (6, 16) rectangle ++(1, 1);
\filldraw[black]    (7, 16) rectangle ++(1, 1);
\filldraw[black]    (8, 16) rectangle ++(1, 1);
\filldraw[black]    (9, 16) rectangle ++(1, 1);
\filldraw[black]    (10, 16) rectangle ++(1, 1);
\filldraw[black]    (11, 16) rectangle ++(1, 1);
\filldraw[black]    (12, 16) rectangle ++(1, 1);
\filldraw[marioSkin] (13, 16) rectangle ++(1, 1);
\filldraw[marioBrown] (14, 16) rectangle ++(1, 1);

\filldraw[marioRed1] (1, 15) rectangle ++(1, 1);
\filldraw[marioRed3] (2, 15) rectangle ++(1, 1);
\filldraw[marioRed2] (3, 15) rectangle ++(1, 1);
\filldraw[marioRed1] (4, 15) rectangle ++(1, 1);
\filldraw[marioSkin] (5, 15) rectangle ++(1, 1);
\filldraw[black]    (6, 15) rectangle ++(1, 1);
\filldraw[black]    (7, 15) rectangle ++(1, 1);
\filldraw[black]    (8, 15) rectangle ++(1, 1);
\filldraw[black]    (9, 15) rectangle ++(1, 1);
\filldraw[black]    (10, 15) rectangle ++(1, 1);
\filldraw[black]    (11, 15) rectangle ++(1, 1);
\filldraw[marioSkin] (12, 15) rectangle ++(1, 1);
\filldraw[marioBrown] (13, 15) rectangle ++(1, 1);

\filldraw[marioRed1] (1, 14) rectangle ++(1, 1);
\filldraw[marioRed3] (2, 14) rectangle ++(1, 1);
\filldraw[marioRed2] (3, 14) rectangle ++(1, 1);
\filldraw[marioRed2] (4, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (5, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (6, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (7, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (8, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (9, 14) rectangle ++(1, 1);
\filldraw[marioSkin] (10, 14) rectangle ++(1, 1);
\filldraw[marioBrown] (11, 14) rectangle ++(1, 1);
\filldraw[marioBrown] (12, 14) rectangle ++(1, 1);

\filldraw[marioRed1] (2, 13) rectangle ++(1, 1);
\filldraw[marioRed3] (3, 13) rectangle ++(1, 1);
\filldraw[marioRed2] (4, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (5, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (6, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (7, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (8, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (9, 13) rectangle ++(1, 1);
\filldraw[marioBrown] (10, 13) rectangle ++(1, 1);
\filldraw[marioRed3] (11, 13) rectangle ++(1, 1);
\filldraw[marioRed1] (12, 13) rectangle ++(1, 1);

\filldraw[marioRed1] (2, 12) rectangle ++(1, 1);
\filldraw[marioRed3] (3, 12) rectangle ++(1, 1);
\filldraw[marioRed3] (4, 12) rectangle ++(1, 1);
\filldraw[marioRed3] (5, 12) rectangle ++(1, 1);
\filldraw[marioBlue2] (6, 12) rectangle ++(1, 1);
\filldraw[marioBlue2] (7, 12) rectangle ++(1, 1);
\filldraw[marioRed2] (8, 12) rectangle ++(1, 1);
\filldraw[marioRed2] (9, 12) rectangle ++(1, 1);
\filldraw[marioBlue2] (10, 12) rectangle ++(1, 1);
\filldraw[marioBlue2] (11, 12) rectangle ++(1, 1);
\filldraw[marioRed3] (12, 12) rectangle ++(1, 1);
\filldraw[marioRed1] (13, 12) rectangle ++(1, 1);

\filldraw[marioRed1] (2, 11) rectangle ++(1, 1);
\filldraw[marioRed2] (3, 11) rectangle ++(1, 1);
\filldraw[marioRed3] (4, 11) rectangle ++(1, 1);
\filldraw[marioRed3] (5, 11) rectangle ++(1, 1);
\filldraw[marioBlue2] (6, 11) rectangle ++(1, 1);
\filldraw[marioBlue3] (7, 11) rectangle ++(1, 1);
\filldraw[marioRed1] (8, 11) rectangle ++(1, 1);
\filldraw[marioRed1] (9, 11) rectangle ++(1, 1);
\filldraw[marioBlue3] (10, 11) rectangle ++(1, 1);
\filldraw[marioBlue2] (11, 11) rectangle ++(1, 1);
\filldraw[marioRed2] (12, 11) rectangle ++(1, 1);
\filldraw[black]   (13, 11) rectangle ++(1, 1);
\filldraw[black]    (14, 11) rectangle ++(1, 1);

\filldraw[marioRed2] (3, 10) rectangle ++(1, 1);
\filldraw[marioBlue1] (4, 10) rectangle ++(1, 1);
\filldraw[marioBlue2] (5, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (6, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (7, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (8, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (9, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (10, 10) rectangle ++(1, 1);
\filldraw[marioBlue3] (11, 10) rectangle ++(1, 1);
\filldraw[marioBlue2] (12, 10) rectangle ++(1, 1);
\filldraw[white]   (13, 10) rectangle ++(1, 1);
\filldraw[white]    (14, 10) rectangle ++(1, 1);
\filldraw[black]    (15, 10) rectangle ++(1, 1);

\filldraw[marioBlue1] (3, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (4, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (5, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (6, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (7, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (8, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (9, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (10, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (11, 9) rectangle ++(1, 1);
\filldraw[marioBlue3] (12, 9) rectangle ++(1, 1);
\filldraw[marioBlue1] (13, 9) rectangle ++(1, 1);
\filldraw[white]    (14, 9) rectangle ++(1, 1);
\filldraw[black]    (15, 9) rectangle ++(1, 1);

\filldraw[marioBlue1] (3, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (4, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (5, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (6, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (7, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (8, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (9, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (10, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (11, 8) rectangle ++(1, 1);
\filldraw[marioBlue3] (12, 8) rectangle ++(1, 1);
\filldraw[marioBlue1] (13, 8) rectangle ++(1, 1);
\filldraw[white]    (14, 8) rectangle ++(1, 1);
\filldraw[black]    (15, 8) rectangle ++(1, 1);

\filldraw[marioBlue1] (3, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (4, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (5, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (6, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (7, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (8, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (9, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (10, 7) rectangle ++(1, 1);
\filldraw[marioBlue3] (11, 7) rectangle ++(1, 1);
\filldraw[marioBlue2] (12, 7) rectangle ++(1, 1);
\filldraw[marioBlue1] (13, 7) rectangle ++(1, 1);
\filldraw[black]    (14, 7) rectangle ++(1, 1);

\filldraw[marioBlue1] (2, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (3, 6) rectangle ++(1, 1);
\filldraw[marioBlue3] (4, 6) rectangle ++(1, 1);
\filldraw[marioBlue3] (5, 6) rectangle ++(1, 1);
\filldraw[marioBlue3] (6, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (7, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (8, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (9, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (10, 6) rectangle ++(1, 1);
\filldraw[marioBlue3] (11, 6) rectangle ++(1, 1);
\filldraw[marioBlue3] (12, 6) rectangle ++(1, 1);
\filldraw[marioBlue2] (13, 6) rectangle ++(1, 1);
\filldraw[marioBlue1] (14, 6) rectangle ++(1, 1);

\filldraw[marioBlue1] (2, 5) rectangle ++(1, 1);
\filldraw[marioBlue2] (3, 5) rectangle ++(1, 1);
\filldraw[marioBlue3] (4, 5) rectangle ++(1, 1);
\filldraw[marioBlue3] (5, 5) rectangle ++(1, 1);
\filldraw[marioBlue2] (6, 5) rectangle ++(1, 1);
\filldraw[marioBlue1] (7, 5) rectangle ++(1, 1);
\filldraw[marioBlue1] (8, 5) rectangle ++(1, 1);
\filldraw[marioBlue1] (9, 5) rectangle ++(1, 1);
\filldraw[marioBlue1] (10, 5) rectangle ++(1, 1);
\filldraw[marioBlue2] (11, 5) rectangle ++(1, 1);
\filldraw[marioBlue3] (12, 5) rectangle ++(1, 1);
\filldraw[marioBlue2] (13, 5) rectangle ++(1, 1);
\filldraw[marioBlue1] (14, 5) rectangle ++(1, 1);

\filldraw[marioBlue1] (2, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (3, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (4, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (5, 4) rectangle ++(1, 1);
\filldraw[marioBlue1] (6, 4) rectangle ++(1, 1);
\filldraw[marioBlue1] (10, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (11, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (12, 4) rectangle ++(1, 1);
\filldraw[marioBlue2] (13, 4) rectangle ++(1, 1);
\filldraw[marioBlue1] (14, 4) rectangle ++(1, 1);

\filldraw[marioBlue1] (2, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (3, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (4, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (5, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (10, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (11, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (12, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (13, 3) rectangle ++(1, 1);
\filldraw[marioBlue1] (14, 3) rectangle ++(1, 1);

\filldraw[black]     (1, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (2, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (3, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (4, 2) rectangle ++(1, 1);
\filldraw[black]     (5, 2) rectangle ++(1, 1);
\filldraw[black]     (10, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (11, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (12, 2) rectangle ++(1, 1);
\filldraw[marioBrown]  (13, 2) rectangle ++(1, 1);
\filldraw[black]     (14, 2) rectangle ++(1, 1);

\filldraw[black]     (0, 1) rectangle ++(1, 1);
\filldraw[marioBrown] (1, 1) rectangle ++(1, 1);
\filldraw[marioBrown] (2, 1) rectangle ++(1, 1);
\filldraw[marioBrown] (3, 1) rectangle ++(1, 1);
\filldraw[marioBrown] (4, 1) rectangle ++(1, 1);
\filldraw[black]     (5, 1) rectangle ++(1, 1);
\filldraw[black]     (10, 1) rectangle ++(1, 1);
\filldraw[marioBrown]  (11, 1) rectangle ++(1, 1);
\filldraw[marioBrown]  (12, 1) rectangle ++(1, 1);
\filldraw[marioBrown]  (13, 1) rectangle ++(1, 1);
\filldraw[marioBrown]  (14, 1) rectangle ++(1, 1);
\filldraw[black]     (15, 1) rectangle ++(1, 1);

\filldraw[black] (0, 0) rectangle ++(1, 1);
\filldraw[black] (1, 0) rectangle ++(1, 1);
\filldraw[black] (2, 0) rectangle ++(1, 1);
\filldraw[black] (3, 0) rectangle ++(1, 1);
\filldraw[black] (4, 0) rectangle ++(1, 1);
\filldraw[black] (5, 0) rectangle ++(1, 1);
\filldraw[black] (10, 0) rectangle ++(1, 1);
\filldraw[black] (11, 0) rectangle ++(1, 1);
\filldraw[black] (12, 0) rectangle ++(1, 1);
\filldraw[black] (13, 0) rectangle ++(1, 1);
\filldraw[black] (14, 0) rectangle ++(1, 1);
\filldraw[black] (15, 0) rectangle ++(1, 1);
}

\DeclareDocumentCommand \mariovictory { O{} O{\fp_use:N \g_edu_examtitlegraphicsscale_fp} } {
  \tikz[scale=#2] {

    \setlength{\baselineskip}{2.5ex}

    \draw (19, 13) node[anchor=west, align=left, font=\bfseries\ttfamily, scale=1.2, inner~sep=0pt] {#1};

    \edu_mariovictory_pixel:
  }
}

\DeclareDocumentCommand  \edusetup { m } {
  \keys_set:nn {edu} {#1}
}

\DeclareDocumentCommand  \eduoption { m m } {
  \keys_set:nn {edu} {#1=#2}
}

\newcounter{exercisecounter}
\newcounter{subexercisecounter}[exercisecounter]
\newcounter{multiexecounter}

\renewcommand{\thesubexercisecounter}{\theexercisecounter.\arabic{subexercisecounter}}

\tl_new:N \l__edu_exepoints_tl        % For optional number points
\tl_new:N \l__edu_exelabeltext_tl     % Concatenation of the exercise-label
\tl_new:N \l__edu_subexelabeltext_tl  % Concatenation of the subexercise-label

\newcounter{solutioncounter}
\newcounter{subsolutioncounter}[solutioncounter]
\newcounter{multisolcounter}

\renewcommand{\thesubsolutioncounter}{\thesolutioncounter.\arabic{subsolutioncounter}}

\tl_new:N \l__edu_sollabeltext_tl     % Concatenation of the exercise-label
\tl_new:N \l__edu_subsollabeltext_tl  % Concatenation of the subexercise-label

\DeclareDocumentCommand \rstexe { } {\setcounter{exercisecounter}{0}}
\DeclareDocumentCommand \rstsubexe { } {\setcounter{subexercisecounter}{0}}
\DeclareDocumentCommand \rstmultiexe { } {\setcounter{multiexecounter}{0}}

\DeclareDocumentCommand \exe { s o m o }{
  \refstepcounter{exercisecounter}

  \tl_clear:N \l__edu_exelabeltext_tl

  \IfNoValueTF {#2} {
    \tl_clear:N \l__edu_exepoints_tl
  }{
    \bool_if:NTF \g_edu_exepointsachieved_bool {
    \tl_set:Nn \l__edu_exepoints_tl {
      \g_edu_exepointsleft_tl
        \hspace{\g_edu_exepointsachievedspace_dim}
        \g_edu_exepointsachievedsep_tl
        #2\g_edu_exepointslabel_tl
      \g_edu_exepointsright_tl
    }
  }{
      \tl_set:Nn \l__edu_exepoints_tl {
      \g_edu_exepointsleft_tl
        #2\g_edu_exepointslabel_tl
      \g_edu_exepointsright_tl
    }
  }
  }

  \tl_if_empty:nTF {#3} {
    \tl_if_empty:NTF \g_edu_exelabel_tl {
      \tl_clear:N \l__edu_exelabeltext_tl
    }{
      \tl_set:Nn \l__edu_exelabeltext_tl {
        \hspace{0.1em}\g_edu_exelabel_tl
      }
    }
  }{
    \tl_if_empty:NTF \g_edu_exelabel_tl {
      \tl_set:Nn \l__edu_exelabeltext_tl {
        \hspace{0.3em}
      }
    }{
      \tl_set:Nn \l__edu_exelabeltext_tl {
        \hspace{0.1em}\g_edu_exelabel_tl{:}\hspace{0.3em}
      }
    }
  }

  \setlength{\parfillskip}{0em} % Damit Punktzahl bei parkip wirklich rechtsbündig ist. Sonst rechts Abstand in letzter (einziger) Zeile.
  \vspace{\g_edu_exebeforeskip_dim}%
  \parskipreduce%
  {
    \g_edu_exelabelstyle_tl%
    \IfNoValueF {#4} {
      \hspace*{-3em}
      \makebox[2.5em][r]{
        \tl_if_in:nnT {#4} {c} {
          \color{\g_edu_execalcfg_tl}
          \raisebox{0.15ex}{\scalebox{0.7}{\faCalculator}}
        }
        \tl_if_in:nnT {#4} {e} {
          \hspace{0.25em}
          \raisebox{-0.05ex}{
          \resizebox{!}{0.6\baselineskip}{
            \tikz{
              \draw[line~width=1ex, \@usetl{edu}{exedifffg}{tl}] (0, 0) rectangle (1, 1);
            }
          }
          }
        }
        \tl_if_in:nnT {#4} {m} {
          \hspace{0.25em}
          \raisebox{-0.05ex}{
          \resizebox{!}{0.6\baselineskip}{
            \tikz{
              \fill[\@usetl{edu}{exedifffg}{tl}] (0, 0) rectangle (1, 0.5);
              \draw[line~width=1ex, \@usetl{edu}{exedifffg}{tl}] (0, 0) rectangle (1, 1);
            }
          }
          }
        }
        \tl_if_in:nnT {#4} {h} {
          \hspace{0.25em}
          \raisebox{-0.05ex}{
          \resizebox{!}{0.6\baselineskip}{
            \tikz{
              \fill[\@usetl{edu}{exedifffg}{tl}] (0, 0) rectangle (1, 1);
              \draw[line~width=1ex, \@usetl{edu}{exedifffg}{tl}] (0, 0) rectangle (1, 1);
            }
          }
          }
        }
      }
      \hspace{0.5em}
    }
    \setlength{\fboxsep}{0.125em}%
    \raisebox{0.2ex}{%
      \colorbox{\g_edu_exenumberbg_tl}{%
        \textcolor{\g_edu_exenumberfg_tl}{%
          \g_edu_exenumberstyle_tl\theexercisecounter\g_edu_exenumberseparator_tl%
          \IfBooleanT{#1} {
          \raisebox{0.15ex}{%
            $\star$
          }
          }
        }%
      }%
    }%
    \hspace{0.1em}%
    \colorbox{\g_edu_exelabelbg_tl}{%
      \textcolor{\g_edu_exelabelfg_tl}{\l__edu_exelabeltext_tl}%
    }%
  }%
  {
    \colorbox{\g_edu_exebg_tl}{%
      \textcolor{\g_edu_exefg_tl}{\g_edu_exestyle_tl #3}%
    }%
  }%
  \hfill%
  {\g_edu_exepointsstyle_tl%
    \textcolor{\g_edu_exepointsfg_tl}{%
      \l__edu_exepoints_tl%
    }%
  }%
  \nopagebreak\@afterheading%
  \vspace{\g_edu_exeafterskip_dim}%
  \parskipreduce%
  \par % Wichtig, damit \setlength{\parfillskip}{0em} wirkt (s. o.).
  \setlength{\parfillskip}{1em plus 1fil}

  \bool_if:NT \g_edu_exetoc_bool {
  \addcontentsline{toc}{section}{\theexercisecounter\g_edu_exenumberseparator_tl~\l__edu_exelabeltext_tl #3}
  }

  \setcounter{subexercisecounter}{0}
  \setcounter{multiexecounter}{0}
  \setcounter{question}{0}
}

\DeclareDocumentCommand \subexe { s o m }{
  \refstepcounter{subexercisecounter}

  \tl_clear:N \l__edu_subexelabeltext_tl

  \IfNoValueTF {#2} {
    \tl_clear:N \l__edu_exepoints_tl
  }{
    \bool_if:NTF \g_edu_subexepointsachieved_bool {
    \tl_set:Nn \l__edu_exepoints_tl {
      \g_edu_subexepointsleft_tl
        \hspace{\g_edu_subexepointsachievedspace_dim}
        \g_edu_subexepointsachievedsep_tl
        #2\g_edu_subexepointslabel_tl
      \g_edu_subexepointsright_tl
    }
  }{
      \tl_set:Nn \l__edu_exepoints_tl {
      \g_edu_subexepointsleft_tl
        #2\g_edu_subexepointslabel_tl
      \g_edu_subexepointsright_tl
    }
  }
  }

  \tl_if_empty:nTF {#3} {
    \tl_if_empty:NTF \g_edu_subexelabel_tl {
      \tl_clear:N \l__edu_subexelabeltext_tl
    }{
      \tl_set:Nn \l__edu_subexelabeltext_tl {
        \hspace{0.1em}\g_edu_subexelabel_tl
      }
    }
  }{
    \tl_if_empty:NTF \g_edu_subexelabel_tl {
      \tl_set:Nn \l__edu_subexelabeltext_tl {
        \hspace{0.3em}
      }
    }{
      \tl_set:Nn \l__edu_subexelabeltext_tl {
        \hspace{0.1em}\g_edu_subexelabel_tl{:}\hspace{0.3em}
      }
    }
  }

  \setlength{\parfillskip}{0em}
  \vspace{\g_edu_subexebeforeskip_dim}%
  \parskipreduce%
  {\g_edu_subexelabelstyle_tl%
    \setlength{\fboxsep}{0.125em}
    \raisebox{0.2ex}{%
      \colorbox{\g_edu_subexenumberbg_tl}{%
        \textcolor{\g_edu_subexenumberfg_tl}{%
          \g_edu_subexenumberstyle_tl%
          \thesubexercisecounter%
          \g_edu_subexenumberseparator_tl%
          \IfBooleanT{#1} {
          \raisebox{0.15ex}{%
            \,$\star$
          }
          }
        }%
      }%
    }%
    \colorbox{\g_edu_subexelabelbg_tl}{%
      \textcolor{\g_edu_subexelabelfg_tl}{\l__edu_subexelabeltext_tl}%
    }%
  }%
  {%
    \colorbox{\g_edu_subexebg_tl}{%
      \textcolor{\g_edu_subexefg_tl}{\g_edu_subexestyle_tl #3}%
    }%
  }%
  \hfill%
  {\g_edu_subexepointsstyle_tl%
    \textcolor{\g_edu_subexepointsfg_tl}{%
      \l__edu_exepoints_tl%
    }%
  }%
  \nopagebreak\@afterheading
  \vspace{\g_edu_subexeafterskip_dim}%
  \parskipreduce%
  \par
  \setlength{\parfillskip}{1em plus 1fil}

  \bool_if:NT \g_edu_exetoc_bool {
  \addcontentsline{toc}{subsection}{\thesubexercisecounter\g_edu_subexenumberseparator_tl~\l__edu_subexelabeltext_tl #3}
  }

  \setcounter{multiexecounter}{0}
  \setcounter{question}{0}
}

\DeclareDocumentCommand \sol { m }{
  \refstepcounter{solutioncounter}

  \tl_clear:N \l__edu_sollabeltext_tl

  \tl_if_empty:nTF {#1} {
    \tl_if_empty:NTF \g_edu_sollabel_tl {
      \tl_clear:N \l__edu_sollabeltext_tl
    }{
      \tl_set:Nn \l__edu_sollabeltext_tl {
        \hspace{0.1em}\g_edu_sollabel_tl
      }
    }
  }{
    \tl_if_empty:NTF \g_edu_sollabel_tl {
      \tl_set:Nn \l__edu_sollabeltext_tl {
        \hspace{0.3em}
      }
    }{
      \tl_set:Nn \l__edu_sollabeltext_tl {
        \hspace{0.1em}\g_edu_sollabel_tl{:}\hspace{0.3em}
      }
    }
  }

  \setlength{\parfillskip}{0em}
  \vspace{\g_edu_solbeforeskip_dim}%
  \parskipreduce%
  {\g_edu_sollabelstyle_tl%
    \setlength{\fboxsep}{0.125em}%
    \raisebox{0.2ex}{%
      \colorbox{\g_edu_solnumberbg_tl}{%
        \textcolor{\g_edu_solnumberfg_tl}{%
          \g_edu_solnumberstyle_tl\thesolutioncounter\g_edu_solnumberseparator_tl%
        }%
      }%
    }%
    \hspace{0.1em}%
    \colorbox{\g_edu_sollabelbg_tl}{%
      \textcolor{\g_edu_sollabelfg_tl}{\l__edu_sollabeltext_tl}%
    }%
  }%
  {%
    \colorbox{\g_edu_solbg_tl}{%
      \textcolor{\g_edu_solfg_tl}{\g_edu_solstyle_tl #1}%
    }%
  }%
  \nopagebreak\@afterheading
  \vspace{\g_edu_solafterskip_dim}%
  \parskipreduce%
  \par
  \setlength{\parfillskip}{1em plus 1fil}

  \bool_if:NT \g_edu_exetoc_bool {
  \addcontentsline{toc}{section}{\thesolutioncounter\g_edu_solnumberseparator_tl~\l__edu_sollabeltext_tl #1}
  }

  \setcounter{subsolutioncounter}{0}
  \setcounter{multiexecounter}{0}
}

\DeclareDocumentCommand \subsol { m }{
  \refstepcounter{subsolutioncounter}

  \tl_clear:N \l__edu_subsollabeltext_tl

  \tl_if_empty:nTF {#1} {
    \tl_if_empty:NTF \g_edu_subsollabel_tl {
      \tl_clear:N \l__edu_subsollabeltext_tl
    }{
      \tl_set:Nn \l__edu_subsollabeltext_tl {
        \hspace{0.1em}\g_edu_subsollabel_tl
      }
    }
  }{
    \tl_if_empty:NTF \g_edu_subsollabel_tl {
      \tl_set:Nn \l__edu_subsollabeltext_tl {
        \hspace{0.3em}
      }
    }{
      \tl_set:Nn \l__edu_subsollabeltext_tl {
        \hspace{0.1em}\g_edu_subsollabel_tl{:}\hspace{0.3em}
      }
    }
  }

  \setlength{\parfillskip}{0em}
  \vspace{\g_edu_subsolbeforeskip_dim}%
  \parskipreduce%
  {\g_edu_subsollabelstyle_tl%
    \setlength{\fboxsep}{0.125em}
    \raisebox{0.2ex}{%
      \colorbox{\g_edu_subsolnumberbg_tl}{%
        \textcolor{\g_edu_subsolnumberfg_tl}{%
          \g_edu_subsolnumberstyle_tl%
          \thesubsolutioncounter%
          \g_edu_subsolnumberseparator_tl%
        }%
      }%
    }%
    \colorbox{\g_edu_subsollabelbg_tl}{%
      \textcolor{\g_edu_subsollabelfg_tl}{\l__edu_subsollabeltext_tl}%
    }%
  }%
  {%
    \colorbox{\g_edu_subsolbg_tl}{%
      \textcolor{\g_edu_subsolfg_tl}{\g_edu_subsolstyle_tl #1}%
    }%
  }%
  \nopagebreak\@afterheading
  \vspace{\g_edu_subsolafterskip_dim}%
  \parskipreduce%
  \par
  \setlength{\parfillskip}{1em plus 1fil}

  \bool_if:NT \g_edu_exetoc_bool {
  \addcontentsline{toc}{subsection}{\thesolutioncounter.\thesubsolutioncounter\g_edu_subsolnumberseparator_tl~\l__edu_subsollabeltext_tl #1}
  }

  \setcounter{multiexecounter}{0}
}

\DeclareDocumentCommand \multiexelabel { s } {%
  \stepcounter{multiexecounter}%
  {\g_edu_multiexenumberstyle_tl%
    \textcolor{\g_edu_multiexenumberfg_tl}{%
      \IfBooleanT{#1} {
        \raisebox{0.1ex} {
          {\footnotesize$\star$}\hspace{0.75pt}
        }
      }
      \g_edu_multiexenumberleft_tl\alph{multiexecounter}\g_edu_multiexenumberright_tl%
    }%
  }
}

\DeclareDocumentCommand \multiexelabelboxed { s } {%
  \stepcounter{multiexecounter}%    War \refstepcounter. Dies erzeugt vertikalen Abstand.
  \setlength{\fboxsep}{0pt}%
  \makebox[\g__edu_listlabelwidth_dim][r]{%
    \g_edu_multiexenumberstyle_tl%
    \textcolor{\g_edu_multiexenumberfg_tl}{%
      \IfBooleanT{#1} {
        \raisebox{0.1ex} {
          {\footnotesize$\star$}\hspace{0.75pt}
        }
      }
      \g_edu_multiexenumberleft_tl\alph{multiexecounter}
      \g_edu_multiexenumberright_tl
    }%
  }%
}

\let\itemorig\item

\DeclareDocumentCommand \item { s } {%
  \IfBooleanTF{#1} {
    \itemorig[\multiexelabelboxed*]
  }{
    \itemorig
  }
}

\DeclareDocumentCommand \multiexe { s } {%
  \IfBooleanTF{#1} {
    \multiexelabel*\xspace
  }{
    \multiexelabel\xspace
  }
}

\DeclareDocumentCommand \points { s m } {%
  \IfBooleanT{#1} {
   \hspace*{0pt}\hfill\hspace{0.5em}%
}
  \nolinebreak%
  \ensuremath{\;
  \text{%
    \g_edu_multiexepointsstyle_tl%
    \color{\g_edu_multiexepointsfg_tl}%
    \g_edu_multiexepointsleft_tl%
      #2\g_edu_multiexepointslabel_tl%
    \g_edu_multiexepointsright_tl%
   }%
   }
}

\DeclareDocumentCommand \res { +O{} +m} {%
  \bool_if:NTF \g_edu_showresults_bool {
    \group_begin:
      \color{\g_edu_resultfg_tl} #2%
    \group_end:
  }{#1}%
  \bool_if:NT \g_edu_resultresetmultiexe_bool {
    \rstmultiexe
  }
}

\DeclareDocumentCommand \resr { O{\g_edu_resultrulelength_dim} m O{\g_edu_resultrulevoffset_dim} } {%
  \bool_if:NTF \g_edu_showresults_bool {%
    \textcolor{\g_edu_resultfg_tl}{#2}%
  }{%
    \rule[-\g_edu_resultrule_dim+#3]{#1}{\g_edu_resultrule_dim}%
  }%
  \bool_if:NT \g_edu_resultresetmultiexe_bool {
    \rstmultiexe
  }
}

\DeclareDocumentCommand \resrfill { m O{\g_edu_resultrulevoffset_dim} } {%
  \bool_if:NTF \g_edu_showresults_bool {%
    \textcolor{\g_edu_resultfg_tl}{#1}%
  }{%
    \leavevmode\leaders\hbox{\rule[-\g_edu_resultrule_dim+#2]{1pt}{\g_edu_resultrule_dim}}\hfill\kern0pt\hspace*{-\parfillskip}
  }%
  \bool_if:NT \g_edu_resultresetmultiexe_bool {
    \rstmultiexe
  }
}

\DeclareDocumentCommand \resb { O{\g_edu_resultboxwidth_dim} O{\g_edu_resultboxheight_dim} m O{\g_edu_resultboxvoffset_dim} } {%
  \bool_if:NTF \g_edu_showresults_bool {%
    \textcolor{\g_edu_resultfg_tl}{#3}%
  }{%
    \tikz[baseline=-#4] \draw (0,0) rectangle (#1, #2);
    \hspace{5pt}
  }%
  \bool_if:NT \g_edu_resultresetmultiexe_bool {
    \rstmultiexe
  }
}

\DeclareDocumentEnvironment {multiexelist} { s O{0.5\baselineskip} } {
  \parskipreduce
  \IfBooleanT {#1} {
    \bool_if:NTF \g_edu_parskip_bool {
      \vspace{0.125\baselineskip}
    }{
      \vspace{-0.375\baselineskip}
    }
  }
  \begin{edulist}[#2]{\multiexelabelboxed}
}{
  \end{edulist}
  \parskipreduce
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {multiexelist*} {\multiexelist*}
\cs_new_eq:cN {endmultiexelist*} \endmultiexelist

\DeclareDocumentEnvironment {multiexelisti} { s } {
  \IfBooleanTF {#1}{
  \begin{edulisti}[%
    label=\multiexelabel,%
    format=\g_edu_multiexenumberstyle_tl,%
    itemjoin={,\ },%
  ]
}{
    \par
    \bool_if:NTF \g_edu_parskip_bool {
      \vspace{-0.25\baselineskip}
    }{
      \vspace{-0.175\baselineskip}
    }
    \begin{center}
  \begin{edulisti}[%
    label=\multiexelabel,%
    format=\g_edu_multiexenumberstyle_tl,%
    afterlabel=\hspace{\g_edu_listarraysep_dim},%
    itemjoin=\qquad,%
  ]
}
}{
  \end{edulisti}
  \IfBooleanF {#1} {
    \end{center}
    \par
    \bool_if:NTF \g_edu_parskip_bool {
      \vspace{-0.25\baselineskip}
    }{
      \vspace{-0.175\baselineskip}
    }
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {multiexelisti*} {\multiexelisti*}
\cs_new_eq:cN {endmultiexelisti*} \endmultiexelisti

\DeclareDocumentEnvironment {multiexearray} { s O{0.25\baselineskip} m } {
  \IfBooleanTF {#1} {
  \arraysetup[#2]{m}
    \noindent\tabularx{\textwidth}{*{#3}{E}}
}{%
  \arraysetup[#2]{}
  \noindent\tabularx{\textwidth}{*{#3}{e}}%
  }
}{
  \endtabularx
  \arraycleanup
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {multiexearray*} {\multiexearray*}
\cs_new_eq:cN {endmultiexearray*} \endmultiexearray

\DeclareExpandableDocumentCommand \bonus { } {
  \bool_gset_true:N \__edu_multiexebonus_bool
}

\DeclareExpandableDocumentCommand \ls { } {\addlinespace[1.5ex]}

\DeclareDocumentCommand \lastexe { s } {
  \int_compare:nNnTF {\value{exercisecounter}} > {0} {
    \addtocounter{exercisecounter}{-1}
    \arabic{exercisecounter}
    \addtocounter{exercisecounter}{1}
  }{
    ??
  }
  \IfBooleanT {#1} {
    \g_edu_exenumberseparator_tl\,\g_edu_exelabel_tl
  }
  \xspace
}

\DeclareDocumentCommand \lastsubexe { s } {
  \IfBooleanT {#1} {
    \g_edu_exelabel_tl\xspace
  }
  \int_compare:nNnTF {\value{subexercisecounter}} > {0} {
    \addtocounter{subexercisecounter}{-1}
    \arabic{exercisecounter}.\arabic{subexercisecounter}
    \addtocounter{subexercisecounter}{1}
  }{
    ??
  }
  \xspace
}

\DeclareDocumentCommand \lastmultiexe { s } {
  \IfBooleanT {#1} {
    \group_begin:
    \g_edu_multiexenumberstyle_tl
    \color{\g_edu_multiexenumberfg_tl}
    \g_edu_multiexenumberleft_tl
  }
  \int_compare:nNnTF {\value{multiexecounter}} > {0} {
  \addtocounter{multiexecounter}{-1}
  \alph{multiexecounter}
  \addtocounter{multiexecounter}{1}
  }{
    ??
  }
  \IfBooleanT {#1} {
    \g_edu_multiexenumberright_tl
    \group_end:
  }
  \xspace
}

\newcounter{question}
\newcounter{@questmccounter}

\dim_new:N \l__edu_questmclabelwidth_dim
\dim_set:Nn \l__edu_questmclabelwidth_dim {0.9em}

\tl_new:N \l__edu_questpoints_tl

\DeclareDocumentCommand \quest { o m } {%

  \refstepcounter{question}

  \tl_set:Nn \l__edu_questpoints_tl {#1}

  \setcounter{@questmccounter}{0}

  \vspace{\g_edu_questbeforeskip_dim}
  {\g_edu_questlabelstyle_tl%
    \textcolor{\g_edu_questlabelfg_tl}{%
      \thequestion.\,\g_edu_questlabel_tl%
    }%
  }%
  \IfNoValueTF {#1} {
    \hspace{\g_edu_questsep_dim}{\g_edu_queststyle_tl #2}
  }{%
    \hspace{\g_edu_questpointssep_dim}%
    {%
      \g_edu_questpointsstyle_tl\g_edu_questpointsleft_tl%
      \l__edu_questpoints_tl\g_edu_questpointslabel_tl%
      \g_edu_questpointsright_tl%
    }%
    \hspace{\g_edu_questsep_dim}{\g_edu_queststyle_tl #2}
  }
  \nopagebreak\@afterheading
  \vspace{\g_edu_questafterskip_dim}
}

\tl_new:N \g__edu_questmclabelboxed_tl
\tl_gset:Nn \g__edu_questmclabelboxed_tl {
  \stepcounter{@questmccounter}%    War \refstepcounter, erzeugt aber vert. Abstand.
  \setlength{\fboxsep}{0pt}%
  \makebox[\g__edu_listlabelwidth_dim][r]{%
    \raisebox{-0.125em}{%
      \color{\g_edu_questmclabelfg_tl}%
      \framebox[\l__edu_questmclabelwidth_dim][c]{%
        \rule{0pt}{\l__edu_questmclabelwidth_dim}%
        \raisebox{0.2em}{\footnotesize\alph{@questmccounter}}%
      }%
    }%
  }%
}

\DeclareDocumentCommand \questblank { O{3cm} } {%
  \vspace{#1}
  \parskipreduce
}

\DeclareDocumentCommand \questtextblank { O{0.75cm} m m } {%
  \par\vspace{1ex}
  \prg_replicate:nn {#2} {
    \par
    \vspace{-\baselineskip}
    \parskipreduce
    \vspace{#1}
    \noindent\rule{#3}{0.4pt}
  }
}

\DeclareDocumentCommand \questtext { O{0.75cm} m } {%
  \questtextblank[#1]{#2}{\linewidth}
}

\DeclareDocumentEnvironment {questmclist} { O{0.5\baselineskip} } {%
  \parskipreduce%
  \vspace{-0.15\baselineskip}%
  \begin{edulist}[#1]{\color{\g_edu_questmclabelfg_tl}$\square$}
}{%
  \end{edulist}
  \parskipreduce
}

\DeclareDocumentEnvironment {questmclistalph} { O{0.5\baselineskip} } {%
  \parskipreduce%
  \vspace{-0.25\baselineskip}%
  \begin{edulist}[#1]{\g__edu_questmclabelboxed_tl}
}{%
  \end{edulist}%
  \parskipreduce
}

\DeclareDocumentEnvironment {questmcarray} { s O{0.25\baselineskip} m } {%
  \IfBooleanTF {#1} {
    \arraysetup[#2]{m}
    \noindent\tabularx{\textwidth}{*{#3}{Q}}%
  }{
    \arraysetup[#2]{}
    \noindent\tabularx{\textwidth}{*{#3}{q}}%
  }
}{%
  \endtabularx
  \arraycleanup
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {questmcarray*} {\questmcarray*}
\cs_new_eq:cN {endquestmcarray*} \endquestmcarray

\DeclareDocumentEnvironment {questmcarrayalph} { s O{0.25\baselineskip} m } {%
  \IfBooleanTF {#1} {
    \arraysetup[#2]{m}
    \noindent\tabularx{\textwidth}{*{#3}{A}}%
  }{
    \arraysetup[#2]{}
    \noindent\tabularx{\textwidth}{*{#3}{a}}%
  }
}{%
  \endtabularx
  \arraycleanup
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {questmcarrayalph*} {\questmcarrayalph*}
\cs_new_eq:cN {endquestmcarrayalph*} \endquestmcarrayalph

\dim_new:N \g__edu_colone_dim
\dim_new:N \g__edu_coltwo_dim

\tl_new:N \g__edu_colalign_tl
\tl_gset:Nn \g__edu_colalign_tl {t}

\setlength{\multicolsep}{0.5\baselineskip}

\DeclareDocumentEnvironment {multicols2r} { } {%
  \begin{multicols}{2}\raggedcolumns
}{%
  \end{multicols}%
}

\DeclareDocumentEnvironment {multicols3r} { } {%
  \begin{multicols}{3}\raggedcolumns
}{%
  \end{multicols}%
}

\DeclareDocumentEnvironment {cols2} { O{0.5\linewidth} } {%
  \par
  \setlength{\parfillskip}{0em}
  \dim_gset:Nn \g__edu_colone_dim {#1 - 0.5\columnsep}
  \dim_gset:Nn \g__edu_coltwo_dim {\linewidth - \g__edu_colone_dim - \columnsep}
%
  \parskipreduce
  \noindent\begin{minipage}[\g__edu_colalign_tl]{\dim_use:N\g__edu_colone_dim}%
  \setpar
  \parskipreduce
}{%
  \end{minipage}%
  \par
  \setlength{\parfillskip}{1em plus 1fil}
  \vspace{1.5\multicolsep}
  \parskipreduce
}

% Declared explicit, because hack doesn't work here. Because of the number?
\DeclareDocumentEnvironment {cols2*} { O{0.5\linewidth} } {%
  \tl_gset:Nn \g__edu_colalign_tl {c}
  \vspace{1.5\multicolsep} % Erhöht, da bei [t] minipage vorher keinen normalen baselineskip hat.
  \begin{cols2}[#1]
}{%
  \end{cols2}%
  \tl_gset:Nn \g__edu_colalign_tl {t}
}

\DeclareDocumentEnvironment {cols} {s O{2} } {%
  \par
  \setlength{\parfillskip}{0em}
%
  % Bei der Berechnung wichtig: Bei Multiplikation einer Länge mit einer
  % Ganzzahl muss zuerst die Länge (hier \columnsep) angegeben werden.
  \dim_gset:Nn \g__edu_colone_dim {(\linewidth - \columnsep * (#2 - 1))/#2}
  \dim_gset_eq:NN \g__edu_coltwo_dim \g__edu_colone_dim
%
  \parskipreduce
  \vspace{-0.15\baselineskip}
  \IfBooleanT {#1} {
    \tl_gset:Nn \g__edu_colalign_tl {c}
    \vspace{1.2\multicolsep} % Erhöht, da bei [t] minipage vorher keinen normalen baselineskip hat.
  }
  \noindent\begin{minipage}[\g__edu_colalign_tl]{\g__edu_colone_dim}%
  \setpar
  \parskipreduce
}{%
  \end{minipage}%
  \par
  \setlength{\parfillskip}{1em plus 1fil}
  \parskipreduce
  \vspace{0.75\baselineskip}
  \IfBooleanT {#1} {
    \tl_gset:Nn \g__edu_colalign_tl {t}
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {cols*} {\cols*}
\cs_new:cpn {endcols*} {\endcols}

\DeclareDocumentCommand \colbreak { } {%
  \end{minipage}\hfill%
  \begin{minipage}[\g__edu_colalign_tl]{\g__edu_coltwo_dim}%
  \setpar
  \parskipreduce
}

\DeclareDocumentCommand \mathreduce { } {%
  \vspace{-\abovedisplayskip}
  \vspace{-0.5\baselineskip}
}


\tl_new:N \g__edu_aligntemp_tl

\DeclareDocumentEnvironment {graphicscol} { s O{0.5\linewidth} m O{width=\linewidth} o O{t} } {%

  \IfValueTF {#5} {
    \tl_gset:Nn \g__edu_aligntemp_tl {#5}
  }{
  \IfBooleanTF {#1} {
    \tl_gset:Nn \g__edu_aligntemp_tl {l}
  }{
    \tl_gset:Nn \g__edu_aligntemp_tl {r}
  }
  }
  \str_if_eq:nnTF {#6} {c} {
    \begin{cols2*}[#2]
  }{
    \begin{cols2}[#2]
  }

  \IfBooleanT {#1} {
    \tl_if_in:NnT \g__edu_aligntemp_tl {r} {
      \hfill
    }
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
     \begin{center}
  }
    \includegraphics[#4]{#3}
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
    \end{center}
  }
    \tl_if_in:NnT \g__edu_aligntemp_tl {l} {
      \hfill
    }
    \colbreak
  }
}{%
  \IfBooleanF {#1} {
    \colbreak
  \tl_if_in:NnT \g__edu_aligntemp_tl {r} {
    \setlength{\parfillskip}{0em}
      \hfill
    }
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
     \begin{center}
  }
    \includegraphics[#4]{#3}
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
    \end{center}
  }
    \tl_if_in:NnT \g__edu_aligntemp_tl {l} {
      \hfill
    }
  }
  \str_if_eq:nnTF {#6} {c} {
    \end{cols2*}
  }{
    \end{cols2}
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {graphicscol*} {\graphicscol*}
\cs_new:cpn {endgraphicscol*} {\endgraphicscol}


\DeclareDocumentEnvironment {tikzcol} { s O{0.5\linewidth} m o O{t}} {%

  \IfValueTF {#4} {
    \tl_gset:Nn \g__edu_aligntemp_tl {#4}
  }{
  \IfBooleanTF {#1} {
    \tl_gset:Nn \g__edu_aligntemp_tl {l}
  }{
    \tl_gset:Nn \g__edu_aligntemp_tl {r}
  }
  }

  \str_if_eq:nnTF {#5} {c} {
    \begin{cols2*}[#2]
  }{
    \begin{cols2}[#2]
  }
  \IfBooleanT {#1} {
    \tl_if_in:NnT \g__edu_aligntemp_tl {r} {
      \hfill
    }
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
     \begin{center}
  }
    \tikzinput{#3}
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
    \end{center}
  }
    \tl_if_in:NnT \g__edu_aligntemp_tl {l} {
      \hfill
    }
    \colbreak
  }
}{%
  \IfBooleanF {#1} {
    \colbreak
  \tl_if_in:NnT \g__edu_aligntemp_tl {r} {
      \hfill
    }
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
     \begin{center}
  }
    \tikzinput{#3}
    \tl_if_in:NnT \g__edu_aligntemp_tl {c} {
    \end{center}
  }
    \tl_if_in:NnT \g__edu_aligntemp_tl {l} {
      \hfill
    }
  }
  \str_if_eq:nnTF {#5} {c} {
    \end{cols2*}
  }{
    \end{cols2}
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {tikzcol*} {\tikzcol*}
\cs_new:cpn {endtikzcol*} {\endtikzcol}

\DeclareDocumentCommand \notet { m } {%
  \bool_if:NT \g_edu_shownotes_bool {
    {\g_edu_notetstyle_tl\textcolor{\g_edu_notetfg_tl}{#1}}\xspace%
  }
}
\DeclareDocumentCommand \notehr { } {%
  \bool_if:NT \g_edu_shownotes_bool {
    \par
    {%
      \color{\g_edu_notehrfg_tl}
      \rule[0.75\baselineskip]{\linewidth}{\g_edu_notehrule_dim}%
      \vspace{-\baselineskip}%
    }%
  }%
}

\DeclareDocumentCommand \noteitem { m } {%
  \bool_if:NT \g_edu_shownotes_bool {
    \item{\g_edu_notetstyle_tl\textcolor{\g_edu_notetfg_tl}{#1}}%
  }
}
\int_new:N \g__edu_ttminutesum_int
\int_gset:Nn \g__edu_ttminutesum_int {0}

\int_new:N \g__edu_tthour_int
\int_new:N \g__edu_ttminute_int

\cs_new:Npn \edu_ttaddhours:n #1 {
  \int_gadd:Nn \g__edu_tthour_int {#1}
  \int_compare:nNnT {\g__edu_tthour_int} > {23} {
    \int_gsub:Nn \g__edu_tthour_int {24}
  }
}

\cs_new:Npn \edu_ttaddminutes:n #1 {
  \int_gadd:Nn \g__edu_ttminute_int {#1}
  \int_compare:nNnT {\g__edu_ttminute_int} > {59} {
    \int_gadd:Nn \g__edu_tthour_int {1}
    \int_gsub:Nn \g__edu_ttminute_int {60}
  }
  \int_compare:nNnT {\g__edu_tthour_int} > {23} {
    \int_gsub:Nn \g__edu_tthour_int {24}
  }
}

\cs_new:Npn \edu_ttentrytime: {
  \int_compare:nNnTF {\g__edu_tthour_int} < {10} {
    0\int_to_arabic:n {\g__edu_tthour_int}
  }{
    \int_to_arabic:n {\g__edu_tthour_int}
  }
  :
  \int_compare:nNnTF {\g__edu_ttminute_int} < {10} {
    0\int_to_arabic:n {\g__edu_ttminute_int}
  }{
    \int_to_arabic:n {\g__edu_ttminute_int}
  }
  \tl_if_empty:NF \__edu_ttentryltimelabel {
    \,\g_edu_ttentrytimelabel_tl
  }
}

\tl_new:N \g__edu_ttable_tl
\DeclareDocumentCommand \ttstart { m m } {
  \int_gset:Nn \g__edu_ttminutesum_int {0}
  \int_gset:Nn \g__edu_tthour_int {#1}
  \int_gset:Nn \g__edu_ttminute_int {#2}

  \tl_clear:N \g__edu_ttable_tl
}


\DeclareDocumentCommand \ttcontinue {  } {
  \tl_clear:N \g__edu_ttable_tl
}


\DeclareDocumentCommand \ttable { s o } {%
  \group_begin:

  \setlist[itemize]{%
    topsep=-0.25\baselineskip,
    itemsep=-0.25\baselineskip,
    parsep=0.25\baselineskip,
  }

  \setlist[enumerate]{%
    topsep=-0.25\baselineskip,
    itemsep=-0.25\baselineskip,
    parsep=0.25\baselineskip,
  }

  \bool_if:NT \g_edu_ttdisablehyphenation_bool {
    \hyphenpenalty 10000
    \exhyphenpenalty 10000
  }
  \IfBooleanTF {#1} {
    \landscape
    \IfValueT {#2} {
      #2
    }
    \begin{tabularx}{\linewidth}{%
      >{\RaggedRight}p{\g_edu_tttimewidthlscape_dim}%
      >{\RaggedRight}p{\g_edu_ttstagewidthlscape_dim}%
      >{\RaggedRight}X%
      >{\RaggedRight}p{\g_edu_ttmethodwidthlscape_dim}%
      >{\RaggedRight}p{\g_edu_ttmediawidthlscape_dim}%
    }
  }{
  \begin{tabularx}{\linewidth}{%
    >{\RaggedRight}p{\g_edu_tttimewidth_dim}%
    >{\RaggedRight}p{\g_edu_ttstagewidth_dim}%
    >{\RaggedRight}X%
    >{\RaggedRight}p{\g_edu_ttmethodwidth_dim}%
    >{\RaggedRight}p{\g_edu_ttmediawidth_dim}%
  }
  }
  \bool_if:NTF \g_edu_ttendtime_bool {
    \toprule
  }{
    \midrule
  }
  \small\textsfbf{\g_edu_tttimelabel_tl} &
  \small\textsfbf{\g_edu_ttstagelabel_tl} &
  \small\textsfbf{\g_edu_ttactivitylabel_tl} &
  \small\textsfbf{\g_edu_ttmethodlabel_tl} &
  \small\textsfbf{\g_edu_ttmedialabel_tl} \\

  \bool_if:NTF \g_edu_ttendtime_bool {
    \headrule
  }{
    \midrule
  }

  \tl_use:N \g__edu_ttable_tl

  \bool_if:NT \g_edu_ttendtime_bool {
    \edu_ttentrytime: \\ \bottomrule
  }

  \end{tabularx}
  \IfBooleanT {#1} {
    \endlandscape
  }
  \group_end:
}

\DeclareDocumentCommand \ttentry { s O{} O{} m +m +m +m } {%
  \bool_if:nT {!\tl_if_empty_p:n {#2} && \bool_if_p:N \g_edu_ttshowtime_bool} {
    \tl_gput_right:Nx \g__edu_ttable_tl {\edu_ttentrytime:}
    \tl_gput_right:Nn \g__edu_ttable_tl {\newline}

    \edu_ttaddminutes:n {#2}
    \int_gadd:Nn \g__edu_ttminutesum_int {#2}

    \tl_gput_right:Nn \g__edu_ttable_tl {#2\,\textbar\,}
    \tl_gput_right:NV \g__edu_ttable_tl {\g__edu_ttminutesum_int}

    \tl_if_empty:nF {#3} {
      \tl_gput_right:NV \g__edu_ttable_tl {\newline \textcolor{gray}{(#3)}}
    }
  }%
  \tl_gput_right:Nn \g__edu_ttable_tl { & #4 & }
  \IfBooleanT {#1} {
    \tl_gput_right:Nn \g__edu_ttable_tl { \begin{itemizet} }
  }
  \tl_gput_right:Nn \g__edu_ttable_tl { #5 }
  \IfBooleanT {#1} {
    \tl_gput_right:Nn \g__edu_ttable_tl { \end{itemizet} }
  }
  \tl_gput_right:Nn \g__edu_ttable_tl {& #6 & #7 \tabularnewline \midrule
  }
}

\DeclareDocumentCommand \ttbreak { s O{} +O{} +O{} +O{}} {%
  \bool_if:nT {!\tl_if_empty_p:n {#2} && \bool_if_p:N \g_edu_ttshowtime_bool} {
    \tl_gput_right:Nx \g__edu_ttable_tl {\edu_ttentrytime:}

    \edu_ttaddminutes:n {#2}
  }
  \tl_gput_right:Nn \g__edu_ttable_tl { & \textsfbf{Pause} & }
  \IfBooleanT {#1} {
    \tl_gput_right:Nn \g__edu_ttable_tl { \begin{itemizet} }
  }
  \tl_gput_right:Nn \g__edu_ttable_tl { #3 }
  \IfBooleanT {#1} {
    \tl_gput_right:Nn \g__edu_ttable_tl { \end{itemizet} }
  }
  \tl_gput_right:Nn \g__edu_ttable_tl {& #4 & #5 \tabularnewline \midrule
  }
}

\tl_new:N \g_edu_teachera_tl
\tl_new:N \g_edu_teachers_tl
\tl_new:N \g_edu_studenta_tl
\tl_new:N \g_edu_students_tl

\tl_gset:Nn \g_edu_teachera_tl {%
  \makebox[2em][l]{{\g_edu_seqteacherstyle_tl\color{\g_edu_seqteacherfg_tl} \g_edu_seqteacherlabel_tl} \action}%
}

\tl_gset:Nn \g_edu_teachers_tl {%
  \makebox[2em][l]{{\g_edu_seqteacherstyle_tl\color{\g_edu_seqteacherfg_tl} \g_edu_seqteacherlabel_tl} \speech}%
}

\tl_gset:Nn \g_edu_studenta_tl {%
  \makebox[2em][l]{{\g_edu_seqetudentstyle_tl\color{\g_edu_seqstudentfg_tl} \g_edu_seqstudentlabel_tl} \action}%
}

\tl_gset:Nn \g_edu_students_tl {%
  \makebox[2em][l]{{\g_edu_seqetudentstyle_tl\color{\g_edu_seqstudentfg_tl} \g_edu_seqstudentlabel_tl} \speech}%
}

\DeclareDocumentCommand \itemta { } {\item[\g_edu_teachera_tl]}
\DeclareDocumentCommand \itemts { } {\item[\g_edu_teachers_tl]}
\DeclareDocumentCommand \itemsa { } {\item[\g_edu_studenta_tl]}
\DeclareDocumentCommand \itemss { } {\item[\g_edu_students_tl]}

\DeclareDocumentEnvironment {sequence} { } {%
  \begin{itemize}[labelwidth=2em, leftmargin= 2em + \labelsep + \labelsep]
}{%
  \end{itemize}
}

\DeclareDocumentEnvironment {sequencet} { } {%
  \@minipagetrue%
  \setpar
  \begin{itemize}[labelwidth=2em, leftmargin= 2em + \labelsep + 0.1\labelsep, nosep]
}{%
  \vspace{-\baselineskip}
  \end{itemize}
}

\tl_new:N \g_edu_setbblengths_tl
\tl_gset:Nn \g_edu_setbblengths_tl {%
  \setlength{\columnsep}{0.5em}%
  \setlength{\jot}{0pt}%
  \setlength{\abovedisplayskip}{0.4ex}%
  \setlength{\belowdisplayskip}{0.4ex}%
}

\dim_new:N \g__edu_bbbaselineskip_dim
\dim_gset:Nn \g__edu_bbbaselineskip_dim {\g_edu_bbfontsize_dim + \g_edu_bbbaselineoffset_dim}

\newsavebox{\bbbox}

\DeclareDocumentEnvironment {bbpart} { s O{t} m } {
  \g_edu_setbblengths_tl%
  \hspace{\fboxrule}%
  \begin{lrbox}{\bbbox}
    \begin{minipage}[c][\g_edu_bbheight_dim][#2]{#3 - 2\fboxsep - 2\fboxrule}%
      \g_edu_bbstyle_tl%
      \fontsize{\g_edu_bbfontsize_dim}{\g__edu_bbbaselineskip_dim}\selectfont%
      \setpar%
      \IfBooleanT {#1} {
        \begin{center}
      }
}{
      \mbox{}  % Damit Tafel auch ohne Inhalt angezeigt wird.
      \IfBooleanT {#1} {
        \end{center}
      }
    \end{minipage}%
  \end{lrbox}
  \fbox{\usebox{\bbbox}}
  \hspace{-3\fboxrule}%
  \hspace{-1.9pt} % Removes strange space between minipages.
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {bbpart*} {\bbpart*}
\cs_new_eq:cN {endbbpart*} \endbbpart

\DeclareDocumentEnvironment {bbhalf} { s O{t} } {
  \IfBooleanTF {#1} {
    \begin{bbpart*}[#2]{0.25\linewidth}%
  }{
    \begin{bbpart}[#2]{0.25\linewidth}%
  }
}{%
  \IfBooleanTF {#1} {
    \end{bbpart*}
  }{
    \end{bbpart}
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {bbhalf*} {\bbhalf*}
\cs_new_eq:cN {endbbhalf*} \endbbhalf

\DeclareDocumentEnvironment {bbfull} { s O{t} } {
  \IfBooleanTF {#1} {
    \begin{bbpart*}[#2]{0.5\linewidth}%
  }{
    \begin{bbpart}[#2]{0.5\linewidth}%
  }
}{%
  \IfBooleanTF {#1} {
    \end{bbpart*}
  }{
    \end{bbpart}
  }
}

% Hack, because xparse doesn't generate starred environments:
\cs_new:cpn {bbfull*} {\bbfull*}
\cs_new_eq:cN {endbbfull*} \endbbfull

\DeclareDocumentCommand \bbsection { s m } {%
  \group_begin:
  \IfBooleanT {#1} {
    \begin{center}
  }
    {\g_edu_bbsectionstyle_tl #2}
  \IfBooleanT {#1} {
    \end{center}
  }
  \group_end:
}

\DeclareDocumentCommand \bbsubsection { s m } {%
  \group_begin:
  \IfBooleanT {#1} {
    \begin{center}
  }
    {\g_edu_bbsubsectionstyle_tl #2}
  \IfBooleanT {#1} {
    \end{center}
  }
  \group_end:
}

\DeclareDocumentCommand \bbsubsubsection { s m } {%
  \group_begin:
  \IfBooleanT {#1} {
    \begin{center}
  }
    {\g_edu_bbsubsubsectionstyle_tl #2}
  \IfBooleanT {#1} {
    \end{center}
  }
  \group_end:
}

\cs_new:Npn \edu_examtitlegraphicoverlay:nn #1 #2 {
  \tikz {
    \node[inner~sep=0pt, outer~sep=0pt, anchor=north~east] (n) at (0, 0) {\strut};
  \begin{pgfinterruptboundingbox}
    \node[anchor=north~east, inner~sep=0pt, outer~sep=0pt] at (0, 0) {\includegraphics[height=#2]{#1}};
\end{pgfinterruptboundingbox}
}
}

\cs_new:Npn \edu_mariovictory_shifted:nn #1 #2 {
\tikz[scale=#2] {
  \node[inner~sep=0pt,outer~sep=0pt,anchor=north~east] (n) at (0, 0){\strut};

  \setlength{\baselineskip}{2.5ex}

  \begin{pgfinterruptboundingbox}
\begin{scope}[xshift=-35cm, yshift=-27cm]
    \draw (19, 13) node[anchor=west, align=left, font=\bfseries\ttfamily, scale=1.2, inner~sep=0pt] {#1};
\edu_mariovictory_pixel:
  \end{scope}
\end{pgfinterruptboundingbox}
}
}

\DeclareDocumentCommand \makeexamtitle {s O{Viel\\ Erfolg!} O{mario-victory} O{\g_edu_examtitlegraphicsheight_dim}} {

\setlength{\parfillskip}{0em}
  \par
  \vspace{0.75ex}
  \parskipreduce
  \group_begin:
    \g_edu_titlestyle_tl%
    \color{\g_edu_titlefg_tl}%
    \noindent\g_edu_title_tl%
  \group_end:
  \hfill%
  \group_begin:
    \tl_if_empty:nF {#3} {
    \tl_if_eq:nnTF {#3} {mario-victory} {
      \edu_mariovictory_shifted:nn {#2}{\fp_use:N \g_edu_examtitlegraphicsscale_fp}
    }{
      \edu_examtitlegraphicoverlay:nn{#3}{#4}
    }
  }
  \group_end:
  \tl_if_empty:NTF \g_edu_group_tl {
    \hspace*{1cm}
  }{
    \hspace*{0.75cm}
    \group_begin:
      \setlength{\fboxsep}{0.25em}
      \g_edu_groupstyle_tl%
      \colorbox{\g_edu_groupbg_tl}{%
        \textcolor{\g_edu_groupfg_tl}{\g_edu_group_tl}%
      }%
    \group_end:
  }
  \par
  \setlength{\parfillskip}{1em plus 1fil}

  \tl_if_empty:NTF \g_edu_subtitle_tl {
    \addvspace{0.5\baselineskip}
  }{
    \parskipreduce
    \group_begin:
      \g_edu_subtitlestyle_tl
      \color{\g_edu_titlefg_tl}\noindent\g_edu_subtitle_tl\par
    \group_end:
  }
  \group_begin:
    \tl_set:Nn \l__edu_tempi_tl {}
    \tl_set:Nn \l__edu_tempii_tl {}

    \tl_if_empty:NF \g_edu_examtitlefieldilabel_tl {

      \tl_put_right:Nn \l__edu_tempi_tl {
        \rule{\g_edu_examtitlefieldiwidth_dim}{0.4pt}
      \hspace*{\g_edu_examtitlefieldsep_dim} \=
    }

      \tl_put_right:Nn \l__edu_tempii_tl {
        \g_edu_examtitlefieldilabel_tl \>
    }
    }

    \tl_if_empty:NF \g_edu_examtitlefieldiilabel_tl {

      \tl_put_right:Nn \l__edu_tempi_tl {
        \rule{\g_edu_examtitlefieldiiwidth_dim}{0.4pt}
      \hspace*{\g_edu_examtitlefieldsep_dim} \=
    }

      \tl_put_right:Nn \l__edu_tempii_tl {
        \g_edu_examtitlefieldiilabel_tl \>
    }
    }

    \tl_if_empty:NF \g_edu_examtitlefieldiiilabel_tl {

      \tl_put_right:Nn \l__edu_tempi_tl {
        \rule{\g_edu_examtitlefieldiiiwidth_dim}{0.4pt}
      \hspace*{\g_edu_examtitlefieldsep_dim} \=
    }

      \tl_put_right:Nn \l__edu_tempii_tl {
        \g_edu_examtitlefieldiiilabel_tl \>
    }
    }

  \setlength{\topsep}{-\parskip}
  \setlength{\partopsep}{0pt}
  \vspace{0.5cm}
  \small\sffamily
  \begin{tabbing}
    \l__edu_tempi_tl \\[-0.5ex]
    \l__edu_tempii_tl
  \end{tabbing}
  \group_end:

  \addvspace{0.25\baselineskip}

  \bool_if:NT \g_edu_transparency_bool {
    \KOMAoption{fontsize}{\dim_use:N \g_edu_transparencyfontsize_dim}%
    \RaggedRight
    \tolerance=10000
  }
}

\cs_new:Npn \edu_exampointstable:nnn #1 #2 #3 {
  \tl_set:Nn \l_tmpi_tl {}
  \tl_set:Nn \l_tmpii_tl {}

  \clist_map_inline:nn {#1} {
    \tl_put_right:Nn \l_tmpi_tl {##1 & }
  }

  \clist_map_inline:nn {#2} {
    \tl_put_right:Nn \l_tmpii_tl {##1 & }
  }

  \renewcommand{\arraystretch}{1.2}
\group_begin:
  \sffamily
  \tl_if_eq:VnT \g_edu_exampointstabletype_tl {X} {
    \begin{tabularx}{\linewidth}{|l||*{\clist_count:n {#1}}{>{\centering}X|}|C{0.75cm}|}
      \hline
    \multicolumn{\int_eval:n {\clist_count:n {#1}+2}}{|l|}{\textbf{\g_edu_exampointstablelabel_tl}} \\ \hline
    \g_edu_exampointstableexelabel_tl & \l_tmpi_tl \g_edu_exampointstablesumlabel_tl \\ \hline\hline
    \g_edu_exampointstablemaxlabel_tl & \l_tmpii_tl  #3 \\ \hline
    \g_edu_exampointstableachlabel_tl & \prg_replicate:nn {\clist_count:n {#1}}{&}  \\ \hline
   \end{tabularx}
  }

  \tl_if_eq:VnT \g_edu_exampointstabletype_tl {C} {
    \begin{tabular}{|l|*{\clist_count:n {#1}}{C{1em}|}c|}
      \hline
    \multicolumn{\int_eval:n {\clist_count:n {#1}+2}}{|l|}{\textbf{\g_edu_exampointstablelabel_tl}} \\ \hline
    \g_edu_exampointstableexelabel_tl & \l_tmpi_tl \g_edu_exampointstablesumlabel_tl \\ \hline
    \g_edu_exampointstablemaxlabel_tl & \l_tmpii_tl  #3 \\ \hline
    \g_edu_exampointstableachlabel_tl & \prg_replicate:nn {\clist_count:n {#1}}{&}  \\ \hline
    \end{tabular}
  }
\group_end:
}

\NewDocumentCommand \exampointstable { m m m } {
  \edu_exampointstable:nnn {#1}{#2}{#3}
}

\NewDocumentCommand \makeexamrestable { s o m m m } {

  \setlength{\fboxsep}{10pt}
\fbox{
  \parbox{\linewidth-2\fboxsep-2\fboxrule}{
    \IfNoValueF {#2} {
      \group_begin:
        \Large\sffamily\bfseries #2
      \group_end:
      \medskip
    }
    \par
  \begin{minipage}{\g_edu_exampointstablewidth_tl-\fboxsep}
    \exampointstable{#3}{#4}{#5}
  \end{minipage}
  \hfill
  \begin{minipage}{\linewidth-\g_edu_exampointstablewidth_tl}
  \Large\sffamily\bfseries \g_edu_exampointsmarklabel_tl :~\tikz[baseline=0.75ex] \draw (0,0) rectangle (1.25,0.65);
  \hspace{0.35cm} \large \g_edu_exampointsaveragelabel_tl

  \bool_if:NT \g_edu_exampointssecondmark_bool {
  \par
  \normalsize
  \medskip
  \g_edu_exampointssecondmarklabel_tl :~ \tikz[baseline=0.75ex] \draw (0,0) rectangle (1,0.5);
  }
   

  \bool_if:NT \g_edu_exampointssignature_bool { 
    \par
    \mdseries\footnotesize
    \vspace{0.75cm}
    \rule{\linewidth}{0.4pt}\\
    \g_edu_exampointssignaturelabel_tl
  }
  \end{minipage}
  }
}
  \setlength{\fboxsep}{3pt}
}

\NewDocumentCommand \makeexamres { s m } {
  \setlength{\fboxsep}{10pt}
\fbox{
  \parbox{\linewidth-2\fboxsep-2\fboxrule}{
    \sffamily\Large
  \begin{minipage}{0.55\linewidth-\fboxsep}
  \textbf{Punkte:}
    \hspace{1.75cm} \g_edu_exampointsoflabel_tl\ #2

    \par
    \vspace{0.5\baselineskip}
    \textbf{\LARGE\g_edu_exampointsmarklabel_tl :~\tikz[baseline=0.75ex] \draw (0,0) rectangle (1.5,0.75);}
    \hspace{0.75cm} \textbf{\g_edu_exampointsaveragelabel_tl}

  \bool_if:nT {\g_edu_exampointssecondmark_bool
    && \g_edu_exampointssignature_bool
  }{
  \par
  \large\bfseries
  \medskip
  \g_edu_exampointssecondmarklabel_tl :~ \tikz[baseline=0.75ex] \draw (0,0) rectangle (1,0.5);
  }
    \end{minipage}
    \begin{minipage}{0.45\linewidth-\fboxsep}
  \bool_if:NTF \g_edu_exampointssignature_bool { 
    \vspace{1cm}
        \mdseries\footnotesize
        \rule{7cm}{0.4pt}\\
     \g_edu_exampointssignaturelabel_tl
   }{
   \bool_if:NT \g_edu_exampointssecondmark_bool { 
     \par
    \large\bfseries
  \medskip
  \g_edu_exampointssecondmarklabel_tl :~ \tikz[baseline=0.75ex] \draw (0,0) rectangle (1,0.5);
}
   }
    \end{minipage}
  }
}
  \setlength{\fboxsep}{3pt} 
}

\dim_new:N \g_edu_lstbelowskip
\dim_gset:Nn \g_edu_lstbelowskip {0.2\baselineskip-0.5\parskip}

\lstdefinestyle{lststyle}{%
  aboveskip=0.75\baselineskip,
  belowskip=\g_edu_lstbelowskip,
  language=Java,
  basicstyle=\ttfamily\footnotesize,
  keywordstyle=\color{\g_edu_lstnumberfg_tl}\bfseries,
  stringstyle=\emph,
  numberstyle=\color{\g_edu_lstnumberfg_tl}\ttfamily\scriptsize,
  numbers=left,
  numbersep=8pt,
  frame=trbl,
  framesep=0pt,
  framexleftmargin=2pt,
  framexrightmargin=2pt,
  framerule=0.7pt,
  rulecolor=\color{\g_edu_lstrulefg_tl},
  captionpos=b,
  tabsize=2,
  showstringspaces=false,
  xleftmargin=2.5em,
  xrightmargin=0cm,
  breaklines=true,
  prebreak={\,\,\Pisymbol{psy}{191}},
%  backgroundcolor=\color{wuLightGray},
  escapeinside={/@}{@/},
  lineskip=1pt
}

\lstdefinestyle{lstistyle}{%
  language=Java,
  basicstyle=\ttfamily,
  keywordstyle=\color{\g_edu_lstnumberfg_tl}\bfseries,
  stringstyle=\emph,
  breaklines=true,
  prebreak={\,\,\Pisymbol{psy}{191}}
}

\lstdefinestyle{lstresstyle}{%
  aboveskip=0.75\baselineskip,
  belowskip=\g_edu_lstbelowskip,
  basicstyle=\ttfamily\footnotesize\color{\g_edu_resultfg_tl},
  keywordstyle=\bfseries\color{\g_edu_resultfg_tl},
  numberstyle=\color{\g_edu_resultfg_tl}\ttfamily\scriptsize,
  rulecolor=\color{\g_edu_resultfg_tl}
}

\tl_if_empty:NF \g_edu_resultlistinglabel_tl {
\lstdefinestyle{lstresstyle}{%
    aboveskip=0.25\baselineskip,
    belowskip=\g_edu_lstbelowskip,
    basicstyle=\ttfamily\footnotesize\color{\g_edu_resultfg_tl},
    keywordstyle=\bfseries\color{\g_edu_resultfg_tl},
  numberstyle=\color{\g_edu_resultfg_tl}\ttfamily\scriptsize,
    rulecolor=\color{\g_edu_resultfg_tl},
  title=\color{\g_edu_resultfg_tl}\sffamily\g_edu_resultlistinglabel_tl,
  captionpos=t
}
}

\lstset{%
  style=lststyle,
  upquote=true
}

% Support for Umlaute, dollar-symbol
% Prevent ligatures
\lstset{literate=%
    {Ö}{{\"O}}1
    {Ä}{{\"A}}1
    {Ü}{{\"U}}1
    {ß}{{\ss}}1
    {ü}{{\"u}}1
    {ä}{{\"a}}1
    {ö}{{\"o}}1
    {\$}{{\$}}1
}

\tl_if_empty:NF \g_edu_lstkeywordsprocessing_bool {
\lstset{%
  morekeywords={abs, acos, alpha, ambient, ambientLight, append, applyMatrix, arc, Array, arrayCopy, ArrayList, asin, atan, atan2, background, beginCamera, beginRaw, beginRecord, beginShape, bezier, bezierDetail, bezierPoint, bezierTangent, bezierVertex, binary, blend, blendColor, blue, boolean, boolean, box, break, brightness, BufferedReader, byte, byte, camera, case, catch, ceil, char, char, class, color, color, colorMode, concat, constrain, continue, copy, cos, createFont, createGraphics, createImage, createInput, createOutput, createReader, createWriter, cursor, curve, curveDetail, curvePoint, curveTangent, curveTightness, curveVertex, day, default, degrees, delay, directionalLight, dist, double, draw, ellipse, ellipseMode, else, emissive, endCamera, endRaw, endRecord, endShape, exit, exp, expand, extends, false, fill, filter, final, float, float, floor, focused, for, frameCount, frameRate, frameRate, frustum, get, green, HALF_PI, HashMap, height, hex, hint, hour, hue, if, image, imageMode, implements, import, int, int, join, key, keyCode, keyPressed, keyPressed, keyReleased, keyTyped, lerp, lerpColor, lightFalloff, lights, lightSpecular, line, link, loadBytes, loadFont, loadImage, loadPixels, loadShape, loadStrings, log, long, loop, mag, map, match, matchAll, max, millis, min, minute, modelX, modelY, modelZ, month, mouseButton, mouseClicked, mouseDragged, mouseMoved, mousePressed, mousePressed, mouseReleased, mouseX, mouseY, new, nf, nfc, nfp, nfs, noCursor, noFill, noise, noiseDetail, noiseSeed, noLights, noLoop, norm, normal, noSmooth, noStroke, noTint, null, Object, online, open, ortho, param, perspective, PFont, PGraphics, PI, PImage, pixels[], pmouseX, pmouseY, point, pointLight, popMatrix, popStyle, pow, print, printArray, printCamera, println, printMatrix, printProjection, PrintWriter, private, PShape, public, pushMatrix, pushStyle, PVector, quad, QUARTER_PI, radians, random, randomSeed, rect, rectMode, red, redraw, requestImage, resetMatrix, return, reverse, rotate, rotateX, rotateY, rotateZ, round, saturation, save, saveBytes, saveFrame, saveStream, saveStrings, scale, screen, screenX, screenY, screenZ, second, selectFolder, selectInput, selectOutput, set, setup, shape, shapeMode, shearX, shearY, shininess, shorten, sin, size, smooth, sort, specular, sphere, sphereDetail, splice, split, splitTokens, spotLight, sq, sqrt, static, status, str, String, stroke, strokeCap, strokeJoin, strokeWeight, subset, super, switch, tan, text, textAlign, textAscent, textDescent, textFont, textLeading, textMode, textSize, texture, textureMode, textWidth, this, tint, translate, triangle, trim, true, try, TWO_PI, unbinary, unhex, updatePixels, vertex, void, while, width, XMLElement, year}
}
}

\NewDocumentEnvironment{reslstlisting}{}{
    \XSIMfilewritestart{\jobname.tmp}
}{
    \XSIMfilewritestop
    \bool_if:NT \g_edu_showresults_bool
        {
            \lstinputlisting[style=lstresstyle]{\jobname.tmp}
        }
}

\bool_if:NT \g_edu_edumath_bool {

  \RequirePackage[\g_edu_edumathoptions_tl]{edumath}
}


\bool_if:NT \g_edu_edumath_bool {
  \AtBeginDocument{
    \setlength{\abovedisplayskip}{1.2ex plus 0.2ex minus 0.1ex}
    \setlength{\abovedisplayshortskip}{1ex plus 0.2ex minus 0.2ex}
    \setlength{\belowdisplayskip}{1.2ex plus 0.2ex minus 0.1ex}
    \setlength{\belowdisplayshortskip}{1ex plus 0.2ex minus 0.2ex}
  }
}

\tl_if_exist:NF \templength {
  \newlength{\templength}
}

\tl_if_exist:NF \tempcommand {
  \newcommand{\tempcommand}{}
}

\ifx\c@tempcounter\undefined
  \newcounter{tempcounter}
\fi

\ExplSyntaxOff


