cv academic: cv.tex
cover: cover.tex

cv academic cover:
	mkdir -p out
	rubber --into out --jobname $@ --pdf $<
	mv out/$@.pdf .

clean:
	rm -rf out
