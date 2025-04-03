%%% RNTI.cls document class for RNTI %%%%%%%

\newcommand\@RNTIversion{2008/12/17 v3.0d}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rnti}[\@RNTIversion LaTeX document class for RNTI]
%^^J LaTeX document class for RNTI]
%\typeout{RNTI \@RNTIversion  (c) G.Ritschard}

%%% Required external packages and files:

%% Files available on CTAN, that are not automatically distributed with LaTeX2e:
%% - times.sty
%% - fancyhdr.sty       for handling page headers and footers
%% - natbib.sty         for handling authoryear citations

%% Standard files distributed with LaTeX2e:
%% - fontenc.sty
%% - ifthen.sty
%% - babel.sty
%  Ensure the language.dat file used by Babel is configured for
%  activating both French and English hyphenation. After modification,
%  rebuild your LaTeX fmt file by initexing it.

%%% For building reference list, use of the accompanying RNTI.bst file.


\RequirePackage[T1]{fontenc}
\RequirePackage{color} %%gr% v3
%\RequirePackage[latin1]{inputenc}
\RequirePackage{ifthen}


 \newboolean{@sametabname}\setboolean{@sametabname}{true}
 \newboolean{firstindent}\setboolean{firstindent}{true}
 \newboolean{@endbiblio}\setboolean{@endbiblio}{false}
 \newboolean{@english}
 \newboolean{@@french}
 \newboolean{@natbib}\setboolean{@natbib}{true}
 \newboolean{@babel@ok}\setboolean{@babel@ok}{true}
 \newboolean{@hyper@ref}\setboolean{@hyper@ref}{false}
 \newboolean{@page@num}\setboolean{@page@num}{false}
 \newboolean{@print@footer}\setboolean{@print@footer}{false}
 \newboolean{@old@fancyhdr}\setboolean{@old@fancyhdr}{false}
 \newboolean{@langdep@and}\setboolean{@langdep@and}{false}
 \newboolean{@show@rnti@layout}\setboolean{@show@rnti@layout}{false}
 \newboolean{@no@summary}\setboolean{@no@summary}{false}
 \newboolean{@no@resume}\setboolean{@no@resume}{false}
 \newboolean{@no@authorname}\setboolean{@no@authorname}{false}
 \newcommand\@@dash{\textendash}

\DeclareOption{french}{
  \setboolean{@english}{false}
}
\DeclareOption{english}{
  \setboolean{@english}{true}
}
\DeclareOption{nonatbib}{
  \setboolean{@natbib}{false}
}
\DeclareOption{nobabel}{
  \setboolean{@babel@ok}{false}
}
\DeclareOption{hyperref}{
  \setboolean{@hyper@ref}{true}
}
\DeclareOption{pagenum}{
  \setboolean{@page@num}{true}
  \setboolean{@print@footer}{true}
}
\DeclareOption{footer}{
  \setboolean{@print@footer}{true}
}
\DeclareOption{oldfancyhdr}{
  \setboolean{@old@fancyhdr}{true}
}
\DeclareOption{langdepand}{
  \setboolean{@langdep@and}{true}
}
\DeclareOption{showlayout}{
  \setboolean{@show@rnti@layout}{true}
}
\DeclareOption{altdash}{
   \renewcommand\@@dash{$-$}
}
\DeclareOption{noresume}{
   \setboolean{@no@resume}{true}
}
\DeclareOption{nosummary}{
   \setboolean{@no@summary}{true}
   \setboolean{@no@resume}{true}
}
\DeclareOption{submission}{
   \setboolean{@no@authorname}{true}
}


 \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \ExecuteOptions{french}
 \ProcessOptions
 \LoadClass[10pt,twoside,a4paper]{article}
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% The summary is automatically outputed at the \end{dcoument}
\AtEndDocument{%
  \@@summary\@after@summary\@@show@rnti@layout%
} %% should be placed before loading hyperref


\ifthenelse{\boolean{@hyper@ref}}
      {\RequirePackage{hyperref}}
      {}
\newcommand\@@show@rnti@layout{}
\ifthenelse{\boolean{@show@rnti@layout}}
      {\RequirePackage{layout}%
       \renewcommand\@@show@rnti@layout{\cleardoublepage\layout}}
      {}


%\RequirePackage[latin1]{inputenc}
%%\RequirePackage[french]{babel}   %% removed by G
%%\RequirePackage[dvips]{epsfig}   %% removed by G, does not work with pdflatex

%%\usepackage{RNTIBiblio}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page Format %%%%%%%%%%%%%%%

\RequirePackage{times}

\setlength{\textwidth}{13.2cm}
\setlength{\textheight}{19.3cm}

%%% Margins for centering the text on the page
% A4 paper width is 21cm, hence total margin is 21cm - 13.2cm = 7.8cm
% leftmargin is 7.8cm/2 = 3.9cm, subtracting the 1in = 2.54cm offset,
% we get 1.36cm for \oddsidemargin
\setlength{\oddsidemargin}{1.36 cm}
\setlength{\evensidemargin}{1.36 cm}
% For Letter paper, width is 11in = 21.59cm, hence
% the \oddsidemargin should be set to 1.36 + .295 = 1.655cm

