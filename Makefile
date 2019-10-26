
default: paper
	@echo '****************************************************************'
	@echo '**************** Did you spell-check the paper? ****************'
	@echo '****************************************************************'
coall:
	co RCS/*

ciall:
	ci -u *.tex
	ci -u *.eps

bib: paper.bbl

paper.bbl: *.tex paper.bib
	latex paper
	bibtex paper
	latex paper

paper.ps: paper.dvi
	dvips -P cmz paper.dvi -o paper.ps -t letter

paper.dvi: *.tex paper.bbl
	latex paper
	latex paper

paper.pdf: *.tex
	pdflatex paper
	pdflatex paper
mpost:
	mpost -tex=latex overview.mp

paper: *.tex
	pdflatex paper
	bibtex paper
	pdflatex paper
#	pdflatex paper
	#pdf2ps paper.pdf paper.ps

patent: patent.tex
	pdflatex patent

cover: cover.tex
	pdflatex cover
	bibtex paper
	pdflatex cover
	pdflatex cover
	pdflatex cover2

purge:
	rm -f   *.aux \
                *.bbl \
                *.blg \
                *.dvi \
                *.log \
                *.toc \
                paper.ps \
		overview.mps\
		paper.pdf

clean:
	rm -f   *.aux \
                *.bbl \
                *.blg \
                *.dvi \
                *.log \
                *.toc \
                paper.ps


