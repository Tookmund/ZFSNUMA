#!/usr/bin/awk -f

match($0, /real[[:space:]]+([[:digit:]]+)m([[:digit:]]+\.[[:digit:]]+)s/, time) {
	print (time[1]*60)+time[2]
}
