/** 
	USB File storage driver code

*/
#include "types.h"
#include "defs.h"
#include "fs.h"
#include "file.h"
#include "usb_filestorage.h"
#include "uspi.h"
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

/** 
	Test code for reading and writing before schedular 
*/


void readTest(void) {
	int result;
	unsigned char readBuffer[512];
	device_handler[0].usb_active = 0;					// disable yield for before schedular
	memset(&readBuffer, 0, sizeof(readBuffer[0]) * 512);
	
	result = 0;
	result = USPiMassStorageDeviceRead(512 * 66, readBuffer, 512, 0);
	if(result != 512){
		cprintf("Read error %d \n", result);
		return;
	}
	cprintf("USB storage read successful\n");
}





