#!/bin/bash

xelatex main.tex

bibtex main.aux

xelatex main.tex

xelatex main.tex
