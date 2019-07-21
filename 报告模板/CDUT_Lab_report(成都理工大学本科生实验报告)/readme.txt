使用时打开 CDUT_Lab_report.tex 编译即可，注意中文文档编译使用XeLaTeX编译两次即可，出现问题优先使用 texclear.bat 清理工作区

文中使用了minted宏包，编译时注意安装python环境，并在编辑器中开启 -shell -escape ，先说一下 WinEdt编辑器，由于我安装的是 Texlive 2015，不是CTeX，所以不自带WinEdt，所以我安装的是官网上的WinEdt 10.0（此处提一点，居然可以自动补全了，记得以前好像不行）。点击 Options，选择 Execution Modes，然后在 Console Applications 的 Accessories 里面选择 XeLaTeX（因为我主要使用 XeLaTeX 编译，所以要改它，使用其它编译方式的可以相应修改），然后在里面的 Switches 加入shell-escape即可，如有疑问欢迎致电作者或者自行上网寻找解决办法

注意使用TexLive 2017以上的套装发行版

对于文档内容，attachment是实验报告末尾的体验心得，鉴于LaTeX不适合做此类工作类表格，读者用word编辑后再对该页导出pdf替换该文件下内容即可

对于body，里面是各section下的内容，单独存放便于查找

对于figures，里面存放文中的图片，调用方式详见文档内容

对于preface，里面是实验报告的封面，更改名字请在该文档内更改

对于setup，里面有两个文档：format是全局一些格式上的更改与定义、packages是全文使用的宏包

注意没有python的同学请在package中注释\usepackages{minted}，并相应的注释文中的minted环境，关于minted宏包的介绍请查看宏包文档

@LVoffice

如有建议或意见请联系作者 549274614@QQ.com

感谢各位大佬对我提供的帮助以及@信 对我C以及Matlab代码的启发，有时间我会融入更多自己的内容在代码的美观上，本模板暂且使用@信 的代码风格。