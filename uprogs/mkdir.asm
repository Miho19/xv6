
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
  28:	eb00016e 	bl	5e8 <mkdir>
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
  48:	e3001ba0 	movw	r1, #2976	; 0xba0
  4c:	e3a00002 	mov	r0, #2
  50:	e3401000 	movt	r1, #0
  54:	eb000206 	bl	874 <printf>
      break;
  58:	eafffff8 	b	40 <main+0x40>
    printf(2, "Usage: mkdir files...\n");
  5c:	e3001b88 	movw	r1, #2952	; 0xb88
  60:	e3a00002 	mov	r0, #2
  64:	e3401000 	movt	r1, #0
  68:	eb000201 	bl	874 <printf>
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
  ec:	0a000008 	beq	114 <strlen+0x38>
  f0:	e2601001 	rsb	r1, r0, #1
  f4:	e1a03000 	mov	r3, r0
    ;
  f8:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
  fc:	e5f32001 	ldrb	r2, [r3, #1]!
 100:	e3520000 	cmp	r2, #0
 104:	1afffffb 	bne	f8 <strlen+0x1c>
  return n;
}
 108:	e28bd000 	add	sp, fp, #0
 10c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 110:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 114:	e1a00003 	mov	r0, r3
}
 118:	e28bd000 	add	sp, fp, #0
 11c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 120:	e12fff1e 	bx	lr

00000124 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 124:	e3520000 	cmp	r2, #0
{
 128:	e1a03000 	mov	r3, r0
 12c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 130:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 134:	0a000004 	beq	14c <memset+0x28>
 138:	e6ef1071 	uxtb	r1, r1
 13c:	e0800002 	add	r0, r0, r2
 140:	e4c31001 	strb	r1, [r3], #1
 144:	e1500003 	cmp	r0, r3
 148:	1afffffc 	bne	140 <memset+0x1c>
  return (void *)p;
}
 14c:	e28bd000 	add	sp, fp, #0
 150:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 154:	e12fff1e 	bx	lr

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 15c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 160:	e5d02000 	ldrb	r2, [r0]
 164:	e3520000 	cmp	r2, #0
 168:	0a00000b 	beq	19c <strchr+0x44>
    if(*s == c)
 16c:	e1520001 	cmp	r2, r1
 170:	1a000002 	bne	180 <strchr+0x28>
 174:	ea000005 	b	190 <strchr+0x38>
 178:	e1530001 	cmp	r3, r1
 17c:	0a000003 	beq	190 <strchr+0x38>
  for(; *s; s++)
 180:	e5f03001 	ldrb	r3, [r0, #1]!
 184:	e3530000 	cmp	r3, #0
 188:	1afffffa 	bne	178 <strchr+0x20>
      return (char*)s;
  return 0;
 18c:	e1a00003 	mov	r0, r3
}
 190:	e28bd000 	add	sp, fp, #0
 194:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 198:	e12fff1e 	bx	lr
  return 0;
 19c:	e1a00002 	mov	r0, r2
 1a0:	eafffffa 	b	190 <strchr+0x38>

000001a4 <gets>:

char*
gets(char *buf, int max)
{
 1a4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 1a8:	e1a03000 	mov	r3, r0
 1ac:	e28db014 	add	fp, sp, #20
 1b0:	e1a07000 	mov	r7, r0
 1b4:	e24dd008 	sub	sp, sp, #8
 1b8:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bc:	e3a04000 	mov	r4, #0
 1c0:	ea000008 	b	1e8 <gets+0x44>
    cc = read(0, &c, 1);
 1c4:	eb000085 	bl	3e0 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 1c8:	e1a03005 	mov	r3, r5
    if(cc < 1)
 1cc:	e3500000 	cmp	r0, #0
 1d0:	da00000b 	ble	204 <gets+0x60>
    buf[i++] = c;
 1d4:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 1d8:	e352000d 	cmp	r2, #13
 1dc:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 1e0:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 1e4:	0a00000b 	beq	218 <gets+0x74>
    cc = read(0, &c, 1);
 1e8:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 1ec:	e0844002 	add	r4, r4, r2
 1f0:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 1f4:	e24b1015 	sub	r1, fp, #21
 1f8:	e3a00000 	mov	r0, #0
 1fc:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 200:	baffffef 	blt	1c4 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 204:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 208:	e3a03000 	mov	r3, #0
 20c:	e5c53000 	strb	r3, [r5]
}
 210:	e24bd014 	sub	sp, fp, #20
 214:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 218:	e0875004 	add	r5, r7, r4
 21c:	eafffff8 	b	204 <gets+0x60>

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
 230:	eb0000ab 	bl	4e4 <open>
  if(fd < 0)
 234:	e2505000 	subs	r5, r0, #0
 238:	ba000006 	blt	258 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 23c:	e1a01004 	mov	r1, r4
 240:	eb0000ce 	bl	580 <fstat>
 244:	e1a04000 	mov	r4, r0
  close(fd);
 248:	e1a00005 	mov	r0, r5
 24c:	eb00007d 	bl	448 <close>
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
  n = 0;
 274:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
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

