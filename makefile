COMPILER := latexmk #pdflatex #
FLAGSOUTPUT := -pdf
NAME := document.pdf


# watch with -pvc

all: clean
	$(COMPILER) --shell-escape   main.tex $(FLAGSOUTPUT)
	@mv main.pdf $(NAME)
	$(COMPILER) -c
	$(MAKE) mrproper

compile:
	$(COMPILER) --shell-escape   main.tex $(FLAGSOUTPUT)

zip:
	zip -r WebProgrammierung.zip makefile main.tex assets insets *.pdf

compilerA:
	pdflatex --shell-escape  main.tex
	@mv main.pdf document.pdf
	$(MAKE) mrproper


mrproper:
	@rm -f  ./main.toc ./main.aux ./main.out main.synctex.gz ./main.fdb_latexmk ./main.fls main.log  main.lof  2> /dev/null 
	@rm -rf ./_minted-main 2> /dev/null 
	@rm -rf tstex_modules


spellcheck:
	aspell --lang=es --mode=tex check main.tex
	find insets/capitulos/ -name "*.tex" -exec aspell --lang=es --mode=tex check "{}" \;

clean: 
	@rm -f ./$(NAME).pdf main.pdf document.pdf
	$(COMPILER) -C
	@rm -f *.zip
