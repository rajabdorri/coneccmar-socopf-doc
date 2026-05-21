%% Based on iit-project.cls 
%% I have modified things to use {article} format. In this 
%% case, there is no Chapter division. This has impact in 
%% the lables for Figures and Tables. 
%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iit-project}[2022/06/01 Project template IIT Universidad Pontificia Comillas]


%%Preliminary definitions
\def\version#1{\gdef\@version{#1}}
\def\@version{\@latex@warning@no@line{No \noexpand\version given}}
\def\clientcompany#1{\gdef\@clientcompany{#1}}
\def\@clientcompany{\@latex@warning@no@line{No \noexpand\clientcompany given}}

%%This parts handles the options passed to the class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % CHANGE "article" TO "report" IF YOU WANT CHAPTERS
\ProcessOptions\relax
\LoadClass[twoside]{article}                                 % CHANGE "article" TO "report" IF YOU WANT CHAPTERS


\AtBeginDocument{
\addto\captionsenglish{%
\renewcommand{\contentsname}%
{\hfill\bfseries\LARGE INDEX}%
}
\addto\captionsspanish{%
\renewcommand{\contentsname}%
{\hfill\bfseries\LARGE ÍNDICE}%
}
\@ifpackagewith{babel}{spanish}{
    \renewcommand\spanishtablename{Tabla}
    \renewcommand{\spanishlisttablename}{Índice de tablas}
    \renewcommand{\cftfigfont}{Figura }
    \renewcommand{\cfttabfont}{Tabla }
    \renewcommand{\contentsname}{\hfill\bfseries\LARGE INDEX}   
    \renewcommand{\cftaftertoctitle}{\hfill}
    \newcommand{\coverpagetext}[0]{
    \begin{centering}
\large          % Puts a table with the project data 
    \begin{tabularx}{\linewidth}{|l|X|} \hline\hline
    {\bf PROYECTO:}  & {\bf \projectname} \\ \hline\hline
    {\bf T\'{\i}tulo:} & \@title \\ \hline
    {\bf Autor/es:} &  \@author \\ \hline
    {\bf Revisado por:} & \reviewernames \\ \hline
    {\bf Fecha:} & \datedetailsname \\ \hline
    {\bf Estado:} & \statename \\ \hline
    {\bf Referencia Interna:} & \referencenametable \\ \hline
    {\bf Fichero:} & \ficheroname \\ \hline\hline
    \end{tabularx}
    \end{centering}
    
    
%        \LARGE
%        \textbf{REPORTE TÉCNICO}\\ [1cm]
%	   
%	   \Large
%    	\@title \\[2cm] 
%    	
%    	%------------------------------------------------
%    	%	Author(s)
%    	%------------------------------------------------
%    	\large
%    	\@author \\[2.0cm]
%
%        Preparado por el IIT para \@clientcompany \\[2.0cm]
%
%        \normalsize
%        \@date \\ [0.5cm]
%        Versión: \@version \\ [1.5cm]
    }
}{}
\@ifpackagewith{babel}{english}{
    \renewcommand{\cftfigfont}{Figure }
    \renewcommand{\cfttabfont}{Table }
    \renewcommand{\contentsname}{\hfill\bfseries\LARGE INDEX}   
    \renewcommand{\cftaftertoctitle}{\hfill}
    \newcommand{\coverpagetext}[0]{
\large
   \begin{tabular}{|l|l|} \hline\hline
    {\bf PROJET:}  & {\bf \projectname} \\ \hline\hline
    {\bf Title:} & \@title \\ \hline
    {\bf Author/s:} &  \@author \\ \hline
    {\bf Revised by:} & \reviewernames \\ \hline
    {\bf Date:} & \datedetailsname \\ \hline
    {\bf State:} & \statename \\ \hline
    {\bf Internal Reference:} & \referencenametable \\ \hline\hline
    \end{tabular}
    \end{centering}
    
    
%        \LARGE
%        \textbf{TECHNICAL REPORT}\\ [1cm]
%	   
%	   \Large
%    	\@title \\[2cm] 
%    	
%    	%------------------------------------------------
%    	%	Author(s)
%    	%------------------------------------------------
%    	\large
%    	\@author \\[2.0cm]
%
%        Prepared by IIT for \@clientcompany \\[2.0cm]
%
%        \normalsize
%        \@date \\ [0.5cm]
%
%        Version: \@version \\ [1.5cm]
    }
}{}
}

\usepackage{pdfpages}
\AtEndDocument{
    \newpage
    \includepdf{classfiles/figures/lastpage.pdf}
}

%%%%% Set page spacings
\usepackage[left=2.1cm, right=2.1cm, top=2.5cm, bottom=2.5cm, includefoot]{geometry}

\usepackage{tocloft}
\renewcommand{\cftsecfont}{\bfseries}


\usepackage{titlesec}
\renewcommand{\cftsecfont}{\large\bfseries}  % \section font in ToC
\renewcommand{\cftsubsecfont}{\normalsize}     % \subsection font in ToC

%%%%%%% Colors
\definecolor{gamboge}{rgb}{0.89, 0.61, 0.06}
\definecolor{aurometalsaurus}{rgb}{0.43, 0.5, 0.5}

%%%%%%%%%%%% IF YOU USE Chapters (report) you have to change the following two things
%%%%%% Format Captions of figures and Tables
\renewcommand{\thefigure}{\arabic{figure}} % set caption label style to 1-1

\renewcommand{\thetable}{\arabic{table}}
%%%%%% Changes needed
%\renewcommand{\thefigure}{\thechapter-\arabic{figure}} % set caption label style to 1-1
%\renewcommand{\thetable}{\thechapter-\arabic{table}}
%%% Changes finish 

%%%%%% Format headings
\titleformat{\chapter}[hang] 
{\normalfont\huge}{\thechapter}{1em}{} [{\titlerule[0.0pt]}]
\titlespacing*{\chapter}{0pt}{0pt}{40pt}

\titleformat{\section}
{\normalfont\Large\bfseries\color{black}\vspace{0cm}}{\thesection}{16pt}{\Large \vspace{0cm}}
\titlespacing*{\section}{\parindent}{1ex}{1em}

\titleformat{\subsection}
{\normalfont\Large\bfseries\color{black}\vspace{0cm}}{\thesubsection}{14pt}{\Large \vspace{0cm}}
\titlespacing*{\subsection}{\parindent}{1ex}{1em}

\titleformat{\subsubsection}
{\normalfont\Large\bfseries\color{black}\vspace{0cm}}{\thesubsubsection}{12pt}{\Large \vspace{0cm}}
\titlespacing*{\subsubsection}{\parindent}{1ex}{1em}

%%%% Headers and footers
\usepackage{fancyhdr}

\fancypagestyle{titlefooter}{%
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \renewcommand\footrulewidth{0pt}
    \fancyfoot[C]{\vspace{-0.5cm}\ \\ \color{white} \textbf{Rey Francisco, 4. 28008 Madrid.   Tel +34 91 542 28 00} \\  \color{aurometalsaurus}\Large iit.comillas.edu}
}

\fancypagestyle{fancy}{
    \fancyhf{}
    \renewcommand\headrulewidth{0.1pt}
    \setlength{\headheight}{48.93pt}
    \setlength{\topmargin}{-35pt}
    \setlength{\headsep}{10pt}
    \rhead{\includegraphics[width=0.2\linewidth]{classfiles/figures/IIT Logo.pdf} \vspace{-5mm}}
    \lhead{\minipage[b]{.7\linewidth}\small \textit{\Title}\endminipage}
    
    \fancyfoot[LE,RO]{\small \textit{\thepage}}
    \fancyfoot[RE,LO]{\small \textit{\Date}}
}
\pagestyle{fancy}
    

\renewcommand{\headruleskip}{6mm} 
\renewcommand{\footruleskip}{3mm}
\renewcommand{\headrulewidth}{0.05mm}



\renewcommand{\maketitle}{%
\begin{titlepage}
    \thispagestyle{titlefooter}
    \begin{center}
       \includegraphics[width=0.7\linewidth]{classfiles/figures/IIT Logo.pdf}\\[2.5cm]
       
       
	   \coverpagetext
        
        
        \AddToShipoutPictureBG*{%
          \AtPageLowerLeft{%
            \color{gamboge}%
            \rule{\paperheight}{0.11\paperwidth}%
          }%
        }%
        
\newpage
        \thispagestyle{empty}
        \phantom{\textsc{\LARGE Institution Name}}\\ [15cm]
            \fbox
            {
            \begin{minipage}{\linewidth} 
            
                \vspace{2mm}
                \@ifpackagewith{babel}{spanish}{
                    \footnotesize
                    \textbf{Titularidad y responsabilidad} \\[0.8cm]
                    El derecho de autor corresponde a los miembros del equipo investigador, los cuales deberán ser citados en cualquier uso que se haga del resultado de su trabajo. \\[0.8cm]            
                    Conforme a los usos de la comunidad científica, las conclusiones y puntos de vista reflejados en los informes y resultados son los de sus autores y no comprometen ni obligan en modo alguno a la Universidad Pontificia Comillas ni a ninguno de sus Centros e Institutos o al resto de sus profesores e investigadores. \\[0.8cm]
                    Por tanto, cualquier cita o referencia que se haga de este documento deberá siempre mencionar explícitamente el nombre de los autores, y en ningún caso mencionará exclusivamente a la Universidad.
                }{}
                \@ifpackagewith{babel}{english}{
                    \footnotesize
                    \textbf{Ownership and Responsibility} \\[0.8cm]
                    The copyright of this work corresponds to the members of the research team, which must be referenced in any use of its results. \\[0.8cm]
                    The conclusions and opinions expressed in this report belong exclusively to the authors, and do not compromise to any extent Comillas Pontifical University or any of its Centers, Institutes, Professors or Researchers. \\[0.8cm]
                    Therefore, any appointment or referral to this document should always explicitly mention the names of the authors and in no case shall mention only the University.
                }{}
                \vspace{2mm}
            \end{minipage}
            }
            
   \end{center}
\end{titlepage}


\pagenumbering{arabic}

}