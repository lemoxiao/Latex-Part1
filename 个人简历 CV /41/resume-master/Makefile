TYPESETTER = xelatex
EXPORTDIR = export

$(EXPORTDIR)/JoshuaRLiResume.pdf: JoshuaRLiResume.tex
	mkdir -p $(EXPORTDIR)
	$(TYPESETTER) -output-directory=$(EXPORTDIR) $<

clean:
	rm -rf $(EXPORTDIR) *.log
