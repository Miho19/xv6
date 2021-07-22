
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int
main(int argc, char *argv[])
{
  if(argc != 3){
   0:	e3500003 	cmp	r0, #3
{
   4:	e92d4800 	push	{fp, lr}
   8:	e28db004 	add	fp, sp, #4
  if(argc != 3){
   c:	0a000004 	beq	24 <main+0x24>
    printf(2, "Usage: ln old new\n");
  10:	e3001b70 	movw	r1, #2928	; 0xb70
  14:	e3a00002 	mov	r0, #2
  18:	e3401000 	movt	r1, #0
  1c:	eb00020e 	bl	85c <printf>
    exit();
  20:	eb0000b4 	bl	2f8 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  24:	e1a04001 	mov	r4, r1
  28:	e1c100d4 	ldrd	r0, [r1, #4]
  2c:	eb00015a 	bl	59c <link>
  30:	e3500000 	cmp	r0, #0
  34:	ba000000 	blt	3c <main+0x3c>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  38:	eb0000ae 	bl	2f8 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  3c:	e3001b84 	movw	r1, #2948	; 0xb84
  40:	e5943008 	ldr	r3, [r4, #8]
  44:	e3401000 	movt	r1, #0
  48:	e5942004 	ldr	r2, [r4, #4]
  4c:	e3a00002 	mov	r0, #2
  50:	eb000201 	bl	85c <printf>
  54:	eafffff7 	b	38 <main+0x38>

00000058 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  5c:	e2402001 	sub	r2, r0, #1
  60:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	e4d13001 	ldrb	r3, [r1], #1
  68:	e3530000 	cmp	r3, #0
  6c:	e5e23001 	strb	r3, [r2, #1]!
  70:	1afffffb 	bne	64 <strcpy+0xc>
    ;
  return os;
}
  74:	e28bd000 	add	sp, fp, #0
  78:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  7c:	e12fff1e 	bx	lr

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  84:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  88:	e5d03000 	ldrb	r3, [r0]
  8c:	e5d12000 	ldrb	r2, [r1]
  90:	e3530000 	cmp	r3, #0
  94:	1a000004 	bne	ac <strcmp+0x2c>
  98:	ea000005 	b	b4 <strcmp+0x34>
  9c:	e5f03001 	ldrb	r3, [r0, #1]!
  a0:	e5f12001 	ldrb	r2, [r1, #1]!
  a4:	e3530000 	cmp	r3, #0
  a8:	0a000001 	beq	b4 <strcmp+0x34>
  ac:	e1530002 	cmp	r3, r2
  b0:	0afffff9 	beq	9c <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  b4:	e0430002 	sub	r0, r3, r2
  b8:	e28bd000 	add	sp, fp, #0
  bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c0:	e12fff1e 	bx	lr

000000c4 <strlen>:

uint
strlen(char *s)
{
  c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  c8:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  cc:	e5d03000 	ldrb	r3, [r0]
  d0:	e3530000 	cmp	r3, #0
  d4:	0a000008 	beq	fc <strlen+0x38>
  d8:	e2601001 	rsb	r1, r0, #1
  dc:	e1a03000 	mov	r3, r0
    ;
  e0:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
  e4:	e5f32001 	ldrb	r2, [r3, #1]!
  e8:	e3520000 	cmp	r2, #0
  ec:	1afffffb 	bne	e0 <strlen+0x1c>
  return n;
}
  f0:	e28bd000 	add	sp, fp, #0
  f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f8:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
  fc:	e1a00003 	mov	r0, r3
}
 100:	e28bd000 	add	sp, fp, #0
 104:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 108:	e12fff1e 	bx	lr

0000010c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 10c:	e3520000 	cmp	r2, #0
{
 110:	e1a03000 	mov	r3, r0
 114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 118:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 11c:	0a000004 	beq	134 <memset+0x28>
 120:	e6ef1071 	uxtb	r1, r1
 124:	e0800002 	add	r0, r0, r2
 128:	e4c31001 	strb	r1, [r3], #1
 12c:	e1500003 	cmp	r0, r3
 130:	1afffffc 	bne	128 <memset+0x1c>
  return (void *)p;
}
 134:	e28bd000 	add	sp, fp, #0
 138:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 13c:	e12fff1e 	bx	lr

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 144:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 148:	e5d02000 	ldrb	r2, [r0]
 14c:	e3520000 	cmp	r2, #0
 150:	0a00000b 	beq	184 <strchr+0x44>
    if(*s == c)
 154:	e1520001 	cmp	r2, r1
 158:	1a000002 	bne	168 <strchr+0x28>
 15c:	ea000005 	b	178 <strchr+0x38>
 160:	e1530001 	cmp	r3, r1
 164:	0a000003 	beq	178 <strchr+0x38>
  for(; *s; s++)
 168:	e5f03001 	ldrb	r3, [r0, #1]!
 16c:	e3530000 	cmp	r3, #0
 170:	1afffffa 	bne	160 <strchr+0x20>
      return (char*)s;
  return 0;
 174:	e1a00003 	mov	r0, r3
}
 178:	e28bd000 	add	sp, fp, #0
 17c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 180:	e12fff1e 	bx	lr
  return 0;
 184:	e1a00002 	mov	r0, r2
 188:	eafffffa 	b	178 <strchr+0x38>

0000018c <gets>:

char*
gets(char *buf, int max)
{
 18c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 190:	e1a03000 	mov	r3, r0
 194:	e28db014 	add	fp, sp, #20
 198:	e1a07000 	mov	r7, r0
 19c:	e24dd008 	sub	sp, sp, #8
 1a0:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	e3a04000 	mov	r4, #0
 1a8:	ea000008 	b	1d0 <gets+0x44>
    cc = read(0, &c, 1);
 1ac:	eb000085 	bl	3c8 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1b0:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1b4:	e3500000 	cmp	r0, #0
 1b8:	da00000b 	ble	1ec <gets+0x60>
    buf[i++] = c;
 1bc:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1c0:	e352000d 	cmp	r2, #13
 1c4:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1c8:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1cc:	0a00000b 	beq	200 <gets+0x74>
    cc = read(0, &c, 1);
 1d0:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1d4:	e0844002 	add	r4, r4, r2
 1d8:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1dc:	e24b1015 	sub	r1, fp, #21
 1e0:	e3a00000 	mov	r0, #0
 1e4:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1e8:	baffffef 	blt	1ac <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1ec:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1f0:	e3a03000 	mov	r3, #0
 1f4:	e5c53000 	strb	r3, [r5]
}
 1f8:	e24bd014 	sub	sp, fp, #20
 1fc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 200:	e0875004 	add	r5, r7, r4
 204:	eafffff8 	b	1ec <gets+0x60>

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	e92d4830 	push	{r4, r5, fp, lr}
 20c:	e1a04001 	mov	r4, r1
 210:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 214:	e3a01000 	mov	r1, #0
 218:	eb0000ab 	bl	4cc <open>
  if(fd < 0)
 21c:	e2505000 	subs	r5, r0, #0
 220:	ba000006 	blt	240 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 224:	e1a01004 	mov	r1, r4
 228:	eb0000ce 	bl	568 <fstat>
 22c:	e1a04000 	mov	r4, r0
  close(fd);
 230:	e1a00005 	mov	r0, r5
 234:	eb00007d 	bl	430 <close>
  return r;
}
 238:	e1a00004 	mov	r0, r4
 23c:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 240:	e3e04000 	mvn	r4, #0
 244:	eafffffb 	b	238 <stat+0x30>

00000248 <atoi>:

int
atoi(const char *s)
{
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 250:	e5d02000 	ldrb	r2, [r0]
 254:	e2423030 	sub	r3, r2, #48	; 0x30
 258:	e3530009 	cmp	r3, #9
  n = 0;
 25c:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 260:	8a000006 	bhi	280 <atoi+0x38>
    n = n*10 + *s++ - '0';
 264:	e3a0c00a 	mov	ip, #10
 268:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 26c:	e5f02001 	ldrb	r2, [r0, #1]!
 270:	e2421030 	sub	r1, r2, #48	; 0x30
 274:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 278:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 27c:	9afffff9 	bls	268 <atoi+0x20>
  return n;
}
 280:	e1a00003 	mov	r0, r3
 284:	e28bd000 	add	sp, fp, #0
 288:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 28c:	e12fff1e 	bx	lr

00000290 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 290:	e3520000 	cmp	r2, #0
{
 294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 298:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 29c:	da000005 	ble	2b8 <memmove+0x28>
 2a0:	e0812002 	add	r2, r1, r2
 2a4:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2a8:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2ac:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2b0:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2b4:	1afffffb 	bne	2a8 <memmove+0x18>
  return vdst;
}
 2b8:	e28bd000 	add	sp, fp, #0
 2bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c0:	e12fff1e 	bx	lr

000002c4 <fork>:
 2c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2d8:	e3a00001 	mov	r0, #1
 2dc:	ef000040 	svc	0x00000040
 2e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2f4:	e12fff1e 	bx	lr

000002f8 <exit>:
 2f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 300:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 304:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 308:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 30c:	e3a00002 	mov	r0, #2
 310:	ef000040 	svc	0x00000040
 314:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 318:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 31c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 320:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 324:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 328:	e12fff1e 	bx	lr

0000032c <wait>:
 32c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 330:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 334:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 338:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 33c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 340:	e3a00003 	mov	r0, #3
 344:	ef000040 	svc	0x00000040
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 350:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 354:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 358:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <lseek>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00016 	mov	r0, #22
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <pipe>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00004 	mov	r0, #4
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <read>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00005 	mov	r0, #5
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <write>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00010 	mov	r0, #16
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <close>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00015 	mov	r0, #21
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <kill>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00006 	mov	r0, #6
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <exec>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00007 	mov	r0, #7
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <open>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a0000f 	mov	r0, #15
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <mknod>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00011 	mov	r0, #17
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <unlink>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00012 	mov	r0, #18
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <fstat>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00008 	mov	r0, #8
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <link>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00013 	mov	r0, #19
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <mkdir>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00014 	mov	r0, #20
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <chdir>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00009 	mov	r0, #9
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <dup>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a0000a 	mov	r0, #10
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <getpid>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a0000b 	mov	r0, #11
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <sbrk>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a0000c 	mov	r0, #12
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <sleep>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a0000d 	mov	r0, #13
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <uptime>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a0000e 	mov	r0, #14
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 73c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 740:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 744:	e0133fa1 	ands	r3, r3, r1, lsr #31
 748:	e24b4034 	sub	r4, fp, #52	; 0x34
 74c:	e3009b98 	movw	r9, #2968	; 0xb98
    neg = 1;
    x = -xx;
 750:	1261e000 	rsbne	lr, r1, #0
 754:	e3409000 	movt	r9, #0
{
 758:	e1a05000 	mov	r5, r0
    neg = 1;
 75c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 760:	01a0e001 	moveq	lr, r1
  neg = 0;
 764:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 768:	e3a07000 	mov	r7, #0
  b = base;
 76c:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 770:	e3a06001 	mov	r6, #1
{
 774:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 778:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 77c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 780:	e3a0c000 	mov	ip, #0
 784:	ea000002 	b	794 <printint+0x58>
        if(r >= d) {
 788:	e1520000 	cmp	r2, r0
            r = r - d;
 78c:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 790:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 794:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 798:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 79c:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 7a0:	e2011001 	and	r1, r1, #1
 7a4:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 7a8:	1afffff6 	bne	788 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 7b0:	e35c0000 	cmp	ip, #0
 7b4:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7b8:	e2871001 	add	r1, r7, #1
 7bc:	e7d93003 	ldrb	r3, [r9, r3]
 7c0:	e4c83001 	strb	r3, [r8], #1
 7c4:	11a07001 	movne	r7, r1
 7c8:	1affffea 	bne	778 <printint+0x3c>
  if(neg)
 7cc:	e35a0000 	cmp	sl, #0
 7d0:	0a000005 	beq	7ec <printint+0xb0>
    buf[i++] = '-';
 7d4:	e24b3024 	sub	r3, fp, #36	; 0x24
 7d8:	e3a0202d 	mov	r2, #45	; 0x2d
 7dc:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 7e0:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 7e4:	e1a03002 	mov	r3, r2
 7e8:	e5402010 	strb	r2, [r0, #-16]
 7ec:	e0847007 	add	r7, r4, r7
 7f0:	ea000000 	b	7f8 <printint+0xbc>
 7f4:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 7f8:	e3a02001 	mov	r2, #1
 7fc:	e24b1035 	sub	r1, fp, #53	; 0x35
 800:	e1a00005 	mov	r0, r5
 804:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 808:	ebfffefb 	bl	3fc <write>

  while(--i >= 0)
 80c:	e1570004 	cmp	r7, r4
 810:	1afffff7 	bne	7f4 <printint+0xb8>
    putc(fd, buf[i]);
}
 814:	e24bd020 	sub	sp, fp, #32
 818:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000081c <div>:
{
 81c:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 820:	e3a02000 	mov	r2, #0
{
 824:	e28db008 	add	fp, sp, #8
 828:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 82c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 830:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 834:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 838:	e1a0c33e 	lsr	ip, lr, r3
 83c:	e20cc001 	and	ip, ip, #1
 840:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 844:	e1520001 	cmp	r2, r1
            r = r - d;
 848:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 84c:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 850:	e2533001 	subs	r3, r3, #1
 854:	38bd8810 	popcc	{r4, fp, pc}
 858:	eafffff6 	b	838 <div+0x1c>

0000085c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 85c:	e92d000e 	push	{r1, r2, r3}
 860:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 864:	e28db018 	add	fp, sp, #24
 868:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 86c:	e59b6004 	ldr	r6, [fp, #4]
 870:	e5d64000 	ldrb	r4, [r6]
 874:	e3540000 	cmp	r4, #0
 878:	0a00002b 	beq	92c <printf+0xd0>
 87c:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 880:	e28b8008 	add	r8, fp, #8
  state = 0;
 884:	e3a05000 	mov	r5, #0
 888:	ea00000a 	b	8b8 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 88c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 890:	01a05004 	moveq	r5, r4
      if(c == '%'){
 894:	0a000004 	beq	8ac <printf+0x50>
  write(fd, &c, 1);
 898:	e3a02001 	mov	r2, #1
 89c:	e24b1019 	sub	r1, fp, #25
 8a0:	e1a00007 	mov	r0, r7
 8a4:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 8a8:	ebfffed3 	bl	3fc <write>
  for(i = 0; fmt[i]; i++){
 8ac:	e5f64001 	ldrb	r4, [r6, #1]!
 8b0:	e3540000 	cmp	r4, #0
 8b4:	0a00001c 	beq	92c <printf+0xd0>
    if(state == 0){
 8b8:	e3550000 	cmp	r5, #0
 8bc:	0afffff2 	beq	88c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8c0:	e3550025 	cmp	r5, #37	; 0x25
 8c4:	1afffff8 	bne	8ac <printf+0x50>
      if(c == 'd'){
 8c8:	e3540064 	cmp	r4, #100	; 0x64
 8cc:	0a000021 	beq	958 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8d0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8d4:	e3530070 	cmp	r3, #112	; 0x70
 8d8:	0a000017 	beq	93c <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8dc:	e3540073 	cmp	r4, #115	; 0x73
 8e0:	0a00002e 	beq	9a0 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e4:	e3540063 	cmp	r4, #99	; 0x63
 8e8:	0a000021 	beq	974 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8ec:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 8f0:	e3a02001 	mov	r2, #1
 8f4:	e24b1019 	sub	r1, fp, #25
 8f8:	e1a00007 	mov	r0, r7
 8fc:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 900:	0a000023 	beq	994 <printf+0x138>
  write(fd, &c, 1);
 904:	ebfffebc 	bl	3fc <write>
 908:	e3a02001 	mov	r2, #1
 90c:	e24b1019 	sub	r1, fp, #25
 910:	e1a00007 	mov	r0, r7
 914:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 918:	ebfffeb7 	bl	3fc <write>
  for(i = 0; fmt[i]; i++){
 91c:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 920:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 924:	e3540000 	cmp	r4, #0
 928:	1affffe2 	bne	8b8 <printf+0x5c>
    }
  }
}
 92c:	e24bd018 	sub	sp, fp, #24
 930:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 934:	e28dd00c 	add	sp, sp, #12
 938:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 93c:	e3a03000 	mov	r3, #0
 940:	e3a02010 	mov	r2, #16
 944:	e4981004 	ldr	r1, [r8], #4
 948:	e1a00007 	mov	r0, r7
 94c:	ebffff7a 	bl	73c <printint>
      state = 0;
 950:	e3a05000 	mov	r5, #0
 954:	eaffffd4 	b	8ac <printf+0x50>
        printint(fd, *ap, 10, 1);
 958:	e3a03001 	mov	r3, #1
 95c:	e3a0200a 	mov	r2, #10
 960:	e4981004 	ldr	r1, [r8], #4
 964:	e1a00007 	mov	r0, r7
 968:	ebffff73 	bl	73c <printint>
      state = 0;
 96c:	e3a05000 	mov	r5, #0
 970:	eaffffcd 	b	8ac <printf+0x50>
        putc(fd, *ap);
 974:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 978:	e3a02001 	mov	r2, #1
 97c:	e24b1019 	sub	r1, fp, #25
 980:	e1a00007 	mov	r0, r7
      state = 0;
 984:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 988:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 98c:	ebfffe9a 	bl	3fc <write>
        ap++;
 990:	eaffffc5 	b	8ac <printf+0x50>
  write(fd, &c, 1);
 994:	ebfffe98 	bl	3fc <write>
      state = 0;
 998:	e3a05000 	mov	r5, #0
 99c:	eaffffc2 	b	8ac <printf+0x50>
        s = (char*)*ap;
 9a0:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 9a4:	e3540000 	cmp	r4, #0
 9a8:	0a00000b 	beq	9dc <printf+0x180>
        while(*s != 0){
 9ac:	e5d45000 	ldrb	r5, [r4]
 9b0:	e3550000 	cmp	r5, #0
 9b4:	0affffbc 	beq	8ac <printf+0x50>
  write(fd, &c, 1);
 9b8:	e3a02001 	mov	r2, #1
 9bc:	e24b1019 	sub	r1, fp, #25
 9c0:	e1a00007 	mov	r0, r7
 9c4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9c8:	ebfffe8b 	bl	3fc <write>
        while(*s != 0){
 9cc:	e5f45001 	ldrb	r5, [r4, #1]!
 9d0:	e3550000 	cmp	r5, #0
 9d4:	1afffff7 	bne	9b8 <printf+0x15c>
 9d8:	eaffffb3 	b	8ac <printf+0x50>
          s = "(null)";
 9dc:	e3004bac 	movw	r4, #2988	; 0xbac
        while(*s != 0){
 9e0:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9e4:	e3404000 	movt	r4, #0
 9e8:	eafffff2 	b	9b8 <printf+0x15c>

000009ec <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ec:	e300cbb4 	movw	ip, #2996	; 0xbb4
 9f0:	e340c000 	movt	ip, #0
{
 9f4:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9f8:	e2401008 	sub	r1, r0, #8
{
 9fc:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a00:	e59c3000 	ldr	r3, [ip]
 a04:	ea000004 	b	a1c <free+0x30>
 a08:	e1510002 	cmp	r1, r2
 a0c:	3a000009 	bcc	a38 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a10:	e1530002 	cmp	r3, r2
 a14:	2a000007 	bcs	a38 <free+0x4c>
{
 a18:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	e1530001 	cmp	r3, r1
 a20:	e5932000 	ldr	r2, [r3]
 a24:	3afffff7 	bcc	a08 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a28:	e1530002 	cmp	r3, r2
 a2c:	3afffff9 	bcc	a18 <free+0x2c>
 a30:	e1510002 	cmp	r1, r2
 a34:	2afffff7 	bcs	a18 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a38:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a3c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a40:	e081418e 	add	r4, r1, lr, lsl #3
 a44:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a48:	05922004 	ldreq	r2, [r2, #4]
 a4c:	0082e00e 	addeq	lr, r2, lr
 a50:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a54:	05932000 	ldreq	r2, [r3]
 a58:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a5c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a60:	e5932004 	ldr	r2, [r3, #4]
 a64:	e083e182 	add	lr, r3, r2, lsl #3
 a68:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a6c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a70:	05101004 	ldreq	r1, [r0, #-4]
 a74:	00812002 	addeq	r2, r1, r2
 a78:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a7c:	05102008 	ldreq	r2, [r0, #-8]
 a80:	05832000 	streq	r2, [r3]
}
 a84:	e8bd8810 	pop	{r4, fp, pc}

00000a88 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a88:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a8c:	e3007bb4 	movw	r7, #2996	; 0xbb4
 a90:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a94:	e2804007 	add	r4, r0, #7
{
 a98:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a9c:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa0:	e1a041a4 	lsr	r4, r4, #3
 aa4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 aa8:	e3510000 	cmp	r1, #0
 aac:	0a000029 	beq	b58 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab0:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 ab4:	e5932004 	ldr	r2, [r3, #4]
 ab8:	e1520004 	cmp	r2, r4
 abc:	2a000019 	bcs	b28 <malloc+0xa0>
 ac0:	e3540a01 	cmp	r4, #4096	; 0x1000
 ac4:	21a05004 	movcs	r5, r4
 ac8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 acc:	e1a06185 	lsl	r6, r5, #3
 ad0:	ea000005 	b	aec <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ad8:	e5902004 	ldr	r2, [r0, #4]
 adc:	e1520004 	cmp	r2, r4
 ae0:	2a000012 	bcs	b30 <malloc+0xa8>
 ae4:	e5971000 	ldr	r1, [r7]
 ae8:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aec:	e1510003 	cmp	r1, r3
 af0:	1afffff7 	bne	ad4 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 af4:	e1a00006 	mov	r0, r6
 af8:	ebfffee8 	bl	6a0 <sbrk>
 afc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b00:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b04:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b08:	0a000004 	beq	b20 <malloc+0x98>
  hp->s.size = nu;
 b0c:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b10:	ebffffb5 	bl	9ec <free>
  return freep;
 b14:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b18:	e3530000 	cmp	r3, #0
 b1c:	1affffec 	bne	ad4 <malloc+0x4c>
        return 0;
 b20:	e3a00000 	mov	r0, #0
  }
}
 b24:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b28:	e1a00003 	mov	r0, r3
 b2c:	e1a03001 	mov	r3, r1
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
 b58:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 b5c:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b60:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 b64:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 b68:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 b6c:	eaffffd3 	b	ac0 <malloc+0x38>
