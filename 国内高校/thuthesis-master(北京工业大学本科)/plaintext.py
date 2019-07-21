#coding: utf-8
import os
"""
Beijing University of Technology Thesis LaTeX template
Plain text generator
Author: Fangrui Liu

NOTE:
This version is still under development
You can make improvement at any time :P
"""

basedir = 'data/'
trans_key = ['\\cite', '\\ref', '\\eqref', '$', '\\item', '\\footnote', '\\textbf']
replace_key = {'\\times':'*', '\\alpha':'alpha', '\\beta':'beta', '\\otimes':'*', '\\odot':'*'}
del_col_key = ['begin', 'label', 'end', 'section', 'chapter', 'subsection', 'subsubsection', '%',
               'hskip', 'vskip', 'fangsong', 'includegraphics', '\centering', 'wuhao', 'adjustbox',
               'minipage', 'figure', 'subfigure', 'caption', 'hline', 'noindent', 'rule', 'multicolumn',
               ]

def parse_tex(file_name):
    out = []
    with open(file_name, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    for line in lines:
        line = line.split('\n')[0]
        is_plain = True
        line = ''.join(line.split(' '))
        line = ''.join(line.split('\t'))
        for key in trans_key:
            line = line.replace(key, '')
        for key in replace_key.keys():
            line = line.replace(key, replace_key[key])
        if line != '':
            for key in del_col_key:
                if key in line:
                    is_plain = False
            if is_plain:
                out.append(line)
            else:
                print(line[:10])
    return '\n'.join(out)


if __name__ == '__main__':
    texlist = ['cover.tex', 'chap01.tex', 'chap02.tex', 'chap03.tex', 'chap04.tex', 'conclusion.tex', 'ack.tex']
    with open('report.txt', 'w', encoding='utf-8') as f:
        for tex in texlist:
            f.write(parse_tex(basedir + tex))