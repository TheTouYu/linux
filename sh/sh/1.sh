# 检测新文件
# 定时输出 日志 年，月，日，时，分
basedir=/tmp
time=$(date +%Y%m%d%H%M)

find $basedir -type f -mmin -5 > /tmp/file.list
# 统计分析 wc -l 
number_line=$(wc -l /tmp/file.list | awk '{print $1}')

if [ $number_line -gt 0 ]
then
	mv /tmp/file.list /tmp/$t.list
fi
