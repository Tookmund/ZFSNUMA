#!/usr/bin/awk -f

match($0, /99\.00th=\[[[:space:]]*([[:digit:]]+)\],/, ninetynine) {
	print ninetynine[1]
}
