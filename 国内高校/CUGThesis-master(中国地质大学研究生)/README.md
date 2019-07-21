# CUGThesis
The \Latex Template for the Master Degree Graduate Thesis writing in China University of Geosciences.

This is a \Latex Template for Thesis Writing by Seeksky@CUG. Welcome to my homepage http://jinlaixu.net .
The Template is modified from the universal thesis template in USTC. Thanks very much for their effort in the template.  

# Intro
Please use \Xelatex for compiling the files. Maybe TexLive is better for the template, because I didn't test the availability when using MikTex.

Needed Files:
 * cugthesis.cls: all in one style class.
 * cugbib.bst: style for \Bibtex.
 * main.tex: the main file of the thesis with some examples of it.
 * clean.bat/sh: clean bash.
 * make.bat/sh: make bash.
 * /chapter: with all the subsection files in it including the abstract and so on.
 * /bib: just \Bibtex files for references.
 * /figures: the directory for figures. Please use PDF, EPS ans so on.
 
#Recommendation
I recommend **Sublime Text 3** + **LatexTool** + **TexLive** + **SumatraPDF** tool-chains.
Because after the configuration, you can compile the whole files with only needing to click **"Ctrl+B"**.
 
# Update Log
更新日志[20150605] v0.1.3

修复一些bug:

 1. 个人简介的行距修正,字体修正
 2. 目录前双面打印正常空页
 3. 修复gpt7714中使用google导出bib会导致会议论文标题后多出"\\\\"的问题,将其中的\\\\改为了"."
 4. 其他的一些根据要求做的修改
 
到此版本位置,大多数bug都已经修复,还有一些零散的bug请在github上提交,我会及时修复

[20150531] v0.1.2.2
修改章节标题的空行大小
现在章节和二级标题的行间距已经调整到和学校模版相同
但是三级标题的行间距还是过大,再想办法调整

[20150523] v0.1.2.1
添加国标论文引用格式
GB/T 7714—2005《文后参考文献著录规则》
使用方法将main.tex中的\bibliographystyle参数改为gbt7714-2005
即:\bibliographystyle{gbt7714-2005}

[20150507] v0.1.2
Modify some details to satisfy the requirements of CUG master dissertations.
The modification is below:
1.delete the Roman page number in the front matter.
2.modify the details in the cover page and the statement pages.
3.add the miss empty page after the first statement page.
4.fix the font size of tables and figures.
5.fix the main matter font size from cs4size to c5size 

[20150316] v0.1.1
Change the sub-chapter files to UTF-8 without BOM.
Add the top flag to support the LatexTool for the mutil-files compiling and searching in Sublime Text 3.

[2016/03/06] v0.1
Create the template 