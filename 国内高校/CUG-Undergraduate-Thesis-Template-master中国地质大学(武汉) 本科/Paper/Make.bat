@echo on
::ɾ��ԭpdf�ļ�ͬʱ������Դ�ļ�����ǰ�û�������,��ʱ�����ļ��Ǻ���Ҫ��
::�ο�http://blog.csdn.net/wzsbll/article/details/6690895
del *.pdf
::�ж�ϵͳ�汾 ֻ�ж�XP��Win7,���ݷ���ֵ�ж� http://blog.163.com/xqslove@yeah/blog/static/1670140142012112221429906/  http://www.myexception.cn/operating-system/726032.html
@ver|findstr "5.1"
::�����Windows7 Ŀ����Ϊ Desktop
@if %errorlevel% equ 1 (set Dest=Desktop)
::�����Windows XP  Ŀ����Ϊ ����
@if %errorlevel% equ 0 (set Dest=����)
::del  /Q /S  "%HOMEDRIVE%%HOMEPATH%\%Dest%\Paper"
XCOPY  "*"  "%HOMEDRIVE%%HOMEPATH%\%Dest%\Paper" /E /Y /D
@pause
::exit

::�������ļ����ļ���
set  Name=YangYuancong'sPaper

::��һ�α��뽨��������Ϊ����������׼��
pdflatex "%Name%.tex"
makeindex -o "%Name%.ind" "%Name%.idx"
::�����ο����ף��ڶ��α��룬�趨��������
bibtex %Name%
pdflatex "%Name%.tex
::����ǩ�����GBKת��ΪUnicode����Ȼ��ǩ���룬���һ��������������
Config\GBKToUni.exe "%Name%.out"
pdflatex "%Name%.tex"

::���ļ�
start %Name%.pdf


Config\Cleaner.bat
@pause
