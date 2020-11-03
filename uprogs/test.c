#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"




int fd;
unsigned char *buf;

void clean(void){
	free(buf);
	if(fd > 0)
		close(fd);
	exit();
}

int main(int argc, char *argv[]) {
	int i;
	buf = malloc(512*sizeof(buf));	


	if(mkdir("dev") != 0){
		printf(1,"did not make dev\n");
	}
	if(chdir("dev") < 0){
		printf(1,"could not change dir into dev\n");
	}

	if(argc < 1) {
		printf(1,"Usage: test filepath\n");
		clean();
	}
	
	if(mknod(argv[1],15,15) < 0) {
		printf(1,"mknod failure");
		clean();
	}
	

	if( (fd = open(argv[1],O_RDWR)) < 0 ){
		printf(1,"Could not open %s \n", argv[1]);
		clean();
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);


	read(fd, buf, 512);
	for(i=0;i<512;i++){
		printf(1, "%d", buf[i]);
	}
	printf(1,"\n");
	printf(1,"somehow we left the looop\n");
 
	clean();
}
