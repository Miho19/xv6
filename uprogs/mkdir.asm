
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
  if(argc < 2){
  14:	c3a05001 	movgt	r5, #1
  18:	da00000f 	ble	5c <main+0x5c>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  1c:	e1a06004 	mov	r6, r4
  20:	e2844004 	add	r4, r4, #4
  24:	e5960000 	ldr	r0, [r6]
  28:	eb000161 	bl	5b4 <mkdir>
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
  40:	eb0000b2 	bl	310 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  44:	e5962000 	ldr	r2, [r6]
  48:	e3001b70 	movw	r1, #2928	; 0xb70
  4c:	e3a00002 	mov	r0, #2
  50:	e3401000 	movt	r1, #0
  54:	eb0001f9 	bl	840 <printf>
      break;
  58:	eafffff8 	b	40 <main+0x40>
    printf(2, "Usage: mkdir files...\n");
  5c:	e3001b58 	movw	r1, #2904	; 0xb58
  60:	e3a00002 	mov	r0, #2
  64:	e3401000 	movt	r1, #0
  68:	eb0001f4 	bl	840 <printf>
    exit();
  6c:	eb0000a7 	bl	310 <exit>

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
  b8:	e3530000 	cmp	r3, #0
  bc:	0a000006 	beq	dc <strcmp+0x44>
  c0:	e5f12001 	ldrb	r2, [r1, #1]!
  c4:	e1530002 	cmp	r3, r2
  c8:	0afffff9 	beq	b4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  cc:	e0430002 	sub	r0, r3, r2
  d0:	e28bd000 	add	sp, fp, #0
  d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d8:	e12fff1e 	bx	lr
  dc:	e5d12001 	ldrb	r2, [r1, #1]
  e0:	e0430002 	sub	r0, r3, r2
  e4:	e28bd000 	add	sp, fp, #0
  e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ec:	e12fff1e 	bx	lr

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  f8:	e5d03000 	ldrb	r3, [r0]
  fc:	e3530000 	cmp	r3, #0
 100:	0a000009 	beq	12c <strlen+0x3c>
 104:	e1a02000 	mov	r2, r0
 108:	e3a03000 	mov	r3, #0
 10c:	e5f21001 	ldrb	r1, [r2, #1]!
 110:	e2833001 	add	r3, r3, #1
 114:	e3510000 	cmp	r1, #0
 118:	e1a00003 	mov	r0, r3
 11c:	1afffffa 	bne	10c <strlen+0x1c>
    ;
  return n;
}
 120:	e28bd000 	add	sp, fp, #0
 124:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 128:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 12c:	e1a00003 	mov	r0, r3
 130:	eafffffa 	b	120 <strlen+0x30>

00000134 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 134:	e3520000 	cmp	r2, #0
{
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 140:	0a000004 	beq	158 <memset+0x24>
 144:	e6ef1071 	uxtb	r1, r1
 148:	e0802002 	add	r2, r0, r2
 14c:	e4c01001 	strb	r1, [r0], #1
 150:	e1520000 	cmp	r2, r0
 154:	1afffffc 	bne	14c <memset+0x18>
  return (void *)p;
}
 158:	e28bd000 	add	sp, fp, #0
 15c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 160:	e12fff1e 	bx	lr

00000164 <strchr>:

char*
strchr(const char *s, char c)
{
 164:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 168:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 16c:	e5d02000 	ldrb	r2, [r0]
 170:	e3520000 	cmp	r2, #0
 174:	0a00000b 	beq	1a8 <strchr+0x44>
    if(*s == c)
 178:	e1510002 	cmp	r1, r2
 17c:	1a000002 	bne	18c <strchr+0x28>
 180:	ea000005 	b	19c <strchr+0x38>
 184:	e1530001 	cmp	r3, r1
 188:	0a000003 	beq	19c <strchr+0x38>
  for(; *s; s++)
 18c:	e5f03001 	ldrb	r3, [r0, #1]!
 190:	e3530000 	cmp	r3, #0
 194:	1afffffa 	bne	184 <strchr+0x20>
      return (char*)s;
  return 0;
 198:	e1a00003 	mov	r0, r3
}
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr
  return 0;
 1a8:	e1a00002 	mov	r0, r2
 1ac:	eafffffa 	b	19c <strchr+0x38>

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1b4:	e1a08000 	mov	r8, r0
 1b8:	e28db018 	add	fp, sp, #24
 1bc:	e1a07001 	mov	r7, r1
 1c0:	e24dd00c 	sub	sp, sp, #12
 1c4:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	e3a05000 	mov	r5, #0
 1cc:	ea000008 	b	1f4 <gets+0x44>
    cc = read(0, &c, 1);
 1d0:	eb000075 	bl	3ac <read>
    if(cc < 1)
 1d4:	e3500000 	cmp	r0, #0
 1d8:	da00000b 	ble	20c <gets+0x5c>
      break;
    buf[i++] = c;
 1dc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1e0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1e4:	e353000d 	cmp	r3, #13
 1e8:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 1ec:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1f0:	0a000005 	beq	20c <gets+0x5c>
    cc = read(0, &c, 1);
 1f4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1f8:	e0854002 	add	r4, r5, r2
 1fc:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 200:	e24b101d 	sub	r1, fp, #29
 204:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 208:	bafffff0 	blt	1d0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 20c:	e3a03000 	mov	r3, #0
  return buf;
}
 210:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 214:	e7c83005 	strb	r3, [r8, r5]
}
 218:	e24bd018 	sub	sp, fp, #24
 21c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000220 <stat>:

int
stat(char *n, struct stat *st)
{
 220:	e92d4830 	push	{r4, r5, fp, lr}
 224:	e1a04001 	mov	r4, r1
 228:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22c:	e3a01000 	mov	r1, #0
 230:	eb00009e 	bl	4b0 <open>
  if(fd < 0)
 234:	e2505000 	subs	r5, r0, #0
 238:	ba000006 	blt	258 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 23c:	e1a01004 	mov	r1, r4
 240:	eb0000c1 	bl	54c <fstat>
 244:	e1a04000 	mov	r4, r0
  close(fd);
 248:	e1a00005 	mov	r0, r5
 24c:	eb000070 	bl	414 <close>
  return r;
}
 250:	e1a00004 	mov	r0, r4
 254:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 258:	e3e04000 	mvn	r4, #0
 25c:	eafffffb 	b	250 <stat+0x30>

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 264:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 268:	e5d02000 	ldrb	r2, [r0]
 26c:	e2423030 	sub	r3, r2, #48	; 0x30
 270:	e3530009 	cmp	r3, #9
 274:	e3a03000 	mov	r3, #0
 278:	8a000006 	bhi	298 <atoi+0x38>
    n = n*10 + *s++ - '0';
 27c:	e3a0c00a 	mov	ip, #10
 280:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 284:	e5f02001 	ldrb	r2, [r0, #1]!
 288:	e2421030 	sub	r1, r2, #48	; 0x30
 28c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 290:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 294:	9afffff9 	bls	280 <atoi+0x20>
  return n;
}
 298:	e1a00003 	mov	r0, r3
 29c:	e28bd000 	add	sp, fp, #0
 2a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a4:	e12fff1e 	bx	lr

000002a8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a8:	e3520000 	cmp	r2, #0
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 2b4:	da000005 	ble	2d0 <memmove+0x28>
 2b8:	e0812002 	add	r2, r1, r2
 2bc:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2c0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 2c4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2c8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 2cc:	1afffffb 	bne	2c0 <memmove+0x18>
  return vdst;
}
 2d0:	e28bd000 	add	sp, fp, #0
 2d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d8:	e12fff1e 	bx	lr

000002dc <fork>:
 2dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f0:	e3a00001 	mov	r0, #1
 2f4:	ef000040 	svc	0x00000040
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 300:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 304:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 308:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 30c:	e12fff1e 	bx	lr

00000310 <exit>:
 310:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 314:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 318:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 31c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 320:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 324:	e3a00002 	mov	r0, #2
 328:	ef000040 	svc	0x00000040
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 334:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 338:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 33c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <wait>:
 344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 348:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 34c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 350:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 354:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 358:	e3a00003 	mov	r0, #3
 35c:	ef000040 	svc	0x00000040
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 368:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 36c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 370:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <pipe>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00004 	mov	r0, #4
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <read>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00005 	mov	r0, #5
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <write>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00010 	mov	r0, #16
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <close>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00015 	mov	r0, #21
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <kill>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00006 	mov	r0, #6
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <exec>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00007 	mov	r0, #7
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <open>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a0000f 	mov	r0, #15
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <mknod>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00011 	mov	r0, #17
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <unlink>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00012 	mov	r0, #18
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <fstat>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00008 	mov	r0, #8
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <link>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00013 	mov	r0, #19
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <mkdir>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00014 	mov	r0, #20
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <chdir>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00009 	mov	r0, #9
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <dup>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a0000a 	mov	r0, #10
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <getpid>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a0000b 	mov	r0, #11
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <sbrk>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a0000c 	mov	r0, #12
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <sleep>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000d 	mov	r0, #13
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <uptime>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000e 	mov	r0, #14
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 724:	e1a09fa1 	lsr	r9, r1, #31
 728:	e3530000 	cmp	r3, #0
 72c:	03a09000 	moveq	r9, #0
 730:	12099001 	andne	r9, r9, #1
{
 734:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 738:	e3590000 	cmp	r9, #0
 73c:	e3008b8c 	movw	r8, #2956	; 0xb8c
    neg = 1;
    x = -xx;
 740:	1261e000 	rsbne	lr, r1, #0
 744:	e3408000 	movt	r8, #0
 748:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 74c:	e1a04000 	mov	r4, r0
    neg = 1;
 750:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 754:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 758:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 75c:	e3a05001 	mov	r5, #1
{
 760:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 764:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 768:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 76c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 770:	e1a0033e 	lsr	r0, lr, r3
 774:	e2000001 	and	r0, r0, #1
 778:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 77c:	e1520001 	cmp	r2, r1
            r = r - d;
 780:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 784:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 788:	e2533001 	subs	r3, r3, #1
 78c:	2afffff7 	bcs	770 <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 790:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 794:	e35c0000 	cmp	ip, #0
 798:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 79c:	e2873001 	add	r3, r7, #1
 7a0:	e7d81001 	ldrb	r1, [r8, r1]
 7a4:	e5e61001 	strb	r1, [r6, #1]!
 7a8:	11a07003 	movne	r7, r3
 7ac:	1affffec 	bne	764 <printint+0x44>
  if(neg)
 7b0:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 7b4:	124b201c 	subne	r2, fp, #28
 7b8:	10822003 	addne	r2, r2, r3
 7bc:	13a0102d 	movne	r1, #45	; 0x2d
 7c0:	12873002 	addne	r3, r7, #2
 7c4:	15421010 	strbne	r1, [r2, #-16]
 7c8:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 7cc:	e2435001 	sub	r5, r3, #1
 7d0:	e0826003 	add	r6, r2, r3
 7d4:	e5763001 	ldrb	r3, [r6, #-1]!
 7d8:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 7dc:	e3a02001 	mov	r2, #1
 7e0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7e4:	e1a00004 	mov	r0, r4
 7e8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7ec:	ebfffefb 	bl	3e0 <write>
  while(--i >= 0)
 7f0:	e3750001 	cmn	r5, #1
 7f4:	1afffff6 	bne	7d4 <printint+0xb4>
    putc(fd, buf[i]);
}
 7f8:	e24bd01c 	sub	sp, fp, #28
 7fc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000800 <div>:
{
 800:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 804:	e3a02000 	mov	r2, #0
{
 808:	e28db008 	add	fp, sp, #8
 80c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 810:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 814:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 818:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 81c:	e1a0c33e 	lsr	ip, lr, r3
 820:	e20cc001 	and	ip, ip, #1
 824:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 828:	e1520001 	cmp	r2, r1
            r = r - d;
 82c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 830:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 834:	e2533001 	subs	r3, r3, #1
 838:	2afffff7 	bcs	81c <div+0x1c>
}
 83c:	e8bd8810 	pop	{r4, fp, pc}

00000840 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 840:	e92d000e 	push	{r1, r2, r3}
 844:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 848:	e28db018 	add	fp, sp, #24
 84c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 850:	e59b6004 	ldr	r6, [fp, #4]
 854:	e5d64000 	ldrb	r4, [r6]
 858:	e3540000 	cmp	r4, #0
 85c:	0a00002b 	beq	910 <printf+0xd0>
 860:	e1a07000 	mov	r7, r0
 864:	e28b8008 	add	r8, fp, #8
 868:	e3a05000 	mov	r5, #0
 86c:	ea00000a 	b	89c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 870:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 874:	01a05004 	moveq	r5, r4
      if(c == '%'){
 878:	0a000004 	beq	890 <printf+0x50>
 87c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 880:	e3a02001 	mov	r2, #1
 884:	e1a00007 	mov	r0, r7
 888:	e5614006 	strb	r4, [r1, #-6]!
 88c:	ebfffed3 	bl	3e0 <write>
  for(i = 0; fmt[i]; i++){
 890:	e5f64001 	ldrb	r4, [r6, #1]!
 894:	e3540000 	cmp	r4, #0
 898:	0a00001c 	beq	910 <printf+0xd0>
    if(state == 0){
 89c:	e3550000 	cmp	r5, #0
 8a0:	0afffff2 	beq	870 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8a4:	e3550025 	cmp	r5, #37	; 0x25
 8a8:	1afffff8 	bne	890 <printf+0x50>
      if(c == 'd'){
 8ac:	e3540064 	cmp	r4, #100	; 0x64
 8b0:	0a000037 	beq	994 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8b4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8b8:	e3530070 	cmp	r3, #112	; 0x70
 8bc:	0a000017 	beq	920 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c0:	e3540073 	cmp	r4, #115	; 0x73
 8c4:	0a00001c 	beq	93c <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8c8:	e3540063 	cmp	r4, #99	; 0x63
 8cc:	0a000037 	beq	9b0 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d0:	e3540025 	cmp	r4, #37	; 0x25
 8d4:	0a000027 	beq	978 <printf+0x138>
  write(fd, &c, 1);
 8d8:	e3a02001 	mov	r2, #1
 8dc:	e24b1019 	sub	r1, fp, #25
 8e0:	e1a00007 	mov	r0, r7
 8e4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8e8:	ebfffebc 	bl	3e0 <write>
 8ec:	e3a02001 	mov	r2, #1
 8f0:	e24b101a 	sub	r1, fp, #26
 8f4:	e1a00007 	mov	r0, r7
 8f8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8fc:	ebfffeb7 	bl	3e0 <write>
  for(i = 0; fmt[i]; i++){
 900:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 904:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 908:	e3540000 	cmp	r4, #0
 90c:	1affffe2 	bne	89c <printf+0x5c>
    }
  }
}
 910:	e24bd018 	sub	sp, fp, #24
 914:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 918:	e28dd00c 	add	sp, sp, #12
 91c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 920:	e3a03000 	mov	r3, #0
 924:	e3a02010 	mov	r2, #16
 928:	e4981004 	ldr	r1, [r8], #4
 92c:	e1a00007 	mov	r0, r7
 930:	ebffff7a 	bl	720 <printint>
      state = 0;
 934:	e3a05000 	mov	r5, #0
 938:	eaffffd4 	b	890 <printf+0x50>
        s = (char*)*ap;
 93c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 940:	e3540000 	cmp	r4, #0
 944:	0a000021 	beq	9d0 <printf+0x190>
        while(*s != 0){
 948:	e5d45000 	ldrb	r5, [r4]
 94c:	e3550000 	cmp	r5, #0
 950:	0affffce 	beq	890 <printf+0x50>
  write(fd, &c, 1);
 954:	e3a02001 	mov	r2, #1
 958:	e24b101d 	sub	r1, fp, #29
 95c:	e1a00007 	mov	r0, r7
 960:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 964:	ebfffe9d 	bl	3e0 <write>
        while(*s != 0){
 968:	e5f45001 	ldrb	r5, [r4, #1]!
 96c:	e3550000 	cmp	r5, #0
 970:	1afffff7 	bne	954 <printf+0x114>
 974:	eaffffc5 	b	890 <printf+0x50>
 978:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 97c:	e3a02001 	mov	r2, #1
 980:	e1a00007 	mov	r0, r7
 984:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 988:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 98c:	ebfffe93 	bl	3e0 <write>
 990:	eaffffbe 	b	890 <printf+0x50>
        printint(fd, *ap, 10, 1);
 994:	e3a03001 	mov	r3, #1
 998:	e3a0200a 	mov	r2, #10
 99c:	e4981004 	ldr	r1, [r8], #4
 9a0:	e1a00007 	mov	r0, r7
 9a4:	ebffff5d 	bl	720 <printint>
      state = 0;
 9a8:	e3a05000 	mov	r5, #0
 9ac:	eaffffb7 	b	890 <printf+0x50>
        putc(fd, *ap);
 9b0:	e4983004 	ldr	r3, [r8], #4
 9b4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9b8:	e3a02001 	mov	r2, #1
 9bc:	e1a00007 	mov	r0, r7
      state = 0;
 9c0:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 9c4:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 9c8:	ebfffe84 	bl	3e0 <write>
 9cc:	eaffffaf 	b	890 <printf+0x50>
          s = "(null)";
 9d0:	e3004ba0 	movw	r4, #2976	; 0xba0
        while(*s != 0){
 9d4:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9d8:	e3404000 	movt	r4, #0
 9dc:	eaffffdc 	b	954 <printf+0x114>

000009e0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	e300cba8 	movw	ip, #2984	; 0xba8
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
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
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
 a80:	e3007ba8 	movw	r7, #2984	; 0xba8
 a84:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a88:	e2804007 	add	r4, r0, #7
{
 a8c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 a90:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a94:	e1a041a4 	lsr	r4, r4, #3
 a98:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a9c:	e3530000 	cmp	r3, #0
 aa0:	0a000027 	beq	b44 <malloc+0xc8>
 aa4:	e5930000 	ldr	r0, [r3]
 aa8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 aac:	e1540002 	cmp	r4, r2
 ab0:	9a000019 	bls	b1c <malloc+0xa0>
 ab4:	e3540a01 	cmp	r4, #4096	; 0x1000
 ab8:	21a05004 	movcs	r5, r4
 abc:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ac0:	e1a06185 	lsl	r6, r5, #3
 ac4:	ea000003 	b	ad8 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 acc:	e5902004 	ldr	r2, [r0, #4]
 ad0:	e1540002 	cmp	r4, r2
 ad4:	9a000010 	bls	b1c <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ad8:	e5972000 	ldr	r2, [r7]
 adc:	e1a03000 	mov	r3, r0
 ae0:	e1520000 	cmp	r2, r0
 ae4:	1afffff7 	bne	ac8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ae8:	e1a00006 	mov	r0, r6
 aec:	ebfffee4 	bl	684 <sbrk>
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
 b44:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 b48:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b4c:	e5870000 	str	r0, [r7]
 b50:	e5870004 	str	r0, [r7, #4]
 b54:	eaffffd6 	b	ab4 <malloc+0x38>
