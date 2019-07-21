# resume

My LaTeX résumé is designed as a [Modular Document](https://en.wikibooks.org/wiki/LaTeX/Modular_Documents). Each section of the résumé is stored as a standalone LaTeX file, and is added to the main resume.tex file with the use of the input command. By commenting out certain input commands, you can exclude sections that don't fit or that you no longer want to include. This way, the section is not deleted forever, and can easily be readded later. You can also store multiple versions of the same file, like I did with my header\_\*.tex files, and switch between them to see how they look.

## Installation

To download, simply clone the repository:

```bash
git clone https://github.com/adamjstewart/resume.git
```

On OS X, I am using [MacTeX](https://tug.org/mactex/) for LaTeX compilation, [Sublime Text](http://www.sublimetext.com/) as my editor, and the [LaTeXTools](https://github.com/SublimeText/LaTeXTools) plugin for Sublime. One of the benefits of LaTeXTools is that you can specify the relative path to the main resume.tex file from any section file through the `%!TEX root` command. Then, when you press `<Cmd>+D`, it builds the main file, not the section file. See the installation instructions for MacTeX, Sublime Text, and LaTeXTools to get them up and running.

