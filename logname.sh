for i in *.log
do
	mv "$i" "$(grep -e '[BU]\.[01]\..*[^!]$' "$i" | head -1)"
done
