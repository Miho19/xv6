/** 
	functions for USB driver
*/

#define MAX_DEVICE 10

struct device_handler {
	short major;
	int (*read)(struct file*, char*, int);
	int (*write)(struct file*, char*, int);
	int usb_active;
};

extern struct device_handler device_handler[MAX_DEVICE];

void dhandlerinit(void);

void readTest();


// read code
int usb_fileread(struct file *f, char *buf, int n);

//write code

int usb_filewrite(struct file *f, char *buf, int n);
