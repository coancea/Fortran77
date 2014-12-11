PAPERPDF=CIVpaper.pdf
all: $(PAPERPDF)

PDFLATEX        = pdflatex -halt-on-error

%.pdf: %.tex Makefile
	$(PDFLATEX) $<
	bibtex $*
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	rm -f *~ *.dvi *.ps *.log *.aux *.bbl *.blg  *.out $(PAPERPDF)

