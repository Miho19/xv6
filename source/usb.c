#include <types.h>
#include <defs.h>
#include <fs.h>
#include <file.h>
#include <spinlock.h>



#include <uspi.h>
#include <uspi/util.h>
#include <uspios.h>
#include <mailbox.h>
#include <uspi/string.h>

#include <uspienv/timer.h>


#include <uspi/dwhcidevice.h>
#include <uspi/bcm2835.h>
#include <uspi/synchronize.h>
#include <uspi/assert.h>

#define MAILBOX_FULL  0x80000000
#define MAILBOX_EMPTY 0x40000000

int device_index = 0;
int usb_active = 0;
static TTimer USBTimer;
static void KeyPressedHandler (const char *pString);



static char *bufend, *bufptr;

static int usb_strlen(const char *p)

{
int len;
char *s;

	len = 0; s = (char *)p;
	while(*s++ != '\0') len++;
	return len;
}

static int usbgetc(void)
{
char *ptr;

	if(bufptr < bufend) {

	    ptr = bufptr;
	    bufptr ++;
	    return(*ptr);
	} else return -1;
}

static void KeyPressedHandler (const char *pString)
{
int buflen;

	buflen = usb_strlen(pString);
	bufptr = (char *)pString;
	bufend = bufptr + buflen;
	consoleintr(usbgetc);

//    cprintf ("%s", pString);
}

void *malloc (unsigned nSize) {		// result must be 4-byte aligned
	//cprintf("usb: malloc: %d\n", nSize);
	if ( nSize > 4096 ) {
		panic("usb: hit malloc 4K page limit");
	}
	return kalloc();
}

void free (void *pBlock) {
	//cprintf("usb: freeing: %x\n", pBlock);
	kfree(pBlock);
}

void MsDelay (unsigned nMilliSeconds) {
	//cprintf("usb: MsDelay: %d\n", nMilliSeconds);
	//delay (nMilliSeconds * 1000);
	usDelay (nMilliSeconds * 1000);
}

void usDelay (unsigned nMicroSeconds) {
	//cprintf("usb: usDelay: %d\n", nMicroSeconds);
	//delay (nMicroSeconds);
	volatile unsigned * timestamp = (unsigned *) (MMIO_VA+0x003004);
	unsigned stop = * timestamp + nMicroSeconds;
	//cprintf("usb: stamp: %x\n", * timestamp);
	//cprintf("usb: stop: %x\n", stop);
	while ( * timestamp < stop ) {
		__asm__("nop");
	}

}

// returns the timer handle (hTimer)
unsigned StartKernelTimer (unsigned nHzDelay, TKernelTimerHandler *pHandler, void *pParam, void *pContext) {
	//cprintf("usb: Entering StartKernelTimer\n");
	return TimerStartKernelTimer (TimerGet (), nHzDelay, pHandler, pParam, pContext);
	//return 0;
}

void CancelKernelTimer (unsigned hTimer) {
	//cprintf("usb: Entering CancelKernelTimer\n");
	TimerCancelKernelTimer (TimerGet (), hTimer);
}

// returns 0 on failure
int SetPowerStateOn (unsigned nDeviceId) {	// "set power state" to "on", wait until completed
	//cprintf("usb: Entering SetPowerStateOn\n");
	cprintf("usb: Powering DeviceId: %d\n", nDeviceId);
	volatile unsigned int *mailbox = (unsigned int*) MAILBOX_BASE;
	unsigned int result = 0;
	while ( mailbox[6] & MAILBOX_FULL );
	mailbox[8] = 0x80;
	do {
		while ( mailbox[6] & MAILBOX_EMPTY );
	} while ( ( ( result = mailbox[0] ) & 0xf ) != 0 );
	if ( result == 0x80 ) {
		cprintf("usb: Device %d powered on\n", nDeviceId);
		return 1;
	} else {
		cprintf("usb: Failed powering device %d\n", nDeviceId);
		return 0;
	}
}

// returns 0 on failure
int GetMACAddress (unsigned char Buffer[6]) {	// "get board MAC address"
	//cprintf("usb: Entering GetMACAddress\n");
	return 0;
}

