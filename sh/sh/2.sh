# 10 31 53 77 105 141 .....
y=21
x=10
for i in $(seq 0 5)
do
	echo $x
	x=$[$x+$y]
	z=$[2**$i]
	y=$[$y+$z]
done
