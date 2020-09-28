/*****************************************************************
*       main.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"
#include "mailbox.h"
#include "fs.h"
#include "file.h"
#include <uspi.h>
#include <uspios.h>

extern char end[]; // first address after kernel loaded from ELF file
extern pde_t *kpgdir;
extern volatile uint *mailbuffer;
extern unsigned int pm_size;

struct device_handler device_handler[MAX_DEVICE];

void OkLoop()
{
   setgpiofunc(18, 1); // gpio 18 for Ok Led, set as an output
   while(1){
        setgpioval(18, 0);
        delay(2000000);
        setgpioval(18, 1);
        delay(2000000);
   }
}

void NotOkLoop()
{
   setgpiofunc(18, 1); // gpio 18 for Ok Led, set as an output
   while(1){
        setgpioval(18, 0);
        delay(500000);
        setgpioval(18, 1);
        delay(500000);
   }
}

unsigned int getpmsize()
{
    create_request(mailbuffer, MPI_TAG_GET_ARM_MEMORY, 8, 0, 0);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_ARM_MEMORY);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1];
}


void dhandlerinit(void)
{
	memset(&device_handler, 0, sizeof(struct device_handler)*MAX_DEVICE);
	
}

void machinit(void)
{
    memset(cpus, 0, sizeof(struct cpu)*NCPU);
}

void readTest(){
	int i = 0;
	int result = 0;
	unsigned char tbuffer[512];
	unsigned char readBuffer[512];

	for(i=0;i<512;i++) {
		tbuffer[i] = i;
	}

	device_handler[0].usb_active = 0;	
	result = USPiMassStorageDeviceWrite(512*66,tbuffer,512,0);
	
	if(result != 512) {
		cprintf("Write error\n");
		return;
	}
	cprintf("Write / Read\n");
	result = USPiMassStorageDeviceRead(512*66,readBuffer,512,0);

	if(result != 512){
		cprintf("Read error\n");
		return;
	}

	for(i=0;i<512;i++) {
		cprintf("%d",readBuffer[i]);
	}

}


 
void enableirqminiuart(void);


uint mb_data[10];

int cmain()
{

    mmuinit0();
    machinit();

    #if defined (RPI1) || defined (RPI2)
    uartinit();
    #elif defined (FVP)
    uartinit_fvp();
    #endif

    dsb_barrier();
    consoleinit();
    cprintf("\nHello World from xv6\n");

    kinit1(end, P2V((8*1024*1024)+PHYSTART));
    // collect some free space (8 MB) for imminent use
    // the physical space below 0x8000 is reserved for PGDIR and kernel stack
    kpgdir=p2v(K_PDX_BASE);

    mailboxinit();

    pm_size = getpmsize();
    cprintf("ARM memory: %x\n", pm_size);

    mmuinit1();
    cprintf("mmuinit1: OK\n");
    gpuinit();
    cprintf("gpuinit: OK\n");
    pinit();
    cprintf("pinit: OK\n");
    tvinit();
    cprintf("tvinit: OK\n");
    binit();
    cprintf("binit: OK\n");
    fileinit();
    cprintf("fileinit: OK\n");
    iinit();
    cprintf("iinit: OK\n");
    ideinit();
    cprintf("ideinit: OK\n");
    kinit2(P2V((8*1024*1024)+PHYSTART), P2V(pm_size));
    cprintf("kinit2: OK\n");
    usbinit();
    userinit();
    cprintf("userinit: OK\n");
    timer3init();
    cprintf("timer3init: OK\n");
    enableirqminiuart();
    dhandlerinit();
    readTest(); 
    cprintf("Handing off to scheduler...\n");

    scheduler();
    NotOkLoop();
    return 0;
}
