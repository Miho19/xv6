
_test2:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:


int main(int argc, char *argv[]) {
unsigned char buf[512];

mknod(argv[1], 20, 20);
   0:	e3a02014 	mov	r2, #20
int main(int argc, char *argv[]) {
   4:	e92d4810 	push	{r4, fp, lr}
   8:	e1a04001 	mov	r4, r1
   c:	e28db008 	add	fp, sp, #8
  10:	e24ddf81 	sub	sp, sp, #516	; 0x204
mknod(argv[1], 20, 20);
  14:	e5910004 	ldr	r0, [r1, #4]
  18:	e1a01002 	mov	r1, r2
  1c:	eb000123 	bl	4b0 <mknod>
int fd = open(argv[1], O_RDWR);
  20:	e3a01002 	mov	r1, #2
  24:	e5940004 	ldr	r0, [r4, #4]
  28:	eb000113 	bl	47c <open>
read(fd,&buf,512);
  2c:	e3a02c02 	mov	r2, #512	; 0x200
  30:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  34:	eb0000cf 	bl	378 <read>
  38:	eafffffe 	b	38 <main+0x38>

0000003c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  3c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  40:	e2402001 	sub	r2, r0, #1
  44:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  48:	e4d13001 	ldrb	r3, [r1], #1
  4c:	e3530000 	cmp	r3, #0
  50:	e5e23001 	strb	r3, [r2, #1]!
  54:	1afffffb 	bne	48 <strcpy+0xc>
    ;
  return os;
}
  58:	e28bd000 	add	sp, fp, #0
  5c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  60:	e12fff1e 	bx	lr

00000064 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  68:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  6c:	e5d03000 	ldrb	r3, [r0]
  70:	e5d12000 	ldrb	r2, [r1]
  74:	e3530000 	cmp	r3, #0
  78:	1a000004 	bne	90 <strcmp+0x2c>
  7c:	ea000005 	b	98 <strcmp+0x34>
  80:	e5f03001 	ldrb	r3, [r0, #1]!
  84:	e3530000 	cmp	r3, #0
  88:	0a000006 	beq	a8 <strcmp+0x44>
  8c:	e5f12001 	ldrb	r2, [r1, #1]!
  90:	e1530002 	cmp	r3, r2
  94:	0afffff9 	beq	80 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  98:	e0430002 	sub	r0, r3, r2
  9c:	e28bd000 	add	sp, fp, #0
  a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  a4:	e12fff1e 	bx	lr
  a8:	e5d12001 	ldrb	r2, [r1, #1]
  ac:	e0430002 	sub	r0, r3, r2
  b0:	e28bd000 	add	sp, fp, #0
  b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  b8:	e12fff1e 	bx	lr

000000bc <strlen>:

uint
strlen(char *s)
{
  bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  c0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  c4:	e5d03000 	ldrb	r3, [r0]
  c8:	e3530000 	cmp	r3, #0
  cc:	0a000009 	beq	f8 <strlen+0x3c>
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a03000 	mov	r3, #0
  d8:	e5f21001 	ldrb	r1, [r2, #1]!
  dc:	e2833001 	add	r3, r3, #1
  e0:	e3510000 	cmp	r1, #0
  e4:	e1a00003 	mov	r0, r3
  e8:	1afffffa 	bne	d8 <strlen+0x1c>
    ;
  return n;
}
  ec:	e28bd000 	add	sp, fp, #0
  f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f4:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
  f8:	e1a00003 	mov	r0, r3
  fc:	eafffffa 	b	ec <strlen+0x30>

00000100 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 100:	e3520000 	cmp	r2, #0
{
 104:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 108:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 10c:	0a000004 	beq	124 <memset+0x24>
 110:	e6ef1071 	uxtb	r1, r1
 114:	e0802002 	add	r2, r0, r2
 118:	e4c01001 	strb	r1, [r0], #1
 11c:	e1520000 	cmp	r2, r0
 120:	1afffffc 	bne	118 <memset+0x18>
  return (void *)p;
}
 124:	e28bd000 	add	sp, fp, #0
 128:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 12c:	e12fff1e 	bx	lr

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 134:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 138:	e5d02000 	ldrb	r2, [r0]
 13c:	e3520000 	cmp	r2, #0
 140:	0a00000b 	beq	174 <strchr+0x44>
    if(*s == c)
 144:	e1510002 	cmp	r1, r2
 148:	1a000002 	bne	158 <strchr+0x28>
 14c:	ea000005 	b	168 <strchr+0x38>
 150:	e1530001 	cmp	r3, r1
 154:	0a000003 	beq	168 <strchr+0x38>
  for(; *s; s++)
 158:	e5f03001 	ldrb	r3, [r0, #1]!
 15c:	e3530000 	cmp	r3, #0
 160:	1afffffa 	bne	150 <strchr+0x20>
      return (char*)s;
  return 0;
 164:	e1a00003 	mov	r0, r3
}
 168:	e28bd000 	add	sp, fp, #0
 16c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 170:	e12fff1e 	bx	lr
  return 0;
 174:	e1a00002 	mov	r0, r2
 178:	eafffffa 	b	168 <strchr+0x38>

0000017c <gets>:

char*
gets(char *buf, int max)
{
 17c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 180:	e1a08000 	mov	r8, r0
 184:	e28db018 	add	fp, sp, #24
 188:	e1a07001 	mov	r7, r1
 18c:	e24dd00c 	sub	sp, sp, #12
 190:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 194:	e3a05000 	mov	r5, #0
 198:	ea000008 	b	1c0 <gets+0x44>
    cc = read(0, &c, 1);
 19c:	eb000075 	bl	378 <read>
    if(cc < 1)
 1a0:	e3500000 	cmp	r0, #0
 1a4:	da00000b 	ble	1d8 <gets+0x5c>
      break;
    buf[i++] = c;
 1a8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1ac:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1b0:	e353000d 	cmp	r3, #13
 1b4:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 1b8:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1bc:	0a000005 	beq	1d8 <gets+0x5c>
    cc = read(0, &c, 1);
 1c0:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1c4:	e0854002 	add	r4, r5, r2
 1c8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1cc:	e24b101d 	sub	r1, fp, #29
 1d0:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 1d4:	bafffff0 	blt	19c <gets+0x20>
      break;
  }
  buf[i] = '\0';
 1d8:	e3a03000 	mov	r3, #0
  return buf;
}
 1dc:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 1e0:	e7c83005 	strb	r3, [r8, r5]
}
 1e4:	e24bd018 	sub	sp, fp, #24
 1e8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	e92d4830 	push	{r4, r5, fp, lr}
 1f0:	e1a04001 	mov	r4, r1
 1f4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	e3a01000 	mov	r1, #0
 1fc:	eb00009e 	bl	47c <open>
  if(fd < 0)
 200:	e2505000 	subs	r5, r0, #0
 204:	ba000006 	blt	224 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 208:	e1a01004 	mov	r1, r4
 20c:	eb0000c1 	bl	518 <fstat>
 210:	e1a04000 	mov	r4, r0
  close(fd);
 214:	e1a00005 	mov	r0, r5
 218:	eb000070 	bl	3e0 <close>
  return r;
}
 21c:	e1a00004 	mov	r0, r4
 220:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 224:	e3e04000 	mvn	r4, #0
 228:	eafffffb 	b	21c <stat+0x30>

0000022c <atoi>:

int
atoi(const char *s)
{
 22c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 230:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 234:	e5d02000 	ldrb	r2, [r0]
 238:	e2423030 	sub	r3, r2, #48	; 0x30
 23c:	e3530009 	cmp	r3, #9
 240:	e3a03000 	mov	r3, #0
 244:	8a000006 	bhi	264 <atoi+0x38>
    n = n*10 + *s++ - '0';
 248:	e3a0c00a 	mov	ip, #10
 24c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 250:	e5f02001 	ldrb	r2, [r0, #1]!
 254:	e2421030 	sub	r1, r2, #48	; 0x30
 258:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 25c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 260:	9afffff9 	bls	24c <atoi+0x20>
  return n;
}
 264:	e1a00003 	mov	r0, r3
 268:	e28bd000 	add	sp, fp, #0
 26c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 270:	e12fff1e 	bx	lr

00000274 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 274:	e3520000 	cmp	r2, #0
{
 278:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 27c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 280:	da000005 	ble	29c <memmove+0x28>
 284:	e0812002 	add	r2, r1, r2
 288:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 28c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 290:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 294:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 298:	1afffffb 	bne	28c <memmove+0x18>
  return vdst;
}
 29c:	e28bd000 	add	sp, fp, #0
 2a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a4:	e12fff1e 	bx	lr

000002a8 <fork>:
 2a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2bc:	e3a00001 	mov	r0, #1
 2c0:	ef000040 	svc	0x00000040
 2c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2d8:	e12fff1e 	bx	lr

000002dc <exit>:
 2dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f0:	e3a00002 	mov	r0, #2
 2f4:	ef000040 	svc	0x00000040
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 300:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 304:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 308:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 30c:	e12fff1e 	bx	lr

00000310 <wait>:
 310:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 314:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 318:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 31c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 320:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 324:	e3a00003 	mov	r0, #3
 328:	ef000040 	svc	0x00000040
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 334:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 338:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 33c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <pipe>:
 344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 348:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 34c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 350:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 354:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 358:	e3a00004 	mov	r0, #4
 35c:	ef000040 	svc	0x00000040
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 368:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 36c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 370:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <read>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00005 	mov	r0, #5
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <write>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00010 	mov	r0, #16
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <close>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00015 	mov	r0, #21
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <kill>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00006 	mov	r0, #6
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <exec>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00007 	mov	r0, #7
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <open>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a0000f 	mov	r0, #15
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <mknod>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00011 	mov	r0, #17
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <unlink>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00012 	mov	r0, #18
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <fstat>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00008 	mov	r0, #8
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <link>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00013 	mov	r0, #19
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <mkdir>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00014 	mov	r0, #20
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <chdir>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00009 	mov	r0, #9
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <dup>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a0000a 	mov	r0, #10
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <getpid>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a0000b 	mov	r0, #11
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <sbrk>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a0000c 	mov	r0, #12
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <sleep>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a0000d 	mov	r0, #13
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <uptime>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000e 	mov	r0, #14
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6ec:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 6f0:	e1a09fa1 	lsr	r9, r1, #31
 6f4:	e3530000 	cmp	r3, #0
 6f8:	03a09000 	moveq	r9, #0
 6fc:	12099001 	andne	r9, r9, #1
{
 700:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 704:	e3590000 	cmp	r9, #0
 708:	e3008b24 	movw	r8, #2852	; 0xb24
    neg = 1;
    x = -xx;
 70c:	1261e000 	rsbne	lr, r1, #0
 710:	e3408000 	movt	r8, #0
 714:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 718:	e1a04000 	mov	r4, r0
    neg = 1;
 71c:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 720:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 724:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 728:	e3a05001 	mov	r5, #1
{
 72c:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 730:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 734:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 738:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 73c:	e1a0033e 	lsr	r0, lr, r3
 740:	e2000001 	and	r0, r0, #1
 744:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 748:	e1520001 	cmp	r2, r1
            r = r - d;
 74c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 750:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 754:	e2533001 	subs	r3, r3, #1
 758:	2afffff7 	bcs	73c <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 75c:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 760:	e35c0000 	cmp	ip, #0
 764:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 768:	e2873001 	add	r3, r7, #1
 76c:	e7d81001 	ldrb	r1, [r8, r1]
 770:	e5e61001 	strb	r1, [r6, #1]!
 774:	11a07003 	movne	r7, r3
 778:	1affffec 	bne	730 <printint+0x44>
  if(neg)
 77c:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 780:	124b201c 	subne	r2, fp, #28
 784:	10822003 	addne	r2, r2, r3
 788:	13a0102d 	movne	r1, #45	; 0x2d
 78c:	12873002 	addne	r3, r7, #2
 790:	15421010 	strbne	r1, [r2, #-16]
 794:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 798:	e2435001 	sub	r5, r3, #1
 79c:	e0826003 	add	r6, r2, r3
 7a0:	e5763001 	ldrb	r3, [r6, #-1]!
 7a4:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 7a8:	e3a02001 	mov	r2, #1
 7ac:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7b0:	e1a00004 	mov	r0, r4
 7b4:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7b8:	ebfffefb 	bl	3ac <write>
  while(--i >= 0)
 7bc:	e3750001 	cmn	r5, #1
 7c0:	1afffff6 	bne	7a0 <printint+0xb4>
    putc(fd, buf[i]);
}
 7c4:	e24bd01c 	sub	sp, fp, #28
 7c8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007cc <div>:
{
 7cc:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7d0:	e3a02000 	mov	r2, #0
{
 7d4:	e28db008 	add	fp, sp, #8
 7d8:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 7dc:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7e0:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 7e4:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 7e8:	e1a0c33e 	lsr	ip, lr, r3
 7ec:	e20cc001 	and	ip, ip, #1
 7f0:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 7f4:	e1520001 	cmp	r2, r1
            r = r - d;
 7f8:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 7fc:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 800:	e2533001 	subs	r3, r3, #1
 804:	2afffff7 	bcs	7e8 <div+0x1c>
}
 808:	e8bd8810 	pop	{r4, fp, pc}

0000080c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 80c:	e92d000e 	push	{r1, r2, r3}
 810:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 814:	e28db018 	add	fp, sp, #24
 818:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 81c:	e59b6004 	ldr	r6, [fp, #4]
 820:	e5d64000 	ldrb	r4, [r6]
 824:	e3540000 	cmp	r4, #0
 828:	0a00002b 	beq	8dc <printf+0xd0>
 82c:	e1a07000 	mov	r7, r0
 830:	e28b8008 	add	r8, fp, #8
 834:	e3a05000 	mov	r5, #0
 838:	ea00000a 	b	868 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 83c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 840:	01a05004 	moveq	r5, r4
      if(c == '%'){
 844:	0a000004 	beq	85c <printf+0x50>
 848:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 84c:	e3a02001 	mov	r2, #1
 850:	e1a00007 	mov	r0, r7
 854:	e5614006 	strb	r4, [r1, #-6]!
 858:	ebfffed3 	bl	3ac <write>
  for(i = 0; fmt[i]; i++){
 85c:	e5f64001 	ldrb	r4, [r6, #1]!
 860:	e3540000 	cmp	r4, #0
 864:	0a00001c 	beq	8dc <printf+0xd0>
    if(state == 0){
 868:	e3550000 	cmp	r5, #0
 86c:	0afffff2 	beq	83c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 870:	e3550025 	cmp	r5, #37	; 0x25
 874:	1afffff8 	bne	85c <printf+0x50>
      if(c == 'd'){
 878:	e3540064 	cmp	r4, #100	; 0x64
 87c:	0a000037 	beq	960 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 880:	e20430f7 	and	r3, r4, #247	; 0xf7
 884:	e3530070 	cmp	r3, #112	; 0x70
 888:	0a000017 	beq	8ec <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 88c:	e3540073 	cmp	r4, #115	; 0x73
 890:	0a00001c 	beq	908 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 894:	e3540063 	cmp	r4, #99	; 0x63
 898:	0a000037 	beq	97c <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 89c:	e3540025 	cmp	r4, #37	; 0x25
 8a0:	0a000027 	beq	944 <printf+0x138>
  write(fd, &c, 1);
 8a4:	e3a02001 	mov	r2, #1
 8a8:	e24b1019 	sub	r1, fp, #25
 8ac:	e1a00007 	mov	r0, r7
 8b0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8b4:	ebfffebc 	bl	3ac <write>
 8b8:	e3a02001 	mov	r2, #1
 8bc:	e24b101a 	sub	r1, fp, #26
 8c0:	e1a00007 	mov	r0, r7
 8c4:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8c8:	ebfffeb7 	bl	3ac <write>
  for(i = 0; fmt[i]; i++){
 8cc:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8d0:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 8d4:	e3540000 	cmp	r4, #0
 8d8:	1affffe2 	bne	868 <printf+0x5c>
    }
  }
}
 8dc:	e24bd018 	sub	sp, fp, #24
 8e0:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 8e4:	e28dd00c 	add	sp, sp, #12
 8e8:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 8ec:	e3a03000 	mov	r3, #0
 8f0:	e3a02010 	mov	r2, #16
 8f4:	e4981004 	ldr	r1, [r8], #4
 8f8:	e1a00007 	mov	r0, r7
 8fc:	ebffff7a 	bl	6ec <printint>
      state = 0;
 900:	e3a05000 	mov	r5, #0
 904:	eaffffd4 	b	85c <printf+0x50>
        s = (char*)*ap;
 908:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 90c:	e3540000 	cmp	r4, #0
 910:	0a000021 	beq	99c <printf+0x190>
        while(*s != 0){
 914:	e5d45000 	ldrb	r5, [r4]
 918:	e3550000 	cmp	r5, #0
 91c:	0affffce 	beq	85c <printf+0x50>
  write(fd, &c, 1);
 920:	e3a02001 	mov	r2, #1
 924:	e24b101d 	sub	r1, fp, #29
 928:	e1a00007 	mov	r0, r7
 92c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 930:	ebfffe9d 	bl	3ac <write>
        while(*s != 0){
 934:	e5f45001 	ldrb	r5, [r4, #1]!
 938:	e3550000 	cmp	r5, #0
 93c:	1afffff7 	bne	920 <printf+0x114>
 940:	eaffffc5 	b	85c <printf+0x50>
 944:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 948:	e3a02001 	mov	r2, #1
 94c:	e1a00007 	mov	r0, r7
 950:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 954:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 958:	ebfffe93 	bl	3ac <write>
 95c:	eaffffbe 	b	85c <printf+0x50>
        printint(fd, *ap, 10, 1);
 960:	e3a03001 	mov	r3, #1
 964:	e3a0200a 	mov	r2, #10
 968:	e4981004 	ldr	r1, [r8], #4
 96c:	e1a00007 	mov	r0, r7
 970:	ebffff5d 	bl	6ec <printint>
      state = 0;
 974:	e3a05000 	mov	r5, #0
 978:	eaffffb7 	b	85c <printf+0x50>
        putc(fd, *ap);
 97c:	e4983004 	ldr	r3, [r8], #4
 980:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 984:	e3a02001 	mov	r2, #1
 988:	e1a00007 	mov	r0, r7
      state = 0;
 98c:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 990:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 994:	ebfffe84 	bl	3ac <write>
 998:	eaffffaf 	b	85c <printf+0x50>
          s = "(null)";
 99c:	e3004b38 	movw	r4, #2872	; 0xb38
        while(*s != 0){
 9a0:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9a4:	e3404000 	movt	r4, #0
 9a8:	eaffffdc 	b	920 <printf+0x114>

000009ac <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ac:	e300cb40 	movw	ip, #2880	; 0xb40
 9b0:	e340c000 	movt	ip, #0
{
 9b4:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9b8:	e2401008 	sub	r1, r0, #8
{
 9bc:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c0:	e59c3000 	ldr	r3, [ip]
 9c4:	ea000004 	b	9dc <free+0x30>
 9c8:	e1510002 	cmp	r1, r2
 9cc:	3a000009 	bcc	9f8 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	e1530002 	cmp	r3, r2
 9d4:	2a000007 	bcs	9f8 <free+0x4c>
{
 9d8:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9dc:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e0:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e4:	3afffff7 	bcc	9c8 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e8:	e1530002 	cmp	r3, r2
 9ec:	3afffff9 	bcc	9d8 <free+0x2c>
 9f0:	e1510002 	cmp	r1, r2
 9f4:	2afffff7 	bcs	9d8 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f8:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9fc:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a00:	e081418e 	add	r4, r1, lr, lsl #3
 a04:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a08:	05922004 	ldreq	r2, [r2, #4]
 a0c:	0082e00e 	addeq	lr, r2, lr
 a10:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a14:	05932000 	ldreq	r2, [r3]
 a18:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a1c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a20:	e5932004 	ldr	r2, [r3, #4]
 a24:	e083e182 	add	lr, r3, r2, lsl #3
 a28:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a2c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a30:	05101004 	ldreq	r1, [r0, #-4]
 a34:	00812002 	addeq	r2, r1, r2
 a38:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a3c:	05102008 	ldreq	r2, [r0, #-8]
 a40:	05832000 	streq	r2, [r3]
}
 a44:	e8bd8810 	pop	{r4, fp, pc}

00000a48 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a48:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a4c:	e3007b40 	movw	r7, #2880	; 0xb40
 a50:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a54:	e2804007 	add	r4, r0, #7
{
 a58:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a5c:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a60:	e1a041a4 	lsr	r4, r4, #3
 a64:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a68:	e3530000 	cmp	r3, #0
 a6c:	0a000027 	beq	b10 <malloc+0xc8>
 a70:	e5930000 	ldr	r0, [r3]
 a74:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a78:	e1540002 	cmp	r4, r2
 a7c:	9a000019 	bls	ae8 <malloc+0xa0>
 a80:	e3540a01 	cmp	r4, #4096	; 0x1000
 a84:	21a05004 	movcs	r5, r4
 a88:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 a8c:	e1a06185 	lsl	r6, r5, #3
 a90:	ea000003 	b	aa4 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a94:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a98:	e5902004 	ldr	r2, [r0, #4]
 a9c:	e1540002 	cmp	r4, r2
 aa0:	9a000010 	bls	ae8 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa4:	e5972000 	ldr	r2, [r7]
 aa8:	e1a03000 	mov	r3, r0
 aac:	e1520000 	cmp	r2, r0
 ab0:	1afffff7 	bne	a94 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ab4:	e1a00006 	mov	r0, r6
 ab8:	ebfffee4 	bl	650 <sbrk>
 abc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ac0:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 ac4:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 ac8:	0a000004 	beq	ae0 <malloc+0x98>
  hp->s.size = nu;
 acc:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 ad0:	ebffffb5 	bl	9ac <free>
  return freep;
 ad4:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 ad8:	e3530000 	cmp	r3, #0
 adc:	1affffec 	bne	a94 <malloc+0x4c>
        return 0;
 ae0:	e3a00000 	mov	r0, #0
  }
}
 ae4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 ae8:	e1540002 	cmp	r4, r2
      freep = prevp;
 aec:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 af0:	10422004 	subne	r2, r2, r4
 af4:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 af8:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 afc:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b00:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b04:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b08:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b0c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b10:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b14:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b18:	e5870000 	str	r0, [r7]
 b1c:	e5870004 	str	r0, [r7, #4]
 b20:	eaffffd6 	b	a80 <malloc+0x38>
