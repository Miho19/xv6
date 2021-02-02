/** 
	USB File storage driver code

*/
#include "types.h"
#include "defs.h"
#include "fs.h"
#include "file.h"
#include "usb_filestorage.h"
#include "uspi.h"

#include "uspios.h"

#define DEVICE_NUMBER 0

#define BLOCK_SIZE 512

#define BUFFER_SIZE 2048

#define array_length(a) (sizeof(a) / sizeof(a[0]))


struct device_handler device_handler[MAX_DEVICE];

char *usb_temp_buffer;

void dhandlerinit(void) {
	memset(&device_handler, 0, sizeof(struct device_handler) * MAX_DEVICE);
}

/** 
	init the USB storage
*/

void storageinit(void) {
	int i;
	dhandlerinit();

	usb_temp_buffer = NULL;
	

	usb_temp_buffer = malloc(sizeof(usb_temp_buffer[0]) * BUFFER_SIZE);

	if(usb_temp_buffer == NULL){
		cprintf("usb_temp_buffer not allocated\n");
	}

	for(i=0;i<BUFFER_SIZE;i++)
		usb_temp_buffer[i] = 0;
	cprintf("usb_file_storage init\n");
}

void storage_free(void){
	free(usb_temp_buffer);
}


int usb_filewrite(struct file *f, char *buf, int num){
	int result;
	int i;

	result = 0;
	device_handler[0].usb_active = 1;

	for(i=0;i<num;i++)
		usb_temp_buffer[i] = buf[i];

	result = USPiMassStorageDeviceWrite(BLOCK_SIZE * f->off, usb_temp_buffer, num, DEVICE_NUMBER);

	cprintf("USB_FILEWRITE DEBUG: file off -> %d\n result -> %d\n new offset -> %d\n",f->off, result, f->off + result);

	f->off += result;

	return result;

}



int usb_fileread(struct file *f, char *buf, int num) {
	int result;
	int i;

	result = 0;
	device_handler[0].usb_active = 1;
	
	result = USPiMassStorageDeviceRead(BLOCK_SIZE * f->off, usb_temp_buffer, num, DEVICE_NUMBER);

	cprintf("USB_FILEREAD DEBUG:file off -> %d\n result -> %d\n new offset -> %d\n",f->off, result, f->off + result);

	for(i=0;i<result;i++){
		buf[i] = temp_buffer[i];
	}

	f->off += result;
	
	return result;
}
