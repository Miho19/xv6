
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fs.h"

#define BLOCK_SIZE 512

int main(int argc, char *argv[]) {
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   4:	e28db014 	add	fp, sp, #20
   8:	e1a04001 	mov	r4, r1
   c:	e24ddc02 	sub	sp, sp, #512	; 0x200
	int offset = 0;
	struct dirent *de;
	
	result = 0;
	fd = 0;
	memset(buffer, 0, sizeof buffer);
  10:	e3a02c02 	mov	r2, #512	; 0x200
  14:	e3a01000 	mov	r1, #0
  18:	e24b0f85 	sub	r0, fp, #532	; 0x214
  1c:	eb00006d 	bl	1d8 <memset>

	
	
	if(mknod(argv[1],15,15) < 0) {
  20:	e3a0200f 	mov	r2, #15
  24:	e5940004 	ldr	r0, [r4, #4]
  28:	e1a01002 	mov	r1, r2
  2c:	eb000165 	bl	5c8 <mknod>
  30:	e3500000 	cmp	r0, #0
  34:	ba000037 	blt	118 <main+0x118>
		printf(1,"Already a device\n");
	}
	
	if( (fd = open(argv[1],0x002)) < 0 ){
  38:	e3a01002 	mov	r1, #2
  3c:	e5940004 	ldr	r0, [r4, #4]
  40:	eb000153 	bl	594 <open>
		printf(1,"Could not open %s \n", argv[1]);
  44:	e5942004 	ldr	r2, [r4, #4]
	if( (fd = open(argv[1],0x002)) < 0 ){
  48:	e2507000 	subs	r7, r0, #0
  4c:	ba00002a 	blt	fc <main+0xfc>
		close(fd);
		exit();
	}

	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  50:	e1a03007 	mov	r3, r7
  54:	e3a00001 	mov	r0, #1
  58:	e3001c50 	movw	r1, #3152	; 0xc50
  5c:	e3401000 	movt	r1, #0
  60:	eb00022a 	bl	910 <printf>

	

	lseek(fd, 29 * BLOCK_SIZE, 0);
  64:	e3a02000 	mov	r2, #0
  68:	e3a01c3a 	mov	r1, #14848	; 0x3a00
  6c:	e1a00007 	mov	r0, r7
  70:	eb0000ec 	bl	428 <lseek>


	result = read(fd,buffer , 512);
  74:	e3a02c02 	mov	r2, #512	; 0x200
  78:	e24b1f85 	sub	r1, fp, #532	; 0x214
  7c:	e1a00007 	mov	r0, r7
  80:	eb000102 	bl	490 <read>

	if(result != 512) {
  84:	e3500c02 	cmp	r0, #512	; 0x200
  88:	1a000015 	bne	e4 <main+0xe4>
  8c:	e24b3f85 	sub	r3, fp, #532	; 0x214
	for(offset = 0; offset < 512; offset += sizeof(struct dirent)){
		
		de = (struct dirent*)(buffer + offset % 512);
		if(de->inum == 0)
			continue;
		printf(1, "(%d, %s), ", de->inum, de->name);
  90:	e3006c70 	movw	r6, #3184	; 0xc70
  94:	e2834002 	add	r4, r3, #2
  98:	e24b5012 	sub	r5, fp, #18
  9c:	e3406000 	movt	r6, #0
		if(de->inum == 0)
  a0:	e15420b2 	ldrh	r2, [r4, #-2]
  a4:	e3520000 	cmp	r2, #0
  a8:	0a000003 	beq	bc <main+0xbc>
		printf(1, "(%d, %s), ", de->inum, de->name);
  ac:	e1a03004 	mov	r3, r4
  b0:	e1a01006 	mov	r1, r6
  b4:	e3a00001 	mov	r0, #1
  b8:	eb000214 	bl	910 <printf>
  bc:	e2844010 	add	r4, r4, #16
	for(offset = 0; offset < 512; offset += sizeof(struct dirent)){
  c0:	e1550004 	cmp	r5, r4
  c4:	1afffff5 	bne	a0 <main+0xa0>
	}

	printf(1, "\n");
  c8:	e3a00001 	mov	r0, #1
  cc:	e3001c38 	movw	r1, #3128	; 0xc38
  d0:	e3401000 	movt	r1, #0
  d4:	eb00020d 	bl	910 <printf>

	close(fd);
  d8:	e1a00007 	mov	r0, r7
  dc:	eb000105 	bl	4f8 <close>
	exit();	
  e0:	eb0000b6 	bl	3c0 <exit>
		printf(1, "read %d\n", result);
  e4:	e1a02000 	mov	r2, r0
  e8:	e3001c64 	movw	r1, #3172	; 0xc64
  ec:	e3a00001 	mov	r0, #1
  f0:	e3401000 	movt	r1, #0
  f4:	eb000205 	bl	910 <printf>
  f8:	eaffffe3 	b	8c <main+0x8c>
		printf(1,"Could not open %s \n", argv[1]);
  fc:	e3a00001 	mov	r0, #1
 100:	e3001c3c 	movw	r1, #3132	; 0xc3c
 104:	e3401000 	movt	r1, #0
 108:	eb000200 	bl	910 <printf>
		close(fd);
 10c:	e1a00007 	mov	r0, r7
 110:	eb0000f8 	bl	4f8 <close>
		exit();
 114:	eb0000a9 	bl	3c0 <exit>
		printf(1,"Already a device\n");
 118:	e3001c28 	movw	r1, #3112	; 0xc28
 11c:	e3a00001 	mov	r0, #1
 120:	e3401000 	movt	r1, #0
 124:	eb0001f9 	bl	910 <printf>
 128:	eaffffc2 	b	38 <main+0x38>

0000012c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 12c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 130:	e2402001 	sub	r2, r0, #1
 134:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 138:	e4d13001 	ldrb	r3, [r1], #1
 13c:	e3530000 	cmp	r3, #0
 140:	e5e23001 	strb	r3, [r2, #1]!
 144:	1afffffb 	bne	138 <strcpy+0xc>
    ;
  return os;
}
 148:	e28bd000 	add	sp, fp, #0
 14c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 150:	e12fff1e 	bx	lr

00000154 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 158:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 15c:	e5d03000 	ldrb	r3, [r0]
 160:	e5d12000 	ldrb	r2, [r1]
 164:	e3530000 	cmp	r3, #0
 168:	1a000004 	bne	180 <strcmp+0x2c>
 16c:	ea000005 	b	188 <strcmp+0x34>
 170:	e5f03001 	ldrb	r3, [r0, #1]!
 174:	e5f12001 	ldrb	r2, [r1, #1]!
 178:	e3530000 	cmp	r3, #0
 17c:	0a000001 	beq	188 <strcmp+0x34>
 180:	e1530002 	cmp	r3, r2
 184:	0afffff9 	beq	170 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 188:	e0430002 	sub	r0, r3, r2
 18c:	e28bd000 	add	sp, fp, #0
 190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 194:	e12fff1e 	bx	lr

00000198 <strlen>:

uint
strlen(char *s)
{
 198:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 19c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1a0:	e5d03000 	ldrb	r3, [r0]
 1a4:	e3530000 	cmp	r3, #0
 1a8:	01a00003 	moveq	r0, r3
 1ac:	0a000006 	beq	1cc <strlen+0x34>
 1b0:	e1a02000 	mov	r2, r0
 1b4:	e3a03000 	mov	r3, #0
 1b8:	e5f21001 	ldrb	r1, [r2, #1]!
 1bc:	e2833001 	add	r3, r3, #1
 1c0:	e3510000 	cmp	r1, #0
 1c4:	e1a00003 	mov	r0, r3
 1c8:	1afffffa 	bne	1b8 <strlen+0x20>
    ;
  return n;
}
 1cc:	e28bd000 	add	sp, fp, #0
 1d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d4:	e12fff1e 	bx	lr

000001d8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1d8:	e3520000 	cmp	r2, #0
{
 1dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1e0:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1e4:	0a000004 	beq	1fc <memset+0x24>
 1e8:	e6ef1071 	uxtb	r1, r1
 1ec:	e0802002 	add	r2, r0, r2
 1f0:	e4c01001 	strb	r1, [r0], #1
 1f4:	e1520000 	cmp	r2, r0
 1f8:	1afffffc 	bne	1f0 <memset+0x18>
  return (void *)p;
}
 1fc:	e28bd000 	add	sp, fp, #0
 200:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 204:	e12fff1e 	bx	lr

00000208 <strchr>:

char*
strchr(const char *s, char c)
{
 208:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 20c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 210:	e5d02000 	ldrb	r2, [r0]
 214:	e3520000 	cmp	r2, #0
 218:	0a00000b 	beq	24c <strchr+0x44>
    if(*s == c)
 21c:	e1510002 	cmp	r1, r2
 220:	1a000002 	bne	230 <strchr+0x28>
 224:	ea000005 	b	240 <strchr+0x38>
 228:	e1530001 	cmp	r3, r1
 22c:	0a000003 	beq	240 <strchr+0x38>
  for(; *s; s++)
 230:	e5f03001 	ldrb	r3, [r0, #1]!
 234:	e3530000 	cmp	r3, #0
 238:	1afffffa 	bne	228 <strchr+0x20>
      return (char*)s;
  return 0;
 23c:	e1a00003 	mov	r0, r3
}
 240:	e28bd000 	add	sp, fp, #0
 244:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 248:	e12fff1e 	bx	lr
  return 0;
 24c:	e1a00002 	mov	r0, r2
 250:	eafffffa 	b	240 <strchr+0x38>

00000254 <gets>:

char*
gets(char *buf, int max)
{
 254:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 258:	e1a03000 	mov	r3, r0
 25c:	e28db014 	add	fp, sp, #20
 260:	e1a07000 	mov	r7, r0
 264:	e24dd008 	sub	sp, sp, #8
 268:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26c:	e3a04000 	mov	r4, #0
 270:	ea000008 	b	298 <gets+0x44>
    cc = read(0, &c, 1);
 274:	eb000085 	bl	490 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 278:	e1a03005 	mov	r3, r5
    if(cc < 1)
 27c:	e3500000 	cmp	r0, #0
 280:	da00000b 	ble	2b4 <gets+0x60>
    buf[i++] = c;
 284:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 288:	e352000d 	cmp	r2, #13
 28c:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 290:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 294:	0a00000b 	beq	2c8 <gets+0x74>
    cc = read(0, &c, 1);
 298:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 29c:	e0844002 	add	r4, r4, r2
 2a0:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 2a4:	e24b1015 	sub	r1, fp, #21
 2a8:	e3a00000 	mov	r0, #0
 2ac:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 2b0:	baffffef 	blt	274 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2b4:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 2b8:	e3a03000 	mov	r3, #0
 2bc:	e5c53000 	strb	r3, [r5]
}
 2c0:	e24bd014 	sub	sp, fp, #20
 2c4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 2c8:	e0875004 	add	r5, r7, r4
 2cc:	eafffff8 	b	2b4 <gets+0x60>

000002d0 <stat>:

int
stat(char *n, struct stat *st)
{
 2d0:	e92d4830 	push	{r4, r5, fp, lr}
 2d4:	e1a04001 	mov	r4, r1
 2d8:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2dc:	e3a01000 	mov	r1, #0
 2e0:	eb0000ab 	bl	594 <open>
  if(fd < 0)
 2e4:	e2505000 	subs	r5, r0, #0
 2e8:	ba000006 	blt	308 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2ec:	e1a01004 	mov	r1, r4
 2f0:	eb0000ce 	bl	630 <fstat>
 2f4:	e1a04000 	mov	r4, r0
  close(fd);
 2f8:	e1a00005 	mov	r0, r5
 2fc:	eb00007d 	bl	4f8 <close>
  return r;
}
 300:	e1a00004 	mov	r0, r4
 304:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 308:	e3e04000 	mvn	r4, #0
 30c:	eafffffb 	b	300 <stat+0x30>

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 314:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 318:	e5d02000 	ldrb	r2, [r0]
 31c:	e2423030 	sub	r3, r2, #48	; 0x30
 320:	e3530009 	cmp	r3, #9
  n = 0;
 324:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 328:	8a000006 	bhi	348 <atoi+0x38>
    n = n*10 + *s++ - '0';
 32c:	e3a0c00a 	mov	ip, #10
 330:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 334:	e5f02001 	ldrb	r2, [r0, #1]!
 338:	e2421030 	sub	r1, r2, #48	; 0x30
 33c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 340:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 344:	9afffff9 	bls	330 <atoi+0x20>
  return n;
}
 348:	e1a00003 	mov	r0, r3
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 358:	e3520000 	cmp	r2, #0
{
 35c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 360:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 364:	da000005 	ble	380 <memmove+0x28>
 368:	e0812002 	add	r2, r1, r2
 36c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 370:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 374:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 378:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 37c:	1afffffb 	bne	370 <memmove+0x18>
  return vdst;
}
 380:	e28bd000 	add	sp, fp, #0
 384:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 388:	e12fff1e 	bx	lr

0000038c <fork>:
 38c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 390:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 394:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 398:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 39c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a0:	e3a00001 	mov	r0, #1
 3a4:	ef000040 	svc	0x00000040
 3a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3bc:	e12fff1e 	bx	lr

000003c0 <exit>:
 3c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d4:	e3a00002 	mov	r0, #2
 3d8:	ef000040 	svc	0x00000040
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f0:	e12fff1e 	bx	lr

000003f4 <wait>:
 3f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 400:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 404:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 408:	e3a00003 	mov	r0, #3
 40c:	ef000040 	svc	0x00000040
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 41c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 420:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 424:	e12fff1e 	bx	lr

00000428 <lseek>:
 428:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 42c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 430:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 434:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 438:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 43c:	e3a00016 	mov	r0, #22
 440:	ef000040 	svc	0x00000040
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 450:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 454:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 458:	e12fff1e 	bx	lr

0000045c <pipe>:
 45c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 460:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 464:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 468:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 46c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 470:	e3a00004 	mov	r0, #4
 474:	ef000040 	svc	0x00000040
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 484:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 488:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 48c:	e12fff1e 	bx	lr

00000490 <read>:
 490:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 494:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 498:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 49c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a4:	e3a00005 	mov	r0, #5
 4a8:	ef000040 	svc	0x00000040
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c0:	e12fff1e 	bx	lr

000004c4 <write>:
 4c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d8:	e3a00010 	mov	r0, #16
 4dc:	ef000040 	svc	0x00000040
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f4:	e12fff1e 	bx	lr

000004f8 <close>:
 4f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 500:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 504:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 508:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 50c:	e3a00015 	mov	r0, #21
 510:	ef000040 	svc	0x00000040
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 520:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 524:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 528:	e12fff1e 	bx	lr

0000052c <kill>:
 52c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 530:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 534:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 538:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 53c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 540:	e3a00006 	mov	r0, #6
 544:	ef000040 	svc	0x00000040
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 554:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 558:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 55c:	e12fff1e 	bx	lr

00000560 <exec>:
 560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 564:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 568:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 56c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 570:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 574:	e3a00007 	mov	r0, #7
 578:	ef000040 	svc	0x00000040
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 588:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 58c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 590:	e12fff1e 	bx	lr

00000594 <open>:
 594:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 598:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 59c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a8:	e3a0000f 	mov	r0, #15
 5ac:	ef000040 	svc	0x00000040
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c4:	e12fff1e 	bx	lr

000005c8 <mknod>:
 5c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5dc:	e3a00011 	mov	r0, #17
 5e0:	ef000040 	svc	0x00000040
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f8:	e12fff1e 	bx	lr

000005fc <unlink>:
 5fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 600:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 604:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 608:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 60c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 610:	e3a00012 	mov	r0, #18
 614:	ef000040 	svc	0x00000040
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 624:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 628:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 62c:	e12fff1e 	bx	lr

00000630 <fstat>:
 630:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 634:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 638:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 63c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 640:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 644:	e3a00008 	mov	r0, #8
 648:	ef000040 	svc	0x00000040
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 658:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 65c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 660:	e12fff1e 	bx	lr

00000664 <link>:
 664:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 668:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 66c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 670:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 674:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 678:	e3a00013 	mov	r0, #19
 67c:	ef000040 	svc	0x00000040
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 68c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 694:	e12fff1e 	bx	lr

00000698 <mkdir>:
 698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 69c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ac:	e3a00014 	mov	r0, #20
 6b0:	ef000040 	svc	0x00000040
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c8:	e12fff1e 	bx	lr

000006cc <chdir>:
 6cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e0:	e3a00009 	mov	r0, #9
 6e4:	ef000040 	svc	0x00000040
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6fc:	e12fff1e 	bx	lr

00000700 <dup>:
 700:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 704:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 708:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 70c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 710:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 714:	e3a0000a 	mov	r0, #10
 718:	ef000040 	svc	0x00000040
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 728:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 72c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 730:	e12fff1e 	bx	lr

00000734 <getpid>:
 734:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 738:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 73c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 740:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 744:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 748:	e3a0000b 	mov	r0, #11
 74c:	ef000040 	svc	0x00000040
 750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 75c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 760:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 764:	e12fff1e 	bx	lr

00000768 <sbrk>:
 768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 76c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 770:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 774:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 778:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 77c:	e3a0000c 	mov	r0, #12
 780:	ef000040 	svc	0x00000040
 784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 790:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 794:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 798:	e12fff1e 	bx	lr

0000079c <sleep>:
 79c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b0:	e3a0000d 	mov	r0, #13
 7b4:	ef000040 	svc	0x00000040
 7b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7cc:	e12fff1e 	bx	lr

000007d0 <uptime>:
 7d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7e4:	e3a0000e 	mov	r0, #14
 7e8:	ef000040 	svc	0x00000040
 7ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 800:	e12fff1e 	bx	lr

00000804 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 804:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 808:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 80c:	e013afa1 	ands	sl, r3, r1, lsr #31
 810:	e24b4034 	sub	r4, fp, #52	; 0x34
 814:	e3009c7c 	movw	r9, #3196	; 0xc7c
    neg = 1;
    x = -xx;
 818:	1261e000 	rsbne	lr, r1, #0
 81c:	e3409000 	movt	r9, #0
{
 820:	e1a05000 	mov	r5, r0
    neg = 1;
 824:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 828:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 82c:	e3a08000 	mov	r8, #0
  b = base;
 830:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 834:	e3a06001 	mov	r6, #1
{
 838:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 83c:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 840:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 844:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 848:	e1a0033e 	lsr	r0, lr, r3
 84c:	e2000001 	and	r0, r0, #1
 850:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 854:	e1520001 	cmp	r2, r1
            r = r - d;
 858:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 85c:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 860:	e2533001 	subs	r3, r3, #1
 864:	2afffff7 	bcs	848 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 868:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 86c:	e35c0000 	cmp	ip, #0
 870:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 874:	e2883001 	add	r3, r8, #1
 878:	e7d91001 	ldrb	r1, [r9, r1]
 87c:	e4c71001 	strb	r1, [r7], #1
 880:	11a08003 	movne	r8, r3
 884:	1affffec 	bne	83c <printint+0x38>
  if(neg)
 888:	e35a0000 	cmp	sl, #0
 88c:	0a000004 	beq	8a4 <printint+0xa0>
    buf[i++] = '-';
 890:	e24b2024 	sub	r2, fp, #36	; 0x24
 894:	e3a0102d 	mov	r1, #45	; 0x2d
 898:	e0822003 	add	r2, r2, r3
 89c:	e2883002 	add	r3, r8, #2
 8a0:	e5421010 	strb	r1, [r2, #-16]
 8a4:	e0846003 	add	r6, r4, r3
 8a8:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 8ac:	e3a02001 	mov	r2, #1
 8b0:	e24b1035 	sub	r1, fp, #53	; 0x35
 8b4:	e1a00005 	mov	r0, r5
 8b8:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 8bc:	ebffff00 	bl	4c4 <write>

  while(--i >= 0)
 8c0:	e1540006 	cmp	r4, r6
 8c4:	1afffff7 	bne	8a8 <printint+0xa4>
    putc(fd, buf[i]);
}
 8c8:	e24bd020 	sub	sp, fp, #32
 8cc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000008d0 <div>:
{
 8d0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8d4:	e3a02000 	mov	r2, #0
{
 8d8:	e28db008 	add	fp, sp, #8
 8dc:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8e0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8e4:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8e8:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 8ec:	e1a0c33e 	lsr	ip, lr, r3
 8f0:	e20cc001 	and	ip, ip, #1
 8f4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8f8:	e1520001 	cmp	r2, r1
            r = r - d;
 8fc:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 900:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 904:	e2533001 	subs	r3, r3, #1
 908:	38bd8810 	popcc	{r4, fp, pc}
 90c:	eafffff6 	b	8ec <div+0x1c>

00000910 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 910:	e92d000e 	push	{r1, r2, r3}
 914:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 918:	e28db018 	add	fp, sp, #24
 91c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 920:	e59b5004 	ldr	r5, [fp, #4]
 924:	e5d54000 	ldrb	r4, [r5]
 928:	e3540000 	cmp	r4, #0
 92c:	0a00002b 	beq	9e0 <printf+0xd0>
 930:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 934:	e28b8008 	add	r8, fp, #8
  state = 0;
 938:	e3a06000 	mov	r6, #0
 93c:	ea00000a 	b	96c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 940:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 944:	01a06004 	moveq	r6, r4
      if(c == '%'){
 948:	0a000004 	beq	960 <printf+0x50>
 94c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 950:	e3a02001 	mov	r2, #1
 954:	e1a00007 	mov	r0, r7
 958:	e5614006 	strb	r4, [r1, #-6]!
 95c:	ebfffed8 	bl	4c4 <write>
  for(i = 0; fmt[i]; i++){
 960:	e5f54001 	ldrb	r4, [r5, #1]!
 964:	e3540000 	cmp	r4, #0
 968:	0a00001c 	beq	9e0 <printf+0xd0>
    if(state == 0){
 96c:	e3560000 	cmp	r6, #0
 970:	0afffff2 	beq	940 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 974:	e3560025 	cmp	r6, #37	; 0x25
 978:	1afffff8 	bne	960 <printf+0x50>
      if(c == 'd'){
 97c:	e3540064 	cmp	r4, #100	; 0x64
 980:	0a000030 	beq	a48 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 984:	e20430f7 	and	r3, r4, #247	; 0xf7
 988:	e3530070 	cmp	r3, #112	; 0x70
 98c:	0a000017 	beq	9f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 990:	e3540073 	cmp	r4, #115	; 0x73
 994:	0a00001c 	beq	a0c <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 998:	e3540063 	cmp	r4, #99	; 0x63
 99c:	0a000037 	beq	a80 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9a0:	e3540025 	cmp	r4, #37	; 0x25
 9a4:	0a00002e 	beq	a64 <printf+0x154>
  write(fd, &c, 1);
 9a8:	e3a02001 	mov	r2, #1
 9ac:	e24b1019 	sub	r1, fp, #25
 9b0:	e1a00007 	mov	r0, r7
 9b4:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 9b8:	ebfffec1 	bl	4c4 <write>
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e24b101a 	sub	r1, fp, #26
 9c4:	e1a00007 	mov	r0, r7
 9c8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9cc:	ebfffebc 	bl	4c4 <write>
  for(i = 0; fmt[i]; i++){
 9d0:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9d4:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 9d8:	e3540000 	cmp	r4, #0
 9dc:	1affffe2 	bne	96c <printf+0x5c>
    }
  }
}
 9e0:	e24bd018 	sub	sp, fp, #24
 9e4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9e8:	e28dd00c 	add	sp, sp, #12
 9ec:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 9f0:	e3a03000 	mov	r3, #0
 9f4:	e3a02010 	mov	r2, #16
 9f8:	e4981004 	ldr	r1, [r8], #4
 9fc:	e1a00007 	mov	r0, r7
 a00:	ebffff7f 	bl	804 <printint>
      state = 0;
 a04:	e3a06000 	mov	r6, #0
 a08:	eaffffd4 	b	960 <printf+0x50>
        s = (char*)*ap;
 a0c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a10:	e3540000 	cmp	r4, #0
 a14:	0a000021 	beq	aa0 <printf+0x190>
        while(*s != 0){
 a18:	e5d46000 	ldrb	r6, [r4]
 a1c:	e3560000 	cmp	r6, #0
 a20:	0affffce 	beq	960 <printf+0x50>
  write(fd, &c, 1);
 a24:	e3a02001 	mov	r2, #1
 a28:	e24b101d 	sub	r1, fp, #29
 a2c:	e1a00007 	mov	r0, r7
 a30:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 a34:	ebfffea2 	bl	4c4 <write>
        while(*s != 0){
 a38:	e5f46001 	ldrb	r6, [r4, #1]!
 a3c:	e3560000 	cmp	r6, #0
 a40:	1afffff7 	bne	a24 <printf+0x114>
 a44:	eaffffc5 	b	960 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a48:	e3a03001 	mov	r3, #1
 a4c:	e3a0200a 	mov	r2, #10
 a50:	e4981004 	ldr	r1, [r8], #4
 a54:	e1a00007 	mov	r0, r7
 a58:	ebffff69 	bl	804 <printint>
      state = 0;
 a5c:	e3a06000 	mov	r6, #0
 a60:	eaffffbe 	b	960 <printf+0x50>
 a64:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a68:	e3a02001 	mov	r2, #1
 a6c:	e1a00007 	mov	r0, r7
 a70:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 a74:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 a78:	ebfffe91 	bl	4c4 <write>
 a7c:	eaffffb7 	b	960 <printf+0x50>
        putc(fd, *ap);
 a80:	e4983004 	ldr	r3, [r8], #4
 a84:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a88:	e3a02001 	mov	r2, #1
 a8c:	e1a00007 	mov	r0, r7
      state = 0;
 a90:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 a94:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 a98:	ebfffe89 	bl	4c4 <write>
 a9c:	eaffffaf 	b	960 <printf+0x50>
          s = "(null)";
 aa0:	e3004c90 	movw	r4, #3216	; 0xc90
        while(*s != 0){
 aa4:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 aa8:	e3404000 	movt	r4, #0
 aac:	eaffffdc 	b	a24 <printf+0x114>

00000ab0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab0:	e300cc98 	movw	ip, #3224	; 0xc98
 ab4:	e340c000 	movt	ip, #0
{
 ab8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 abc:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac0:	e59c3000 	ldr	r3, [ip]
{
 ac4:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac8:	e1530001 	cmp	r3, r1
 acc:	e5932000 	ldr	r2, [r3]
 ad0:	2a000017 	bcs	b34 <free+0x84>
 ad4:	e1510002 	cmp	r1, r2
 ad8:	3a000001 	bcc	ae4 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 adc:	e1530002 	cmp	r3, r2
 ae0:	3a000017 	bcc	b44 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ae4:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ae8:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 aec:	e081418e 	add	r4, r1, lr, lsl #3
 af0:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 af4:	05922004 	ldreq	r2, [r2, #4]
 af8:	0082e00e 	addeq	lr, r2, lr
 afc:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b00:	05932000 	ldreq	r2, [r3]
 b04:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b08:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b0c:	e5932004 	ldr	r2, [r3, #4]
 b10:	e083e182 	add	lr, r3, r2, lsl #3
 b14:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b18:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b1c:	05101004 	ldreq	r1, [r0, #-4]
 b20:	00812002 	addeq	r2, r1, r2
 b24:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b28:	05102008 	ldreq	r2, [r0, #-8]
 b2c:	05832000 	streq	r2, [r3]
}
 b30:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b34:	e1530002 	cmp	r3, r2
 b38:	3a000001 	bcc	b44 <free+0x94>
 b3c:	e1510002 	cmp	r1, r2
 b40:	3affffe7 	bcc	ae4 <free+0x34>
{
 b44:	e1a03002 	mov	r3, r2
 b48:	eaffffde 	b	ac8 <free+0x18>

00000b4c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b4c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b50:	e3007c98 	movw	r7, #3224	; 0xc98
 b54:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b58:	e2804007 	add	r4, r0, #7
{
 b5c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b60:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b64:	e1a041a4 	lsr	r4, r4, #3
 b68:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b6c:	e3530000 	cmp	r3, #0
 b70:	0a000027 	beq	c14 <malloc+0xc8>
 b74:	e5930000 	ldr	r0, [r3]
 b78:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b7c:	e1540002 	cmp	r4, r2
 b80:	9a000019 	bls	bec <malloc+0xa0>
 b84:	e3540a01 	cmp	r4, #4096	; 0x1000
 b88:	21a05004 	movcs	r5, r4
 b8c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b90:	e1a06185 	lsl	r6, r5, #3
 b94:	ea000003 	b	ba8 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b98:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b9c:	e5902004 	ldr	r2, [r0, #4]
 ba0:	e1520004 	cmp	r2, r4
 ba4:	2a000010 	bcs	bec <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ba8:	e5972000 	ldr	r2, [r7]
 bac:	e1a03000 	mov	r3, r0
 bb0:	e1520000 	cmp	r2, r0
 bb4:	1afffff7 	bne	b98 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 bb8:	e1a00006 	mov	r0, r6
 bbc:	ebfffee9 	bl	768 <sbrk>
 bc0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 bc4:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 bc8:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 bcc:	0a000004 	beq	be4 <malloc+0x98>
  hp->s.size = nu;
 bd0:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 bd4:	ebffffb5 	bl	ab0 <free>
  return freep;
 bd8:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 bdc:	e3530000 	cmp	r3, #0
 be0:	1affffec 	bne	b98 <malloc+0x4c>
        return 0;
 be4:	e3a00000 	mov	r0, #0
  }
}
 be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 bec:	e1540002 	cmp	r4, r2
      freep = prevp;
 bf0:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bf4:	10422004 	subne	r2, r2, r4
 bf8:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 bfc:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c00:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c04:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c08:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c0c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c10:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c14:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c18:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c1c:	e5870000 	str	r0, [r7]
 c20:	e5870004 	str	r0, [r7, #4]
 c24:	eaffffd6 	b	b84 <malloc+0x38>
