#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

#define BLOCK_SIZE 512

int main(int argc, char *argv[]) {
	
	int fd;
	char buffer[512];
	int result;
	int offset = 0;
	struct dirent *de;
	
	result = 0;
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

	

	lseek(fd, 29 * BLOCK_SIZE, 0);


	result = read(fd,buffer , 512);

	if(result != 512) {
		printf(1, "read %d\n", result);
	}

	de = (struct dirent*)buffer;
	
	for(offset = 0; offset < 512; offset += sizeof(struct dirent)){
		
		de = (struct dirent*)(buffer + offset % 512);
		if(de->inum == 0)
			continue;
		printf(1, "(%d, %s), ", de->inum, de->name);
	}

	printf(1, "\n");

	close(fd);
	exit();	
}
