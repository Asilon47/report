%% memoriaPFC.cls (Plantilla oficial PFG 2024–25 - Universidad de Deusto)

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{memoriaPFC}[2025/03/26 v0.5 Plantilla adaptada a normativa PFG 2024-25 de la Universidad de Deusto.]

%% ------------------------------
%% Carga de clase base
%% ------------------------------
\DeclareOption{borrador}{\PassOptionsToPackage{draft}{graphicx}}
\ProcessOptions
\LoadClass[10pt,a4paper,oneside,bibliography=totocnumbered,open=any]{scrbook} 

%% ------------------------------
%% Paquetes esenciales
%% ------------------------------
\RequirePackage[automark,markcase=upper]{scrlayer-scrpage}
\RequirePackage[T1]{fontenc}     
\RequirePackage[utf8]{inputenc}  
\RequirePackage[spanish,english]{babel}  
\RequirePackage{setspace}       
\RequirePackage[default]{sourcesanspro} 
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{url}            
\RequirePackage{fancybox}       
\RequirePackage[pdftex]{graphicx} 
\RequirePackage{ifthen}         
\RequirePackage[pdftex]{color}  
\RequirePackage{fancyvrb}       
\RequirePackage{amssymb}        
\RequirePackage{multibib}       
\RequirePackage{listings}       
\RequirePackage{pdfpages}       
\RequirePackage[colorlinks=true,
                linkcolor=black,
                citecolor=blue,
                urlcolor=blue,
                unicode,
                hypertexnames=false,
                bookmarks=true]{hyperref}
\RequirePackage{bookmark}       
\RequirePackage{xcolor}         
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{mathrsfs}
\RequirePackage[acronym]{glossaries}
\RequirePackage{gensymb}
\RequirePackage{lmodern} 
\RequirePackage{lipsum}
\RequirePackage{hyperref}
\RequirePackage{wasysym}
\RequirePackage{booktabs}
\RequirePackage{siunitx}
\RequirePackage{etoolbox}                       
\RequirePackage[font=small,labelfont=bf]{caption}     
\RequirePackage{subcaption}                           
\RequirePackage{multirow}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{xfrac}
\RequirePackage[nice]{nicefrac}
\RequirePackage{pgfgantt}
\RequirePackage{rotating}
\RequirePackage{booktabs}
\RequirePackage{caption}        
\RequirePackage{tikz}
\RequirePackage{tabularx}
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,fit}
\RequirePackage{dirtytalk}


%% ------------------------------
%% Configuración listings (código)
%% ------------------------------
\definecolor{deustoBlue}{cmyk}{1,0.57,0,0.02}
\definecolor{graybg}{gray}{0.97}
\definecolor{commentgray}{gray}{0.4}
\definecolor{stringorange}{rgb}{0.8,0.4,0.1}

\lstset{
  backgroundcolor=\color{graybg},
  basicstyle=\ttfamily,
  keywordstyle=\color{deustoBlue}\bfseries,
  commentstyle=\color{commentgray}\itshape,
  stringstyle=\color{stringorange},
  numberstyle=\tiny\color{gray},
  numbers=left,
  numbersep=10pt,
  frame=single,
  framesep=5pt,
  rulecolor=\color{black},
  breaklines=true,
  showstringspaces=false,
  tabsize=2,
  captionpos=b,
  xleftmargin=1em,
  xrightmargin=1em,
  aboveskip=1em,
  belowskip=1em,
  extendedchars=true,
  inputencoding=utf8
}


