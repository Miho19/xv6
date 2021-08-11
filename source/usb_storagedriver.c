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


#define BLOCK_MASK (BSIZE -1)
#define MIN(x, y) (((x) < (y)) ? (x) : (y))


char name[] = "USB STORAGE DRIVER |";

struct usbstorage_handler usbsh; 


static void handlerinit(void) {
	memset(&usbsh, 0, sizeof(usbsh));
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

/** 
 *  sec is the address block -> 0, 1, 2 ... 1024 -> not file offset
 * 
*/

int usb_wsec(int sec, uchar *buf){
	int result = 0;

	if(sec > 1024 || sec < 0 || !buf)
		return result;

	result = USPiMassStorageDeviceWrite(sec * BSIZE, buf, BSIZE, 0);

	if(result != BSIZE){
		cprintf("%s (%d) bytes written opposed to (%d)\n", name, result, BSIZE);
	}
	return result;
}


int usb_rsec(int sec, uchar *buf) {
	int result = 0;

	if(sec > 1024 || sec < 0 || !buf)
		return result;
	
	result = USPiMassStorageDeviceRead(sec * BSIZE, buf, BSIZE, 0);

	if(result != BSIZE){
		cprintf("%s (%d) bytes read opposed to (%d)\n", name, result, BSIZE);
	}

	return result;

}









