DISSERTACAO=./texDissertacao/
SLIDES=./texSlides/





dissertacao: PDFLATEX
	evince cap.pdf&

PDFLATEX: LATEX1
	pdflatex -synctex=1 -interaction=nonstopmode $(DISSERTACAO)cap


LATEX1: NOMENCLATURA BIB
	pdflatex $(DISSERTACAO)cap

BIB: LATEX0
	bibtex cap

NOMENCLATURA: LATEX0 cap.nlo
	makeindex cap.nlo -s nomencl.ist -o cap.nls

LATEX0: $(DISSERTACAO)cap.tex $(DISSERTACAO)macros.tex
	pdflatex $(DISSERTACAO)cap	





slides: SLIDES1
	rm -f beamercolorthemeufrn.sty
	evince slides.pdf &

SLIDES1: BIBSLIDES SLIDES0
	pdflatex $(SLIDES)slides.tex

BIBSLIDES: SLIDES0
	bibtex slides

SLIDES0: $(SLIDES)slides.tex
	cp ./texSlides/beamercolorthemeufrn.sty .
	pdflatex $(SLIDES)slides.tex





clean:
clear:
	rm -f *.aux
	rm -f ./texSlides/*.aux
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.blg
	rm -f *.ilg
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.nav
	rm -f *.nlo
	rm -f *.nls
	rm -f *.out
	rm -f *.pdf
	rm -f *.run.xm
	rm -f *.run.xml
	rm -f *.toc
	rm -f *.synctex.gz
	rm -f *.snm
	rm -f *~
