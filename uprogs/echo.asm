
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	e28db014 	add	fp, sp, #20
  for(i = 1; i < argc; i++)
   c:	da000015 	ble	68 <main+0x68>
  10:	e2814004 	add	r4, r1, #4
  14:	e0815100 	add	r5, r1, r0, lsl #2
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  18:	e3007b84 	movw	r7, #2948	; 0xb84
  1c:	e3006b88 	movw	r6, #2952	; 0xb88
  20:	e4942004 	ldr	r2, [r4], #4
  24:	e3407000 	movt	r7, #0
  28:	e3406000 	movt	r6, #0
  2c:	e1540005 	cmp	r4, r5
  30:	0a000006 	beq	50 <main+0x50>
  34:	e1a03007 	mov	r3, r7
  38:	e1a01006 	mov	r1, r6
  3c:	e3a00001 	mov	r0, #1
  40:	eb00020a 	bl	870 <printf>
  44:	e4942004 	ldr	r2, [r4], #4
  48:	e1540005 	cmp	r4, r5
  4c:	1afffff8 	bne	34 <main+0x34>
  50:	e3003b90 	movw	r3, #2960	; 0xb90
  54:	e3001b88 	movw	r1, #2952	; 0xb88
  58:	e3403000 	movt	r3, #0
  5c:	e3401000 	movt	r1, #0
  60:	e3a00001 	mov	r0, #1
  64:	eb000201 	bl	870 <printf>
  exit();
  68:	eb0000a7 	bl	30c <exit>

0000006c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e2402001 	sub	r2, r0, #1
  74:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  78:	e4d13001 	ldrb	r3, [r1], #1
  7c:	e3530000 	cmp	r3, #0
  80:	e5e23001 	strb	r3, [r2, #1]!
  84:	1afffffb 	bne	78 <strcpy+0xc>
    ;
  return os;
}
  88:	e28bd000 	add	sp, fp, #0
  8c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  90:	e12fff1e 	bx	lr

