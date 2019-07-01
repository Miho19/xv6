#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"




int fd;
unsigned char buf[512];

void clean(void){
	free(buf);
	if(fd > 0)
		close(fd);
	exit();
}

int main(int argc, char *argv[]) {
	


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

	if(read(fd,&buf,512)< 0) {
		printf(1, "Did not read all bytes\n");
		sleep(10);
		printf(1,"bytes read: %d\n",read(fd,&buf,512));
	} 
	clean();
}
