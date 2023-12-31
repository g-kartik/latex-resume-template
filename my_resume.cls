% Author:
% G Karthik <gkartikraja@gmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_resume}[2023/10/24 custom resume class]


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Need to create advanced tables
\RequirePackage{tabularx}
% Needed to make header & footer efficiently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Solves issues Warning: File `cv.out' has changed
\RequirePackage{bookmark}
% Needed to use roboto font
\RequirePackage{roboto}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to handle list environment
\RequirePackage[inline]{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{unicode-math}
% To support if-else-then conditionals
\RequirePackage{xifthen}
% To support Icons
\RequirePackage{fontawesome5}


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand{\headernamestyle}[1]{{\fontsize{32pt}{1em}\selectfont\bodyfont\color{text} #1}}
\newcommand{\headeraddressstyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\headerwebsitestyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\headerinfostyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\headeremailstyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\headerquotestyle}[1]{{\fontsize{8pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\footerstyle}[1]{{\fontsize{8pt}{1em}\selectfont\bodyfontlight\itshape\color{text} #1}}
\newcommand{\sectionstyle}[1]{{\fontsize{16pt}{1em}\selectfont\bodyfont\bfseries\color{text} #1}}
\newcommand{\paragraphstyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\upshape\color{text} #1 \par}}
\newcommand{\cvitemheadingstyle}[1]{{\fontsize{9pt}{0em}\selectfont\bodyfont\bfseries\upshape\color{text} #1}}
\newcommand{\cvitemcontentstyle}[1]{{\fontsize{9pt}{0em}\selectfont\bodyfont\upshape\color{text} #1}}

% For elements of entry
\newcommand{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\selectfont\bodyfont\bfseries\color{text} #1}}
\newcommand{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\selectfont\bodyfont\itshape\color{text} #1}}
\newcommand{\entrytitleurlstyle}[1]{{\fontsize{8pt}{1em}\selectfont\bodyfontlight\itshape\color{text} #1}}
% For elements of skill
\newcommand{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\selectfont\bodyfont\bfseries\color{text} #1}}
\newcommand{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\upshape\color{text} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------

\makeatletter
% Define writer's name
\newcommand{\name}[1]{\def\@name{#1}}

% Define writer's address
% Usage: \address{<address>}
\newcommand{\address}[1]{\def\@address{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand{\mobile}[1]{
  \def\@mobile{#1}
  \def\@teluri{tel:\@mobile}
}

% Defines writer's email
% Usage: \email{<email address>}
\newcommand{\email}[1]{
	\def\@email{#1}
	\def\@emailuri{mailto:\@email}
}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand{\github}[1]{\def\@github{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand{\quote}[1]{\def\@quote{#1}}

% Personal website
% Usage: \mywebsite{<website url>}
\newcommand{\mywebsite}[1]{\def\@mywebsite{#1}}
\makeatother


%-------------------------------------------------------------------------------
%                Commands for Spacing
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
\newcommand{\cvHeadingSeparation}{1pt}
\newcommand{\cvHeadingAfterSkip}{10pt}
\newcommand{\cvQuoteAfterSkip}{5pt}
\newcommand{\cvSectionBeforeSkip}{20pt}
\newcommand{\cvSectionAfterSkip}{5pt}
\newcommand{\cvTableBeforeSkip}{5pt}
\newcommand{\cvTableAfterSkip}{-5pt}
\newcommand{\cvItemLabelSeparation}{4pt}
\newcommand{\cvItemSeparation}{3pt}
\newcommand{\cvItemInlineSeparation}{10pt}

\newcommand{\cvHeadingBeforeSkip}{0pt}
\newcommand{\cvQuoteBeforeSkip}{0pt}
\newcommand{\cvTableRowSeparation}{0pt}
\newcommand{\cvParagraphBeforeSkip}{0pt}
\newcommand{\cvParagraphAfterSkip}{0pt}
\newcommand{\cvItemLeftMargin}{0pt}
\newcommand{\cvEntriesEnvBeforeSkip}{0pt}
\newcommand{\cvEntriesEnvAfterSkip}{0pt}
\newcommand{\cvItemsEnvBeforeSkip}{0pt}
\newcommand{\cvItemsEnvAfterSkip}{0pt}

\newcommand{\cvLineSpacing}{1.15}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}

\makeatletter
% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\makeatother

% Use to execute conditional statements by checking empty string
\newcommand{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define Resume Heading
% Usage: \resumeHeading
\makeatletter
\newcommand{\resumeHeading}{
  \raggedright
  \vspace{\cvHeadingBeforeSkip}
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{\cvHeadingSeparation}
	\begin{tabularx}{\textwidth}{L{0.6\textwidth}R{0.4\textwidth}}
		\headernamestyle{\@name} & \smash{\raisebox{-2pt}{\headeremailstyle{\href{\@emailuri}{\@email}}}} \\
		\headeraddressstyle{\@address} & \headerinfostyle{\href{\@teluri}{\@mobile}} \\
    \headerwebsitestyle{\href{https://\@mywebsite}{\@mywebsite}} & \smash{\raisebox{-1pt}{\href{https://\@github}{\faGithub} \hspace{2mm} \href{https://\@linkedin}{\faLinkedin}}} \\
	\end{tabularx}
  \vspace{\cvHeadingAfterSkip}

  \centering
  \vspace{\cvQuoteBeforeSkip}
  \headerquotestyle{``\@quote"}
  \vspace{\cvQuoteAfterSkip}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand{\makecvfooter}[3]{
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Implement the footer
\makecvfooter{\today}{{\@name} Resume}{\thepage}
\makeatother

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{
  \vspace{\cvSectionBeforeSkip}
  \sectionstyle{\smash{#1}}
  \vhrulefill{0.9pt} \\
  \vspace{\cvSectionAfterSkip}
}

% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand{\cventry}[5]{
  \vspace{\cvTableBeforeSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{\cvTableRowSeparation}
  \begin{tabularx}{\textwidth}{L{0.6\textwidth} R{0.4\textwidth}}
      \entrytitlestyle{#1} \entrytitleurlstyle{(\href{https://#2}{#2})} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#4} & \entrydatestyle{#5} \\
  \end{tabularx}
  \vspace{\cvTableAfterSkip}
}

% Define an entry of cv education
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand{\cventryedu}[4]{
  \vspace{\cvTableBeforeSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{\cvTableRowSeparation}
  \begin{tabularx}{\textwidth}{L{0.6\textwidth} R{0.4\textwidth}}
      \entrytitlestyle{#1} & \entrylocationstyle{#2} \\
      \entrypositionstyle{#3} & \entrydatestyle{#4} \\
  \end{tabularx}
  \vspace{\cvTableAfterSkip}
}


% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand{\cvskill}[2]{
  \item \skilltypestyle{#1}: \skillsetstyle{#2}
}

% Define a line of cv item (for cvitems)
% Usage: \cvitem{<heading>}{<description>}
\newcommand{\cvitem}[2]{\item \cvitemheadingstyle{#1}: \cvitemcontentstyle{#2}}

% Define a line of cv paragraph
% Usage: \cvitem{<heading>}{<description>}
\newcommand{\makeparagraph}[1]{\paragraphstyle{#1}}


% Environments
% Define a paragraph for CV
\newenvironment{cvparagraph}{
  \vspace{\cvParagraphBeforeSkip}
  \setstretch{\cvLineSpacing}
  % \setlength{\JustifyingParfillskip}{0pt}
  \begin{justify}
}{
  \end{justify}
  \vspace{\cvParagraphAfterSkip}
}

% Define an environment for cventry
\newenvironment{cventries}{
  \vspace{\cvEntriesEnvBeforeSkip}
  \begin{justify}
}{
  \end{justify}
  \vspace{\cvEntriesEnvAfterSkip}
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{
  \vspace{\cvItemsEnvBeforeSkip}
  \begin{justify}
  \setstretch{\cvLineSpacing}
  \begin{itemize}[left=\cvItemLeftMargin, itemsep=\cvItemSeparation,
    labelsep=\cvItemLabelSeparation]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{
  \end{itemize}
  \end{justify}
  \vspace{\cvItemsEnvAfterSkip}
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvskills}{
  \vspace{\cvItemsEnvBeforeSkip}
  \begin{justify}
    \setstretch{\cvLineSpacing}
    \begin{itemize*}[itemjoin={\hspace{\cvItemInlineSeparation}},
      afterlabel=\hspace{\cvItemLabelSeparation}]
}{
    \end{itemize*}
  \end{justify}
  \vspace{\cvItemsEnvAfterSkip}
}