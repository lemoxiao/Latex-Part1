本目录提供一些与模板有关系的编辑器使用技巧及相关文件，与模板内容无关。



发信人: TeX (将TeX进行到底), 信区: TeX
标  题: WinEdt中自定义gather和高亮
发信站: BBS 哈工大紫丁香站 (Wed Jan 11 13:07:42 2006)

WinEdt中的gather可以收集章节标题，形成TOC列表，功能类似于word中的文档结构图，在
写大文档的时候这个功能非常有用，但是在我们的Pluto模板中，自定义了一些章节标题，
这些自定义标题缺省的gather是不识别的，这让我很久以来耿耿于怀，今天偶然发现gath
er项目是在WinEdt.gdi中定义的，立即动手修改，果然奏效，希望使用这个功能的网友可
以自己动手修改，附件里传上来我修改过的WinEdt.gdi，网友们也可以直接使用，放到wi
nedt目录下替换同名文件即可。

另外这些自定义的命令在编辑状态下不能像缺省命令一样高亮，如果能高亮就好了，这个
也可以自己定义，在winedt菜单 option/highlighting/switches 修改，附件Switches.d
at是我定义好的，可以在上述菜单位置使用对话窗顶部的“Load from”按钮加载。

winEdt 的tree interfacezho中也有 TOC 这一项，这个可以通过修改Winedt目录下的WinEdtEx.ini实现。用tools文件夹下
的WinEdtEx.ini替换该同名文件就可以。