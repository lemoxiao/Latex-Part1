# 深入理解计算机系统 报告模板
## 新定义命令

```latex
\infoauthor{姓名}{专业}{学号}{班号}
\infoexp{指导老师}{实验地点}{实验序号}{实验题目}{实验日期}
```

## 使用方法

```latex
\documentclass{csapp}

\infoauthor{姓名}{专业}{学号}{班号}
\infoexp{指导老师}{实验地点}{实验序号}{实验题目}{实验日期}

\begin{document}
\maketitle         % 生成封面
\tableofcontents   % 生成目录

\newpage
\input{Chapter/第1章}   % 载入章节

....

\nocite{ref1}           % 参考条目

%参考文献
\bibliography{Ref/参考文献} % 所引用的参考文献
\end{document}
```
