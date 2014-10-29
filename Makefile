
BIBFILE=biblio.bib

# temporary folder to avoid pollution
TMP=tmp

all: hermes_chap.pdf

hermes_chap.pdf: hermes_chap.tex

%.pdf:
	# go quick for first compilation, put "useless" files in temporary folder
	pdflatex -draftmode -output-directory $(TMP) $^
	# not sure it's many-tex-files proof
	bibtex $(TMP)/$(basename $(^))
	# one more time faking to update ref
	pdflatex -draftmode -output-directory $(TMP) $^
	# this time it's for real!
	pdflatex -output-directory $(TMP) $^
	# here is a nice pdf for us to look at
	cp $(TMP)/$@ ./

clean:
	rm -rf *.pdf $(TMP)/*

.PHONY: art clean