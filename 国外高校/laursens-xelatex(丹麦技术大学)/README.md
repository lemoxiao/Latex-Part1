# Laursen's XeLaTeX thesis template

## Why this repository?

The [original repository](https://bitbucket.org/_laursen/laursens-xelatex-thesis-template/) is at Bitbucket. I noticed a few things I wanted to correct (spelling mistakes, a `\\` that caused underfull hbox warnings etc.), and also make it more friendly to VSCode spell checking extension (see bottom of README). The reasons I didn't simply push it to the original repository:

1. The author doesn't seem interested in pull requests; [this PR](https://bitbucket.org/_laursen/laursens-xelatex-thesis-template/pull-requests/) from September 2014 has not been accepted, rejected or discussed.
2. I'm more familiar with {Git, GitHub, Markdown}, than {Mercurial, Bitbucket, reStructuredText}.

Another fork of the template focused on using LuaTeX instead of XeLaTeX can be found here <https://github.com/martinjlowm/dtu-latex-thesis-template>.

## Is this an official DTU template?

It's not an official template, but is based on official DTU graphics and is recommended on both [latex.dtu.dk](http://latex.dtu.dk/?page_id=61) and one of the recommended templates on the internal article [Report writing and submission, DTU Compute](https://www.inside.dtu.dk/en/medarbejder/institutter/dtu-compute/uddannelse/afgangsspecialer?fs=1) on DTU Inside.

## Introduction

This is an alternative to the "LUKE'S PHD THESIS TEMPLATE 1.2" used as standard layout for the thesis written at DTU Compute.

The template is using the [Memoir class](http://www.ctan.org/tex-archive/macros/latex/contrib/memoir/) which includes a lot of useful and predefined commands.
See the "Miscellaneous" chapter of the [Memoir manual](http://tug.ctan.org/tex-archive/macros/latex/contrib/memoir/memman.pdf). Furthermore it uses XeLaTeX for maximum unicode support local fonts.

An updated version of the code can be downloaded from the [repository at bitbucket.org](https://bitbucket.org/_laursen/laursens-xelatex-thesis-template/).

## Options

All static information such as title, author, degree and so on can be changed in `preamble/static.txt`.

## Requirements

Standard (>2014) TeX Live package including XeLaTeX and BibLaTeX.

### Fonts

The template uses the sans serif font [TeX Gyre Adventor](http://www.ctan.org/tex-archive/fonts/tex-gyre/), which is contained in TeXLive and MiKTeX installation by default so no extra setup is necessary.

Note that [Neo Sans](http://www.monotype.co.uk/neosans/) font (DTU's main font) is the ultimate font for headings.
A similar font called Neo Sans Intel is also a good alternative which typically contains more symbols. If the Neo Sans (Intel) font are installed on your system (un)comment the respective lines in `preamble/fonts.tex`.

## Usage

### Manual typesetting

Run the following for manual typesetting the document:

    xelatex Thesis.tex
    biber Thesis.bcf
    xelatex Thesis.tex
    xelatex Thesis.tex

### make(file)

With the templates comes a `Makefile` using `latexmk` for easy
compiling. There are two ways to use make either by:

    make

or the `auto` mode which automatic updates the pdf if *.tex or *.bib
files are changed:

    make auto

To clean up project run:

    make clean

### TextMate

If using TextMate simply press "⌘R".

Remember to run BibLaTeX too.

### TexStudio

Open preferences and set

- Under "Editor" set "Editor Font Encoding" to "UFT8"
- Under "Build" set "Default Compiler" to "XeLaTeX"

### Texmaker

#### Setup

Open Preferences and ensure under "Editor" that "Editor Font
Encoding" is set to:

    UTF-8

In Preferences under "Quick Build" change it to "User" and the following.

For Windows users:

    "xelatex -synctex=1 -interaction=nonstopmode %.tex|biber %.bcf|xelatex -synctex=1 -interaction=nonstopmode %.tex|xelatex -synctex=1 -interaction=nonstopmode %.tex"

For Mac users:

    "/usr/texbin/xelatex" -synctex=1 -interaction=nonstopmode %.tex|"/usr/texbin/biber" %.bcf|"/usr/texbin/xelatex" -synctex=1 -interaction=nonstopmode %.tex|"/usr/texbin/xelatex" -synctex=1 -interaction=nonstopmode %.tex|open %.pdf

#### Typesetting

Simply press "Quick Build". This will run all necessary commands including setting up your bibliography if there are any changes to it.

If the bibliography is not changed only `xelatex` needs to run one single time. You can therefore select XeLaTeX from the run menu instead of the default in Quick build.

### Visual Studio Code

Install the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension. It pretty much just works out of the box, and documentation is good.

#### Spell checking

For spell checking, I would recommend trying [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) or [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright).

Both extensions do more or less the same thing, but have some differences.

##### Code Spell Checker (cSpell)

- Is Based on the open [Hunspell](http://hunspell.github.io) dictionary.
- Tries reduce the number of false positives, but may catch less errors.
- By default saves custom dictionary words in User or Workspace (`.vscode/`) `settings.json` along with the other settings (but can also be set up to point dictionary files)

##### Spell Right (spelling)

- Taps into your OS system dictionary.
- Will typically give more spelling errors, but may catch slightly more errors.
- Save dictionary of words in `spellright.dict` plaintext file that is found in User or Workspace (`.vscode/`) folder.

##### Included spelling dictionaries for template

The template includes quite a few words that will trigger both `cSpell` and `spelling`:

- `.vscode/lauersens-cspell.txt` is a dictionary for the `cSpell` extension.
- `.vscode/lauersens-spelling.dict` a dictionary for the `spelling` extension.

They are both enabled with the settings in `.vscode/settings.json`.

When adding new words via the Quick Fix (⌘+. or Ctrl+.) menu, adding word to workspace dictionary:

- for `cSpell` they will go into a new list in `.vscode/settings.json`.
- for `spelling` they will go into `.vscode/spellright.dict` that will be created on first use.

In some sense it would be nice just to have one dictionary for both extensions, but it doesn't seem feasible until [this issue](https://github.com/Jason-Rev/vscode-spell-checker/issues/264) is fixed.

I usually keep "Code Spell Checker" on all the time, and activate "Spell Right" periodically when I'm in mood for low-energy work and some extra spell checking. But one could also do just fine with just one of them.