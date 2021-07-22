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


//	device_handler[0].usb_active = 0;	/** Disable CPU yield() to await USB response*/
	
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

	int current_read_amount;
	int progress;
	int read_amount;
	char *_buf;
	char buffer[512];
	int result;
		
	uint current_pos;
	uint block_start_pos;
	
	

	progress = 0;
	read_amount = 0;
	current_pos = 0;
	block_start_pos = 0;
	current_read_amount = 0;
	_buf = 0;

	if(!buf || !num)
		return 0;
	_buf = buf;

	device_handler[0].usb_active = 1;
	current_pos = f->off;

	read_amount = num;

	if(read_amount > MAX_INDEX_BYTE)
		read_amount = MAX_INDEX_BYTE;

	if(read_amount + f->off > MAX_INDEX_BYTE)
		read_amount = MAX_INDEX_BYTE - f->off;
	
	if(read_amount <= 0)
		return 0;  
	
	while(progress < read_amount) {
		current_read_amount = (read_amount - BLOCK_SIZE) > 0 ? BLOCK_SIZE : read_amount;
		
		if((current_read_amount & BLOCK_MASK) != 0 || (current_pos & BLOCK_MASK) != 0) {
			block_start_pos = current_pos;
			
			while((block_start_pos & BLOCK_MASK) != 0 && block_start_pos > 0)
				block_start_pos--;
			
			memset(buffer, 0, sizeof buffer);
			result = USPiMassStorageDeviceRead(block_start_pos, buffer, BLOCK_SIZE, 0);

				
			if (result != BLOCK_SIZE) {
				cprintf("%s expected read of 512 but got %d\n", name, result);
				return 0;
			}
			
			
			
			memcpy((char *)_buf + progress, buffer + (current_pos % BLOCK_SIZE), current_read_amount);
			current_pos += current_read_amount;
			progress += current_read_amount;
			continue;          
		}
		memset(buffer, 0, sizeof buffer);
		result = USPiMassStorageDeviceRead(current_pos, buffer, current_read_amount, 0);

				
		if (result != current_read_amount) {
			cprintf("%s expected read of %d but got %d\n", name, current_read_amount, result);
			return 0;
		}

		memcpy((char *)_buf + progress, buffer, current_read_amount);
		current_pos += current_read_amount;
		progress += current_read_amount;
		 
	}
	
		
	f->off = current_pos;
		

	

	return progress;
}
