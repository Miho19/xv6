
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
  18:	eb0001b2 	bl	6e8 <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3001b74 	movw	r1, #2932	; 0xb74
  20:	e3a00002 	mov	r0, #2
  24:	e3401000 	movt	r1, #0
  28:	eb00020b 	bl	85c <printf>
    exit();
  2c:	eb0000a9 	bl	2d8 <exit>
  }
  printf(2, "Child exits!\n");
  30:	e3001b84 	movw	r1, #2948	; 0xb84
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb000206 	bl	85c <printf>
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
 18c:	eb000092 	bl	3dc <read>
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
 1f8:	eb0000b8 	bl	4e0 <open>
  if(fd < 0)
 1fc:	e2505000 	subs	r5, r0, #0
 200:	ba000006 	blt	220 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 204:	e1a01004 	mov	r1, r4
 208:	eb0000db 	bl	57c <fstat>
 20c:	e1a04000 	mov	r4, r0
  close(fd);
 210:	e1a00005 	mov	r0, r5
 214:	eb00008a 	bl	444 <close>
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

00000374 <mount>:
 374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 378:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 37c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 380:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 384:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 388:	e3a00017 	mov	r0, #23
 38c:	ef000040 	svc	0x00000040
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 39c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a4:	e12fff1e 	bx	lr

000003a8 <pipe>:
 3a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3bc:	e3a00004 	mov	r0, #4
 3c0:	ef000040 	svc	0x00000040
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d8:	e12fff1e 	bx	lr

000003dc <read>:
 3dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f0:	e3a00005 	mov	r0, #5
 3f4:	ef000040 	svc	0x00000040
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 404:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 408:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 40c:	e12fff1e 	bx	lr

00000410 <write>:
 410:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 414:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 418:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 41c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 420:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 424:	e3a00010 	mov	r0, #16
 428:	ef000040 	svc	0x00000040
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 438:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 43c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <close>:
 444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 448:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 44c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 450:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 454:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 458:	e3a00015 	mov	r0, #21
 45c:	ef000040 	svc	0x00000040
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 46c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 474:	e12fff1e 	bx	lr

00000478 <kill>:
 478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 47c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 480:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 484:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 488:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 48c:	e3a00006 	mov	r0, #6
 490:	ef000040 	svc	0x00000040
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a8:	e12fff1e 	bx	lr

000004ac <exec>:
 4ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c0:	e3a00007 	mov	r0, #7
 4c4:	ef000040 	svc	0x00000040
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4dc:	e12fff1e 	bx	lr

000004e0 <open>:
 4e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f4:	e3a0000f 	mov	r0, #15
 4f8:	ef000040 	svc	0x00000040
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 508:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 50c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 510:	e12fff1e 	bx	lr

00000514 <mknod>:
 514:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 518:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 51c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 520:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 524:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 528:	e3a00011 	mov	r0, #17
 52c:	ef000040 	svc	0x00000040
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 53c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 540:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 544:	e12fff1e 	bx	lr

00000548 <unlink>:
 548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 54c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 550:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 554:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 558:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 55c:	e3a00012 	mov	r0, #18
 560:	ef000040 	svc	0x00000040
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 570:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 574:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 578:	e12fff1e 	bx	lr

0000057c <fstat>:
 57c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 580:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 584:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 588:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 58c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 590:	e3a00008 	mov	r0, #8
 594:	ef000040 	svc	0x00000040
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ac:	e12fff1e 	bx	lr

000005b0 <link>:
 5b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c4:	e3a00013 	mov	r0, #19
 5c8:	ef000040 	svc	0x00000040
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e0:	e12fff1e 	bx	lr

000005e4 <mkdir>:
 5e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f8:	e3a00014 	mov	r0, #20
 5fc:	ef000040 	svc	0x00000040
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 60c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 614:	e12fff1e 	bx	lr

00000618 <chdir>:
 618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 61c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 620:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 624:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 628:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 62c:	e3a00009 	mov	r0, #9
 630:	ef000040 	svc	0x00000040
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 640:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 648:	e12fff1e 	bx	lr

