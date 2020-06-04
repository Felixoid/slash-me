THIS_FILE = $(lastword $(MAKEFILE_LIST))
AUTHOR = Mikhail f. Shiryaev

.PHONY: help clean

clean-all: clean
	@rm -f *pdf

clean:
	@rm -f *.aux *.log *.out

help:
	@echo 'Usage: make $$JOB_TITLE'
	@echo ' Will produce "$$JOB_TITLE - $(AUTHOR).pdf" file'

%: main.tex
	@$(MAKE) -f $(THIS_FILE) JOBNAME='$@' '$@ - $(AUTHOR).pdf'

%.pdf: main.tex
	lualatex --jobname='$(JOBNAME)' $<
	mv '$(JOBNAME).pdf' '$@'
