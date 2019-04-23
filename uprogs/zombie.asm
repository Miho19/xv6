
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
  18:	eb00019b 	bl	68c <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3001b2c 	movw	r1, #2860	; 0xb2c
  20:	e3a00002 	mov	r0, #2
  24:	e3401000 	movt	r1, #0
  28:	eb0001f9 	bl	814 <printf>
    exit();
  2c:	eb0000ac 	bl	2e4 <exit>
  }
  printf(2, "Child exits!\n");
  30:	e3001b3c 	movw	r1, #2876	; 0xb3c
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb0001f4 	bl	814 <printf>
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
  8c:	e3530000 	cmp	r3, #0
  90:	0a000006 	beq	b0 <strcmp+0x44>
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e1530002 	cmp	r3, r2
  9c:	0afffff9 	beq	88 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a0:	e0430002 	sub	r0, r3, r2
  a4:	e28bd000 	add	sp, fp, #0
  a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ac:	e12fff1e 	bx	lr
  b0:	e5d12001 	ldrb	r2, [r1, #1]
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
  d4:	0a000009 	beq	100 <strlen+0x3c>
  d8:	e1a02000 	mov	r2, r0
  dc:	e3a03000 	mov	r3, #0
  e0:	e5f21001 	ldrb	r1, [r2, #1]!
  e4:	e2833001 	add	r3, r3, #1
  e8:	e3510000 	cmp	r1, #0
  ec:	e1a00003 	mov	r0, r3
  f0:	1afffffa 	bne	e0 <strlen+0x1c>
    ;
  return n;
}
  f4:	e28bd000 	add	sp, fp, #0
  f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  fc:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 100:	e1a00003 	mov	r0, r3
 104:	eafffffa 	b	f4 <strlen+0x30>

00000108 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 108:	e3520000 	cmp	r2, #0
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 114:	0a000004 	beq	12c <memset+0x24>
 118:	e6ef1071 	uxtb	r1, r1
 11c:	e0802002 	add	r2, r0, r2
 120:	e4c01001 	strb	r1, [r0], #1
 124:	e1520000 	cmp	r2, r0
 128:	1afffffc 	bne	120 <memset+0x18>
  return (void *)p;
}
 12c:	e28bd000 	add	sp, fp, #0
 130:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 134:	e12fff1e 	bx	lr

00000138 <strchr>:

char*
strchr(const char *s, char c)
{
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 140:	e5d02000 	ldrb	r2, [r0]
 144:	e3520000 	cmp	r2, #0
 148:	0a00000b 	beq	17c <strchr+0x44>
    if(*s == c)
 14c:	e1510002 	cmp	r1, r2
 150:	1a000002 	bne	160 <strchr+0x28>
 154:	ea000005 	b	170 <strchr+0x38>
 158:	e1530001 	cmp	r3, r1
 15c:	0a000003 	beq	170 <strchr+0x38>
  for(; *s; s++)
 160:	e5f03001 	ldrb	r3, [r0, #1]!
 164:	e3530000 	cmp	r3, #0
 168:	1afffffa 	bne	158 <strchr+0x20>
      return (char*)s;
  return 0;
 16c:	e1a00003 	mov	r0, r3
}
 170:	e28bd000 	add	sp, fp, #0
 174:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 178:	e12fff1e 	bx	lr
  return 0;
 17c:	e1a00002 	mov	r0, r2
 180:	eafffffa 	b	170 <strchr+0x38>

00000184 <gets>:

char*
gets(char *buf, int max)
{
 184:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 188:	e1a08000 	mov	r8, r0
 18c:	e28db018 	add	fp, sp, #24
 190:	e1a07001 	mov	r7, r1
 194:	e24dd00c 	sub	sp, sp, #12
 198:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19c:	e3a05000 	mov	r5, #0
 1a0:	ea000008 	b	1c8 <gets+0x44>
    cc = read(0, &c, 1);
 1a4:	eb000075 	bl	380 <read>
    if(cc < 1)
 1a8:	e3500000 	cmp	r0, #0
 1ac:	da00000b 	ble	1e0 <gets+0x5c>
      break;
    buf[i++] = c;
 1b0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1b4:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1b8:	e353000d 	cmp	r3, #13
 1bc:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 1c0:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1c4:	0a000005 	beq	1e0 <gets+0x5c>
    cc = read(0, &c, 1);
 1c8:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1cc:	e0854002 	add	r4, r5, r2
 1d0:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1d4:	e24b101d 	sub	r1, fp, #29
 1d8:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 1dc:	bafffff0 	blt	1a4 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 1e0:	e3a03000 	mov	r3, #0
  return buf;
}
 1e4:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 1e8:	e7c83005 	strb	r3, [r8, r5]
}
 1ec:	e24bd018 	sub	sp, fp, #24
 1f0:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

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
 204:	eb00009e 	bl	484 <open>
  if(fd < 0)
 208:	e2505000 	subs	r5, r0, #0
 20c:	ba000006 	blt	22c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 210:	e1a01004 	mov	r1, r4
 214:	eb0000c1 	bl	520 <fstat>
 218:	e1a04000 	mov	r4, r0
  close(fd);
 21c:	e1a00005 	mov	r0, r5
 220:	eb000070 	bl	3e8 <close>
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
 248:	e3a03000 	mov	r3, #0
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

