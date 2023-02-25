# fsi-anfiheft

Dies ist der Sourcecode für das Anfängerheft für Studierende im ersten Semester
der Informatik, Kognitionswissenschaft, Bioinformatik, Medizininformatik,
Medieninformatik und Informatik-Lehramt Studiengänge der Universität Tübingen.

Dinge, die jedes Semester aktualisiert werden müssen:
- `config.tex`: Alle enthaltenen Einträge
- `info/vorlesungszeit/unikino.tex`: Spielplan des Uni-Kinos

Dinge, die jedes Semester überprüft und ggf. aktualisiert werden müssen:
- `info/adressen.tex`: Liste der aktuellen Professoren, etc.
- `info/studienplaene/*`: Studienverlaufspläne
- `info/fachschaft.tex`: Kontakte der anderen Fachschaften überprüfen

Nutzung des Makefiles:
- `make help` ;)
- `make info` => Infoheft erstellen
- `make kogni` => Kogniheft erstellen
- `make all` => beide Hefte erstellen (nur im Wintersemester sinnvoll)
- `make kki/dump.csv` => Um den DB-Dump des KKI zu über `curl` zu aktualisieren

Wenn Nutzung des Makefiles nicht möglich (z.B. Windows):
- Siehe `makeconfig.default.tex`

## Wichtig

Es ist darauf zu achten, dass die Anzahl der Seiten (insgesamt) durch 4 teilbar
sind! Ansonsten ist 'KEEP CALM AND JOIN THE FACHSCHAFT' nicht auf der letzten
Seite (auf dem Umschlag) gedruckt. Die Seitenzahl kann mit `make check` geprüft
werden (erfordert `pdfinfo` von Xpdf).

### Pakete (Stand: Februar 2023)
- Zum benutzen der Makefile müssen auf allen Distributionen die Pakete `make` und `latexmk` (Ubuntu, auf Archlinux reicht `pdftk`) installiert sein

#### Archlinux und Derivate
- texlive-bin (automatisch als Abhängigkeit der Unteren)
- texlive-core (automatisch als Abhängigkeit der Unteren)
- texlive-latexextra
- texlive-pictures
- texlive-fontsextra

#### Ubuntu, Debian und Derivate
- tex-common (automatisch als Abhängigkeit der Unteren)
- texlive-base (automatisch als Abhängigkeit der Unteren)
- texlive-binaries (automatisch als Abhängigkeit der Unteren)
- texlive-latex-base (automatisch als Abhängigkeit der Unteren)
- texlive-lang-german
- texlive-fonts-recommended
- texlive-latex-extra
- texlive-fonts-extra

## Private Subversion history

FSI members can also obtain the private history from Subversion by issuing the
following 3 commands inside of this repository (`git-svn` must be installed):

```bash
git svn init --stdlayout --prefix=svn/ https://projects.fsi.uni-tuebingen.de/svn/anfiheft
# The following requires an FSI SVN account and will take quite a few (10+) minutes:
git svn fetch
# Last revision:
# r578 = 358b8a2535167da7f280785010adcef69818278d (refs/remotes/svn/trunk)
git replace --graft 443a15654ad9c0d28eef6a086ea56596c78358c9 358b8a2535167da7f280785010adcef69818278d
```

Git can then be used exactly like before but `git-log`, `git-blame`, etc. will
be aware of the full history.
