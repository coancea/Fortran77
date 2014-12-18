PAPERPDF=CIVpaper.pdf
all: $(PAPERPDF)

PDFLATEX        = pdflatex -halt-on-error

#	bibtex $*  rm *.bbl


%.pdf: %.tex Makefile
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	rm -f *~ *.dvi *.ps *.log *.aux *.blg  *.out

clean:
	rm -f *~ *.dvi *.ps *.log *.aux *.blg  *.out $(PAPERPDF)

