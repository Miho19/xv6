#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

#include "fcntl.h"


int main(int argc, char *argv[]) {

	int result = 0;
	int fd = 0;
	char buffer[512];
	uint offset = 0;

	char path[] = "/usb/new_file.txt";

	fd = open(path, O_CREATE | O_RDWR);	
	
	if(fd < 0){
		printf(1, "%s failed to open\n", path);
		exit();
	}

	memset(buffer, 0, sizeof buffer);
	
	for(offset = 0; offset < 512; offset++) {
		buffer[offset] = 65 + (offset % 58);
	}

	if(lseek(fd, 0, 0) != 0){
		printf(1, "lseek error\n");
		close(fd);
		exit();
	}

	result = write(fd, buffer, 512);
	printf(1, "Write %d bytes\n", result);
			
	close(fd);
	exit();	
}
