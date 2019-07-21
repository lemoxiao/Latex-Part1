CUGthesis-c5size-270mm×195mm   这是学校要求的格式，页边距上下左右都为2.5cm 纸张大小为 270mm×195mm ,页眉15mm，页脚17.5mm，正文字号5号，在资源学院打印时装订出来确实很不错


CUGthesis.cls  才是book类原生版本，CUGthesis-c5size-270mm×195mm更改的部分有

1、更改字号大小 页面布局 行距
\LoadClass[c5size,fancyhdr,fntef,punct]{ctexbook}[2005/11/25] 

\RequirePackage[paperheight=270mm,paperwidth=195mm,top=25mm,bottom=25mm,left=25mm,right=25mm,headsep=10pt,head=15mm,foot=17.5mm]{geometry}
\linespread{1.5}\selectfont

2、要求左右页边距一样，便没必要修正左右页边距反向的问题了 ，注释掉

%\let\tmp\oddsidemargin                          %参考c语言的经典问题:如何调换两个参数的值
%\let\oddsidemargin\evensidemargin
%\let\evensidemargin\tmp
%\reversemarginpar

3、这是设定脚注标识的，很花哨，去掉；改用1,2,3,4......显示脚注

%\DefineFNsymbols{lamport-mystyle}{\SnowflakeChevron \OrnamentDiamondSolid  \FourClowerOpen \FourStarOpen \SixFlowerPetalDotted \JackStarBold \NibSolidLeft \Cross \CrossClowerTips \CrossMaltese \Asterisk\FiveFlowerPetal \FiveStar  \AsteriskCenterOpen \AsteriskRoundedEnds  \SixFlowerPetalRemoved \SixFlowerRemovedOpenPetal\EightAsterisk \EightFlowerPetalRemoved \Snowflake  \S * {**} \textparagraph \textdagger \textdaggerdbl \PencilLeft }
%\setfnsymbol{lamport-mystyle}
