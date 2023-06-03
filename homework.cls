\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{homework}[2014/12/16 Class file for homework assignments]

\LoadClassWithOptions{article}



% ----- Options ---------------------------------------------------------------
%\newcommand\@opnewpage{0}
%\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
%\newcommand\@oplargemargins{0}
%\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}
%\ProcessOptions


% ----- Packages --------------------------------------------------------------

% Better fonts with accents
\RequirePackage[T1]{fontenc}

% Required for starred commands
\RequirePackage{suffix}

\RequirePackage{parskip}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
\RequirePackage{fancyhdr}
%\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}
\RequirePackage{fullpage}

\RequirePackage[a4paper,
    hmargin=1.5cm,
    vmargin=1cm,
    includeheadfoot]{geometry}

\setlength{\headheight}{12pt}
\addtolength{\headsep}{0.7cm}
\addtolength{\textheight}{-0.6cm}

% Links
\RequirePackage{hyperref}

% ----- Questions -------------------------------------------------------------
\newcounter{questionCounter}
\newcounter{partCounter}[questionCounter]


%
\WithSuffix\providecommand\assignment*{}
\WithSuffix\renewcommand\assignment*[1]{%
  % Wrap in minipage so that we don't get a line break anywhere in between
  \begin{minipage}{\linewidth}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
    \noindent{\bf \large Assignment #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
}



% ----- Question Parts --------------------------------------------------------

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph{partCounter})}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{questionCounter}.\arabic{partCounter}})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\stepcounter{partCounter}\item}


% ----- Answer Box ------------------------------------------------------------

\newcommand{\answerbox}[1]{%
\begin{framed}
\vspace{#1}
\end{framed}}

% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
\setlength{\parindent}{0pt}
%\setlength{\parskip}{5pt plus 1pt}
%\setlength{\parskip}{3pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ----- Title & Header --------------------------------------------------------
% \pagestyle{empty}
\pagestyle{fancy}

\newcommand{\mysetupheader}{
    % Setup header
    % \setlength{\headheight}{15.2pt}
    % \setlength{\headsep}{0.2in}
    \lhead{\hwclassshort{} -- \hwshorttitle{}}%
    \rhead{\hwauthor{}}%

    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
}

%\if\@opanon%
  \renewcommand{\maketitle}[0]{%
    \mysetupheader
    
    % Setup hrule in header
    \renewcommand{\headrulewidth}{0pt}
    \headrule{}
    % Don't put header on first page
    \thispagestyle{plain}

    \begin{center}
      {\LARGE \hwtitle{}}

      {\Large \hwclass{}}
      
      Student: \hwauthor{} \hwauthorextra{}

    \end{center}
    \renewcommand{\headrulewidth}{0.4pt}
  }

% ----- For usage with pandoc converted documents -----------------------------

\providecommand{\tightlist}{%
  \setlength{\itemsep}{1pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
