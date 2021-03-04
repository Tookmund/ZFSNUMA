#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#ifdef HUGE
// Borrowed from Stack Overflow
// https://stackoverflow.com/questions/43520681/increase-binary-executable-size
#define SIZE 100000000
char huge[SIZE] = {'a'};
#endif

int main(int argc, char **argv) {
	if (argc < 3) {
		fputs("simpleread <filename> <blocksize (in bytes)>\n", stderr);
		return 1;
	}

	char *filename = argv[1];
	int blocksize = atoi(argv[2]);

	int fd = open(filename, 0);
	if (fd < 0) {
		fprintf(stderr, "Open file \"%s\"\n", filename);
		perror("simpleread open file");
		return 2;
	}

	/* char is always 1, so we can skip sizeof */
	char *buf = malloc(blocksize);
	if (buf == NULL) {
		perror("simpleread buf malloc");
		return 3;
	}

#ifdef HUGE
	for (int i = 0; i < SIZE; i++) huge[i] = i % 255;
#endif

	size_t bytes = 1;
	while (bytes > 0) {
		bytes = read(fd, buf, blocksize);
	}

	if (errno != 0) {
		printf("%d\n", errno);
		perror("simpleread read");
		return 4;
	}
	return 0;
}
