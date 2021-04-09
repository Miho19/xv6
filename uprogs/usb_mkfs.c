
#define stat xv6_stat  // avoid clash with host struct stat
#include "types.h"
#include "fs.h"
#include "stat.h"
#include "param.h"
#include "user.h"
#include "fcntl.h"

void failure(int line);

#define assert(expression) if(expression){}else failure(__LINE__)
#define _static_assert(a, b) do { switch (0) case 0: case (a): ; } while (0)

int nblocks = 985;
int nlog = LOGSIZE;
int ninodes = 200;
int size = 1024;			/** Total number of blocks */

int fsfd;
struct superblock sb;
char zeroes[512];
uint freeblock;
uint usedblocks;
uint bitblocks;
uint freeinode = 1;

void balloc(int);
void wsect(uint, void*);
void winode(uint, struct dinode*);
void rinode(uint inum, struct dinode *ip);
void rsect(uint sec, void *buf);
uint ialloc(ushort type);
void iappend(uint inum, void *p, int n);
char* strncpy(char* dst, const char* src, uint n);
char* index(char* src, char c);






/**
 *  Functions needed since we have no string.h.
 *  strncpy 
 *  index 
 *  bcopy -> memmove();
 *  bzero -> memset();
*/

void failure(int line){
  printf(1, "assert failure at line: %d\n", line);
  exit();
}

char* strncpy(char* dst, const char* src, uint n) {
  char* _dst;
  if(!src || !dst)
    return 0;

  _dst = dst;

  while(*src && n) {
    *dst = *src;
    dst++;
    src++;
    n--;
  }

  *dst = '\0';
  return _dst;
}


char* index(char* src, char c) {
  int length;
  length = 0;
  if(!src || !*src)
    return 0;
  length = strlen(src);

  while(*src && length--){
    if(*src == c)
      return src;    
  }
  return 0;
}





// convert to intel byte order
ushort
xshort(ushort x)
{
  ushort y;
  uchar *a = (uchar*)&y;
  a[0] = x;
  a[1] = x >> 8;
  return y;
}

uint
xint(uint x)
{
  uint y;
  uchar *a = (uchar*)&y;
  a[0] = x;
  a[1] = x >> 8;
  a[2] = x >> 16;
  a[3] = x >> 24;
  return y;
}

int
main(int argc, char *argv[])
{
  int i, cc, fd;
  uint rootino, inum, off;
  struct dirent de;
  char buf[512];
  struct dinode din;


  _static_assert(sizeof(int) == 4, "Integers must be 4 bytes!");

  if(argc < 2){
    printf(1, "Usage: mkfs fs.img files...\n");
    exit();
  }

  assert(512 % sizeof(struct dinode) == 0);
  assert(512 % sizeof(struct dirent) == 0);

  /** Create the dev */
  mknod(argv[1], 15, 15);
  fsfd = open(argv[1], O_RDWR);

  if(fsfd < 0){
    printf(1, "%s\n", argv[1]);
    exit();
  }

  sb.size = xint(size);
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
  sb.ninodes = xint(ninodes);
  sb.nlog = xint(nlog);

  bitblocks = size/(512*8) + 1;
  usedblocks = ninodes / IPB + 3 + bitblocks;
  freeblock = usedblocks;

  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
         bitblocks, ninodes/IPB + 1, freeblock, nlog, nblocks+usedblocks+nlog);

  assert(nblocks + usedblocks + nlog == size);

  for(i = 0; i < nblocks + usedblocks + nlog; i++)
    wsect(i, zeroes);

  memset(buf, 0, sizeof(buf));
  memmove(buf, &sb, sizeof(sb));
  wsect(1, buf);

  rootino = ialloc(T_DIR);
  assert(rootino == ROOTINO);

  
  memset(&de, 0, sizeof(de));
  de.inum = xshort(rootino);
  strcpy(de.name, ".");
  iappend(rootino, &de, sizeof(de));

  memset(&de, 0, sizeof(de));
  de.inum = xshort(rootino);
  strcpy(de.name, "..");
  iappend(rootino, &de, sizeof(de));


	/** Adds files to file system */
  for(i = 2; i < argc; i++){
    assert(index(argv[i], '/') == 0);

    if((fd = open(argv[i], 0)) < 0){
      printf(1, "open failure: %s\n", argv[i]);
      exit();
    }
    
    // Skip leading _ in name when writing to file system.
    // The binaries are named _rm, _cat, etc. to keep the
    // build operating system from trying to execute them
    // in place of system binaries like rm and cat.
    if(argv[i][0] == '_')
      ++argv[i];

    inum = ialloc(T_FILE);

    memset(&de, 0, sizeof(de));
    de.inum = xshort(inum);
    strncpy(de.name, argv[i], DIRSIZ);
    iappend(rootino, &de, sizeof(de));

    while((cc = read(fd, buf, sizeof(buf))) > 0)
      iappend(inum, buf, cc);

    close(fd);
  }

  // fix size of root inode dir
  rinode(rootino, &din);
  off = xint(din.size);
  off = ((off/BSIZE) + 1) * BSIZE;
  din.size = xint(off);
  winode(rootino, &din);

  balloc(usedblocks);

  exit();
}

