# 北京工业大学本科毕业论文latex模板
> 为优秀的毕业生们提供了latex排版小论文的可能。不过体现方式是以独立tex和独立cover定义实现
> 另外为需要查重的同学们准备了tex转plaintex的小工具，虽然这玩意不到半小时就能写完吧，主要希望抛砖引玉。
> 于2019/06/08晚

> 请注意，为方便大家一同打印翻译与论文，本模板增加了翻译页眉以及格式。
> 所有附录内容可参照更新后的appendix01.tex调整格式。
> 于2019/05/28凌晨
1.  为了偷懒fork了一下，以后隔离代码。现在大致改完了，欢迎提交pull request。
2.  目前任务书没有latex模板，嵌入需要使用word生成pdf，请注意！
3.  本模板并非官方模板，请在撰写时与指导老师以及北京工业大学本科生教务处核对格式。
4.  感谢thuthesis提供充足的注释以及整洁的代码，节约了更改模板的时间。
5.  font/文件夹下是待安装字体，如果未安装字体会导致编译错误。

> 以下是thuthesis的原始README

# What's ThuThesis?
ThuThesis is an abbreviation of <b>T</b>sing<b>h</b>ua <b>U</b>niversity <b>Thesis</b> LaTeX Template.

This package establishes a simple and easy-to-use LaTeX template for Tsinghua dissertations, including general undergraduate research papers, masters theses, doctoral theses, doctoral dissertations, and post-doc reports. Additional support for other formats (what else is there?) will be added continuously. An English translation of this README follows the Chinese below.

# ThuThesis是什么？
ThuThesis为 <b>T</b>sing<b>h</b>ua <b>U</b>niversity <b>Thesis</b> LaTeX Template之缩写。

此宏包旨在建立一个简单易用的清华大学学位论文LaTeX模板，包括本科综合论文训练、硕士论文、博士论文、博士哲学论文以及博士后出站报告。现在支持本科、硕士、博士论文、博士后出站报告格式，对其它格式（还有么？）的支持会陆续加入。

# 文档
请[下载](https://github.com/xueruini/thuthesis/releases)模板，里面包括具体使用说明以及示例文档：

* 模板使用说明 (thuthesis.pdf)
* 示例文档 (main.pdf)

# 下载
* 发行版：[CTAN](http://www.ctan.org/pkg/thuthesis)
* 开发版：[GitHub](https://github.com/xueruini/thuthesis)

# 升级
## 自动更新
通过 TeX 发行版工具自动从 [CTAN](http://www.ctan.org/pkg/thuthesis) 更新。

## 手动更新
从 [GitHub](https://github.com/xueruini/thuthesis) 下载放入论文目录，执行命令（Windows 用户在文件夹空白处按`Shift+鼠标右键`，点击“在此处打开命令行窗口”）：

    xetex thuthesis.ins

即可得到 `thuthesis.cls` 等模板文件。

# 提问
按推荐顺序排序：

* 先到 [FAQ](https://github.com/xueruini/thuthesis/wiki/FAQ) 看看常见问题
* [Github Issues](http://github.com/xueruini/thuthesis/issues)
* [TeX@newsmth](http://www.newsmth.net/nForum/#!board/TeX)
* [ThuThesis@Google Groups](http://groups.google.com/group/thuthesis)

# Makefile的用法

```shell
make [{all|thesis|shuji|doc|clean|cleanall|distclean}]
```

## 目标
* `make all`       等于 `make thesis && make shuji && make doc`；
* `make cls`       生成模板文件；
* `make thesis`    生成论文 main.pdf；
* `make shuji`     生成书脊 shuji.pdf；
* `make doc`       生成使用说明书 thuthesis.pdf；
* `make clean`     删除示例文件的中间文件（不含 main.pdf）；
* `make cleanall`  删除示例文件的中间文件和 main.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。

# Documentation
Download and unzip the template. Specific usage documentation and examples can be found in the files below. At present, these documents are <b>only available in Chinese</b>:
* Template usage (thuthesis.pdf)
* Template example (main.pdf)

# Downloads
* Published version: [CTAN](http://www.ctan.org/pkg/thuthesis)
* Developer version: [GitHub](https://github.com/xueruini/thuthesis)

# Updates
## Automatic
Get the most up-to-date published version of the TeX tools from [CTAN](http://www.ctan.org/pkg/thuthesis).

## Manual
Download the package from [GitHub](https://github.com/xueruini/thuthesis) to the root directory of your thesis, then execute the command (Windows users `Shift + right click` white area in the file window and click "Open command line window here from the popup menu"):

    xetex thuthesis.ins

You'll get `thuthesis.cls` along with other template files.

# Reporting Issues
Please follow the procedure below:

* Check the  [FAQ](https://github.com/xueruini/thuthesis/wiki/FAQ)
* [Github Issues](http://github.com/xueruini/thuthesis/issues)
* [TeX@newsmth](http://www.newsmth.net/nForum/#!board/TeX)
* [ThuThesis@Google Groups](http://groups.google.com/group/thuthesis)

# Makefile Usage

```shell
make [{all|thesis|shuji|doc|clean|cleanall|distclean}]
```

## Targets
* `make all`       same as `make thesis && make shuji && make doc`;
* `make cls`       generate template file;
* `make thesis`    generate thesis main.pdf;
* `make shuji`     generate book spine for printing shuji.pdf;
* `make doc`       generate documentation thuthesis.pdf;
* `make clean`     delete all examples' files (excluding main.pdf);
* `make cleanall`  delete all examples' files and main.pdf;
* `make distclean` delete all examples' and templates' files and PDFs.
