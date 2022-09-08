sum=0

if [ -z $1 ] #字符非空
then
	echo "请输入一个文件"
	exit
fi

if [ ! -f $1 ] #文件存在
then
	echo "你输入的不是一个文件"
	exit
fi

while read line
do
	line_n=$(echo $line|sed 's/[^0-9]//g' |wc -L)
	echo $line_n $line
	let sum+=line_n #sum=$[$sum+$line_n]
done < $1

echo "sum:$sum"
