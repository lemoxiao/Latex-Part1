# Automatiser la compilation du document en utilisant un  Makefile.
# Pour un fichier $(DOC).tex, le Makefile suivant réalise dans l'ordre :
#
#    * une compilation latex pour faire le .aux pour créer la bibliographie ;
#    * la compilation de génération de l'index ;
#    * le formatage de l'index ;
#    * les deux compilations de génération et d'inclusion de la table des matières ;
#    * la conversion du document au format PostScript.

#-------------------------
# variables
#-------------------------
DOC = these#root du repertoire thèse

TEX_FILES =	./remerciements/remerciements.tex \
                ./introduction/introduction.tex \
                ./chapitre1/chapitre1.tex \
                ./chapitre2/chapitre2.tex \
                ./chapitre3/chapitre3.tex \
                ./conclusion/conclusion.tex \
		./glossaire/glossaire.tex \
		./resume/resume.tex

#-------------------------
# commandes de compilation
#-------------------------
default: $(DOC).ps

quick: $(DOC).tex $(TEX_FILES)
	latex $(DOC)

$(DOC).ps : $(DOC).dvi
	dvips -Pcm-super $(DOC).dvi -o $(DOC).ps

$(DOC).dvi : $(DOC).ind $(DOC).bbl
	latex $(DOC)
	latex $(DOC)

$(DOC).ind : $(DOC).idx $(DOC).ist
	makeindex -s $(DOC).ist $(DOC).idx

$(DOC).idx : $(DOC).tex $(TEX_FILES)
	latex $(DOC)

$(DOC).bbl : $(DOC).aux ./biblio/biblio_$(DOC).bib
	bibtex $(DOC)

$(DOC).aux: $(DOC).tex $(TEX_FILES)
	latex $(DOC)

#---------------------------
# commandes "utilitaires"
#---------------------------
clean : 
	rm -f $(DOC).dvi $(DOC).aux $(DOC).lof $(DOC).log $(DOC).toc 
	rm -f $(DOC).ps $(DOC).pdf
	rm -f $(DOC).bbl $(DOC).blg
##	rm -f $(DOC).idx $(DOC).ilg $(DOC).ind

diff : 
	diff -b -B --brief -X .diffignore -r ../$(DOC)/ /mnt/usbstorage/$(DOC)/

xe : 
	xemacs $(DOC).tex $(TEX_FILES) ./biblio/biblio_$(DOC).bib &

dv : 
	xdvi -s 0 -paper a4 $(DOC).dvi &

pdf: 
	dvipdf -Pcm -super $(DOC).dvi

tar:
	tar -cz * > ../sauvegardes_$(DOC)/sauvegarde_$(DOC)_$(shell date +%F).tar.gz
#    cd ..; tar -cz $(DOC) > sauvegarde_$(DOC)_$(shell date +%F).tar.gz

#pour detarer:
#gzip -cd sauvegarde_these_2004-09-14.tar.gz | tar xf -
#ne pas le faire dans le home, sinon ça écrase la version courante.

#Il suffit de taper make et d'attendre un peu pour avoir un document prêt à imprimer.
#Accessoirement, make clean permet d'effacer tous les fichiers générés






































