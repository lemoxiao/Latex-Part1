Files=dir(strcat('d:\\MATLAB7\work\' ,'*.avi'));%����������Ƶ���ļ���
x=5 ;    %���ü��֡��
for i=1:length(Files)
    i
    mov=aviread(Files(i).name);   %�����ȡ��Ƶ�ļ����д���
    savefile1=tqqz(Files(i).name);  %��ȡ�ļ�����ǰ׺
    p=mov;                    
    clear mov
   average(p,x,savefile1);     %�����ݴ��ݸ�average����������ƽ��ֵ����ռ��������ͼ
end
