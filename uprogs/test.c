#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"

int main(int argc, char *argv[]) {
	int i;
	int result;
	int fd;

	char *read_buf;
	char *write_buf;

	read_buf = malloc(sizeof(*read_buf) * 512);
	write_buf = malloc(sizeof(write_buf) * 512);


	strcpy(write_buf, "Hello world!");



	if(mknod(argv[1],15,15) < 0) {
		printf(1,"mknod failure");
		goto clean;
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
		printf(1,"Could not open %s \n", argv[1]);
		goto clean;
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);


	result = write(fd, write_buf, 512);

	if(result != 512){
		printf(1, "write %d\n", result);
	}


	result = read(fd, read_buf, 512);

	if(result != 512) {
		printf(1, "read %d\n", result);
	}




	for(i=0;i<512;i++){
		printf(1, "%d", read_buf[i]);
	}


	
	clean:
	free(read_buf);
	free(write_buf);
	close(fd);
	
		
	return 1;
}
