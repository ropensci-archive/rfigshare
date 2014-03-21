
all:
	make README.md
	make ../../../README.md
	make ../../../vignettes/README.Rmd

README.md: README.Rmd 
	Rscript -e 'require(knitr); knit("README.Rmd")'

../../../README.md: README.md
	cp README.md ../../../README.md
	sed -i 's/```r/```coffee/' ../../../README.md

../../../vignettes/README.Rmd: README.Rmd
	cp README.Rmd ../../../vignettes/README.Rmd