%% ------------------------------
%% Definición de metadatos y formato general
%% ------------------------------
\makeatletter
\newcommand{\@autorUno}{Nombre del autor}
\newcommand{\@autorDos}{}
\newcommand{\@autores}{\@autorUno}
\newcommand{\autores}[2]{\def\@autorUno{#1}\def\@autorDos{#2}}
\newcommand{\titulacion}[1]{\def\@titulacion{#1}}
\newcommand{\director}[1]{\def\@director{Director: #1}}
\newcommand{\directora}[1]{\def\@director{Directora: #1}}
\gdef\@resumen{}
\gdef\@descriptores{}
\newcommand{\resumen}[1]{\gdef\@resumen{#1}}
\newcommand{\descriptores}[1]{\gdef\@descriptores{#1}}

\AtBeginDocument{
  \ifthenelse{\equal{\@autorDos}{}}{\def\@autores{\@autorUno}}{\def\@autores{\@autorUno{} y \@autorDos}}
  \pagestyle{scrheadings}
  \renewcommand*{\chapterpagestyle}{scrheadings}
  \setstretch{1.5}          % Interlineado 15 pt para cuerpo 10 pt
  \setlength{\parskip}{12pt}  % Espacio entre párrafos
  \setlength{\parindent}{0pt} % Sin sangría
  \hypersetup{
      linktoc=all,
      pdftitle={\@title},
      pdfauthor={\@autores},
      pdfsubject={Proyecto Fin de Grado},
      pdfkeywords={\@descriptores}
  }
}
\makeatother

%% ------------------------------
%% Márgenes y disposición
%% ------------------------------
\RequirePackage[a4paper,
  top=1.0cm,
  headheight=0.2cm,
  headsep=2.4cm,
  bottom=1.2cm,
  footskip=3.3cm,
  inner=2.5cm,
  outer=2.5cm,
  includehead,
  includefoot
]{geometry}

%% ------------------------------
%% Cabecera y pie de página
%% ------------------------------
\clearpairofpagestyles
\ihead{}
\chead{}
\ohead{{\fontsize{8}{10}\selectfont\textit{PROYECTO FIN DE GRADO}}}

\ifoot{}
\cfoot{}
\ofoot{\raisebox{6pt}{{\fontsize{11}{13}\selectfont\pagemark}}}   

%% ------------------------------
%% Estructura del documento
%% ------------------------------
\renewcommand{\frontmatter}{%
  \pagestyle{scrheadings}
  \pagenumbering{roman}
}

\renewcommand{\mainmatter}{%
  \cleardoublepage
  \pagestyle{scrheadings}
  \pagenumbering{arabic}
  \setcounter{secnumdepth}{5}
  \setcounter{tocdepth}{3}

  %% Capítulos: 16 pt, mayúsculas, línea inferior
  \RedeclareSectionCommand[
    beforeskip=0pt,
    afterskip=0.5ex,
    font=\sffamily\bfseries\fontsize{16}{18}\selectfont,
    innerskip=0pt
  ]{chapter}
  \addtokomafont{chapter}{\MakeUppercase}
  \renewcommand*{\chapterformat}{\thechapter.\enskip}
  \renewcommand*{\chapterlinesformat}[3]{%
    \hfill##2##3\par
    \vspace*{-3ex}
    \noindent\rule{\textwidth}{1pt}%
  }

  %% Secciones: 14 pt
  \RedeclareSectionCommand[
    beforeskip=1.5ex plus .2ex,
    afterskip=1ex plus .1ex,
    font=\sffamily\bfseries\fontsize{14}{16}\selectfont
  ]{section}
  \addtokomafont{section}{\MakeUppercase}

  %% Subsecciones: 12 pt aprox.
  \RedeclareSectionCommand[
    beforeskip=1.2ex plus .2ex,
    afterskip=0.8ex plus .1ex,
    font=\sffamily\large\bfseries
  ]{subsection}

  \RedeclareSectionCommand[
    beforeskip=1ex,
    afterskip=0.5ex,
    font=\sffamily\normalsize\bfseries
  ]{subsubsection}
}


\renewcommand{\backmatter}{%
  \cleardoublepage
  \pagestyle{scrheadings}
  \RedeclareSectionCommand[
    beforeskip=0pt,
    afterskip=0.5ex,
    font=\sffamily\bfseries\fontsize{16}{18}\selectfont,
    innerskip=0pt
  ]{chapter}
  \addtokomafont{chapter}{\MakeUppercase}
}


%% ------------------------------
%% Comandos personalizados
%% ------------------------------
\newcommand{\resumenPersonalizado}[2]{%
  \cleardoublepage
  \pagenumbering{roman}  
  \pagestyle{headings}   
  \vspace*{3cm}
  {\bfseries\Large Abstract\par}
  \vspace{0.5cm}
  #1 % Texto del resumen
  \vspace{2cm}

  {\bfseries\Large Keywords\par}
  \vspace{0.5cm}
  #2 % Texto de los descriptores

  \cleardoublepage
}

\newcommand{\hacerresumen}{%
  \cleardoublepage\pagebreak
  {\Large\bfseries Abstract\par\vspace{1em}}%
  \noindent\@Abstract\par
  \vspace{2em}%
  {\Large\bfseries Keywords\par\vspace{1em}}%
  \noindent\@Keywords\thispagestyle{plain}%
}


%% ------------------------------
%% Bibliografía (IEEE)
%% ------------------------------

\newcommand{\bibliografia}[1]{%
  \cleardoublepage
  \renewcommand{\bibname}{BIBLIOGRAPHY}
  \bibliographystyle{IEEEtran}
  \bibliography{#1}
}

%% ------------------------------
%% Seudocódigo y párrafos
%% ------------------------------
%%\renewcommand{\lstlistlistingname}{List of Pseudocodes}
%%\renewcommand{\lstlistingname}{Pseudocode}


\RedeclareSectionCommand[
  beforeskip=1ex,
  afterskip=0.5ex,
  font=\sffamily\normalsize\bfseries,
  runin=false,
  indent=0pt,
  level=5
]{paragraph}
\renewcommand*{\paragraphformat}{\theparagraph.\enskip}

\RedeclareSectionCommand[runin=false]{subparagraph}

\tikzset{
  sensor/.style={draw, rectangle, rounded corners, fill=blue!20},
  block/.style={draw, rectangle, fill=green!20},
  bus/.style={draw, circle, fill=orange!20},
  driver/.style={draw, rectangle, fill=red!20},
  motortxt/.style={font=\scriptsize},
  power/.style={draw, rectangle, fill=purple!20},
  arrow/.style={->, thick},
  dblarrow/.style={<->, thick}
}
