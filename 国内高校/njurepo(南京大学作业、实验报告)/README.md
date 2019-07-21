![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)

# What's NJUrepo?
NJUrepo stands for <b>N</b>an<b>j</b>ing <b>U</b>niversity versatile <b>Repo</b>rt.

NJUrepo是为南京大学本科生设计的一个免于配置的作业、实验报告模板。希望它可以使你
的作业/实验报告不会因形式上的缺陷导致评分的下降。

# 使用方法
下载后参考njurepo.pdf文档和example.pdf示例文档，以及main.tex和parts/examples/的示例代码进行使用。生成文件方法见Makefile的用法

# Makefile的用法

```shell
make [{all|thesis|shuji|doc|clean|cleanall|distclean}] \
     [METHOD={latexmk|xelatex|pdflatex}]
```

## 目标
* `make cls`       生成模板文件；
* `make example`   生成实例 main.pdf；
* `make doc`       生成使用说明书 njurepo.pdf；
* `make clean`     删除示例文件的中间文件（不含 example.pdf）；
* `make cleanall`  删除示例文件的中间文件和 example.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。