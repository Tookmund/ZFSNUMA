#!/usr/bin/awk -f

match($0, /50\.00th=\[[[:space:]]*([[:digit:]]+)\],/, fifty) {
	print fifty[1]
}
