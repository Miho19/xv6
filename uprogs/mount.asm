
_mount:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"
#include "fs.h"


int main(int argc, char *argv[]) {
   0:	e92d4800 	push	{fp, lr}

	int result = 0;	
	result = mount("/usb");
   4:	e3000b80 	movw	r0, #2944	; 0xb80
int main(int argc, char *argv[]) {
   8:	e28db004 	add	fp, sp, #4
	result = mount("/usb");
   c:	e3400000 	movt	r0, #0
  10:	eb0000d6 	bl	370 <mount>
	printf(1, "mount %s\n", result == 0 ? "SUCCESS" : "FAILURE");
  14:	e3003b78 	movw	r3, #2936	; 0xb78
  18:	e3403000 	movt	r3, #0
  1c:	e3002b70 	movw	r2, #2928	; 0xb70
  20:	e3001b88 	movw	r1, #2952	; 0xb88
  24:	e3402000 	movt	r2, #0
  28:	e3401000 	movt	r1, #0
  2c:	e3500000 	cmp	r0, #0
  30:	e3a00001 	mov	r0, #1
  34:	11a02003 	movne	r2, r3
  38:	eb000206 	bl	858 <printf>
	exit();	
  3c:	eb0000a4 	bl	2d4 <exit>

00000040 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  44:	e2402001 	sub	r2, r0, #1
  48:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  4c:	e4d13001 	ldrb	r3, [r1], #1
  50:	e3530000 	cmp	r3, #0
  54:	e5e23001 	strb	r3, [r2, #1]!
  58:	1afffffb 	bne	4c <strcpy+0xc>
    ;
  return os;
}
  5c:	e28bd000 	add	sp, fp, #0
  60:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  64:	e12fff1e 	bx	lr

00000068 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  6c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  70:	e5d03000 	ldrb	r3, [r0]
  74:	e5d12000 	ldrb	r2, [r1]
  78:	e3530000 	cmp	r3, #0
  7c:	1a000004 	bne	94 <strcmp+0x2c>
  80:	ea000005 	b	9c <strcmp+0x34>
  84:	e5f03001 	ldrb	r3, [r0, #1]!
  88:	e5f12001 	ldrb	r2, [r1, #1]!
  8c:	e3530000 	cmp	r3, #0
  90:	0a000001 	beq	9c <strcmp+0x34>
  94:	e1530002 	cmp	r3, r2
  98:	0afffff9 	beq	84 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  9c:	e0430002 	sub	r0, r3, r2
  a0:	e28bd000 	add	sp, fp, #0
  a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  a8:	e12fff1e 	bx	lr

000000ac <strlen>:

uint
strlen(char *s)
{
  ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  b0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  b4:	e5d03000 	ldrb	r3, [r0]
  b8:	e3530000 	cmp	r3, #0
  bc:	01a00003 	moveq	r0, r3
  c0:	0a000006 	beq	e0 <strlen+0x34>
  c4:	e1a02000 	mov	r2, r0
  c8:	e3a03000 	mov	r3, #0
  cc:	e5f21001 	ldrb	r1, [r2, #1]!
  d0:	e2833001 	add	r3, r3, #1
  d4:	e3510000 	cmp	r1, #0
  d8:	e1a00003 	mov	r0, r3
  dc:	1afffffa 	bne	cc <strlen+0x20>
    ;
  return n;
}
  e0:	e28bd000 	add	sp, fp, #0
  e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  e8:	e12fff1e 	bx	lr

000000ec <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
  ec:	e3520000 	cmp	r2, #0
{
  f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f4:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
  f8:	0a000004 	beq	110 <memset+0x24>
  fc:	e6ef1071 	uxtb	r1, r1
 100:	e0802002 	add	r2, r0, r2
 104:	e4c01001 	strb	r1, [r0], #1
 108:	e1520000 	cmp	r2, r0
 10c:	1afffffc 	bne	104 <memset+0x18>
  return (void *)p;
}
 110:	e28bd000 	add	sp, fp, #0
 114:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 118:	e12fff1e 	bx	lr

0000011c <strchr>:

char*
strchr(const char *s, char c)
{
 11c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 120:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 124:	e5d02000 	ldrb	r2, [r0]
 128:	e3520000 	cmp	r2, #0
 12c:	0a00000b 	beq	160 <strchr+0x44>
    if(*s == c)
 130:	e1510002 	cmp	r1, r2
 134:	1a000002 	bne	144 <strchr+0x28>
 138:	ea000005 	b	154 <strchr+0x38>
 13c:	e1530001 	cmp	r3, r1
 140:	0a000003 	beq	154 <strchr+0x38>
  for(; *s; s++)
 144:	e5f03001 	ldrb	r3, [r0, #1]!
 148:	e3530000 	cmp	r3, #0
 14c:	1afffffa 	bne	13c <strchr+0x20>
      return (char*)s;
  return 0;
 150:	e1a00003 	mov	r0, r3
}
 154:	e28bd000 	add	sp, fp, #0
 158:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 15c:	e12fff1e 	bx	lr
  return 0;
 160:	e1a00002 	mov	r0, r2
 164:	eafffffa 	b	154 <strchr+0x38>

00000168 <gets>:

char*
gets(char *buf, int max)
{
 168:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 16c:	e1a03000 	mov	r3, r0
 170:	e28db014 	add	fp, sp, #20
 174:	e1a07000 	mov	r7, r0
 178:	e24dd008 	sub	sp, sp, #8
 17c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 180:	e3a04000 	mov	r4, #0
 184:	ea000008 	b	1ac <gets+0x44>
    cc = read(0, &c, 1);
 188:	eb000092 	bl	3d8 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 18c:	e1a03005 	mov	r3, r5
    if(cc < 1)
 190:	e3500000 	cmp	r0, #0
 194:	da00000b 	ble	1c8 <gets+0x60>
    buf[i++] = c;
 198:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 19c:	e352000d 	cmp	r2, #13
 1a0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1a4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1a8:	0a00000b 	beq	1dc <gets+0x74>
    cc = read(0, &c, 1);
 1ac:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1b0:	e0844002 	add	r4, r4, r2
 1b4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1b8:	e24b1015 	sub	r1, fp, #21
 1bc:	e3a00000 	mov	r0, #0
 1c0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1c4:	baffffef 	blt	188 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1c8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1cc:	e3a03000 	mov	r3, #0
 1d0:	e5c53000 	strb	r3, [r5]
}
 1d4:	e24bd014 	sub	sp, fp, #20
 1d8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1dc:	e0875004 	add	r5, r7, r4
 1e0:	eafffff8 	b	1c8 <gets+0x60>

000001e4 <stat>:

int
stat(char *n, struct stat *st)
{
 1e4:	e92d4830 	push	{r4, r5, fp, lr}
 1e8:	e1a04001 	mov	r4, r1
 1ec:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f0:	e3a01000 	mov	r1, #0
 1f4:	eb0000b8 	bl	4dc <open>
  if(fd < 0)
 1f8:	e2505000 	subs	r5, r0, #0
 1fc:	ba000006 	blt	21c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 200:	e1a01004 	mov	r1, r4
 204:	eb0000db 	bl	578 <fstat>
 208:	e1a04000 	mov	r4, r0
  close(fd);
 20c:	e1a00005 	mov	r0, r5
 210:	eb00008a 	bl	440 <close>
  return r;
}
 214:	e1a00004 	mov	r0, r4
 218:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 21c:	e3e04000 	mvn	r4, #0
 220:	eafffffb 	b	214 <stat+0x30>

00000224 <atoi>:

int
atoi(const char *s)
{
 224:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 228:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22c:	e5d02000 	ldrb	r2, [r0]
 230:	e2423030 	sub	r3, r2, #48	; 0x30
 234:	e3530009 	cmp	r3, #9
  n = 0;
 238:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 23c:	8a000006 	bhi	25c <atoi+0x38>
    n = n*10 + *s++ - '0';
 240:	e3a0c00a 	mov	ip, #10
 244:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 248:	e5f02001 	ldrb	r2, [r0, #1]!
 24c:	e2421030 	sub	r1, r2, #48	; 0x30
 250:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 254:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 258:	9afffff9 	bls	244 <atoi+0x20>
  return n;
}
 25c:	e1a00003 	mov	r0, r3
 260:	e28bd000 	add	sp, fp, #0
 264:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 268:	e12fff1e 	bx	lr

0000026c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26c:	e3520000 	cmp	r2, #0
{
 270:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 274:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 278:	da000005 	ble	294 <memmove+0x28>
 27c:	e0812002 	add	r2, r1, r2
 280:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 284:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 288:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 28c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 290:	1afffffb 	bne	284 <memmove+0x18>
  return vdst;
}
 294:	e28bd000 	add	sp, fp, #0
 298:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 29c:	e12fff1e 	bx	lr

000002a0 <fork>:
 2a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2b4:	e3a00001 	mov	r0, #1
 2b8:	ef000040 	svc	0x00000040
 2bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2d0:	e12fff1e 	bx	lr

000002d4 <exit>:
 2d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2e8:	e3a00002 	mov	r0, #2
 2ec:	ef000040 	svc	0x00000040
 2f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 300:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 304:	e12fff1e 	bx	lr

00000308 <wait>:
 308:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 30c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 310:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 314:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 318:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 31c:	e3a00003 	mov	r0, #3
 320:	ef000040 	svc	0x00000040
 324:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 328:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 32c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 330:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 334:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 338:	e12fff1e 	bx	lr

0000033c <lseek>:
 33c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 340:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 344:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 348:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 34c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 350:	e3a00016 	mov	r0, #22
 354:	ef000040 	svc	0x00000040
 358:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 35c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 360:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 364:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 368:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 36c:	e12fff1e 	bx	lr

00000370 <mount>:
 370:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 374:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 378:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 37c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 380:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 384:	e3a00017 	mov	r0, #23
 388:	ef000040 	svc	0x00000040
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 398:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 39c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a0:	e12fff1e 	bx	lr

000003a4 <pipe>:
 3a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b8:	e3a00004 	mov	r0, #4
 3bc:	ef000040 	svc	0x00000040
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d4:	e12fff1e 	bx	lr

000003d8 <read>:
 3d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3ec:	e3a00005 	mov	r0, #5
 3f0:	ef000040 	svc	0x00000040
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 400:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 404:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 408:	e12fff1e 	bx	lr

0000040c <write>:
 40c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 410:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 414:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 418:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 41c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 420:	e3a00010 	mov	r0, #16
 424:	ef000040 	svc	0x00000040
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 434:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 43c:	e12fff1e 	bx	lr

00000440 <close>:
 440:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 444:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 448:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 44c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 450:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 454:	e3a00015 	mov	r0, #21
 458:	ef000040 	svc	0x00000040
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 468:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 46c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 470:	e12fff1e 	bx	lr

00000474 <kill>:
 474:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 478:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 47c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 480:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 484:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 488:	e3a00006 	mov	r0, #6
 48c:	ef000040 	svc	0x00000040
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 49c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a4:	e12fff1e 	bx	lr

000004a8 <exec>:
 4a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4bc:	e3a00007 	mov	r0, #7
 4c0:	ef000040 	svc	0x00000040
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d8:	e12fff1e 	bx	lr

000004dc <open>:
 4dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f0:	e3a0000f 	mov	r0, #15
 4f4:	ef000040 	svc	0x00000040
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 504:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 50c:	e12fff1e 	bx	lr

00000510 <mknod>:
 510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 514:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 518:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 51c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 520:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 524:	e3a00011 	mov	r0, #17
 528:	ef000040 	svc	0x00000040
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 538:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 53c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 540:	e12fff1e 	bx	lr

00000544 <unlink>:
 544:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 548:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 54c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 550:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 554:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 558:	e3a00012 	mov	r0, #18
 55c:	ef000040 	svc	0x00000040
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 56c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 570:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 574:	e12fff1e 	bx	lr

00000578 <fstat>:
 578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 57c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 580:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 584:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 588:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 58c:	e3a00008 	mov	r0, #8
 590:	ef000040 	svc	0x00000040
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a8:	e12fff1e 	bx	lr

000005ac <link>:
 5ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c0:	e3a00013 	mov	r0, #19
 5c4:	ef000040 	svc	0x00000040
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5dc:	e12fff1e 	bx	lr

000005e0 <mkdir>:
 5e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f4:	e3a00014 	mov	r0, #20
 5f8:	ef000040 	svc	0x00000040
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 608:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 60c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 610:	e12fff1e 	bx	lr

00000614 <chdir>:
 614:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 618:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 61c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 620:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 624:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 628:	e3a00009 	mov	r0, #9
 62c:	ef000040 	svc	0x00000040
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 63c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 640:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 644:	e12fff1e 	bx	lr

00000648 <dup>:
 648:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 64c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 650:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 654:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 658:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 65c:	e3a0000a 	mov	r0, #10
 660:	ef000040 	svc	0x00000040
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 670:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 674:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 678:	e12fff1e 	bx	lr

0000067c <getpid>:
 67c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 680:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 684:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 688:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 68c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 690:	e3a0000b 	mov	r0, #11
 694:	ef000040 	svc	0x00000040
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ac:	e12fff1e 	bx	lr

000006b0 <sbrk>:
 6b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c4:	e3a0000c 	mov	r0, #12
 6c8:	ef000040 	svc	0x00000040
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e0:	e12fff1e 	bx	lr

000006e4 <sleep>:
 6e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f8:	e3a0000d 	mov	r0, #13
 6fc:	ef000040 	svc	0x00000040
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 70c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 710:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 714:	e12fff1e 	bx	lr

00000718 <uptime>:
 718:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 71c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 720:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 724:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 728:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 72c:	e3a0000e 	mov	r0, #14
 730:	ef000040 	svc	0x00000040
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 740:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 744:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 748:	e12fff1e 	bx	lr

0000074c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 74c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 750:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 754:	e013afa1 	ands	sl, r3, r1, lsr #31
 758:	e24b4034 	sub	r4, fp, #52	; 0x34
 75c:	e3009b94 	movw	r9, #2964	; 0xb94
    neg = 1;
    x = -xx;
 760:	1261e000 	rsbne	lr, r1, #0
 764:	e3409000 	movt	r9, #0
{
 768:	e1a05000 	mov	r5, r0
    neg = 1;
 76c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 770:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 774:	e3a08000 	mov	r8, #0
  b = base;
 778:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 77c:	e3a06001 	mov	r6, #1
{
 780:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 784:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 788:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 78c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 790:	e1a0033e 	lsr	r0, lr, r3
 794:	e2000001 	and	r0, r0, #1
 798:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 79c:	e1520001 	cmp	r2, r1
            r = r - d;
 7a0:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 7a4:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7a8:	e2533001 	subs	r3, r3, #1
 7ac:	2afffff7 	bcs	790 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b0:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 7b4:	e35c0000 	cmp	ip, #0
 7b8:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7bc:	e2883001 	add	r3, r8, #1
 7c0:	e7d91001 	ldrb	r1, [r9, r1]
 7c4:	e4c71001 	strb	r1, [r7], #1
 7c8:	11a08003 	movne	r8, r3
 7cc:	1affffec 	bne	784 <printint+0x38>
  if(neg)
 7d0:	e35a0000 	cmp	sl, #0
 7d4:	0a000004 	beq	7ec <printint+0xa0>
    buf[i++] = '-';
 7d8:	e24b2024 	sub	r2, fp, #36	; 0x24
 7dc:	e3a0102d 	mov	r1, #45	; 0x2d
 7e0:	e0822003 	add	r2, r2, r3
 7e4:	e2883002 	add	r3, r8, #2
 7e8:	e5421010 	strb	r1, [r2, #-16]
 7ec:	e0846003 	add	r6, r4, r3
 7f0:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 7f4:	e3a02001 	mov	r2, #1
 7f8:	e24b1035 	sub	r1, fp, #53	; 0x35
 7fc:	e1a00005 	mov	r0, r5
 800:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 804:	ebffff00 	bl	40c <write>

  while(--i >= 0)
 808:	e1540006 	cmp	r4, r6
 80c:	1afffff7 	bne	7f0 <printint+0xa4>
    putc(fd, buf[i]);
}
 810:	e24bd020 	sub	sp, fp, #32
 814:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000818 <div>:
{
 818:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 81c:	e3a02000 	mov	r2, #0
{
 820:	e28db008 	add	fp, sp, #8
 824:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 828:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 82c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 830:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 834:	e1a0c33e 	lsr	ip, lr, r3
 838:	e20cc001 	and	ip, ip, #1
 83c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 840:	e1520001 	cmp	r2, r1
            r = r - d;
 844:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 848:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 84c:	e2533001 	subs	r3, r3, #1
 850:	38bd8810 	popcc	{r4, fp, pc}
 854:	eafffff6 	b	834 <div+0x1c>

00000858 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 858:	e92d000e 	push	{r1, r2, r3}
 85c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 860:	e28db018 	add	fp, sp, #24
 864:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 868:	e59b5004 	ldr	r5, [fp, #4]
 86c:	e5d54000 	ldrb	r4, [r5]
 870:	e3540000 	cmp	r4, #0
 874:	0a00002b 	beq	928 <printf+0xd0>
 878:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 87c:	e28b8008 	add	r8, fp, #8
  state = 0;
 880:	e3a06000 	mov	r6, #0
 884:	ea00000a 	b	8b4 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 888:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 88c:	01a06004 	moveq	r6, r4
      if(c == '%'){
 890:	0a000004 	beq	8a8 <printf+0x50>
 894:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 898:	e3a02001 	mov	r2, #1
 89c:	e1a00007 	mov	r0, r7
 8a0:	e5614006 	strb	r4, [r1, #-6]!
 8a4:	ebfffed8 	bl	40c <write>
  for(i = 0; fmt[i]; i++){
 8a8:	e5f54001 	ldrb	r4, [r5, #1]!
 8ac:	e3540000 	cmp	r4, #0
 8b0:	0a00001c 	beq	928 <printf+0xd0>
    if(state == 0){
 8b4:	e3560000 	cmp	r6, #0
 8b8:	0afffff2 	beq	888 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8bc:	e3560025 	cmp	r6, #37	; 0x25
 8c0:	1afffff8 	bne	8a8 <printf+0x50>
      if(c == 'd'){
 8c4:	e3540064 	cmp	r4, #100	; 0x64
 8c8:	0a000030 	beq	990 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8cc:	e20430f7 	and	r3, r4, #247	; 0xf7
 8d0:	e3530070 	cmp	r3, #112	; 0x70
 8d4:	0a000017 	beq	938 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d8:	e3540073 	cmp	r4, #115	; 0x73
 8dc:	0a00001c 	beq	954 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e0:	e3540063 	cmp	r4, #99	; 0x63
 8e4:	0a000037 	beq	9c8 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e8:	e3540025 	cmp	r4, #37	; 0x25
 8ec:	0a00002e 	beq	9ac <printf+0x154>
  write(fd, &c, 1);
 8f0:	e3a02001 	mov	r2, #1
 8f4:	e24b1019 	sub	r1, fp, #25
 8f8:	e1a00007 	mov	r0, r7
 8fc:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 900:	ebfffec1 	bl	40c <write>
 904:	e3a02001 	mov	r2, #1
 908:	e24b101a 	sub	r1, fp, #26
 90c:	e1a00007 	mov	r0, r7
 910:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 914:	ebfffebc 	bl	40c <write>
  for(i = 0; fmt[i]; i++){
 918:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 91c:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 920:	e3540000 	cmp	r4, #0
 924:	1affffe2 	bne	8b4 <printf+0x5c>
    }
  }
}
 928:	e24bd018 	sub	sp, fp, #24
 92c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 930:	e28dd00c 	add	sp, sp, #12
 934:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 938:	e3a03000 	mov	r3, #0
 93c:	e3a02010 	mov	r2, #16
 940:	e4981004 	ldr	r1, [r8], #4
 944:	e1a00007 	mov	r0, r7
 948:	ebffff7f 	bl	74c <printint>
      state = 0;
 94c:	e3a06000 	mov	r6, #0
 950:	eaffffd4 	b	8a8 <printf+0x50>
        s = (char*)*ap;
 954:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 958:	e3540000 	cmp	r4, #0
 95c:	0a000021 	beq	9e8 <printf+0x190>
        while(*s != 0){
 960:	e5d46000 	ldrb	r6, [r4]
 964:	e3560000 	cmp	r6, #0
 968:	0affffce 	beq	8a8 <printf+0x50>
  write(fd, &c, 1);
 96c:	e3a02001 	mov	r2, #1
 970:	e24b101d 	sub	r1, fp, #29
 974:	e1a00007 	mov	r0, r7
 978:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 97c:	ebfffea2 	bl	40c <write>
        while(*s != 0){
 980:	e5f46001 	ldrb	r6, [r4, #1]!
 984:	e3560000 	cmp	r6, #0
 988:	1afffff7 	bne	96c <printf+0x114>
 98c:	eaffffc5 	b	8a8 <printf+0x50>
        printint(fd, *ap, 10, 1);
 990:	e3a03001 	mov	r3, #1
 994:	e3a0200a 	mov	r2, #10
 998:	e4981004 	ldr	r1, [r8], #4
 99c:	e1a00007 	mov	r0, r7
 9a0:	ebffff69 	bl	74c <printint>
      state = 0;
 9a4:	e3a06000 	mov	r6, #0
 9a8:	eaffffbe 	b	8a8 <printf+0x50>
 9ac:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9b0:	e3a02001 	mov	r2, #1
 9b4:	e1a00007 	mov	r0, r7
 9b8:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 9bc:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 9c0:	ebfffe91 	bl	40c <write>
 9c4:	eaffffb7 	b	8a8 <printf+0x50>
        putc(fd, *ap);
 9c8:	e4983004 	ldr	r3, [r8], #4
 9cc:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9d0:	e3a02001 	mov	r2, #1
 9d4:	e1a00007 	mov	r0, r7
      state = 0;
 9d8:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 9dc:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9e0:	ebfffe89 	bl	40c <write>
 9e4:	eaffffaf 	b	8a8 <printf+0x50>
          s = "(null)";
 9e8:	e3004ba8 	movw	r4, #2984	; 0xba8
        while(*s != 0){
 9ec:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 9f0:	e3404000 	movt	r4, #0
 9f4:	eaffffdc 	b	96c <printf+0x114>

000009f8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f8:	e300cbb0 	movw	ip, #2992	; 0xbb0
 9fc:	e340c000 	movt	ip, #0
{
 a00:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a04:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a08:	e59c3000 	ldr	r3, [ip]
{
 a0c:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a10:	e1530001 	cmp	r3, r1
 a14:	e5932000 	ldr	r2, [r3]
 a18:	2a000017 	bcs	a7c <free+0x84>
 a1c:	e1510002 	cmp	r1, r2
 a20:	3a000001 	bcc	a2c <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a24:	e1530002 	cmp	r3, r2
 a28:	3a000017 	bcc	a8c <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a2c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a30:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a34:	e081418e 	add	r4, r1, lr, lsl #3
 a38:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a3c:	05922004 	ldreq	r2, [r2, #4]
 a40:	0082e00e 	addeq	lr, r2, lr
 a44:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a48:	05932000 	ldreq	r2, [r3]
 a4c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a50:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a54:	e5932004 	ldr	r2, [r3, #4]
 a58:	e083e182 	add	lr, r3, r2, lsl #3
 a5c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a60:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a64:	05101004 	ldreq	r1, [r0, #-4]
 a68:	00812002 	addeq	r2, r1, r2
 a6c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a70:	05102008 	ldreq	r2, [r0, #-8]
 a74:	05832000 	streq	r2, [r3]
}
 a78:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a7c:	e1530002 	cmp	r3, r2
 a80:	3a000001 	bcc	a8c <free+0x94>
 a84:	e1510002 	cmp	r1, r2
 a88:	3affffe7 	bcc	a2c <free+0x34>
{
 a8c:	e1a03002 	mov	r3, r2
 a90:	eaffffde 	b	a10 <free+0x18>

00000a94 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a94:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a98:	e3007bb0 	movw	r7, #2992	; 0xbb0
 a9c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa0:	e2804007 	add	r4, r0, #7
{
 aa4:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 aa8:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aac:	e1a041a4 	lsr	r4, r4, #3
 ab0:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ab4:	e3530000 	cmp	r3, #0
 ab8:	0a000027 	beq	b5c <malloc+0xc8>
 abc:	e5930000 	ldr	r0, [r3]
 ac0:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ac4:	e1540002 	cmp	r4, r2
 ac8:	9a000019 	bls	b34 <malloc+0xa0>
 acc:	e3540a01 	cmp	r4, #4096	; 0x1000
 ad0:	21a05004 	movcs	r5, r4
 ad4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ad8:	e1a06185 	lsl	r6, r5, #3
 adc:	ea000003 	b	af0 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ae4:	e5902004 	ldr	r2, [r0, #4]
 ae8:	e1520004 	cmp	r2, r4
 aec:	2a000010 	bcs	b34 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 af0:	e5972000 	ldr	r2, [r7]
 af4:	e1a03000 	mov	r3, r0
 af8:	e1520000 	cmp	r2, r0
 afc:	1afffff7 	bne	ae0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b00:	e1a00006 	mov	r0, r6
 b04:	ebfffee9 	bl	6b0 <sbrk>
 b08:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b0c:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b10:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b14:	0a000004 	beq	b2c <malloc+0x98>
  hp->s.size = nu;
 b18:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b1c:	ebffffb5 	bl	9f8 <free>
  return freep;
 b20:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b24:	e3530000 	cmp	r3, #0
 b28:	1affffec 	bne	ae0 <malloc+0x4c>
        return 0;
 b2c:	e3a00000 	mov	r0, #0
  }
}
 b30:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 b34:	e1540002 	cmp	r4, r2
      freep = prevp;
 b38:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b3c:	10422004 	subne	r2, r2, r4
 b40:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b44:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b48:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b4c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b50:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b54:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b58:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b5c:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b60:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b64:	e5870000 	str	r0, [r7]
 b68:	e5870004 	str	r0, [r7, #4]
 b6c:	eaffffd6 	b	acc <malloc+0x38>
