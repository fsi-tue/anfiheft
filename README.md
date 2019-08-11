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
Es ist darauf zu achten, dass die Anzahl der Seiten (insgesamt) durch 4 teilbar sind! Ansonsten ist 'KEEP CALM AND JOIN THE FACHSCHAFT' nicht auf der letzten Seite (auf dem Umschlag) gedruckt.
