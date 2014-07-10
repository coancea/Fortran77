PAPERPDF=ParFortran.pdf
all: $(PAPERPDF)

PDFLATEX        = pdflatex -halt-on-error

%.pdf: %.tex Makefile
	$(PDFLATEX) $<
	bibtex $*
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	rm -f *~ *.dvi *.ps *.log *.aux *.bbl *.blg  *.out $(PAPERPDF)
#	rm -f *~ *.{dvi,ps,log,aux,eps,mps,mp,bbl,blg,0,d,dp,out} $(PAPERPDF)
