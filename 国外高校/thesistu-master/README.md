#ThesisTu 
![](http://img.shields.io/badge/ build status - pass-brightgreen.svg) ![]( http://img.shields.io/badge/ dependencies - none-blue.svg)


##Description
The thesistu document class is a LaTeX2e based template. It is based on the class template [**vutinfth**](https://gitlab.cg.tuwien.ac.at/auzinger/vutinfth/tree/master) of Thomas Auzinger from the Faculty of Informatics at the TU Wien. Included are the document class and its documentation, a thesis template with graphics and chapter subfolders, which is ready to edit as well as an example which shows what is possible with this class and includes a introduction to LaTeX and useful LaTeX software.  

![](http://i.imgur.com/MAKFKjp.jpg)

## Support

For support you can consolidate the documentation of this project, which is given via the wiki of this project and the [**documentation**](https://github.com/madmaxT800/thesistu/blob/master/thesistu.pdf) of the thesistu class file, where a detailed usage description is given. Also be sure to look at the example folder, which contains a complete [**example**](https://github.com/madmaxT800/thesistu/blob/master/example/example.tex) of the intended use of the thesistu class with each chapter in a subfolder, a bibliography file and the intended folder structure for images.  
If you encounter problems and, or have feature requests you can use the issue section of GitHub, or contact me directly maximilian.hoheiser@student.tuwien.ac.at

##Installation

To use the thesistu class, it has first to be generated from the documented source file thesistu.dtx. This is achieved by executing the build script for Windows systems (build-all.bat) or Unix-based systems (build-all.sh). Since the generation process uses LaTeX itself, make sure that the LaTeX installation is up-to-date, for recommendations on which distribution to use consolidate the [**example**](https://github.com/madmaxT800/thesistu/blob/master/example/example.pdf) file. After the thesistu.cls file was generated there are some different ways to use it with your local LaTeX distribution, you can eather place it in the folder of the .tex file of your thesis or you can install it. For the installing procedure look at the [**example**](https://github.com/madmaxT800/thesistu/blob/master/example/example.pdf) file under the section 1.4

## Copyright Notice

Copyright (C) 2016- by Maximilian Hoheiser <maximilian.hoheiser@student.tuwein.ac.at>  
Copyright (C) 2014-2016 by Thomas Auzinger <thomas@auzinger.name>  

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.  

This work has the LPPL maintenance status `maintained'. The Current Maintainer of this work is Maximilian Hoheiser.  
This work consists of the files thesistu.dtx and thesis.ins and the derived file thesis.cls. This work also consists of the file example.tex.  

The 'TU Wien' logo, 'Institut for Solid State Physics' logo and 'Fakultaet fuer !nformatik' logo are copyright of the TU Wien.
