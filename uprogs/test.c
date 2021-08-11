#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"


int main(int argc, char *argv[]) {

	struct dirent *de;

	uint offset = 0;
	int fd = 0;
	int result = 0;

	unsigned char buffer[BSIZE];

	result = mount("/usb");
	printf(1, "result == %d\n", result);

	fd = open("/usb", 0);
	if(fd < 0){
		printf(1, "Did not open /usb\n");
		exit();
	}

	result = read(fd, buffer, BSIZE);

	for(offset = 0; offset < BSIZE; offset += sizeof(struct dirent)){
		de = (struct dirent *)(buffer + offset);
		if(de->inum == 0)
			continue;
		printf(1, "(%d) (%s)\n", de->inum, de->name);
	}

	close(fd);
	exit();	
}
