�ر�˵����
	���ļ���ϵ��鿴 YangYuancong'sPaper_���ļ������Ҫ��ϵ.png  �����http://www.gliffy.com/go/publish/image/4667231/L.png
	���Ѿ��������Ƹ�����Ҫ�ĺ���������ǲ������������е�������ˣ�����һ��Ҫѧϰ�������ɡ������ļ��е�ע��һ��Ҫ������������˸��ָ����ľ��飬����������·;
	�ن���һ�㣬ǧ��Ҫ��ʱ�����ļ����������ƶ��豸�����仹�������ϴ�,��֮��һ��Ҫ���ݡ����������ܼ����ش���ʧ֮ǰ�������ױ����ļ�����Ҫ�ԣ�������Ҫ��һ�¡�

������
      ���Ļ��� �й����ʴ�ѧ˶������LaTeXģ�� ���ܣ� http://www.btsmth.com/show_topic.php?en_name=CUG&gid=1906  ��Ŀ��ַ��https://code.google.com/p/cugthesis/ 
	��΢�޸���һ�¸�ʽ��ϲ��ԭ֭ԭζ�Ŀ��Ե�ԭ���ַ�����Լ������޸�

ʹ�÷�����

1����֤ CTeX��������Ĭ�Ϸ�ʽ��װ
2��˫������Make.bat
3������Winedit��ֱ�ӱ���PDFLaTeX����Ϊ���벻֧�����������ǩΪ�������������ص��ģ�����Make.bat��������ǩ��������

4��\makecover \maketitle \makeenglishtitle \makestatment ......�Ⱦ���ConfigĿ¼�µ�.cls��.cfg�ж��壬���������в����⴦�����޸��������ļ�������
5���սӴ�LaTeX���ã�Bug�������⣬ϣ����Ҷ����뵽���ĵ���ĸĽ�����
6��WinEdit��������Errors��ʾ�������Ҳ�������λ�ã���������ͨ��������������������ֶ������������pdfͼ��(��ɫ�Ǹ�)�򿪼���
7�����ڲο����ף����ص㣺ʹ�÷ǳ�Ugly�ķ������ɷ��ϱ�׼�Ĳο����ף�����鿴���ļ�(ReadMe��ǰ����Ŀ¼�µ�tex�ļ�)�еĲο����ײ���˵������ָ����ȫ�����ݣ�Ҫһ�ֲ���
8��Linuxer ��Ҫ�����Ķ� ReaderMe__Linuxer.txt




�Ƽ����ţ�ftp://ftp.chinatex.org/TeXDoc/TeXPeople/WangFan/wangfanstar-LatexNoteV6.pdf
	  http://zoho.is-programmer.com/user_files/zoho/File/latexlog-1111.pdf
	  http://image.sciencenet.cn/olddata/kexue.com.cn/upload/blog/file/2009/7/200973110326406486.pdf
	  https://mywebspace.wisc.edu/ohls/web/LaTeXHandbook.pdf


ʹ��ͼƬʱ��ò�Ҫ����չ�����������ɶȣ�LaTeX ���Զ�����.png->.pdf->.jpg->.mps->.jpeg->.jbig2->.jb2->.PNG->.PDF->.JPG->.JPEG->.JBIG2->.JB2 �����ȼ�˳���������ļ�,Ҳ��Ҫ��·����ʹ��\graphicspath{{path1}{path2}{...}}������latex������Щ�ط���ͼƬ




��־��

  2012.5.20  �޸��ʦ�ֵ�CGUThesisv0.4��������Ŀ¼�ṹ����CUGThesis.cfg��CUGThesis.cls��Chinesebst.bst��GBKToUni.exe�ƶ���Config����ȫ���ļ��к��ļ�������ĸ��Ϊ��д��

   2012.6.1   ��CUGThsis.cls�����Ӵֱ�����\shline (2pt)����table ������tabular����������I��2pt��,������������tabular{|cIc|}�������м������Ϊ2pt�Ĵ��ߡ���ȻҲ�����޸�CUGThsis.cls�й���I,\shline�Ķ���õ�����ֵ��Ϊ�˱���ҳü��ʾ�������������»��ߣ����¶���һ�����߱���\authorheader
  2012.6.3 �����ʦ�ֵ�CUGThsis˶������£�����CUGThsis.cls��CUGThsis.cfg�������˲ο���������ʱ�����Bug��ͬʱ������½�Ŀ¼�����òο�����ʱ��ǩ�л���ֲο��������ñ�ʶ�����⣬��������
%
\section[Title]{Title \protect\cite{str0,....,str1}}
%
  2013.6.1 ������żҳҳ�߾෴�˵�����,��������������ҳ��ҳ�߾�Ϊ��խ�ҿ���ż��ҳȴ�������խ������װ��ʱ��Ҫ��������ҳ�����խ��ż��ҳ��խ�ҿ��������������ԭ������żҳҳ�߾�	http://stackoverflow.com/questions/2565755/latex-book-class-twosided-document-with-wrong-margins

  2013.6.2 ����ҳ1 ����ҳ2 ժҪ�ȴ��Ķ���ȫ�����ñ����ʽ��ʹ��tabular��@{:}ָ���зָ��ַ�����ð�Ŷ������������,����鿴cls�ļ���\makecover \maketitile �ȵ�Դ��.

  2013.6.2  ����\CTEXoptions[today=small]ִ��\todayʱ��ʾ��ʽΪ2013��6��2��
  2013.6.3  Makefile ��д,���vector���
  2013.6.4  ����ѧУ��Ҫ�����ֽ�Ŵ�С��ҳ�沼�ֺ��ֺţ�����鿴Config��ReadMe.txt�ļ�
  2013.6.4  ʹ�÷ǳ�Ugly�ķ������ɷ��ϱ�׼�Ĳο����ף�����鿴���ļ�(ReadMe��ǰ����Ŀ¼�µ�tex�ļ�)�еĲο����ײ���˵������ָ����ȫ�����ݣ�Ҫһ�ֲ���
  2013.6.10 ����linux�µ����ã�����ubuntu texlive2012 ��������ͨ�������塢ҳ��ȶ�û���⣬����Linux�µ�texlive���������鷳�����Ķ�ReaderMe__Linuxer.txt
  2013.6.11  ����etex���  http://ctan.org/pkg/etex/
  2013.6.13  ����һ������ƴдundergraduate����ǰ��дΪungranduate��,��л��һ��ͬѧ����