void LogWrite (const char *pSource,		// short name of module
	       unsigned	   Severity,		// see above
	       const char *pMessage, ...) {	// uses printf format options
    // variadic function, so we process the message first
    va_list var;
    va_start (var, pMessage);
    TString Message;
    String (&Message);
    StringFormatV (&Message, pMessage, var);
    const char *pString = StringGet (&Message);
    // done processing, eeady to print
    cprintf("usb: %s: %s\n", pSource, pString);
    // clean up
    va_end (var);
}

// returns 0 on failure
int usbinit () {
    sti(); // enable interrupts for usb init
    TimerEnvInit( &USBTimer );
    if ( ! TimerInitialize( &USBTimer ) ) {
        cprintf("usb: USB timer init failed\n");
		_Timer ( &USBTimer );
        return 0;
    } else {
        cprintf("usb: USB timer init OK interval=%d\n", CLOCKHZ / HZ);
	}
    if ( ! USPiInitialize() ) {
        cprintf("usb: USB init failed\n");
        cli(); // disable interrupts, will be re-enabled by scheduler
        return 0;
    } else {
        cprintf("usb: USB init OK\n");
	
        if ( ! USPiKeyboardAvailable() ) {
            cprintf("usb: keyboard not found\n");
        }
        else {
            cprintf("usb: keyboard OK\n");
            USPiKeyboardRegisterKeyPressedHandler (KeyPressedHandler);
        };
//        cli(); // disable interrupts, will be re-enabled by scheduler
        return 1;
    };
	
		
	
}


void newRequest(void)
{
	cprintf("New REQUEST\n");
	device_handler[device_index].usb_active = 1;
	device_handler[device_index].nTries = 4;
	device_handler[device_index].status = 0;
	device_handler[device_index].tCounter = 0;
	
}

void clearDevice(void)
{
	cprintf("Device cleared\n");
	device_handler[device_index].usb_active = 0;
	device_handler[device_index].in_busy = 0;
	
}




/** 
 	error codes - > -1 no devices ready
 
*/

int usb_fileread(struct file *f, char *buf, int num)
{

	int index;
	int found;
	int result;

	if(device_handler[device_index].status == 1)cprintf("first\n");
	if(USPiMassStorageDeviceAvailable() < 1)
		return -1;

	if(device_handler[device_index].status == 1)cprintf("second\n");
	for(index = 0;index<MAX_DEVICE;index++)
	{
		if(device_handler[index].major == f->ip->major)
		{
			found = 1;
			break;
		}
	}

	if(device_handler[device_index].status == 1)cprintf("Third\n");
	if(!found)
		return -1;
	device_index = index;
	

	if(!device_handler[device_index].usb_active)
		newRequest();
	usb_active = 1;
	
	if(device_handler[device_index].status == 1)cprintf("fourth\n");
	result = USPiMassStorageDeviceRead(1*512, buf, 512, 0);

	if(result == -12345){
		cprintf("we got -12345 back status: %d  tCounter: %d \n", device_handler[device_index].status, device_handler[device_index].tCounter);
		return 0;
	}


	if(device_handler[device_index].status == 256)
		clearDevice();
	//for now


	cprintf("DIDN'T CATCH A RESULT: %d\n ",result);
	return 0;
 						
}



/** 
 Current issue potentially other functions calling usb_read using
 devsw[major].read which doesnt force it through usb_fileread interface

 num = number of bytes

*/int usb_read(struct inode *ip, char *buf, int num) {
	return -1;
}


#ifndef NDEBUG

// display "assertion failed" message and halt
void uspi_assertion_failed (const char *pExpr, const char *pFile, unsigned nLine) {
	cprintf("usb: assertfail: expr: %s: file: %s line: %d\n", pExpr, pFile, nLine);
}

// display hex dump (pSource can be 0)
void DebugHexdump (const void *pBuffer, unsigned nBufLen, const char *pSource /* = 0 */) {
	cprintf("usb: hexdump: source: %s\n", pSource); //TODO
}

#endif
