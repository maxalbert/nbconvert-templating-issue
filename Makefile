BASENAME ?= minimal_example

all: convert-with-template-1 convert-with-template-2 convert-with-template-3 convert-with-template-4


convert:
	ipython nbconvert --to pdf $(BASENAME).ipynb --output $(BASENAME)_out

convert-with-template-%:
	ipython nbconvert --to pdf --template template_$*.tplx $(BASENAME).ipynb --output $(BASENAME)_out_$*

clean:
	rm -rf $(BASENAME)_out*.pdf $(BASENAME)_out*_files
