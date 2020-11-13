for i in *.log
do
	mv "$i" "$(head -n 1 "$i")"
done
