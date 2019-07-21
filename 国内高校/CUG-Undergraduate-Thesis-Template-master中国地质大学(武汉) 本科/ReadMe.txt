
本项目在github地址  https://github.com/CUG-Onion/CUG-Undergraduate-Thesis-Template


	https://www.tug.org/TUGboat/tb25-1/beebe-2003keynote.pdf


两个文档目录下均有相应的各文件关系图解，先查看以便理解

两个文档均在Windows和Ubuntu下成功编译，配置为：

       Windows ：CTeX v2.9.2.164（2012.6.18版本），使用 "开始菜单\程序\CTeX\MiKTeX\Maintenance (Admin)\Update (Admin)" 选择一个源(如http://mirrors.ustc.edu.cn)更新宏包(需要手动更新两遍，第一遍更新MiKTeX主程序，第二次才是宏包更新),完成后 “开始菜单-MikTeX-Maintanance-Settings-General-Refresh FNDB”(http://tex.stackexchange.com/questions/86957/yrcmex10-problem-after-december-5-2012),使用了ymath宏包(比如本文)的可能会遇到错误  !pdfTeX error: pdflatex (file yrcmex10): Font yrcmex10 at 600 not found    ==> Fatal error occurred, no output PDF file produced!，解决方法在http://sourceforge.net/p/miktex/bugs/2201/，下载这个文件http://mirror.ctan.org/systems/texlive/tlnet/archive/yhmath.tar.xz(用7zip才能解压),复制解压后的fonts tex tlpkg 三个文件夹覆盖(合并)CTeX\MiKTeX目录下的文件，然后再执行“开始菜单-MikTeX-Maintanance-Settings-General-Refresh FNDB”即可解决该问题。

       Linux： Ubuntu12.04 , TeXLive2012(关于Ubuntu12.04安装TeXLive 参考http://forum.ubuntu.org.cn/viewtopic.php?f=35&t=389097，Ubuntu12.10及以上的源已经是TeXLive2012 直接apt-get) ，安装六种windows字体 宋体、仿宋、楷书、幼圆、黑体、隶书，4种Adobe字体，具体请看YangYuancong'sPaper文件夹下ReaderMe__Linuxer.txt说明









   我已尽全力完善方方面面,现在不论你是使用Windos还是Linux，都可以正常编译论文和演示文稿，Windows下使用pdflatex，Linux下使用xelatex。但这远远不够，每个人都有自己的想法，会遇到不同的问题。因此，一定要学会搜索，相同的问题大多已经有人解决过了，方法总比问题多。
	
                    学习搜索: http://www.cnbeta.com/articles/64073.htm	
                    各种问题及解决方法：http://tex.stackexchange.com/







特别建议： Windows下(GBK编码)最好使用pdflatex， Linux下(UTF8)最好使用xelatex，文件编码问题真的很麻烦.如果你愿意尝试，还是能成功的.






其它未尽事宜请阅读各文件夹下的ReadMe.txt和各文件中的注释


																	2013.6.12

