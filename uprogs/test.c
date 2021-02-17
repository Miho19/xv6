#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"

#define BLOCK_NUMBER 1024

#define POS (512 * BLOCK_NUMBER)

char *read_buf;
char *write_buf;



void clean(int fd){
	free(read_buf);
	free(write_buf);
	if(fd)
		close(fd);
	
}

int main(int argc, char *argv[]) {
	int i;
	int result;
	int size;
	int fd;

	read_buf = malloc(sizeof(read_buf[0]) * 512);
	write_buf = malloc(sizeof(write_buf[0]) * 512);


	char send_text[13] = {72,101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33};
	
	size = (int)sizeof(send_text);


	for(i=0;i<size;i++)
		write_buf[i] = send_text[i];


	fd = 0;


	if(mknod(argv[1],15,15) < 0) {
		printf(1,"Already a device\n");
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
		printf(1,"Could not open %s \n", argv[1]);
		clean(fd);
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);

	

	lseek(fd, POS, 0);

	result = write(fd, write_buf, 512);

	if(result != size){
		printf(1, "write %d\n", result);
	}

	lseek(fd, POS, 0);

	result = read(fd, read_buf, 512);

	if(result != size) {
		printf(1, "read %d\n", result);
	}

	printf(1,"%s\n", read_buf);

	printf(1, "\n");

	free(write_buf);
	free(read_buf);
	close(fd);
	exit();	
}