0000034c <pipe>:
 34c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 350:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 354:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 358:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 35c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 360:	e3a00004 	mov	r0, #4
 364:	ef000040 	svc	0x00000040
 368:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 374:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 378:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 37c:	e12fff1e 	bx	lr

00000380 <read>:
 380:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 384:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 388:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 38c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 390:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 394:	e3a00005 	mov	r0, #5
 398:	ef000040 	svc	0x00000040
 39c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b0:	e12fff1e 	bx	lr

000003b4 <write>:
 3b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c8:	e3a00010 	mov	r0, #16
 3cc:	ef000040 	svc	0x00000040
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e4:	e12fff1e 	bx	lr

000003e8 <close>:
 3e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3fc:	e3a00015 	mov	r0, #21
 400:	ef000040 	svc	0x00000040
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 410:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 414:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 418:	e12fff1e 	bx	lr

0000041c <kill>:
 41c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 420:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 424:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 428:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 42c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 430:	e3a00006 	mov	r0, #6
 434:	ef000040 	svc	0x00000040
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 444:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 448:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 44c:	e12fff1e 	bx	lr

00000450 <exec>:
 450:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 454:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 458:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 45c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 460:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 464:	e3a00007 	mov	r0, #7
 468:	ef000040 	svc	0x00000040
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 478:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 47c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 480:	e12fff1e 	bx	lr

00000484 <open>:
 484:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 488:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 48c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 490:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 494:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 498:	e3a0000f 	mov	r0, #15
 49c:	ef000040 	svc	0x00000040
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b4:	e12fff1e 	bx	lr

000004b8 <mknod>:
 4b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4cc:	e3a00011 	mov	r0, #17
 4d0:	ef000040 	svc	0x00000040
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e8:	e12fff1e 	bx	lr

000004ec <unlink>:
 4ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 500:	e3a00012 	mov	r0, #18
 504:	ef000040 	svc	0x00000040
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 514:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 518:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 51c:	e12fff1e 	bx	lr

00000520 <fstat>:
 520:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 524:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 528:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 52c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 530:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 534:	e3a00008 	mov	r0, #8
 538:	ef000040 	svc	0x00000040
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 548:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 54c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 550:	e12fff1e 	bx	lr

00000554 <link>:
 554:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 558:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 55c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 560:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 564:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 568:	e3a00013 	mov	r0, #19
 56c:	ef000040 	svc	0x00000040
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 57c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 580:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 584:	e12fff1e 	bx	lr

00000588 <mkdir>:
 588:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 58c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 590:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 594:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 598:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 59c:	e3a00014 	mov	r0, #20
 5a0:	ef000040 	svc	0x00000040
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b8:	e12fff1e 	bx	lr

000005bc <chdir>:
 5bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d0:	e3a00009 	mov	r0, #9
 5d4:	ef000040 	svc	0x00000040
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ec:	e12fff1e 	bx	lr

000005f0 <dup>:
 5f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 604:	e3a0000a 	mov	r0, #10
 608:	ef000040 	svc	0x00000040
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 618:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 61c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 620:	e12fff1e 	bx	lr

00000624 <getpid>:
 624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 628:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 62c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 630:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 634:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 638:	e3a0000b 	mov	r0, #11
 63c:	ef000040 	svc	0x00000040
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 64c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 650:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 654:	e12fff1e 	bx	lr

00000658 <sbrk>:
 658:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 65c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 660:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 664:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 668:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 66c:	e3a0000c 	mov	r0, #12
 670:	ef000040 	svc	0x00000040
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 680:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 688:	e12fff1e 	bx	lr

