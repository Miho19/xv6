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

}

void storage_free(void){
	
}

/**
*
*	write function
*	
*
*/

int usb_storage_write(struct file *f, char *buf, int num){
	
	int result;								/** Amount of bytes read from USB device */
	int i;									/** increment variable */

	char buffer_write_temp[BLOCK_SIZE];		/** Tempoary buffer which holds data from USB device*/
	int  buf_index;							/** Current index within the users buffer */


	int file_position;						/** Current index within the user file */
	int file_start_of_block_position; 		/** Used to find the nearest start of a block within the USB Device */

	int total_amount_to_write;				/** Amount of bytes we are able to return to the user*/
	int current_amount_write;				/** Current amount of bytes we have read into the user provided buffer */	
	



	result = 0;
	buf_index = 0;
	file_position = 0;
	file_start_of_block_position = 0;
	total_amount_to_write = 0;
	current_amount_write = 0;
	
	device_handler[0].usb_active = 1;	/** Enable CPU yield() to await USB response*/
	file_position = f->off;
	total_amount_to_write = num;

	if(total_amount_to_write > MAX_INDEX_BYTE)
		total_amount_to_write =  MAX_INDEX_BYTE;
	

	if(file_position + total_amount_to_write > MAX_INDEX_BYTE)
		total_amount_to_write = MAX_INDEX_BYTE - file_position;
	

	if(total_amount_to_write <= 0)
		return 0;
	
	while(current_amount_write < total_amount_to_write) {
		
		for(i=0;i<BLOCK_SIZE;i++)																/** Zero the entire buffer*/
			buffer_write_temp[i] = 0;

		if((total_amount_to_write & BLOCK_MASK) != 0 || (file_position & BLOCK_MASK) != 0) {	/** Make a user request a block request*/
			file_start_of_block_position = file_position;
			
			while((file_start_of_block_position & BLOCK_MASK) != 0 && file_start_of_block_position > 0)	/** determine nearest start position of a block*/
				file_start_of_block_position--;
			result = USPiMassStorageDeviceRead(file_start_of_block_position, buffer_write_temp, BLOCK_SIZE, DEVICE_NUMBER);
			if(result != BLOCK_SIZE) {
				cprintf("%s adjsuted read during write expected %d but returned %d \n", name, BLOCK_SIZE, result);
			}
			
			for(i=(file_position % BLOCK_SIZE);i<BLOCK_SIZE && buf_index < total_amount_to_write;i++, buf_index++)
				buffer_write_temp[i] = buf[buf_index];
				
			result = USPiMassStorageDeviceWrite(file_start_of_block_position, buffer_write_temp, BLOCK_SIZE, DEVICE_NUMBER);
			
			if(result != BLOCK_SIZE) {
				cprintf("%s adjusted write expected %d but returned %d \n", name, BLOCK_SIZE, result);
			}
		
			file_position += i;
			current_amount_write += i;
			
		} else {
			for(i=0;buf_index < total_amount_to_write && i < BLOCK_SIZE;i++, buf_index++)
				buffer_write_temp[i] = buf[buf_index];
			result = USPiMassStorageDeviceWrite(file_position, buffer_write_temp, BLOCK_SIZE, DEVICE_NUMBER);
			
			if(result != BLOCK_SIZE) {
				cprintf("%s block write expected %d but returned %d \n", name, BLOCK_SIZE, result);
			}

			current_amount_write += i;
			file_position += i;
		} 
	
	}



	f->off = file_position;

	return buf_index;

}

/**
*
*	Read Function
*
*
*
*/

int usb_storage_read(struct file *f, char *buf, int num) {

	int result;								/** Amount of bytes read from USB device */
	int i;									/** increment variable */

	char buffer_read_temp[BLOCK_SIZE];		/** Tempoary buffer which holds data from USB device*/
	int buf_index;							/** Current index within the users buffer */


	int file_position;						/** Current index within the user file */
	int file_start_of_block_position; 		/** Used to find the nearest start of a block within the USB Device */

	int total_amount_to_read;				/** Amount of bytes we are able to return to the user*/
	int current_amount_read;				/** Current amount of bytes we have read into the user provided buffer */	
	
	result = 0;								/** initialise variables */

	buf_index = 0;
	file_position = 0;
	total_amount_to_read = 0;
	current_amount_read = 0;
	file_start_of_block_position = 0;
	device_handler[0].usb_active = 1;		/** Make process yield() when waiting for USB to respond */


	total_amount_to_read = num;				/** Determine the correct amount of bytes we can request */
	if(total_amount_to_read > MAX_INDEX_BYTE) {
		total_amount_to_read = MAX_INDEX_BYTE;
	}

	file_position = f->off;
	if(file_position + total_amount_to_read > MAX_INDEX_BYTE) {
		total_amount_to_read = MAX_INDEX_BYTE - file_position;
	}

	if(total_amount_to_read <= 0)
		return 0;
	
	while(current_amount_read < total_amount_to_read) {

		if((total_amount_to_read & BLOCK_MASK) != 0 || (file_position & BLOCK_MASK) != 0 ) { /** Make the user request a block request */
			file_start_of_block_position = file_position;

			while( (file_start_of_block_position &BLOCK_MASK) != 0 && file_start_of_block_position > 0) /** Find nearest start of a block */
				file_start_of_block_position--;

			result = USPiMassStorageDeviceRead(file_start_of_block_position, buffer_read_temp,BLOCK_SIZE, DEVICE_NUMBER);	/** Read in block */
			if(result < BLOCK_SIZE) {
				cprintf("%s adjsuted read expected %d but returned %d \n", name, BLOCK_SIZE, result);
			}

			for(i=(file_position % BLOCK_SIZE);i<BLOCK_SIZE && buf_index < total_amount_to_read;i++, buf_index++)	/** copy data sent from USB to user buffer */ 
				buf[buf_index] = buffer_read_temp[i];

			file_position += i;																						/** current_amount_read and buf_index should be equal*/
			current_amount_read += i;			  			
		} else {
			result = USPiMassStorageDeviceRead(file_position, buffer_read_temp, BLOCK_SIZE, DEVICE_NUMBER);			/** request is asking from start of a block and 512 * n amount*/
			if(result < BLOCK_SIZE) {
				cprintf("%s standard block read expected %d but returned %d \n", name, BLOCK_SIZE, result);
			}
			for(i=0;i<BLOCK_SIZE && buf_index < total_amount_to_read;i++,buf_index++)
				buf[buf_index] = buffer_read_temp[i];
			file_position += i;
			current_amount_read += i;
		} 		
	}
		
	

	f->off = file_position;																							
	
	return buf_index;
}
