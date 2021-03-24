TARGETS = simpleread 100M-simpleread 1G-simpleread

all: $(TARGETS)

100M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=100000000 -Og -g -o $@ $^

1G-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=1000000000 -Og -g -o $@ $^

clean:
	rm -f $(TARGETS)

.PHONY: all clean
