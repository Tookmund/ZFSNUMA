#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char **argv) {
	if (argc < 2) {
		fputs("simpleread <buffersize (in bytes)>\n", stderr);
		return 1;
	}

	size_t bufsize = atol(argv[1]);

	/* char is always 1, so we can skip sizeof */
	char *buf = malloc(bufsize);
	if (buf == NULL) {
		perror("simpleread buf malloc");
		return 2;
	}

	for (size_t i = 0; i < bufsize; i++) buf[i] = i % 255;

	return 0;
}
