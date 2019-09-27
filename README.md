# fsi-anfiheft
Dies ist der Sourcecode für das Anfängerheft für Studierende im ersten Semester der Informatik, Kognitionswissenschaft, Bioinformatik, Medizininformatik, Medieninformatik und Informatik-Lehramt Studiengänge der Universität Tübingen.

Dinge, die jedes Semester geupdated werden müssen:
- sommersemester bzw. wintersemester auf true setzen
- Nummer der Auflage um Eins erhöhen (Vorsicht bei Info und Kogni)
- Spielplan des Uni-Kinos

Dinge, die jedes Semester überprüft und ggf. geupdated werden müssen:
- Liste der aktuellen Professoren und Dozenten
- Studienverlaufspläne

Nutzung des Makefiles:
- make help ;)
- make info => infoheft erstellen
- make kogni => kogniheft erstellen
- make all => beide hefte erstellen (nur im Wintersemester sinnvoll)

Wenn Nutzung des Makefiles nicht möglich (z.B. Windows):
- siehe makeconfig.default.tex

## Wichtig

Es ist darauf zu achten, dass die Anzahl der Seiten (insgesamt) durch 4 teilbar
sind! Ansonsten ist 'KEEP CALM AND JOIN THE FACHSCHAFT' nicht auf der letzten
Seite (auf dem Umschlag) gedruckt. Die Seitenzahl kann mit `make check` geprüft
werden.

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
