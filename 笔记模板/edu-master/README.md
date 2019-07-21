edu
===

LaTeX document class for documents at educational institutions.


WARNING
-------

**[EN] The edu document class is currently under development. All functionality, 
settings and macros as well as file names can change in later versions and may 
be incomplete! It is experimental and not ready for production use.**

**[DE] Die edu Dokumentenklasse befindet sich in der Entwicklung. Alle 
Funktionen, Einstellungen und Makros sowie Dateinamen können sich in späteren 
Versionen ändern oder können unvollständig sein. Sie ist noch nicht für den 
produktiven Einsatz bereit.**


Install
-------

* Local installation: `make install` oder `make install-local`
* Global installation (*root required*): `make install-global`


Development
-----------

### Developing without documentation (trying out new things)

* The main file is `edu.tex`. Changes should be placed there.
* Compiling `edu.tex` with `pdflatex` generates the documentclass `edu.cls`.

### Building

* Clean up [optional]:
	* Tutorials *not* changed: `make clean`
	* Tutorials changed: `make distclean`
* Build: `make`
* Create TDS (TeX Directory Structure) [optional]: `make edu.tds.zip`
* Create Create CTAN archive [optional]: `edu.tar.gz`


License
-------

Copyright (C) 2012-2019 by Daniel Wunderlich <code@wu-web.de>

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is Daniel Wunderlich.


