THIS_FILE = $(lastword $(MAKEFILE_LIST))
AUTHOR = Mikhail f. Shiryaev

.PHONY: help clean dvi

clean-all: clean
	@rm -f *pdf

clean:
	@rm -f *.aux *.log *.out

help:
	@echo 'Usage: make AUTHOR="$(AUTHOR)" $$JOB_TITLE'
	@echo ' Will produce "$$JOB_TITLE - $(AUTHOR).pdf" file'

# By some reason, vim autocommand executes `make "dvi"`
dvi:

%:
	@$(MAKE) -f $(THIS_FILE) JOBNAME='$@' '$(AUTHOR) - $@.pdf'

%.pdf: main.tex
	lualatex --jobname='$(JOBNAME)' $<
	mv '$(JOBNAME).pdf' '$@'
