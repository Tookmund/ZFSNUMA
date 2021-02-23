#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	if (argc < 3)
	{
		fputs("simpleread <filename> <blocksize (in bytes)>\n", stderr);
		return 1;
	}

	char *filename = argv[1];

	int blocksize = atoi(argv[2]);
	if (blocksize < 0)
	{
		perror("simpleread block size");
		return 2;
	}

	int fd = open(filename, 0);
	if (fd < 0)
	{
		fprintf(stderr, "Open file \"%s\"\n", filename);
		perror("simpleread open file");
		return 3;
	}

	char buf[blocksize];
	size_t bytes = 1;

	while (bytes > 0) bytes = read(fd, buf, sizeof(buf));

	if (errno != 0)
	{
		printf("%d\n", errno);
		perror("simpleread read");
		return 4;
	}
	return 0;
}
