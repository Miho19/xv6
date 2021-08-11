/** 
	USB storage driver code

*/
#include "types.h"
#include "defs.h"
#include "fs.h"
#include "file.h"
#include "uspi.h"
#include "uspios.h"
#include "uspi/util.h"

#define DEVICE_NUMBER 0
#define BLOCK_SIZE 512

#define BLOCK_MASK (BLOCK_SIZE -1)

char name[] = "USB STORAGE DRIVER |";

struct usbstorage_handler usbsh; 


static void handlerinit(void) {
	memset(&usbsh, 0, sizeof(struct usbstorage_handler));
	memset(usbsh.path, 0, sizeof usbsh.path);	
}

/** 
	init the USB storage
*/

void storageinit(void) {
	handlerinit();	
}

void storage_free(void){
	
}



static uint usbblkstart(uint offset) {
	
	if((offset & BLOCK_MASK) == 0)
		return offset;


	while((offset & BLOCK_MASK) != 0 && offset > 0) {
		offset--;	
	}
	
	return offset;
}
#define MIN(x, y) (((x) < (y)) ? (x) : (y))


/**
*
*	write function
*	
*
*/

int usb_wsec(uint num, const char *buf){

	int total = 0;
	uint offset = 0;
	uint result = 0;
	uint m = 0;
	uint align = 0;

	char buffer[BSIZE];

	if(!ip || !buf || !num)
		return total;



	for(total = 0, offset = f->off ; total < num; total += m, offset += m) {
		memset(buffer, 0, sizeof buffer);
		align = usbblkstart(offset);
	
		result = USPiMassStorageDeviceRead(align, buffer, BSIZE, 0);

		if(result != BSIZE) {
			cprintf("%s write: read: expected (512) bytes recieved (%d) bytes\n", name, result);
			return 0;
		}

		m = MIN(BSIZE, num - total);
		memmove(buffer + offset % 512, buf + total, m);
		
		result = USPiMassStorageDeviceWrite(align, buffer, 512, 0);

		if(result != BSIZE) {
			cprintf("%s write: (%d) were written when expected (512)\n", name, result);
			return 0;
		}

	}

	return total;	

}

/**
*
*	Read Function
*
*
*
*/

int usb_storage_read(struct inode *ip, char *buf, int num) {

	int total = 0;
	uint offset = 0;
	uint result = 0;
	uint m = 0;
	char buffer[BSIZE];
	uint align = 0;

	if(!buf || !num || !ip) {
		return total;
	}
	

	for(total = 0, offset = f->off; total < num; total += m, offset += m) {
		memset(buffer, 0, sizeof buffer);
		align = usbblkstart(offset);
		result = USPiMassStorageDeviceRead(align, buffer, BSIZE, 0);
		
		if(result != BSIZE){
			cprintf("%s read: Expected (512) bytes read but recieved (%d)\n", name, result);
			return 0;
		}

		m = MIN(result - offset % BSIZE, num - total);
		memmove(buf + total, buffer + offset % BSIZE, m);   
	}

	f->off = offset;

	return total;
} 
