# 软件构造 报告模板
## 新定义命令
```latex
\infoauthor{姓名}{学号}{班号}{邮箱}{电话号码}
\infoexp{实验序号}{实验名称}
```

## 实验进度记录表
```latex
\begin{table}[H]
    \centering
    \begin{tabular}{cccc}
        \hline 
        日期 & 时间段 & 计划任务 & 实际完成情况 \\ 
        \hline 
             &        &           &                \\ 
        \hline 
    \end{tabular} 
\end{table}
```

## 插入代码

```latex
\begin{minted}[frame=lines]{sh}

public class Main(){
    static void main(String[] args){
        .....
    }
}

\end{minted}
```

## 使用方法

```latex
\documentclass{sc}
\infoauthor{姓名}{学号}{班号}{邮箱}{电话号码}
\infoexp{实验序号}{实验名称}

\begin{document}
\maketitle
\tableofcontents
\newpage

\input{Chapter/第1章}   % 载入章节


\section{实验过程}
为了条理清晰，可根据需要在各节增加三级标题。

\section{实验进度记录}

\begin{table}[H]
    \centering
    \begin{tabular}{cccc}
        \hline 
        日期 & 时间段 & 计划任务 & 实际完成情况 \\ 
        \hline 
             &        &           &                \\ 
        \hline 
    \end{tabular} 
\end{table}

\end{document}
```
