
# 山东大学（威海）本科生毕业论文LaTeX 模版


`sduthesis` 是由 [Liam Huang][liam-ctan] 为山东大学学生设计的 LaTeX 论文模板。
1.x 以化名 Chen Meng 的名义发布；1.2.0 版本开始，以 `docstrip` 工具重写了整个代码，并以 Liam Huang 的名义发布。  

2019年03月28日， Xianyu Wang 对本文件进行了修改，使得其格式符合山东大学（威海）本科生毕业论文要求。  

本次修改非商业行为。  

## Introduction / 介绍

The `sduthesis` is designed for students of Shandong Univ., P.R.China,
by [Liam Huang][liam-ctan]. The 1.0.x versions of `sduthesis` were
released in the name of Ch'en Meng, while from the begining of version 1.2.0,
it was released in the name of Liam Huang and was rewritten in `docstrip`.

This work is released under the LaTeX Project Public License, v1.3c or later.
See the License file.

`sduthesis` 遵循不低于 1.3 版本的 LPPL 许可证，详情请查看 LICENSE 文件。



Liam Huang原版山东大学硕博毕业论文LaTeX模版： http://www.latexstudio.net/archives/3071.html



### 所做修改：
1. 删除了声明部分
2. 改latex为xelatex以添加所需字体
3. 更改book类默认情况下章节在奇数页开始
4. 添加公式示例
5. 添加引用示例
6. 对封面做出相应修改
7. 添加.bat文件可以删除编译产生的临时文件


### 一些报错解决方案：
1. WinEdt读取该文件显示 error reading， 解决方案参考：https://blog.csdn.net/garfielder007/article/details/51619821
2. 缺少某个字体  
   1.方法一 自己安装
   如何安装字体：https://zhidao.baidu.com/question/39166963.html

   字体下载网址： http://www.3673.com/font/2168.html  
   
   用到的额外字体：华文新魏（STXinwei）、西文字体Times New Roman、方正粗宋（FZCuSong-B09S）、方正大黑（FZDaHei-B02S），在文件夹fonts_installation中都有，拷贝到C:\Windows\Fonts
   
   2.脚本安装


   在文件夹fonts_installation运行bat文件即可。

   安装完成后，在命令提示行（至于如何打开它请百度），使用fc-cache刷新下字体缓存。




## Installation / 安装

    cd path/to/sduthesis
    xelatex sduthesis.ins
    xelatex -shell-escape sduthesis.dtx
    xelatex -shell-escape sduthesis.dtx
    xelatex sduthesis-demo.tex
    xelatex sduthesis-demo.tex

上述为指令编译指令，适合于已安装xelatex的各个平台。
### platform / 平台
编译平台：
1. Ctex。 下载镜像：http://www.ctex.org/CTeXDownload/
2. TEX-live 下载镜像： https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/
3. 在线latex编辑平台[Overleaf](https://www.overleaf.com/project)。**注意**，如果使用该平台，请将编译器改为Xelatex，以及将主文件夹的.def文件替换为overleaf_def文件夹中的.def文件。但是不支持复杂字体，如魏书等。建议完成毕业论文的编写后，可以在本地再次编译一次，以确保字体格式符合要求。

### Remove temp-files / 删除临时文件

**双击.bat文件即可**

* Put `sduthesis.ins` and `sduthesis.dtx` to `TEXMF/source/latex/sduthesis/`
* Put `sduthesis.cls`, `*.def` and `figures/' to `TEXMF/tex/latex/sduthesis/`
* Put the remaining files to `TEXMF/doc/latex/sduthesis/`

中文用户参见用户文档。

## Usage / 用法

See the user manual `sduthesis.pdf` and the demo `sduthesis-demo.tex'.

参见用户文档 `sduthesis.pdf` 及示例文件 `sduthesis-demo.tex`。

## Author / 作者

Liam Huang

Email: liamhuang0205+sduthesis@gmail.com
If you are interested in the process of development you may observe

<https://github.com/LiamHuang0205/sduthesis> 该链接已失效

[liam-ctan]: http://www.ctan.org/author/huang-l

## 修改者
Xianyu Wang  

Email: xiangyuwang7@gmail.com

参考项目：

1. 上海交通大学学位论文模版 https://github.com/sjtug/SJTUThesis  

2. 厦门大学本科毕业论文 https://github.com/CamuseCao/XMU-Undergraduate-thesis-template
--------------------------------------------------------------------------
## 维护日志

### 2019.03.29
增加字体方正粗宋（FZCuSong-B09S）、方正大黑（FZDaHei-B02S）  
添加Bibtex管理参考文献示例，改页码居中

### 2019.03.30
添加TikZ绘图测试、Tikz教程和Tikz Gallery

### 2019.04.02
添加字体设置文件overleaf_def/sduthesis-cover.def以适应overleaf中只有有限的中文字体的情况。
### 2019.04.05

根据最新的文件，对目录格式和封面页的格式进行了重排，核对了各个部分的字号

添加附录页、注释页、谢辞页

此处感谢提供格式要求文件的马学弟，祝各位毕设顺利~

