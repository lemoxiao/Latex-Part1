# wut_thesis
LaTeX **unofficial** template for diploma thesis on Warsaw University of Technology (2016)

## Opis [PL]
Witaj, to szablon pracy dyplomowej częściowo przystosowany do nowych wymagań edycyjnych PW. Zapoznaj się z kodem źródłowym przed przystąpieniem do pracy. Na początek wymienię kilka ważnych uwag:

* ustawienia dokumentu znajdują się w pliku config.tex,
* niestety ze względu na użycie płatnych fontów w stronie tytułowej aktualna wersja używa plików .png (Jeśli uda się dostać nagłówek i rodzaj pracy w krzywych, to zostaną one podmienione),
* bibliografia używa stylu zbliżonego do stylu harwardzkiego, a cytowania są w większości zgodne z zaleceniami BG PW; można to zmienić w pliku konfiguracyjnym na cytowania numeryczne,
* do kompilacji polecam TeXstudio 2.10.8 + MiKTeX w sekwencji pdflatex + biber + pdflatex + pdflatex (By dodać w TeXstudio przejdź do Opcje > Build > User commands i dodaj: \texttt{txs:///pdflatex | txs:///biber | txs:///pdflatex | txs:///pdflatex}) (czasem warto powtórzyć 2-3 razy, by zaktualizowała się bibliografia); do podglądu zaś [Sumatra PDF](https://www.sumatrapdfreader.org/),
* do zarządzania bibliografią polecam oprogramowanie [Zotero](https://www.zotero.org/) i opcja Better BibTeX.

## Porównanie
![Comparison with official word template](https://github.com/orestesgaolin/wut_thesis/raw/master/img/comparison.png "Comparison")
