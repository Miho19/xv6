
_mkdir:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  14:	c3a05001 	movgt	r5, #1
  if(argc < 2){
  18:	da00000f 	ble	5c <main+0x5c>
    if(mkdir(argv[i]) < 0){
  1c:	e1a06004 	mov	r6, r4
  20:	e2844004 	add	r4, r4, #4
  24:	e5960000 	ldr	r0, [r6]
  28:	eb00016b 	bl	5dc <mkdir>
  2c:	e3500000 	cmp	r0, #0
  30:	ba000003 	blt	44 <main+0x44>
  for(i = 1; i < argc; i++){
  34:	e2855001 	add	r5, r5, #1
  38:	e1570005 	cmp	r7, r5
  3c:	1afffff6 	bne	1c <main+0x1c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  40:	eb0000af 	bl	304 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  44:	e5962000 	ldr	r2, [r6]
  48:	e3001b84 	movw	r1, #2948	; 0xb84
  4c:	e3a00002 	mov	r0, #2
  50:	e3401000 	movt	r1, #0
  54:	eb0001fe 	bl	854 <printf>
      break;
  58:	eafffff8 	b	40 <main+0x40>
    printf(2, "Usage: mkdir files...\n");
  5c:	e3001b6c 	movw	r1, #2924	; 0xb6c
  60:	e3a00002 	mov	r0, #2
  64:	e3401000 	movt	r1, #0
  68:	eb0001f9 	bl	854 <printf>
    exit();
  6c:	eb0000a4 	bl	304 <exit>

00000070 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  74:	e2402001 	sub	r2, r0, #1
  78:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	e4d13001 	ldrb	r3, [r1], #1
  80:	e3530000 	cmp	r3, #0
  84:	e5e23001 	strb	r3, [r2, #1]!
  88:	1afffffb 	bne	7c <strcpy+0xc>
    ;
  return os;
}
  8c:	e28bd000 	add	sp, fp, #0
  90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  94:	e12fff1e 	bx	lr

00000098 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  9c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  a0:	e5d03000 	ldrb	r3, [r0]
  a4:	e5d12000 	ldrb	r2, [r1]
  a8:	e3530000 	cmp	r3, #0
  ac:	1a000004 	bne	c4 <strcmp+0x2c>
  b0:	ea000005 	b	cc <strcmp+0x34>
  b4:	e5f03001 	ldrb	r3, [r0, #1]!
  b8:	e5f12001 	ldrb	r2, [r1, #1]!
  bc:	e3530000 	cmp	r3, #0
  c0:	0a000001 	beq	cc <strcmp+0x34>
  c4:	e1530002 	cmp	r3, r2
  c8:	0afffff9 	beq	b4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  cc:	e0430002 	sub	r0, r3, r2
  d0:	e28bd000 	add	sp, fp, #0
  d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d8:	e12fff1e 	bx	lr

000000dc <strlen>:

uint
strlen(char *s)
{
  dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  e4:	e5d03000 	ldrb	r3, [r0]
  e8:	e3530000 	cmp	r3, #0
  ec:	01a00003 	moveq	r0, r3
  f0:	0a000006 	beq	110 <strlen+0x34>
  f4:	e1a02000 	mov	r2, r0
  f8:	e3a03000 	mov	r3, #0
  fc:	e5f21001 	ldrb	r1, [r2, #1]!
 100:	e2833001 	add	r3, r3, #1
 104:	e3510000 	cmp	r1, #0
 108:	e1a00003 	mov	r0, r3
 10c:	1afffffa 	bne	fc <strlen+0x20>
    ;
  return n;
}
 110:	e28bd000 	add	sp, fp, #0
 114:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 118:	e12fff1e 	bx	lr

0000011c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 11c:	e3520000 	cmp	r2, #0
{
 120:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 124:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 128:	0a000004 	beq	140 <memset+0x24>
 12c:	e6ef1071 	uxtb	r1, r1
 130:	e0802002 	add	r2, r0, r2
 134:	e4c01001 	strb	r1, [r0], #1
 138:	e1520000 	cmp	r2, r0
 13c:	1afffffc 	bne	134 <memset+0x18>
  return (void *)p;
}
 140:	e28bd000 	add	sp, fp, #0
 144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 148:	e12fff1e 	bx	lr

0000014c <strchr>:

char*
strchr(const char *s, char c)
{
 14c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 150:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 154:	e5d02000 	ldrb	r2, [r0]
 158:	e3520000 	cmp	r2, #0
 15c:	0a00000b 	beq	190 <strchr+0x44>
    if(*s == c)
 160:	e1510002 	cmp	r1, r2
 164:	1a000002 	bne	174 <strchr+0x28>
 168:	ea000005 	b	184 <strchr+0x38>
 16c:	e1530001 	cmp	r3, r1
 170:	0a000003 	beq	184 <strchr+0x38>
  for(; *s; s++)
 174:	e5f03001 	ldrb	r3, [r0, #1]!
 178:	e3530000 	cmp	r3, #0
 17c:	1afffffa 	bne	16c <strchr+0x20>
      return (char*)s;
  return 0;
 180:	e1a00003 	mov	r0, r3
}
 184:	e28bd000 	add	sp, fp, #0
 188:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 18c:	e12fff1e 	bx	lr
  return 0;
 190:	e1a00002 	mov	r0, r2
 194:	eafffffa 	b	184 <strchr+0x38>

00000198 <gets>:

char*
gets(char *buf, int max)
{
 198:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 19c:	e1a03000 	mov	r3, r0
 1a0:	e28db014 	add	fp, sp, #20
 1a4:	e1a07000 	mov	r7, r0
 1a8:	e24dd008 	sub	sp, sp, #8
 1ac:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b0:	e3a04000 	mov	r4, #0
 1b4:	ea000008 	b	1dc <gets+0x44>
    cc = read(0, &c, 1);
 1b8:	eb000085 	bl	3d4 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1bc:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1c0:	e3500000 	cmp	r0, #0
 1c4:	da00000b 	ble	1f8 <gets+0x60>
    buf[i++] = c;
 1c8:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1cc:	e352000d 	cmp	r2, #13
 1d0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1d4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1d8:	0a00000b 	beq	20c <gets+0x74>
    cc = read(0, &c, 1);
 1dc:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1e0:	e0844002 	add	r4, r4, r2
 1e4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1e8:	e24b1015 	sub	r1, fp, #21
 1ec:	e3a00000 	mov	r0, #0
 1f0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1f4:	baffffef 	blt	1b8 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1f8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1fc:	e3a03000 	mov	r3, #0
 200:	e5c53000 	strb	r3, [r5]
}
 204:	e24bd014 	sub	sp, fp, #20
 208:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 20c:	e0875004 	add	r5, r7, r4
 210:	eafffff8 	b	1f8 <gets+0x60>

00000214 <stat>:

int
stat(char *n, struct stat *st)
{
 214:	e92d4830 	push	{r4, r5, fp, lr}
 218:	e1a04001 	mov	r4, r1
 21c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 220:	e3a01000 	mov	r1, #0
 224:	eb0000ab 	bl	4d8 <open>
  if(fd < 0)
 228:	e2505000 	subs	r5, r0, #0
 22c:	ba000006 	blt	24c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 230:	e1a01004 	mov	r1, r4
 234:	eb0000ce 	bl	574 <fstat>
 238:	e1a04000 	mov	r4, r0
  close(fd);
 23c:	e1a00005 	mov	r0, r5
 240:	eb00007d 	bl	43c <close>
  return r;
}
 244:	e1a00004 	mov	r0, r4
 248:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 24c:	e3e04000 	mvn	r4, #0
 250:	eafffffb 	b	244 <stat+0x30>

00000254 <atoi>:

int
atoi(const char *s)
{
 254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 258:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25c:	e5d02000 	ldrb	r2, [r0]
 260:	e2423030 	sub	r3, r2, #48	; 0x30
 264:	e3530009 	cmp	r3, #9
  n = 0;
 268:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 26c:	8a000006 	bhi	28c <atoi+0x38>
    n = n*10 + *s++ - '0';
 270:	e3a0c00a 	mov	ip, #10
 274:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 278:	e5f02001 	ldrb	r2, [r0, #1]!
 27c:	e2421030 	sub	r1, r2, #48	; 0x30
 280:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 284:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 288:	9afffff9 	bls	274 <atoi+0x20>
  return n;
}
 28c:	e1a00003 	mov	r0, r3
 290:	e28bd000 	add	sp, fp, #0
 294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 298:	e12fff1e 	bx	lr

0000029c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29c:	e3520000 	cmp	r2, #0
{
 2a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2a4:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 2a8:	da000005 	ble	2c4 <memmove+0x28>
 2ac:	e0812002 	add	r2, r1, r2
 2b0:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2b4:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2b8:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2bc:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2c0:	1afffffb 	bne	2b4 <memmove+0x18>
  return vdst;
}
 2c4:	e28bd000 	add	sp, fp, #0
 2c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2cc:	e12fff1e 	bx	lr

000002d0 <fork>:
 2d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2e4:	e3a00001 	mov	r0, #1
 2e8:	ef000040 	svc	0x00000040
 2ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 300:	e12fff1e 	bx	lr

00000304 <exit>:
 304:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 308:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 30c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 310:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 314:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 318:	e3a00002 	mov	r0, #2
 31c:	ef000040 	svc	0x00000040
 320:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 324:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 328:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 32c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 330:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 334:	e12fff1e 	bx	lr

00000338 <wait>:
 338:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 33c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 340:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 344:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 348:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 34c:	e3a00003 	mov	r0, #3
 350:	ef000040 	svc	0x00000040
 354:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 358:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 35c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 360:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 364:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 368:	e12fff1e 	bx	lr

0000036c <lseek>:
 36c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 370:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 374:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 378:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 37c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 380:	e3a00016 	mov	r0, #22
 384:	ef000040 	svc	0x00000040
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 394:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 398:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <pipe>:
 3a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b4:	e3a00004 	mov	r0, #4
 3b8:	ef000040 	svc	0x00000040
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <read>:
 3d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e8:	e3a00005 	mov	r0, #5
 3ec:	ef000040 	svc	0x00000040
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 404:	e12fff1e 	bx	lr

00000408 <write>:
 408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 40c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 410:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 414:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 418:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 41c:	e3a00010 	mov	r0, #16
 420:	ef000040 	svc	0x00000040
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 430:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 438:	e12fff1e 	bx	lr

0000043c <close>:
 43c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 440:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 444:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 448:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 44c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 450:	e3a00015 	mov	r0, #21
 454:	ef000040 	svc	0x00000040
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 464:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 468:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 46c:	e12fff1e 	bx	lr

00000470 <kill>:
 470:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 474:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 478:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 47c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 480:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 484:	e3a00006 	mov	r0, #6
 488:	ef000040 	svc	0x00000040
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 498:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a0:	e12fff1e 	bx	lr

000004a4 <exec>:
 4a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b8:	e3a00007 	mov	r0, #7
 4bc:	ef000040 	svc	0x00000040
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d4:	e12fff1e 	bx	lr

000004d8 <open>:
 4d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ec:	e3a0000f 	mov	r0, #15
 4f0:	ef000040 	svc	0x00000040
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 500:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 508:	e12fff1e 	bx	lr

0000050c <mknod>:
 50c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 51c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 520:	e3a00011 	mov	r0, #17
 524:	ef000040 	svc	0x00000040
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 53c:	e12fff1e 	bx	lr

00000540 <unlink>:
 540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 54c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 554:	e3a00012 	mov	r0, #18
 558:	ef000040 	svc	0x00000040
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 570:	e12fff1e 	bx	lr

00000574 <fstat>:
 574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 57c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 588:	e3a00008 	mov	r0, #8
 58c:	ef000040 	svc	0x00000040
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 59c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a4:	e12fff1e 	bx	lr

000005a8 <link>:
 5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5bc:	e3a00013 	mov	r0, #19
 5c0:	ef000040 	svc	0x00000040
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d8:	e12fff1e 	bx	lr

000005dc <mkdir>:
 5dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f0:	e3a00014 	mov	r0, #20
 5f4:	ef000040 	svc	0x00000040
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 60c:	e12fff1e 	bx	lr

00000610 <chdir>:
 610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 61c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 624:	e3a00009 	mov	r0, #9
 628:	ef000040 	svc	0x00000040
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 63c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 640:	e12fff1e 	bx	lr

00000644 <dup>:
 644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 64c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 658:	e3a0000a 	mov	r0, #10
 65c:	ef000040 	svc	0x00000040
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 66c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 674:	e12fff1e 	bx	lr

00000678 <getpid>:
 678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 67c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 68c:	e3a0000b 	mov	r0, #11
 690:	ef000040 	svc	0x00000040
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a8:	e12fff1e 	bx	lr

000006ac <sbrk>:
 6ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c0:	e3a0000c 	mov	r0, #12
 6c4:	ef000040 	svc	0x00000040
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6dc:	e12fff1e 	bx	lr

000006e0 <sleep>:
 6e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f4:	e3a0000d 	mov	r0, #13
 6f8:	ef000040 	svc	0x00000040
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 70c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 710:	e12fff1e 	bx	lr

00000714 <uptime>:
 714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 71c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 728:	e3a0000e 	mov	r0, #14
 72c:	ef000040 	svc	0x00000040
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 73c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 744:	e12fff1e 	bx	lr

00000748 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 748:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 74c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 750:	e013afa1 	ands	sl, r3, r1, lsr #31
 754:	e24b4034 	sub	r4, fp, #52	; 0x34
 758:	e3009ba0 	movw	r9, #2976	; 0xba0
    neg = 1;
    x = -xx;
 75c:	1261e000 	rsbne	lr, r1, #0
 760:	e3409000 	movt	r9, #0
{
 764:	e1a05000 	mov	r5, r0
    neg = 1;
 768:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 76c:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 770:	e3a08000 	mov	r8, #0
  b = base;
 774:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 778:	e3a06001 	mov	r6, #1
{
 77c:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 780:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 784:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 788:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 78c:	e1a0033e 	lsr	r0, lr, r3
 790:	e2000001 	and	r0, r0, #1
 794:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 798:	e1520001 	cmp	r2, r1
            r = r - d;
 79c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7a0:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7a4:	e2533001 	subs	r3, r3, #1
 7a8:	2afffff7 	bcs	78c <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7b0:	e35c0000 	cmp	ip, #0
 7b4:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7b8:	e2883001 	add	r3, r8, #1
 7bc:	e7d91001 	ldrb	r1, [r9, r1]
 7c0:	e4c71001 	strb	r1, [r7], #1
 7c4:	11a08003 	movne	r8, r3
 7c8:	1affffec 	bne	780 <printint+0x38>
  if(neg)
 7cc:	e35a0000 	cmp	sl, #0
 7d0:	0a000004 	beq	7e8 <printint+0xa0>
    buf[i++] = '-';
 7d4:	e24b2024 	sub	r2, fp, #36	; 0x24
 7d8:	e3a0102d 	mov	r1, #45	; 0x2d
 7dc:	e0822003 	add	r2, r2, r3
 7e0:	e2883002 	add	r3, r8, #2
 7e4:	e5421010 	strb	r1, [r2, #-16]
 7e8:	e0846003 	add	r6, r4, r3
 7ec:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 7f0:	e3a02001 	mov	r2, #1
 7f4:	e24b1035 	sub	r1, fp, #53	; 0x35
 7f8:	e1a00005 	mov	r0, r5
 7fc:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 800:	ebffff00 	bl	408 <write>

  while(--i >= 0)
 804:	e1540006 	cmp	r4, r6
 808:	1afffff7 	bne	7ec <printint+0xa4>
    putc(fd, buf[i]);
}
 80c:	e24bd020 	sub	sp, fp, #32
 810:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000814 <div>:
{
 814:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 818:	e3a02000 	mov	r2, #0
{
 81c:	e28db008 	add	fp, sp, #8
 820:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 824:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 828:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 82c:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 830:	e1a0c33e 	lsr	ip, lr, r3
 834:	e20cc001 	and	ip, ip, #1
 838:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 83c:	e1520001 	cmp	r2, r1
            r = r - d;
 840:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 844:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 848:	e2533001 	subs	r3, r3, #1
 84c:	38bd8810 	popcc	{r4, fp, pc}
 850:	eafffff6 	b	830 <div+0x1c>

00000854 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 854:	e92d000e 	push	{r1, r2, r3}
 858:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 85c:	e28db018 	add	fp, sp, #24
 860:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 864:	e59b5004 	ldr	r5, [fp, #4]
 868:	e5d54000 	ldrb	r4, [r5]
 86c:	e3540000 	cmp	r4, #0
 870:	0a00002b 	beq	924 <printf+0xd0>
 874:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 878:	e28b8008 	add	r8, fp, #8
  state = 0;
 87c:	e3a06000 	mov	r6, #0
 880:	ea00000a 	b	8b0 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 884:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 888:	01a06004 	moveq	r6, r4
      if(c == '%'){
 88c:	0a000004 	beq	8a4 <printf+0x50>
 890:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 894:	e3a02001 	mov	r2, #1
 898:	e1a00007 	mov	r0, r7
 89c:	e5614006 	strb	r4, [r1, #-6]!
 8a0:	ebfffed8 	bl	408 <write>
  for(i = 0; fmt[i]; i++){
 8a4:	e5f54001 	ldrb	r4, [r5, #1]!
 8a8:	e3540000 	cmp	r4, #0
 8ac:	0a00001c 	beq	924 <printf+0xd0>
    if(state == 0){
 8b0:	e3560000 	cmp	r6, #0
 8b4:	0afffff2 	beq	884 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8b8:	e3560025 	cmp	r6, #37	; 0x25
 8bc:	1afffff8 	bne	8a4 <printf+0x50>
      if(c == 'd'){
 8c0:	e3540064 	cmp	r4, #100	; 0x64
 8c4:	0a000030 	beq	98c <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c8:	e20430f7 	and	r3, r4, #247	; 0xf7
 8cc:	e3530070 	cmp	r3, #112	; 0x70
 8d0:	0a000017 	beq	934 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d4:	e3540073 	cmp	r4, #115	; 0x73
 8d8:	0a00001c 	beq	950 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8dc:	e3540063 	cmp	r4, #99	; 0x63
 8e0:	0a000037 	beq	9c4 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e4:	e3540025 	cmp	r4, #37	; 0x25
 8e8:	0a00002e 	beq	9a8 <printf+0x154>
  write(fd, &c, 1);
 8ec:	e3a02001 	mov	r2, #1
 8f0:	e24b1019 	sub	r1, fp, #25
 8f4:	e1a00007 	mov	r0, r7
 8f8:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 8fc:	ebfffec1 	bl	408 <write>
 900:	e3a02001 	mov	r2, #1
 904:	e24b101a 	sub	r1, fp, #26
 908:	e1a00007 	mov	r0, r7
 90c:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 910:	ebfffebc 	bl	408 <write>
  for(i = 0; fmt[i]; i++){
 914:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 918:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 91c:	e3540000 	cmp	r4, #0
 920:	1affffe2 	bne	8b0 <printf+0x5c>
    }
  }
}
 924:	e24bd018 	sub	sp, fp, #24
 928:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 92c:	e28dd00c 	add	sp, sp, #12
 930:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 934:	e3a03000 	mov	r3, #0
 938:	e3a02010 	mov	r2, #16
 93c:	e4981004 	ldr	r1, [r8], #4
 940:	e1a00007 	mov	r0, r7
 944:	ebffff7f 	bl	748 <printint>
      state = 0;
 948:	e3a06000 	mov	r6, #0
 94c:	eaffffd4 	b	8a4 <printf+0x50>
        s = (char*)*ap;
 950:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 954:	e3540000 	cmp	r4, #0
 958:	0a000021 	beq	9e4 <printf+0x190>
        while(*s != 0){
 95c:	e5d46000 	ldrb	r6, [r4]
 960:	e3560000 	cmp	r6, #0
 964:	0affffce 	beq	8a4 <printf+0x50>
  write(fd, &c, 1);
 968:	e3a02001 	mov	r2, #1
 96c:	e24b101d 	sub	r1, fp, #29
 970:	e1a00007 	mov	r0, r7
 974:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 978:	ebfffea2 	bl	408 <write>
        while(*s != 0){
 97c:	e5f46001 	ldrb	r6, [r4, #1]!
 980:	e3560000 	cmp	r6, #0
 984:	1afffff7 	bne	968 <printf+0x114>
 988:	eaffffc5 	b	8a4 <printf+0x50>
        printint(fd, *ap, 10, 1);
 98c:	e3a03001 	mov	r3, #1
 990:	e3a0200a 	mov	r2, #10
 994:	e4981004 	ldr	r1, [r8], #4
 998:	e1a00007 	mov	r0, r7
 99c:	ebffff69 	bl	748 <printint>
      state = 0;
 9a0:	e3a06000 	mov	r6, #0
 9a4:	eaffffbe 	b	8a4 <printf+0x50>
 9a8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9ac:	e3a02001 	mov	r2, #1
 9b0:	e1a00007 	mov	r0, r7
 9b4:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9b8:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9bc:	ebfffe91 	bl	408 <write>
 9c0:	eaffffb7 	b	8a4 <printf+0x50>
        putc(fd, *ap);
 9c4:	e4983004 	ldr	r3, [r8], #4
 9c8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9cc:	e3a02001 	mov	r2, #1
 9d0:	e1a00007 	mov	r0, r7
      state = 0;
 9d4:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9d8:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9dc:	ebfffe89 	bl	408 <write>
 9e0:	eaffffaf 	b	8a4 <printf+0x50>
          s = "(null)";
 9e4:	e3004bb4 	movw	r4, #2996	; 0xbb4
        while(*s != 0){
 9e8:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 9ec:	e3404000 	movt	r4, #0
 9f0:	eaffffdc 	b	968 <printf+0x114>

000009f4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f4:	e300cbbc 	movw	ip, #3004	; 0xbbc
 9f8:	e340c000 	movt	ip, #0
{
 9fc:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a00:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a04:	e59c3000 	ldr	r3, [ip]
{
 a08:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0c:	e1530001 	cmp	r3, r1
 a10:	e5932000 	ldr	r2, [r3]
 a14:	2a000017 	bcs	a78 <free+0x84>
 a18:	e1510002 	cmp	r1, r2
 a1c:	3a000001 	bcc	a28 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	e1530002 	cmp	r3, r2
 a24:	3a000017 	bcc	a88 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a28:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a2c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a30:	e081418e 	add	r4, r1, lr, lsl #3
 a34:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a38:	05922004 	ldreq	r2, [r2, #4]
 a3c:	0082e00e 	addeq	lr, r2, lr
 a40:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a44:	05932000 	ldreq	r2, [r3]
 a48:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a4c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a50:	e5932004 	ldr	r2, [r3, #4]
 a54:	e083e182 	add	lr, r3, r2, lsl #3
 a58:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a5c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a60:	05101004 	ldreq	r1, [r0, #-4]
 a64:	00812002 	addeq	r2, r1, r2
 a68:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a6c:	05102008 	ldreq	r2, [r0, #-8]
 a70:	05832000 	streq	r2, [r3]
}
 a74:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a78:	e1530002 	cmp	r3, r2
 a7c:	3a000001 	bcc	a88 <free+0x94>
 a80:	e1510002 	cmp	r1, r2
 a84:	3affffe7 	bcc	a28 <free+0x34>
{
 a88:	e1a03002 	mov	r3, r2
 a8c:	eaffffde 	b	a0c <free+0x18>

00000a90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a90:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a94:	e3007bbc 	movw	r7, #3004	; 0xbbc
 a98:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a9c:	e2804007 	add	r4, r0, #7
{
 aa0:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 aa4:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa8:	e1a041a4 	lsr	r4, r4, #3
 aac:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ab0:	e3530000 	cmp	r3, #0
 ab4:	0a000027 	beq	b58 <malloc+0xc8>
 ab8:	e5930000 	ldr	r0, [r3]
 abc:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ac0:	e1540002 	cmp	r4, r2
 ac4:	9a000019 	bls	b30 <malloc+0xa0>
 ac8:	e3540a01 	cmp	r4, #4096	; 0x1000
 acc:	21a05004 	movcs	r5, r4
 ad0:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ad4:	e1a06185 	lsl	r6, r5, #3
 ad8:	ea000003 	b	aec <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 adc:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ae0:	e5902004 	ldr	r2, [r0, #4]
 ae4:	e1520004 	cmp	r2, r4
 ae8:	2a000010 	bcs	b30 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aec:	e5972000 	ldr	r2, [r7]
 af0:	e1a03000 	mov	r3, r0
 af4:	e1520000 	cmp	r2, r0
 af8:	1afffff7 	bne	adc <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 afc:	e1a00006 	mov	r0, r6
 b00:	ebfffee9 	bl	6ac <sbrk>
 b04:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b08:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b0c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b10:	0a000004 	beq	b28 <malloc+0x98>
  hp->s.size = nu;
 b14:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b18:	ebffffb5 	bl	9f4 <free>
  return freep;
 b1c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b20:	e3530000 	cmp	r3, #0
 b24:	1affffec 	bne	adc <malloc+0x4c>
        return 0;
 b28:	e3a00000 	mov	r0, #0
  }
}
 b2c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b30:	e1540002 	cmp	r4, r2
      freep = prevp;
 b34:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b38:	10422004 	subne	r2, r2, r4
 b3c:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b40:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b44:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b48:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b4c:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b50:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b54:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b58:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b5c:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b60:	e5870000 	str	r0, [r7]
 b64:	e5870004 	str	r0, [r7, #4]
 b68:	eaffffd6 	b	ac8 <malloc+0x38>
