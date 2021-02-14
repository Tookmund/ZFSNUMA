for i in *.log
do
	mv "$i" "$(grep -e '[BU]\.[01]\.fio.*[^!]$' "$i")"
done
