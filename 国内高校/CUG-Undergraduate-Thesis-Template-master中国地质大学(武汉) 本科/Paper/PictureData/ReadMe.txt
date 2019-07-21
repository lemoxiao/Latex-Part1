对Linux用户，必需区分好大小写，特别注意扩展名

下例是将扩展名PNG全部改为png
for i in $(ls | grep PNG);do mv -vi $i $(echo $i |cut -d "." -f1).png ;done
