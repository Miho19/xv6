
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   4:	e3000be8 	movw	r0, #3048	; 0xbe8
{
   8:	e28db014 	add	fp, sp, #20
  if(open("console", O_RDWR) < 0){
   c:	e3a01002 	mov	r1, #2
  10:	e3400000 	movt	r0, #0
  14:	eb00014e 	bl	554 <open>
  18:	e3500000 	cmp	r0, #0
  1c:	ba000028 	blt	c4 <main+0xc4>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  20:	e3a00000 	mov	r0, #0
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
  24:	e3006bf0 	movw	r6, #3056	; 0xbf0
  dup(0);  // stdout
  28:	eb0001a4 	bl	6c0 <dup>
  dup(0);  // stderr
  2c:	e3a00000 	mov	r0, #0
  30:	eb0001a2 	bl	6c0 <dup>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  34:	e3005c34 	movw	r5, #3124	; 0xc34
    printf(1, "init: starting sh\n");
  38:	e3406000 	movt	r6, #0
      printf(1, "zombie!\n");
  3c:	e3405000 	movt	r5, #0
    printf(1, "init: starting sh\n");
  40:	e1a01006 	mov	r1, r6
  44:	e3a00001 	mov	r0, #1
  48:	eb000220 	bl	8d0 <printf>
    pid = fork();
  4c:	eb0000be 	bl	34c <fork>
    if(pid < 0){
  50:	e2504000 	subs	r4, r0, #0
  54:	ba00000b 	blt	88 <main+0x88>
    if(pid == 0){
  58:	0a00000f 	beq	9c <main+0x9c>
    while((wpid=wait()) >= 0 && wpid != pid)
  5c:	eb0000d4 	bl	3b4 <wait>
  60:	e1540000 	cmp	r4, r0
  64:	e1e03000 	mvn	r3, r0
  68:	e1a03fa3 	lsr	r3, r3, #31
  6c:	03a03000 	moveq	r3, #0
  70:	e3530000 	cmp	r3, #0
  74:	0afffff1 	beq	40 <main+0x40>
      printf(1, "zombie!\n");
  78:	e1a01005 	mov	r1, r5
  7c:	e3a00001 	mov	r0, #1
  80:	eb000212 	bl	8d0 <printf>
  84:	eafffff4 	b	5c <main+0x5c>
      printf(1, "init: fork failed\n");
  88:	e3001c04 	movw	r1, #3076	; 0xc04
  8c:	e3a00001 	mov	r0, #1
  90:	e3401000 	movt	r1, #0
  94:	eb00020d 	bl	8d0 <printf>
      exit();
  98:	eb0000b8 	bl	380 <exit>
      exec("sh", argv);
  9c:	e3001c5c 	movw	r1, #3164	; 0xc5c
  a0:	e3000c18 	movw	r0, #3096	; 0xc18
  a4:	e3401000 	movt	r1, #0
  a8:	e3400000 	movt	r0, #0
  ac:	eb00011b 	bl	520 <exec>
      printf(1, "init: exec sh failed\n");
  b0:	e3001c1c 	movw	r1, #3100	; 0xc1c
  b4:	e3a00001 	mov	r0, #1
  b8:	e3401000 	movt	r1, #0
  bc:	eb000203 	bl	8d0 <printf>
      exit();
  c0:	eb0000ae 	bl	380 <exit>
    mknod("console", 1, 1);
  c4:	e3a02001 	mov	r2, #1
  c8:	e3000be8 	movw	r0, #3048	; 0xbe8
  cc:	e1a01002 	mov	r1, r2
  d0:	e3400000 	movt	r0, #0
  d4:	eb00012b 	bl	588 <mknod>
    open("console", O_RDWR);
  d8:	e3000be8 	movw	r0, #3048	; 0xbe8
  dc:	e3a01002 	mov	r1, #2
  e0:	e3400000 	movt	r0, #0
  e4:	eb00011a 	bl	554 <open>
  e8:	eaffffcc 	b	20 <main+0x20>

000000ec <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f0:	e2402001 	sub	r2, r0, #1
  f4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f8:	e4d13001 	ldrb	r3, [r1], #1
  fc:	e3530000 	cmp	r3, #0
 100:	e5e23001 	strb	r3, [r2, #1]!
 104:	1afffffb 	bne	f8 <strcpy+0xc>
    ;
  return os;
}
 108:	e28bd000 	add	sp, fp, #0
 10c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 110:	e12fff1e 	bx	lr

00000114 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 118:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 11c:	e5d03000 	ldrb	r3, [r0]
 120:	e5d12000 	ldrb	r2, [r1]
 124:	e3530000 	cmp	r3, #0
 128:	1a000004 	bne	140 <strcmp+0x2c>
 12c:	ea000005 	b	148 <strcmp+0x34>
 130:	e5f03001 	ldrb	r3, [r0, #1]!
 134:	e5f12001 	ldrb	r2, [r1, #1]!
 138:	e3530000 	cmp	r3, #0
 13c:	0a000001 	beq	148 <strcmp+0x34>
 140:	e1530002 	cmp	r3, r2
 144:	0afffff9 	beq	130 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 148:	e0430002 	sub	r0, r3, r2
 14c:	e28bd000 	add	sp, fp, #0
 150:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 154:	e12fff1e 	bx	lr

00000158 <strlen>:

uint
strlen(char *s)
{
 158:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 15c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 160:	e5d03000 	ldrb	r3, [r0]
 164:	e3530000 	cmp	r3, #0
 168:	01a00003 	moveq	r0, r3
 16c:	0a000006 	beq	18c <strlen+0x34>
 170:	e1a02000 	mov	r2, r0
 174:	e3a03000 	mov	r3, #0
 178:	e5f21001 	ldrb	r1, [r2, #1]!
 17c:	e2833001 	add	r3, r3, #1
 180:	e3510000 	cmp	r1, #0
 184:	e1a00003 	mov	r0, r3
 188:	1afffffa 	bne	178 <strlen+0x20>
    ;
  return n;
}
 18c:	e28bd000 	add	sp, fp, #0
 190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 194:	e12fff1e 	bx	lr

00000198 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 198:	e3520000 	cmp	r2, #0
{
 19c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a0:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1a4:	0a000004 	beq	1bc <memset+0x24>
 1a8:	e6ef1071 	uxtb	r1, r1
 1ac:	e0802002 	add	r2, r0, r2
 1b0:	e4c01001 	strb	r1, [r0], #1
 1b4:	e1520000 	cmp	r2, r0
 1b8:	1afffffc 	bne	1b0 <memset+0x18>
  return (void *)p;
}
 1bc:	e28bd000 	add	sp, fp, #0
 1c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1c4:	e12fff1e 	bx	lr

000001c8 <strchr>:

char*
strchr(const char *s, char c)
{
 1c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1cc:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1d0:	e5d02000 	ldrb	r2, [r0]
 1d4:	e3520000 	cmp	r2, #0
 1d8:	0a00000b 	beq	20c <strchr+0x44>
    if(*s == c)
 1dc:	e1510002 	cmp	r1, r2
 1e0:	1a000002 	bne	1f0 <strchr+0x28>
 1e4:	ea000005 	b	200 <strchr+0x38>
 1e8:	e1530001 	cmp	r3, r1
 1ec:	0a000003 	beq	200 <strchr+0x38>
  for(; *s; s++)
 1f0:	e5f03001 	ldrb	r3, [r0, #1]!
 1f4:	e3530000 	cmp	r3, #0
 1f8:	1afffffa 	bne	1e8 <strchr+0x20>
      return (char*)s;
  return 0;
 1fc:	e1a00003 	mov	r0, r3
}
 200:	e28bd000 	add	sp, fp, #0
 204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 208:	e12fff1e 	bx	lr
  return 0;
 20c:	e1a00002 	mov	r0, r2
 210:	eafffffa 	b	200 <strchr+0x38>

00000214 <gets>:

char*
gets(char *buf, int max)
{
 214:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 218:	e1a03000 	mov	r3, r0
 21c:	e28db014 	add	fp, sp, #20
 220:	e1a07000 	mov	r7, r0
 224:	e24dd008 	sub	sp, sp, #8
 228:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22c:	e3a04000 	mov	r4, #0
 230:	ea000008 	b	258 <gets+0x44>
    cc = read(0, &c, 1);
 234:	eb000085 	bl	450 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 238:	e1a03005 	mov	r3, r5
    if(cc < 1)
 23c:	e3500000 	cmp	r0, #0
 240:	da00000b 	ble	274 <gets+0x60>
    buf[i++] = c;
 244:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 248:	e352000d 	cmp	r2, #13
 24c:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 250:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 254:	0a00000b 	beq	288 <gets+0x74>
    cc = read(0, &c, 1);
 258:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 25c:	e0844002 	add	r4, r4, r2
 260:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 264:	e24b1015 	sub	r1, fp, #21
 268:	e3a00000 	mov	r0, #0
 26c:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 270:	baffffef 	blt	234 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 274:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 278:	e3a03000 	mov	r3, #0
 27c:	e5c53000 	strb	r3, [r5]
}
 280:	e24bd014 	sub	sp, fp, #20
 284:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 288:	e0875004 	add	r5, r7, r4
 28c:	eafffff8 	b	274 <gets+0x60>

00000290 <stat>:

int
stat(char *n, struct stat *st)
{
 290:	e92d4830 	push	{r4, r5, fp, lr}
 294:	e1a04001 	mov	r4, r1
 298:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29c:	e3a01000 	mov	r1, #0
 2a0:	eb0000ab 	bl	554 <open>
  if(fd < 0)
 2a4:	e2505000 	subs	r5, r0, #0
 2a8:	ba000006 	blt	2c8 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2ac:	e1a01004 	mov	r1, r4
 2b0:	eb0000ce 	bl	5f0 <fstat>
 2b4:	e1a04000 	mov	r4, r0
  close(fd);
 2b8:	e1a00005 	mov	r0, r5
 2bc:	eb00007d 	bl	4b8 <close>
  return r;
}
 2c0:	e1a00004 	mov	r0, r4
 2c4:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2c8:	e3e04000 	mvn	r4, #0
 2cc:	eafffffb 	b	2c0 <stat+0x30>

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2d4:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d8:	e5d02000 	ldrb	r2, [r0]
 2dc:	e2423030 	sub	r3, r2, #48	; 0x30
 2e0:	e3530009 	cmp	r3, #9
  n = 0;
 2e4:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 2e8:	8a000006 	bhi	308 <atoi+0x38>
    n = n*10 + *s++ - '0';
 2ec:	e3a0c00a 	mov	ip, #10
 2f0:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 2f4:	e5f02001 	ldrb	r2, [r0, #1]!
 2f8:	e2421030 	sub	r1, r2, #48	; 0x30
 2fc:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 300:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 304:	9afffff9 	bls	2f0 <atoi+0x20>
  return n;
}
 308:	e1a00003 	mov	r0, r3
 30c:	e28bd000 	add	sp, fp, #0
 310:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 314:	e12fff1e 	bx	lr

00000318 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 318:	e3520000 	cmp	r2, #0
{
 31c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 320:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 324:	da000005 	ble	340 <memmove+0x28>
 328:	e0812002 	add	r2, r1, r2
 32c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 330:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 334:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 338:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 33c:	1afffffb 	bne	330 <memmove+0x18>
  return vdst;
}
 340:	e28bd000 	add	sp, fp, #0
 344:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 348:	e12fff1e 	bx	lr

0000034c <fork>:
 34c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 350:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 354:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 358:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 35c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 360:	e3a00001 	mov	r0, #1
 364:	ef000040 	svc	0x00000040
 368:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 374:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 378:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 37c:	e12fff1e 	bx	lr

00000380 <exit>:
 380:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 384:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 388:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 38c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 390:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 394:	e3a00002 	mov	r0, #2
 398:	ef000040 	svc	0x00000040
 39c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b0:	e12fff1e 	bx	lr

000003b4 <wait>:
 3b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c8:	e3a00003 	mov	r0, #3
 3cc:	ef000040 	svc	0x00000040
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e4:	e12fff1e 	bx	lr

000003e8 <lseek>:
 3e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3fc:	e3a00016 	mov	r0, #22
 400:	ef000040 	svc	0x00000040
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 410:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 414:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 418:	e12fff1e 	bx	lr

0000041c <pipe>:
 41c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 420:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 424:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 428:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 42c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 430:	e3a00004 	mov	r0, #4
 434:	ef000040 	svc	0x00000040
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 444:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 448:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 44c:	e12fff1e 	bx	lr

00000450 <read>:
 450:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 454:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 458:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 45c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 460:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 464:	e3a00005 	mov	r0, #5
 468:	ef000040 	svc	0x00000040
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 478:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 47c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 480:	e12fff1e 	bx	lr

00000484 <write>:
 484:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 488:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 48c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 490:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 494:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 498:	e3a00010 	mov	r0, #16
 49c:	ef000040 	svc	0x00000040
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b4:	e12fff1e 	bx	lr

000004b8 <close>:
 4b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4cc:	e3a00015 	mov	r0, #21
 4d0:	ef000040 	svc	0x00000040
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e8:	e12fff1e 	bx	lr

000004ec <kill>:
 4ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 500:	e3a00006 	mov	r0, #6
 504:	ef000040 	svc	0x00000040
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 514:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 518:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 51c:	e12fff1e 	bx	lr

00000520 <exec>:
 520:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 524:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 528:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 52c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 530:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 534:	e3a00007 	mov	r0, #7
 538:	ef000040 	svc	0x00000040
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 548:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 54c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 550:	e12fff1e 	bx	lr

00000554 <open>:
 554:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 558:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 55c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 560:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 564:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 568:	e3a0000f 	mov	r0, #15
 56c:	ef000040 	svc	0x00000040
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 57c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 580:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 584:	e12fff1e 	bx	lr

00000588 <mknod>:
 588:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 58c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 590:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 594:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 598:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 59c:	e3a00011 	mov	r0, #17
 5a0:	ef000040 	svc	0x00000040
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b8:	e12fff1e 	bx	lr

000005bc <unlink>:
 5bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d0:	e3a00012 	mov	r0, #18
 5d4:	ef000040 	svc	0x00000040
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ec:	e12fff1e 	bx	lr

000005f0 <fstat>:
 5f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 604:	e3a00008 	mov	r0, #8
 608:	ef000040 	svc	0x00000040
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 618:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 61c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 620:	e12fff1e 	bx	lr

00000624 <link>:
 624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 628:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 62c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 630:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 634:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 638:	e3a00013 	mov	r0, #19
 63c:	ef000040 	svc	0x00000040
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 64c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 650:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 654:	e12fff1e 	bx	lr

00000658 <mkdir>:
 658:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 65c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 660:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 664:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 668:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 66c:	e3a00014 	mov	r0, #20
 670:	ef000040 	svc	0x00000040
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 680:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 688:	e12fff1e 	bx	lr

0000068c <chdir>:
 68c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 690:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 694:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 698:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 69c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a0:	e3a00009 	mov	r0, #9
 6a4:	ef000040 	svc	0x00000040
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6bc:	e12fff1e 	bx	lr

000006c0 <dup>:
 6c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d4:	e3a0000a 	mov	r0, #10
 6d8:	ef000040 	svc	0x00000040
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f0:	e12fff1e 	bx	lr

000006f4 <getpid>:
 6f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 700:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 704:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 708:	e3a0000b 	mov	r0, #11
 70c:	ef000040 	svc	0x00000040
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 71c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 720:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 724:	e12fff1e 	bx	lr

00000728 <sbrk>:
 728:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 72c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 730:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 734:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 738:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 73c:	e3a0000c 	mov	r0, #12
 740:	ef000040 	svc	0x00000040
 744:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 750:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 754:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 758:	e12fff1e 	bx	lr

0000075c <sleep>:
 75c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 760:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 764:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 768:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 76c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 770:	e3a0000d 	mov	r0, #13
 774:	ef000040 	svc	0x00000040
 778:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 784:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 788:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 78c:	e12fff1e 	bx	lr

00000790 <uptime>:
 790:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 794:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 798:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 79c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a4:	e3a0000e 	mov	r0, #14
 7a8:	ef000040 	svc	0x00000040
 7ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c0:	e12fff1e 	bx	lr

000007c4 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7c4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7c8:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7cc:	e013afa1 	ands	sl, r3, r1, lsr #31
 7d0:	e24b4034 	sub	r4, fp, #52	; 0x34
 7d4:	e3009c40 	movw	r9, #3136	; 0xc40
    neg = 1;
    x = -xx;
 7d8:	1261e000 	rsbne	lr, r1, #0
 7dc:	e3409000 	movt	r9, #0
{
 7e0:	e1a05000 	mov	r5, r0
    neg = 1;
 7e4:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 7e8:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 7ec:	e3a08000 	mov	r8, #0
  b = base;
 7f0:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 7f4:	e3a06001 	mov	r6, #1
{
 7f8:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 7fc:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 800:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 804:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 808:	e1a0033e 	lsr	r0, lr, r3
 80c:	e2000001 	and	r0, r0, #1
 810:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 814:	e1520001 	cmp	r2, r1
            r = r - d;
 818:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 81c:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 820:	e2533001 	subs	r3, r3, #1
 824:	2afffff7 	bcs	808 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 828:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 82c:	e35c0000 	cmp	ip, #0
 830:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 834:	e2883001 	add	r3, r8, #1
 838:	e7d91001 	ldrb	r1, [r9, r1]
 83c:	e4c71001 	strb	r1, [r7], #1
 840:	11a08003 	movne	r8, r3
 844:	1affffec 	bne	7fc <printint+0x38>
  if(neg)
 848:	e35a0000 	cmp	sl, #0
 84c:	0a000004 	beq	864 <printint+0xa0>
    buf[i++] = '-';
 850:	e24b2024 	sub	r2, fp, #36	; 0x24
 854:	e3a0102d 	mov	r1, #45	; 0x2d
 858:	e0822003 	add	r2, r2, r3
 85c:	e2883002 	add	r3, r8, #2
 860:	e5421010 	strb	r1, [r2, #-16]
 864:	e0846003 	add	r6, r4, r3
 868:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 86c:	e3a02001 	mov	r2, #1
 870:	e24b1035 	sub	r1, fp, #53	; 0x35
 874:	e1a00005 	mov	r0, r5
 878:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 87c:	ebffff00 	bl	484 <write>

  while(--i >= 0)
 880:	e1540006 	cmp	r4, r6
 884:	1afffff7 	bne	868 <printint+0xa4>
    putc(fd, buf[i]);
}
 888:	e24bd020 	sub	sp, fp, #32
 88c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000890 <div>:
{
 890:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 894:	e3a02000 	mov	r2, #0
{
 898:	e28db008 	add	fp, sp, #8
 89c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8a0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8a4:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8a8:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 8ac:	e1a0c33e 	lsr	ip, lr, r3
 8b0:	e20cc001 	and	ip, ip, #1
 8b4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8b8:	e1520001 	cmp	r2, r1
            r = r - d;
 8bc:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 8c0:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 8c4:	e2533001 	subs	r3, r3, #1
 8c8:	38bd8810 	popcc	{r4, fp, pc}
 8cc:	eafffff6 	b	8ac <div+0x1c>

000008d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8d0:	e92d000e 	push	{r1, r2, r3}
 8d4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8d8:	e28db018 	add	fp, sp, #24
 8dc:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8e0:	e59b5004 	ldr	r5, [fp, #4]
 8e4:	e5d54000 	ldrb	r4, [r5]
 8e8:	e3540000 	cmp	r4, #0
 8ec:	0a00002b 	beq	9a0 <printf+0xd0>
 8f0:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 8f4:	e28b8008 	add	r8, fp, #8
  state = 0;
 8f8:	e3a06000 	mov	r6, #0
 8fc:	ea00000a 	b	92c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 900:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 904:	01a06004 	moveq	r6, r4
      if(c == '%'){
 908:	0a000004 	beq	920 <printf+0x50>
 90c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 910:	e3a02001 	mov	r2, #1
 914:	e1a00007 	mov	r0, r7
 918:	e5614006 	strb	r4, [r1, #-6]!
 91c:	ebfffed8 	bl	484 <write>
  for(i = 0; fmt[i]; i++){
 920:	e5f54001 	ldrb	r4, [r5, #1]!
 924:	e3540000 	cmp	r4, #0
 928:	0a00001c 	beq	9a0 <printf+0xd0>
    if(state == 0){
 92c:	e3560000 	cmp	r6, #0
 930:	0afffff2 	beq	900 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 934:	e3560025 	cmp	r6, #37	; 0x25
 938:	1afffff8 	bne	920 <printf+0x50>
      if(c == 'd'){
 93c:	e3540064 	cmp	r4, #100	; 0x64
 940:	0a000030 	beq	a08 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 944:	e20430f7 	and	r3, r4, #247	; 0xf7
 948:	e3530070 	cmp	r3, #112	; 0x70
 94c:	0a000017 	beq	9b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 950:	e3540073 	cmp	r4, #115	; 0x73
 954:	0a00001c 	beq	9cc <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 958:	e3540063 	cmp	r4, #99	; 0x63
 95c:	0a000037 	beq	a40 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 960:	e3540025 	cmp	r4, #37	; 0x25
 964:	0a00002e 	beq	a24 <printf+0x154>
  write(fd, &c, 1);
 968:	e3a02001 	mov	r2, #1
 96c:	e24b1019 	sub	r1, fp, #25
 970:	e1a00007 	mov	r0, r7
 974:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 978:	ebfffec1 	bl	484 <write>
 97c:	e3a02001 	mov	r2, #1
 980:	e24b101a 	sub	r1, fp, #26
 984:	e1a00007 	mov	r0, r7
 988:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 98c:	ebfffebc 	bl	484 <write>
  for(i = 0; fmt[i]; i++){
 990:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 994:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 998:	e3540000 	cmp	r4, #0
 99c:	1affffe2 	bne	92c <printf+0x5c>
    }
  }
}
 9a0:	e24bd018 	sub	sp, fp, #24
 9a4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9a8:	e28dd00c 	add	sp, sp, #12
 9ac:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 9b0:	e3a03000 	mov	r3, #0
 9b4:	e3a02010 	mov	r2, #16
 9b8:	e4981004 	ldr	r1, [r8], #4
 9bc:	e1a00007 	mov	r0, r7
 9c0:	ebffff7f 	bl	7c4 <printint>
      state = 0;
 9c4:	e3a06000 	mov	r6, #0
 9c8:	eaffffd4 	b	920 <printf+0x50>
        s = (char*)*ap;
 9cc:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 9d0:	e3540000 	cmp	r4, #0
 9d4:	0a000021 	beq	a60 <printf+0x190>
        while(*s != 0){
 9d8:	e5d46000 	ldrb	r6, [r4]
 9dc:	e3560000 	cmp	r6, #0
 9e0:	0affffce 	beq	920 <printf+0x50>
  write(fd, &c, 1);
 9e4:	e3a02001 	mov	r2, #1
 9e8:	e24b101d 	sub	r1, fp, #29
 9ec:	e1a00007 	mov	r0, r7
 9f0:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 9f4:	ebfffea2 	bl	484 <write>
        while(*s != 0){
 9f8:	e5f46001 	ldrb	r6, [r4, #1]!
 9fc:	e3560000 	cmp	r6, #0
 a00:	1afffff7 	bne	9e4 <printf+0x114>
 a04:	eaffffc5 	b	920 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a08:	e3a03001 	mov	r3, #1
 a0c:	e3a0200a 	mov	r2, #10
 a10:	e4981004 	ldr	r1, [r8], #4
 a14:	e1a00007 	mov	r0, r7
 a18:	ebffff69 	bl	7c4 <printint>
      state = 0;
 a1c:	e3a06000 	mov	r6, #0
 a20:	eaffffbe 	b	920 <printf+0x50>
 a24:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a28:	e3a02001 	mov	r2, #1
 a2c:	e1a00007 	mov	r0, r7
 a30:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 a34:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 a38:	ebfffe91 	bl	484 <write>
 a3c:	eaffffb7 	b	920 <printf+0x50>
        putc(fd, *ap);
 a40:	e4983004 	ldr	r3, [r8], #4
 a44:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a48:	e3a02001 	mov	r2, #1
 a4c:	e1a00007 	mov	r0, r7
      state = 0;
 a50:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 a54:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 a58:	ebfffe89 	bl	484 <write>
 a5c:	eaffffaf 	b	920 <printf+0x50>
          s = "(null)";
 a60:	e3004c54 	movw	r4, #3156	; 0xc54
        while(*s != 0){
 a64:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 a68:	e3404000 	movt	r4, #0
 a6c:	eaffffdc 	b	9e4 <printf+0x114>

00000a70 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a70:	e300cc64 	movw	ip, #3172	; 0xc64
 a74:	e340c000 	movt	ip, #0
{
 a78:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a7c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a80:	e59c3000 	ldr	r3, [ip]
{
 a84:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a88:	e1530001 	cmp	r3, r1
 a8c:	e5932000 	ldr	r2, [r3]
 a90:	2a000017 	bcs	af4 <free+0x84>
 a94:	e1510002 	cmp	r1, r2
 a98:	3a000001 	bcc	aa4 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9c:	e1530002 	cmp	r3, r2
 aa0:	3a000017 	bcc	b04 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aa4:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 aa8:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 aac:	e081418e 	add	r4, r1, lr, lsl #3
 ab0:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 ab4:	05922004 	ldreq	r2, [r2, #4]
 ab8:	0082e00e 	addeq	lr, r2, lr
 abc:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ac0:	05932000 	ldreq	r2, [r3]
 ac4:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 ac8:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 acc:	e5932004 	ldr	r2, [r3, #4]
 ad0:	e083e182 	add	lr, r3, r2, lsl #3
 ad4:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 ad8:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 adc:	05101004 	ldreq	r1, [r0, #-4]
 ae0:	00812002 	addeq	r2, r1, r2
 ae4:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 ae8:	05102008 	ldreq	r2, [r0, #-8]
 aec:	05832000 	streq	r2, [r3]
}
 af0:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af4:	e1530002 	cmp	r3, r2
 af8:	3a000001 	bcc	b04 <free+0x94>
 afc:	e1510002 	cmp	r1, r2
 b00:	3affffe7 	bcc	aa4 <free+0x34>
{
 b04:	e1a03002 	mov	r3, r2
 b08:	eaffffde 	b	a88 <free+0x18>

00000b0c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b0c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b10:	e3007c64 	movw	r7, #3172	; 0xc64
 b14:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b18:	e2804007 	add	r4, r0, #7
{
 b1c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b20:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b24:	e1a041a4 	lsr	r4, r4, #3
 b28:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b2c:	e3530000 	cmp	r3, #0
 b30:	0a000027 	beq	bd4 <malloc+0xc8>
 b34:	e5930000 	ldr	r0, [r3]
 b38:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b3c:	e1540002 	cmp	r4, r2
 b40:	9a000019 	bls	bac <malloc+0xa0>
 b44:	e3540a01 	cmp	r4, #4096	; 0x1000
 b48:	21a05004 	movcs	r5, r4
 b4c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b50:	e1a06185 	lsl	r6, r5, #3
 b54:	ea000003 	b	b68 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b58:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b5c:	e5902004 	ldr	r2, [r0, #4]
 b60:	e1520004 	cmp	r2, r4
 b64:	2a000010 	bcs	bac <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b68:	e5972000 	ldr	r2, [r7]
 b6c:	e1a03000 	mov	r3, r0
 b70:	e1520000 	cmp	r2, r0
 b74:	1afffff7 	bne	b58 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b78:	e1a00006 	mov	r0, r6
 b7c:	ebfffee9 	bl	728 <sbrk>
 b80:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b84:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b88:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b8c:	0a000004 	beq	ba4 <malloc+0x98>
  hp->s.size = nu;
 b90:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b94:	ebffffb5 	bl	a70 <free>
  return freep;
 b98:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b9c:	e3530000 	cmp	r3, #0
 ba0:	1affffec 	bne	b58 <malloc+0x4c>
        return 0;
 ba4:	e3a00000 	mov	r0, #0
  }
}
 ba8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 bac:	e1540002 	cmp	r4, r2
      freep = prevp;
 bb0:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bb4:	10422004 	subne	r2, r2, r4
 bb8:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 bbc:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 bc0:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 bc4:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 bc8:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 bcc:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 bd0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 bd4:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 bd8:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 bdc:	e5870000 	str	r0, [r7]
 be0:	e5870004 	str	r0, [r7, #4]
 be4:	eaffffd6 	b	b44 <malloc+0x38>
