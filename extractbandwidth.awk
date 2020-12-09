#!/usr/bin/awk -f

match($0, /READ: bw=[[:digit:]\.]+MiB\/s \(([[:digit:]\.]+)MB\/s\),/, speed) {
	print speed[1]
}

