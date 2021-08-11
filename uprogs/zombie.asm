
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  if(fork() > 0){
   8:	eb0000a5 	bl	2a4 <fork>
   c:	e3500000 	cmp	r0, #0
  10:	da000006 	ble	30 <main+0x30>
    sleep(5);  // Let child exit before parent.
  14:	e3a00005 	mov	r0, #5
  18:	eb0001a5 	bl	6b4 <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3001b40 	movw	r1, #2880	; 0xb40
  20:	e3a00002 	mov	r0, #2
  24:	e3401000 	movt	r1, #0
  28:	eb0001fe 	bl	828 <printf>
    exit();
  2c:	eb0000a9 	bl	2d8 <exit>
  }
  printf(2, "Child exits!\n");
  30:	e3001b50 	movw	r1, #2896	; 0xb50
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb0001f9 	bl	828 <printf>
  exit();
  40:	eb0000a4 	bl	2d8 <exit>

00000044 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  44:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  48:	e2402001 	sub	r2, r0, #1
  4c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  50:	e4d13001 	ldrb	r3, [r1], #1
  54:	e3530000 	cmp	r3, #0
  58:	e5e23001 	strb	r3, [r2, #1]!
  5c:	1afffffb 	bne	50 <strcpy+0xc>
    ;
  return os;
}
  60:	e28bd000 	add	sp, fp, #0
  64:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  68:	e12fff1e 	bx	lr

