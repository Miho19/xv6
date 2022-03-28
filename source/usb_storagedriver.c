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


#define BLOCK_MASK (BSIZE - 1)
#define MIN(x, y) (((x) < (y)) ? (x) : (y))


char name[] = "USB STORAGE DRIVER |";

struct usbstorage_handler usbsh; 


static void handlerinit(void) {
	memset(&usbsh, 0, sizeof(usbsh));
}

/** 
	init the USB storage
*/

void storageinit(void) {
	handlerinit();	
}

void storage_free(void){
	
}



/** 
 *  sec is the address block -> 0, 1, 2 ... 1024 -> not file offset
 * 
*/

int usb_wsec(int sec, uchar *buf){
	int result = 0;
	char buffer[BSIZE];


	memset(buffer, 0, BSIZE);


	if(sec > 1024 || sec < 0 || !buf)
		return result;


	memmove(buffer, buf, BSIZE);
	

	usbsh.usb_active = 1;

	
	result = USPiMassStorageDeviceWrite(sec * BSIZE, buffer, BSIZE, 0);

	

	usbsh.usb_active = 0;

	if(result != BSIZE){
		return result;
	}
	return result;
}


int usb_rsec(int sec, uchar *buf) {
	int result = 0;
	char buffer[BSIZE];

	memset(buffer, 0, BSIZE);

	if(sec > 1024 || sec < 0 || !buf)
		return result;

	
	usbsh.usb_active = 1;
	result = USPiMassStorageDeviceRead(sec * BSIZE, buffer, BSIZE, 0);

	usbsh.usb_active = 0;


	memmove(buf, buffer, result);

	if(result != BSIZE){
		return result;
	}

	return result;

}









