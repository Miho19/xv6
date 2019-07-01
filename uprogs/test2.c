#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "file.h"


int main(int argc, char *argv[]) {
unsigned char buf[512];

mknod(argv[1], 20, 20);
int fd = open(argv[1], O_RDWR);
read(fd,&buf,512);

for(;;);



close(fd);
free(buf);
exit();
}
