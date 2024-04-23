# DHGE Typst Vorlage
Diese Vorlage dient dazu einen perfekten Einstieg in Typst und in das Schreiben einer **Projektarbeit** bereitzustellen.

>[!WARNING]
>Die Vorlage gilt nur für Projektarbeiten. Außerdem übernehme ich keine Haftung falls doch was falsch ist 😶‍🌫️

Wenn du einen Fehler gefunden hast oder eine Optimierung vorschlagen möchtest, dann öffne gerne eine Pull Request.

## Typst
- [Webseite](https://typst.app/)
- [Docs](https://typst.app/docs/)
- [Universe](https://typst.app/universe) - Neu mit Typst `0.11` (Übersicht vieler anderer Vorlagen und Addons)

## Quellenangaben
Die DHGE hat ihr eigenes Quellenformat und an diesem Repository hängt ein weiteres Repo von [DeEskalator](https://github.com/DeEskalator), der netterweise eine CSL zur Verfügung stellt, die versucht, den DHGE-Standard weitestgehend zu implementieren. Typst unterstützt dieses Format, allerdings kann das manchmal noch zu Problemen führen.

>[!IMPORTANT]
>Das `urldate`-Feld in der `.bib` (bzw. `Zuletzt geprüft am:` in Citavi) muss im **YYYY-MM-DD** Format angegeben sein. Sonst schlucken Typst und LaTeX dieses Feld einfach und zeigen es nicht an.

### Mit LaTeX
Eine weitere Möglichkeit wäre LaTeX. Damit könntet ihr euer Quellenverzeichnis mit LaTeX erstellen und dann an die Typst PDF anhängen.

Ein **Nachteil** ist, dass die von Typst generierten Verlinkungen innerhalb des Dokuments verloren gehen. Außerdem kann mit LaTeX kein CSL verwendet werden, zumindest nicht mit BibLaTeX.

<details>
<summary>LaTeX Dokument</summary>

Das LaTeX-Dokument *sollte* alle formalen Eigenschaften erfüllen.
```latex
% Quellen.tex

\documentclass[11pt]{article}

\usepackage[utf8]{inputenc}

% Times New Roman
\usepackage{mathptmx}

%% Page counter on bottom right
\makeatletter
\renewcommand*{\ps@plain}{%
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \def\@oddfoot{%
    \reset@font
    \hfil
    \thepage
  }
  \let\@evenhead\@empty
  \let\@evenfoot\@oddfoot
}
\makeatother
\pagestyle{plain}

%%% Page Dimensions
\usepackage[
	a4paper,
	left=3cm,
	right=2cm,
	top=2.5cm,
	bottom=2.5cm
]{geometry}
\usepackage[T1]{fontenc}
\usepackage[ngerman]{babel,isodate}

% Incompatable with biblatex :(
%\usepackage{citation-style-language}

% Sources
\usepackage[
	backend=bibtex
	 ,style=alphabetic
	 ,block=none
	 ,indexing=false
	 ,citereset=none
	 ,isbn=true
	 ,url=true
	 ,doi=true
	,firstinits=true
]{biblatex}
\addbibresource{sources.bib}

\begin{document}

\section{Quellen}

% Unteres Python-Skript ausführen um Quellen hier hinzuzufügen
% z. B. \cite{Cun92}

\pagebreak

\pagenumbering{Alph}
\printbibliography[title=Literaturverzeichnis]

\end{document}
```
</details>

<details>
<summary>Python Skript zur Generierung der Cite-Keys aus eurer .bib-Datei</summary>

Hier ein kleines *(von ChatGPT generiertes)* Python Skript welches die Keys aus eurer `.bib`-Datei extrahiert und passend für oberes Tex-Dokument extrahiert.
```python
import re

def extract_keys_from_bib(bib_file):
    with open(bib_file, 'r') as file:
        bib_data = file.read()

    # Extracting keys using regular expression
    keys = re.findall(r"@.*?\{(.*?),", bib_data)

    return keys

def generate_cite_lines(keys):
    cite_lines = []
    for key in keys:
        cite_lines.append("\\cite{" + key + "}")

    return cite_lines

def main():
    bib_file = input("Enter the path to the BibLaTeX (.bib) file: ")
    keys = extract_keys_from_bib(bib_file)
    cite_lines = generate_cite_lines(keys)

    for line in cite_lines:
        print(line)

if __name__ == "__main__":
    main()
```
</details>

## To-Do
- [ ] bessere Verwendung der Vorlage durch weitere Auslagerungen