00000094 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  98:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  9c:	e5d03000 	ldrb	r3, [r0]
  a0:	e5d12000 	ldrb	r2, [r1]
  a4:	e3530000 	cmp	r3, #0
  a8:	1a000004 	bne	c0 <strcmp+0x2c>
  ac:	ea000005 	b	c8 <strcmp+0x34>
  b0:	e5f03001 	ldrb	r3, [r0, #1]!
  b4:	e5f12001 	ldrb	r2, [r1, #1]!
  b8:	e3530000 	cmp	r3, #0
  bc:	0a000001 	beq	c8 <strcmp+0x34>
  c0:	e1530002 	cmp	r3, r2
  c4:	0afffff9 	beq	b0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c8:	e0430002 	sub	r0, r3, r2
  cc:	e28bd000 	add	sp, fp, #0
  d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d4:	e12fff1e 	bx	lr

000000d8 <strlen>:

uint
strlen(char *s)
{
  d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  dc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  e0:	e5d03000 	ldrb	r3, [r0]
  e4:	e3530000 	cmp	r3, #0
  e8:	0a000008 	beq	110 <strlen+0x38>
  ec:	e2601001 	rsb	r1, r0, #1
  f0:	e1a03000 	mov	r3, r0
    ;
  f4:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
  f8:	e5f32001 	ldrb	r2, [r3, #1]!
  fc:	e3520000 	cmp	r2, #0
 100:	1afffffb 	bne	f4 <strlen+0x1c>
  return n;
}
 104:	e28bd000 	add	sp, fp, #0
 108:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 10c:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 110:	e1a00003 	mov	r0, r3
}
 114:	e28bd000 	add	sp, fp, #0
 118:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 11c:	e12fff1e 	bx	lr

00000120 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 120:	e3520000 	cmp	r2, #0
{
 124:	e1a03000 	mov	r3, r0
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 130:	0a000004 	beq	148 <memset+0x28>
 134:	e6ef1071 	uxtb	r1, r1
 138:	e0800002 	add	r0, r0, r2
 13c:	e4c31001 	strb	r1, [r3], #1
 140:	e1500003 	cmp	r0, r3
 144:	1afffffc 	bne	13c <memset+0x1c>
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
 168:	e1520001 	cmp	r2, r1
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
 1a0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 1a4:	e1a03000 	mov	r3, r0
 1a8:	e28db014 	add	fp, sp, #20
 1ac:	e1a07000 	mov	r7, r0
 1b0:	e24dd008 	sub	sp, sp, #8
 1b4:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b8:	e3a04000 	mov	r4, #0
 1bc:	ea000008 	b	1e4 <gets+0x44>
    cc = read(0, &c, 1);
 1c0:	eb000085 	bl	3dc <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1c4:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1c8:	e3500000 	cmp	r0, #0
 1cc:	da00000b 	ble	200 <gets+0x60>
    buf[i++] = c;
 1d0:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1d4:	e352000d 	cmp	r2, #13
 1d8:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1dc:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1e0:	0a00000b 	beq	214 <gets+0x74>
    cc = read(0, &c, 1);
 1e4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1e8:	e0844002 	add	r4, r4, r2
 1ec:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1f0:	e24b1015 	sub	r1, fp, #21
 1f4:	e3a00000 	mov	r0, #0
 1f8:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1fc:	baffffef 	blt	1c0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 200:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 204:	e3a03000 	mov	r3, #0
 208:	e5c53000 	strb	r3, [r5]
}
 20c:	e24bd014 	sub	sp, fp, #20
 210:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 214:	e0875004 	add	r5, r7, r4
 218:	eafffff8 	b	200 <gets+0x60>

0000021c <stat>:

int
stat(char *n, struct stat *st)
{
 21c:	e92d4830 	push	{r4, r5, fp, lr}
 220:	e1a04001 	mov	r4, r1
 224:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 228:	e3a01000 	mov	r1, #0
 22c:	eb0000ab 	bl	4e0 <open>
  if(fd < 0)
 230:	e2505000 	subs	r5, r0, #0
 234:	ba000006 	blt	254 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 238:	e1a01004 	mov	r1, r4
 23c:	eb0000ce 	bl	57c <fstat>
 240:	e1a04000 	mov	r4, r0
  close(fd);
 244:	e1a00005 	mov	r0, r5
 248:	eb00007d 	bl	444 <close>
  return r;
}
 24c:	e1a00004 	mov	r0, r4
 250:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 254:	e3e04000 	mvn	r4, #0
 258:	eafffffb 	b	24c <stat+0x30>

0000025c <atoi>:

int
atoi(const char *s)
{
 25c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 260:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 264:	e5d02000 	ldrb	r2, [r0]
 268:	e2423030 	sub	r3, r2, #48	; 0x30
 26c:	e3530009 	cmp	r3, #9
  n = 0;
 270:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 274:	8a000006 	bhi	294 <atoi+0x38>
    n = n*10 + *s++ - '0';
 278:	e3a0c00a 	mov	ip, #10
 27c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 280:	e5f02001 	ldrb	r2, [r0, #1]!
 284:	e2421030 	sub	r1, r2, #48	; 0x30
 288:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 28c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 290:	9afffff9 	bls	27c <atoi+0x20>
  return n;
}
 294:	e1a00003 	mov	r0, r3
 298:	e28bd000 	add	sp, fp, #0
 29c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a0:	e12fff1e 	bx	lr

000002a4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a4:	e3520000 	cmp	r2, #0
{
 2a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ac:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 2b0:	da000005 	ble	2cc <memmove+0x28>
 2b4:	e0812002 	add	r2, r1, r2
 2b8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2bc:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2c0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2c4:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2c8:	1afffffb 	bne	2bc <memmove+0x18>
  return vdst;
}
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d4:	e12fff1e 	bx	lr

000002d8 <fork>:
 2d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2ec:	e3a00001 	mov	r0, #1
 2f0:	ef000040 	svc	0x00000040
 2f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 300:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 304:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 308:	e12fff1e 	bx	lr

0000030c <exit>:
 30c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 310:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 314:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 318:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 31c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 320:	e3a00002 	mov	r0, #2
 324:	ef000040 	svc	0x00000040
 328:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 334:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 338:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 33c:	e12fff1e 	bx	lr

00000340 <wait>:
 340:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 344:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 348:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 34c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 350:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 354:	e3a00003 	mov	r0, #3
 358:	ef000040 	svc	0x00000040
 35c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 368:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 36c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 370:	e12fff1e 	bx	lr

00000374 <lseek>:
 374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 378:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 37c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 380:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 384:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 388:	e3a00016 	mov	r0, #22
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
 758:	e0133fa1 	ands	r3, r3, r1, lsr #31
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
  neg = 0;
 778:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 77c:	e3a07000 	mov	r7, #0
  b = base;
 780:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 784:	e3a06001 	mov	r6, #1
{
 788:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 78c:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 790:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 794:	e3a0c000 	mov	ip, #0
 798:	ea000002 	b	7a8 <printint+0x58>
        if(r >= d) {
 79c:	e1520000 	cmp	r2, r0
            r = r - d;
 7a0:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 7a4:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7a8:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 7ac:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 7b0:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 7b4:	e2011001 	and	r1, r1, #1
 7b8:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 7bc:	1afffff6 	bne	79c <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7c0:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 7c4:	e35c0000 	cmp	ip, #0
 7c8:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7cc:	e2871001 	add	r1, r7, #1
 7d0:	e7d93003 	ldrb	r3, [r9, r3]
 7d4:	e4c83001 	strb	r3, [r8], #1
 7d8:	11a07001 	movne	r7, r1
 7dc:	1affffea 	bne	78c <printint+0x3c>
  if(neg)
 7e0:	e35a0000 	cmp	sl, #0
 7e4:	0a000005 	beq	800 <printint+0xb0>
    buf[i++] = '-';
 7e8:	e24b3024 	sub	r3, fp, #36	; 0x24
 7ec:	e3a0202d 	mov	r2, #45	; 0x2d
 7f0:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 7f4:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 7f8:	e1a03002 	mov	r3, r2
 7fc:	e5402010 	strb	r2, [r0, #-16]
 800:	e0847007 	add	r7, r4, r7
 804:	ea000000 	b	80c <printint+0xbc>
 808:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 80c:	e3a02001 	mov	r2, #1
 810:	e24b1035 	sub	r1, fp, #53	; 0x35
 814:	e1a00005 	mov	r0, r5
 818:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 81c:	ebfffefb 	bl	410 <write>

  while(--i >= 0)
 820:	e1570004 	cmp	r7, r4
 824:	1afffff7 	bne	808 <printint+0xb8>
    putc(fd, buf[i]);
}
 828:	e24bd020 	sub	sp, fp, #32
 82c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000830 <div>:
{
 830:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 834:	e3a02000 	mov	r2, #0
{
 838:	e28db008 	add	fp, sp, #8
 83c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 840:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 844:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 848:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 84c:	e1a0c33e 	lsr	ip, lr, r3
 850:	e20cc001 	and	ip, ip, #1
 854:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 858:	e1520001 	cmp	r2, r1
            r = r - d;
 85c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 860:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 864:	e2533001 	subs	r3, r3, #1
 868:	38bd8810 	popcc	{r4, fp, pc}
 86c:	eafffff6 	b	84c <div+0x1c>

00000870 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 870:	e92d000e 	push	{r1, r2, r3}
 874:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 878:	e28db018 	add	fp, sp, #24
 87c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 880:	e59b6004 	ldr	r6, [fp, #4]
 884:	e5d64000 	ldrb	r4, [r6]
 888:	e3540000 	cmp	r4, #0
 88c:	0a00002b 	beq	940 <printf+0xd0>
 890:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 894:	e28b8008 	add	r8, fp, #8
  state = 0;
 898:	e3a05000 	mov	r5, #0
 89c:	ea00000a 	b	8cc <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8a0:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8a4:	01a05004 	moveq	r5, r4
      if(c == '%'){
 8a8:	0a000004 	beq	8c0 <printf+0x50>
  write(fd, &c, 1);
 8ac:	e3a02001 	mov	r2, #1
 8b0:	e24b1019 	sub	r1, fp, #25
 8b4:	e1a00007 	mov	r0, r7
 8b8:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 8bc:	ebfffed3 	bl	410 <write>
  for(i = 0; fmt[i]; i++){
 8c0:	e5f64001 	ldrb	r4, [r6, #1]!
 8c4:	e3540000 	cmp	r4, #0
 8c8:	0a00001c 	beq	940 <printf+0xd0>
    if(state == 0){
 8cc:	e3550000 	cmp	r5, #0
 8d0:	0afffff2 	beq	8a0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8d4:	e3550025 	cmp	r5, #37	; 0x25
 8d8:	1afffff8 	bne	8c0 <printf+0x50>
      if(c == 'd'){
 8dc:	e3540064 	cmp	r4, #100	; 0x64
 8e0:	0a000021 	beq	96c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8e4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8e8:	e3530070 	cmp	r3, #112	; 0x70
 8ec:	0a000017 	beq	950 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8f0:	e3540073 	cmp	r4, #115	; 0x73
 8f4:	0a00002e 	beq	9b4 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8f8:	e3540063 	cmp	r4, #99	; 0x63
 8fc:	0a000021 	beq	988 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 900:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 904:	e3a02001 	mov	r2, #1
 908:	e24b1019 	sub	r1, fp, #25
 90c:	e1a00007 	mov	r0, r7
 910:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 914:	0a000023 	beq	9a8 <printf+0x138>
  write(fd, &c, 1);
 918:	ebfffebc 	bl	410 <write>
 91c:	e3a02001 	mov	r2, #1
 920:	e24b1019 	sub	r1, fp, #25
 924:	e1a00007 	mov	r0, r7
 928:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 92c:	ebfffeb7 	bl	410 <write>
  for(i = 0; fmt[i]; i++){
 930:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 934:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 938:	e3540000 	cmp	r4, #0
 93c:	1affffe2 	bne	8cc <printf+0x5c>
    }
  }
}
 940:	e24bd018 	sub	sp, fp, #24
 944:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 948:	e28dd00c 	add	sp, sp, #12
 94c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 950:	e3a03000 	mov	r3, #0
 954:	e3a02010 	mov	r2, #16
 958:	e4981004 	ldr	r1, [r8], #4
 95c:	e1a00007 	mov	r0, r7
 960:	ebffff7a 	bl	750 <printint>
      state = 0;
 964:	e3a05000 	mov	r5, #0
 968:	eaffffd4 	b	8c0 <printf+0x50>
        printint(fd, *ap, 10, 1);
 96c:	e3a03001 	mov	r3, #1
 970:	e3a0200a 	mov	r2, #10
 974:	e4981004 	ldr	r1, [r8], #4
 978:	e1a00007 	mov	r0, r7
 97c:	ebffff73 	bl	750 <printint>
      state = 0;
 980:	e3a05000 	mov	r5, #0
 984:	eaffffcd 	b	8c0 <printf+0x50>
        putc(fd, *ap);
 988:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 98c:	e3a02001 	mov	r2, #1
 990:	e24b1019 	sub	r1, fp, #25
 994:	e1a00007 	mov	r0, r7
      state = 0;
 998:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 99c:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 9a0:	ebfffe9a 	bl	410 <write>
        ap++;
 9a4:	eaffffc5 	b	8c0 <printf+0x50>
  write(fd, &c, 1);
 9a8:	ebfffe98 	bl	410 <write>
      state = 0;
 9ac:	e3a05000 	mov	r5, #0
 9b0:	eaffffc2 	b	8c0 <printf+0x50>
        s = (char*)*ap;
 9b4:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 9b8:	e3540000 	cmp	r4, #0
 9bc:	0a00000b 	beq	9f0 <printf+0x180>
        while(*s != 0){
 9c0:	e5d45000 	ldrb	r5, [r4]
 9c4:	e3550000 	cmp	r5, #0
 9c8:	0affffbc 	beq	8c0 <printf+0x50>
  write(fd, &c, 1);
 9cc:	e3a02001 	mov	r2, #1
 9d0:	e24b1019 	sub	r1, fp, #25
 9d4:	e1a00007 	mov	r0, r7
 9d8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9dc:	ebfffe8b 	bl	410 <write>
        while(*s != 0){
 9e0:	e5f45001 	ldrb	r5, [r4, #1]!
 9e4:	e3550000 	cmp	r5, #0
 9e8:	1afffff7 	bne	9cc <printf+0x15c>
 9ec:	eaffffb3 	b	8c0 <printf+0x50>
          s = "(null)";
 9f0:	e3004ba8 	movw	r4, #2984	; 0xba8
        while(*s != 0){
 9f4:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9f8:	e3404000 	movt	r4, #0
 9fc:	eafffff2 	b	9cc <printf+0x15c>

00000a00 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a00:	e300cbb0 	movw	ip, #2992	; 0xbb0
 a04:	e340c000 	movt	ip, #0
{
 a08:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a0c:	e2401008 	sub	r1, r0, #8
{
 a10:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a14:	e59c3000 	ldr	r3, [ip]
 a18:	ea000004 	b	a30 <free+0x30>
 a1c:	e1510002 	cmp	r1, r2
 a20:	3a000009 	bcc	a4c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a24:	e1530002 	cmp	r3, r2
 a28:	2a000007 	bcs	a4c <free+0x4c>
{
 a2c:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a30:	e1530001 	cmp	r3, r1
 a34:	e5932000 	ldr	r2, [r3]
 a38:	3afffff7 	bcc	a1c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a3c:	e1530002 	cmp	r3, r2
 a40:	3afffff9 	bcc	a2c <free+0x2c>
 a44:	e1510002 	cmp	r1, r2
 a48:	2afffff7 	bcs	a2c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a4c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a50:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a54:	e081418e 	add	r4, r1, lr, lsl #3
 a58:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a5c:	05922004 	ldreq	r2, [r2, #4]
 a60:	0082e00e 	addeq	lr, r2, lr
 a64:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a68:	05932000 	ldreq	r2, [r3]
 a6c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a70:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a74:	e5932004 	ldr	r2, [r3, #4]
 a78:	e083e182 	add	lr, r3, r2, lsl #3
 a7c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a80:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a84:	05101004 	ldreq	r1, [r0, #-4]
 a88:	00812002 	addeq	r2, r1, r2
 a8c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a90:	05102008 	ldreq	r2, [r0, #-8]
 a94:	05832000 	streq	r2, [r3]
}
 a98:	e8bd8810 	pop	{r4, fp, pc}

00000a9c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a9c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 aa0:	e3007bb0 	movw	r7, #2992	; 0xbb0
 aa4:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa8:	e2804007 	add	r4, r0, #7
{
 aac:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 ab0:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab4:	e1a041a4 	lsr	r4, r4, #3
 ab8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 abc:	e3510000 	cmp	r1, #0
 ac0:	0a000029 	beq	b6c <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac4:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 ac8:	e5932004 	ldr	r2, [r3, #4]
 acc:	e1520004 	cmp	r2, r4
 ad0:	2a000019 	bcs	b3c <malloc+0xa0>
 ad4:	e3540a01 	cmp	r4, #4096	; 0x1000
 ad8:	21a05004 	movcs	r5, r4
 adc:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ae0:	e1a06185 	lsl	r6, r5, #3
 ae4:	ea000005 	b	b00 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 aec:	e5902004 	ldr	r2, [r0, #4]
 af0:	e1520004 	cmp	r2, r4
 af4:	2a000012 	bcs	b44 <malloc+0xa8>
 af8:	e5971000 	ldr	r1, [r7]
 afc:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b00:	e1510003 	cmp	r1, r3
 b04:	1afffff7 	bne	ae8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b08:	e1a00006 	mov	r0, r6
 b0c:	ebfffee8 	bl	6b4 <sbrk>
 b10:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b14:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b18:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b1c:	0a000004 	beq	b34 <malloc+0x98>
  hp->s.size = nu;
 b20:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b24:	ebffffb5 	bl	a00 <free>
  return freep;
 b28:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b2c:	e3530000 	cmp	r3, #0
 b30:	1affffec 	bne	ae8 <malloc+0x4c>
        return 0;
 b34:	e3a00000 	mov	r0, #0
  }
}
 b38:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b3c:	e1a00003 	mov	r0, r3
 b40:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 b44:	e1540002 	cmp	r4, r2
      freep = prevp;
 b48:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b4c:	10422004 	subne	r2, r2, r4
 b50:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b54:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b58:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b5c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b60:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b64:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b68:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b6c:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 b70:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b74:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 b78:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 b7c:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 b80:	eaffffd3 	b	ad4 <malloc+0x38>
