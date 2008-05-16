LC = pdflatex
BC = bibtex
PDF = Preview

.SUFFIXES: $(SUFFIXES) .dvi .bib .tex .bbl .pdf

PAPER_ROOT = oopseDoc

PICTURES   = \
	compCost.pdf \
	definition.pdf \
	heirarchy.pdf \
	lipidModel.pdf \
	quatvsdlm.pdf \
	timeStep.pdf \
	waterAngle.pdf

INFILES    = \
	oopseDoc.tex \
	oopseDoc.bib

all:: ${PAPER_ROOT}.view

${PAPER_ROOT}.pdf: ${INFILES} ${PICTURES}
	$(LC) ${PAPER_ROOT}
	$(BC) ${PAPER_ROOT}
	$(LC) ${PAPER_ROOT}
	$(LC) ${PAPER_ROOT}

${PAPER_ROOT}.view: ${PAPER_ROOT}.pdf
	osascript "reload_preview.scpt" ${PAPER_ROOT}.pdf       
	open -a $(PDF) ${PAPER_ROOT}.pdf

clean::
	/bin/rm -f *.aux *.log *.bbl *.blg *.dvi *.tbx *.fgx *~ *.fff *.lof *.lot oopseDoc.pdf *.ttt *.toc
