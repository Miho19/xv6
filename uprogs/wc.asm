
_wc:     file format elf32-littlearm


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
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  14:	c3a05001 	movgt	r5, #1
  if(argc <= 1){
  18:	da000014 	ble	70 <main+0x70>
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb00016e 	bl	5e4 <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000007 	blt	58 <main+0x58>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  38:	e5141004 	ldr	r1, [r4, #-4]
  for(i = 1; i < argc; i++){
  3c:	e2855001 	add	r5, r5, #1
    wc(fd, argv[i]);
  40:	eb00000f 	bl	84 <wc>
    close(fd);
  44:	e1a00007 	mov	r0, r7
  48:	eb00013e 	bl	548 <close>
  for(i = 1; i < argc; i++){
  4c:	e1580005 	cmp	r8, r5
  50:	1afffff1 	bne	1c <main+0x1c>
  }
  exit();
  54:	eb0000ed 	bl	410 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  58:	e5962000 	ldr	r2, [r6]
  5c:	e3001ca0 	movw	r1, #3232	; 0xca0
  60:	e3a00001 	mov	r0, #1
  64:	e3401000 	movt	r1, #0
  68:	eb00023c 	bl	960 <printf>
      exit();
  6c:	eb0000e7 	bl	410 <exit>
    wc(0, "");
  70:	e3001c9c 	movw	r1, #3228	; 0xc9c
  74:	e3a00000 	mov	r0, #0
  78:	e3401000 	movt	r1, #0
  7c:	eb000000 	bl	84 <wc>
    exit();
  80:	eb0000e2 	bl	410 <exit>

00000084 <wc>:
{
  84:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  inword = 0;
  88:	e3a04000 	mov	r4, #0
{
  8c:	e28db020 	add	fp, sp, #32
      if(strchr(" \r\t\n\v", buf[i]))
  90:	e3006c78 	movw	r6, #3192	; 0xc78
  94:	e3406000 	movt	r6, #0
  l = w = c = 0;
  98:	e1a09004 	mov	r9, r4
  9c:	e1a07004 	mov	r7, r4
{
  a0:	e24dd01c 	sub	sp, sp, #28
  a4:	e3003cdc 	movw	r3, #3292	; 0xcdc
  a8:	e3403000 	movt	r3, #0
  ac:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
  b0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
  b4:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
  l = w = c = 0;
  b8:	e50b4028 	str	r4, [fp, #-40]	; 0xffffffd8
  while((n = read(fd, buf, sizeof(buf))) > 0){
  bc:	e3a02c02 	mov	r2, #512	; 0x200
  c0:	e3001cdc 	movw	r1, #3292	; 0xcdc
  c4:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
  c8:	e3401000 	movt	r1, #0
  cc:	eb000103 	bl	4e0 <read>
  d0:	e2508000 	subs	r8, r0, #0
  d4:	da000017 	ble	138 <wc+0xb4>
  d8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
  dc:	e300acdc 	movw	sl, #3292	; 0xcdc
  e0:	e340a000 	movt	sl, #0
  e4:	e0835008 	add	r5, r3, r8
  e8:	ea000001 	b	f4 <wc+0x70>
    for(i=0; i<n; i++){
  ec:	e155000a 	cmp	r5, sl
  f0:	0a00000e 	beq	130 <wc+0xac>
      if(buf[i] == '\n')
  f4:	e4da1001 	ldrb	r1, [sl], #1
      if(strchr(" \r\t\n\v", buf[i]))
  f8:	e1a00006 	mov	r0, r6
      if(buf[i] == '\n')
  fc:	e351000a 	cmp	r1, #10
        l++;
 100:	02877001 	addeq	r7, r7, #1
      if(strchr(" \r\t\n\v", buf[i]))
 104:	eb000053 	bl	258 <strchr>
 108:	e3500000 	cmp	r0, #0
        inword = 0;
 10c:	13a04000 	movne	r4, #0
      if(strchr(" \r\t\n\v", buf[i]))
 110:	1afffff5 	bne	ec <wc+0x68>
      else if(!inword){
 114:	e3540000 	cmp	r4, #0
        w++;
 118:	051b3028 	ldreq	r3, [fp, #-40]	; 0xffffffd8
        inword = 1;
 11c:	03a04001 	moveq	r4, #1
        w++;
 120:	02833001 	addeq	r3, r3, #1
 124:	050b3028 	streq	r3, [fp, #-40]	; 0xffffffd8
    for(i=0; i<n; i++){
 128:	e155000a 	cmp	r5, sl
 12c:	1afffff0 	bne	f4 <wc+0x70>
 130:	e0899008 	add	r9, r9, r8
 134:	eaffffe0 	b	bc <wc+0x38>
  if(n < 0){
 138:	1a00000a 	bne	168 <wc+0xe4>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 13c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
 140:	e1a02007 	mov	r2, r7
 144:	e58d9000 	str	r9, [sp]
 148:	e3a00001 	mov	r0, #1
 14c:	e3001c90 	movw	r1, #3216	; 0xc90
 150:	e3401000 	movt	r1, #0
 154:	e58d3004 	str	r3, [sp, #4]
 158:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 15c:	eb0001ff 	bl	960 <printf>
}
 160:	e24bd020 	sub	sp, fp, #32
 164:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(1, "wc: read error\n");
 168:	e3001c80 	movw	r1, #3200	; 0xc80
 16c:	e3a00001 	mov	r0, #1
 170:	e3401000 	movt	r1, #0
 174:	eb0001f9 	bl	960 <printf>
    exit();
 178:	eb0000a4 	bl	410 <exit>

0000017c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 17c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 180:	e2402001 	sub	r2, r0, #1
 184:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 188:	e4d13001 	ldrb	r3, [r1], #1
 18c:	e3530000 	cmp	r3, #0
 190:	e5e23001 	strb	r3, [r2, #1]!
 194:	1afffffb 	bne	188 <strcpy+0xc>
    ;
  return os;
}
 198:	e28bd000 	add	sp, fp, #0
 19c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a0:	e12fff1e 	bx	lr

000001a4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 1ac:	e5d03000 	ldrb	r3, [r0]
 1b0:	e5d12000 	ldrb	r2, [r1]
 1b4:	e3530000 	cmp	r3, #0
 1b8:	1a000004 	bne	1d0 <strcmp+0x2c>
 1bc:	ea000005 	b	1d8 <strcmp+0x34>
 1c0:	e5f03001 	ldrb	r3, [r0, #1]!
 1c4:	e5f12001 	ldrb	r2, [r1, #1]!
 1c8:	e3530000 	cmp	r3, #0
 1cc:	0a000001 	beq	1d8 <strcmp+0x34>
 1d0:	e1530002 	cmp	r3, r2
 1d4:	0afffff9 	beq	1c0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1d8:	e0430002 	sub	r0, r3, r2
 1dc:	e28bd000 	add	sp, fp, #0
 1e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e4:	e12fff1e 	bx	lr

000001e8 <strlen>:

uint
strlen(char *s)
{
 1e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ec:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1f0:	e5d03000 	ldrb	r3, [r0]
 1f4:	e3530000 	cmp	r3, #0
 1f8:	01a00003 	moveq	r0, r3
 1fc:	0a000006 	beq	21c <strlen+0x34>
 200:	e1a02000 	mov	r2, r0
 204:	e3a03000 	mov	r3, #0
 208:	e5f21001 	ldrb	r1, [r2, #1]!
 20c:	e2833001 	add	r3, r3, #1
 210:	e3510000 	cmp	r1, #0
 214:	e1a00003 	mov	r0, r3
 218:	1afffffa 	bne	208 <strlen+0x20>
    ;
  return n;
}
 21c:	e28bd000 	add	sp, fp, #0
 220:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 224:	e12fff1e 	bx	lr

00000228 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 228:	e3520000 	cmp	r2, #0
{
 22c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 230:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 234:	0a000004 	beq	24c <memset+0x24>
 238:	e6ef1071 	uxtb	r1, r1
 23c:	e0802002 	add	r2, r0, r2
 240:	e4c01001 	strb	r1, [r0], #1
 244:	e1520000 	cmp	r2, r0
 248:	1afffffc 	bne	240 <memset+0x18>
  return (void *)p;
}
 24c:	e28bd000 	add	sp, fp, #0
 250:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 254:	e12fff1e 	bx	lr

00000258 <strchr>:

char*
strchr(const char *s, char c)
{
 258:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 25c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 260:	e5d02000 	ldrb	r2, [r0]
 264:	e3520000 	cmp	r2, #0
 268:	0a00000b 	beq	29c <strchr+0x44>
    if(*s == c)
 26c:	e1510002 	cmp	r1, r2
 270:	1a000002 	bne	280 <strchr+0x28>
 274:	ea000005 	b	290 <strchr+0x38>
 278:	e1530001 	cmp	r3, r1
 27c:	0a000003 	beq	290 <strchr+0x38>
  for(; *s; s++)
 280:	e5f03001 	ldrb	r3, [r0, #1]!
 284:	e3530000 	cmp	r3, #0
 288:	1afffffa 	bne	278 <strchr+0x20>
      return (char*)s;
  return 0;
 28c:	e1a00003 	mov	r0, r3
}
 290:	e28bd000 	add	sp, fp, #0
 294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 298:	e12fff1e 	bx	lr
  return 0;
 29c:	e1a00002 	mov	r0, r2
 2a0:	eafffffa 	b	290 <strchr+0x38>

000002a4 <gets>:

char*
gets(char *buf, int max)
{
 2a4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 2a8:	e1a03000 	mov	r3, r0
 2ac:	e28db014 	add	fp, sp, #20
 2b0:	e1a07000 	mov	r7, r0
 2b4:	e24dd008 	sub	sp, sp, #8
 2b8:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2bc:	e3a04000 	mov	r4, #0
 2c0:	ea000008 	b	2e8 <gets+0x44>
    cc = read(0, &c, 1);
 2c4:	eb000085 	bl	4e0 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 2c8:	e1a03005 	mov	r3, r5
    if(cc < 1)
 2cc:	e3500000 	cmp	r0, #0
 2d0:	da00000b 	ble	304 <gets+0x60>
    buf[i++] = c;
 2d4:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 2d8:	e352000d 	cmp	r2, #13
 2dc:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 2e0:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 2e4:	0a00000b 	beq	318 <gets+0x74>
    cc = read(0, &c, 1);
 2e8:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 2ec:	e0844002 	add	r4, r4, r2
 2f0:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 2f4:	e24b1015 	sub	r1, fp, #21
 2f8:	e3a00000 	mov	r0, #0
 2fc:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 300:	baffffef 	blt	2c4 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 304:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 308:	e3a03000 	mov	r3, #0
 30c:	e5c53000 	strb	r3, [r5]
}
 310:	e24bd014 	sub	sp, fp, #20
 314:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 318:	e0875004 	add	r5, r7, r4
 31c:	eafffff8 	b	304 <gets+0x60>

00000320 <stat>:

int
stat(char *n, struct stat *st)
{
 320:	e92d4830 	push	{r4, r5, fp, lr}
 324:	e1a04001 	mov	r4, r1
 328:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 32c:	e3a01000 	mov	r1, #0
 330:	eb0000ab 	bl	5e4 <open>
  if(fd < 0)
 334:	e2505000 	subs	r5, r0, #0
 338:	ba000006 	blt	358 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 33c:	e1a01004 	mov	r1, r4
 340:	eb0000ce 	bl	680 <fstat>
 344:	e1a04000 	mov	r4, r0
  close(fd);
 348:	e1a00005 	mov	r0, r5
 34c:	eb00007d 	bl	548 <close>
  return r;
}
 350:	e1a00004 	mov	r0, r4
 354:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 358:	e3e04000 	mvn	r4, #0
 35c:	eafffffb 	b	350 <stat+0x30>

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 364:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 368:	e5d02000 	ldrb	r2, [r0]
 36c:	e2423030 	sub	r3, r2, #48	; 0x30
 370:	e3530009 	cmp	r3, #9
  n = 0;
 374:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 378:	8a000006 	bhi	398 <atoi+0x38>
    n = n*10 + *s++ - '0';
 37c:	e3a0c00a 	mov	ip, #10
 380:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 384:	e5f02001 	ldrb	r2, [r0, #1]!
 388:	e2421030 	sub	r1, r2, #48	; 0x30
 38c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 390:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 394:	9afffff9 	bls	380 <atoi+0x20>
  return n;
}
 398:	e1a00003 	mov	r0, r3
 39c:	e28bd000 	add	sp, fp, #0
 3a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3a4:	e12fff1e 	bx	lr

000003a8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a8:	e3520000 	cmp	r2, #0
{
 3ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3b0:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 3b4:	da000005 	ble	3d0 <memmove+0x28>
 3b8:	e0812002 	add	r2, r1, r2
 3bc:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3c0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 3c4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3c8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3cc:	1afffffb 	bne	3c0 <memmove+0x18>
  return vdst;
}
 3d0:	e28bd000 	add	sp, fp, #0
 3d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d8:	e12fff1e 	bx	lr

000003dc <fork>:
 3dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f0:	e3a00001 	mov	r0, #1
 3f4:	ef000040 	svc	0x00000040
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 404:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 408:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 40c:	e12fff1e 	bx	lr

00000410 <exit>:
 410:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 414:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 418:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 41c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 420:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 424:	e3a00002 	mov	r0, #2
 428:	ef000040 	svc	0x00000040
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 438:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 43c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <wait>:
 444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 448:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 44c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 450:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 454:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 458:	e3a00003 	mov	r0, #3
 45c:	ef000040 	svc	0x00000040
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 46c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 474:	e12fff1e 	bx	lr

00000478 <lseek>:
 478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 47c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 480:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 484:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 488:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 48c:	e3a00016 	mov	r0, #22
 490:	ef000040 	svc	0x00000040
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a8:	e12fff1e 	bx	lr

000004ac <pipe>:
 4ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c0:	e3a00004 	mov	r0, #4
 4c4:	ef000040 	svc	0x00000040
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4dc:	e12fff1e 	bx	lr

000004e0 <read>:
 4e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f4:	e3a00005 	mov	r0, #5
 4f8:	ef000040 	svc	0x00000040
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 508:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 50c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 510:	e12fff1e 	bx	lr

00000514 <write>:
 514:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 518:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 51c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 520:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 524:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 528:	e3a00010 	mov	r0, #16
 52c:	ef000040 	svc	0x00000040
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 53c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 540:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 544:	e12fff1e 	bx	lr

00000548 <close>:
 548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 54c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 550:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 554:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 558:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 55c:	e3a00015 	mov	r0, #21
 560:	ef000040 	svc	0x00000040
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 570:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 574:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 578:	e12fff1e 	bx	lr

0000057c <kill>:
 57c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 580:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 584:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 588:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 58c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 590:	e3a00006 	mov	r0, #6
 594:	ef000040 	svc	0x00000040
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ac:	e12fff1e 	bx	lr

000005b0 <exec>:
 5b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c4:	e3a00007 	mov	r0, #7
 5c8:	ef000040 	svc	0x00000040
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e0:	e12fff1e 	bx	lr

000005e4 <open>:
 5e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f8:	e3a0000f 	mov	r0, #15
 5fc:	ef000040 	svc	0x00000040
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 60c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 614:	e12fff1e 	bx	lr

00000618 <mknod>:
 618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 61c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 620:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 624:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 628:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 62c:	e3a00011 	mov	r0, #17
 630:	ef000040 	svc	0x00000040
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 640:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 648:	e12fff1e 	bx	lr

0000064c <unlink>:
 64c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 650:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 654:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 658:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 65c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 660:	e3a00012 	mov	r0, #18
 664:	ef000040 	svc	0x00000040
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 674:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 67c:	e12fff1e 	bx	lr

00000680 <fstat>:
 680:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 684:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 688:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 68c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 690:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 694:	e3a00008 	mov	r0, #8
 698:	ef000040 	svc	0x00000040
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b0:	e12fff1e 	bx	lr

000006b4 <link>:
 6b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c8:	e3a00013 	mov	r0, #19
 6cc:	ef000040 	svc	0x00000040
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e4:	e12fff1e 	bx	lr

000006e8 <mkdir>:
 6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6fc:	e3a00014 	mov	r0, #20
 700:	ef000040 	svc	0x00000040
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 710:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 718:	e12fff1e 	bx	lr

0000071c <chdir>:
 71c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 720:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 724:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 728:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 72c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 730:	e3a00009 	mov	r0, #9
 734:	ef000040 	svc	0x00000040
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 744:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 748:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 74c:	e12fff1e 	bx	lr

00000750 <dup>:
 750:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 754:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 758:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 75c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 760:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 764:	e3a0000a 	mov	r0, #10
 768:	ef000040 	svc	0x00000040
 76c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 770:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 774:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 778:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 77c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 780:	e12fff1e 	bx	lr

00000784 <getpid>:
 784:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 788:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 78c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 790:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 794:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 798:	e3a0000b 	mov	r0, #11
 79c:	ef000040 	svc	0x00000040
 7a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b4:	e12fff1e 	bx	lr

000007b8 <sbrk>:
 7b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7cc:	e3a0000c 	mov	r0, #12
 7d0:	ef000040 	svc	0x00000040
 7d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e8:	e12fff1e 	bx	lr

000007ec <sleep>:
 7ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 800:	e3a0000d 	mov	r0, #13
 804:	ef000040 	svc	0x00000040
 808:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 80c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 810:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 814:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 818:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 81c:	e12fff1e 	bx	lr

00000820 <uptime>:
 820:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 824:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 828:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 82c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 830:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 834:	e3a0000e 	mov	r0, #14
 838:	ef000040 	svc	0x00000040
 83c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 840:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 844:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 848:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 84c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 850:	e12fff1e 	bx	lr

00000854 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 854:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 858:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 85c:	e013afa1 	ands	sl, r3, r1, lsr #31
 860:	e24b4034 	sub	r4, fp, #52	; 0x34
 864:	e3009cb4 	movw	r9, #3252	; 0xcb4
    neg = 1;
    x = -xx;
 868:	1261e000 	rsbne	lr, r1, #0
 86c:	e3409000 	movt	r9, #0
{
 870:	e1a05000 	mov	r5, r0
    neg = 1;
 874:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 878:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 87c:	e3a08000 	mov	r8, #0
  b = base;
 880:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 884:	e3a06001 	mov	r6, #1
{
 888:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 88c:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 890:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 894:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 898:	e1a0033e 	lsr	r0, lr, r3
 89c:	e2000001 	and	r0, r0, #1
 8a0:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 8a4:	e1520001 	cmp	r2, r1
            r = r - d;
 8a8:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 8ac:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 8b0:	e2533001 	subs	r3, r3, #1
 8b4:	2afffff7 	bcs	898 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8b8:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 8bc:	e35c0000 	cmp	ip, #0
 8c0:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 8c4:	e2883001 	add	r3, r8, #1
 8c8:	e7d91001 	ldrb	r1, [r9, r1]
 8cc:	e4c71001 	strb	r1, [r7], #1
 8d0:	11a08003 	movne	r8, r3
 8d4:	1affffec 	bne	88c <printint+0x38>
  if(neg)
 8d8:	e35a0000 	cmp	sl, #0
 8dc:	0a000004 	beq	8f4 <printint+0xa0>
    buf[i++] = '-';
 8e0:	e24b2024 	sub	r2, fp, #36	; 0x24
 8e4:	e3a0102d 	mov	r1, #45	; 0x2d
 8e8:	e0822003 	add	r2, r2, r3
 8ec:	e2883002 	add	r3, r8, #2
 8f0:	e5421010 	strb	r1, [r2, #-16]
 8f4:	e0846003 	add	r6, r4, r3
 8f8:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 8fc:	e3a02001 	mov	r2, #1
 900:	e24b1035 	sub	r1, fp, #53	; 0x35
 904:	e1a00005 	mov	r0, r5
 908:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 90c:	ebffff00 	bl	514 <write>

  while(--i >= 0)
 910:	e1540006 	cmp	r4, r6
 914:	1afffff7 	bne	8f8 <printint+0xa4>
    putc(fd, buf[i]);
}
 918:	e24bd020 	sub	sp, fp, #32
 91c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000920 <div>:
{
 920:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 924:	e3a02000 	mov	r2, #0
{
 928:	e28db008 	add	fp, sp, #8
 92c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 930:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 934:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 938:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 93c:	e1a0c33e 	lsr	ip, lr, r3
 940:	e20cc001 	and	ip, ip, #1
 944:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 948:	e1520001 	cmp	r2, r1
            r = r - d;
 94c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 950:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 954:	e2533001 	subs	r3, r3, #1
 958:	38bd8810 	popcc	{r4, fp, pc}
 95c:	eafffff6 	b	93c <div+0x1c>

00000960 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 960:	e92d000e 	push	{r1, r2, r3}
 964:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 968:	e28db018 	add	fp, sp, #24
 96c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 970:	e59b5004 	ldr	r5, [fp, #4]
 974:	e5d54000 	ldrb	r4, [r5]
 978:	e3540000 	cmp	r4, #0
 97c:	0a00002b 	beq	a30 <printf+0xd0>
 980:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 984:	e28b8008 	add	r8, fp, #8
  state = 0;
 988:	e3a06000 	mov	r6, #0
 98c:	ea00000a 	b	9bc <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 990:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 994:	01a06004 	moveq	r6, r4
      if(c == '%'){
 998:	0a000004 	beq	9b0 <printf+0x50>
 99c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 9a0:	e3a02001 	mov	r2, #1
 9a4:	e1a00007 	mov	r0, r7
 9a8:	e5614006 	strb	r4, [r1, #-6]!
 9ac:	ebfffed8 	bl	514 <write>
  for(i = 0; fmt[i]; i++){
 9b0:	e5f54001 	ldrb	r4, [r5, #1]!
 9b4:	e3540000 	cmp	r4, #0
 9b8:	0a00001c 	beq	a30 <printf+0xd0>
    if(state == 0){
 9bc:	e3560000 	cmp	r6, #0
 9c0:	0afffff2 	beq	990 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9c4:	e3560025 	cmp	r6, #37	; 0x25
 9c8:	1afffff8 	bne	9b0 <printf+0x50>
      if(c == 'd'){
 9cc:	e3540064 	cmp	r4, #100	; 0x64
 9d0:	0a000030 	beq	a98 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d4:	e20430f7 	and	r3, r4, #247	; 0xf7
 9d8:	e3530070 	cmp	r3, #112	; 0x70
 9dc:	0a000017 	beq	a40 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e0:	e3540073 	cmp	r4, #115	; 0x73
 9e4:	0a00001c 	beq	a5c <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9e8:	e3540063 	cmp	r4, #99	; 0x63
 9ec:	0a000037 	beq	ad0 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f0:	e3540025 	cmp	r4, #37	; 0x25
 9f4:	0a00002e 	beq	ab4 <printf+0x154>
  write(fd, &c, 1);
 9f8:	e3a02001 	mov	r2, #1
 9fc:	e24b1019 	sub	r1, fp, #25
 a00:	e1a00007 	mov	r0, r7
 a04:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 a08:	ebfffec1 	bl	514 <write>
 a0c:	e3a02001 	mov	r2, #1
 a10:	e24b101a 	sub	r1, fp, #26
 a14:	e1a00007 	mov	r0, r7
 a18:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a1c:	ebfffebc 	bl	514 <write>
  for(i = 0; fmt[i]; i++){
 a20:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a24:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 a28:	e3540000 	cmp	r4, #0
 a2c:	1affffe2 	bne	9bc <printf+0x5c>
    }
  }
}
 a30:	e24bd018 	sub	sp, fp, #24
 a34:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a38:	e28dd00c 	add	sp, sp, #12
 a3c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a40:	e3a03000 	mov	r3, #0
 a44:	e3a02010 	mov	r2, #16
 a48:	e4981004 	ldr	r1, [r8], #4
 a4c:	e1a00007 	mov	r0, r7
 a50:	ebffff7f 	bl	854 <printint>
      state = 0;
 a54:	e3a06000 	mov	r6, #0
 a58:	eaffffd4 	b	9b0 <printf+0x50>
        s = (char*)*ap;
 a5c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a60:	e3540000 	cmp	r4, #0
 a64:	0a000021 	beq	af0 <printf+0x190>
        while(*s != 0){
 a68:	e5d46000 	ldrb	r6, [r4]
 a6c:	e3560000 	cmp	r6, #0
 a70:	0affffce 	beq	9b0 <printf+0x50>
  write(fd, &c, 1);
 a74:	e3a02001 	mov	r2, #1
 a78:	e24b101d 	sub	r1, fp, #29
 a7c:	e1a00007 	mov	r0, r7
 a80:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 a84:	ebfffea2 	bl	514 <write>
        while(*s != 0){
 a88:	e5f46001 	ldrb	r6, [r4, #1]!
 a8c:	e3560000 	cmp	r6, #0
 a90:	1afffff7 	bne	a74 <printf+0x114>
 a94:	eaffffc5 	b	9b0 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a98:	e3a03001 	mov	r3, #1
 a9c:	e3a0200a 	mov	r2, #10
 aa0:	e4981004 	ldr	r1, [r8], #4
 aa4:	e1a00007 	mov	r0, r7
 aa8:	ebffff69 	bl	854 <printint>
      state = 0;
 aac:	e3a06000 	mov	r6, #0
 ab0:	eaffffbe 	b	9b0 <printf+0x50>
 ab4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 ab8:	e3a02001 	mov	r2, #1
 abc:	e1a00007 	mov	r0, r7
 ac0:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 ac4:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 ac8:	ebfffe91 	bl	514 <write>
 acc:	eaffffb7 	b	9b0 <printf+0x50>
        putc(fd, *ap);
 ad0:	e4983004 	ldr	r3, [r8], #4
 ad4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 ad8:	e3a02001 	mov	r2, #1
 adc:	e1a00007 	mov	r0, r7
      state = 0;
 ae0:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 ae4:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 ae8:	ebfffe89 	bl	514 <write>
 aec:	eaffffaf 	b	9b0 <printf+0x50>
          s = "(null)";
 af0:	e3004cc8 	movw	r4, #3272	; 0xcc8
        while(*s != 0){
 af4:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 af8:	e3404000 	movt	r4, #0
 afc:	eaffffdc 	b	a74 <printf+0x114>

00000b00 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b00:	e300ccd0 	movw	ip, #3280	; 0xcd0
 b04:	e340c000 	movt	ip, #0
{
 b08:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 b0c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b10:	e59c3000 	ldr	r3, [ip]
{
 b14:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b18:	e1530001 	cmp	r3, r1
 b1c:	e5932000 	ldr	r2, [r3]
 b20:	2a000017 	bcs	b84 <free+0x84>
 b24:	e1510002 	cmp	r1, r2
 b28:	3a000001 	bcc	b34 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b2c:	e1530002 	cmp	r3, r2
 b30:	3a000017 	bcc	b94 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b34:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b38:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b3c:	e081418e 	add	r4, r1, lr, lsl #3
 b40:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b44:	05922004 	ldreq	r2, [r2, #4]
 b48:	0082e00e 	addeq	lr, r2, lr
 b4c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b50:	05932000 	ldreq	r2, [r3]
 b54:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b58:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b5c:	e5932004 	ldr	r2, [r3, #4]
 b60:	e083e182 	add	lr, r3, r2, lsl #3
 b64:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b68:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b6c:	05101004 	ldreq	r1, [r0, #-4]
 b70:	00812002 	addeq	r2, r1, r2
 b74:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b78:	05102008 	ldreq	r2, [r0, #-8]
 b7c:	05832000 	streq	r2, [r3]
}
 b80:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b84:	e1530002 	cmp	r3, r2
 b88:	3a000001 	bcc	b94 <free+0x94>
 b8c:	e1510002 	cmp	r1, r2
 b90:	3affffe7 	bcc	b34 <free+0x34>
{
 b94:	e1a03002 	mov	r3, r2
 b98:	eaffffde 	b	b18 <free+0x18>

00000b9c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b9c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ba0:	e3007cd0 	movw	r7, #3280	; 0xcd0
 ba4:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba8:	e2804007 	add	r4, r0, #7
{
 bac:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 bb0:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb4:	e1a041a4 	lsr	r4, r4, #3
 bb8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 bbc:	e3530000 	cmp	r3, #0
 bc0:	0a000027 	beq	c64 <malloc+0xc8>
 bc4:	e5930000 	ldr	r0, [r3]
 bc8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bcc:	e1540002 	cmp	r4, r2
 bd0:	9a000019 	bls	c3c <malloc+0xa0>
 bd4:	e3540a01 	cmp	r4, #4096	; 0x1000
 bd8:	21a05004 	movcs	r5, r4
 bdc:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 be0:	e1a06185 	lsl	r6, r5, #3
 be4:	ea000003 	b	bf8 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 bec:	e5902004 	ldr	r2, [r0, #4]
 bf0:	e1520004 	cmp	r2, r4
 bf4:	2a000010 	bcs	c3c <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bf8:	e5972000 	ldr	r2, [r7]
 bfc:	e1a03000 	mov	r3, r0
 c00:	e1520000 	cmp	r2, r0
 c04:	1afffff7 	bne	be8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 c08:	e1a00006 	mov	r0, r6
 c0c:	ebfffee9 	bl	7b8 <sbrk>
 c10:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 c14:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 c18:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 c1c:	0a000004 	beq	c34 <malloc+0x98>
  hp->s.size = nu;
 c20:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 c24:	ebffffb5 	bl	b00 <free>
  return freep;
 c28:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 c2c:	e3530000 	cmp	r3, #0
 c30:	1affffec 	bne	be8 <malloc+0x4c>
        return 0;
 c34:	e3a00000 	mov	r0, #0
  }
}
 c38:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 c3c:	e1540002 	cmp	r4, r2
      freep = prevp;
 c40:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c44:	10422004 	subne	r2, r2, r4
 c48:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c4c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c50:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c54:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c58:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c5c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c60:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c64:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c68:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c6c:	e5870000 	str	r0, [r7]
 c70:	e5870004 	str	r0, [r7, #4]
 c74:	eaffffd6 	b	bd4 <malloc+0x38>
