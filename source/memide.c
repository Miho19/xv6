// Fake IDE disk; stores blocks in memory.
// Useful for running kernel without scratch disk.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"
#include "traps.h"
#include "spinlock.h"
#include "buf.h"

extern uchar _binary_fs_img_start[], _binary_fs_img_end[];

static int disksize;
static uchar *memdisk;

void
ideinit(void)
{
  memdisk = _binary_fs_img_start;
  disksize = div(((uint)_binary_fs_img_end - (uint)_binary_fs_img_start), 512);
}

// Interrupt handler.
void
ideintr(void)
{
  // no-op
}

void
usbrw(struct buf *b)
{

if(b->dev == ROOTDEV) {
	iderw(b);
	return;
}

if(b->dev == 2) {
   if(b->flags & B_DIRTY){
    usb_wsec(b->sector, b->data);
    b->flags &= ~B_DIRTY;
  } else {
    usb_rsec(b->sector, b->data);
    b->flags |= B_VALID;

  }

    
}

}

// Sync buf with disk. 
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  uchar *p;

  if(!(b->flags & B_BUSY))
    panic("iderw: buf not busy");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 1)
    panic("iderw: request not for disk 1");
  if(b->sector >= disksize)
    panic("iderw: sector out of range");

  p = memdisk + b->sector*512;
  
  if(b->flags & B_DIRTY){
    b->flags &= ~B_DIRTY;
    memmove(p, b->data, 512);
  } else
    memmove(b->data, p, 512);
  b->flags |= B_VALID;
}