0000006c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  74:	e5d03000 	ldrb	r3, [r0]
  78:	e5d12000 	ldrb	r2, [r1]
  7c:	e3530000 	cmp	r3, #0
  80:	1a000004 	bne	98 <strcmp+0x2c>
  84:	ea000005 	b	a0 <strcmp+0x34>
  88:	e5f03001 	ldrb	r3, [r0, #1]!
  8c:	e5f12001 	ldrb	r2, [r1, #1]!
  90:	e3530000 	cmp	r3, #0
  94:	0a000001 	beq	a0 <strcmp+0x34>
  98:	e1530002 	cmp	r3, r2
  9c:	0afffff9 	beq	88 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a0:	e0430002 	sub	r0, r3, r2
  a4:	e28bd000 	add	sp, fp, #0
  a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ac:	e12fff1e 	bx	lr

000000b0 <strlen>:

uint
strlen(char *s)
{
  b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  b4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  b8:	e5d03000 	ldrb	r3, [r0]
  bc:	e3530000 	cmp	r3, #0
  c0:	01a00003 	moveq	r0, r3
  c4:	0a000006 	beq	e4 <strlen+0x34>
  c8:	e1a02000 	mov	r2, r0
  cc:	e3a03000 	mov	r3, #0
  d0:	e5f21001 	ldrb	r1, [r2, #1]!
  d4:	e2833001 	add	r3, r3, #1
  d8:	e3510000 	cmp	r1, #0
  dc:	e1a00003 	mov	r0, r3
  e0:	1afffffa 	bne	d0 <strlen+0x20>
    ;
  return n;
}
  e4:	e28bd000 	add	sp, fp, #0
  e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ec:	e12fff1e 	bx	lr

000000f0 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
  f0:	e3520000 	cmp	r2, #0
{
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
  fc:	0a000004 	beq	114 <memset+0x24>
 100:	e6ef1071 	uxtb	r1, r1
 104:	e0802002 	add	r2, r0, r2
 108:	e4c01001 	strb	r1, [r0], #1
 10c:	e1520000 	cmp	r2, r0
 110:	1afffffc 	bne	108 <memset+0x18>
  return (void *)p;
}
 114:	e28bd000 	add	sp, fp, #0
 118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 11c:	e12fff1e 	bx	lr

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 124:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 128:	e5d02000 	ldrb	r2, [r0]
 12c:	e3520000 	cmp	r2, #0
 130:	0a00000b 	beq	164 <strchr+0x44>
    if(*s == c)
 134:	e1510002 	cmp	r1, r2
 138:	1a000002 	bne	148 <strchr+0x28>
 13c:	ea000005 	b	158 <strchr+0x38>
 140:	e1530001 	cmp	r3, r1
 144:	0a000003 	beq	158 <strchr+0x38>
  for(; *s; s++)
 148:	e5f03001 	ldrb	r3, [r0, #1]!
 14c:	e3530000 	cmp	r3, #0
 150:	1afffffa 	bne	140 <strchr+0x20>
      return (char*)s;
  return 0;
 154:	e1a00003 	mov	r0, r3
}
 158:	e28bd000 	add	sp, fp, #0
 15c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 160:	e12fff1e 	bx	lr
  return 0;
 164:	e1a00002 	mov	r0, r2
 168:	eafffffa 	b	158 <strchr+0x38>

0000016c <gets>:

char*
gets(char *buf, int max)
{
 16c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 170:	e1a03000 	mov	r3, r0
 174:	e28db014 	add	fp, sp, #20
 178:	e1a07000 	mov	r7, r0
 17c:	e24dd008 	sub	sp, sp, #8
 180:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	e3a04000 	mov	r4, #0
 188:	ea000008 	b	1b0 <gets+0x44>
    cc = read(0, &c, 1);
 18c:	eb000085 	bl	3a8 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 190:	e1a03005 	mov	r3, r5
    if(cc < 1)
 194:	e3500000 	cmp	r0, #0
 198:	da00000b 	ble	1cc <gets+0x60>
    buf[i++] = c;
 19c:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1a0:	e352000d 	cmp	r2, #13
 1a4:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1a8:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1ac:	0a00000b 	beq	1e0 <gets+0x74>
    cc = read(0, &c, 1);
 1b0:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1b4:	e0844002 	add	r4, r4, r2
 1b8:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1bc:	e24b1015 	sub	r1, fp, #21
 1c0:	e3a00000 	mov	r0, #0
 1c4:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1c8:	baffffef 	blt	18c <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1cc:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1d0:	e3a03000 	mov	r3, #0
 1d4:	e5c53000 	strb	r3, [r5]
}
 1d8:	e24bd014 	sub	sp, fp, #20
 1dc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1e0:	e0875004 	add	r5, r7, r4
 1e4:	eafffff8 	b	1cc <gets+0x60>

000001e8 <stat>:

int
stat(char *n, struct stat *st)
{
 1e8:	e92d4830 	push	{r4, r5, fp, lr}
 1ec:	e1a04001 	mov	r4, r1
 1f0:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	e3a01000 	mov	r1, #0
 1f8:	eb0000ab 	bl	4ac <open>
  if(fd < 0)
 1fc:	e2505000 	subs	r5, r0, #0
 200:	ba000006 	blt	220 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 204:	e1a01004 	mov	r1, r4
 208:	eb0000ce 	bl	548 <fstat>
 20c:	e1a04000 	mov	r4, r0
  close(fd);
 210:	e1a00005 	mov	r0, r5
 214:	eb00007d 	bl	410 <close>
  return r;
}
 218:	e1a00004 	mov	r0, r4
 21c:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 220:	e3e04000 	mvn	r4, #0
 224:	eafffffb 	b	218 <stat+0x30>

00000228 <atoi>:

int
atoi(const char *s)
{
 228:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 22c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 230:	e5d02000 	ldrb	r2, [r0]
 234:	e2423030 	sub	r3, r2, #48	; 0x30
 238:	e3530009 	cmp	r3, #9
  n = 0;
 23c:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 240:	8a000006 	bhi	260 <atoi+0x38>
    n = n*10 + *s++ - '0';
 244:	e3a0c00a 	mov	ip, #10
 248:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 24c:	e5f02001 	ldrb	r2, [r0, #1]!
 250:	e2421030 	sub	r1, r2, #48	; 0x30
 254:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 258:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 25c:	9afffff9 	bls	248 <atoi+0x20>
  return n;
}
 260:	e1a00003 	mov	r0, r3
 264:	e28bd000 	add	sp, fp, #0
 268:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 26c:	e12fff1e 	bx	lr

00000270 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 270:	e3520000 	cmp	r2, #0
{
 274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 278:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 27c:	da000005 	ble	298 <memmove+0x28>
 280:	e0812002 	add	r2, r1, r2
 284:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 288:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 28c:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 290:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 294:	1afffffb 	bne	288 <memmove+0x18>
  return vdst;
}
 298:	e28bd000 	add	sp, fp, #0
 29c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a0:	e12fff1e 	bx	lr

000002a4 <fork>:
 2a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2b8:	e3a00001 	mov	r0, #1
 2bc:	ef000040 	svc	0x00000040
 2c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2d4:	e12fff1e 	bx	lr

000002d8 <exit>:
 2d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2ec:	e3a00002 	mov	r0, #2
 2f0:	ef000040 	svc	0x00000040
 2f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 300:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 304:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 308:	e12fff1e 	bx	lr

0000030c <wait>:
 30c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 310:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 314:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 318:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 31c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 320:	e3a00003 	mov	r0, #3
 324:	ef000040 	svc	0x00000040
 328:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 334:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 338:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 33c:	e12fff1e 	bx	lr

00000340 <lseek>:
 340:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 344:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 348:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 34c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 350:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 354:	e3a00016 	mov	r0, #22
 358:	ef000040 	svc	0x00000040
 35c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 368:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 36c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 370:	e12fff1e 	bx	lr

00000374 <pipe>:
 374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 378:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 37c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 380:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 384:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 388:	e3a00004 	mov	r0, #4
 38c:	ef000040 	svc	0x00000040
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 39c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a4:	e12fff1e 	bx	lr

000003a8 <read>:
 3a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3bc:	e3a00005 	mov	r0, #5
 3c0:	ef000040 	svc	0x00000040
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d8:	e12fff1e 	bx	lr

000003dc <write>:
 3dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f0:	e3a00010 	mov	r0, #16
 3f4:	ef000040 	svc	0x00000040
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 404:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 408:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 40c:	e12fff1e 	bx	lr

00000410 <close>:
 410:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 414:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 418:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 41c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 420:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 424:	e3a00015 	mov	r0, #21
 428:	ef000040 	svc	0x00000040
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 438:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 43c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <kill>:
 444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 448:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 44c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 450:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 454:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 458:	e3a00006 	mov	r0, #6
 45c:	ef000040 	svc	0x00000040
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 46c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 474:	e12fff1e 	bx	lr

00000478 <exec>:
 478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 47c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 480:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 484:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 488:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 48c:	e3a00007 	mov	r0, #7
 490:	ef000040 	svc	0x00000040
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a8:	e12fff1e 	bx	lr

000004ac <open>:
 4ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c0:	e3a0000f 	mov	r0, #15
 4c4:	ef000040 	svc	0x00000040
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4dc:	e12fff1e 	bx	lr

000004e0 <mknod>:
 4e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f4:	e3a00011 	mov	r0, #17
 4f8:	ef000040 	svc	0x00000040
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 508:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 50c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 510:	e12fff1e 	bx	lr

00000514 <unlink>:
 514:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 518:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 51c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 520:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 524:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 528:	e3a00012 	mov	r0, #18
 52c:	ef000040 	svc	0x00000040
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 53c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 540:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 544:	e12fff1e 	bx	lr

00000548 <fstat>:
 548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 54c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 550:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 554:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 558:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 55c:	e3a00008 	mov	r0, #8
 560:	ef000040 	svc	0x00000040
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 570:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 574:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 578:	e12fff1e 	bx	lr

0000057c <link>:
 57c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 580:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 584:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 588:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 58c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 590:	e3a00013 	mov	r0, #19
 594:	ef000040 	svc	0x00000040
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ac:	e12fff1e 	bx	lr

000005b0 <mkdir>:
 5b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c4:	e3a00014 	mov	r0, #20
 5c8:	ef000040 	svc	0x00000040
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e0:	e12fff1e 	bx	lr

000005e4 <chdir>:
 5e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f8:	e3a00009 	mov	r0, #9
 5fc:	ef000040 	svc	0x00000040
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 60c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 614:	e12fff1e 	bx	lr

00000618 <dup>:
 618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 61c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 620:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 624:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 628:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 62c:	e3a0000a 	mov	r0, #10
 630:	ef000040 	svc	0x00000040
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 640:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 648:	e12fff1e 	bx	lr

0000064c <getpid>:
 64c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 650:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 654:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 658:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 65c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 660:	e3a0000b 	mov	r0, #11
 664:	ef000040 	svc	0x00000040
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 674:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 67c:	e12fff1e 	bx	lr

00000680 <sbrk>:
 680:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 684:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 688:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 68c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 690:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 694:	e3a0000c 	mov	r0, #12
 698:	ef000040 	svc	0x00000040
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b0:	e12fff1e 	bx	lr

000006b4 <sleep>:
 6b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c8:	e3a0000d 	mov	r0, #13
 6cc:	ef000040 	svc	0x00000040
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e4:	e12fff1e 	bx	lr

000006e8 <uptime>:
 6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6fc:	e3a0000e 	mov	r0, #14
 700:	ef000040 	svc	0x00000040
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 710:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 718:	e12fff1e 	bx	lr

0000071c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 71c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 720:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 724:	e013afa1 	ands	sl, r3, r1, lsr #31
 728:	e24b4034 	sub	r4, fp, #52	; 0x34
 72c:	e3009b60 	movw	r9, #2912	; 0xb60
    neg = 1;
    x = -xx;
 730:	1261e000 	rsbne	lr, r1, #0
 734:	e3409000 	movt	r9, #0
{
 738:	e1a05000 	mov	r5, r0
    neg = 1;
 73c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 740:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 744:	e3a08000 	mov	r8, #0
  b = base;
 748:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 74c:	e3a06001 	mov	r6, #1
{
 750:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 754:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 758:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 75c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 760:	e1a0033e 	lsr	r0, lr, r3
 764:	e2000001 	and	r0, r0, #1
 768:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 76c:	e1520001 	cmp	r2, r1
            r = r - d;
 770:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 774:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 778:	e2533001 	subs	r3, r3, #1
 77c:	2afffff7 	bcs	760 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 780:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 784:	e35c0000 	cmp	ip, #0
 788:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 78c:	e2883001 	add	r3, r8, #1
 790:	e7d91001 	ldrb	r1, [r9, r1]
 794:	e4c71001 	strb	r1, [r7], #1
 798:	11a08003 	movne	r8, r3
 79c:	1affffec 	bne	754 <printint+0x38>
  if(neg)
 7a0:	e35a0000 	cmp	sl, #0
 7a4:	0a000004 	beq	7bc <printint+0xa0>
    buf[i++] = '-';
 7a8:	e24b2024 	sub	r2, fp, #36	; 0x24
 7ac:	e3a0102d 	mov	r1, #45	; 0x2d
 7b0:	e0822003 	add	r2, r2, r3
 7b4:	e2883002 	add	r3, r8, #2
 7b8:	e5421010 	strb	r1, [r2, #-16]
 7bc:	e0846003 	add	r6, r4, r3
 7c0:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 7c4:	e3a02001 	mov	r2, #1
 7c8:	e24b1035 	sub	r1, fp, #53	; 0x35
 7cc:	e1a00005 	mov	r0, r5
 7d0:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 7d4:	ebffff00 	bl	3dc <write>

  while(--i >= 0)
 7d8:	e1540006 	cmp	r4, r6
 7dc:	1afffff7 	bne	7c0 <printint+0xa4>
    putc(fd, buf[i]);
}
 7e0:	e24bd020 	sub	sp, fp, #32
 7e4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000007e8 <div>:
{
 7e8:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7ec:	e3a02000 	mov	r2, #0
{
 7f0:	e28db008 	add	fp, sp, #8
 7f4:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 7f8:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7fc:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 800:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 804:	e1a0c33e 	lsr	ip, lr, r3
 808:	e20cc001 	and	ip, ip, #1
 80c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 810:	e1520001 	cmp	r2, r1
            r = r - d;
 814:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 818:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 81c:	e2533001 	subs	r3, r3, #1
 820:	38bd8810 	popcc	{r4, fp, pc}
 824:	eafffff6 	b	804 <div+0x1c>

00000828 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 828:	e92d000e 	push	{r1, r2, r3}
 82c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 830:	e28db018 	add	fp, sp, #24
 834:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 838:	e59b5004 	ldr	r5, [fp, #4]
 83c:	e5d54000 	ldrb	r4, [r5]
 840:	e3540000 	cmp	r4, #0
 844:	0a00002b 	beq	8f8 <printf+0xd0>
 848:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 84c:	e28b8008 	add	r8, fp, #8
  state = 0;
 850:	e3a06000 	mov	r6, #0
 854:	ea00000a 	b	884 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 858:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 85c:	01a06004 	moveq	r6, r4
      if(c == '%'){
 860:	0a000004 	beq	878 <printf+0x50>
 864:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 868:	e3a02001 	mov	r2, #1
 86c:	e1a00007 	mov	r0, r7
 870:	e5614006 	strb	r4, [r1, #-6]!
 874:	ebfffed8 	bl	3dc <write>
  for(i = 0; fmt[i]; i++){
 878:	e5f54001 	ldrb	r4, [r5, #1]!
 87c:	e3540000 	cmp	r4, #0
 880:	0a00001c 	beq	8f8 <printf+0xd0>
    if(state == 0){
 884:	e3560000 	cmp	r6, #0
 888:	0afffff2 	beq	858 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 88c:	e3560025 	cmp	r6, #37	; 0x25
 890:	1afffff8 	bne	878 <printf+0x50>
      if(c == 'd'){
 894:	e3540064 	cmp	r4, #100	; 0x64
 898:	0a000030 	beq	960 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 89c:	e20430f7 	and	r3, r4, #247	; 0xf7
 8a0:	e3530070 	cmp	r3, #112	; 0x70
 8a4:	0a000017 	beq	908 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8a8:	e3540073 	cmp	r4, #115	; 0x73
 8ac:	0a00001c 	beq	924 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8b0:	e3540063 	cmp	r4, #99	; 0x63
 8b4:	0a000037 	beq	998 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8b8:	e3540025 	cmp	r4, #37	; 0x25
 8bc:	0a00002e 	beq	97c <printf+0x154>
  write(fd, &c, 1);
 8c0:	e3a02001 	mov	r2, #1
 8c4:	e24b1019 	sub	r1, fp, #25
 8c8:	e1a00007 	mov	r0, r7
 8cc:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 8d0:	ebfffec1 	bl	3dc <write>
 8d4:	e3a02001 	mov	r2, #1
 8d8:	e24b101a 	sub	r1, fp, #26
 8dc:	e1a00007 	mov	r0, r7
 8e0:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8e4:	ebfffebc 	bl	3dc <write>
  for(i = 0; fmt[i]; i++){
 8e8:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8ec:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 8f0:	e3540000 	cmp	r4, #0
 8f4:	1affffe2 	bne	884 <printf+0x5c>
    }
  }
}
 8f8:	e24bd018 	sub	sp, fp, #24
 8fc:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 900:	e28dd00c 	add	sp, sp, #12
 904:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 908:	e3a03000 	mov	r3, #0
 90c:	e3a02010 	mov	r2, #16
 910:	e4981004 	ldr	r1, [r8], #4
 914:	e1a00007 	mov	r0, r7
 918:	ebffff7f 	bl	71c <printint>
      state = 0;
 91c:	e3a06000 	mov	r6, #0
 920:	eaffffd4 	b	878 <printf+0x50>
        s = (char*)*ap;
 924:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 928:	e3540000 	cmp	r4, #0
 92c:	0a000021 	beq	9b8 <printf+0x190>
        while(*s != 0){
 930:	e5d46000 	ldrb	r6, [r4]
 934:	e3560000 	cmp	r6, #0
 938:	0affffce 	beq	878 <printf+0x50>
  write(fd, &c, 1);
 93c:	e3a02001 	mov	r2, #1
 940:	e24b101d 	sub	r1, fp, #29
 944:	e1a00007 	mov	r0, r7
 948:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 94c:	ebfffea2 	bl	3dc <write>
        while(*s != 0){
 950:	e5f46001 	ldrb	r6, [r4, #1]!
 954:	e3560000 	cmp	r6, #0
 958:	1afffff7 	bne	93c <printf+0x114>
 95c:	eaffffc5 	b	878 <printf+0x50>
        printint(fd, *ap, 10, 1);
 960:	e3a03001 	mov	r3, #1
 964:	e3a0200a 	mov	r2, #10
 968:	e4981004 	ldr	r1, [r8], #4
 96c:	e1a00007 	mov	r0, r7
 970:	ebffff69 	bl	71c <printint>
      state = 0;
 974:	e3a06000 	mov	r6, #0
 978:	eaffffbe 	b	878 <printf+0x50>
 97c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 980:	e3a02001 	mov	r2, #1
 984:	e1a00007 	mov	r0, r7
 988:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 98c:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 990:	ebfffe91 	bl	3dc <write>
 994:	eaffffb7 	b	878 <printf+0x50>
        putc(fd, *ap);
 998:	e4983004 	ldr	r3, [r8], #4
 99c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9a0:	e3a02001 	mov	r2, #1
 9a4:	e1a00007 	mov	r0, r7
      state = 0;
 9a8:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9ac:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9b0:	ebfffe89 	bl	3dc <write>
 9b4:	eaffffaf 	b	878 <printf+0x50>
          s = "(null)";
 9b8:	e3004b74 	movw	r4, #2932	; 0xb74
        while(*s != 0){
 9bc:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 9c0:	e3404000 	movt	r4, #0
 9c4:	eaffffdc 	b	93c <printf+0x114>

000009c8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c8:	e300cb7c 	movw	ip, #2940	; 0xb7c
 9cc:	e340c000 	movt	ip, #0
{
 9d0:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9d4:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d8:	e59c3000 	ldr	r3, [ip]
{
 9dc:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	e1530001 	cmp	r3, r1
 9e4:	e5932000 	ldr	r2, [r3]
 9e8:	2a000017 	bcs	a4c <free+0x84>
 9ec:	e1510002 	cmp	r1, r2
 9f0:	3a000001 	bcc	9fc <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	e1530002 	cmp	r3, r2
 9f8:	3a000017 	bcc	a5c <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9fc:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a00:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a04:	e081418e 	add	r4, r1, lr, lsl #3
 a08:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a0c:	05922004 	ldreq	r2, [r2, #4]
 a10:	0082e00e 	addeq	lr, r2, lr
 a14:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a18:	05932000 	ldreq	r2, [r3]
 a1c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a20:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a24:	e5932004 	ldr	r2, [r3, #4]
 a28:	e083e182 	add	lr, r3, r2, lsl #3
 a2c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a30:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a34:	05101004 	ldreq	r1, [r0, #-4]
 a38:	00812002 	addeq	r2, r1, r2
 a3c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a40:	05102008 	ldreq	r2, [r0, #-8]
 a44:	05832000 	streq	r2, [r3]
}
 a48:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a4c:	e1530002 	cmp	r3, r2
 a50:	3a000001 	bcc	a5c <free+0x94>
 a54:	e1510002 	cmp	r1, r2
 a58:	3affffe7 	bcc	9fc <free+0x34>
{
 a5c:	e1a03002 	mov	r3, r2
 a60:	eaffffde 	b	9e0 <free+0x18>

00000a64 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a64:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a68:	e3007b7c 	movw	r7, #2940	; 0xb7c
 a6c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a70:	e2804007 	add	r4, r0, #7
{
 a74:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a78:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a7c:	e1a041a4 	lsr	r4, r4, #3
 a80:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a84:	e3530000 	cmp	r3, #0
 a88:	0a000027 	beq	b2c <malloc+0xc8>
 a8c:	e5930000 	ldr	r0, [r3]
 a90:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a94:	e1540002 	cmp	r4, r2
 a98:	9a000019 	bls	b04 <malloc+0xa0>
 a9c:	e3540a01 	cmp	r4, #4096	; 0x1000
 aa0:	21a05004 	movcs	r5, r4
 aa4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 aa8:	e1a06185 	lsl	r6, r5, #3
 aac:	ea000003 	b	ac0 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ab4:	e5902004 	ldr	r2, [r0, #4]
 ab8:	e1520004 	cmp	r2, r4
 abc:	2a000010 	bcs	b04 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac0:	e5972000 	ldr	r2, [r7]
 ac4:	e1a03000 	mov	r3, r0
 ac8:	e1520000 	cmp	r2, r0
 acc:	1afffff7 	bne	ab0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ad0:	e1a00006 	mov	r0, r6
 ad4:	ebfffee9 	bl	680 <sbrk>
 ad8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 adc:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 ae0:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 ae4:	0a000004 	beq	afc <malloc+0x98>
  hp->s.size = nu;
 ae8:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 aec:	ebffffb5 	bl	9c8 <free>
  return freep;
 af0:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 af4:	e3530000 	cmp	r3, #0
 af8:	1affffec 	bne	ab0 <malloc+0x4c>
        return 0;
 afc:	e3a00000 	mov	r0, #0
  }
}
 b00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b04:	e1540002 	cmp	r4, r2
      freep = prevp;
 b08:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b0c:	10422004 	subne	r2, r2, r4
 b10:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b14:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b18:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b1c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b20:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b24:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b28:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b2c:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b30:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b34:	e5870000 	str	r0, [r7]
 b38:	e5870004 	str	r0, [r7, #4]
 b3c:	eaffffd6 	b	a9c <malloc+0x38>
