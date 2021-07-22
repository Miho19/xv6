
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	c1a08000 	movgt	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  10:	c2814004 	addgt	r4, r1, #4
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  14:	c3a05001 	movgt	r5, #1
  if(argc <= 1){
  18:	da000013 	ble	6c <main+0x6c>
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb000145 	bl	540 <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000006 	blt	54 <main+0x54>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	eb00000e 	bl	78 <cat>
  for(i = 1; i < argc; i++){
  3c:	e2855001 	add	r5, r5, #1
    close(fd);
  40:	e1a00007 	mov	r0, r7
  44:	eb000116 	bl	4a4 <close>
  for(i = 1; i < argc; i++){
  48:	e1580005 	cmp	r8, r5
  4c:	1afffff2 	bne	1c <main+0x1c>
  }
  exit();
  50:	eb0000c5 	bl	36c <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  54:	e5962000 	ldr	r2, [r6]
  58:	e3001bf8 	movw	r1, #3064	; 0xbf8
  5c:	e3a00001 	mov	r0, #1
  60:	e3401000 	movt	r1, #0
  64:	eb000219 	bl	8d0 <printf>
      exit();
  68:	eb0000bf 	bl	36c <exit>
    cat(0);
  6c:	e3a00000 	mov	r0, #0
  70:	eb000000 	bl	78 <cat>
    exit();
  74:	eb0000bc 	bl	36c <exit>

00000078 <cat>:
{
  78:	e92d4830 	push	{r4, r5, fp, lr}
  while((n = read(fd, buf, sizeof(buf))) > 0)
  7c:	e3004c38 	movw	r4, #3128	; 0xc38
{
  80:	e28db00c 	add	fp, sp, #12
  84:	e1a05000 	mov	r5, r0
  while((n = read(fd, buf, sizeof(buf))) > 0)
  88:	e3404000 	movt	r4, #0
  8c:	ea000002 	b	9c <cat+0x24>
    write(1, buf, n);
  90:	e1a01004 	mov	r1, r4
  94:	e3a00001 	mov	r0, #1
  98:	eb0000f4 	bl	470 <write>
  while((n = read(fd, buf, sizeof(buf))) > 0)
  9c:	e3a02c02 	mov	r2, #512	; 0x200
  a0:	e1a01004 	mov	r1, r4
  a4:	e1a00005 	mov	r0, r5
  a8:	eb0000e3 	bl	43c <read>
  ac:	e2502000 	subs	r2, r0, #0
  b0:	cafffff6 	bgt	90 <cat+0x18>
  if(n < 0){
  b4:	08bd8830 	popeq	{r4, r5, fp, pc}
    printf(1, "cat: read error\n");
  b8:	e3001be4 	movw	r1, #3044	; 0xbe4
  bc:	e3a00001 	mov	r0, #1
  c0:	e3401000 	movt	r1, #0
  c4:	eb000201 	bl	8d0 <printf>
    exit();
  c8:	eb0000a7 	bl	36c <exit>

000000cc <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d0:	e2402001 	sub	r2, r0, #1
  d4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d8:	e4d13001 	ldrb	r3, [r1], #1
  dc:	e3530000 	cmp	r3, #0
  e0:	e5e23001 	strb	r3, [r2, #1]!
  e4:	1afffffb 	bne	d8 <strcpy+0xc>
    ;
  return os;
}
  e8:	e28bd000 	add	sp, fp, #0
  ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f0:	e12fff1e 	bx	lr

000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  fc:	e5d03000 	ldrb	r3, [r0]
 100:	e5d12000 	ldrb	r2, [r1]
 104:	e3530000 	cmp	r3, #0
 108:	1a000004 	bne	120 <strcmp+0x2c>
 10c:	ea000005 	b	128 <strcmp+0x34>
 110:	e5f03001 	ldrb	r3, [r0, #1]!
 114:	e5f12001 	ldrb	r2, [r1, #1]!
 118:	e3530000 	cmp	r3, #0
 11c:	0a000001 	beq	128 <strcmp+0x34>
 120:	e1530002 	cmp	r3, r2
 124:	0afffff9 	beq	110 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 128:	e0430002 	sub	r0, r3, r2
 12c:	e28bd000 	add	sp, fp, #0
 130:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 134:	e12fff1e 	bx	lr

00000138 <strlen>:

uint
strlen(char *s)
{
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 140:	e5d03000 	ldrb	r3, [r0]
 144:	e3530000 	cmp	r3, #0
 148:	0a000008 	beq	170 <strlen+0x38>
 14c:	e2601001 	rsb	r1, r0, #1
 150:	e1a03000 	mov	r3, r0
    ;
 154:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 158:	e5f32001 	ldrb	r2, [r3, #1]!
 15c:	e3520000 	cmp	r2, #0
 160:	1afffffb 	bne	154 <strlen+0x1c>
  return n;
}
 164:	e28bd000 	add	sp, fp, #0
 168:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 16c:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 170:	e1a00003 	mov	r0, r3
}
 174:	e28bd000 	add	sp, fp, #0
 178:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 17c:	e12fff1e 	bx	lr

00000180 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 180:	e3520000 	cmp	r2, #0
{
 184:	e1a03000 	mov	r3, r0
 188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 18c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 190:	0a000004 	beq	1a8 <memset+0x28>
 194:	e6ef1071 	uxtb	r1, r1
 198:	e0800002 	add	r0, r0, r2
 19c:	e4c31001 	strb	r1, [r3], #1
 1a0:	e1500003 	cmp	r0, r3
 1a4:	1afffffc 	bne	19c <memset+0x1c>
  return (void *)p;
}
 1a8:	e28bd000 	add	sp, fp, #0
 1ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b0:	e12fff1e 	bx	lr

000001b4 <strchr>:

char*
strchr(const char *s, char c)
{
 1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1bc:	e5d02000 	ldrb	r2, [r0]
 1c0:	e3520000 	cmp	r2, #0
 1c4:	0a00000b 	beq	1f8 <strchr+0x44>
    if(*s == c)
 1c8:	e1520001 	cmp	r2, r1
 1cc:	1a000002 	bne	1dc <strchr+0x28>
 1d0:	ea000005 	b	1ec <strchr+0x38>
 1d4:	e1530001 	cmp	r3, r1
 1d8:	0a000003 	beq	1ec <strchr+0x38>
  for(; *s; s++)
 1dc:	e5f03001 	ldrb	r3, [r0, #1]!
 1e0:	e3530000 	cmp	r3, #0
 1e4:	1afffffa 	bne	1d4 <strchr+0x20>
      return (char*)s;
  return 0;
 1e8:	e1a00003 	mov	r0, r3
}
 1ec:	e28bd000 	add	sp, fp, #0
 1f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1f4:	e12fff1e 	bx	lr
  return 0;
 1f8:	e1a00002 	mov	r0, r2
 1fc:	eafffffa 	b	1ec <strchr+0x38>

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 204:	e1a03000 	mov	r3, r0
 208:	e28db014 	add	fp, sp, #20
 20c:	e1a07000 	mov	r7, r0
 210:	e24dd008 	sub	sp, sp, #8
 214:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 218:	e3a04000 	mov	r4, #0
 21c:	ea000008 	b	244 <gets+0x44>
    cc = read(0, &c, 1);
 220:	eb000085 	bl	43c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 224:	e1a03005 	mov	r3, r5
    if(cc < 1)
 228:	e3500000 	cmp	r0, #0
 22c:	da00000b 	ble	260 <gets+0x60>
    buf[i++] = c;
 230:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 234:	e352000d 	cmp	r2, #13
 238:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 23c:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 240:	0a00000b 	beq	274 <gets+0x74>
    cc = read(0, &c, 1);
 244:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 248:	e0844002 	add	r4, r4, r2
 24c:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 250:	e24b1015 	sub	r1, fp, #21
 254:	e3a00000 	mov	r0, #0
 258:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 25c:	baffffef 	blt	220 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 260:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 264:	e3a03000 	mov	r3, #0
 268:	e5c53000 	strb	r3, [r5]
}
 26c:	e24bd014 	sub	sp, fp, #20
 270:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 274:	e0875004 	add	r5, r7, r4
 278:	eafffff8 	b	260 <gets+0x60>

0000027c <stat>:

int
stat(char *n, struct stat *st)
{
 27c:	e92d4830 	push	{r4, r5, fp, lr}
 280:	e1a04001 	mov	r4, r1
 284:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 288:	e3a01000 	mov	r1, #0
 28c:	eb0000ab 	bl	540 <open>
  if(fd < 0)
 290:	e2505000 	subs	r5, r0, #0
 294:	ba000006 	blt	2b4 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 298:	e1a01004 	mov	r1, r4
 29c:	eb0000ce 	bl	5dc <fstat>
 2a0:	e1a04000 	mov	r4, r0
  close(fd);
 2a4:	e1a00005 	mov	r0, r5
 2a8:	eb00007d 	bl	4a4 <close>
  return r;
}
 2ac:	e1a00004 	mov	r0, r4
 2b0:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2b4:	e3e04000 	mvn	r4, #0
 2b8:	eafffffb 	b	2ac <stat+0x30>

000002bc <atoi>:

int
atoi(const char *s)
{
 2bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2c0:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c4:	e5d02000 	ldrb	r2, [r0]
 2c8:	e2423030 	sub	r3, r2, #48	; 0x30
 2cc:	e3530009 	cmp	r3, #9
  n = 0;
 2d0:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 2d4:	8a000006 	bhi	2f4 <atoi+0x38>
    n = n*10 + *s++ - '0';
 2d8:	e3a0c00a 	mov	ip, #10
 2dc:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 2e0:	e5f02001 	ldrb	r2, [r0, #1]!
 2e4:	e2421030 	sub	r1, r2, #48	; 0x30
 2e8:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 2ec:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 2f0:	9afffff9 	bls	2dc <atoi+0x20>
  return n;
}
 2f4:	e1a00003 	mov	r0, r3
 2f8:	e28bd000 	add	sp, fp, #0
 2fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 300:	e12fff1e 	bx	lr

00000304 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 304:	e3520000 	cmp	r2, #0
{
 308:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 30c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 310:	da000005 	ble	32c <memmove+0x28>
 314:	e0812002 	add	r2, r1, r2
 318:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 31c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 320:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 324:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 328:	1afffffb 	bne	31c <memmove+0x18>
  return vdst;
}
 32c:	e28bd000 	add	sp, fp, #0
 330:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 334:	e12fff1e 	bx	lr

00000338 <fork>:
 338:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 33c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 340:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 344:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 348:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 34c:	e3a00001 	mov	r0, #1
 350:	ef000040 	svc	0x00000040
 354:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 358:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 35c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 360:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 364:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 368:	e12fff1e 	bx	lr

0000036c <exit>:
 36c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 370:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 374:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 378:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 37c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 380:	e3a00002 	mov	r0, #2
 384:	ef000040 	svc	0x00000040
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 394:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 398:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <wait>:
 3a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b4:	e3a00003 	mov	r0, #3
 3b8:	ef000040 	svc	0x00000040
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <lseek>:
 3d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e8:	e3a00016 	mov	r0, #22
 3ec:	ef000040 	svc	0x00000040
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 404:	e12fff1e 	bx	lr

00000408 <pipe>:
 408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 40c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 410:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 414:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 418:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 41c:	e3a00004 	mov	r0, #4
 420:	ef000040 	svc	0x00000040
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 430:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 438:	e12fff1e 	bx	lr

0000043c <read>:
 43c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 440:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 444:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 448:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 44c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 450:	e3a00005 	mov	r0, #5
 454:	ef000040 	svc	0x00000040
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 464:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 468:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 46c:	e12fff1e 	bx	lr

00000470 <write>:
 470:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 474:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 478:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 47c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 480:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 484:	e3a00010 	mov	r0, #16
 488:	ef000040 	svc	0x00000040
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 498:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a0:	e12fff1e 	bx	lr

000004a4 <close>:
 4a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b8:	e3a00015 	mov	r0, #21
 4bc:	ef000040 	svc	0x00000040
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d4:	e12fff1e 	bx	lr

000004d8 <kill>:
 4d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ec:	e3a00006 	mov	r0, #6
 4f0:	ef000040 	svc	0x00000040
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 500:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 508:	e12fff1e 	bx	lr

0000050c <exec>:
 50c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 51c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 520:	e3a00007 	mov	r0, #7
 524:	ef000040 	svc	0x00000040
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 53c:	e12fff1e 	bx	lr

00000540 <open>:
 540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 54c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 554:	e3a0000f 	mov	r0, #15
 558:	ef000040 	svc	0x00000040
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 570:	e12fff1e 	bx	lr

00000574 <mknod>:
 574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 57c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 588:	e3a00011 	mov	r0, #17
 58c:	ef000040 	svc	0x00000040
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 59c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a4:	e12fff1e 	bx	lr

000005a8 <unlink>:
 5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5bc:	e3a00012 	mov	r0, #18
 5c0:	ef000040 	svc	0x00000040
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d8:	e12fff1e 	bx	lr

000005dc <fstat>:
 5dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f0:	e3a00008 	mov	r0, #8
 5f4:	ef000040 	svc	0x00000040
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 60c:	e12fff1e 	bx	lr

00000610 <link>:
 610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 61c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 624:	e3a00013 	mov	r0, #19
 628:	ef000040 	svc	0x00000040
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 63c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 640:	e12fff1e 	bx	lr

00000644 <mkdir>:
 644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 64c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 658:	e3a00014 	mov	r0, #20
 65c:	ef000040 	svc	0x00000040
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 66c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 674:	e12fff1e 	bx	lr

00000678 <chdir>:
 678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 67c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 68c:	e3a00009 	mov	r0, #9
 690:	ef000040 	svc	0x00000040
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a8:	e12fff1e 	bx	lr

000006ac <dup>:
 6ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c0:	e3a0000a 	mov	r0, #10
 6c4:	ef000040 	svc	0x00000040
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6dc:	e12fff1e 	bx	lr

000006e0 <getpid>:
 6e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f4:	e3a0000b 	mov	r0, #11
 6f8:	ef000040 	svc	0x00000040
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 70c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 710:	e12fff1e 	bx	lr

00000714 <sbrk>:
 714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 71c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 728:	e3a0000c 	mov	r0, #12
 72c:	ef000040 	svc	0x00000040
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 73c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 744:	e12fff1e 	bx	lr

00000748 <sleep>:
 748:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 74c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 750:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 754:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 758:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 75c:	e3a0000d 	mov	r0, #13
 760:	ef000040 	svc	0x00000040
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 770:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 774:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 778:	e12fff1e 	bx	lr

0000077c <uptime>:
 77c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 780:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 784:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 788:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 78c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 790:	e3a0000e 	mov	r0, #14
 794:	ef000040 	svc	0x00000040
 798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ac:	e12fff1e 	bx	lr

000007b0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7b0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7b4:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7b8:	e0133fa1 	ands	r3, r3, r1, lsr #31
 7bc:	e24b4034 	sub	r4, fp, #52	; 0x34
 7c0:	e3009c10 	movw	r9, #3088	; 0xc10
    neg = 1;
    x = -xx;
 7c4:	1261e000 	rsbne	lr, r1, #0
 7c8:	e3409000 	movt	r9, #0
{
 7cc:	e1a05000 	mov	r5, r0
    neg = 1;
 7d0:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 7d4:	01a0e001 	moveq	lr, r1
  neg = 0;
 7d8:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 7dc:	e3a07000 	mov	r7, #0
  b = base;
 7e0:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 7e4:	e3a06001 	mov	r6, #1
{
 7e8:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 7ec:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 7f0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 7f4:	e3a0c000 	mov	ip, #0
 7f8:	ea000002 	b	808 <printint+0x58>
        if(r >= d) {
 7fc:	e1520000 	cmp	r2, r0
            r = r - d;
 800:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 804:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 808:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 80c:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 810:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 814:	e2011001 	and	r1, r1, #1
 818:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 81c:	1afffff6 	bne	7fc <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 820:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 824:	e35c0000 	cmp	ip, #0
 828:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 82c:	e2871001 	add	r1, r7, #1
 830:	e7d93003 	ldrb	r3, [r9, r3]
 834:	e4c83001 	strb	r3, [r8], #1
 838:	11a07001 	movne	r7, r1
 83c:	1affffea 	bne	7ec <printint+0x3c>
  if(neg)
 840:	e35a0000 	cmp	sl, #0
 844:	0a000005 	beq	860 <printint+0xb0>
    buf[i++] = '-';
 848:	e24b3024 	sub	r3, fp, #36	; 0x24
 84c:	e3a0202d 	mov	r2, #45	; 0x2d
 850:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 854:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 858:	e1a03002 	mov	r3, r2
 85c:	e5402010 	strb	r2, [r0, #-16]
 860:	e0847007 	add	r7, r4, r7
 864:	ea000000 	b	86c <printint+0xbc>
 868:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 86c:	e3a02001 	mov	r2, #1
 870:	e24b1035 	sub	r1, fp, #53	; 0x35
 874:	e1a00005 	mov	r0, r5
 878:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 87c:	ebfffefb 	bl	470 <write>

  while(--i >= 0)
 880:	e1570004 	cmp	r7, r4
 884:	1afffff7 	bne	868 <printint+0xb8>
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
 8e0:	e59b6004 	ldr	r6, [fp, #4]
 8e4:	e5d64000 	ldrb	r4, [r6]
 8e8:	e3540000 	cmp	r4, #0
 8ec:	0a00002b 	beq	9a0 <printf+0xd0>
 8f0:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 8f4:	e28b8008 	add	r8, fp, #8
  state = 0;
 8f8:	e3a05000 	mov	r5, #0
 8fc:	ea00000a 	b	92c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 900:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 904:	01a05004 	moveq	r5, r4
      if(c == '%'){
 908:	0a000004 	beq	920 <printf+0x50>
  write(fd, &c, 1);
 90c:	e3a02001 	mov	r2, #1
 910:	e24b1019 	sub	r1, fp, #25
 914:	e1a00007 	mov	r0, r7
 918:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 91c:	ebfffed3 	bl	470 <write>
  for(i = 0; fmt[i]; i++){
 920:	e5f64001 	ldrb	r4, [r6, #1]!
 924:	e3540000 	cmp	r4, #0
 928:	0a00001c 	beq	9a0 <printf+0xd0>
    if(state == 0){
 92c:	e3550000 	cmp	r5, #0
 930:	0afffff2 	beq	900 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 934:	e3550025 	cmp	r5, #37	; 0x25
 938:	1afffff8 	bne	920 <printf+0x50>
      if(c == 'd'){
 93c:	e3540064 	cmp	r4, #100	; 0x64
 940:	0a000021 	beq	9cc <printf+0xfc>
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
 954:	0a00002e 	beq	a14 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 958:	e3540063 	cmp	r4, #99	; 0x63
 95c:	0a000021 	beq	9e8 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 960:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 964:	e3a02001 	mov	r2, #1
 968:	e24b1019 	sub	r1, fp, #25
 96c:	e1a00007 	mov	r0, r7
 970:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 974:	0a000023 	beq	a08 <printf+0x138>
  write(fd, &c, 1);
 978:	ebfffebc 	bl	470 <write>
 97c:	e3a02001 	mov	r2, #1
 980:	e24b1019 	sub	r1, fp, #25
 984:	e1a00007 	mov	r0, r7
 988:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 98c:	ebfffeb7 	bl	470 <write>
  for(i = 0; fmt[i]; i++){
 990:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 994:	e3a05000 	mov	r5, #0
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
 9c0:	ebffff7a 	bl	7b0 <printint>
      state = 0;
 9c4:	e3a05000 	mov	r5, #0
 9c8:	eaffffd4 	b	920 <printf+0x50>
        printint(fd, *ap, 10, 1);
 9cc:	e3a03001 	mov	r3, #1
 9d0:	e3a0200a 	mov	r2, #10
 9d4:	e4981004 	ldr	r1, [r8], #4
 9d8:	e1a00007 	mov	r0, r7
 9dc:	ebffff73 	bl	7b0 <printint>
      state = 0;
 9e0:	e3a05000 	mov	r5, #0
 9e4:	eaffffcd 	b	920 <printf+0x50>
        putc(fd, *ap);
 9e8:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 9ec:	e3a02001 	mov	r2, #1
 9f0:	e24b1019 	sub	r1, fp, #25
 9f4:	e1a00007 	mov	r0, r7
      state = 0;
 9f8:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 9fc:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 a00:	ebfffe9a 	bl	470 <write>
        ap++;
 a04:	eaffffc5 	b	920 <printf+0x50>
  write(fd, &c, 1);
 a08:	ebfffe98 	bl	470 <write>
      state = 0;
 a0c:	e3a05000 	mov	r5, #0
 a10:	eaffffc2 	b	920 <printf+0x50>
        s = (char*)*ap;
 a14:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a18:	e3540000 	cmp	r4, #0
 a1c:	0a00000b 	beq	a50 <printf+0x180>
        while(*s != 0){
 a20:	e5d45000 	ldrb	r5, [r4]
 a24:	e3550000 	cmp	r5, #0
 a28:	0affffbc 	beq	920 <printf+0x50>
  write(fd, &c, 1);
 a2c:	e3a02001 	mov	r2, #1
 a30:	e24b1019 	sub	r1, fp, #25
 a34:	e1a00007 	mov	r0, r7
 a38:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a3c:	ebfffe8b 	bl	470 <write>
        while(*s != 0){
 a40:	e5f45001 	ldrb	r5, [r4, #1]!
 a44:	e3550000 	cmp	r5, #0
 a48:	1afffff7 	bne	a2c <printf+0x15c>
 a4c:	eaffffb3 	b	920 <printf+0x50>
          s = "(null)";
 a50:	e3004c24 	movw	r4, #3108	; 0xc24
        while(*s != 0){
 a54:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 a58:	e3404000 	movt	r4, #0
 a5c:	eafffff2 	b	a2c <printf+0x15c>

00000a60 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a60:	e300cc2c 	movw	ip, #3116	; 0xc2c
 a64:	e340c000 	movt	ip, #0
{
 a68:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a6c:	e2401008 	sub	r1, r0, #8
{
 a70:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a74:	e59c3000 	ldr	r3, [ip]
 a78:	ea000004 	b	a90 <free+0x30>
 a7c:	e1510002 	cmp	r1, r2
 a80:	3a000009 	bcc	aac <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a84:	e1530002 	cmp	r3, r2
 a88:	2a000007 	bcs	aac <free+0x4c>
{
 a8c:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a90:	e1530001 	cmp	r3, r1
 a94:	e5932000 	ldr	r2, [r3]
 a98:	3afffff7 	bcc	a7c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9c:	e1530002 	cmp	r3, r2
 aa0:	3afffff9 	bcc	a8c <free+0x2c>
 aa4:	e1510002 	cmp	r1, r2
 aa8:	2afffff7 	bcs	a8c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aac:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ab0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 ab4:	e081418e 	add	r4, r1, lr, lsl #3
 ab8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 abc:	05922004 	ldreq	r2, [r2, #4]
 ac0:	0082e00e 	addeq	lr, r2, lr
 ac4:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ac8:	05932000 	ldreq	r2, [r3]
 acc:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 ad0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 ad4:	e5932004 	ldr	r2, [r3, #4]
 ad8:	e083e182 	add	lr, r3, r2, lsl #3
 adc:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 ae0:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 ae4:	05101004 	ldreq	r1, [r0, #-4]
 ae8:	00812002 	addeq	r2, r1, r2
 aec:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 af0:	05102008 	ldreq	r2, [r0, #-8]
 af4:	05832000 	streq	r2, [r3]
}
 af8:	e8bd8810 	pop	{r4, fp, pc}

00000afc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 afc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b00:	e3007c2c 	movw	r7, #3116	; 0xc2c
 b04:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b08:	e2804007 	add	r4, r0, #7
{
 b0c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b10:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b14:	e1a041a4 	lsr	r4, r4, #3
 b18:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b1c:	e3510000 	cmp	r1, #0
 b20:	0a000029 	beq	bcc <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b24:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 b28:	e5932004 	ldr	r2, [r3, #4]
 b2c:	e1520004 	cmp	r2, r4
 b30:	2a000019 	bcs	b9c <malloc+0xa0>
 b34:	e3540a01 	cmp	r4, #4096	; 0x1000
 b38:	21a05004 	movcs	r5, r4
 b3c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b40:	e1a06185 	lsl	r6, r5, #3
 b44:	ea000005 	b	b60 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b48:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b4c:	e5902004 	ldr	r2, [r0, #4]
 b50:	e1520004 	cmp	r2, r4
 b54:	2a000012 	bcs	ba4 <malloc+0xa8>
 b58:	e5971000 	ldr	r1, [r7]
 b5c:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b60:	e1510003 	cmp	r1, r3
 b64:	1afffff7 	bne	b48 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b68:	e1a00006 	mov	r0, r6
 b6c:	ebfffee8 	bl	714 <sbrk>
 b70:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b74:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b78:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b7c:	0a000004 	beq	b94 <malloc+0x98>
  hp->s.size = nu;
 b80:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b84:	ebffffb5 	bl	a60 <free>
  return freep;
 b88:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b8c:	e3530000 	cmp	r3, #0
 b90:	1affffec 	bne	b48 <malloc+0x4c>
        return 0;
 b94:	e3a00000 	mov	r0, #0
  }
}
 b98:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b9c:	e1a00003 	mov	r0, r3
 ba0:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 ba4:	e1540002 	cmp	r4, r2
      freep = prevp;
 ba8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bac:	10422004 	subne	r2, r2, r4
 bb0:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 bb4:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 bb8:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 bbc:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 bc0:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 bc4:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 bc8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 bcc:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 bd0:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 bd4:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 bd8:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 bdc:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 be0:	eaffffd3 	b	b34 <malloc+0x38>
