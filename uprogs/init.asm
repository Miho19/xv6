
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
   4:	e3000c04 	movw	r0, #3076	; 0xc04
{
   8:	e28db014 	add	fp, sp, #20
  if(open("console", O_RDWR) < 0){
   c:	e3a01002 	mov	r1, #2
  10:	e3400000 	movt	r0, #0
  14:	eb000151 	bl	560 <open>
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
  24:	e3006c0c 	movw	r6, #3084	; 0xc0c
  dup(0);  // stdout
  28:	eb0001a7 	bl	6cc <dup>
  dup(0);  // stderr
  2c:	e3a00000 	mov	r0, #0
  30:	eb0001a5 	bl	6cc <dup>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  34:	e3005c50 	movw	r5, #3152	; 0xc50
    printf(1, "init: starting sh\n");
  38:	e3406000 	movt	r6, #0
      printf(1, "zombie!\n");
  3c:	e3405000 	movt	r5, #0
    printf(1, "init: starting sh\n");
  40:	e1a01006 	mov	r1, r6
  44:	e3a00001 	mov	r0, #1
  48:	eb000228 	bl	8f0 <printf>
    pid = fork();
  4c:	eb0000c1 	bl	358 <fork>
    if(pid < 0){
  50:	e2504000 	subs	r4, r0, #0
  54:	ba00000b 	blt	88 <main+0x88>
    if(pid == 0){
  58:	0a00000f 	beq	9c <main+0x9c>
    while((wpid=wait()) >= 0 && wpid != pid)
  5c:	eb0000d7 	bl	3c0 <wait>
  60:	e1540000 	cmp	r4, r0
  64:	e1e03000 	mvn	r3, r0
  68:	e1a03fa3 	lsr	r3, r3, #31
  6c:	03a03000 	moveq	r3, #0
  70:	e3530000 	cmp	r3, #0
  74:	0afffff1 	beq	40 <main+0x40>
      printf(1, "zombie!\n");
  78:	e1a01005 	mov	r1, r5
  7c:	e3a00001 	mov	r0, #1
  80:	eb00021a 	bl	8f0 <printf>
  84:	eafffff4 	b	5c <main+0x5c>
      printf(1, "init: fork failed\n");
  88:	e3001c20 	movw	r1, #3104	; 0xc20
  8c:	e3a00001 	mov	r0, #1
  90:	e3401000 	movt	r1, #0
  94:	eb000215 	bl	8f0 <printf>
      exit();
  98:	eb0000bb 	bl	38c <exit>
      exec("sh", argv);
  9c:	e3001c78 	movw	r1, #3192	; 0xc78
  a0:	e3000c34 	movw	r0, #3124	; 0xc34
  a4:	e3401000 	movt	r1, #0
  a8:	e3400000 	movt	r0, #0
  ac:	eb00011e 	bl	52c <exec>
      printf(1, "init: exec sh failed\n");
  b0:	e3001c38 	movw	r1, #3128	; 0xc38
  b4:	e3a00001 	mov	r0, #1
  b8:	e3401000 	movt	r1, #0
  bc:	eb00020b 	bl	8f0 <printf>
      exit();
  c0:	eb0000b1 	bl	38c <exit>
    mknod("console", 1, 1);
  c4:	e3a02001 	mov	r2, #1
  c8:	e3000c04 	movw	r0, #3076	; 0xc04
  cc:	e1a01002 	mov	r1, r2
  d0:	e3400000 	movt	r0, #0
  d4:	eb00012e 	bl	594 <mknod>
    open("console", O_RDWR);
  d8:	e3000c04 	movw	r0, #3076	; 0xc04
  dc:	e3a01002 	mov	r1, #2
  e0:	e3400000 	movt	r0, #0
  e4:	eb00011d 	bl	560 <open>
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
 168:	0a000008 	beq	190 <strlen+0x38>
 16c:	e2601001 	rsb	r1, r0, #1
 170:	e1a03000 	mov	r3, r0
    ;
 174:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 178:	e5f32001 	ldrb	r2, [r3, #1]!
 17c:	e3520000 	cmp	r2, #0
 180:	1afffffb 	bne	174 <strlen+0x1c>
  return n;
}
 184:	e28bd000 	add	sp, fp, #0
 188:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 18c:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 190:	e1a00003 	mov	r0, r3
}
 194:	e28bd000 	add	sp, fp, #0
 198:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 19c:	e12fff1e 	bx	lr

000001a0 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1a0:	e3520000 	cmp	r2, #0
{
 1a4:	e1a03000 	mov	r3, r0
 1a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ac:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1b0:	0a000004 	beq	1c8 <memset+0x28>
 1b4:	e6ef1071 	uxtb	r1, r1
 1b8:	e0800002 	add	r0, r0, r2
 1bc:	e4c31001 	strb	r1, [r3], #1
 1c0:	e1500003 	cmp	r0, r3
 1c4:	1afffffc 	bne	1bc <memset+0x1c>
  return (void *)p;
}
 1c8:	e28bd000 	add	sp, fp, #0
 1cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d0:	e12fff1e 	bx	lr

000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
 1d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1d8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1dc:	e5d02000 	ldrb	r2, [r0]
 1e0:	e3520000 	cmp	r2, #0
 1e4:	0a00000b 	beq	218 <strchr+0x44>
    if(*s == c)
 1e8:	e1520001 	cmp	r2, r1
 1ec:	1a000002 	bne	1fc <strchr+0x28>
 1f0:	ea000005 	b	20c <strchr+0x38>
 1f4:	e1530001 	cmp	r3, r1
 1f8:	0a000003 	beq	20c <strchr+0x38>
  for(; *s; s++)
 1fc:	e5f03001 	ldrb	r3, [r0, #1]!
 200:	e3530000 	cmp	r3, #0
 204:	1afffffa 	bne	1f4 <strchr+0x20>
      return (char*)s;
  return 0;
 208:	e1a00003 	mov	r0, r3
}
 20c:	e28bd000 	add	sp, fp, #0
 210:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 214:	e12fff1e 	bx	lr
  return 0;
 218:	e1a00002 	mov	r0, r2
 21c:	eafffffa 	b	20c <strchr+0x38>

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 224:	e1a03000 	mov	r3, r0
 228:	e28db014 	add	fp, sp, #20
 22c:	e1a07000 	mov	r7, r0
 230:	e24dd008 	sub	sp, sp, #8
 234:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 238:	e3a04000 	mov	r4, #0
 23c:	ea000008 	b	264 <gets+0x44>
    cc = read(0, &c, 1);
 240:	eb000085 	bl	45c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 244:	e1a03005 	mov	r3, r5
    if(cc < 1)
 248:	e3500000 	cmp	r0, #0
 24c:	da00000b 	ble	280 <gets+0x60>
    buf[i++] = c;
 250:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 254:	e352000d 	cmp	r2, #13
 258:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 25c:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 260:	0a00000b 	beq	294 <gets+0x74>
    cc = read(0, &c, 1);
 264:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 268:	e0844002 	add	r4, r4, r2
 26c:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 270:	e24b1015 	sub	r1, fp, #21
 274:	e3a00000 	mov	r0, #0
 278:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 27c:	baffffef 	blt	240 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 280:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 284:	e3a03000 	mov	r3, #0
 288:	e5c53000 	strb	r3, [r5]
}
 28c:	e24bd014 	sub	sp, fp, #20
 290:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 294:	e0875004 	add	r5, r7, r4
 298:	eafffff8 	b	280 <gets+0x60>

0000029c <stat>:

int
stat(char *n, struct stat *st)
{
 29c:	e92d4830 	push	{r4, r5, fp, lr}
 2a0:	e1a04001 	mov	r4, r1
 2a4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a8:	e3a01000 	mov	r1, #0
 2ac:	eb0000ab 	bl	560 <open>
  if(fd < 0)
 2b0:	e2505000 	subs	r5, r0, #0
 2b4:	ba000006 	blt	2d4 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2b8:	e1a01004 	mov	r1, r4
 2bc:	eb0000ce 	bl	5fc <fstat>
 2c0:	e1a04000 	mov	r4, r0
  close(fd);
 2c4:	e1a00005 	mov	r0, r5
 2c8:	eb00007d 	bl	4c4 <close>
  return r;
}
 2cc:	e1a00004 	mov	r0, r4
 2d0:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2d4:	e3e04000 	mvn	r4, #0
 2d8:	eafffffb 	b	2cc <stat+0x30>

000002dc <atoi>:

int
atoi(const char *s)
{
 2dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2e0:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e4:	e5d02000 	ldrb	r2, [r0]
 2e8:	e2423030 	sub	r3, r2, #48	; 0x30
 2ec:	e3530009 	cmp	r3, #9
  n = 0;
 2f0:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 2f4:	8a000006 	bhi	314 <atoi+0x38>
    n = n*10 + *s++ - '0';
 2f8:	e3a0c00a 	mov	ip, #10
 2fc:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 300:	e5f02001 	ldrb	r2, [r0, #1]!
 304:	e2421030 	sub	r1, r2, #48	; 0x30
 308:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 30c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 310:	9afffff9 	bls	2fc <atoi+0x20>
  return n;
}
 314:	e1a00003 	mov	r0, r3
 318:	e28bd000 	add	sp, fp, #0
 31c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 320:	e12fff1e 	bx	lr

00000324 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 324:	e3520000 	cmp	r2, #0
{
 328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 32c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 330:	da000005 	ble	34c <memmove+0x28>
 334:	e0812002 	add	r2, r1, r2
 338:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 33c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 340:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 344:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 348:	1afffffb 	bne	33c <memmove+0x18>
  return vdst;
}
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <fork>:
 358:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 35c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 360:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 364:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 368:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 36c:	e3a00001 	mov	r0, #1
 370:	ef000040 	svc	0x00000040
 374:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 378:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 37c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 380:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 384:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 388:	e12fff1e 	bx	lr

0000038c <exit>:
 38c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 390:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 394:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 398:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 39c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a0:	e3a00002 	mov	r0, #2
 3a4:	ef000040 	svc	0x00000040
 3a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3bc:	e12fff1e 	bx	lr

000003c0 <wait>:
 3c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d4:	e3a00003 	mov	r0, #3
 3d8:	ef000040 	svc	0x00000040
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f0:	e12fff1e 	bx	lr

000003f4 <lseek>:
 3f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 400:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 404:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 408:	e3a00016 	mov	r0, #22
 40c:	ef000040 	svc	0x00000040
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 41c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 420:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 424:	e12fff1e 	bx	lr

00000428 <pipe>:
 428:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 42c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 430:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 434:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 438:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 43c:	e3a00004 	mov	r0, #4
 440:	ef000040 	svc	0x00000040
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 450:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 454:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 458:	e12fff1e 	bx	lr

0000045c <read>:
 45c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 460:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 464:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 468:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 46c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 470:	e3a00005 	mov	r0, #5
 474:	ef000040 	svc	0x00000040
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 484:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 488:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 48c:	e12fff1e 	bx	lr

00000490 <write>:
 490:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 494:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 498:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 49c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a4:	e3a00010 	mov	r0, #16
 4a8:	ef000040 	svc	0x00000040
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c0:	e12fff1e 	bx	lr

000004c4 <close>:
 4c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d8:	e3a00015 	mov	r0, #21
 4dc:	ef000040 	svc	0x00000040
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f4:	e12fff1e 	bx	lr

000004f8 <kill>:
 4f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 500:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 504:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 508:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 50c:	e3a00006 	mov	r0, #6
 510:	ef000040 	svc	0x00000040
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 520:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 524:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 528:	e12fff1e 	bx	lr

0000052c <exec>:
 52c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 530:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 534:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 538:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 53c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 540:	e3a00007 	mov	r0, #7
 544:	ef000040 	svc	0x00000040
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 554:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 558:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 55c:	e12fff1e 	bx	lr

00000560 <open>:
 560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 564:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 568:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 56c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 570:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 574:	e3a0000f 	mov	r0, #15
 578:	ef000040 	svc	0x00000040
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 588:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 58c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 590:	e12fff1e 	bx	lr

00000594 <mknod>:
 594:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 598:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 59c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a8:	e3a00011 	mov	r0, #17
 5ac:	ef000040 	svc	0x00000040
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c4:	e12fff1e 	bx	lr

000005c8 <unlink>:
 5c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5dc:	e3a00012 	mov	r0, #18
 5e0:	ef000040 	svc	0x00000040
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f8:	e12fff1e 	bx	lr

000005fc <fstat>:
 5fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 600:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 604:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 608:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 60c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 610:	e3a00008 	mov	r0, #8
 614:	ef000040 	svc	0x00000040
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 624:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 628:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 62c:	e12fff1e 	bx	lr

00000630 <link>:
 630:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 634:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 638:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 63c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 640:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 644:	e3a00013 	mov	r0, #19
 648:	ef000040 	svc	0x00000040
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 658:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 65c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 660:	e12fff1e 	bx	lr

00000664 <mkdir>:
 664:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 668:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 66c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 670:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 674:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 678:	e3a00014 	mov	r0, #20
 67c:	ef000040 	svc	0x00000040
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 68c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 694:	e12fff1e 	bx	lr

00000698 <chdir>:
 698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 69c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ac:	e3a00009 	mov	r0, #9
 6b0:	ef000040 	svc	0x00000040
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c8:	e12fff1e 	bx	lr

000006cc <dup>:
 6cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e0:	e3a0000a 	mov	r0, #10
 6e4:	ef000040 	svc	0x00000040
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6fc:	e12fff1e 	bx	lr

00000700 <getpid>:
 700:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 704:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 708:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 70c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 710:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 714:	e3a0000b 	mov	r0, #11
 718:	ef000040 	svc	0x00000040
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 728:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 72c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 730:	e12fff1e 	bx	lr

00000734 <sbrk>:
 734:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 738:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 73c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 740:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 744:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 748:	e3a0000c 	mov	r0, #12
 74c:	ef000040 	svc	0x00000040
 750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 75c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 760:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 764:	e12fff1e 	bx	lr

00000768 <sleep>:
 768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 76c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 770:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 774:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 778:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 77c:	e3a0000d 	mov	r0, #13
 780:	ef000040 	svc	0x00000040
 784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 790:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 794:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 798:	e12fff1e 	bx	lr

0000079c <uptime>:
 79c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b0:	e3a0000e 	mov	r0, #14
 7b4:	ef000040 	svc	0x00000040
 7b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7cc:	e12fff1e 	bx	lr

000007d0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7d4:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7d8:	e0133fa1 	ands	r3, r3, r1, lsr #31
 7dc:	e24b4034 	sub	r4, fp, #52	; 0x34
 7e0:	e3009c5c 	movw	r9, #3164	; 0xc5c
    neg = 1;
    x = -xx;
 7e4:	1261e000 	rsbne	lr, r1, #0
 7e8:	e3409000 	movt	r9, #0
{
 7ec:	e1a05000 	mov	r5, r0
    neg = 1;
 7f0:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 7f4:	01a0e001 	moveq	lr, r1
  neg = 0;
 7f8:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 7fc:	e3a07000 	mov	r7, #0
  b = base;
 800:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 804:	e3a06001 	mov	r6, #1
{
 808:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 80c:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 810:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 814:	e3a0c000 	mov	ip, #0
 818:	ea000002 	b	828 <printint+0x58>
        if(r >= d) {
 81c:	e1520000 	cmp	r2, r0
            r = r - d;
 820:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 824:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 828:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 82c:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 830:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 834:	e2011001 	and	r1, r1, #1
 838:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 83c:	1afffff6 	bne	81c <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 840:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 844:	e35c0000 	cmp	ip, #0
 848:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 84c:	e2871001 	add	r1, r7, #1
 850:	e7d93003 	ldrb	r3, [r9, r3]
 854:	e4c83001 	strb	r3, [r8], #1
 858:	11a07001 	movne	r7, r1
 85c:	1affffea 	bne	80c <printint+0x3c>
  if(neg)
 860:	e35a0000 	cmp	sl, #0
 864:	0a000005 	beq	880 <printint+0xb0>
    buf[i++] = '-';
 868:	e24b3024 	sub	r3, fp, #36	; 0x24
 86c:	e3a0202d 	mov	r2, #45	; 0x2d
 870:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 874:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 878:	e1a03002 	mov	r3, r2
 87c:	e5402010 	strb	r2, [r0, #-16]
 880:	e0847007 	add	r7, r4, r7
 884:	ea000000 	b	88c <printint+0xbc>
 888:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 88c:	e3a02001 	mov	r2, #1
 890:	e24b1035 	sub	r1, fp, #53	; 0x35
 894:	e1a00005 	mov	r0, r5
 898:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 89c:	ebfffefb 	bl	490 <write>

  while(--i >= 0)
 8a0:	e1570004 	cmp	r7, r4
 8a4:	1afffff7 	bne	888 <printint+0xb8>
    putc(fd, buf[i]);
}
 8a8:	e24bd020 	sub	sp, fp, #32
 8ac:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000008b0 <div>:
{
 8b0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8b4:	e3a02000 	mov	r2, #0
{
 8b8:	e28db008 	add	fp, sp, #8
 8bc:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8c0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8c4:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8c8:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 8cc:	e1a0c33e 	lsr	ip, lr, r3
 8d0:	e20cc001 	and	ip, ip, #1
 8d4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8d8:	e1520001 	cmp	r2, r1
            r = r - d;
 8dc:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 8e0:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 8e4:	e2533001 	subs	r3, r3, #1
 8e8:	38bd8810 	popcc	{r4, fp, pc}
 8ec:	eafffff6 	b	8cc <div+0x1c>

000008f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8f0:	e92d000e 	push	{r1, r2, r3}
 8f4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8f8:	e28db018 	add	fp, sp, #24
 8fc:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 900:	e59b6004 	ldr	r6, [fp, #4]
 904:	e5d64000 	ldrb	r4, [r6]
 908:	e3540000 	cmp	r4, #0
 90c:	0a00002b 	beq	9c0 <printf+0xd0>
 910:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 914:	e28b8008 	add	r8, fp, #8
  state = 0;
 918:	e3a05000 	mov	r5, #0
 91c:	ea00000a 	b	94c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 920:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 924:	01a05004 	moveq	r5, r4
      if(c == '%'){
 928:	0a000004 	beq	940 <printf+0x50>
  write(fd, &c, 1);
 92c:	e3a02001 	mov	r2, #1
 930:	e24b1019 	sub	r1, fp, #25
 934:	e1a00007 	mov	r0, r7
 938:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 93c:	ebfffed3 	bl	490 <write>
  for(i = 0; fmt[i]; i++){
 940:	e5f64001 	ldrb	r4, [r6, #1]!
 944:	e3540000 	cmp	r4, #0
 948:	0a00001c 	beq	9c0 <printf+0xd0>
    if(state == 0){
 94c:	e3550000 	cmp	r5, #0
 950:	0afffff2 	beq	920 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 954:	e3550025 	cmp	r5, #37	; 0x25
 958:	1afffff8 	bne	940 <printf+0x50>
      if(c == 'd'){
 95c:	e3540064 	cmp	r4, #100	; 0x64
 960:	0a000021 	beq	9ec <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 964:	e20430f7 	and	r3, r4, #247	; 0xf7
 968:	e3530070 	cmp	r3, #112	; 0x70
 96c:	0a000017 	beq	9d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 970:	e3540073 	cmp	r4, #115	; 0x73
 974:	0a00002e 	beq	a34 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 978:	e3540063 	cmp	r4, #99	; 0x63
 97c:	0a000021 	beq	a08 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 980:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 984:	e3a02001 	mov	r2, #1
 988:	e24b1019 	sub	r1, fp, #25
 98c:	e1a00007 	mov	r0, r7
 990:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 994:	0a000023 	beq	a28 <printf+0x138>
  write(fd, &c, 1);
 998:	ebfffebc 	bl	490 <write>
 99c:	e3a02001 	mov	r2, #1
 9a0:	e24b1019 	sub	r1, fp, #25
 9a4:	e1a00007 	mov	r0, r7
 9a8:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 9ac:	ebfffeb7 	bl	490 <write>
  for(i = 0; fmt[i]; i++){
 9b0:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9b4:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 9b8:	e3540000 	cmp	r4, #0
 9bc:	1affffe2 	bne	94c <printf+0x5c>
    }
  }
}
 9c0:	e24bd018 	sub	sp, fp, #24
 9c4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9c8:	e28dd00c 	add	sp, sp, #12
 9cc:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 9d0:	e3a03000 	mov	r3, #0
 9d4:	e3a02010 	mov	r2, #16
 9d8:	e4981004 	ldr	r1, [r8], #4
 9dc:	e1a00007 	mov	r0, r7
 9e0:	ebffff7a 	bl	7d0 <printint>
      state = 0;
 9e4:	e3a05000 	mov	r5, #0
 9e8:	eaffffd4 	b	940 <printf+0x50>
        printint(fd, *ap, 10, 1);
 9ec:	e3a03001 	mov	r3, #1
 9f0:	e3a0200a 	mov	r2, #10
 9f4:	e4981004 	ldr	r1, [r8], #4
 9f8:	e1a00007 	mov	r0, r7
 9fc:	ebffff73 	bl	7d0 <printint>
      state = 0;
 a00:	e3a05000 	mov	r5, #0
 a04:	eaffffcd 	b	940 <printf+0x50>
        putc(fd, *ap);
 a08:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 a0c:	e3a02001 	mov	r2, #1
 a10:	e24b1019 	sub	r1, fp, #25
 a14:	e1a00007 	mov	r0, r7
      state = 0;
 a18:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 a1c:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 a20:	ebfffe9a 	bl	490 <write>
        ap++;
 a24:	eaffffc5 	b	940 <printf+0x50>
  write(fd, &c, 1);
 a28:	ebfffe98 	bl	490 <write>
      state = 0;
 a2c:	e3a05000 	mov	r5, #0
 a30:	eaffffc2 	b	940 <printf+0x50>
        s = (char*)*ap;
 a34:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a38:	e3540000 	cmp	r4, #0
 a3c:	0a00000b 	beq	a70 <printf+0x180>
        while(*s != 0){
 a40:	e5d45000 	ldrb	r5, [r4]
 a44:	e3550000 	cmp	r5, #0
 a48:	0affffbc 	beq	940 <printf+0x50>
  write(fd, &c, 1);
 a4c:	e3a02001 	mov	r2, #1
 a50:	e24b1019 	sub	r1, fp, #25
 a54:	e1a00007 	mov	r0, r7
 a58:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a5c:	ebfffe8b 	bl	490 <write>
        while(*s != 0){
 a60:	e5f45001 	ldrb	r5, [r4, #1]!
 a64:	e3550000 	cmp	r5, #0
 a68:	1afffff7 	bne	a4c <printf+0x15c>
 a6c:	eaffffb3 	b	940 <printf+0x50>
          s = "(null)";
 a70:	e3004c70 	movw	r4, #3184	; 0xc70
        while(*s != 0){
 a74:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 a78:	e3404000 	movt	r4, #0
 a7c:	eafffff2 	b	a4c <printf+0x15c>

00000a80 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a80:	e300cc80 	movw	ip, #3200	; 0xc80
 a84:	e340c000 	movt	ip, #0
{
 a88:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a8c:	e2401008 	sub	r1, r0, #8
{
 a90:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a94:	e59c3000 	ldr	r3, [ip]
 a98:	ea000004 	b	ab0 <free+0x30>
 a9c:	e1510002 	cmp	r1, r2
 aa0:	3a000009 	bcc	acc <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa4:	e1530002 	cmp	r3, r2
 aa8:	2a000007 	bcs	acc <free+0x4c>
{
 aac:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab0:	e1530001 	cmp	r3, r1
 ab4:	e5932000 	ldr	r2, [r3]
 ab8:	3afffff7 	bcc	a9c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 abc:	e1530002 	cmp	r3, r2
 ac0:	3afffff9 	bcc	aac <free+0x2c>
 ac4:	e1510002 	cmp	r1, r2
 ac8:	2afffff7 	bcs	aac <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 acc:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ad0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 ad4:	e081418e 	add	r4, r1, lr, lsl #3
 ad8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 adc:	05922004 	ldreq	r2, [r2, #4]
 ae0:	0082e00e 	addeq	lr, r2, lr
 ae4:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ae8:	05932000 	ldreq	r2, [r3]
 aec:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 af0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 af4:	e5932004 	ldr	r2, [r3, #4]
 af8:	e083e182 	add	lr, r3, r2, lsl #3
 afc:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b00:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b04:	05101004 	ldreq	r1, [r0, #-4]
 b08:	00812002 	addeq	r2, r1, r2
 b0c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b10:	05102008 	ldreq	r2, [r0, #-8]
 b14:	05832000 	streq	r2, [r3]
}
 b18:	e8bd8810 	pop	{r4, fp, pc}

00000b1c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b1c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b20:	e3007c80 	movw	r7, #3200	; 0xc80
 b24:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b28:	e2804007 	add	r4, r0, #7
{
 b2c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b30:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b34:	e1a041a4 	lsr	r4, r4, #3
 b38:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b3c:	e3510000 	cmp	r1, #0
 b40:	0a000029 	beq	bec <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b44:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 b48:	e5932004 	ldr	r2, [r3, #4]
 b4c:	e1520004 	cmp	r2, r4
 b50:	2a000019 	bcs	bbc <malloc+0xa0>
 b54:	e3540a01 	cmp	r4, #4096	; 0x1000
 b58:	21a05004 	movcs	r5, r4
 b5c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b60:	e1a06185 	lsl	r6, r5, #3
 b64:	ea000005 	b	b80 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b68:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b6c:	e5902004 	ldr	r2, [r0, #4]
 b70:	e1520004 	cmp	r2, r4
 b74:	2a000012 	bcs	bc4 <malloc+0xa8>
 b78:	e5971000 	ldr	r1, [r7]
 b7c:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b80:	e1510003 	cmp	r1, r3
 b84:	1afffff7 	bne	b68 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b88:	e1a00006 	mov	r0, r6
 b8c:	ebfffee8 	bl	734 <sbrk>
 b90:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b94:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b98:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b9c:	0a000004 	beq	bb4 <malloc+0x98>
  hp->s.size = nu;
 ba0:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 ba4:	ebffffb5 	bl	a80 <free>
  return freep;
 ba8:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 bac:	e3530000 	cmp	r3, #0
 bb0:	1affffec 	bne	b68 <malloc+0x4c>
        return 0;
 bb4:	e3a00000 	mov	r0, #0
  }
}
 bb8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 bbc:	e1a00003 	mov	r0, r3
 bc0:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 bc4:	e1540002 	cmp	r4, r2
      freep = prevp;
 bc8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bcc:	10422004 	subne	r2, r2, r4
 bd0:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 bd4:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 bd8:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 bdc:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 be0:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 be4:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 bec:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 bf0:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 bf4:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 bf8:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 bfc:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 c00:	eaffffd3 	b	b54 <malloc+0x38>
