#
#
#
#
SOURCE_FILES=book.xml ch_introduktion.xml ch_datorer.xml ch_openoffice.xml ch_calc.xml ch_lagar.xml app_tack.xml app_lankar.xml fdl-sv.xml
TARGET=book

DATE=$(shell date +"%Y-%m-%d %H:%M:%S")
VERSION=$(shell gawk '/<revnumber>.*<\/revnumber>/ { match($$0, />(.*)</, arr); print arr[1]}' ${TARGET}.xml)

TITLE="Datorkunskap A (DAA1201)"
BASE_FILE_NAME=$(TARGET)

export SP_ENCODING=UTF-8

.PHONY: index.html

all: html index.html ps pdf dist 

pub: all

$(TARGET).tar.gz: $(SOURCE_FILES)
	mkdir $(TARGET)
	cp $(SOURCE_FILES) $(TARGET)
	tar -czf $(TARGET).tar.gz $(TARGET)
	rm -rf $(TARGET)

dist: $(TARGET).tar.gz

laborations: $(LABORATIONS)

html: book.html

book.html: $(SOURCE_FILES)
	docbook2html -d fritis.dsl#html $<

ps: $(TARGET).ps

$(TARGET).ps: $(SOURCE_FILES)
	docbook2ps -V tex-backend -d fritis.dsl#print $<

#$(TARGET).pdf: $(SOURCE_FILES)
#	docbook2pdf -V tex-backend -d fritis.dsl#print $<


pdf: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).ps
	ps2pdf $(TARGET).ps


index.html: index.in
	cat index.in | sed s/__TITLE__/$(TITLE)/ | \
	sed s/__BASE_FILE_NAME__/$(BASE_FILE_NAME)/g  | \
	sed s/__DATE__/'$(DATE)'/g | \
	sed s/__VERSION__/'$(VERSION)'/g > index.html

clean:
	rm -f *.html $(TARGET).ps $(TARGET).pdf $(TARGET).tar.gz
