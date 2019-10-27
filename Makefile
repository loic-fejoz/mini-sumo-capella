all: tnrs-mini-sumo.pdf

serve:
	python3 -m http.server 8000 --bind 127.0.0.1 

tnrs-mini-sumo.md: tnrs-mini-sumo.requirement requirement2markdown.xsl
	xsltproc requirement2markdown.xsl tnrs-mini-sumo.requirement > $@

tnrs-mini-sumo.adoc: tnrs-mini-sumo.requirement requirement2asciidoc.xsl
	xsltproc requirement2asciidoc.xsl tnrs-mini-sumo.requirement > $@

tnrs-mini-sumo.pdf: tnrs-mini-sumo.adoc
	asciidoctor-pdf -o $@ $<

clean:
	rm -f *~ tnrs-mini-sumo.md tnrs-mini-sumo.pdf tnrs-mini-sumo.adoc
