\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_resume}[8/10/2023 custom resume class]

\LoadClass[11pt]{article}
\RequirePackage{array}
\RequirePackage{titlesec}
\RequirePackage[quiet]{fontspec}
\RequirePackage{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xstring}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage[usenames,dvipsnames]{color}
% Needed to make header & footer efficiently
\RequirePackage{fancyhdr}

\geometry{a4paper, left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}


\titleformat{\section}{
	\vspace{5pt}\scshape\raggedright\large}
	{}{0em}{}[\color{black}\titlerule \vspace{5pt}]

% Define custom column types
\newcolumntype{L}{>{\raggedright\arraybackslash}m{0.6\textwidth}}
\newcolumntype{C}{>{\centering\arraybackslash}m{0.6\textwidth}}
\newcolumntype{R}{>{\raggedleft\arraybackslash}m{0.4\textwidth}}

\renewcommand{\labelitemii}{$\circ$}
\newcommand{\experienceItem}[2]{\item \textbf{#1}: {#2}}
\newenvironment{experienceDescriptionEntries}{\begin{itemize}}{\end{itemize}}

% Define Resume Heading
% Usage: \experienceEntry{<Name>}{<address>}{<email address>}{<mobile number>}
\newcommand{\resumeHeading}[4]{%
	\raggedright
	\vspace{-2.0mm}
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabularx}{\textwidth}{LR}
		\textbf{\Large #1} & \href{mailto:#3}{#3} \\
		\textit{\small #2} & \href{tel:#4}{#4} \\
	\end{tabularx}%
}

% Define experiences
% Usage: \experienceEntry{<company>}{<location>}{<postion>}{<date>}
\newcommand*{\experienceEntry}[4]{%
	\raggedright
	\vspace{-2.0mm}
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabularx}{\textwidth}{LR}
		\textbf{#1} & #2 \\
		\textit{\small #3} & \textit{\small #4} \\
	\end{tabularx}%
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{#1}
  \fancyfoot[C]{#2}
  \fancyfoot[R]{#3}
}