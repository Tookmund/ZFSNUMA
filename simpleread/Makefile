TARGETS = simpleread huge-simpleread

all: $(TARGETS)

huge-simpleread: simpleread.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DHUGE -Og -g -o $@ $^

clean:
	rm -f $(TARGETS)

.PHONY: all clean