00000378 <lseek>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00016 	mov	r0, #22
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <pipe>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00004 	mov	r0, #4
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <read>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00005 	mov	r0, #5
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <write>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00010 	mov	r0, #16
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <close>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00015 	mov	r0, #21
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <kill>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00006 	mov	r0, #6
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <exec>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00007 	mov	r0, #7
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <open>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a0000f 	mov	r0, #15
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <mknod>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00011 	mov	r0, #17
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <unlink>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00012 	mov	r0, #18
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <fstat>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00008 	mov	r0, #8
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <link>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00013 	mov	r0, #19
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <mkdir>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00014 	mov	r0, #20
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <chdir>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00009 	mov	r0, #9
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <dup>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a0000a 	mov	r0, #10
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <getpid>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a0000b 	mov	r0, #11
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <sbrk>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000c 	mov	r0, #12
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <sleep>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000d 	mov	r0, #13
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <uptime>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000e 	mov	r0, #14
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 754:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 758:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 75c:	e0133fa1 	ands	r3, r3, r1, lsr #31
 760:	e24b4034 	sub	r4, fp, #52	; 0x34
 764:	e3009bbc 	movw	r9, #3004	; 0xbbc
    neg = 1;
    x = -xx;
 768:	1261e000 	rsbne	lr, r1, #0
 76c:	e3409000 	movt	r9, #0
{
 770:	e1a05000 	mov	r5, r0
    neg = 1;
 774:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 778:	01a0e001 	moveq	lr, r1
  neg = 0;
 77c:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 780:	e3a07000 	mov	r7, #0
  b = base;
 784:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 788:	e3a06001 	mov	r6, #1
{
 78c:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 790:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 794:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 798:	e3a0c000 	mov	ip, #0
 79c:	ea000002 	b	7ac <printint+0x58>
        if(r >= d) {
 7a0:	e1520000 	cmp	r2, r0
            r = r - d;
 7a4:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 7a8:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 7ac:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 7b0:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 7b4:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 7b8:	e2011001 	and	r1, r1, #1
 7bc:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 7c0:	1afffff6 	bne	7a0 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7c4:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 7c8:	e35c0000 	cmp	ip, #0
 7cc:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 7d0:	e2871001 	add	r1, r7, #1
 7d4:	e7d93003 	ldrb	r3, [r9, r3]
 7d8:	e4c83001 	strb	r3, [r8], #1
 7dc:	11a07001 	movne	r7, r1
 7e0:	1affffea 	bne	790 <printint+0x3c>
  if(neg)
 7e4:	e35a0000 	cmp	sl, #0
 7e8:	0a000005 	beq	804 <printint+0xb0>
    buf[i++] = '-';
 7ec:	e24b3024 	sub	r3, fp, #36	; 0x24
 7f0:	e3a0202d 	mov	r2, #45	; 0x2d
 7f4:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 7f8:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 7fc:	e1a03002 	mov	r3, r2
 800:	e5402010 	strb	r2, [r0, #-16]
 804:	e0847007 	add	r7, r4, r7
 808:	ea000000 	b	810 <printint+0xbc>
 80c:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 810:	e3a02001 	mov	r2, #1
 814:	e24b1035 	sub	r1, fp, #53	; 0x35
 818:	e1a00005 	mov	r0, r5
 81c:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 820:	ebfffefb 	bl	414 <write>

  while(--i >= 0)
 824:	e1570004 	cmp	r7, r4
 828:	1afffff7 	bne	80c <printint+0xb8>
    putc(fd, buf[i]);
}
 82c:	e24bd020 	sub	sp, fp, #32
 830:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000834 <div>:
{
 834:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 838:	e3a02000 	mov	r2, #0
{
 83c:	e28db008 	add	fp, sp, #8
 840:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 844:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 848:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 84c:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 850:	e1a0c33e 	lsr	ip, lr, r3
 854:	e20cc001 	and	ip, ip, #1
 858:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 85c:	e1520001 	cmp	r2, r1
            r = r - d;
 860:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 864:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 868:	e2533001 	subs	r3, r3, #1
 86c:	38bd8810 	popcc	{r4, fp, pc}
 870:	eafffff6 	b	850 <div+0x1c>

00000874 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 874:	e92d000e 	push	{r1, r2, r3}
 878:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 87c:	e28db018 	add	fp, sp, #24
 880:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 884:	e59b6004 	ldr	r6, [fp, #4]
 888:	e5d64000 	ldrb	r4, [r6]
 88c:	e3540000 	cmp	r4, #0
 890:	0a00002b 	beq	944 <printf+0xd0>
 894:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 898:	e28b8008 	add	r8, fp, #8
  state = 0;
 89c:	e3a05000 	mov	r5, #0
 8a0:	ea00000a 	b	8d0 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8a4:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8a8:	01a05004 	moveq	r5, r4
      if(c == '%'){
 8ac:	0a000004 	beq	8c4 <printf+0x50>
  write(fd, &c, 1);
 8b0:	e3a02001 	mov	r2, #1
 8b4:	e24b1019 	sub	r1, fp, #25
 8b8:	e1a00007 	mov	r0, r7
 8bc:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 8c0:	ebfffed3 	bl	414 <write>
  for(i = 0; fmt[i]; i++){
 8c4:	e5f64001 	ldrb	r4, [r6, #1]!
 8c8:	e3540000 	cmp	r4, #0
 8cc:	0a00001c 	beq	944 <printf+0xd0>
    if(state == 0){
 8d0:	e3550000 	cmp	r5, #0
 8d4:	0afffff2 	beq	8a4 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8d8:	e3550025 	cmp	r5, #37	; 0x25
 8dc:	1afffff8 	bne	8c4 <printf+0x50>
      if(c == 'd'){
 8e0:	e3540064 	cmp	r4, #100	; 0x64
 8e4:	0a000021 	beq	970 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8e8:	e20430f7 	and	r3, r4, #247	; 0xf7
 8ec:	e3530070 	cmp	r3, #112	; 0x70
 8f0:	0a000017 	beq	954 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8f4:	e3540073 	cmp	r4, #115	; 0x73
 8f8:	0a00002e 	beq	9b8 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8fc:	e3540063 	cmp	r4, #99	; 0x63
 900:	0a000021 	beq	98c <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 904:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 908:	e3a02001 	mov	r2, #1
 90c:	e24b1019 	sub	r1, fp, #25
 910:	e1a00007 	mov	r0, r7
 914:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 918:	0a000023 	beq	9ac <printf+0x138>
  write(fd, &c, 1);
 91c:	ebfffebc 	bl	414 <write>
 920:	e3a02001 	mov	r2, #1
 924:	e24b1019 	sub	r1, fp, #25
 928:	e1a00007 	mov	r0, r7
 92c:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 930:	ebfffeb7 	bl	414 <write>
  for(i = 0; fmt[i]; i++){
 934:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 938:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 93c:	e3540000 	cmp	r4, #0
 940:	1affffe2 	bne	8d0 <printf+0x5c>
    }
  }
}
 944:	e24bd018 	sub	sp, fp, #24
 948:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 94c:	e28dd00c 	add	sp, sp, #12
 950:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 954:	e3a03000 	mov	r3, #0
 958:	e3a02010 	mov	r2, #16
 95c:	e4981004 	ldr	r1, [r8], #4
 960:	e1a00007 	mov	r0, r7
 964:	ebffff7a 	bl	754 <printint>
      state = 0;
 968:	e3a05000 	mov	r5, #0
 96c:	eaffffd4 	b	8c4 <printf+0x50>
        printint(fd, *ap, 10, 1);
 970:	e3a03001 	mov	r3, #1
 974:	e3a0200a 	mov	r2, #10
 978:	e4981004 	ldr	r1, [r8], #4
 97c:	e1a00007 	mov	r0, r7
 980:	ebffff73 	bl	754 <printint>
      state = 0;
 984:	e3a05000 	mov	r5, #0
 988:	eaffffcd 	b	8c4 <printf+0x50>
        putc(fd, *ap);
 98c:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 990:	e3a02001 	mov	r2, #1
 994:	e24b1019 	sub	r1, fp, #25
 998:	e1a00007 	mov	r0, r7
      state = 0;
 99c:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 9a0:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 9a4:	ebfffe9a 	bl	414 <write>
        ap++;
 9a8:	eaffffc5 	b	8c4 <printf+0x50>
  write(fd, &c, 1);
 9ac:	ebfffe98 	bl	414 <write>
      state = 0;
 9b0:	e3a05000 	mov	r5, #0
 9b4:	eaffffc2 	b	8c4 <printf+0x50>
        s = (char*)*ap;
 9b8:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 9bc:	e3540000 	cmp	r4, #0
 9c0:	0a00000b 	beq	9f4 <printf+0x180>
        while(*s != 0){
 9c4:	e5d45000 	ldrb	r5, [r4]
 9c8:	e3550000 	cmp	r5, #0
 9cc:	0affffbc 	beq	8c4 <printf+0x50>
  write(fd, &c, 1);
 9d0:	e3a02001 	mov	r2, #1
 9d4:	e24b1019 	sub	r1, fp, #25
 9d8:	e1a00007 	mov	r0, r7
 9dc:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9e0:	ebfffe8b 	bl	414 <write>
        while(*s != 0){
 9e4:	e5f45001 	ldrb	r5, [r4, #1]!
 9e8:	e3550000 	cmp	r5, #0
 9ec:	1afffff7 	bne	9d0 <printf+0x15c>
 9f0:	eaffffb3 	b	8c4 <printf+0x50>
          s = "(null)";
 9f4:	e3004bd0 	movw	r4, #3024	; 0xbd0
        while(*s != 0){
 9f8:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 9fc:	e3404000 	movt	r4, #0
 a00:	eafffff2 	b	9d0 <printf+0x15c>

00000a04 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a04:	e300cbd8 	movw	ip, #3032	; 0xbd8
 a08:	e340c000 	movt	ip, #0
{
 a0c:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 a10:	e2401008 	sub	r1, r0, #8
{
 a14:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	e59c3000 	ldr	r3, [ip]
 a1c:	ea000004 	b	a34 <free+0x30>
 a20:	e1510002 	cmp	r1, r2
 a24:	3a000009 	bcc	a50 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a28:	e1530002 	cmp	r3, r2
 a2c:	2a000007 	bcs	a50 <free+0x4c>
{
 a30:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a34:	e1530001 	cmp	r3, r1
 a38:	e5932000 	ldr	r2, [r3]
 a3c:	3afffff7 	bcc	a20 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a40:	e1530002 	cmp	r3, r2
 a44:	3afffff9 	bcc	a30 <free+0x2c>
 a48:	e1510002 	cmp	r1, r2
 a4c:	2afffff7 	bcs	a30 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a50:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a54:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 a58:	e081418e 	add	r4, r1, lr, lsl #3
 a5c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 a60:	05922004 	ldreq	r2, [r2, #4]
 a64:	0082e00e 	addeq	lr, r2, lr
 a68:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a6c:	05932000 	ldreq	r2, [r3]
 a70:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 a74:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a78:	e5932004 	ldr	r2, [r3, #4]
 a7c:	e083e182 	add	lr, r3, r2, lsl #3
 a80:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 a84:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 a88:	05101004 	ldreq	r1, [r0, #-4]
 a8c:	00812002 	addeq	r2, r1, r2
 a90:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a94:	05102008 	ldreq	r2, [r0, #-8]
 a98:	05832000 	streq	r2, [r3]
}
 a9c:	e8bd8810 	pop	{r4, fp, pc}

00000aa0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 aa0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 aa4:	e3007bd8 	movw	r7, #3032	; 0xbd8
 aa8:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aac:	e2804007 	add	r4, r0, #7
{
 ab0:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 ab4:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab8:	e1a041a4 	lsr	r4, r4, #3
 abc:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ac0:	e3510000 	cmp	r1, #0
 ac4:	0a000029 	beq	b70 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 acc:	e5932004 	ldr	r2, [r3, #4]
 ad0:	e1520004 	cmp	r2, r4
 ad4:	2a000019 	bcs	b40 <malloc+0xa0>
 ad8:	e3540a01 	cmp	r4, #4096	; 0x1000
 adc:	21a05004 	movcs	r5, r4
 ae0:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 ae4:	e1a06185 	lsl	r6, r5, #3
 ae8:	ea000005 	b	b04 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aec:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 af0:	e5902004 	ldr	r2, [r0, #4]
 af4:	e1520004 	cmp	r2, r4
 af8:	2a000012 	bcs	b48 <malloc+0xa8>
 afc:	e5971000 	ldr	r1, [r7]
 b00:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b04:	e1510003 	cmp	r1, r3
 b08:	1afffff7 	bne	aec <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 b0c:	e1a00006 	mov	r0, r6
 b10:	ebfffee8 	bl	6b8 <sbrk>
 b14:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b18:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 b1c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 b20:	0a000004 	beq	b38 <malloc+0x98>
  hp->s.size = nu;
 b24:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 b28:	ebffffb5 	bl	a04 <free>
  return freep;
 b2c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 b30:	e3530000 	cmp	r3, #0
 b34:	1affffec 	bne	aec <malloc+0x4c>
        return 0;
 b38:	e3a00000 	mov	r0, #0
  }
}
 b3c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 b40:	e1a00003 	mov	r0, r3
 b44:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 b48:	e1540002 	cmp	r4, r2
      freep = prevp;
 b4c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 b50:	10422004 	subne	r2, r2, r4
 b54:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 b58:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 b5c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 b60:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 b64:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 b68:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 b6c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 b70:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 b74:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 b78:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 b7c:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 b80:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 b84:	eaffffd3 	b	ad8 <malloc+0x38>
