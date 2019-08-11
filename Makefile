# Makefile für die Anfihefte

# Diese Variablen sollten für die aktuelle Version stimmen, müssen aber ggf.
# angepasst werden (am besten über Shell-Variablen, z. B. "export YEAR=2017"
# und "unset YEAR" zum Zurücksetzen):
YEAR = $(shell date '+%Y')
# Das Semester ist um 2 Monate nach vorne verschoben, da wir die Briefe ja vor
# dem entsprechenden Semester aktualisieren wollen.
SEMESTER = $(shell if [[ $$(date +%m) > 02 && $$(date +%m) < 07 ]]; then echo sommersemestertrue; else echo wintersemestertrue; fi)

# Variablen für die Build-Ordner
TMPDIR = tmp

# set the base year for calculating the auflage
BASEYEAR = 2018
BASEEDITION_INFO = 30
BASEEDITION_KOGNI = 3

CONFIG = makeconfig.tex

# automatically set the build parameters like year, semester, auflage and if the kogni or info build should be done
CONF_INFOTRUE = \infotrue
INFO_AUFLAGE = $(shell if [ $(SEMESTER) = "wintersemestertrue" ]; then echo $$(( $(( $(( $(YEAR)-$(BASEYEAR) )) *2 )) +$(BASEEDITION_INFO))); else echo $$(( $(( $(YEAR)-$(BASEYEAR) )) + $(BASEEDITION_INFO))); fi)
INFO_CONF = '\jahr=$(YEAR) \auflage=$(INFO_AUFLAGE) \$(SEMESTER) $(CONF_INFOTRUE)'

KOGNI_AUFLAGE = $(shell echo $$(( $(( $(YEAR)-$(BASEYEAR) )) +$(BASEEDITION_KOGNI) )) )
KOGNI_CONF  = '\jahr=$(YEAR) \$(SEMESTER) \auflage=$(KOGNI_AUFLAGE)'
 

# Aliases
default: help
info: anfiheft-info.pdf
kogni: anfiheft-kogni.pdf

.PHONY: infoconfig
infoconfig: 
	echo $(INFO_CONF) > makeconfig.tex

.PHONY: all
all: info kogni

.PHONY: info
anfiheft-info.pdf: anfiheft.tex
	if [ ! -d $(TMPDIR)-info ]; then mkdir $(TMPDIR)-info; fi
	echo $(INFO_CONF) > makeconfig.tex
	latexmk -f -output-directory=$(TMPDIR)-info -pdf -pdflatex="pdflatex" anfiheft.tex $<
	cp tmp-info/anfiheft.pdf anfiheft-info.pdf
	cp $(CONFIG) info-$(CONFIG)
	rm makeconfig.tex

.PHONY: kogni
anfiheft-kogni.pdf: anfiheft.tex
	if [ ! -d $(TMPDIR)-kogni ]; then mkdir $(TMPDIR)-kogni; fi
	echo $(KOGNI_CONF) > makeconfig.tex
	latexmk -f -output-directory=$(TMPDIR)-kogni -pdf -pdflatex="pdflatex" anfiheft.tex $<
	cp tmp-kogni/anfiheft.pdf anfiheft-kogni.pdf
	cp $(CONFIG) kogni-$(CONFIG)
	rm makeconfig.tex

.PHONY: clean
clean:
	if [ -d $(TMPDIR)-info ]; then rm --recursive ./$(TMPDIR)-info; fi
	if [ -d $(TMPDIR)-kogni ]; then rm --recursive ./$(TMPDIR)-kogni; fi
	rm -f info-$(CONFIG)
	rm -f kogni-$(CONFIG)

.PHONY: distclean
distclean: clean
	if [ -f anfiheft-info.pdf ]; then rm anfiheft-info.pdf; fi
	if [ -f anfiheft-kogni.pdf ]; then rm anfiheft-kogni.pdf; fi

.PHONY: help
help:
	@echo 'Building targets:'
	@echo '  all            - Build the info- and kogni-anfiheft'
	@echo '  info       	- Build only the info-anfiheft'
	@echo '  kogni          - Build only the kogni-anfiheft'
	@echo 'Auxiliary targets:'
	@echo '  help           - Show this help'
	@echo 'Cleaning targets:'
	@echo '  clean          - Remove both $(TMPDIR)-Directories'
	@echo '  distclean      - Remove both $(TMPDIR)-Directories and anfiheft-*.pdf (i.e. everything)'
