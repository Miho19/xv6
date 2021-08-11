
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	c1a08000 	movgt	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  10:	c2814004 	addgt	r4, r1, #4
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  14:	c3a05001 	movgt	r5, #1
  if(argc <= 1){
  18:	da000013 	ble	6c <main+0x6c>
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb000142 	bl	534 <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000006 	blt	54 <main+0x54>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	eb00000e 	bl	78 <cat>
  for(i = 1; i < argc; i++){
  3c:	e2855001 	add	r5, r5, #1
    close(fd);
  40:	e1a00007 	mov	r0, r7
  44:	eb000113 	bl	498 <close>
  for(i = 1; i < argc; i++){
  48:	e1580005 	cmp	r8, r5
  4c:	1afffff2 	bne	1c <main+0x1c>
  }
  exit();
  50:	eb0000c2 	bl	360 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  54:	e5962000 	ldr	r2, [r6]
  58:	e3001bdc 	movw	r1, #3036	; 0xbdc
  5c:	e3a00001 	mov	r0, #1
  60:	e3401000 	movt	r1, #0
  64:	eb000211 	bl	8b0 <printf>
      exit();
  68:	eb0000bc 	bl	360 <exit>
    cat(0);
  6c:	e3a00000 	mov	r0, #0
  70:	eb000000 	bl	78 <cat>
    exit();
  74:	eb0000b9 	bl	360 <exit>

00000078 <cat>:
{
  78:	e92d4830 	push	{r4, r5, fp, lr}
  while((n = read(fd, buf, sizeof(buf))) > 0)
  7c:	e3004c1c 	movw	r4, #3100	; 0xc1c
{
  80:	e28db00c 	add	fp, sp, #12
  84:	e1a05000 	mov	r5, r0
  while((n = read(fd, buf, sizeof(buf))) > 0)
  88:	e3404000 	movt	r4, #0
  8c:	ea000002 	b	9c <cat+0x24>
    write(1, buf, n);
  90:	e1a01004 	mov	r1, r4
  94:	e3a00001 	mov	r0, #1
  98:	eb0000f1 	bl	464 <write>
  while((n = read(fd, buf, sizeof(buf))) > 0)
  9c:	e3a02c02 	mov	r2, #512	; 0x200
  a0:	e1a01004 	mov	r1, r4
  a4:	e1a00005 	mov	r0, r5
  a8:	eb0000e0 	bl	430 <read>
  ac:	e2502000 	subs	r2, r0, #0
  b0:	cafffff6 	bgt	90 <cat+0x18>
  if(n < 0){
  b4:	08bd8830 	popeq	{r4, r5, fp, pc}
    printf(1, "cat: read error\n");
  b8:	e3001bc8 	movw	r1, #3016	; 0xbc8
  bc:	e3a00001 	mov	r0, #1
  c0:	e3401000 	movt	r1, #0
  c4:	eb0001f9 	bl	8b0 <printf>
    exit();
  c8:	eb0000a4 	bl	360 <exit>

000000cc <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d0:	e2402001 	sub	r2, r0, #1
  d4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d8:	e4d13001 	ldrb	r3, [r1], #1
  dc:	e3530000 	cmp	r3, #0
  e0:	e5e23001 	strb	r3, [r2, #1]!
  e4:	1afffffb 	bne	d8 <strcpy+0xc>
    ;
  return os;
}
  e8:	e28bd000 	add	sp, fp, #0
  ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f0:	e12fff1e 	bx	lr

000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  fc:	e5d03000 	ldrb	r3, [r0]
 100:	e5d12000 	ldrb	r2, [r1]
 104:	e3530000 	cmp	r3, #0
 108:	1a000004 	bne	120 <strcmp+0x2c>
 10c:	ea000005 	b	128 <strcmp+0x34>
 110:	e5f03001 	ldrb	r3, [r0, #1]!
 114:	e5f12001 	ldrb	r2, [r1, #1]!
 118:	e3530000 	cmp	r3, #0
 11c:	0a000001 	beq	128 <strcmp+0x34>
 120:	e1530002 	cmp	r3, r2
 124:	0afffff9 	beq	110 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 128:	e0430002 	sub	r0, r3, r2
 12c:	e28bd000 	add	sp, fp, #0
 130:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 134:	e12fff1e 	bx	lr

00000138 <strlen>:

uint
strlen(char *s)
{
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 140:	e5d03000 	ldrb	r3, [r0]
 144:	e3530000 	cmp	r3, #0
 148:	01a00003 	moveq	r0, r3
 14c:	0a000006 	beq	16c <strlen+0x34>
 150:	e1a02000 	mov	r2, r0
 154:	e3a03000 	mov	r3, #0
 158:	e5f21001 	ldrb	r1, [r2, #1]!
 15c:	e2833001 	add	r3, r3, #1
 160:	e3510000 	cmp	r1, #0
 164:	e1a00003 	mov	r0, r3
 168:	1afffffa 	bne	158 <strlen+0x20>
    ;
  return n;
}
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 178:	e3520000 	cmp	r2, #0
{
 17c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 180:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 184:	0a000004 	beq	19c <memset+0x24>
 188:	e6ef1071 	uxtb	r1, r1
 18c:	e0802002 	add	r2, r0, r2
 190:	e4c01001 	strb	r1, [r0], #1
 194:	e1520000 	cmp	r2, r0
 198:	1afffffc 	bne	190 <memset+0x18>
  return (void *)p;
}
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr

000001a8 <strchr>:

char*
strchr(const char *s, char c)
{
 1a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ac:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1b0:	e5d02000 	ldrb	r2, [r0]
 1b4:	e3520000 	cmp	r2, #0
 1b8:	0a00000b 	beq	1ec <strchr+0x44>
    if(*s == c)
 1bc:	e1510002 	cmp	r1, r2
 1c0:	1a000002 	bne	1d0 <strchr+0x28>
 1c4:	ea000005 	b	1e0 <strchr+0x38>
 1c8:	e1530001 	cmp	r3, r1
 1cc:	0a000003 	beq	1e0 <strchr+0x38>
  for(; *s; s++)
 1d0:	e5f03001 	ldrb	r3, [r0, #1]!
 1d4:	e3530000 	cmp	r3, #0
 1d8:	1afffffa 	bne	1c8 <strchr+0x20>
      return (char*)s;
  return 0;
 1dc:	e1a00003 	mov	r0, r3
}
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr
  return 0;
 1ec:	e1a00002 	mov	r0, r2
 1f0:	eafffffa 	b	1e0 <strchr+0x38>

000001f4 <gets>:

char*
gets(char *buf, int max)
{
 1f4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 1f8:	e1a03000 	mov	r3, r0
 1fc:	e28db014 	add	fp, sp, #20
 200:	e1a07000 	mov	r7, r0
 204:	e24dd008 	sub	sp, sp, #8
 208:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20c:	e3a04000 	mov	r4, #0
 210:	ea000008 	b	238 <gets+0x44>
    cc = read(0, &c, 1);
 214:	eb000085 	bl	430 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 218:	e1a03005 	mov	r3, r5
    if(cc < 1)
 21c:	e3500000 	cmp	r0, #0
 220:	da00000b 	ble	254 <gets+0x60>
    buf[i++] = c;
 224:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 228:	e352000d 	cmp	r2, #13
 22c:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 230:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 234:	0a00000b 	beq	268 <gets+0x74>
    cc = read(0, &c, 1);
 238:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 23c:	e0844002 	add	r4, r4, r2
 240:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 244:	e24b1015 	sub	r1, fp, #21
 248:	e3a00000 	mov	r0, #0
 24c:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 250:	baffffef 	blt	214 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 254:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 258:	e3a03000 	mov	r3, #0
 25c:	e5c53000 	strb	r3, [r5]
}
 260:	e24bd014 	sub	sp, fp, #20
 264:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 268:	e0875004 	add	r5, r7, r4
 26c:	eafffff8 	b	254 <gets+0x60>

00000270 <stat>:

int
stat(char *n, struct stat *st)
{
 270:	e92d4830 	push	{r4, r5, fp, lr}
 274:	e1a04001 	mov	r4, r1
 278:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27c:	e3a01000 	mov	r1, #0
 280:	eb0000ab 	bl	534 <open>
  if(fd < 0)
 284:	e2505000 	subs	r5, r0, #0
 288:	ba000006 	blt	2a8 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 28c:	e1a01004 	mov	r1, r4
 290:	eb0000ce 	bl	5d0 <fstat>
 294:	e1a04000 	mov	r4, r0
  close(fd);
 298:	e1a00005 	mov	r0, r5
 29c:	eb00007d 	bl	498 <close>
  return r;
}
 2a0:	e1a00004 	mov	r0, r4
 2a4:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2a8:	e3e04000 	mvn	r4, #0
 2ac:	eafffffb 	b	2a0 <stat+0x30>

000002b0 <atoi>:

int
atoi(const char *s)
{
 2b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b4:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b8:	e5d02000 	ldrb	r2, [r0]
 2bc:	e2423030 	sub	r3, r2, #48	; 0x30
 2c0:	e3530009 	cmp	r3, #9
  n = 0;
 2c4:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 2c8:	8a000006 	bhi	2e8 <atoi+0x38>
    n = n*10 + *s++ - '0';
 2cc:	e3a0c00a 	mov	ip, #10
 2d0:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 2d4:	e5f02001 	ldrb	r2, [r0, #1]!
 2d8:	e2421030 	sub	r1, r2, #48	; 0x30
 2dc:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 2e0:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 2e4:	9afffff9 	bls	2d0 <atoi+0x20>
  return n;
}
 2e8:	e1a00003 	mov	r0, r3
 2ec:	e28bd000 	add	sp, fp, #0
 2f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2f4:	e12fff1e 	bx	lr

000002f8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f8:	e3520000 	cmp	r2, #0
{
 2fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 300:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 304:	da000005 	ble	320 <memmove+0x28>
 308:	e0812002 	add	r2, r1, r2
 30c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 310:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 314:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 318:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 31c:	1afffffb 	bne	310 <memmove+0x18>
  return vdst;
}
 320:	e28bd000 	add	sp, fp, #0
 324:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 328:	e12fff1e 	bx	lr

0000032c <fork>:
 32c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 330:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 334:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 338:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 33c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 340:	e3a00001 	mov	r0, #1
 344:	ef000040 	svc	0x00000040
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 350:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 354:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 358:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <exit>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00002 	mov	r0, #2
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <wait>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00003 	mov	r0, #3
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <lseek>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00016 	mov	r0, #22
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <pipe>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00004 	mov	r0, #4
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <read>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00005 	mov	r0, #5
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <write>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00010 	mov	r0, #16
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <close>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00015 	mov	r0, #21
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <kill>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00006 	mov	r0, #6
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <exec>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00007 	mov	r0, #7
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <open>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a0000f 	mov	r0, #15
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <mknod>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00011 	mov	r0, #17
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <unlink>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00012 	mov	r0, #18
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <fstat>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00008 	mov	r0, #8
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <link>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00013 	mov	r0, #19
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <mkdir>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a00014 	mov	r0, #20
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <chdir>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00009 	mov	r0, #9
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <dup>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a0000a 	mov	r0, #10
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <getpid>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a0000b 	mov	r0, #11
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <sbrk>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a0000c 	mov	r0, #12
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <sleep>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a0000d 	mov	r0, #13
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <uptime>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a0000e 	mov	r0, #14
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7a4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7a8:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7ac:	e013afa1 	ands	sl, r3, r1, lsr #31
 7b0:	e24b4034 	sub	r4, fp, #52	; 0x34
 7b4:	e3009bf4 	movw	r9, #3060	; 0xbf4
    neg = 1;
    x = -xx;
 7b8:	1261e000 	rsbne	lr, r1, #0
 7bc:	e3409000 	movt	r9, #0
{
 7c0:	e1a05000 	mov	r5, r0
    neg = 1;
 7c4:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 7c8:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 7cc:	e3a08000 	mov	r8, #0
  b = base;
 7d0:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 7d4:	e3a06001 	mov	r6, #1
{
 7d8:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 7dc:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 7e0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7e4:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 7e8:	e1a0033e 	lsr	r0, lr, r3
 7ec:	e2000001 	and	r0, r0, #1
 7f0:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7f4:	e1520001 	cmp	r2, r1
            r = r - d;
 7f8:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7fc:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 800:	e2533001 	subs	r3, r3, #1
 804:	2afffff7 	bcs	7e8 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 808:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 80c:	e35c0000 	cmp	ip, #0
 810:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 814:	e2883001 	add	r3, r8, #1
 818:	e7d91001 	ldrb	r1, [r9, r1]
 81c:	e4c71001 	strb	r1, [r7], #1
 820:	11a08003 	movne	r8, r3
 824:	1affffec 	bne	7dc <printint+0x38>
  if(neg)
 828:	e35a0000 	cmp	sl, #0
 82c:	0a000004 	beq	844 <printint+0xa0>
    buf[i++] = '-';
 830:	e24b2024 	sub	r2, fp, #36	; 0x24
 834:	e3a0102d 	mov	r1, #45	; 0x2d
 838:	e0822003 	add	r2, r2, r3
 83c:	e2883002 	add	r3, r8, #2
 840:	e5421010 	strb	r1, [r2, #-16]
 844:	e0846003 	add	r6, r4, r3
 848:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 84c:	e3a02001 	mov	r2, #1
 850:	e24b1035 	sub	r1, fp, #53	; 0x35
 854:	e1a00005 	mov	r0, r5
 858:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 85c:	ebffff00 	bl	464 <write>

  while(--i >= 0)
 860:	e1540006 	cmp	r4, r6
 864:	1afffff7 	bne	848 <printint+0xa4>
    putc(fd, buf[i]);
}
 868:	e24bd020 	sub	sp, fp, #32
 86c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000870 <div>:
{
 870:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 874:	e3a02000 	mov	r2, #0
{
 878:	e28db008 	add	fp, sp, #8
 87c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 880:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 884:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 888:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 88c:	e1a0c33e 	lsr	ip, lr, r3
 890:	e20cc001 	and	ip, ip, #1
 894:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 898:	e1520001 	cmp	r2, r1
            r = r - d;
 89c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 8a0:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 8a4:	e2533001 	subs	r3, r3, #1
 8a8:	38bd8810 	popcc	{r4, fp, pc}
 8ac:	eafffff6 	b	88c <div+0x1c>

000008b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8b0:	e92d000e 	push	{r1, r2, r3}
 8b4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8b8:	e28db018 	add	fp, sp, #24
 8bc:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c0:	e59b5004 	ldr	r5, [fp, #4]
 8c4:	e5d54000 	ldrb	r4, [r5]
 8c8:	e3540000 	cmp	r4, #0
 8cc:	0a00002b 	beq	980 <printf+0xd0>
 8d0:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 8d4:	e28b8008 	add	r8, fp, #8
  state = 0;
 8d8:	e3a06000 	mov	r6, #0
 8dc:	ea00000a 	b	90c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e0:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8e4:	01a06004 	moveq	r6, r4
      if(c == '%'){
 8e8:	0a000004 	beq	900 <printf+0x50>
 8ec:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 8f0:	e3a02001 	mov	r2, #1
 8f4:	e1a00007 	mov	r0, r7
 8f8:	e5614006 	strb	r4, [r1, #-6]!
 8fc:	ebfffed8 	bl	464 <write>
  for(i = 0; fmt[i]; i++){
 900:	e5f54001 	ldrb	r4, [r5, #1]!
 904:	e3540000 	cmp	r4, #0
 908:	0a00001c 	beq	980 <printf+0xd0>
    if(state == 0){
 90c:	e3560000 	cmp	r6, #0
 910:	0afffff2 	beq	8e0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 914:	e3560025 	cmp	r6, #37	; 0x25
 918:	1afffff8 	bne	900 <printf+0x50>
      if(c == 'd'){
 91c:	e3540064 	cmp	r4, #100	; 0x64
 920:	0a000030 	beq	9e8 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 924:	e20430f7 	and	r3, r4, #247	; 0xf7
 928:	e3530070 	cmp	r3, #112	; 0x70
 92c:	0a000017 	beq	990 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 930:	e3540073 	cmp	r4, #115	; 0x73
 934:	0a00001c 	beq	9ac <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 938:	e3540063 	cmp	r4, #99	; 0x63
 93c:	0a000037 	beq	a20 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 940:	e3540025 	cmp	r4, #37	; 0x25
 944:	0a00002e 	beq	a04 <printf+0x154>
  write(fd, &c, 1);
 948:	e3a02001 	mov	r2, #1
 94c:	e24b1019 	sub	r1, fp, #25
 950:	e1a00007 	mov	r0, r7
 954:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 958:	ebfffec1 	bl	464 <write>
 95c:	e3a02001 	mov	r2, #1
 960:	e24b101a 	sub	r1, fp, #26
 964:	e1a00007 	mov	r0, r7
 968:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 96c:	ebfffebc 	bl	464 <write>
  for(i = 0; fmt[i]; i++){
 970:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 978:	e3540000 	cmp	r4, #0
 97c:	1affffe2 	bne	90c <printf+0x5c>
    }
  }
}
 980:	e24bd018 	sub	sp, fp, #24
 984:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 988:	e28dd00c 	add	sp, sp, #12
 98c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 990:	e3a03000 	mov	r3, #0
 994:	e3a02010 	mov	r2, #16
 998:	e4981004 	ldr	r1, [r8], #4
 99c:	e1a00007 	mov	r0, r7
 9a0:	ebffff7f 	bl	7a4 <printint>
      state = 0;
 9a4:	e3a06000 	mov	r6, #0
 9a8:	eaffffd4 	b	900 <printf+0x50>
        s = (char*)*ap;
 9ac:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 9b0:	e3540000 	cmp	r4, #0
 9b4:	0a000021 	beq	a40 <printf+0x190>
        while(*s != 0){
 9b8:	e5d46000 	ldrb	r6, [r4]
 9bc:	e3560000 	cmp	r6, #0
 9c0:	0affffce 	beq	900 <printf+0x50>
  write(fd, &c, 1);
 9c4:	e3a02001 	mov	r2, #1
 9c8:	e24b101d 	sub	r1, fp, #29
 9cc:	e1a00007 	mov	r0, r7
 9d0:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 9d4:	ebfffea2 	bl	464 <write>
        while(*s != 0){
 9d8:	e5f46001 	ldrb	r6, [r4, #1]!
 9dc:	e3560000 	cmp	r6, #0
 9e0:	1afffff7 	bne	9c4 <printf+0x114>
 9e4:	eaffffc5 	b	900 <printf+0x50>
        printint(fd, *ap, 10, 1);
 9e8:	e3a03001 	mov	r3, #1
 9ec:	e3a0200a 	mov	r2, #10
 9f0:	e4981004 	ldr	r1, [r8], #4
 9f4:	e1a00007 	mov	r0, r7
 9f8:	ebffff69 	bl	7a4 <printint>
      state = 0;
 9fc:	e3a06000 	mov	r6, #0
 a00:	eaffffbe 	b	900 <printf+0x50>
 a04:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a08:	e3a02001 	mov	r2, #1
 a0c:	e1a00007 	mov	r0, r7
 a10:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 a14:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 a18:	ebfffe91 	bl	464 <write>
 a1c:	eaffffb7 	b	900 <printf+0x50>
        putc(fd, *ap);
 a20:	e4983004 	ldr	r3, [r8], #4
 a24:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a28:	e3a02001 	mov	r2, #1
 a2c:	e1a00007 	mov	r0, r7
      state = 0;
 a30:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 a34:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 a38:	ebfffe89 	bl	464 <write>
 a3c:	eaffffaf 	b	900 <printf+0x50>
          s = "(null)";
 a40:	e3004c08 	movw	r4, #3080	; 0xc08
        while(*s != 0){
 a44:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 a48:	e3404000 	movt	r4, #0
 a4c:	eaffffdc 	b	9c4 <printf+0x114>

00000a50 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a50:	e300cc10 	movw	ip, #3088	; 0xc10
 a54:	e340c000 	movt	ip, #0
{
 a58:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a5c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a60:	e59c3000 	ldr	r3, [ip]
{
 a64:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a68:	e1530001 	cmp	r3, r1
 a6c:	e5932000 	ldr	r2, [r3]
 a70:	2a000017 	bcs	ad4 <free+0x84>
 a74:	e1510002 	cmp	r1, r2
 a78:	3a000001 	bcc	a84 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a7c:	e1530002 	cmp	r3, r2
 a80:	3a000017 	bcc	ae4 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a84:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a88:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a8c:	e081418e 	add	r4, r1, lr, lsl #3
 a90:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a94:	05922004 	ldreq	r2, [r2, #4]
 a98:	0082e00e 	addeq	lr, r2, lr
 a9c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 aa0:	05932000 	ldreq	r2, [r3]
 aa4:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 aa8:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 aac:	e5932004 	ldr	r2, [r3, #4]
 ab0:	e083e182 	add	lr, r3, r2, lsl #3
 ab4:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 ab8:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 abc:	05101004 	ldreq	r1, [r0, #-4]
 ac0:	00812002 	addeq	r2, r1, r2
 ac4:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 ac8:	05102008 	ldreq	r2, [r0, #-8]
 acc:	05832000 	streq	r2, [r3]
}
 ad0:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	e1530002 	cmp	r3, r2
 ad8:	3a000001 	bcc	ae4 <free+0x94>
 adc:	e1510002 	cmp	r1, r2
 ae0:	3affffe7 	bcc	a84 <free+0x34>
{
 ae4:	e1a03002 	mov	r3, r2
 ae8:	eaffffde 	b	a68 <free+0x18>

00000aec <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 aec:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 af0:	e3007c10 	movw	r7, #3088	; 0xc10
 af4:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 af8:	e2804007 	add	r4, r0, #7
{
 afc:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b00:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b04:	e1a041a4 	lsr	r4, r4, #3
 b08:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b0c:	e3530000 	cmp	r3, #0
 b10:	0a000027 	beq	bb4 <malloc+0xc8>
 b14:	e5930000 	ldr	r0, [r3]
 b18:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b1c:	e1540002 	cmp	r4, r2
 b20:	9a000019 	bls	b8c <malloc+0xa0>
 b24:	e3540a01 	cmp	r4, #4096	; 0x1000
 b28:	21a05004 	movcs	r5, r4
 b2c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b30:	e1a06185 	lsl	r6, r5, #3
 b34:	ea000003 	b	b48 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b38:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b3c:	e5902004 	ldr	r2, [r0, #4]
 b40:	e1520004 	cmp	r2, r4
 b44:	2a000010 	bcs	b8c <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b48:	e5972000 	ldr	r2, [r7]
 b4c:	e1a03000 	mov	r3, r0
 b50:	e1520000 	cmp	r2, r0
 b54:	1afffff7 	bne	b38 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b58:	e1a00006 	mov	r0, r6
 b5c:	ebfffee9 	bl	708 <sbrk>
 b60:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b64:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b68:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b6c:	0a000004 	beq	b84 <malloc+0x98>
  hp->s.size = nu;
 b70:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b74:	ebffffb5 	bl	a50 <free>
  return freep;
 b78:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b7c:	e3530000 	cmp	r3, #0
 b80:	1affffec 	bne	b38 <malloc+0x4c>
        return 0;
 b84:	e3a00000 	mov	r0, #0
  }
}
 b88:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b8c:	e1540002 	cmp	r4, r2
      freep = prevp;
 b90:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b94:	10422004 	subne	r2, r2, r4
 b98:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b9c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 ba0:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 ba4:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 ba8:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 bac:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 bb0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 bb4:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 bb8:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 bbc:	e5870000 	str	r0, [r7]
 bc0:	e5870004 	str	r0, [r7, #4]
 bc4:	eaffffd6 	b	b24 <malloc+0x38>
