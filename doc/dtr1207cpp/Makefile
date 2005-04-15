
SOURCE=boken.xml

XSLTPROC=/sw/bin/xsltproc
FOP=/Users/jonas/fop-0.20.5/fop.sh

html:
	$(XSLTPROC) \
	   --output dtr1207cpp.html \
	   docbookx.xsl \
	   $(SOURCE)

pdf:
	$XSLTPROC \
	   --output dtr1207cpp.fo \
	   /fo/docbook.xsl \
	   $SOURCE
	$FOP -fo dtr1207cpp.fo -pdf dtr1207cpp.pdf


