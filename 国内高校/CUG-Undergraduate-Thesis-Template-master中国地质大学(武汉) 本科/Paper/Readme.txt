特别说明：
	各文件关系请查看 YangYuancong'sPaper_各文件间的主要关系.png  或访问http://www.gliffy.com/go/publish/image/4667231/L.png
	我已尽可能完善各种需要的宏包，但还是不可能满足所有的需求。因此，首先一定要学习搜索技巧。各个文件中的注释一定要认真读，包含了各种各样的经验，可以少走弯路;
	再啰嗦一点，千万要随时备份文件，不管是移动设备、邮箱还是网盘上传,总之，一定要备份。可能在遭受几次重大损失之前不会明白备份文件的重要性，但还是要提一下。

背景：
      本文基于 中国地质大学硕博论文LaTeX模板 介绍： http://www.btsmth.com/show_topic.php?en_name=CUG&gid=1906  项目地址：https://code.google.com/p/cugthesis/ 
	稍微修改了一下格式，喜欢原汁原味的可以到原项地址下载自己动手修改

使用方法：

1、保证 CTeX完整版以默认方式安装
2、双击运行Make.bat
3、若在Winedit中直接编译PDFLaTeX会因为编码不支持问题出现书签为乱码的情况，不必担心，运行Make.bat编译后的书签是正常的

4、\makecover \maketitle \makeenglishtitle \makestatment ......等均在Config目录下的.cls和.cfg中定义，若对文中有不满意处可以修改这两个文件的内容
5、刚接触LaTeX不久，Bug在所难免，希望大家都参与到该文档类的改进中来
6、WinEdit编译会出现Errors提示，但是找不到错误位置，但编译能通过，若出现这种情况，手动点击工具栏的pdf图标(红色那个)打开即可
7、关于参考文献，是重点：使用非常Ugly的方法生成符合标准的参考文献，具体查看主文件(ReadMe当前所在目录下的tex文件)中的参考文献部分说明及其指引的全部内容，要一字不落
8、Linuxer 还要认真阅读 ReaderMe__Linuxer.txt




推荐入门：ftp://ftp.chinatex.org/TeXDoc/TeXPeople/WangFan/wangfanstar-LatexNoteV6.pdf
	  http://zoho.is-programmer.com/user_files/zoho/File/latexlog-1111.pdf
	  http://image.sciencenet.cn/olddata/kexue.com.cn/upload/blog/file/2009/7/200973110326406486.pdf
	  https://mywebspace.wisc.edu/ohls/web/LaTeXHandbook.pdf


使用图片时最好不要加扩展名，增加自由度，LaTeX 会自动按照.png->.pdf->.jpg->.mps->.jpeg->.jbig2->.jb2->.PNG->.PDF->.JPG->.JPEG->.JBIG2->.JB2 的优先级顺序来查找文件,也不要带路径，使用\graphicspath{{path1}{path2}{...}}来告诉latex该在哪些地方找图片




日志：

  2012.5.20  修改杨波师兄的CGUThesisv0.4，整理了目录结构，将CUGThesis.cfg、CUGThesis.cls、Chinesebst.bst、GBKToUni.exe移动到Config，将全部文件夹和文件名首字母改为大写。

   2012.6.1   在CUGThsis.cls中增加粗表格横线\shline (2pt)，和table 环境中tabular环境的竖线I（2pt）,若环境是这样tabular{|cIc|}，则表格中间的竖线为2pt的粗线。当然也可以修改CUGThsis.cls中关于I,\shline的定义得到其他值。为了避免页眉显示的作者姓名有下划线，重新定义一个作者变量\authorheader
  2012.6.3 跟随杨波师兄的CUGThsis硕博版更新，更新CUGThsis.cls及CUGThsis.cfg，修正了参考文献引用时乱序的Bug，同时解决在章节目录中引用参考文献时书签中会出现参考文献引用标识的问题，方法如下
%
\section[Title]{Title \protect\cite{str0,....,str1}}
%
  2013.6.1 修正奇偶页页边距反了的问题,问题描述：奇数页的页边距为左窄右宽，而偶数页却是左宽右窄，正常装订时需要的是奇数页左宽又窄，偶数页左窄右宽；解决方法，调换原来的奇偶页页边距	http://stackoverflow.com/questions/2565755/latex-book-class-twosided-document-with-wrong-margins

  2013.6.2 封面页1 封面页2 摘要等处的对齐全部采用表格形式，使用tabular的@{:}指定列分割字符，是冒号对齐更整齐美观,具体查看cls文件中\makecover \maketitile 等的源码.

  2013.6.2  更改\CTEXoptions[today=small]执行\today时显示格式为2013年6月2日
  2013.6.3  Makefile 编写,添加vector宏包
  2013.6.4  按照学校的要求更改纸张大小、页面布局和字号，具体查看Config下ReadMe.txt文件
  2013.6.4  使用非常Ugly的方法生成符合标准的参考文献，具体查看主文件(ReadMe当前所在目录下的tex文件)中的参考文献部分说明及其指引的全部内容，要一字不落
  2013.6.10 完善linux下的设置，可在ubuntu texlive2012 正常编译通过，字体、页面等都没问题，关于Linux下的texlive配置稍显麻烦，请阅读ReaderMe__Linuxer.txt
  2013.6.11  加入etex宏包  http://ctan.org/pkg/etex/
  2013.6.13  修正一个单词拼写undergraduate，以前错写为ungranduate了,感谢杨一萌同学提醒