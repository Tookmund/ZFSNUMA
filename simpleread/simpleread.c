#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

/* simpleread <filename> <blocksize (in KB)> */
int main(int argc, char **argv)
{
	if (argc < 3)
	{
		fputs("simpleread <filename> <blocksize (in KB)>\n", stderr);
		return 1;
	}

	char *filename = argv[1];

	double inputsize = atof(argv[2]);
	if (inputsize < 0)
	{
		perror("simpleread block size");
		return 2;
	}
	/* blocksize should be in KB */
	int blocksize = (int)(1024*inputsize);

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
