/** 
	functions for USB driver
*/
#define MAX_DEVICE 10

struct device_handler {
	short major;
	int (*read)(struct inode*, char*, int);
	int (*write)(struct inode*, char*, int);
	int usb_active;
};

extern struct device_handler device_handler[MAX_DEVICE];

void dhandlerinit(void);

void readTest();
