all: dist

dist: verslag.pdf
	zip codeVanGinneken.zip *.m *.fig
	cp $< verslagVanGinneken.pdf

%.pdf: %.tex
	@pdflatex $<
	@touch $<
	@pdflatex $<   

clean:
	@rm -f *~ *.log *.aux *.pyg *.synctex.gz
	@rm -f *.zip

mrproper: clean
	@rm -f *.pdf

