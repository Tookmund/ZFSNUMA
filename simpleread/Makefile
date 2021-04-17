TARGETS = simpleread \
		  2M-simpleread \
		  4M-simpleread \
		  8M-simpleread \
		  16M-simpleread \
		  32M-simpleread \
		  64M-simpleread \
		  128M-simpleread \
		  256M-simpleread \
		  512M-simpleread \
		  1G-simpleread
CFLAGS = -Og -g

all: $(TARGETS)

1M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=1000000 -o $@ $^

2M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=2000000 -o $@ $^

4M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=4000000 -o $@ $^

8M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=8000000 -o $@ $^

16M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=16000000 -o $@ $^

32M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=32000000 -o $@ $^

64M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=64000000 -o $@ $^

128M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=128000000 -o $@ $^

256M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=256000000 -o $@ $^

512M-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=512000000 -o $@ $^

1G-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE=1000000000 -Og -g -o $@ $^

clean:
	rm -f $(TARGETS)

.PHONY: all clean
