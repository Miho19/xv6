#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]) {
	int fd;
	if(argc <= 1) {
		printf(1,"invalid argument length");
		exit();
	}

	fd = open(argv[1],0);
	printf(1,"argc: %d argv: %s\n", argc, argv[1]);
	close(fd);

	exit();
}
