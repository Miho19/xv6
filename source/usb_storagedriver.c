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
#define MEGABYTE 1000000

#define DEVICE_STORAGE_MAX 1900
#define MAX_INDEX_BYTE (DEVICE_STORAGE_MAX * MEGABYTE)

#define array_length(a) (sizeof(a) / sizeof(a[0]))


#define BLOCK_MASK (BLOCK_SIZE -1)

char name[] = "USB STORAGE DRIVER |";

struct device_handler device_handler[MAX_DEVICE];


void dhandlerinit(void) {
	memset(&device_handler, 0, sizeof(struct device_handler) * MAX_DEVICE);
}

/** 
	init the USB storage
*/

void storageinit(void) {
	
	dhandlerinit();
	device_handler[0].usb_active = 1;
}

void storage_free(void){
	
}

#define MIN(x, y) (((x) < (y)) ? (x) : (y))
/**
*
*	write function
*	
*
*/

int usb_storage_write(struct file *f, char *buf, int num){

	int total = 0;
	uint offset = 0;
	uint result = 0;
	uint m = 0;

	char buffer[512];

	if(!f || !buf || !num)
		return total;

	offset = f->off;

	if( (offset & BLOCK_MASK) != 0){
		cprintf("offset %d % 512 != 0\n", offset);
		return total;
	}

	if( (num & BLOCK_MASK) != 0) {
		cprintf("Num %d % 512 != 0\n", num);
		return total;
	}

	for(total = 0; total < num; total += m, offset += m) {
		memset(buffer, 0, sizeof buffer);	
		result = USPiMassStorageDeviceRead(offset, buffer, 512, 0);

		if(result != 512) {
			cprintf("read attempt not 512\n");
			return 0;
		}

		m = MIN(512, num - total % 512);
		memmove(buffer + offset % 512, buf + total, m);
		
		result = USPiMassStorageDeviceWrite(offset, buffer, 512, 0);

		if(result != 512) {
			cprintf("Write attempt not 512\n");
			return 0;
		}

	}

	f->off = offset;

	return total;	

}

/**
*
*	Read Function
*
*
*
*/

int usb_storage_read(struct file *f, char *buf, int num) {

	int total = 0;
	uint offset = 0;
	uint result = 0;
	uint m = 0;
	char buffer[512];


	if(!buf || !num || !f) {
		return total;
	}

	offset = f->off;

	if((offset & BLOCK_MASK) != 0){
		cprintf("Offset not %d % 512 == 0\n", offset);
		return total;
	}

	if((num & BLOCK_MASK) != 0){
		cprintf("num not %d % 512 == 0\n", num);
		return total;
	}

	for(total = 0, offset = f->off; total < num; total += m, offset += m) {
		memset(buffer, 0, sizeof buffer);
		result = USPiMassStorageDeviceRead(offset, buffer, 512, 0);
		
		if(result != 512){
			cprintf("result != 512\n");
			return 0;
		}

		m = MIN(result - offset % 512, num - total);
		memmove(buf + total, buffer + offset % 512, m);   
	}

	f->off = offset;

	return total;
} 
