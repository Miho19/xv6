#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"

char *read_buf;
char *write_buf;



void clean(int fd){
	free(read_buf);
	free(write_buf);
	if(fd)
		close(fd);
	exit(0);
}

int main(int argc, char *argv[]) {
	int i;
	int result;
	int size;
	int fd;

	read_buf = malloc(sizeof(*read_buf) * 512);
	write_buf = malloc(sizeof(write_buf) * 512);


	char send_text[13] = {72,101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33};
	
	size = (int)sizeof(send_text);


	for(i=0;i<size;i++)
		write_buf[i] = send_text[i];


	fd = 0;


	if(mknod(argv[1],15,15) < 0) {
		printf(1,"mknod failure");
		clean(fd);
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
		printf(1,"Could not open %s \n", argv[1]);
		clean(fd);
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);


	result = write(fd, write_buf, size);

	if(result != size){
		printf(1, "write %d\n", result);
	}

	lseek(fd, 0, 0);

	size = result;
	result = read(fd, read_buf, size);

	if(result != size) {
		printf(1, "read %d\n", result);
	}

	for(i=0;i<result;i++){
		printf(1, "%d", read_buf[i]);
	}

	printf(1, "\n");

	return 1;
}
