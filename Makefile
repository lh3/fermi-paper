.SUFFIXES: .gp .tex .eps .pdf .eps.gz

.eps.pdf:
		epstopdf --outfile $@ $<

.eps.gz.pdf:
		gzip -dc $< | epstopdf --filter > $@

all:fermi.pdf

fermi.pdf:fermi.tex fermi.bib
		pdflatex fermi; bibtex fermi; pdflatex fermi; pdflatex fermi;

clean:
		rm -fr *.toc *.aux *.bbl *.blg *.idx *.log *.out *~ fermi.pdf fermi.ps fermi.dvi
