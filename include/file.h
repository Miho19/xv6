#include <uspi/dwhcidevice.h>

struct file {
  enum { FD_NONE, FD_PIPE, FD_INODE } type;
  int ref; // reference count
  char readable;
  char writable;
  struct pipe *pipe;
  struct inode *ip;
  uint off;
};


// in-memory copy of an inode
struct inode {
  uint dev;           // Device number
  uint inum;          // Inode number
  int ref;            // Reference count
  int flags;          // I_BUSY, I_VALID

  short type;         // copy of disk inode
  short major;
  short minor;
  short nlink;
  uint size;
  uint addrs[NDIRECT+1];
};
#define I_BUSY 0x1
#define I_VALID 0x2

// table mapping major device number to
// device functions
struct devsw {
  int (*read)(struct inode*, char*, int);
  int (*write)(struct inode*, char*, int);
};

extern struct devsw devsw[];
#define MAX_DEVICE 10
struct device_handler {
	short major;
	int deviceIndex;
	int (*read)(struct inode*, char*, int);
	int(*write)(struct inode*, char*, int);
	int usb_active;
	int in_busy;
	struct file *f;
	int status;
	int tCounter;
	int nTries;
	TUSBRequest *CBWURB;
	TUSBRequest *DATAURB;
	TUSBRequest *CSWURB;
	TUSBRequest *RESETURB;		
};

extern struct device_handler device_handler[];

#define CONSOLE 1
