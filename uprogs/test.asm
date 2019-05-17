
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]) {
	int fd;
	if(argc <= 1) {
   0:	e3500001 	cmp	r0, #1
int main(int argc, char *argv[]) {
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	e28db014 	add	fp, sp, #20
	if(argc <= 1) {
   c:	da00000e 	ble	4c <main+0x4c>
  10:	e1a05001 	mov	r5, r1
  14:	e1a04000 	mov	r4, r0
		printf(1,"invalid argument length");
		exit();
	}

	fd = open(argv[1],0);
  18:	e3a01000 	mov	r1, #0
  1c:	e5950004 	ldr	r0, [r5, #4]
  20:	eb00011e 	bl	4a0 <open>
	printf(1,"argc: %d argv: %s\n", argc, argv[1]);
  24:	e5953004 	ldr	r3, [r5, #4]
  28:	e1a02004 	mov	r2, r4
  2c:	e3001b60 	movw	r1, #2912	; 0xb60
  30:	e3401000 	movt	r1, #0
	fd = open(argv[1],0);
  34:	e1a06000 	mov	r6, r0
	printf(1,"argc: %d argv: %s\n", argc, argv[1]);
  38:	e3a00001 	mov	r0, #1
  3c:	eb0001fb 	bl	830 <printf>
	close(fd);
  40:	e1a00006 	mov	r0, r6
  44:	eb0000ee 	bl	404 <close>

	exit();
  48:	eb0000ac 	bl	300 <exit>
		printf(1,"invalid argument length");
  4c:	e3001b48 	movw	r1, #2888	; 0xb48
  50:	e3a00001 	mov	r0, #1
  54:	e3401000 	movt	r1, #0
  58:	eb0001f4 	bl	830 <printf>
		exit();
  5c:	eb0000a7 	bl	300 <exit>

00000060 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  64:	e2402001 	sub	r2, r0, #1
  68:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6c:	e4d13001 	ldrb	r3, [r1], #1
  70:	e3530000 	cmp	r3, #0
  74:	e5e23001 	strb	r3, [r2, #1]!
  78:	1afffffb 	bne	6c <strcpy+0xc>
    ;
  return os;
}
  7c:	e28bd000 	add	sp, fp, #0
  80:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  84:	e12fff1e 	bx	lr

00000088 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  88:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  8c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  90:	e5d03000 	ldrb	r3, [r0]
  94:	e5d12000 	ldrb	r2, [r1]
  98:	e3530000 	cmp	r3, #0
  9c:	1a000004 	bne	b4 <strcmp+0x2c>
  a0:	ea000005 	b	bc <strcmp+0x34>
  a4:	e5f03001 	ldrb	r3, [r0, #1]!
  a8:	e3530000 	cmp	r3, #0
  ac:	0a000006 	beq	cc <strcmp+0x44>
  b0:	e5f12001 	ldrb	r2, [r1, #1]!
  b4:	e1530002 	cmp	r3, r2
  b8:	0afffff9 	beq	a4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  bc:	e0430002 	sub	r0, r3, r2
  c0:	e28bd000 	add	sp, fp, #0
  c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c8:	e12fff1e 	bx	lr
  cc:	e5d12001 	ldrb	r2, [r1, #1]
  d0:	e0430002 	sub	r0, r3, r2
  d4:	e28bd000 	add	sp, fp, #0
  d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  dc:	e12fff1e 	bx	lr

000000e0 <strlen>:

uint
strlen(char *s)
{
  e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  e8:	e5d03000 	ldrb	r3, [r0]
  ec:	e3530000 	cmp	r3, #0
  f0:	0a000009 	beq	11c <strlen+0x3c>
  f4:	e1a02000 	mov	r2, r0
  f8:	e3a03000 	mov	r3, #0
  fc:	e5f21001 	ldrb	r1, [r2, #1]!
 100:	e2833001 	add	r3, r3, #1
 104:	e3510000 	cmp	r1, #0
 108:	e1a00003 	mov	r0, r3
 10c:	1afffffa 	bne	fc <strlen+0x1c>
    ;
  return n;
}
 110:	e28bd000 	add	sp, fp, #0
 114:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 118:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 11c:	e1a00003 	mov	r0, r3
 120:	eafffffa 	b	110 <strlen+0x30>

00000124 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 124:	e3520000 	cmp	r2, #0
{
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 130:	0a000004 	beq	148 <memset+0x24>
 134:	e6ef1071 	uxtb	r1, r1
 138:	e0802002 	add	r2, r0, r2
 13c:	e4c01001 	strb	r1, [r0], #1
 140:	e1520000 	cmp	r2, r0
 144:	1afffffc 	bne	13c <memset+0x18>
  return (void *)p;
}
 148:	e28bd000 	add	sp, fp, #0
 14c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 150:	e12fff1e 	bx	lr

00000154 <strchr>:

char*
strchr(const char *s, char c)
{
 154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 158:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 15c:	e5d02000 	ldrb	r2, [r0]
 160:	e3520000 	cmp	r2, #0
 164:	0a00000b 	beq	198 <strchr+0x44>
    if(*s == c)
 168:	e1510002 	cmp	r1, r2
 16c:	1a000002 	bne	17c <strchr+0x28>
 170:	ea000005 	b	18c <strchr+0x38>
 174:	e1530001 	cmp	r3, r1
 178:	0a000003 	beq	18c <strchr+0x38>
  for(; *s; s++)
 17c:	e5f03001 	ldrb	r3, [r0, #1]!
 180:	e3530000 	cmp	r3, #0
 184:	1afffffa 	bne	174 <strchr+0x20>
      return (char*)s;
  return 0;
 188:	e1a00003 	mov	r0, r3
}
 18c:	e28bd000 	add	sp, fp, #0
 190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 194:	e12fff1e 	bx	lr
  return 0;
 198:	e1a00002 	mov	r0, r2
 19c:	eafffffa 	b	18c <strchr+0x38>

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1a4:	e1a08000 	mov	r8, r0
 1a8:	e28db018 	add	fp, sp, #24
 1ac:	e1a07001 	mov	r7, r1
 1b0:	e24dd00c 	sub	sp, sp, #12
 1b4:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b8:	e3a05000 	mov	r5, #0
 1bc:	ea000008 	b	1e4 <gets+0x44>
    cc = read(0, &c, 1);
 1c0:	eb000075 	bl	39c <read>
    if(cc < 1)
 1c4:	e3500000 	cmp	r0, #0
 1c8:	da00000b 	ble	1fc <gets+0x5c>
      break;
    buf[i++] = c;
 1cc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1d0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1d4:	e353000d 	cmp	r3, #13
 1d8:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 1dc:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1e0:	0a000005 	beq	1fc <gets+0x5c>
    cc = read(0, &c, 1);
 1e4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1e8:	e0854002 	add	r4, r5, r2
 1ec:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1f0:	e24b101d 	sub	r1, fp, #29
 1f4:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 1f8:	bafffff0 	blt	1c0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 1fc:	e3a03000 	mov	r3, #0
  return buf;
}
 200:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 204:	e7c83005 	strb	r3, [r8, r5]
}
 208:	e24bd018 	sub	sp, fp, #24
 20c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000210 <stat>:

int
stat(char *n, struct stat *st)
{
 210:	e92d4830 	push	{r4, r5, fp, lr}
 214:	e1a04001 	mov	r4, r1
 218:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21c:	e3a01000 	mov	r1, #0
 220:	eb00009e 	bl	4a0 <open>
  if(fd < 0)
 224:	e2505000 	subs	r5, r0, #0
 228:	ba000006 	blt	248 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 22c:	e1a01004 	mov	r1, r4
 230:	eb0000c1 	bl	53c <fstat>
 234:	e1a04000 	mov	r4, r0
  close(fd);
 238:	e1a00005 	mov	r0, r5
 23c:	eb000070 	bl	404 <close>
  return r;
}
 240:	e1a00004 	mov	r0, r4
 244:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 248:	e3e04000 	mvn	r4, #0
 24c:	eafffffb 	b	240 <stat+0x30>

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 254:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 258:	e5d02000 	ldrb	r2, [r0]
 25c:	e2423030 	sub	r3, r2, #48	; 0x30
 260:	e3530009 	cmp	r3, #9
 264:	e3a03000 	mov	r3, #0
 268:	8a000006 	bhi	288 <atoi+0x38>
    n = n*10 + *s++ - '0';
 26c:	e3a0c00a 	mov	ip, #10
 270:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 274:	e5f02001 	ldrb	r2, [r0, #1]!
 278:	e2421030 	sub	r1, r2, #48	; 0x30
 27c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 280:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 284:	9afffff9 	bls	270 <atoi+0x20>
  return n;
}
 288:	e1a00003 	mov	r0, r3
 28c:	e28bd000 	add	sp, fp, #0
 290:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 294:	e12fff1e 	bx	lr

00000298 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 298:	e3520000 	cmp	r2, #0
{
 29c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2a0:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 2a4:	da000005 	ble	2c0 <memmove+0x28>
 2a8:	e0812002 	add	r2, r1, r2
 2ac:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2b0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2b4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2b8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2bc:	1afffffb 	bne	2b0 <memmove+0x18>
  return vdst;
}
 2c0:	e28bd000 	add	sp, fp, #0
 2c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c8:	e12fff1e 	bx	lr

000002cc <fork>:
 2cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2e0:	e3a00001 	mov	r0, #1
 2e4:	ef000040 	svc	0x00000040
 2e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2fc:	e12fff1e 	bx	lr

00000300 <exit>:
 300:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 304:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 308:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 30c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 310:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 314:	e3a00002 	mov	r0, #2
 318:	ef000040 	svc	0x00000040
 31c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 320:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 324:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 328:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 32c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 330:	e12fff1e 	bx	lr

00000334 <wait>:
 334:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 338:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 33c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 340:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 344:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 348:	e3a00003 	mov	r0, #3
 34c:	ef000040 	svc	0x00000040
 350:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 354:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 358:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 35c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 360:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 364:	e12fff1e 	bx	lr

00000368 <pipe>:
 368:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 36c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 370:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 374:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 378:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 37c:	e3a00004 	mov	r0, #4
 380:	ef000040 	svc	0x00000040
 384:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 390:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 394:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 398:	e12fff1e 	bx	lr

0000039c <read>:
 39c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b0:	e3a00005 	mov	r0, #5
 3b4:	ef000040 	svc	0x00000040
 3b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3cc:	e12fff1e 	bx	lr

000003d0 <write>:
 3d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e4:	e3a00010 	mov	r0, #16
 3e8:	ef000040 	svc	0x00000040
 3ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 400:	e12fff1e 	bx	lr

00000404 <close>:
 404:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 408:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 40c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 410:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 414:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 418:	e3a00015 	mov	r0, #21
 41c:	ef000040 	svc	0x00000040
 420:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 42c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 430:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 434:	e12fff1e 	bx	lr

00000438 <kill>:
 438:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 43c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 440:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 444:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 448:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 44c:	e3a00006 	mov	r0, #6
 450:	ef000040 	svc	0x00000040
 454:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 460:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 464:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 468:	e12fff1e 	bx	lr

0000046c <exec>:
 46c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 470:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 474:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 478:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 47c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 480:	e3a00007 	mov	r0, #7
 484:	ef000040 	svc	0x00000040
 488:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 494:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 498:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 49c:	e12fff1e 	bx	lr

000004a0 <open>:
 4a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b4:	e3a0000f 	mov	r0, #15
 4b8:	ef000040 	svc	0x00000040
 4bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d0:	e12fff1e 	bx	lr

000004d4 <mknod>:
 4d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e8:	e3a00011 	mov	r0, #17
 4ec:	ef000040 	svc	0x00000040
 4f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 500:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 504:	e12fff1e 	bx	lr

00000508 <unlink>:
 508:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 50c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 510:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 514:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 518:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 51c:	e3a00012 	mov	r0, #18
 520:	ef000040 	svc	0x00000040
 524:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 530:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 534:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 538:	e12fff1e 	bx	lr

0000053c <fstat>:
 53c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 540:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 544:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 548:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 54c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 550:	e3a00008 	mov	r0, #8
 554:	ef000040 	svc	0x00000040
 558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 564:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 568:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 56c:	e12fff1e 	bx	lr

00000570 <link>:
 570:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 574:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 578:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 57c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 580:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 584:	e3a00013 	mov	r0, #19
 588:	ef000040 	svc	0x00000040
 58c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 598:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 59c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a0:	e12fff1e 	bx	lr

000005a4 <mkdir>:
 5a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b8:	e3a00014 	mov	r0, #20
 5bc:	ef000040 	svc	0x00000040
 5c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d4:	e12fff1e 	bx	lr

000005d8 <chdir>:
 5d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ec:	e3a00009 	mov	r0, #9
 5f0:	ef000040 	svc	0x00000040
 5f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 600:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 604:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 608:	e12fff1e 	bx	lr

0000060c <dup>:
 60c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 610:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 614:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 618:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 61c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 620:	e3a0000a 	mov	r0, #10
 624:	ef000040 	svc	0x00000040
 628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 634:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 638:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 63c:	e12fff1e 	bx	lr

00000640 <getpid>:
 640:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 644:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 648:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 64c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 650:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 654:	e3a0000b 	mov	r0, #11
 658:	ef000040 	svc	0x00000040
 65c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 668:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 66c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 670:	e12fff1e 	bx	lr

00000674 <sbrk>:
 674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 678:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 67c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 680:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 684:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 688:	e3a0000c 	mov	r0, #12
 68c:	ef000040 	svc	0x00000040
 690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 69c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a4:	e12fff1e 	bx	lr

000006a8 <sleep>:
 6a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6bc:	e3a0000d 	mov	r0, #13
 6c0:	ef000040 	svc	0x00000040
 6c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d8:	e12fff1e 	bx	lr

000006dc <uptime>:
 6dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f0:	e3a0000e 	mov	r0, #14
 6f4:	ef000040 	svc	0x00000040
 6f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 704:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 708:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 70c:	e12fff1e 	bx	lr

00000710 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 710:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 714:	e1a09fa1 	lsr	r9, r1, #31
 718:	e3530000 	cmp	r3, #0
 71c:	03a09000 	moveq	r9, #0
 720:	12099001 	andne	r9, r9, #1
{
 724:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 728:	e3590000 	cmp	r9, #0
 72c:	e3008b74 	movw	r8, #2932	; 0xb74
    neg = 1;
    x = -xx;
 730:	1261e000 	rsbne	lr, r1, #0
 734:	e3408000 	movt	r8, #0
 738:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 73c:	e1a04000 	mov	r4, r0
    neg = 1;
 740:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 744:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 748:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 74c:	e3a05001 	mov	r5, #1
{
 750:	e24dd018 	sub	sp, sp, #24
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
 774:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 778:	e2533001 	subs	r3, r3, #1
 77c:	2afffff7 	bcs	760 <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 780:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 784:	e35c0000 	cmp	ip, #0
 788:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 78c:	e2873001 	add	r3, r7, #1
 790:	e7d81001 	ldrb	r1, [r8, r1]
 794:	e5e61001 	strb	r1, [r6, #1]!
 798:	11a07003 	movne	r7, r3
 79c:	1affffec 	bne	754 <printint+0x44>
  if(neg)
 7a0:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 7a4:	124b201c 	subne	r2, fp, #28
 7a8:	10822003 	addne	r2, r2, r3
 7ac:	13a0102d 	movne	r1, #45	; 0x2d
 7b0:	12873002 	addne	r3, r7, #2
 7b4:	15421010 	strbne	r1, [r2, #-16]
 7b8:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 7bc:	e2435001 	sub	r5, r3, #1
 7c0:	e0826003 	add	r6, r2, r3
 7c4:	e5763001 	ldrb	r3, [r6, #-1]!
 7c8:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 7cc:	e3a02001 	mov	r2, #1
 7d0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7d4:	e1a00004 	mov	r0, r4
 7d8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7dc:	ebfffefb 	bl	3d0 <write>
  while(--i >= 0)
 7e0:	e3750001 	cmn	r5, #1
 7e4:	1afffff6 	bne	7c4 <printint+0xb4>
    putc(fd, buf[i]);
}
 7e8:	e24bd01c 	sub	sp, fp, #28
 7ec:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007f0 <div>:
{
 7f0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7f4:	e3a02000 	mov	r2, #0
{
 7f8:	e28db008 	add	fp, sp, #8
 7fc:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 800:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 804:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 808:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 80c:	e1a0c33e 	lsr	ip, lr, r3
 810:	e20cc001 	and	ip, ip, #1
 814:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 818:	e1520001 	cmp	r2, r1
            r = r - d;
 81c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 820:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 824:	e2533001 	subs	r3, r3, #1
 828:	2afffff7 	bcs	80c <div+0x1c>
}
 82c:	e8bd8810 	pop	{r4, fp, pc}

00000830 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 830:	e92d000e 	push	{r1, r2, r3}
 834:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 838:	e28db018 	add	fp, sp, #24
 83c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 840:	e59b6004 	ldr	r6, [fp, #4]
 844:	e5d64000 	ldrb	r4, [r6]
 848:	e3540000 	cmp	r4, #0
 84c:	0a00002b 	beq	900 <printf+0xd0>
 850:	e1a07000 	mov	r7, r0
 854:	e28b8008 	add	r8, fp, #8
 858:	e3a05000 	mov	r5, #0
 85c:	ea00000a 	b	88c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 860:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 864:	01a05004 	moveq	r5, r4
      if(c == '%'){
 868:	0a000004 	beq	880 <printf+0x50>
 86c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 870:	e3a02001 	mov	r2, #1
 874:	e1a00007 	mov	r0, r7
 878:	e5614006 	strb	r4, [r1, #-6]!
 87c:	ebfffed3 	bl	3d0 <write>
  for(i = 0; fmt[i]; i++){
 880:	e5f64001 	ldrb	r4, [r6, #1]!
 884:	e3540000 	cmp	r4, #0
 888:	0a00001c 	beq	900 <printf+0xd0>
    if(state == 0){
 88c:	e3550000 	cmp	r5, #0
 890:	0afffff2 	beq	860 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 894:	e3550025 	cmp	r5, #37	; 0x25
 898:	1afffff8 	bne	880 <printf+0x50>
      if(c == 'd'){
 89c:	e3540064 	cmp	r4, #100	; 0x64
 8a0:	0a000037 	beq	984 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8a4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8a8:	e3530070 	cmp	r3, #112	; 0x70
 8ac:	0a000017 	beq	910 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8b0:	e3540073 	cmp	r4, #115	; 0x73
 8b4:	0a00001c 	beq	92c <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8b8:	e3540063 	cmp	r4, #99	; 0x63
 8bc:	0a000037 	beq	9a0 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8c0:	e3540025 	cmp	r4, #37	; 0x25
 8c4:	0a000027 	beq	968 <printf+0x138>
  write(fd, &c, 1);
 8c8:	e3a02001 	mov	r2, #1
 8cc:	e24b1019 	sub	r1, fp, #25
 8d0:	e1a00007 	mov	r0, r7
 8d4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8d8:	ebfffebc 	bl	3d0 <write>
 8dc:	e3a02001 	mov	r2, #1
 8e0:	e24b101a 	sub	r1, fp, #26
 8e4:	e1a00007 	mov	r0, r7
 8e8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8ec:	ebfffeb7 	bl	3d0 <write>
  for(i = 0; fmt[i]; i++){
 8f0:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8f4:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 8f8:	e3540000 	cmp	r4, #0
 8fc:	1affffe2 	bne	88c <printf+0x5c>
    }
  }
}
 900:	e24bd018 	sub	sp, fp, #24
 904:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 908:	e28dd00c 	add	sp, sp, #12
 90c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 910:	e3a03000 	mov	r3, #0
 914:	e3a02010 	mov	r2, #16
 918:	e4981004 	ldr	r1, [r8], #4
 91c:	e1a00007 	mov	r0, r7
 920:	ebffff7a 	bl	710 <printint>
      state = 0;
 924:	e3a05000 	mov	r5, #0
 928:	eaffffd4 	b	880 <printf+0x50>
        s = (char*)*ap;
 92c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 930:	e3540000 	cmp	r4, #0
 934:	0a000021 	beq	9c0 <printf+0x190>
        while(*s != 0){
 938:	e5d45000 	ldrb	r5, [r4]
 93c:	e3550000 	cmp	r5, #0
 940:	0affffce 	beq	880 <printf+0x50>
  write(fd, &c, 1);
 944:	e3a02001 	mov	r2, #1
 948:	e24b101d 	sub	r1, fp, #29
 94c:	e1a00007 	mov	r0, r7
 950:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 954:	ebfffe9d 	bl	3d0 <write>
        while(*s != 0){
 958:	e5f45001 	ldrb	r5, [r4, #1]!
 95c:	e3550000 	cmp	r5, #0
 960:	1afffff7 	bne	944 <printf+0x114>
 964:	eaffffc5 	b	880 <printf+0x50>
 968:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 96c:	e3a02001 	mov	r2, #1
 970:	e1a00007 	mov	r0, r7
 974:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 978:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 97c:	ebfffe93 	bl	3d0 <write>
 980:	eaffffbe 	b	880 <printf+0x50>
        printint(fd, *ap, 10, 1);
 984:	e3a03001 	mov	r3, #1
 988:	e3a0200a 	mov	r2, #10
 98c:	e4981004 	ldr	r1, [r8], #4
 990:	e1a00007 	mov	r0, r7
 994:	ebffff5d 	bl	710 <printint>
      state = 0;
 998:	e3a05000 	mov	r5, #0
 99c:	eaffffb7 	b	880 <printf+0x50>
        putc(fd, *ap);
 9a0:	e4983004 	ldr	r3, [r8], #4
 9a4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9a8:	e3a02001 	mov	r2, #1
 9ac:	e1a00007 	mov	r0, r7
      state = 0;
 9b0:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 9b4:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9b8:	ebfffe84 	bl	3d0 <write>
 9bc:	eaffffaf 	b	880 <printf+0x50>
          s = "(null)";
 9c0:	e3004b88 	movw	r4, #2952	; 0xb88
        while(*s != 0){
 9c4:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9c8:	e3404000 	movt	r4, #0
 9cc:	eaffffdc 	b	944 <printf+0x114>

000009d0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d0:	e300cb90 	movw	ip, #2960	; 0xb90
 9d4:	e340c000 	movt	ip, #0
{
 9d8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9dc:	e2401008 	sub	r1, r0, #8
{
 9e0:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e4:	e59c3000 	ldr	r3, [ip]
 9e8:	ea000004 	b	a00 <free+0x30>
 9ec:	e1510002 	cmp	r1, r2
 9f0:	3a000009 	bcc	a1c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	e1530002 	cmp	r3, r2
 9f8:	2a000007 	bcs	a1c <free+0x4c>
{
 9fc:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a00:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a04:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a08:	3afffff7 	bcc	9ec <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a0c:	e1530002 	cmp	r3, r2
 a10:	3afffff9 	bcc	9fc <free+0x2c>
 a14:	e1510002 	cmp	r1, r2
 a18:	2afffff7 	bcs	9fc <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a1c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a20:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a24:	e081418e 	add	r4, r1, lr, lsl #3
 a28:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a2c:	05922004 	ldreq	r2, [r2, #4]
 a30:	0082e00e 	addeq	lr, r2, lr
 a34:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a38:	05932000 	ldreq	r2, [r3]
 a3c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a40:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a44:	e5932004 	ldr	r2, [r3, #4]
 a48:	e083e182 	add	lr, r3, r2, lsl #3
 a4c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a50:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a54:	05101004 	ldreq	r1, [r0, #-4]
 a58:	00812002 	addeq	r2, r1, r2
 a5c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a60:	05102008 	ldreq	r2, [r0, #-8]
 a64:	05832000 	streq	r2, [r3]
}
 a68:	e8bd8810 	pop	{r4, fp, pc}

00000a6c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a6c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a70:	e3007b90 	movw	r7, #2960	; 0xb90
 a74:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a78:	e2804007 	add	r4, r0, #7
{
 a7c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a80:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a84:	e1a041a4 	lsr	r4, r4, #3
 a88:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a8c:	e3530000 	cmp	r3, #0
 a90:	0a000027 	beq	b34 <malloc+0xc8>
 a94:	e5930000 	ldr	r0, [r3]
 a98:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a9c:	e1540002 	cmp	r4, r2
 aa0:	9a000019 	bls	b0c <malloc+0xa0>
 aa4:	e3540a01 	cmp	r4, #4096	; 0x1000
 aa8:	21a05004 	movcs	r5, r4
 aac:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ab0:	e1a06185 	lsl	r6, r5, #3
 ab4:	ea000003 	b	ac8 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 abc:	e5902004 	ldr	r2, [r0, #4]
 ac0:	e1540002 	cmp	r4, r2
 ac4:	9a000010 	bls	b0c <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac8:	e5972000 	ldr	r2, [r7]
 acc:	e1a03000 	mov	r3, r0
 ad0:	e1520000 	cmp	r2, r0
 ad4:	1afffff7 	bne	ab8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ad8:	e1a00006 	mov	r0, r6
 adc:	ebfffee4 	bl	674 <sbrk>
 ae0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ae4:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 ae8:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 aec:	0a000004 	beq	b04 <malloc+0x98>
  hp->s.size = nu;
 af0:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 af4:	ebffffb5 	bl	9d0 <free>
  return freep;
 af8:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 afc:	e3530000 	cmp	r3, #0
 b00:	1affffec 	bne	ab8 <malloc+0x4c>
        return 0;
 b04:	e3a00000 	mov	r0, #0
  }
}
 b08:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b0c:	e1540002 	cmp	r4, r2
      freep = prevp;
 b10:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b14:	10422004 	subne	r2, r2, r4
 b18:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b1c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b20:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b24:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b28:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b2c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b30:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b34:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b38:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b3c:	e5870000 	str	r0, [r7]
 b40:	e5870004 	str	r0, [r7, #4]
 b44:	eaffffd6 	b	aa4 <malloc+0x38>
