#
#
#
#
SOURCE=programmeringAB.xml
SOURCE_FILES=book.css docbook.dsl index.in Makefile outline.txt programmeringAB.xml style.dsl fdl-sv.xml

TITLE="Programmering i PHP"
BASE_FILE_NAME="programmeringAB"

DATE=$(shell date +"%Y-%m-%d %H:%M:%S")

.PHONY: index.html

all: html index.html ps pdf dist

pub: all
	chmod -R o+r,g-rwxs *
	rsync -e "ssh -l rejas" --delete --rsync-path=/kunder/r/rejas.org/bin/rsync --recursive ./ rejas.org:liskola/programmeringab/

programmeringAB.tar.gz: $(SOURCE_FILES)
	mkdir programmeringAB
	cp $(SOURCE_FILES) programmeringAB
	tar -czf programmeringAB.tar.gz programmeringAB
	rm -rf programmeringAB

dist: programmeringAB.tar.gz

html:
	docbook2html -d docbook.dsl $(SOURCE)



ps: programmeringAB.ps

programmeringAB.ps: $(SOURCE)
	docbook2ps $(SOURCE)

pdf: programmeringAB.pdf

programmeringAB.pdf: programmeringAB.ps
	ps2pdf programmeringAB.ps

index.html: index.in
	cat index.in | sed s/__TITLE__/$(TITLE)/ | \
	sed s/__BASE_FILE_NAME__/$(BASE_FILE_NAME)/g  | \
	sed s/__DATE__/"$(DATE)"/g > index.html

clean:
	rm -f *.html programmeringAB.ps programmeringAB.pdf programmeringAB.tar.gz
