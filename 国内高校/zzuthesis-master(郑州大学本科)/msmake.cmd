@rem -*- mode: conf -*-
@rem ----------------------------------------------------------------------
@rem START OF FILE
@rem ----------------------------------------------------------------------
@rem 
@rem ----------------------------------------------------------------------
@rem COMMENTARY
@rem ----------------------------------------------------------------------
@rem
@rem ʹ��˵����
@rem
@rem 1.����ʾ���ĵ�
@rem msmake [thesis|a3cover]
@rem �����ڵ�ǰĿ¼������ʾ���ĵ��������е�һ���֣��������û�ָ���ĵ���
@rem ����- thesis	����main.pdf��Ĭ��ѡ��
@rem ����- a3cover	����A3����
@rem
@rem 2.����Ŀ¼
@rem msmake clean
@rem ���������ĵ����ɹ����в�������ʱ�ļ��������� pdf �ļ���
@rem 
@rem ----------------------------------------------------------------------
@rem ----------------------------------------------------------------------

@echo off
set Package=zzuthesis
set Method=xelatex
set Thesismain=main
if /i {%1}=={clean} goto clean
goto thesis
:clean
@rem =============================================
@rem ����ĵ����ɹ����в�������ʱ�ļ�
@rem =============================================
echo ɾ���ĵ����ɹ����в�������ʱ�ļ�
del /f /q spine.pdf *.log *.aux *.out *.thm *.bbl *.blg *.toc *.lot *.lof *.*~
del /f data\*.aux data\*.*~
goto end
:thesis
@rem =============================================
@rem ����ʾ���ĵ�
@rem =============================================
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
set errmsg=bibtex
call bibtex %Thesismain%
if errorlevel 1 goto error
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
goto end
:a3cover
@rem =============================================
@rem ����A3����
@rem =============================================
set errmsg=%Method%
call %Method% spine.tex
call %Method% a3cover.tex
@rem =============================================
@rem ʾ���ļ����ɹ����г�����
@rem =============================================
:error
echo ʹ��%errmsg%����%Thesismain%.pdf�Ĺ����г���
:end
@rem =============================================
@rem ִ�н���
@rem =============================================
@rem ----------------------------------------------------------------------
@rem END OF FILE
@rem ----------------------------------------------------------------------