void
wsect(uint sec, void *buf)
{
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
    printf(1, "lseek");
    exit();
  }
  if(write(fsfd, buf, 512) != 512){
    printf(1, "write");
    exit();
  }
}

uint
i2b(uint inum)
{
  return (inum / IPB) + 2;
}

void
winode(uint inum, struct dinode *ip)
{
  char buf[512];
  uint bn;
  struct dinode *dip;

  bn = i2b(inum);
  rsect(bn, buf);
  dip = ((struct dinode*)buf) + (inum % IPB);
  *dip = *ip;
  wsect(bn, buf);
}

void
rinode(uint inum, struct dinode *ip)
{
  char buf[512];
  uint bn;
  struct dinode *dip;

  bn = i2b(inum);
  rsect(bn, buf);
  dip = ((struct dinode*)buf) + (inum % IPB);
  *ip = *dip;
}

void
rsect(uint sec, void *buf)
{
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
    printf(1, "lseek");
    exit();
  }
  if(read(fsfd, buf, 512) != 512){
    printf(1, "read");
    exit();
  }
}

uint
ialloc(ushort type)
{
  uint inum = freeinode++;
  struct dinode din;

  memset(&din, 0, sizeof(din));
  din.type = xshort(type);
  din.nlink = xshort(1);
  din.size = xint(0);
  winode(inum, &din);
  return inum;
}

void
balloc(int used)
{
  uchar buf[512];
  int i;

  printf(1, "balloc: first %d blocks have been allocated\n", used);
  assert(used < 512*8);
  memset(buf, 0, 512);
  for(i = 0; i < used; i++){
    buf[i/8] = buf[i/8] | (0x1 << (i%8));
  }
  printf(1, "balloc: write bitmap block at sector %d\n", ninodes/IPB + 3);
  wsect(ninodes / IPB + 3, buf);
}

#define min(a, b) ((a) < (b) ? (a) : (b))

void
iappend(uint inum, void *xp, int n)
{
  char *p = (char*)xp;
  uint fbn, off, n1;
  struct dinode din;
  char buf[512];
  uint indirect[NINDIRECT];
  uint x;

  rinode(inum, &din);

  off = xint(din.size);
  while(n > 0){
    fbn = off / 512;
    assert(fbn < MAXFILE);
    if(fbn < NDIRECT){
      if(xint(din.addrs[fbn]) == 0){
        din.addrs[fbn] = xint(freeblock++);
        usedblocks++;
      }
      x = xint(din.addrs[fbn]);
    } else {
      if(xint(din.addrs[NDIRECT]) == 0){
        // printf("allocate indirect block\n");
        din.addrs[NDIRECT] = xint(freeblock++);
        usedblocks++;
      }
      // printf("read indirect block\n");
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
      if(indirect[fbn - NDIRECT] == 0){
        indirect[fbn - NDIRECT] = xint(freeblock++);
        usedblocks++;
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
      }
      x = xint(indirect[fbn-NDIRECT]);
    }
    n1 = min(n, (fbn + 1) * 512 - off);
    rsect(x, buf);
    memmove(p, buf + off - (fbn * 512), n1);
    wsect(x, buf);
	printf(1, "inum: %d data sector %d \n",inum,  x);
    n -= n1;
    off += n1;
    p += n1;
  }
  din.size = xint(off);
  winode(inum, &din);
}