0000068c <sleep>:
 68c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 690:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 694:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 698:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 69c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a0:	e3a0000d 	mov	r0, #13
 6a4:	ef000040 	svc	0x00000040
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6bc:	e12fff1e 	bx	lr

000006c0 <uptime>:
 6c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d4:	e3a0000e 	mov	r0, #14
 6d8:	ef000040 	svc	0x00000040
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f0:	e12fff1e 	bx	lr

000006f4 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6f4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 6f8:	e1a09fa1 	lsr	r9, r1, #31
 6fc:	e3530000 	cmp	r3, #0
 700:	03a09000 	moveq	r9, #0
 704:	12099001 	andne	r9, r9, #1
{
 708:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 70c:	e3590000 	cmp	r9, #0
 710:	e3008b4c 	movw	r8, #2892	; 0xb4c
    neg = 1;
    x = -xx;
 714:	1261e000 	rsbne	lr, r1, #0
 718:	e3408000 	movt	r8, #0
 71c:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 720:	e1a04000 	mov	r4, r0
    neg = 1;
 724:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 728:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 72c:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 730:	e3a05001 	mov	r5, #1
{
 734:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 738:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 73c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 740:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 744:	e1a0033e 	lsr	r0, lr, r3
 748:	e2000001 	and	r0, r0, #1
 74c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 750:	e1520001 	cmp	r2, r1
            r = r - d;
 754:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 758:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 75c:	e2533001 	subs	r3, r3, #1
 760:	2afffff7 	bcs	744 <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 764:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 768:	e35c0000 	cmp	ip, #0
 76c:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 770:	e2873001 	add	r3, r7, #1
 774:	e7d81001 	ldrb	r1, [r8, r1]
 778:	e5e61001 	strb	r1, [r6, #1]!
 77c:	11a07003 	movne	r7, r3
 780:	1affffec 	bne	738 <printint+0x44>
  if(neg)
 784:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 788:	124b201c 	subne	r2, fp, #28
 78c:	10822003 	addne	r2, r2, r3
 790:	13a0102d 	movne	r1, #45	; 0x2d
 794:	12873002 	addne	r3, r7, #2
 798:	15421010 	strbne	r1, [r2, #-16]
 79c:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 7a0:	e2435001 	sub	r5, r3, #1
 7a4:	e0826003 	add	r6, r2, r3
 7a8:	e5763001 	ldrb	r3, [r6, #-1]!
 7ac:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 7b0:	e3a02001 	mov	r2, #1
 7b4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7b8:	e1a00004 	mov	r0, r4
 7bc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7c0:	ebfffefb 	bl	3b4 <write>
  while(--i >= 0)
 7c4:	e3750001 	cmn	r5, #1
 7c8:	1afffff6 	bne	7a8 <printint+0xb4>
    putc(fd, buf[i]);
}
 7cc:	e24bd01c 	sub	sp, fp, #28
 7d0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007d4 <div>:
{
 7d4:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7d8:	e3a02000 	mov	r2, #0
{
 7dc:	e28db008 	add	fp, sp, #8
 7e0:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 7e4:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7e8:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 7ec:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 7f0:	e1a0c33e 	lsr	ip, lr, r3
 7f4:	e20cc001 	and	ip, ip, #1
 7f8:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 7fc:	e1520001 	cmp	r2, r1
            r = r - d;
 800:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 804:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 808:	e2533001 	subs	r3, r3, #1
 80c:	2afffff7 	bcs	7f0 <div+0x1c>
}
 810:	e8bd8810 	pop	{r4, fp, pc}

00000814 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 814:	e92d000e 	push	{r1, r2, r3}
 818:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 81c:	e28db018 	add	fp, sp, #24
 820:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 824:	e59b6004 	ldr	r6, [fp, #4]
 828:	e5d64000 	ldrb	r4, [r6]
 82c:	e3540000 	cmp	r4, #0
 830:	0a00002b 	beq	8e4 <printf+0xd0>
 834:	e1a07000 	mov	r7, r0
 838:	e28b8008 	add	r8, fp, #8
 83c:	e3a05000 	mov	r5, #0
 840:	ea00000a 	b	870 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 844:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 848:	01a05004 	moveq	r5, r4
      if(c == '%'){
 84c:	0a000004 	beq	864 <printf+0x50>
 850:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 854:	e3a02001 	mov	r2, #1
 858:	e1a00007 	mov	r0, r7
 85c:	e5614006 	strb	r4, [r1, #-6]!
 860:	ebfffed3 	bl	3b4 <write>
  for(i = 0; fmt[i]; i++){
 864:	e5f64001 	ldrb	r4, [r6, #1]!
 868:	e3540000 	cmp	r4, #0
 86c:	0a00001c 	beq	8e4 <printf+0xd0>
    if(state == 0){
 870:	e3550000 	cmp	r5, #0
 874:	0afffff2 	beq	844 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 878:	e3550025 	cmp	r5, #37	; 0x25
 87c:	1afffff8 	bne	864 <printf+0x50>
      if(c == 'd'){
 880:	e3540064 	cmp	r4, #100	; 0x64
 884:	0a000037 	beq	968 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 888:	e20430f7 	and	r3, r4, #247	; 0xf7
 88c:	e3530070 	cmp	r3, #112	; 0x70
 890:	0a000017 	beq	8f4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 894:	e3540073 	cmp	r4, #115	; 0x73
 898:	0a00001c 	beq	910 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 89c:	e3540063 	cmp	r4, #99	; 0x63
 8a0:	0a000037 	beq	984 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8a4:	e3540025 	cmp	r4, #37	; 0x25
 8a8:	0a000027 	beq	94c <printf+0x138>
  write(fd, &c, 1);
 8ac:	e3a02001 	mov	r2, #1
 8b0:	e24b1019 	sub	r1, fp, #25
 8b4:	e1a00007 	mov	r0, r7
 8b8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8bc:	ebfffebc 	bl	3b4 <write>
 8c0:	e3a02001 	mov	r2, #1
 8c4:	e24b101a 	sub	r1, fp, #26
 8c8:	e1a00007 	mov	r0, r7
 8cc:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8d0:	ebfffeb7 	bl	3b4 <write>
  for(i = 0; fmt[i]; i++){
 8d4:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8d8:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 8dc:	e3540000 	cmp	r4, #0
 8e0:	1affffe2 	bne	870 <printf+0x5c>
    }
  }
}
 8e4:	e24bd018 	sub	sp, fp, #24
 8e8:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 8ec:	e28dd00c 	add	sp, sp, #12
 8f0:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 8f4:	e3a03000 	mov	r3, #0
 8f8:	e3a02010 	mov	r2, #16
 8fc:	e4981004 	ldr	r1, [r8], #4
 900:	e1a00007 	mov	r0, r7
 904:	ebffff7a 	bl	6f4 <printint>
      state = 0;
 908:	e3a05000 	mov	r5, #0
 90c:	eaffffd4 	b	864 <printf+0x50>
        s = (char*)*ap;
 910:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 914:	e3540000 	cmp	r4, #0
 918:	0a000021 	beq	9a4 <printf+0x190>
        while(*s != 0){
 91c:	e5d45000 	ldrb	r5, [r4]
 920:	e3550000 	cmp	r5, #0
 924:	0affffce 	beq	864 <printf+0x50>
  write(fd, &c, 1);
 928:	e3a02001 	mov	r2, #1
 92c:	e24b101d 	sub	r1, fp, #29
 930:	e1a00007 	mov	r0, r7
 934:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 938:	ebfffe9d 	bl	3b4 <write>
        while(*s != 0){
 93c:	e5f45001 	ldrb	r5, [r4, #1]!
 940:	e3550000 	cmp	r5, #0
 944:	1afffff7 	bne	928 <printf+0x114>
 948:	eaffffc5 	b	864 <printf+0x50>
 94c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 950:	e3a02001 	mov	r2, #1
 954:	e1a00007 	mov	r0, r7
 958:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 95c:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 960:	ebfffe93 	bl	3b4 <write>
 964:	eaffffbe 	b	864 <printf+0x50>
        printint(fd, *ap, 10, 1);
 968:	e3a03001 	mov	r3, #1
 96c:	e3a0200a 	mov	r2, #10
 970:	e4981004 	ldr	r1, [r8], #4
 974:	e1a00007 	mov	r0, r7
 978:	ebffff5d 	bl	6f4 <printint>
      state = 0;
 97c:	e3a05000 	mov	r5, #0
 980:	eaffffb7 	b	864 <printf+0x50>
        putc(fd, *ap);
 984:	e4983004 	ldr	r3, [r8], #4
 988:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 98c:	e3a02001 	mov	r2, #1
 990:	e1a00007 	mov	r0, r7
      state = 0;
 994:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 998:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 99c:	ebfffe84 	bl	3b4 <write>
 9a0:	eaffffaf 	b	864 <printf+0x50>
          s = "(null)";
 9a4:	e3004b60 	movw	r4, #2912	; 0xb60
        while(*s != 0){
 9a8:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9ac:	e3404000 	movt	r4, #0
 9b0:	eaffffdc 	b	928 <printf+0x114>

000009b4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b4:	e300cb68 	movw	ip, #2920	; 0xb68
 9b8:	e340c000 	movt	ip, #0
{
 9bc:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9c0:	e2401008 	sub	r1, r0, #8
{
 9c4:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c8:	e59c3000 	ldr	r3, [ip]
 9cc:	ea000004 	b	9e4 <free+0x30>
 9d0:	e1510002 	cmp	r1, r2
 9d4:	3a000009 	bcc	a00 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d8:	e1530002 	cmp	r3, r2
 9dc:	2a000007 	bcs	a00 <free+0x4c>
{
 9e0:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e4:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e8:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ec:	3afffff7 	bcc	9d0 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f0:	e1530002 	cmp	r3, r2
 9f4:	3afffff9 	bcc	9e0 <free+0x2c>
 9f8:	e1510002 	cmp	r1, r2
 9fc:	2afffff7 	bcs	9e0 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a00:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a04:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a08:	e081418e 	add	r4, r1, lr, lsl #3
 a0c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a10:	05922004 	ldreq	r2, [r2, #4]
 a14:	0082e00e 	addeq	lr, r2, lr
 a18:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a1c:	05932000 	ldreq	r2, [r3]
 a20:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a24:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a28:	e5932004 	ldr	r2, [r3, #4]
 a2c:	e083e182 	add	lr, r3, r2, lsl #3
 a30:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a34:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a38:	05101004 	ldreq	r1, [r0, #-4]
 a3c:	00812002 	addeq	r2, r1, r2
 a40:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a44:	05102008 	ldreq	r2, [r0, #-8]
 a48:	05832000 	streq	r2, [r3]
}
 a4c:	e8bd8810 	pop	{r4, fp, pc}

00000a50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a50:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a54:	e3007b68 	movw	r7, #2920	; 0xb68
 a58:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5c:	e2804007 	add	r4, r0, #7
{
 a60:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a64:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a68:	e1a041a4 	lsr	r4, r4, #3
 a6c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a70:	e3530000 	cmp	r3, #0
 a74:	0a000027 	beq	b18 <malloc+0xc8>
 a78:	e5930000 	ldr	r0, [r3]
 a7c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a80:	e1540002 	cmp	r4, r2
 a84:	9a000019 	bls	af0 <malloc+0xa0>
 a88:	e3540a01 	cmp	r4, #4096	; 0x1000
 a8c:	21a05004 	movcs	r5, r4
 a90:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 a94:	e1a06185 	lsl	r6, r5, #3
 a98:	ea000003 	b	aac <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 aa0:	e5902004 	ldr	r2, [r0, #4]
 aa4:	e1540002 	cmp	r4, r2
 aa8:	9a000010 	bls	af0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aac:	e5972000 	ldr	r2, [r7]
 ab0:	e1a03000 	mov	r3, r0
 ab4:	e1520000 	cmp	r2, r0
 ab8:	1afffff7 	bne	a9c <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 abc:	e1a00006 	mov	r0, r6
 ac0:	ebfffee4 	bl	658 <sbrk>
 ac4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ac8:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 acc:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 ad0:	0a000004 	beq	ae8 <malloc+0x98>
  hp->s.size = nu;
 ad4:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 ad8:	ebffffb5 	bl	9b4 <free>
  return freep;
 adc:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 ae0:	e3530000 	cmp	r3, #0
 ae4:	1affffec 	bne	a9c <malloc+0x4c>
        return 0;
 ae8:	e3a00000 	mov	r0, #0
  }
}
 aec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 af0:	e1540002 	cmp	r4, r2
      freep = prevp;
 af4:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 af8:	10422004 	subne	r2, r2, r4
 afc:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b00:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b04:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b08:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b0c:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b10:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b14:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b18:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b1c:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b20:	e5870000 	str	r0, [r7]
 b24:	e5870004 	str	r0, [r7, #4]
 b28:	eaffffd6 	b	a88 <malloc+0x38>