% Vertically: (1pt = 0.351mm)
% A4 paper height is 29.7cm = 845pt,
% total printed page height is 19.3cm (= 549pt) + \headsep + \headheight + \footskip
% with \headsep = 25pt, \headheight = 12pt, and \footskip = 30pt
% hence total margin is 845pt (= 29.7cm) - 549pt - 67pt = 229pt
% Topmargin is 229pt/2 = 114.5pt = 4.02cm, subtracting the 1in = 2.54cm offset,
% we get 1.48cm for \topmargin
\setlength{\topmargin}{1.48 cm}

% Increase these values to make it harder to leave
% a single line at the end (club) or top (widow) of the page.
 \clubpenalty=6000
 \widowpenalty=6000


%%%%%%%%%%%% Redefining some commands and environments

%resume
\renewenvironment{abstract}{%
      \list{}{\leftmargin=1cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries \nom@resume.]}
    {\endlist}


 %\renewcommand\subsubsection{\paragraph}


%%%%% French guillemets %%%%%%%%
   \def\guilo{\guillemotleft\kern .25ex\ignorespaces}
   \def\guilf{\kern .25ex\guillemotright}


%%%% language switching %%%


% Commands \Fr and \Eng for switching to French and English
% They use the Babel's \selectlanguage
% and redefine language specific actions
% of RNTI's special commands

 \newcommand{\andname}{et}        %% used in bib produced by RNTI.bst
 \newcommand{\andnamec}{et}
 \providecommand\nom@resume{R\'{e}sum\'{e}}
 \providecommand\nom@summary{Summary}

 \newcommand\Fr{\selectlanguage{french}\lccode`\'=`\'%
    \ifthenelse{\boolean{@endbiblio}}
        {\renewcommand{\bibname}{Bibliographie}}%
        {\renewcommand{\bibname}{R\'{e}f\'{e}rences}}%
    \renewcommand{\nom@resume}{R\'{e}sum\'{e}}%
    \renewcommand{\nom@summary}{R\'{e}sum\'{e}}%
    %\renewcommand{\nom@cles}{Mots-cl\'{e}s~:}%
    %\renewcommand{\nom@classif}{Classification~:}%
    \ifthenelse{\boolean{@langdep@and}}
        {\renewcommand\andname{et}}%
        {}%
    \ifthenelse{\boolean{@sametabname}}%
        {\renewcommand{\figurename}{\commonfigurename}%
         \renewcommand{\tablename}{\commontablename}%
        }{%\renewcommand{\figurename}{Figure}%
         %\renewcommand{\tabname}{Tableau}%
        }
    % indentation after section title
    \ifthenelse{\boolean{firstindent}}
        {\let\@afterindentfalse\@afterindenttrue}
        {}%
    \setboolean{@@french}{true}
    }
 \newcommand\Eng{\selectlanguage{english}\lccode`\'=0%
    \ifthenelse{\boolean{@endbiblio}}
        {\renewcommand{\bibname}{Bibliography}}%
        {\renewcommand{\bibname}{References}}%
    \renewcommand{\nom@resume}{Abstract}%
    \renewcommand{\nom@summary}{Summary}%
    %\renewcommand{\nom@cles}{Keywords:}%
    %\renewcommand{\nom@classif}{Classification:}%
    \ifthenelse{\boolean{@langdep@and}}
        {\renewcommand\andname{and}}%
        {}%
    \ifthenelse{\boolean{@sametabname}}%
        {\renewcommand{\figurename}{\commonfigurename}%
         \renewcommand{\tablename}{\commontablename}%
        }{%\renewcommand{\figurename}{Figure}%
         %\renewcommand{\tabname}{Table}%
        }
    % indentation after section title
    \ifthenelse{\boolean{firstindent}}
        {\let\@afterindentfalse\@afterindenttrue}
        {}%
    \setboolean{@@french}{false}
    }

%%%%% Bibliography stuff %%%%%%%%%%%%%

%\Requirepackage{RNTIBiblio} % Now obsolete
\ifthenelse{\boolean{@natbib}}
    {\RequirePackage{natbib}} % default for managing author(year) citations
    {}
%
\ifthenelse{\boolean{@babel@ok}}
    {\RequirePackage[english,frenchb]{babel}} %% Babel should be loaded AFTER natbib.
    {}
%
\bibsep=.7ex

%GR% Redefining caption format

 \newcommand*{\commonfigurename}{\scshape{Fig.}}
 \newcommand*{\commontablename}{\scshape{Tab.}}
 \newcommand*{\caphsep}{\normalfont\hskip .6ex\@@dash\hskip .3ex}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\normalsize {#1\caphsep} {\normalfont\itshape #2}}}%
  \ifdim \wd\@tempboxa >\hsize
    %\begin{spacing}{\capspacing}{
    %{\normalsize {\bfseries{#1\caphsep}}
    {\normalsize {#1\caphsep}  % suppressed bold 27/11/07gr
    {\normalfont\itshape #2}}
    %}\end{spacing}%GR% requires setspace.sty
    \par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%%%%% Handling headers and footers %%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\ifthenelse{\boolean{@old@fancyhdr}}
    {\setlength{\headrulewidth}{0 pt}\setlength{\footrulewidth}{0  pt}}
    {\renewcommand{\headrulewidth}{0 pt}\renewcommand{\footrulewidth}{0 pt}}

%%%%%%%%%%%%%%%% Defining commands for title and author names. %%%%
\fancyhead{} \fancyfoot{}
\newcommand\@titre{Titre court \`{a} d\'{e}finir avec \texttt{$\backslash$titre\{Votre titre\}} dans le pr\'{e}ambule}
\newcommand\@auteur{}
\newcommand\@affiliation{}
\fancyhead[LE]{Titre court \`{a} d\'{e}finir avec \texttt{$\backslash$titrecourt\{...\}}}
\newcommand*\titrecourt[1]{\fancyhead[LE]{#1}}
\fancyhead[RO]{Liste courte des auteurs \`{a} d\'{e}finir avec \texttt{$\backslash$nomcourt\{...\}}}
\newcommand*\nomcourt[1]{\fancyhead[RO]{%
        \ifthenelse{\boolean{@no@authorname}}{\newbox\b@nomcourt\setbox\b@nomcourt=\hbox{#1}\hskip\wd\b@nomcourt}{#1}}} %%gr% v3.0
\newcommand*\@domaine{X}
\newcommand\@the@page@{~}
\newcommand\domaine[1]{\renewcommand\@domaine{#1}}
\ifthenelse{\boolean{@page@num}}%
        {\renewcommand\@the@page@{\thepage}}
        {}
\ifthenelse{\boolean{@print@footer}}
        {\fancyfoot[LE,RO]{RNTI - \@domaine{} - \@the@page@}}
        {}
\newcommand\titre[1]{\renewcommand\@titre{#1}}
\newcommand\auteur[1]{\renewcommand\@auteur{#1}}%
\newcommand\affiliation[1]{\renewcommand\@affiliation{#1}}
\newcommand*\affilsep{$^,$}
\newcommand*\affil[1]{%
   $^{\ifcase#1\or{*}\or{**}\or{***}\or{****}
               \or{\sharp}\or{\sharp\sharp}\or{\sharp\sharp\sharp}
               \or{\sharp\sharp\sharp\sharp}\fi}$}
\newcommand\http[1]{%
    \ifthenelse{\boolean{@@french}}%
    {\noextrasfrench{#1}\extrasfrench}%
    {#1}%
    }

\newcommand\gen@titre{
    \vspace*{4mm}\noindent%
    \parbox{\linewidth}{\center\Large%
       \textbf{\@titre}}%
    \\[1ex]
    \begin{center}
    \ifthenelse{\boolean{@no@authorname}}{%
       \newbox\b@entete\setbox\b@entete=\vbox{%
        \@auteur%
        \\[3ex]
        \begin{tabular}{c}
        \@affiliation
        \end{tabular}
        }\vskip\ht\b@entete \vskip\dp\b@entete%}
		}
        {%
        \@auteur%
        \\[3ex]
        \begin{tabular}{c}
        \@affiliation
        \end{tabular}%
        }
    \vspace{1ex}
    \end{center}
}

\newcommand\@resume{Donner le texte qui doit figurer ici
    avec la commande
    \texttt{$\backslash$resume\{Votre r\'{e}sume ...\}}
    dans le pr\'{e}ambule
    (avant le \texttt{$\backslash$begin\{document\}}).
    }
\newcommand\resume[1]{\renewcommand\@resume{#1}}
\newcommand\@@resume{%
\ifthenelse{\boolean{@no@resume}}{\medskip}{%
 \begin{abstract}\@resume\end{abstract}
 }
}

\newcommand\@summary{Donner la traduction anglaise du r\'{e}sum\'{e}
    dans le pr\'{e}ambule avec la commande
    \texttt{$\backslash$summary\{Your abstract ...\}}}
\newcommand\summary[1]{\renewcommand\@summary{#1}}

\newcommand\@@summary{%
  \ifthenelse{\boolean{@no@summary}}{}{%
    \ifthenelse{\boolean{@english}}{\Fr}{\Eng}
    \section*{\nom@summary}\@summary{}
    \ifthenelse{\boolean{@english}}{\Eng}{\Fr}%
    }
}

\newcommand\@after@summary{}
\newcommand\aftersummary[1]{\renewcommand\@after@summary{#1}}

%%%% The title stuff is automatically outputed at the \begin{dcoument}
\AtBeginDocument{%
  \thispagestyle{empty}
  \ifthenelse{\boolean{@english}}
  {\Eng\renewcommand\andnamec{and}\renewcommand\andname{and}}{\Fr}%
  \gen@titre%
  \@@resume%
}
