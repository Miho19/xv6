#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

#define BLOCK_SIZE 512

int main(int argc, char *argv[]) {
	
	int fd;
	char buffer[512];
	struct superblock *s;
	int result;
	
	result = 0;
	s = 0;
	fd = 0;
	memset(buffer, 0, sizeof buffer);

	
	
	if(mknod(argv[1],15,15) < 0) {
		printf(1,"Already a device\n");
	}
	
	if( (fd = open(argv[1],0x002)) < 0 ){
		printf(1,"Could not open %s \n", argv[1]);
		close(fd);
		exit();
	}

	printf(1,"opened : %s FD: %d\n",argv[1],fd);

	

	lseek(fd, 1 * BLOCK_SIZE, 0);


	result = read(fd,buffer , 512);

	if(result != 512) {
		printf(1, "read %d\n", result);
	}

	s = (struct superblock*)buffer;
	
	printf(1, "superblock -> size: %d\n", s->size);




	close(fd);
	exit();	
}
