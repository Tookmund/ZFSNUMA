for i in *.log
do
	mv "$i" "$(grep -e '[BUTM]\.[01]\..*[^!]$' "$i" | head -1)"
done