0000064c <dup>:
 64c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 650:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 654:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 658:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 65c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 660:	e3a0000a 	mov	r0, #10
 664:	ef000040 	svc	0x00000040
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 674:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 67c:	e12fff1e 	bx	lr

00000680 <getpid>:
 680:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 684:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 688:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 68c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 690:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 694:	e3a0000b 	mov	r0, #11
 698:	ef000040 	svc	0x00000040
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b0:	e12fff1e 	bx	lr

000006b4 <sbrk>:
 6b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c8:	e3a0000c 	mov	r0, #12
 6cc:	ef000040 	svc	0x00000040
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e4:	e12fff1e 	bx	lr

000006e8 <sleep>:
 6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6fc:	e3a0000d 	mov	r0, #13
 700:	ef000040 	svc	0x00000040
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 710:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 718:	e12fff1e 	bx	lr

0000071c <uptime>:
 71c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 720:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 724:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 728:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 72c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 730:	e3a0000e 	mov	r0, #14
 734:	ef000040 	svc	0x00000040
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 744:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 748:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 74c:	e12fff1e 	bx	lr

00000750 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 750:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 754:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 758:	e013afa1 	ands	sl, r3, r1, lsr #31
 75c:	e24b4034 	sub	r4, fp, #52	; 0x34
 760:	e3009b94 	movw	r9, #2964	; 0xb94
    neg = 1;
    x = -xx;
 764:	1261e000 	rsbne	lr, r1, #0
 768:	e3409000 	movt	r9, #0
{
 76c:	e1a05000 	mov	r5, r0
    neg = 1;
 770:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 774:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 778:	e3a08000 	mov	r8, #0
  b = base;
 77c:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 780:	e3a06001 	mov	r6, #1
{
 784:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 788:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 78c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 790:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 794:	e1a0033e 	lsr	r0, lr, r3
 798:	e2000001 	and	r0, r0, #1
 79c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7a0:	e1520001 	cmp	r2, r1
            r = r - d;
 7a4:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7a8:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7ac:	e2533001 	subs	r3, r3, #1
 7b0:	2afffff7 	bcs	794 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b4:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7b8:	e35c0000 	cmp	ip, #0
 7bc:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7c0:	e2883001 	add	r3, r8, #1
 7c4:	e7d91001 	ldrb	r1, [r9, r1]
 7c8:	e4c71001 	strb	r1, [r7], #1
 7cc:	11a08003 	movne	r8, r3
 7d0:	1affffec 	bne	788 <printint+0x38>
  if(neg)
 7d4:	e35a0000 	cmp	sl, #0
 7d8:	0a000004 	beq	7f0 <printint+0xa0>
    buf[i++] = '-';
 7dc:	e24b2024 	sub	r2, fp, #36	; 0x24
 7e0:	e3a0102d 	mov	r1, #45	; 0x2d
 7e4:	e0822003 	add	r2, r2, r3
 7e8:	e2883002 	add	r3, r8, #2
 7ec:	e5421010 	strb	r1, [r2, #-16]
 7f0:	e0846003 	add	r6, r4, r3
 7f4:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 7f8:	e3a02001 	mov	r2, #1
 7fc:	e24b1035 	sub	r1, fp, #53	; 0x35
 800:	e1a00005 	mov	r0, r5
 804:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 808:	ebffff00 	bl	410 <write>

  while(--i >= 0)
 80c:	e1540006 	cmp	r4, r6
 810:	1afffff7 	bne	7f4 <printint+0xa4>
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
 86c:	e59b5004 	ldr	r5, [fp, #4]
 870:	e5d54000 	ldrb	r4, [r5]
 874:	e3540000 	cmp	r4, #0
 878:	0a00002b 	beq	92c <printf+0xd0>
 87c:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 880:	e28b8008 	add	r8, fp, #8
  state = 0;
 884:	e3a06000 	mov	r6, #0
 888:	ea00000a 	b	8b8 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 88c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 890:	01a06004 	moveq	r6, r4
      if(c == '%'){
 894:	0a000004 	beq	8ac <printf+0x50>
 898:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 89c:	e3a02001 	mov	r2, #1
 8a0:	e1a00007 	mov	r0, r7
 8a4:	e5614006 	strb	r4, [r1, #-6]!
 8a8:	ebfffed8 	bl	410 <write>
  for(i = 0; fmt[i]; i++){
 8ac:	e5f54001 	ldrb	r4, [r5, #1]!
 8b0:	e3540000 	cmp	r4, #0
 8b4:	0a00001c 	beq	92c <printf+0xd0>
    if(state == 0){
 8b8:	e3560000 	cmp	r6, #0
 8bc:	0afffff2 	beq	88c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8c0:	e3560025 	cmp	r6, #37	; 0x25
 8c4:	1afffff8 	bne	8ac <printf+0x50>
      if(c == 'd'){
 8c8:	e3540064 	cmp	r4, #100	; 0x64
 8cc:	0a000030 	beq	994 <printf+0x138>
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
 8e0:	0a00001c 	beq	958 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e4:	e3540063 	cmp	r4, #99	; 0x63
 8e8:	0a000037 	beq	9cc <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8ec:	e3540025 	cmp	r4, #37	; 0x25
 8f0:	0a00002e 	beq	9b0 <printf+0x154>
  write(fd, &c, 1);
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e24b1019 	sub	r1, fp, #25
 8fc:	e1a00007 	mov	r0, r7
 900:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 904:	ebfffec1 	bl	410 <write>
 908:	e3a02001 	mov	r2, #1
 90c:	e24b101a 	sub	r1, fp, #26
 910:	e1a00007 	mov	r0, r7
 914:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 918:	ebfffebc 	bl	410 <write>
  for(i = 0; fmt[i]; i++){
 91c:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 920:	e3a06000 	mov	r6, #0
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
 94c:	ebffff7f 	bl	750 <printint>
      state = 0;
 950:	e3a06000 	mov	r6, #0
 954:	eaffffd4 	b	8ac <printf+0x50>
        s = (char*)*ap;
 958:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 95c:	e3540000 	cmp	r4, #0
 960:	0a000021 	beq	9ec <printf+0x190>
        while(*s != 0){
 964:	e5d46000 	ldrb	r6, [r4]
 968:	e3560000 	cmp	r6, #0
 96c:	0affffce 	beq	8ac <printf+0x50>
  write(fd, &c, 1);
 970:	e3a02001 	mov	r2, #1
 974:	e24b101d 	sub	r1, fp, #29
 978:	e1a00007 	mov	r0, r7
 97c:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 980:	ebfffea2 	bl	410 <write>
        while(*s != 0){
 984:	e5f46001 	ldrb	r6, [r4, #1]!
 988:	e3560000 	cmp	r6, #0
 98c:	1afffff7 	bne	970 <printf+0x114>
 990:	eaffffc5 	b	8ac <printf+0x50>
        printint(fd, *ap, 10, 1);
 994:	e3a03001 	mov	r3, #1
 998:	e3a0200a 	mov	r2, #10
 99c:	e4981004 	ldr	r1, [r8], #4
 9a0:	e1a00007 	mov	r0, r7
 9a4:	ebffff69 	bl	750 <printint>
      state = 0;
 9a8:	e3a06000 	mov	r6, #0
 9ac:	eaffffbe 	b	8ac <printf+0x50>
 9b0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9b4:	e3a02001 	mov	r2, #1
 9b8:	e1a00007 	mov	r0, r7
 9bc:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9c0:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9c4:	ebfffe91 	bl	410 <write>
 9c8:	eaffffb7 	b	8ac <printf+0x50>
        putc(fd, *ap);
 9cc:	e4983004 	ldr	r3, [r8], #4
 9d0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9d4:	e3a02001 	mov	r2, #1
 9d8:	e1a00007 	mov	r0, r7
      state = 0;
 9dc:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9e0:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9e4:	ebfffe89 	bl	410 <write>
 9e8:	eaffffaf 	b	8ac <printf+0x50>
          s = "(null)";
 9ec:	e3004ba8 	movw	r4, #2984	; 0xba8
        while(*s != 0){
 9f0:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 9f4:	e3404000 	movt	r4, #0
 9f8:	eaffffdc 	b	970 <printf+0x114>

000009fc <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9fc:	e300cbb0 	movw	ip, #2992	; 0xbb0
 a00:	e340c000 	movt	ip, #0
{
 a04:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a08:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0c:	e59c3000 	ldr	r3, [ip]
{
 a10:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a14:	e1530001 	cmp	r3, r1
 a18:	e5932000 	ldr	r2, [r3]
 a1c:	2a000017 	bcs	a80 <free+0x84>
 a20:	e1510002 	cmp	r1, r2
 a24:	3a000001 	bcc	a30 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a28:	e1530002 	cmp	r3, r2
 a2c:	3a000017 	bcc	a90 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a30:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a34:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a38:	e081418e 	add	r4, r1, lr, lsl #3
 a3c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a40:	05922004 	ldreq	r2, [r2, #4]
 a44:	0082e00e 	addeq	lr, r2, lr
 a48:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a4c:	05932000 	ldreq	r2, [r3]
 a50:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a54:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a58:	e5932004 	ldr	r2, [r3, #4]
 a5c:	e083e182 	add	lr, r3, r2, lsl #3
 a60:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a64:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a68:	05101004 	ldreq	r1, [r0, #-4]
 a6c:	00812002 	addeq	r2, r1, r2
 a70:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a74:	05102008 	ldreq	r2, [r0, #-8]
 a78:	05832000 	streq	r2, [r3]
}
 a7c:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a80:	e1530002 	cmp	r3, r2
 a84:	3a000001 	bcc	a90 <free+0x94>
 a88:	e1510002 	cmp	r1, r2
 a8c:	3affffe7 	bcc	a30 <free+0x34>
{
 a90:	e1a03002 	mov	r3, r2
 a94:	eaffffde 	b	a14 <free+0x18>

00000a98 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a98:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a9c:	e3007bb0 	movw	r7, #2992	; 0xbb0
 aa0:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa4:	e2804007 	add	r4, r0, #7
{
 aa8:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 aac:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab0:	e1a041a4 	lsr	r4, r4, #3
 ab4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ab8:	e3530000 	cmp	r3, #0
 abc:	0a000027 	beq	b60 <malloc+0xc8>
 ac0:	e5930000 	ldr	r0, [r3]
 ac4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ac8:	e1540002 	cmp	r4, r2
 acc:	9a000019 	bls	b38 <malloc+0xa0>
 ad0:	e3540a01 	cmp	r4, #4096	; 0x1000
 ad4:	21a05004 	movcs	r5, r4
 ad8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 adc:	e1a06185 	lsl	r6, r5, #3
 ae0:	ea000003 	b	af4 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ae8:	e5902004 	ldr	r2, [r0, #4]
 aec:	e1520004 	cmp	r2, r4
 af0:	2a000010 	bcs	b38 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 af4:	e5972000 	ldr	r2, [r7]
 af8:	e1a03000 	mov	r3, r0
 afc:	e1520000 	cmp	r2, r0
 b00:	1afffff7 	bne	ae4 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b04:	e1a00006 	mov	r0, r6
 b08:	ebfffee9 	bl	6b4 <sbrk>
 b0c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b10:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b14:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b18:	0a000004 	beq	b30 <malloc+0x98>
  hp->s.size = nu;
 b1c:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b20:	ebffffb5 	bl	9fc <free>
  return freep;
 b24:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b28:	e3530000 	cmp	r3, #0
 b2c:	1affffec 	bne	ae4 <malloc+0x4c>
        return 0;
 b30:	e3a00000 	mov	r0, #0
  }
}
 b34:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b38:	e1540002 	cmp	r4, r2
      freep = prevp;
 b3c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b40:	10422004 	subne	r2, r2, r4
 b44:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b48:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b4c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b50:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b54:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b58:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b5c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b60:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b64:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b68:	e5870000 	str	r0, [r7]
 b6c:	e5870004 	str	r0, [r7, #4]
 b70:	eaffffd6 	b	ad0 <malloc+0x38>
