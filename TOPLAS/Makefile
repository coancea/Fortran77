PAPERPDF=HybPredAn.pdf
all: $(PAPERPDF)

PDFLATEX        = pdflatex -halt-on-error

%.pdf: %.tex Makefile
	$(PDFLATEX) $<
	bibtex $*
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	rm -f *~ *.bbl *.log *.blg *.aux *.out

clean:
	rm -f *~ *.bbl *.log *.blg *.aux *.out $(PAPERPDF)
