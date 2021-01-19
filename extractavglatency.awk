#!/usr/bin/awk -f

match($0, /clat \([nu]sec\): min=[[:space:]]*[[:digit:]\.]+, max=[[:space:]]*[[:digit:]\.]+, avg=[[:space:]]*([[:digit:]\.]+), stdev=[[:space:]]*[[:digit:]\.]+/, avg) {
	print avg[1]
}
