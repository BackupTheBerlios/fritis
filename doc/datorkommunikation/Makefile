#
#
#
#
SOURCE_FILES=datorkommunikation.xml book.css docbook.dsl index.in Makefile outline.txt laborationer/lab1_hub_vs_switch.sxw fdl-sv.xml kommandotabell.xml rfcer.xml
TARGET=datorkommunikation

LABORATIONS= #laborationer/lab1_hub_vs_switch.pdf

DATE=$(shell date +"%Y-%m-%d %H:%M:%S")
VERSION=$(shell gawk '/<revnumber>.*<\/revnumber>/ { match($$0, />(.*)</, arr); print arr[1]}' ${TARGET}.xml)

TITLE="Datorkommunikation"
BASE_FILE_NAME=$(TARGET)

.PHONY: index.html

all: html index.html ps pdf dist laborations

pub: all
	chmod -R o+r,g-rwxs *
	chmod 705 laborationer
	rsync -e "ssh -l rejas" --delete --rsync-path=/kunder/r/rejas.org/bin/rsync --recursive ./ rejas.org:liskola/$(TARGET)/
	echo -e "From: Marcus Rejås <marcus@rejas.se>\\nSubject: Ny version av ${TITLE} publicerad \\nNy version publicerad ${DATE}. \\nSe http://rejas.se/liskola/${TARGET}" | /usr/sbin/sendmail selinux-cvs-liskola@se.linux.org

fdl-sv.xml: ../../licenses/fdl-sv.xml
	cp ../../licenses/fdl-sv.xml fdl-sv.xml

$(TARGET).tar.gz: $(SOURCE_FILES)
	mkdir $(TARGET)
	cp $(SOURCE_FILES) $(TARGET)
	tar -czf $(TARGET).tar.gz $(TARGET)
	rm -rf $(TARGET)

dist: $(TARGET).tar.gz

laborations: $(LABORATIONS)

html: $(SOURCE_FILES) index.html
	docbook2html -d docbook.dsl $<

ps: $(TARGET).ps

$(TARGET).ps: $(SOURCE_FILES)
	docbook2ps $<

pdf: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).ps
	ps2pdf $(TARGET).ps

laborationer/lab1_hub_vs_switch.pdf: laborationer/lab1_hub_vs_switch.sxw
	echo "You have to use OpenOffice.org to create laborationer/lab1_hub_vs_switch.pdf"
	exit -1

index.html: index.in
	cat index.in | sed s/__TITLE__/$(TITLE)/ | \
	sed s/__BASE_FILE_NAME__/$(BASE_FILE_NAME)/g  | \
	sed s/__DATE__/'$(DATE)'/g | \
	sed s/__VERSION__/'$(VERSION)'/g > index.html

clean:
	rm -f *.html $(TARGET).ps $(TARGET).pdf $(TARGET).tar.gz
