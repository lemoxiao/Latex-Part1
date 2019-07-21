# 该 Makefile 用于在Linux环境下编译一个 Beamer 制作的幻灯片，Windows下请直接运行Make.bat或WinEdit打开主tex文件直接编译
# 运行环境：Linux、texlive、evince 阅读器
# 来自   上海交大beamer模板  https://github.com/X-Wei/aBeamerTemplate4SJTU

# CUG


#Makefile 中的变量就是如同c语言的宏定义，执行的是简单的代替代替，因此可以像Reader变量那样定义一长串内容
#http://blog.csdn.net/absurd/article/details/636418
#http://www.yayu.org/book/gnu_make/make-06.html


#编译主程序
Compiler := xelatex
#阅读器，使用 start-stop-daemon 调用 evince 后台打开,以免终端需要等待evince的关闭，注意 需要采用绝对路径 因此采用/usr/bin/evince  $(PWD)/$(TargetFile)
#首先检查是否已经有evince 的进程在运行，有则停止
Reader := start-stop-daemon -v -x  /usr/bin/evince -K ; start-stop-daemon -b -v  -x  /usr/bin/evince -S -- $(PWD)/
#转换各文件编码为UTF-8
Conver:=$(PWD)/Config/ConverGBK2UTF8
#源文件不带扩展名,便于后面处理，更改的时侯只需要改此处的文件名即可,比如你使用自己的文件名为 “毕业论文.tex” 则将下面这行改为 SourceWithoutExtension :=毕业论文
SourceWithoutExtension :=YangYuancong\'sPaper
Source:=$(SourceWithoutExtension).tex
#目标文件(pdf)
TargetFile:=$(SourceWithoutExtension).pdf
TargetFileFinal:=$(SourceWithoutExtension)_Final.pdf
#临时文件
TmpFile :=*.nav *.snm *.log *.aux *.toc *.lof *.lot *.ilg *.idx *.ind *.out *.exa *.blg *.bbl *.aux  *.bak ./Chapters/*.nav ./Chapters/*.snm ./Chapters/*.log ./Chapters/*.aux ./Chapters/*.toc ./Chapters/*.lof ./Chapters/*.lot ./Chapters/*.ilg ./Chapters/*.idx ./Chapters/*.ind ./Chapters/*.out ./Chapters/*.exa ./Chapters/*.blg ./Chapters/*.bbl ./Chapters/*.aux  ./Chapters/*.bak
AllFile :=*.nav *.snm *.log *.aux *.toc *.lof *.lot *.ilg *.idx *.ind *.out *.exa *.blg *.bbl *.aux *.pdf *.bak ./Chapters/*.nav ./Chapters/*.snm ./Chapters/*.log ./Chapters/*.aux ./Chapters/*.toc ./Chapters/*.lof ./Chapters/*.lot ./Chapters/*.ilg ./Chapters/*.idx ./Chapters/*.ind ./Chapters/*.out ./Chapters/*.exa ./Chapters/*.blg ./Chapters/*.bbl ./Chapters/*.aux ./Chapters/*.pdf ./Chapters/*.bak
#定义子目录,转换下面的文件编码为UFT-8 Config目录 Chapters目录  ./ 当前目录
DirectoyContentFile:=./Config ./Chapters ./ ./Bib

#书签乱码解决
GBK2UNI_Linux:=./Config/GBK2Uni_Linux

#放在第一的目标首被当作最终目标，本目标的步骤为(编码转换 第一次xelatex 第二次 bibtex 第三次xelatex 第四次 xelatex 打开阅读)
All: Prepare TOC BBL Target  Read 

#定义此目标为make Realse
AllButNotOpen:  CleanAll Prepare TOC BBL  Target 

#编译前先将所有文件编码转换为UTF-8准备,/tmp/isFirstRun 是否已转换标识
Prepare:
	if [ ! -e /tmp/isFirstRun__Paper ] ;then chmod +x $(Conver) ; $(Conver) Config/  ; $(Conver) Chapters/ ;$(Conver) Bib/ ;$(Conver) . ;touch /tmp/isFirstRun__Paper ; fi

Target: 
	$(Compiler) $(Source)
	$(Compiler) $(Source)
	#对xelatex,不需要转换书签的编码，转换反而会产生乱码
	#$(GBK2UNI_Linux) $(SourceWithoutExtension).out #
	#$(Compiler) $(Source)
#$(Reader)$(TargetFile)中间不能有空格 evince --named-dest=
Read:
	if [ -e $(TargetFile) ] ; then $(Reader)$(TargetFile);fi
#@开头的行不在终端回显命令的内容
Clean:
	@rm -frv $(TmpFile)	

CleanAll:
	@rm -frv $(AllFile)

Realse: AllButNotOpen Clean	
	if [ -e $(TargetFile) ] ; then mv -i  $(TargetFile)  $(TargetFileFinal); $(Reader)$(TargetFileFinal);fi


##############完整依赖
TOC: 
	$(Compiler) $(Source)
##############第二步生成参考文献,在这一步可能会出现“You can't pop an empty literal stack for entry”这样的错误，导致make终止，但该错误不会对参考文献有影响
##############因此在bibtex前加“-”告诉make忽略该错误，参看http://unix-cd.com/unixcd12/article_3934.html （5.4      命令执行的错误）
BBL: 
	-bibtex $(SourceWithoutExtension)

index: $(SourceWithoutExtension).idx
	makeindex -o $(SourceWithoutExtension).ind $(SourceWithoutExtension).idx
	



	
