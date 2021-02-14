/** 
	USB storage driver code

*/
#include "types.h"
#include "defs.h"
#include "fs.h"
#include "file.h"
#include "uspi.h"
#include "uspios.h"

#define DEVICE_NUMBER 0
#define BLOCK_SIZE 512

#define array_length(a) (sizeof(a) / sizeof(a[0]))


struct device_handler device_handler[MAX_DEVICE];


void dhandlerinit(void) {
	memset(&device_handler, 0, sizeof(struct device_handler) * MAX_DEVICE);
}

/** 
	init the USB storage
*/

void storageinit(void) {
	
	dhandlerinit();

}

void storage_free(void){
	
}


int usb_storage_write(struct file *f, char *buf, int num){
	int result;
	int i;

	char buffer[512];

	result = 0;
	device_handler[0].usb_active = 1;

	for(i=0;i<num;i++)
		buffer[i] = buf[i];


	result = USPiMassStorageDeviceWrite(BLOCK_SIZE * f->off, buffer, 512, DEVICE_NUMBER);

//	cprintf("USB_FILEWRITE DEBUG: file off -> %d\n result -> %d\n new offset -> %d\n",f->off, result, f->off + result);

	f->off += result;

	return result;

}



int usb_storage_read(struct file *f, char *buf, int num) {
	int result;
	char buffer[512];
	int i;

	result = 0;
	device_handler[0].usb_active = 1;

	
	result = USPiMassStorageDeviceRead(BLOCK_SIZE * (int)f->off, buffer, 512, 0);

	//cprintf("\n\nUSB_FILEREAD DEBUG:file off -> %d\n result -> %d\n new offset -> %d\n",f->off, result, f->off + result);

	for(i=0;i<num;i++)
		buf[i] = buffer[i];


	f->off += result;
	
	return result;
}
