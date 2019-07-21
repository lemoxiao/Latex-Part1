Files=dir(strcat('d:\\MATLAB7\work\' ,'*.avi'));%读入所有视频的文件名
x=5 ;    %设置间隔帧数
for i=1:length(Files)
    i
    mov=aviread(Files(i).name);   %逐个读取视频文件进行处理
    savefile1=tqqz(Files(i).name);  %提取文件名的前缀
    p=mov;                    
    clear mov
   average(p,x,savefile1);     %将数据传递给average（）函数求平均值、所占比例并画图
end
