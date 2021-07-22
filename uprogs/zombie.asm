
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
   8:	eb0000a8 	bl	2b0 <fork>
   c:	e3500000 	cmp	r0, #0
  10:	da000006 	ble	30 <main+0x30>
    sleep(5);  // Let child exit before parent.
  14:	e3a00005 	mov	r0, #5
  18:	eb0001a8 	bl	6c0 <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3001b5c 	movw	r1, #2908	; 0xb5c
  20:	e3a00002 	mov	r0, #2
  24:	e3401000 	movt	r1, #0
  28:	eb000206 	bl	848 <printf>
    exit();
  2c:	eb0000ac 	bl	2e4 <exit>
  }
  printf(2, "Child exits!\n");
  30:	e3001b6c 	movw	r1, #2924	; 0xb6c
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb000201 	bl	848 <printf>
  exit();
  40:	eb0000a7 	bl	2e4 <exit>

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
  c0:	0a000008 	beq	e8 <strlen+0x38>
  c4:	e2601001 	rsb	r1, r0, #1
  c8:	e1a03000 	mov	r3, r0
    ;
  cc:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
  d0:	e5f32001 	ldrb	r2, [r3, #1]!
  d4:	e3520000 	cmp	r2, #0
  d8:	1afffffb 	bne	cc <strlen+0x1c>
  return n;
}
  dc:	e28bd000 	add	sp, fp, #0
  e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  e4:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
  e8:	e1a00003 	mov	r0, r3
}
  ec:	e28bd000 	add	sp, fp, #0
  f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f4:	e12fff1e 	bx	lr

000000f8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
  f8:	e3520000 	cmp	r2, #0
{
  fc:	e1a03000 	mov	r3, r0
 100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 104:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 108:	0a000004 	beq	120 <memset+0x28>
 10c:	e6ef1071 	uxtb	r1, r1
 110:	e0800002 	add	r0, r0, r2
 114:	e4c31001 	strb	r1, [r3], #1
 118:	e1500003 	cmp	r0, r3
 11c:	1afffffc 	bne	114 <memset+0x1c>
  return (void *)p;
}
 120:	e28bd000 	add	sp, fp, #0
 124:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 128:	e12fff1e 	bx	lr

0000012c <strchr>:

