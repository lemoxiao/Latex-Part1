��Linux�û����������ֺô�Сд���ر�ע����չ��

�����ǽ���չ��PNGȫ����Ϊpng
for i in $(ls | grep PNG);do mv -vi $i $(echo $i |cut -d "." -f1).png ;done
