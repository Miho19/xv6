
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char **argv)
{
  int i;

  if(argc < 1){
   0:	e3500000 	cmp	r0, #0
{
   4:	e92d4830 	push	{r4, r5, fp, lr}
   8:	e28db00c 	add	fp, sp, #12
  if(argc < 1){
   c:	da000009 	ble	38 <main+0x38>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  10:	e3500001 	cmp	r0, #1
  14:	10815100 	addne	r5, r1, r0, lsl #2
  18:	12814004 	addne	r4, r1, #4
  1c:	0a000004 	beq	34 <main+0x34>
    kill(atoi(argv[i]));
  20:	e4940004 	ldr	r0, [r4], #4
  24:	eb000084 	bl	23c <atoi>
  28:	eb00010a 	bl	458 <kill>
  for(i=1; i<argc; i++)
  2c:	e1540005 	cmp	r4, r5
  30:	1afffffa 	bne	20 <main+0x20>
  exit();
  34:	eb0000ac 	bl	2ec <exit>
    printf(2, "usage: kill pid...\n");
  38:	e3001b64 	movw	r1, #2916	; 0xb64
  3c:	e3a00002 	mov	r0, #2
  40:	e3401000 	movt	r1, #0
  44:	eb000201 	bl	850 <printf>
    exit();
  48:	eb0000a7 	bl	2ec <exit>

0000004c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  50:	e2402001 	sub	r2, r0, #1
  54:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  58:	e4d13001 	ldrb	r3, [r1], #1
  5c:	e3530000 	cmp	r3, #0
  60:	e5e23001 	strb	r3, [r2, #1]!
  64:	1afffffb 	bne	58 <strcpy+0xc>
    ;
  return os;
}
  68:	e28bd000 	add	sp, fp, #0
  6c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  70:	e12fff1e 	bx	lr

00000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  74:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  78:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  7c:	e5d03000 	ldrb	r3, [r0]
  80:	e5d12000 	ldrb	r2, [r1]
  84:	e3530000 	cmp	r3, #0
  88:	1a000004 	bne	a0 <strcmp+0x2c>
  8c:	ea000005 	b	a8 <strcmp+0x34>
  90:	e5f03001 	ldrb	r3, [r0, #1]!
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e3530000 	cmp	r3, #0
  9c:	0a000001 	beq	a8 <strcmp+0x34>
  a0:	e1530002 	cmp	r3, r2
  a4:	0afffff9 	beq	90 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a8:	e0430002 	sub	r0, r3, r2
  ac:	e28bd000 	add	sp, fp, #0
  b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  b4:	e12fff1e 	bx	lr

000000b8 <strlen>:

uint
strlen(char *s)
{
  b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  bc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  c0:	e5d03000 	ldrb	r3, [r0]
  c4:	e3530000 	cmp	r3, #0
  c8:	0a000008 	beq	f0 <strlen+0x38>
  cc:	e2601001 	rsb	r1, r0, #1
  d0:	e1a03000 	mov	r3, r0
    ;
  d4:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
  d8:	e5f32001 	ldrb	r2, [r3, #1]!
  dc:	e3520000 	cmp	r2, #0
  e0:	1afffffb 	bne	d4 <strlen+0x1c>
  return n;
}
  e4:	e28bd000 	add	sp, fp, #0
  e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ec:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
  f0:	e1a00003 	mov	r0, r3
}
  f4:	e28bd000 	add	sp, fp, #0
  f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  fc:	e12fff1e 	bx	lr

00000100 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 100:	e3520000 	cmp	r2, #0
{
 104:	e1a03000 	mov	r3, r0
 108:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 10c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 110:	0a000004 	beq	128 <memset+0x28>
 114:	e6ef1071 	uxtb	r1, r1
 118:	e0800002 	add	r0, r0, r2
 11c:	e4c31001 	strb	r1, [r3], #1
 120:	e1500003 	cmp	r0, r3
 124:	1afffffc 	bne	11c <memset+0x1c>
  return (void *)p;
}
 128:	e28bd000 	add	sp, fp, #0
 12c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 130:	e12fff1e 	bx	lr

00000134 <strchr>:

char*
strchr(const char *s, char c)
{
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 13c:	e5d02000 	ldrb	r2, [r0]
 140:	e3520000 	cmp	r2, #0
 144:	0a00000b 	beq	178 <strchr+0x44>
    if(*s == c)
 148:	e1520001 	cmp	r2, r1
 14c:	1a000002 	bne	15c <strchr+0x28>
 150:	ea000005 	b	16c <strchr+0x38>
 154:	e1530001 	cmp	r3, r1
 158:	0a000003 	beq	16c <strchr+0x38>
  for(; *s; s++)
 15c:	e5f03001 	ldrb	r3, [r0, #1]!
 160:	e3530000 	cmp	r3, #0
 164:	1afffffa 	bne	154 <strchr+0x20>
      return (char*)s;
  return 0;
 168:	e1a00003 	mov	r0, r3
}
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr
  return 0;
 178:	e1a00002 	mov	r0, r2
 17c:	eafffffa 	b	16c <strchr+0x38>

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 184:	e1a03000 	mov	r3, r0
 188:	e28db014 	add	fp, sp, #20
 18c:	e1a07000 	mov	r7, r0
 190:	e24dd008 	sub	sp, sp, #8
 194:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	e3a04000 	mov	r4, #0
 19c:	ea000008 	b	1c4 <gets+0x44>
    cc = read(0, &c, 1);
 1a0:	eb000085 	bl	3bc <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1a4:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1a8:	e3500000 	cmp	r0, #0
 1ac:	da00000b 	ble	1e0 <gets+0x60>
    buf[i++] = c;
 1b0:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1b4:	e352000d 	cmp	r2, #13
 1b8:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1bc:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1c0:	0a00000b 	beq	1f4 <gets+0x74>
    cc = read(0, &c, 1);
 1c4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1c8:	e0844002 	add	r4, r4, r2
 1cc:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1d0:	e24b1015 	sub	r1, fp, #21
 1d4:	e3a00000 	mov	r0, #0
 1d8:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 1dc:	baffffef 	blt	1a0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e0:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 1e4:	e3a03000 	mov	r3, #0
 1e8:	e5c53000 	strb	r3, [r5]
}
 1ec:	e24bd014 	sub	sp, fp, #20
 1f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 1f4:	e0875004 	add	r5, r7, r4
 1f8:	eafffff8 	b	1e0 <gets+0x60>

000001fc <stat>:

int
stat(char *n, struct stat *st)
{
 1fc:	e92d4830 	push	{r4, r5, fp, lr}
 200:	e1a04001 	mov	r4, r1
 204:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 208:	e3a01000 	mov	r1, #0
 20c:	eb0000ab 	bl	4c0 <open>
  if(fd < 0)
 210:	e2505000 	subs	r5, r0, #0
 214:	ba000006 	blt	234 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 218:	e1a01004 	mov	r1, r4
 21c:	eb0000ce 	bl	55c <fstat>
 220:	e1a04000 	mov	r4, r0
  close(fd);
 224:	e1a00005 	mov	r0, r5
 228:	eb00007d 	bl	424 <close>
  return r;
}
 22c:	e1a00004 	mov	r0, r4
 230:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 234:	e3e04000 	mvn	r4, #0
 238:	eafffffb 	b	22c <stat+0x30>

0000023c <atoi>:

int
atoi(const char *s)
{
 23c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 240:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 244:	e5d02000 	ldrb	r2, [r0]
 248:	e2423030 	sub	r3, r2, #48	; 0x30
 24c:	e3530009 	cmp	r3, #9
  n = 0;
 250:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 254:	8a000006 	bhi	274 <atoi+0x38>
    n = n*10 + *s++ - '0';
 258:	e3a0c00a 	mov	ip, #10
 25c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 260:	e5f02001 	ldrb	r2, [r0, #1]!
 264:	e2421030 	sub	r1, r2, #48	; 0x30
 268:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 26c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 270:	9afffff9 	bls	25c <atoi+0x20>
  return n;
}
 274:	e1a00003 	mov	r0, r3
 278:	e28bd000 	add	sp, fp, #0
 27c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 280:	e12fff1e 	bx	lr

00000284 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 284:	e3520000 	cmp	r2, #0
{
 288:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 28c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 290:	da000005 	ble	2ac <memmove+0x28>
 294:	e0812002 	add	r2, r1, r2
 298:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 29c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2a0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2a4:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2a8:	1afffffb 	bne	29c <memmove+0x18>
  return vdst;
}
 2ac:	e28bd000 	add	sp, fp, #0
 2b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b4:	e12fff1e 	bx	lr

000002b8 <fork>:
 2b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2cc:	e3a00001 	mov	r0, #1
 2d0:	ef000040 	svc	0x00000040
 2d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2e8:	e12fff1e 	bx	lr

000002ec <exit>:
 2ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 300:	e3a00002 	mov	r0, #2
 304:	ef000040 	svc	0x00000040
 308:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 30c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 310:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 314:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 318:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 31c:	e12fff1e 	bx	lr

00000320 <wait>:
 320:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 324:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 328:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 32c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 330:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 334:	e3a00003 	mov	r0, #3
 338:	ef000040 	svc	0x00000040
 33c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 340:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 344:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 348:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 34c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 350:	e12fff1e 	bx	lr

00000354 <lseek>:
 354:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 358:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 35c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 360:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 364:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 368:	e3a00016 	mov	r0, #22
 36c:	ef000040 	svc	0x00000040
 370:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 374:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 378:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 37c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 380:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 384:	e12fff1e 	bx	lr

00000388 <pipe>:
 388:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 38c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 390:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 394:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 398:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 39c:	e3a00004 	mov	r0, #4
 3a0:	ef000040 	svc	0x00000040
 3a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b8:	e12fff1e 	bx	lr

000003bc <read>:
 3bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d0:	e3a00005 	mov	r0, #5
 3d4:	ef000040 	svc	0x00000040
 3d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3ec:	e12fff1e 	bx	lr

000003f0 <write>:
 3f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 400:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 404:	e3a00010 	mov	r0, #16
 408:	ef000040 	svc	0x00000040
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 418:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 41c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 420:	e12fff1e 	bx	lr

00000424 <close>:
 424:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 428:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 42c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 430:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 434:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 438:	e3a00015 	mov	r0, #21
 43c:	ef000040 	svc	0x00000040
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 44c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 450:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 454:	e12fff1e 	bx	lr

00000458 <kill>:
 458:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 45c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 460:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 464:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 468:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 46c:	e3a00006 	mov	r0, #6
 470:	ef000040 	svc	0x00000040
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 480:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 484:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 488:	e12fff1e 	bx	lr

0000048c <exec>:
 48c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 490:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 494:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 498:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 49c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a0:	e3a00007 	mov	r0, #7
 4a4:	ef000040 	svc	0x00000040
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4bc:	e12fff1e 	bx	lr

000004c0 <open>:
 4c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d4:	e3a0000f 	mov	r0, #15
 4d8:	ef000040 	svc	0x00000040
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f0:	e12fff1e 	bx	lr

000004f4 <mknod>:
 4f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 500:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 504:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 508:	e3a00011 	mov	r0, #17
 50c:	ef000040 	svc	0x00000040
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 51c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 520:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 524:	e12fff1e 	bx	lr

00000528 <unlink>:
 528:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 52c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 530:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 534:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 538:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 53c:	e3a00012 	mov	r0, #18
 540:	ef000040 	svc	0x00000040
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 550:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 554:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 558:	e12fff1e 	bx	lr

0000055c <fstat>:
 55c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 560:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 564:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 568:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 56c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 570:	e3a00008 	mov	r0, #8
 574:	ef000040 	svc	0x00000040
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 584:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 588:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 58c:	e12fff1e 	bx	lr

00000590 <link>:
 590:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 594:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 598:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 59c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a4:	e3a00013 	mov	r0, #19
 5a8:	ef000040 	svc	0x00000040
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c0:	e12fff1e 	bx	lr

000005c4 <mkdir>:
 5c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d8:	e3a00014 	mov	r0, #20
 5dc:	ef000040 	svc	0x00000040
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f4:	e12fff1e 	bx	lr

000005f8 <chdir>:
 5f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 600:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 604:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 608:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 60c:	e3a00009 	mov	r0, #9
 610:	ef000040 	svc	0x00000040
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 620:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 624:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 628:	e12fff1e 	bx	lr

0000062c <dup>:
 62c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 630:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 634:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 638:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 63c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 640:	e3a0000a 	mov	r0, #10
 644:	ef000040 	svc	0x00000040
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 654:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 658:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 65c:	e12fff1e 	bx	lr

00000660 <getpid>:
 660:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 664:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 668:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 66c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 670:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 674:	e3a0000b 	mov	r0, #11
 678:	ef000040 	svc	0x00000040
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 688:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 68c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 690:	e12fff1e 	bx	lr

00000694 <sbrk>:
 694:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 698:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 69c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a8:	e3a0000c 	mov	r0, #12
 6ac:	ef000040 	svc	0x00000040
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c4:	e12fff1e 	bx	lr

000006c8 <sleep>:
 6c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6dc:	e3a0000d 	mov	r0, #13
 6e0:	ef000040 	svc	0x00000040
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f8:	e12fff1e 	bx	lr

000006fc <uptime>:
 6fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 700:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 704:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 708:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 70c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 710:	e3a0000e 	mov	r0, #14
 714:	ef000040 	svc	0x00000040
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 724:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 728:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 72c:	e12fff1e 	bx	lr

00000730 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 734:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 738:	e0133fa1 	ands	r3, r3, r1, lsr #31
 73c:	e24b4034 	sub	r4, fp, #52	; 0x34
 740:	e3009b78 	movw	r9, #2936	; 0xb78
    neg = 1;
    x = -xx;
 744:	1261e000 	rsbne	lr, r1, #0
 748:	e3409000 	movt	r9, #0
{
 74c:	e1a05000 	mov	r5, r0
    neg = 1;
 750:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 754:	01a0e001 	moveq	lr, r1
  neg = 0;
 758:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 75c:	e3a07000 	mov	r7, #0
  b = base;
 760:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 764:	e3a06001 	mov	r6, #1
{
 768:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 76c:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 770:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 774:	e3a0c000 	mov	ip, #0
 778:	ea000002 	b	788 <printint+0x58>
        if(r >= d) {
 77c:	e1520000 	cmp	r2, r0
            r = r - d;
 780:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 784:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 788:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 78c:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 790:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 794:	e2011001 	and	r1, r1, #1
 798:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 79c:	1afffff6 	bne	77c <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7a0:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 7a4:	e35c0000 	cmp	ip, #0
 7a8:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7ac:	e2871001 	add	r1, r7, #1
 7b0:	e7d93003 	ldrb	r3, [r9, r3]
 7b4:	e4c83001 	strb	r3, [r8], #1
 7b8:	11a07001 	movne	r7, r1
 7bc:	1affffea 	bne	76c <printint+0x3c>
  if(neg)
 7c0:	e35a0000 	cmp	sl, #0
 7c4:	0a000005 	beq	7e0 <printint+0xb0>
    buf[i++] = '-';
 7c8:	e24b3024 	sub	r3, fp, #36	; 0x24
 7cc:	e3a0202d 	mov	r2, #45	; 0x2d
 7d0:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 7d4:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 7d8:	e1a03002 	mov	r3, r2
 7dc:	e5402010 	strb	r2, [r0, #-16]
 7e0:	e0847007 	add	r7, r4, r7
 7e4:	ea000000 	b	7ec <printint+0xbc>
 7e8:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 7ec:	e3a02001 	mov	r2, #1
 7f0:	e24b1035 	sub	r1, fp, #53	; 0x35
 7f4:	e1a00005 	mov	r0, r5
 7f8:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 7fc:	ebfffefb 	bl	3f0 <write>

  while(--i >= 0)
 800:	e1570004 	cmp	r7, r4
 804:	1afffff7 	bne	7e8 <printint+0xb8>
    putc(fd, buf[i]);
}
 808:	e24bd020 	sub	sp, fp, #32
 80c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000810 <div>:
{
 810:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 814:	e3a02000 	mov	r2, #0
{
 818:	e28db008 	add	fp, sp, #8
 81c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 820:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 824:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 828:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 82c:	e1a0c33e 	lsr	ip, lr, r3
 830:	e20cc001 	and	ip, ip, #1
 834:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 838:	e1520001 	cmp	r2, r1
            r = r - d;
 83c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 840:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 844:	e2533001 	subs	r3, r3, #1
 848:	38bd8810 	popcc	{r4, fp, pc}
 84c:	eafffff6 	b	82c <div+0x1c>

00000850 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 850:	e92d000e 	push	{r1, r2, r3}
 854:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 858:	e28db018 	add	fp, sp, #24
 85c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 860:	e59b6004 	ldr	r6, [fp, #4]
 864:	e5d64000 	ldrb	r4, [r6]
 868:	e3540000 	cmp	r4, #0
 86c:	0a00002b 	beq	920 <printf+0xd0>
 870:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 874:	e28b8008 	add	r8, fp, #8
  state = 0;
 878:	e3a05000 	mov	r5, #0
 87c:	ea00000a 	b	8ac <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 880:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 884:	01a05004 	moveq	r5, r4
      if(c == '%'){
 888:	0a000004 	beq	8a0 <printf+0x50>
  write(fd, &c, 1);
 88c:	e3a02001 	mov	r2, #1
 890:	e24b1019 	sub	r1, fp, #25
 894:	e1a00007 	mov	r0, r7
 898:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 89c:	ebfffed3 	bl	3f0 <write>
  for(i = 0; fmt[i]; i++){
 8a0:	e5f64001 	ldrb	r4, [r6, #1]!
 8a4:	e3540000 	cmp	r4, #0
 8a8:	0a00001c 	beq	920 <printf+0xd0>
    if(state == 0){
 8ac:	e3550000 	cmp	r5, #0
 8b0:	0afffff2 	beq	880 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8b4:	e3550025 	cmp	r5, #37	; 0x25
 8b8:	1afffff8 	bne	8a0 <printf+0x50>
      if(c == 'd'){
 8bc:	e3540064 	cmp	r4, #100	; 0x64
 8c0:	0a000021 	beq	94c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8c8:	e3530070 	cmp	r3, #112	; 0x70
 8cc:	0a000017 	beq	930 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d0:	e3540073 	cmp	r4, #115	; 0x73
 8d4:	0a00002e 	beq	994 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8d8:	e3540063 	cmp	r4, #99	; 0x63
 8dc:	0a000021 	beq	968 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e0:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 8e4:	e3a02001 	mov	r2, #1
 8e8:	e24b1019 	sub	r1, fp, #25
 8ec:	e1a00007 	mov	r0, r7
 8f0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 8f4:	0a000023 	beq	988 <printf+0x138>
  write(fd, &c, 1);
 8f8:	ebfffebc 	bl	3f0 <write>
 8fc:	e3a02001 	mov	r2, #1
 900:	e24b1019 	sub	r1, fp, #25
 904:	e1a00007 	mov	r0, r7
 908:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 90c:	ebfffeb7 	bl	3f0 <write>
  for(i = 0; fmt[i]; i++){
 910:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 914:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 918:	e3540000 	cmp	r4, #0
 91c:	1affffe2 	bne	8ac <printf+0x5c>
    }
  }
}
 920:	e24bd018 	sub	sp, fp, #24
 924:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 928:	e28dd00c 	add	sp, sp, #12
 92c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 930:	e3a03000 	mov	r3, #0
 934:	e3a02010 	mov	r2, #16
 938:	e4981004 	ldr	r1, [r8], #4
 93c:	e1a00007 	mov	r0, r7
 940:	ebffff7a 	bl	730 <printint>
      state = 0;
 944:	e3a05000 	mov	r5, #0
 948:	eaffffd4 	b	8a0 <printf+0x50>
        printint(fd, *ap, 10, 1);
 94c:	e3a03001 	mov	r3, #1
 950:	e3a0200a 	mov	r2, #10
 954:	e4981004 	ldr	r1, [r8], #4
 958:	e1a00007 	mov	r0, r7
 95c:	ebffff73 	bl	730 <printint>
      state = 0;
 960:	e3a05000 	mov	r5, #0
 964:	eaffffcd 	b	8a0 <printf+0x50>
        putc(fd, *ap);
 968:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 96c:	e3a02001 	mov	r2, #1
 970:	e24b1019 	sub	r1, fp, #25
 974:	e1a00007 	mov	r0, r7
      state = 0;
 978:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 97c:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 980:	ebfffe9a 	bl	3f0 <write>
        ap++;
 984:	eaffffc5 	b	8a0 <printf+0x50>
  write(fd, &c, 1);
 988:	ebfffe98 	bl	3f0 <write>
      state = 0;
 98c:	e3a05000 	mov	r5, #0
 990:	eaffffc2 	b	8a0 <printf+0x50>
        s = (char*)*ap;
 994:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 998:	e3540000 	cmp	r4, #0
 99c:	0a00000b 	beq	9d0 <printf+0x180>
        while(*s != 0){
 9a0:	e5d45000 	ldrb	r5, [r4]
 9a4:	e3550000 	cmp	r5, #0
 9a8:	0affffbc 	beq	8a0 <printf+0x50>
  write(fd, &c, 1);
 9ac:	e3a02001 	mov	r2, #1
 9b0:	e24b1019 	sub	r1, fp, #25
 9b4:	e1a00007 	mov	r0, r7
 9b8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9bc:	ebfffe8b 	bl	3f0 <write>
        while(*s != 0){
 9c0:	e5f45001 	ldrb	r5, [r4, #1]!
 9c4:	e3550000 	cmp	r5, #0
 9c8:	1afffff7 	bne	9ac <printf+0x15c>
 9cc:	eaffffb3 	b	8a0 <printf+0x50>
          s = "(null)";
 9d0:	e3004b8c 	movw	r4, #2956	; 0xb8c
        while(*s != 0){
 9d4:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9d8:	e3404000 	movt	r4, #0
 9dc:	eafffff2 	b	9ac <printf+0x15c>

000009e0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	e300cb94 	movw	ip, #2964	; 0xb94
 9e4:	e340c000 	movt	ip, #0
{
 9e8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 9ec:	e2401008 	sub	r1, r0, #8
{
 9f0:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f4:	e59c3000 	ldr	r3, [ip]
 9f8:	ea000004 	b	a10 <free+0x30>
 9fc:	e1510002 	cmp	r1, r2
 a00:	3a000009 	bcc	a2c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a04:	e1530002 	cmp	r3, r2
 a08:	2a000007 	bcs	a2c <free+0x4c>
{
 a0c:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a10:	e1530001 	cmp	r3, r1
 a14:	e5932000 	ldr	r2, [r3]
 a18:	3afffff7 	bcc	9fc <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a1c:	e1530002 	cmp	r3, r2
 a20:	3afffff9 	bcc	a0c <free+0x2c>
 a24:	e1510002 	cmp	r1, r2
 a28:	2afffff7 	bcs	a0c <free+0x2c>
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

00000a7c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a7c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a80:	e3007b94 	movw	r7, #2964	; 0xb94
 a84:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a88:	e2804007 	add	r4, r0, #7
{
 a8c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a90:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a94:	e1a041a4 	lsr	r4, r4, #3
 a98:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a9c:	e3510000 	cmp	r1, #0
 aa0:	0a000029 	beq	b4c <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa4:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 aa8:	e5932004 	ldr	r2, [r3, #4]
 aac:	e1520004 	cmp	r2, r4
 ab0:	2a000019 	bcs	b1c <malloc+0xa0>
 ab4:	e3540a01 	cmp	r4, #4096	; 0x1000
 ab8:	21a05004 	movcs	r5, r4
 abc:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ac0:	e1a06185 	lsl	r6, r5, #3
 ac4:	ea000005 	b	ae0 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 acc:	e5902004 	ldr	r2, [r0, #4]
 ad0:	e1520004 	cmp	r2, r4
 ad4:	2a000012 	bcs	b24 <malloc+0xa8>
 ad8:	e5971000 	ldr	r1, [r7]
 adc:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae0:	e1510003 	cmp	r1, r3
 ae4:	1afffff7 	bne	ac8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ae8:	e1a00006 	mov	r0, r6
 aec:	ebfffee8 	bl	694 <sbrk>
 af0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 af4:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 af8:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 afc:	0a000004 	beq	b14 <malloc+0x98>
  hp->s.size = nu;
 b00:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b04:	ebffffb5 	bl	9e0 <free>
  return freep;
 b08:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b0c:	e3530000 	cmp	r3, #0
 b10:	1affffec 	bne	ac8 <malloc+0x4c>
        return 0;
 b14:	e3a00000 	mov	r0, #0
  }
}
 b18:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b1c:	e1a00003 	mov	r0, r3
 b20:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 b24:	e1540002 	cmp	r4, r2
      freep = prevp;
 b28:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b2c:	10422004 	subne	r2, r2, r4
 b30:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b34:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b38:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b3c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b40:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b44:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b48:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b4c:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 b50:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b54:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 b58:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 b5c:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 b60:	eaffffd3 	b	ab4 <malloc+0x38>
