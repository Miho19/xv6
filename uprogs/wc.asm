
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
  24:	eb000172 	bl	5f4 <open>
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
  48:	eb000142 	bl	558 <close>
  for(i = 1; i < argc; i++){
  4c:	e1580005 	cmp	r8, r5
  50:	1afffff1 	bne	1c <main+0x1c>
  }
  exit();
  54:	eb0000f1 	bl	420 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  58:	e5962000 	ldr	r2, [r6]
  5c:	e3001cc0 	movw	r1, #3264	; 0xcc0
  60:	e3a00001 	mov	r0, #1
  64:	e3401000 	movt	r1, #0
  68:	eb000245 	bl	984 <printf>
      exit();
  6c:	eb0000eb 	bl	420 <exit>
    wc(0, "");
  70:	e3001cbc 	movw	r1, #3260	; 0xcbc
  74:	e3a00000 	mov	r0, #0
  78:	e3401000 	movt	r1, #0
  7c:	eb000000 	bl	84 <wc>
    exit();
  80:	eb0000e6 	bl	420 <exit>

00000084 <wc>:
{
  84:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  inword = 0;
  88:	e3a04000 	mov	r4, #0
{
  8c:	e28db020 	add	fp, sp, #32
      if(strchr(" \r\t\n\v", buf[i]))
  90:	e3006c98 	movw	r6, #3224	; 0xc98
  94:	e3406000 	movt	r6, #0
  l = w = c = 0;
  98:	e1a09004 	mov	r9, r4
  9c:	e1a07004 	mov	r7, r4
{
  a0:	e24dd01c 	sub	sp, sp, #28
  a4:	e3003cfc 	movw	r3, #3324	; 0xcfc
  a8:	e3403000 	movt	r3, #0
  ac:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
  while((n = read(fd, buf, sizeof(buf))) > 0){
  b0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
{
  b4:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
  l = w = c = 0;
  b8:	e50b4028 	str	r4, [fp, #-40]	; 0xffffffd8
  while((n = read(fd, buf, sizeof(buf))) > 0){
  bc:	e3a02c02 	mov	r2, #512	; 0x200
  c0:	e3001cfc 	movw	r1, #3324	; 0xcfc
  c4:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
  c8:	e3401000 	movt	r1, #0
  cc:	eb000107 	bl	4f0 <read>
  d0:	e2508000 	subs	r8, r0, #0
  d4:	da000017 	ble	138 <wc+0xb4>
  d8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
  dc:	e300acfc 	movw	sl, #3324	; 0xcfc
  e0:	e340a000 	movt	sl, #0
  e4:	e0835008 	add	r5, r3, r8
  e8:	ea000001 	b	f4 <wc+0x70>
    for(i=0; i<n; i++){
  ec:	e155000a 	cmp	r5, sl
  f0:	0a00000c 	beq	128 <wc+0xa4>
      if(buf[i] == '\n')
  f4:	e4da1001 	ldrb	r1, [sl], #1
      if(strchr(" \r\t\n\v", buf[i]))
  f8:	e1a00006 	mov	r0, r6
      if(buf[i] == '\n')
  fc:	e351000a 	cmp	r1, #10
        l++;
 100:	02877001 	addeq	r7, r7, #1
      if(strchr(" \r\t\n\v", buf[i]))
 104:	eb000057 	bl	268 <strchr>
 108:	e3500000 	cmp	r0, #0
        inword = 0;
 10c:	13a04000 	movne	r4, #0
      if(strchr(" \r\t\n\v", buf[i]))
 110:	1afffff5 	bne	ec <wc+0x68>
      else if(!inword){
 114:	e3540000 	cmp	r4, #0
        w++;
 118:	02899001 	addeq	r9, r9, #1
        inword = 1;
 11c:	03a04001 	moveq	r4, #1
    for(i=0; i<n; i++){
 120:	e155000a 	cmp	r5, sl
 124:	1afffff2 	bne	f4 <wc+0x70>
 128:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 12c:	e0833008 	add	r3, r3, r8
 130:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
 134:	eaffffe0 	b	bc <wc+0x38>
  if(n < 0){
 138:	1a00000b 	bne	16c <wc+0xe8>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 13c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
 140:	e3a00001 	mov	r0, #1
 144:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
 148:	e3001cb0 	movw	r1, #3248	; 0xcb0
 14c:	e3401000 	movt	r1, #0
 150:	e58d3004 	str	r3, [sp, #4]
 154:	e1a03009 	mov	r3, r9
 158:	e58d2000 	str	r2, [sp]
 15c:	e1a02007 	mov	r2, r7
 160:	eb000207 	bl	984 <printf>
}
 164:	e24bd020 	sub	sp, fp, #32
 168:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(1, "wc: read error\n");
 16c:	e3001ca0 	movw	r1, #3232	; 0xca0
 170:	e3a00001 	mov	r0, #1
 174:	e3401000 	movt	r1, #0
 178:	eb000201 	bl	984 <printf>
    exit();
 17c:	eb0000a7 	bl	420 <exit>

00000180 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 184:	e2402001 	sub	r2, r0, #1
 188:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18c:	e4d13001 	ldrb	r3, [r1], #1
 190:	e3530000 	cmp	r3, #0
 194:	e5e23001 	strb	r3, [r2, #1]!
 198:	1afffffb 	bne	18c <strcpy+0xc>
    ;
  return os;
}
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ac:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 1b0:	e5d03000 	ldrb	r3, [r0]
 1b4:	e5d12000 	ldrb	r2, [r1]
 1b8:	e3530000 	cmp	r3, #0
 1bc:	1a000004 	bne	1d4 <strcmp+0x2c>
 1c0:	ea000005 	b	1dc <strcmp+0x34>
 1c4:	e5f03001 	ldrb	r3, [r0, #1]!
 1c8:	e5f12001 	ldrb	r2, [r1, #1]!
 1cc:	e3530000 	cmp	r3, #0
 1d0:	0a000001 	beq	1dc <strcmp+0x34>
 1d4:	e1530002 	cmp	r3, r2
 1d8:	0afffff9 	beq	1c4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1dc:	e0430002 	sub	r0, r3, r2
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr

000001ec <strlen>:

uint
strlen(char *s)
{
 1ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1f4:	e5d03000 	ldrb	r3, [r0]
 1f8:	e3530000 	cmp	r3, #0
 1fc:	0a000008 	beq	224 <strlen+0x38>
 200:	e2601001 	rsb	r1, r0, #1
 204:	e1a03000 	mov	r3, r0
    ;
 208:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 20c:	e5f32001 	ldrb	r2, [r3, #1]!
 210:	e3520000 	cmp	r2, #0
 214:	1afffffb 	bne	208 <strlen+0x1c>
  return n;
}
 218:	e28bd000 	add	sp, fp, #0
 21c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 220:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 224:	e1a00003 	mov	r0, r3
}
 228:	e28bd000 	add	sp, fp, #0
 22c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 230:	e12fff1e 	bx	lr

00000234 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 234:	e3520000 	cmp	r2, #0
{
 238:	e1a03000 	mov	r3, r0
 23c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 240:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 244:	0a000004 	beq	25c <memset+0x28>
 248:	e6ef1071 	uxtb	r1, r1
 24c:	e0800002 	add	r0, r0, r2
 250:	e4c31001 	strb	r1, [r3], #1
 254:	e1500003 	cmp	r0, r3
 258:	1afffffc 	bne	250 <memset+0x1c>
  return (void *)p;
}
 25c:	e28bd000 	add	sp, fp, #0
 260:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 264:	e12fff1e 	bx	lr

00000268 <strchr>:

char*
strchr(const char *s, char c)
{
 268:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 26c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 270:	e5d02000 	ldrb	r2, [r0]
 274:	e3520000 	cmp	r2, #0
 278:	0a00000b 	beq	2ac <strchr+0x44>
    if(*s == c)
 27c:	e1520001 	cmp	r2, r1
 280:	1a000002 	bne	290 <strchr+0x28>
 284:	ea000005 	b	2a0 <strchr+0x38>
 288:	e1530001 	cmp	r3, r1
 28c:	0a000003 	beq	2a0 <strchr+0x38>
  for(; *s; s++)
 290:	e5f03001 	ldrb	r3, [r0, #1]!
 294:	e3530000 	cmp	r3, #0
 298:	1afffffa 	bne	288 <strchr+0x20>
      return (char*)s;
  return 0;
 29c:	e1a00003 	mov	r0, r3
}
 2a0:	e28bd000 	add	sp, fp, #0
 2a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a8:	e12fff1e 	bx	lr
  return 0;
 2ac:	e1a00002 	mov	r0, r2
 2b0:	eafffffa 	b	2a0 <strchr+0x38>

000002b4 <gets>:

char*
gets(char *buf, int max)
{
 2b4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 2b8:	e1a03000 	mov	r3, r0
 2bc:	e28db014 	add	fp, sp, #20
 2c0:	e1a07000 	mov	r7, r0
 2c4:	e24dd008 	sub	sp, sp, #8
 2c8:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	e3a04000 	mov	r4, #0
 2d0:	ea000008 	b	2f8 <gets+0x44>
    cc = read(0, &c, 1);
 2d4:	eb000085 	bl	4f0 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 2d8:	e1a03005 	mov	r3, r5
    if(cc < 1)
 2dc:	e3500000 	cmp	r0, #0
 2e0:	da00000b 	ble	314 <gets+0x60>
    buf[i++] = c;
 2e4:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 2e8:	e352000d 	cmp	r2, #13
 2ec:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 2f0:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 2f4:	0a00000b 	beq	328 <gets+0x74>
    cc = read(0, &c, 1);
 2f8:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 2fc:	e0844002 	add	r4, r4, r2
 300:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 304:	e24b1015 	sub	r1, fp, #21
 308:	e3a00000 	mov	r0, #0
 30c:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 310:	baffffef 	blt	2d4 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 314:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 318:	e3a03000 	mov	r3, #0
 31c:	e5c53000 	strb	r3, [r5]
}
 320:	e24bd014 	sub	sp, fp, #20
 324:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 328:	e0875004 	add	r5, r7, r4
 32c:	eafffff8 	b	314 <gets+0x60>

00000330 <stat>:

int
stat(char *n, struct stat *st)
{
 330:	e92d4830 	push	{r4, r5, fp, lr}
 334:	e1a04001 	mov	r4, r1
 338:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33c:	e3a01000 	mov	r1, #0
 340:	eb0000ab 	bl	5f4 <open>
  if(fd < 0)
 344:	e2505000 	subs	r5, r0, #0
 348:	ba000006 	blt	368 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 34c:	e1a01004 	mov	r1, r4
 350:	eb0000ce 	bl	690 <fstat>
 354:	e1a04000 	mov	r4, r0
  close(fd);
 358:	e1a00005 	mov	r0, r5
 35c:	eb00007d 	bl	558 <close>
  return r;
}
 360:	e1a00004 	mov	r0, r4
 364:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 368:	e3e04000 	mvn	r4, #0
 36c:	eafffffb 	b	360 <stat+0x30>

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 374:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 378:	e5d02000 	ldrb	r2, [r0]
 37c:	e2423030 	sub	r3, r2, #48	; 0x30
 380:	e3530009 	cmp	r3, #9
  n = 0;
 384:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 388:	8a000006 	bhi	3a8 <atoi+0x38>
    n = n*10 + *s++ - '0';
 38c:	e3a0c00a 	mov	ip, #10
 390:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 394:	e5f02001 	ldrb	r2, [r0, #1]!
 398:	e2421030 	sub	r1, r2, #48	; 0x30
 39c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 3a0:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 3a4:	9afffff9 	bls	390 <atoi+0x20>
  return n;
}
 3a8:	e1a00003 	mov	r0, r3
 3ac:	e28bd000 	add	sp, fp, #0
 3b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3b4:	e12fff1e 	bx	lr

000003b8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b8:	e3520000 	cmp	r2, #0
{
 3bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3c0:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 3c4:	da000005 	ble	3e0 <memmove+0x28>
 3c8:	e0812002 	add	r2, r1, r2
 3cc:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3d0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 3d4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3d8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3dc:	1afffffb 	bne	3d0 <memmove+0x18>
  return vdst;
}
 3e0:	e28bd000 	add	sp, fp, #0
 3e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e8:	e12fff1e 	bx	lr

000003ec <fork>:
 3ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 400:	e3a00001 	mov	r0, #1
 404:	ef000040 	svc	0x00000040
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 414:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 418:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 41c:	e12fff1e 	bx	lr

00000420 <exit>:
 420:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 424:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 428:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 42c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 430:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 434:	e3a00002 	mov	r0, #2
 438:	ef000040 	svc	0x00000040
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 448:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 44c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 450:	e12fff1e 	bx	lr

00000454 <wait>:
 454:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 458:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 45c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 460:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 464:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 468:	e3a00003 	mov	r0, #3
 46c:	ef000040 	svc	0x00000040
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 47c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 480:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 484:	e12fff1e 	bx	lr

00000488 <lseek>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00016 	mov	r0, #22
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <pipe>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a00004 	mov	r0, #4
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <read>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00005 	mov	r0, #5
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <write>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a00010 	mov	r0, #16
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <close>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00015 	mov	r0, #21
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <kill>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00006 	mov	r0, #6
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <exec>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00007 	mov	r0, #7
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <open>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a0000f 	mov	r0, #15
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <mknod>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a00011 	mov	r0, #17
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <unlink>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00012 	mov	r0, #18
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <fstat>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a00008 	mov	r0, #8
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <link>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a00013 	mov	r0, #19
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <mkdir>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a00014 	mov	r0, #20
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <chdir>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a00009 	mov	r0, #9
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <dup>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a0000a 	mov	r0, #10
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <getpid>:
 794:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 798:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 79c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a8:	e3a0000b 	mov	r0, #11
 7ac:	ef000040 	svc	0x00000040
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c4:	e12fff1e 	bx	lr

000007c8 <sbrk>:
 7c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7dc:	e3a0000c 	mov	r0, #12
 7e0:	ef000040 	svc	0x00000040
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f8:	e12fff1e 	bx	lr

000007fc <sleep>:
 7fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 800:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 804:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 808:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 80c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 810:	e3a0000d 	mov	r0, #13
 814:	ef000040 	svc	0x00000040
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 824:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 828:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 82c:	e12fff1e 	bx	lr

00000830 <uptime>:
 830:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 834:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 838:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 83c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 840:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 844:	e3a0000e 	mov	r0, #14
 848:	ef000040 	svc	0x00000040
 84c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 850:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 854:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 858:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 85c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 860:	e12fff1e 	bx	lr

00000864 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 864:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 868:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 86c:	e0133fa1 	ands	r3, r3, r1, lsr #31
 870:	e24b4034 	sub	r4, fp, #52	; 0x34
 874:	e3009cd4 	movw	r9, #3284	; 0xcd4
    neg = 1;
    x = -xx;
 878:	1261e000 	rsbne	lr, r1, #0
 87c:	e3409000 	movt	r9, #0
{
 880:	e1a05000 	mov	r5, r0
    neg = 1;
 884:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 888:	01a0e001 	moveq	lr, r1
  neg = 0;
 88c:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 890:	e3a07000 	mov	r7, #0
  b = base;
 894:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 898:	e3a06001 	mov	r6, #1
{
 89c:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 8a0:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 8a4:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8a8:	e3a0c000 	mov	ip, #0
 8ac:	ea000002 	b	8bc <printint+0x58>
        if(r >= d) {
 8b0:	e1520000 	cmp	r2, r0
            r = r - d;
 8b4:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 8b8:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 8bc:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 8c0:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 8c4:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 8c8:	e2011001 	and	r1, r1, #1
 8cc:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 8d0:	1afffff6 	bne	8b0 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8d4:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 8d8:	e35c0000 	cmp	ip, #0
 8dc:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 8e0:	e2871001 	add	r1, r7, #1
 8e4:	e7d93003 	ldrb	r3, [r9, r3]
 8e8:	e4c83001 	strb	r3, [r8], #1
 8ec:	11a07001 	movne	r7, r1
 8f0:	1affffea 	bne	8a0 <printint+0x3c>
  if(neg)
 8f4:	e35a0000 	cmp	sl, #0
 8f8:	0a000005 	beq	914 <printint+0xb0>
    buf[i++] = '-';
 8fc:	e24b3024 	sub	r3, fp, #36	; 0x24
 900:	e3a0202d 	mov	r2, #45	; 0x2d
 904:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 908:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 90c:	e1a03002 	mov	r3, r2
 910:	e5402010 	strb	r2, [r0, #-16]
 914:	e0847007 	add	r7, r4, r7
 918:	ea000000 	b	920 <printint+0xbc>
 91c:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 920:	e3a02001 	mov	r2, #1
 924:	e24b1035 	sub	r1, fp, #53	; 0x35
 928:	e1a00005 	mov	r0, r5
 92c:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 930:	ebfffefb 	bl	524 <write>

  while(--i >= 0)
 934:	e1570004 	cmp	r7, r4
 938:	1afffff7 	bne	91c <printint+0xb8>
    putc(fd, buf[i]);
}
 93c:	e24bd020 	sub	sp, fp, #32
 940:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000944 <div>:
{
 944:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 948:	e3a02000 	mov	r2, #0
{
 94c:	e28db008 	add	fp, sp, #8
 950:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 954:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 958:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 95c:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 960:	e1a0c33e 	lsr	ip, lr, r3
 964:	e20cc001 	and	ip, ip, #1
 968:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 96c:	e1520001 	cmp	r2, r1
            r = r - d;
 970:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 974:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 978:	e2533001 	subs	r3, r3, #1
 97c:	38bd8810 	popcc	{r4, fp, pc}
 980:	eafffff6 	b	960 <div+0x1c>

00000984 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 984:	e92d000e 	push	{r1, r2, r3}
 988:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 98c:	e28db018 	add	fp, sp, #24
 990:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 994:	e59b6004 	ldr	r6, [fp, #4]
 998:	e5d64000 	ldrb	r4, [r6]
 99c:	e3540000 	cmp	r4, #0
 9a0:	0a00002b 	beq	a54 <printf+0xd0>
 9a4:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 9a8:	e28b8008 	add	r8, fp, #8
  state = 0;
 9ac:	e3a05000 	mov	r5, #0
 9b0:	ea00000a 	b	9e0 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 9b4:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 9b8:	01a05004 	moveq	r5, r4
      if(c == '%'){
 9bc:	0a000004 	beq	9d4 <printf+0x50>
  write(fd, &c, 1);
 9c0:	e3a02001 	mov	r2, #1
 9c4:	e24b1019 	sub	r1, fp, #25
 9c8:	e1a00007 	mov	r0, r7
 9cc:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 9d0:	ebfffed3 	bl	524 <write>
  for(i = 0; fmt[i]; i++){
 9d4:	e5f64001 	ldrb	r4, [r6, #1]!
 9d8:	e3540000 	cmp	r4, #0
 9dc:	0a00001c 	beq	a54 <printf+0xd0>
    if(state == 0){
 9e0:	e3550000 	cmp	r5, #0
 9e4:	0afffff2 	beq	9b4 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9e8:	e3550025 	cmp	r5, #37	; 0x25
 9ec:	1afffff8 	bne	9d4 <printf+0x50>
      if(c == 'd'){
 9f0:	e3540064 	cmp	r4, #100	; 0x64
 9f4:	0a000021 	beq	a80 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9f8:	e20430f7 	and	r3, r4, #247	; 0xf7
 9fc:	e3530070 	cmp	r3, #112	; 0x70
 a00:	0a000017 	beq	a64 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a04:	e3540073 	cmp	r4, #115	; 0x73
 a08:	0a00002e 	beq	ac8 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a0c:	e3540063 	cmp	r4, #99	; 0x63
 a10:	0a000021 	beq	a9c <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a14:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 a18:	e3a02001 	mov	r2, #1
 a1c:	e24b1019 	sub	r1, fp, #25
 a20:	e1a00007 	mov	r0, r7
 a24:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 a28:	0a000023 	beq	abc <printf+0x138>
  write(fd, &c, 1);
 a2c:	ebfffebc 	bl	524 <write>
 a30:	e3a02001 	mov	r2, #1
 a34:	e24b1019 	sub	r1, fp, #25
 a38:	e1a00007 	mov	r0, r7
 a3c:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 a40:	ebfffeb7 	bl	524 <write>
  for(i = 0; fmt[i]; i++){
 a44:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a48:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 a4c:	e3540000 	cmp	r4, #0
 a50:	1affffe2 	bne	9e0 <printf+0x5c>
    }
  }
}
 a54:	e24bd018 	sub	sp, fp, #24
 a58:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a5c:	e28dd00c 	add	sp, sp, #12
 a60:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a64:	e3a03000 	mov	r3, #0
 a68:	e3a02010 	mov	r2, #16
 a6c:	e4981004 	ldr	r1, [r8], #4
 a70:	e1a00007 	mov	r0, r7
 a74:	ebffff7a 	bl	864 <printint>
      state = 0;
 a78:	e3a05000 	mov	r5, #0
 a7c:	eaffffd4 	b	9d4 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a80:	e3a03001 	mov	r3, #1
 a84:	e3a0200a 	mov	r2, #10
 a88:	e4981004 	ldr	r1, [r8], #4
 a8c:	e1a00007 	mov	r0, r7
 a90:	ebffff73 	bl	864 <printint>
      state = 0;
 a94:	e3a05000 	mov	r5, #0
 a98:	eaffffcd 	b	9d4 <printf+0x50>
        putc(fd, *ap);
 a9c:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 aa0:	e3a02001 	mov	r2, #1
 aa4:	e24b1019 	sub	r1, fp, #25
 aa8:	e1a00007 	mov	r0, r7
      state = 0;
 aac:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 ab0:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 ab4:	ebfffe9a 	bl	524 <write>
        ap++;
 ab8:	eaffffc5 	b	9d4 <printf+0x50>
  write(fd, &c, 1);
 abc:	ebfffe98 	bl	524 <write>
      state = 0;
 ac0:	e3a05000 	mov	r5, #0
 ac4:	eaffffc2 	b	9d4 <printf+0x50>
        s = (char*)*ap;
 ac8:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 acc:	e3540000 	cmp	r4, #0
 ad0:	0a00000b 	beq	b04 <printf+0x180>
        while(*s != 0){
 ad4:	e5d45000 	ldrb	r5, [r4]
 ad8:	e3550000 	cmp	r5, #0
 adc:	0affffbc 	beq	9d4 <printf+0x50>
  write(fd, &c, 1);
 ae0:	e3a02001 	mov	r2, #1
 ae4:	e24b1019 	sub	r1, fp, #25
 ae8:	e1a00007 	mov	r0, r7
 aec:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 af0:	ebfffe8b 	bl	524 <write>
        while(*s != 0){
 af4:	e5f45001 	ldrb	r5, [r4, #1]!
 af8:	e3550000 	cmp	r5, #0
 afc:	1afffff7 	bne	ae0 <printf+0x15c>
 b00:	eaffffb3 	b	9d4 <printf+0x50>
          s = "(null)";
 b04:	e3004ce8 	movw	r4, #3304	; 0xce8
        while(*s != 0){
 b08:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 b0c:	e3404000 	movt	r4, #0
 b10:	eafffff2 	b	ae0 <printf+0x15c>

00000b14 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b14:	e300ccf0 	movw	ip, #3312	; 0xcf0
 b18:	e340c000 	movt	ip, #0
{
 b1c:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 b20:	e2401008 	sub	r1, r0, #8
{
 b24:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b28:	e59c3000 	ldr	r3, [ip]
 b2c:	ea000004 	b	b44 <free+0x30>
 b30:	e1510002 	cmp	r1, r2
 b34:	3a000009 	bcc	b60 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b38:	e1530002 	cmp	r3, r2
 b3c:	2a000007 	bcs	b60 <free+0x4c>
{
 b40:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b44:	e1530001 	cmp	r3, r1
 b48:	e5932000 	ldr	r2, [r3]
 b4c:	3afffff7 	bcc	b30 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b50:	e1530002 	cmp	r3, r2
 b54:	3afffff9 	bcc	b40 <free+0x2c>
 b58:	e1510002 	cmp	r1, r2
 b5c:	2afffff7 	bcs	b40 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b60:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b64:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b68:	e081418e 	add	r4, r1, lr, lsl #3
 b6c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b70:	05922004 	ldreq	r2, [r2, #4]
 b74:	0082e00e 	addeq	lr, r2, lr
 b78:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b7c:	05932000 	ldreq	r2, [r3]
 b80:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b84:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b88:	e5932004 	ldr	r2, [r3, #4]
 b8c:	e083e182 	add	lr, r3, r2, lsl #3
 b90:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b94:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b98:	05101004 	ldreq	r1, [r0, #-4]
 b9c:	00812002 	addeq	r2, r1, r2
 ba0:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 ba4:	05102008 	ldreq	r2, [r0, #-8]
 ba8:	05832000 	streq	r2, [r3]
}
 bac:	e8bd8810 	pop	{r4, fp, pc}

00000bb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bb0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 bb4:	e3007cf0 	movw	r7, #3312	; 0xcf0
 bb8:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bbc:	e2804007 	add	r4, r0, #7
{
 bc0:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 bc4:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc8:	e1a041a4 	lsr	r4, r4, #3
 bcc:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 bd0:	e3510000 	cmp	r1, #0
 bd4:	0a000029 	beq	c80 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd8:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 bdc:	e5932004 	ldr	r2, [r3, #4]
 be0:	e1520004 	cmp	r2, r4
 be4:	2a000019 	bcs	c50 <malloc+0xa0>
 be8:	e3540a01 	cmp	r4, #4096	; 0x1000
 bec:	21a05004 	movcs	r5, r4
 bf0:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 bf4:	e1a06185 	lsl	r6, r5, #3
 bf8:	ea000005 	b	c14 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bfc:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 c00:	e5902004 	ldr	r2, [r0, #4]
 c04:	e1520004 	cmp	r2, r4
 c08:	2a000012 	bcs	c58 <malloc+0xa8>
 c0c:	e5971000 	ldr	r1, [r7]
 c10:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c14:	e1510003 	cmp	r1, r3
 c18:	1afffff7 	bne	bfc <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 c1c:	e1a00006 	mov	r0, r6
 c20:	ebfffee8 	bl	7c8 <sbrk>
 c24:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 c28:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 c2c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 c30:	0a000004 	beq	c48 <malloc+0x98>
  hp->s.size = nu;
 c34:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 c38:	ebffffb5 	bl	b14 <free>
  return freep;
 c3c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 c40:	e3530000 	cmp	r3, #0
 c44:	1affffec 	bne	bfc <malloc+0x4c>
        return 0;
 c48:	e3a00000 	mov	r0, #0
  }
}
 c4c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 c50:	e1a00003 	mov	r0, r3
 c54:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 c58:	e1540002 	cmp	r4, r2
      freep = prevp;
 c5c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c60:	10422004 	subne	r2, r2, r4
 c64:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c68:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c6c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c70:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c74:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c78:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c7c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c80:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 c84:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c88:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 c8c:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 c90:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 c94:	eaffffd3 	b	be8 <malloc+0x38>