char*
strchr(const char *s, char c)
{
 12c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 130:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 134:	e5d02000 	ldrb	r2, [r0]
 138:	e3520000 	cmp	r2, #0
 13c:	0a00000b 	beq	170 <strchr+0x44>
    if(*s == c)
 140:	e1520001 	cmp	r2, r1
 144:	1a000002 	bne	154 <strchr+0x28>
 148:	ea000005 	b	164 <strchr+0x38>
 14c:	e1530001 	cmp	r3, r1
 150:	0a000003 	beq	164 <strchr+0x38>
  for(; *s; s++)
 154:	e5f03001 	ldrb	r3, [r0, #1]!
 158:	e3530000 	cmp	r3, #0
 15c:	1afffffa 	bne	14c <strchr+0x20>
      return (char*)s;
  return 0;
 160:	e1a00003 	mov	r0, r3
}
 164:	e28bd000 	add	sp, fp, #0
 168:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 16c:	e12fff1e 	bx	lr
  return 0;
 170:	e1a00002 	mov	r0, r2
 174:	eafffffa 	b	164 <strchr+0x38>

00000178 <gets>:

char*
gets(char *buf, int max)
{
 178:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 17c:	e1a03000 	mov	r3, r0
 180:	e28db014 	add	fp, sp, #20
 184:	e1a07000 	mov	r7, r0
 188:	e24dd008 	sub	sp, sp, #8
 18c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 190:	e3a04000 	mov	r4, #0
 194:	ea000008 	b	1bc <gets+0x44>
    cc = read(0, &c, 1);
 198:	eb000085 	bl	3b4 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 19c:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1a0:	e3500000 	cmp	r0, #0
 1a4:	da00000b 	ble	1d8 <gets+0x60>
    buf[i++] = c;
 1a8:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1ac:	e352000d 	cmp	r2, #13
 1b0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1b4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1b8:	0a00000b 	beq	1ec <gets+0x74>
    cc = read(0, &c, 1);
 1bc:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1c0:	e0844002 	add	r4, r4, r2
 1c4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1c8:	e24b1015 	sub	r1, fp, #21
 1cc:	e3a00000 	mov	r0, #0
 1d0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1d4:	baffffef 	blt	198 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1dc:	e3a03000 	mov	r3, #0
 1e0:	e5c53000 	strb	r3, [r5]
}
 1e4:	e24bd014 	sub	sp, fp, #20
 1e8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1ec:	e0875004 	add	r5, r7, r4
 1f0:	eafffff8 	b	1d8 <gets+0x60>

000001f4 <stat>:

int
stat(char *n, struct stat *st)
{
 1f4:	e92d4830 	push	{r4, r5, fp, lr}
 1f8:	e1a04001 	mov	r4, r1
 1fc:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 200:	e3a01000 	mov	r1, #0
 204:	eb0000ab 	bl	4b8 <open>
  if(fd < 0)
 208:	e2505000 	subs	r5, r0, #0
 20c:	ba000006 	blt	22c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 210:	e1a01004 	mov	r1, r4
 214:	eb0000ce 	bl	554 <fstat>
 218:	e1a04000 	mov	r4, r0
  close(fd);
 21c:	e1a00005 	mov	r0, r5
 220:	eb00007d 	bl	41c <close>
  return r;
}
 224:	e1a00004 	mov	r0, r4
 228:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 22c:	e3e04000 	mvn	r4, #0
 230:	eafffffb 	b	224 <stat+0x30>

00000234 <atoi>:

int
atoi(const char *s)
{
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23c:	e5d02000 	ldrb	r2, [r0]
 240:	e2423030 	sub	r3, r2, #48	; 0x30
 244:	e3530009 	cmp	r3, #9
  n = 0;
 248:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 24c:	8a000006 	bhi	26c <atoi+0x38>
    n = n*10 + *s++ - '0';
 250:	e3a0c00a 	mov	ip, #10
 254:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 258:	e5f02001 	ldrb	r2, [r0, #1]!
 25c:	e2421030 	sub	r1, r2, #48	; 0x30
 260:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 264:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 268:	9afffff9 	bls	254 <atoi+0x20>
  return n;
}
 26c:	e1a00003 	mov	r0, r3
 270:	e28bd000 	add	sp, fp, #0
 274:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 278:	e12fff1e 	bx	lr

0000027c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27c:	e3520000 	cmp	r2, #0
{
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 288:	da000005 	ble	2a4 <memmove+0x28>
 28c:	e0812002 	add	r2, r1, r2
 290:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 294:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 298:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 29c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2a0:	1afffffb 	bne	294 <memmove+0x18>
  return vdst;
}
 2a4:	e28bd000 	add	sp, fp, #0
 2a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2ac:	e12fff1e 	bx	lr

000002b0 <fork>:
 2b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2c4:	e3a00001 	mov	r0, #1
 2c8:	ef000040 	svc	0x00000040
 2cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2e0:	e12fff1e 	bx	lr

000002e4 <exit>:
 2e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f8:	e3a00002 	mov	r0, #2
 2fc:	ef000040 	svc	0x00000040
 300:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 304:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 308:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 30c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 310:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 314:	e12fff1e 	bx	lr

00000318 <wait>:
 318:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 31c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 320:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 324:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 328:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 32c:	e3a00003 	mov	r0, #3
 330:	ef000040 	svc	0x00000040
 334:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 338:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 33c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 340:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 344:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 348:	e12fff1e 	bx	lr

0000034c <lseek>:
 34c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 350:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 354:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 358:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 35c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 360:	e3a00016 	mov	r0, #22
 364:	ef000040 	svc	0x00000040
 368:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 374:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 378:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 37c:	e12fff1e 	bx	lr

00000380 <pipe>:
 380:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 384:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 388:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 38c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 390:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 394:	e3a00004 	mov	r0, #4
 398:	ef000040 	svc	0x00000040
 39c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b0:	e12fff1e 	bx	lr

000003b4 <read>:
 3b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c8:	e3a00005 	mov	r0, #5
 3cc:	ef000040 	svc	0x00000040
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e4:	e12fff1e 	bx	lr

000003e8 <write>:
 3e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3fc:	e3a00010 	mov	r0, #16
 400:	ef000040 	svc	0x00000040
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 410:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 414:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 418:	e12fff1e 	bx	lr

0000041c <close>:
 41c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 420:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 424:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 428:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 42c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 430:	e3a00015 	mov	r0, #21
 434:	ef000040 	svc	0x00000040
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 444:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 448:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 44c:	e12fff1e 	bx	lr

00000450 <kill>:
 450:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 454:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 458:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 45c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 460:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 464:	e3a00006 	mov	r0, #6
 468:	ef000040 	svc	0x00000040
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 478:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 47c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 480:	e12fff1e 	bx	lr

00000484 <exec>:
 484:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 488:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 48c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 490:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 494:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 498:	e3a00007 	mov	r0, #7
 49c:	ef000040 	svc	0x00000040
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b4:	e12fff1e 	bx	lr

000004b8 <open>:
 4b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4cc:	e3a0000f 	mov	r0, #15
 4d0:	ef000040 	svc	0x00000040
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e8:	e12fff1e 	bx	lr

000004ec <mknod>:
 4ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 500:	e3a00011 	mov	r0, #17
 504:	ef000040 	svc	0x00000040
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 514:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 518:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 51c:	e12fff1e 	bx	lr

00000520 <unlink>:
 520:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 524:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 528:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 52c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 530:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 534:	e3a00012 	mov	r0, #18
 538:	ef000040 	svc	0x00000040
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 548:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 54c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 550:	e12fff1e 	bx	lr

00000554 <fstat>:
 554:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 558:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 55c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 560:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 564:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 568:	e3a00008 	mov	r0, #8
 56c:	ef000040 	svc	0x00000040
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 57c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 580:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 584:	e12fff1e 	bx	lr

00000588 <link>:
 588:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 58c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 590:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 594:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 598:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 59c:	e3a00013 	mov	r0, #19
 5a0:	ef000040 	svc	0x00000040
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b8:	e12fff1e 	bx	lr

000005bc <mkdir>:
 5bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d0:	e3a00014 	mov	r0, #20
 5d4:	ef000040 	svc	0x00000040
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ec:	e12fff1e 	bx	lr

000005f0 <chdir>:
 5f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 604:	e3a00009 	mov	r0, #9
 608:	ef000040 	svc	0x00000040
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 618:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 61c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 620:	e12fff1e 	bx	lr

00000624 <dup>:
 624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 628:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 62c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 630:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 634:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 638:	e3a0000a 	mov	r0, #10
 63c:	ef000040 	svc	0x00000040
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 64c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 650:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 654:	e12fff1e 	bx	lr

00000658 <getpid>:
 658:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 65c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 660:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 664:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 668:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 66c:	e3a0000b 	mov	r0, #11
 670:	ef000040 	svc	0x00000040
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 680:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 688:	e12fff1e 	bx	lr

0000068c <sbrk>:
 68c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 690:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 694:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 698:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 69c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a0:	e3a0000c 	mov	r0, #12
 6a4:	ef000040 	svc	0x00000040
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6bc:	e12fff1e 	bx	lr

000006c0 <sleep>:
 6c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d4:	e3a0000d 	mov	r0, #13
 6d8:	ef000040 	svc	0x00000040
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f0:	e12fff1e 	bx	lr

000006f4 <uptime>:
 6f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 700:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 704:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 708:	e3a0000e 	mov	r0, #14
 70c:	ef000040 	svc	0x00000040
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 71c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 720:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 724:	e12fff1e 	bx	lr

00000728 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 728:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 72c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 730:	e0133fa1 	ands	r3, r3, r1, lsr #31
 734:	e24b4034 	sub	r4, fp, #52	; 0x34
 738:	e3009b7c 	movw	r9, #2940	; 0xb7c
    neg = 1;
    x = -xx;
 73c:	1261e000 	rsbne	lr, r1, #0
 740:	e3409000 	movt	r9, #0
{
 744:	e1a05000 	mov	r5, r0
    neg = 1;
 748:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 74c:	01a0e001 	moveq	lr, r1
  neg = 0;
 750:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 754:	e3a07000 	mov	r7, #0
  b = base;
 758:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 75c:	e3a06001 	mov	r6, #1
{
 760:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 764:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 768:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 76c:	e3a0c000 	mov	ip, #0
 770:	ea000002 	b	780 <printint+0x58>
        if(r >= d) {
 774:	e1520000 	cmp	r2, r0
            r = r - d;
 778:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 77c:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 780:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 784:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 788:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 78c:	e2011001 	and	r1, r1, #1
 790:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 794:	1afffff6 	bne	774 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 798:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 79c:	e35c0000 	cmp	ip, #0
 7a0:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7a4:	e2871001 	add	r1, r7, #1
 7a8:	e7d93003 	ldrb	r3, [r9, r3]
 7ac:	e4c83001 	strb	r3, [r8], #1
 7b0:	11a07001 	movne	r7, r1
 7b4:	1affffea 	bne	764 <printint+0x3c>
  if(neg)
 7b8:	e35a0000 	cmp	sl, #0
 7bc:	0a000005 	beq	7d8 <printint+0xb0>
    buf[i++] = '-';
 7c0:	e24b3024 	sub	r3, fp, #36	; 0x24
 7c4:	e3a0202d 	mov	r2, #45	; 0x2d
 7c8:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 7cc:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 7d0:	e1a03002 	mov	r3, r2
 7d4:	e5402010 	strb	r2, [r0, #-16]
 7d8:	e0847007 	add	r7, r4, r7
 7dc:	ea000000 	b	7e4 <printint+0xbc>
 7e0:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 7e4:	e3a02001 	mov	r2, #1
 7e8:	e24b1035 	sub	r1, fp, #53	; 0x35
 7ec:	e1a00005 	mov	r0, r5
 7f0:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 7f4:	ebfffefb 	bl	3e8 <write>

  while(--i >= 0)
 7f8:	e1570004 	cmp	r7, r4
 7fc:	1afffff7 	bne	7e0 <printint+0xb8>
    putc(fd, buf[i]);
}
 800:	e24bd020 	sub	sp, fp, #32
 804:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000808 <div>:
{
 808:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 80c:	e3a02000 	mov	r2, #0
{
 810:	e28db008 	add	fp, sp, #8
 814:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 818:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 81c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 820:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 824:	e1a0c33e 	lsr	ip, lr, r3
 828:	e20cc001 	and	ip, ip, #1
 82c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 830:	e1520001 	cmp	r2, r1
            r = r - d;
 834:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 838:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 83c:	e2533001 	subs	r3, r3, #1
 840:	38bd8810 	popcc	{r4, fp, pc}
 844:	eafffff6 	b	824 <div+0x1c>

00000848 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 848:	e92d000e 	push	{r1, r2, r3}
 84c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 850:	e28db018 	add	fp, sp, #24
 854:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 858:	e59b6004 	ldr	r6, [fp, #4]
 85c:	e5d64000 	ldrb	r4, [r6]
 860:	e3540000 	cmp	r4, #0
 864:	0a00002b 	beq	918 <printf+0xd0>
 868:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 86c:	e28b8008 	add	r8, fp, #8
  state = 0;
 870:	e3a05000 	mov	r5, #0
 874:	ea00000a 	b	8a4 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 878:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 87c:	01a05004 	moveq	r5, r4
      if(c == '%'){
 880:	0a000004 	beq	898 <printf+0x50>
  write(fd, &c, 1);
 884:	e3a02001 	mov	r2, #1
 888:	e24b1019 	sub	r1, fp, #25
 88c:	e1a00007 	mov	r0, r7
 890:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 894:	ebfffed3 	bl	3e8 <write>
  for(i = 0; fmt[i]; i++){
 898:	e5f64001 	ldrb	r4, [r6, #1]!
 89c:	e3540000 	cmp	r4, #0
 8a0:	0a00001c 	beq	918 <printf+0xd0>
    if(state == 0){
 8a4:	e3550000 	cmp	r5, #0
 8a8:	0afffff2 	beq	878 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8ac:	e3550025 	cmp	r5, #37	; 0x25
 8b0:	1afffff8 	bne	898 <printf+0x50>
      if(c == 'd'){
 8b4:	e3540064 	cmp	r4, #100	; 0x64
 8b8:	0a000021 	beq	944 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8bc:	e20430f7 	and	r3, r4, #247	; 0xf7
 8c0:	e3530070 	cmp	r3, #112	; 0x70
 8c4:	0a000017 	beq	928 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c8:	e3540073 	cmp	r4, #115	; 0x73
 8cc:	0a00002e 	beq	98c <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8d0:	e3540063 	cmp	r4, #99	; 0x63
 8d4:	0a000021 	beq	960 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d8:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 8dc:	e3a02001 	mov	r2, #1
 8e0:	e24b1019 	sub	r1, fp, #25
 8e4:	e1a00007 	mov	r0, r7
 8e8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 8ec:	0a000023 	beq	980 <printf+0x138>
  write(fd, &c, 1);
 8f0:	ebfffebc 	bl	3e8 <write>
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e24b1019 	sub	r1, fp, #25
 8fc:	e1a00007 	mov	r0, r7
 900:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 904:	ebfffeb7 	bl	3e8 <write>
  for(i = 0; fmt[i]; i++){
 908:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 90c:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 910:	e3540000 	cmp	r4, #0
 914:	1affffe2 	bne	8a4 <printf+0x5c>
    }
  }
}
 918:	e24bd018 	sub	sp, fp, #24
 91c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 920:	e28dd00c 	add	sp, sp, #12
 924:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 928:	e3a03000 	mov	r3, #0
 92c:	e3a02010 	mov	r2, #16
 930:	e4981004 	ldr	r1, [r8], #4
 934:	e1a00007 	mov	r0, r7
 938:	ebffff7a 	bl	728 <printint>
      state = 0;
 93c:	e3a05000 	mov	r5, #0
 940:	eaffffd4 	b	898 <printf+0x50>
        printint(fd, *ap, 10, 1);
 944:	e3a03001 	mov	r3, #1
 948:	e3a0200a 	mov	r2, #10
 94c:	e4981004 	ldr	r1, [r8], #4
 950:	e1a00007 	mov	r0, r7
 954:	ebffff73 	bl	728 <printint>
      state = 0;
 958:	e3a05000 	mov	r5, #0
 95c:	eaffffcd 	b	898 <printf+0x50>
        putc(fd, *ap);
 960:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 964:	e3a02001 	mov	r2, #1
 968:	e24b1019 	sub	r1, fp, #25
 96c:	e1a00007 	mov	r0, r7
      state = 0;
 970:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 974:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 978:	ebfffe9a 	bl	3e8 <write>
        ap++;
 97c:	eaffffc5 	b	898 <printf+0x50>
  write(fd, &c, 1);
 980:	ebfffe98 	bl	3e8 <write>
      state = 0;
 984:	e3a05000 	mov	r5, #0
 988:	eaffffc2 	b	898 <printf+0x50>
        s = (char*)*ap;
 98c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 990:	e3540000 	cmp	r4, #0
 994:	0a00000b 	beq	9c8 <printf+0x180>
        while(*s != 0){
 998:	e5d45000 	ldrb	r5, [r4]
 99c:	e3550000 	cmp	r5, #0
 9a0:	0affffbc 	beq	898 <printf+0x50>
  write(fd, &c, 1);
 9a4:	e3a02001 	mov	r2, #1
 9a8:	e24b1019 	sub	r1, fp, #25
 9ac:	e1a00007 	mov	r0, r7
 9b0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9b4:	ebfffe8b 	bl	3e8 <write>
        while(*s != 0){
 9b8:	e5f45001 	ldrb	r5, [r4, #1]!
 9bc:	e3550000 	cmp	r5, #0
 9c0:	1afffff7 	bne	9a4 <printf+0x15c>
 9c4:	eaffffb3 	b	898 <printf+0x50>
          s = "(null)";
 9c8:	e3004b90 	movw	r4, #2960	; 0xb90
        while(*s != 0){
 9cc:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9d0:	e3404000 	movt	r4, #0
 9d4:	eafffff2 	b	9a4 <printf+0x15c>

000009d8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d8:	e300cb98 	movw	ip, #2968	; 0xb98
 9dc:	e340c000 	movt	ip, #0
{
 9e0:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9e4:	e2401008 	sub	r1, r0, #8
{
 9e8:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ec:	e59c3000 	ldr	r3, [ip]
 9f0:	ea000004 	b	a08 <free+0x30>
 9f4:	e1510002 	cmp	r1, r2
 9f8:	3a000009 	bcc	a24 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9fc:	e1530002 	cmp	r3, r2
 a00:	2a000007 	bcs	a24 <free+0x4c>
{
 a04:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a08:	e1530001 	cmp	r3, r1
 a0c:	e5932000 	ldr	r2, [r3]
 a10:	3afffff7 	bcc	9f4 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	e1530002 	cmp	r3, r2
 a18:	3afffff9 	bcc	a04 <free+0x2c>
 a1c:	e1510002 	cmp	r1, r2
 a20:	2afffff7 	bcs	a04 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a24:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a28:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a2c:	e081418e 	add	r4, r1, lr, lsl #3
 a30:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a34:	05922004 	ldreq	r2, [r2, #4]
 a38:	0082e00e 	addeq	lr, r2, lr
 a3c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a40:	05932000 	ldreq	r2, [r3]
 a44:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a48:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a4c:	e5932004 	ldr	r2, [r3, #4]
 a50:	e083e182 	add	lr, r3, r2, lsl #3
 a54:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a58:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a5c:	05101004 	ldreq	r1, [r0, #-4]
 a60:	00812002 	addeq	r2, r1, r2
 a64:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a68:	05102008 	ldreq	r2, [r0, #-8]
 a6c:	05832000 	streq	r2, [r3]
}
 a70:	e8bd8810 	pop	{r4, fp, pc}

00000a74 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a74:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a78:	e3007b98 	movw	r7, #2968	; 0xb98
 a7c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a80:	e2804007 	add	r4, r0, #7
{
 a84:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a88:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a8c:	e1a041a4 	lsr	r4, r4, #3
 a90:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a94:	e3510000 	cmp	r1, #0
 a98:	0a000029 	beq	b44 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9c:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 aa0:	e5932004 	ldr	r2, [r3, #4]
 aa4:	e1520004 	cmp	r2, r4
 aa8:	2a000019 	bcs	b14 <malloc+0xa0>
 aac:	e3540a01 	cmp	r4, #4096	; 0x1000
 ab0:	21a05004 	movcs	r5, r4
 ab4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ab8:	e1a06185 	lsl	r6, r5, #3
 abc:	ea000005 	b	ad8 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ac4:	e5902004 	ldr	r2, [r0, #4]
 ac8:	e1520004 	cmp	r2, r4
 acc:	2a000012 	bcs	b1c <malloc+0xa8>
 ad0:	e5971000 	ldr	r1, [r7]
 ad4:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ad8:	e1510003 	cmp	r1, r3
 adc:	1afffff7 	bne	ac0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ae0:	e1a00006 	mov	r0, r6
 ae4:	ebfffee8 	bl	68c <sbrk>
 ae8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 aec:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 af0:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 af4:	0a000004 	beq	b0c <malloc+0x98>
  hp->s.size = nu;
 af8:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 afc:	ebffffb5 	bl	9d8 <free>
  return freep;
 b00:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b04:	e3530000 	cmp	r3, #0
 b08:	1affffec 	bne	ac0 <malloc+0x4c>
        return 0;
 b0c:	e3a00000 	mov	r0, #0
  }
}
 b10:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b14:	e1a00003 	mov	r0, r3
 b18:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 b1c:	e1540002 	cmp	r4, r2
      freep = prevp;
 b20:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b24:	10422004 	subne	r2, r2, r4
 b28:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b2c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b30:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b34:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b38:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b3c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b40:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b44:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 b48:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b4c:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 b50:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 b54:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 b58:	eaffffd3 	b	aac <malloc+0x38>
