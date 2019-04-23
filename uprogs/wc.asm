
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
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
  if(argc <= 1){
  14:	c3a05001 	movgt	r5, #1
  18:	da000013 	ble	6c <main+0x6c>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  1c:	e3a01000 	mov	r1, #0
  20:	e5940000 	ldr	r0, [r4]
  24:	eb000165 	bl	5c0 <open>
  28:	e2506000 	subs	r6, r0, #0
  2c:	ba000008 	blt	54 <main+0x54>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  30:	e5941000 	ldr	r1, [r4]
  for(i = 1; i < argc; i++){
  34:	e2855001 	add	r5, r5, #1
    wc(fd, argv[i]);
  38:	eb000010 	bl	80 <wc>
    close(fd);
  3c:	e1a00006 	mov	r0, r6
  40:	eb000137 	bl	524 <close>
  for(i = 1; i < argc; i++){
  44:	e1570005 	cmp	r7, r5
  48:	e2844004 	add	r4, r4, #4
  4c:	1afffff2 	bne	1c <main+0x1c>
  }
  exit();
  50:	eb0000f2 	bl	420 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  54:	e5942000 	ldr	r2, [r4]
  58:	e3001c90 	movw	r1, #3216	; 0xc90
  5c:	e3a00001 	mov	r0, #1
  60:	e3401000 	movt	r1, #0
  64:	eb000239 	bl	950 <printf>
      exit();
  68:	eb0000ec 	bl	420 <exit>
    wc(0, "");
  6c:	e3001c8c 	movw	r1, #3212	; 0xc8c
  70:	e3a00000 	mov	r0, #0
  74:	e3401000 	movt	r1, #0
  78:	eb000000 	bl	80 <wc>
    exit();
  7c:	eb0000e7 	bl	420 <exit>

00000080 <wc>:
{
  80:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  inword = 0;
  84:	e3a04000 	mov	r4, #0
{
  88:	e28db020 	add	fp, sp, #32
      if(strchr(" \r\t\n\v", buf[i]))
  8c:	e3006c68 	movw	r6, #3176	; 0xc68
  90:	e3406000 	movt	r6, #0
  l = w = c = 0;
  94:	e1a08004 	mov	r8, r4
  98:	e1a07004 	mov	r7, r4
{
  9c:	e24dd01c 	sub	sp, sp, #28
  a0:	e3003ccc 	movw	r3, #3276	; 0xccc
  a4:	e3403000 	movt	r3, #0
  a8:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
  ac:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
  b0:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
  l = w = c = 0;
  b4:	e50b4028 	str	r4, [fp, #-40]	; 0xffffffd8
  while((n = read(fd, buf, sizeof(buf))) > 0){
  b8:	e3a02c02 	mov	r2, #512	; 0x200
  bc:	e3001ccc 	movw	r1, #3276	; 0xccc
  c0:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
  c4:	e3401000 	movt	r1, #0
  c8:	eb0000fb 	bl	4bc <read>
  cc:	e2509000 	subs	r9, r0, #0
  d0:	da000017 	ble	134 <wc+0xb4>
  d4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
  d8:	e2495001 	sub	r5, r9, #1
  dc:	e59fa098 	ldr	sl, [pc, #152]	; 17c <wc+0xfc>
  e0:	e0835005 	add	r5, r3, r5
  e4:	ea000001 	b	f0 <wc+0x70>
    for(i=0; i<n; i++){
  e8:	e155000a 	cmp	r5, sl
  ec:	0a00000c 	beq	124 <wc+0xa4>
      if(buf[i] == '\n')
  f0:	e5fa1001 	ldrb	r1, [sl, #1]!
      if(strchr(" \r\t\n\v", buf[i]))
  f4:	e1a00006 	mov	r0, r6
      if(buf[i] == '\n')
  f8:	e351000a 	cmp	r1, #10
        l++;
  fc:	02877001 	addeq	r7, r7, #1
      if(strchr(" \r\t\n\v", buf[i]))
 100:	eb00005b 	bl	274 <strchr>
 104:	e3500000 	cmp	r0, #0
        inword = 0;
 108:	13a04000 	movne	r4, #0
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	1afffff5 	bne	e8 <wc+0x68>
      else if(!inword){
 110:	e3540000 	cmp	r4, #0
        w++;
 114:	02888001 	addeq	r8, r8, #1
        inword = 1;
 118:	03a04001 	moveq	r4, #1
    for(i=0; i<n; i++){
 11c:	e155000a 	cmp	r5, sl
 120:	1afffff2 	bne	f0 <wc+0x70>
 124:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 128:	e0833009 	add	r3, r3, r9
 12c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
 130:	eaffffe0 	b	b8 <wc+0x38>
  if(n < 0){
 134:	1a00000b 	bne	168 <wc+0xe8>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 138:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
 13c:	e3a00001 	mov	r0, #1
 140:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
 144:	e3001c80 	movw	r1, #3200	; 0xc80
 148:	e3401000 	movt	r1, #0
 14c:	e58d3004 	str	r3, [sp, #4]
 150:	e1a03008 	mov	r3, r8
 154:	e58d2000 	str	r2, [sp]
 158:	e1a02007 	mov	r2, r7
 15c:	eb0001fb 	bl	950 <printf>
}
 160:	e24bd020 	sub	sp, fp, #32
 164:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(1, "wc: read error\n");
 168:	e3001c70 	movw	r1, #3184	; 0xc70
 16c:	e3a00001 	mov	r0, #1
 170:	e3401000 	movt	r1, #0
 174:	eb0001f5 	bl	950 <printf>
    exit();
 178:	eb0000a8 	bl	420 <exit>
 17c:	00000ccb 	.word	0x00000ccb

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
 1c8:	e3530000 	cmp	r3, #0
 1cc:	0a000006 	beq	1ec <strcmp+0x44>
 1d0:	e5f12001 	ldrb	r2, [r1, #1]!
 1d4:	e1530002 	cmp	r3, r2
 1d8:	0afffff9 	beq	1c4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1dc:	e0430002 	sub	r0, r3, r2
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr
 1ec:	e5d12001 	ldrb	r2, [r1, #1]
 1f0:	e0430002 	sub	r0, r3, r2
 1f4:	e28bd000 	add	sp, fp, #0
 1f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1fc:	e12fff1e 	bx	lr

00000200 <strlen>:

uint
strlen(char *s)
{
 200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 204:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 208:	e5d03000 	ldrb	r3, [r0]
 20c:	e3530000 	cmp	r3, #0
 210:	0a000009 	beq	23c <strlen+0x3c>
 214:	e1a02000 	mov	r2, r0
 218:	e3a03000 	mov	r3, #0
 21c:	e5f21001 	ldrb	r1, [r2, #1]!
 220:	e2833001 	add	r3, r3, #1
 224:	e3510000 	cmp	r1, #0
 228:	e1a00003 	mov	r0, r3
 22c:	1afffffa 	bne	21c <strlen+0x1c>
    ;
  return n;
}
 230:	e28bd000 	add	sp, fp, #0
 234:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 238:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 23c:	e1a00003 	mov	r0, r3
 240:	eafffffa 	b	230 <strlen+0x30>

00000244 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 244:	e3520000 	cmp	r2, #0
{
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 250:	0a000004 	beq	268 <memset+0x24>
 254:	e6ef1071 	uxtb	r1, r1
 258:	e0802002 	add	r2, r0, r2
 25c:	e4c01001 	strb	r1, [r0], #1
 260:	e1520000 	cmp	r2, r0
 264:	1afffffc 	bne	25c <memset+0x18>
  return (void *)p;
}
 268:	e28bd000 	add	sp, fp, #0
 26c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 270:	e12fff1e 	bx	lr

00000274 <strchr>:

char*
strchr(const char *s, char c)
{
 274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 278:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 27c:	e5d02000 	ldrb	r2, [r0]
 280:	e3520000 	cmp	r2, #0
 284:	0a00000b 	beq	2b8 <strchr+0x44>
    if(*s == c)
 288:	e1510002 	cmp	r1, r2
 28c:	1a000002 	bne	29c <strchr+0x28>
 290:	ea000005 	b	2ac <strchr+0x38>
 294:	e1530001 	cmp	r3, r1
 298:	0a000003 	beq	2ac <strchr+0x38>
  for(; *s; s++)
 29c:	e5f03001 	ldrb	r3, [r0, #1]!
 2a0:	e3530000 	cmp	r3, #0
 2a4:	1afffffa 	bne	294 <strchr+0x20>
      return (char*)s;
  return 0;
 2a8:	e1a00003 	mov	r0, r3
}
 2ac:	e28bd000 	add	sp, fp, #0
 2b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b4:	e12fff1e 	bx	lr
  return 0;
 2b8:	e1a00002 	mov	r0, r2
 2bc:	eafffffa 	b	2ac <strchr+0x38>

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2c4:	e1a08000 	mov	r8, r0
 2c8:	e28db018 	add	fp, sp, #24
 2cc:	e1a07001 	mov	r7, r1
 2d0:	e24dd00c 	sub	sp, sp, #12
 2d4:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d8:	e3a05000 	mov	r5, #0
 2dc:	ea000008 	b	304 <gets+0x44>
    cc = read(0, &c, 1);
 2e0:	eb000075 	bl	4bc <read>
    if(cc < 1)
 2e4:	e3500000 	cmp	r0, #0
 2e8:	da00000b 	ble	31c <gets+0x5c>
      break;
    buf[i++] = c;
 2ec:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2f0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 2f4:	e353000d 	cmp	r3, #13
 2f8:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 2fc:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 300:	0a000005 	beq	31c <gets+0x5c>
    cc = read(0, &c, 1);
 304:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 308:	e0854002 	add	r4, r5, r2
 30c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 310:	e24b101d 	sub	r1, fp, #29
 314:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 318:	bafffff0 	blt	2e0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 31c:	e3a03000 	mov	r3, #0
  return buf;
}
 320:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 324:	e7c83005 	strb	r3, [r8, r5]
}
 328:	e24bd018 	sub	sp, fp, #24
 32c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

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
 340:	eb00009e 	bl	5c0 <open>
  if(fd < 0)
 344:	e2505000 	subs	r5, r0, #0
 348:	ba000006 	blt	368 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 34c:	e1a01004 	mov	r1, r4
 350:	eb0000c1 	bl	65c <fstat>
 354:	e1a04000 	mov	r4, r0
  close(fd);
 358:	e1a00005 	mov	r0, r5
 35c:	eb000070 	bl	524 <close>
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
 384:	e3a03000 	mov	r3, #0
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

00000488 <pipe>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00004 	mov	r0, #4
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <read>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a00005 	mov	r0, #5
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <write>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00010 	mov	r0, #16
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <close>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a00015 	mov	r0, #21
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <kill>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00006 	mov	r0, #6
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <exec>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00007 	mov	r0, #7
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <open>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a0000f 	mov	r0, #15
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <mknod>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a00011 	mov	r0, #17
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <unlink>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a00012 	mov	r0, #18
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <fstat>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00008 	mov	r0, #8
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <link>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a00013 	mov	r0, #19
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <mkdir>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a00014 	mov	r0, #20
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <chdir>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a00009 	mov	r0, #9
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <dup>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a0000a 	mov	r0, #10
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <getpid>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a0000b 	mov	r0, #11
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <sbrk>:
 794:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 798:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 79c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a8:	e3a0000c 	mov	r0, #12
 7ac:	ef000040 	svc	0x00000040
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c4:	e12fff1e 	bx	lr

000007c8 <sleep>:
 7c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7dc:	e3a0000d 	mov	r0, #13
 7e0:	ef000040 	svc	0x00000040
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f8:	e12fff1e 	bx	lr

000007fc <uptime>:
 7fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 800:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 804:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 808:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 80c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 810:	e3a0000e 	mov	r0, #14
 814:	ef000040 	svc	0x00000040
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 824:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 828:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 82c:	e12fff1e 	bx	lr

00000830 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 830:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 834:	e1a09fa1 	lsr	r9, r1, #31
 838:	e3530000 	cmp	r3, #0
 83c:	03a09000 	moveq	r9, #0
 840:	12099001 	andne	r9, r9, #1
{
 844:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 848:	e3590000 	cmp	r9, #0
 84c:	e3008ca4 	movw	r8, #3236	; 0xca4
    neg = 1;
    x = -xx;
 850:	1261e000 	rsbne	lr, r1, #0
 854:	e3408000 	movt	r8, #0
 858:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 85c:	e1a04000 	mov	r4, r0
    neg = 1;
 860:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 864:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 868:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 86c:	e3a05001 	mov	r5, #1
{
 870:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 874:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 878:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 87c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 880:	e1a0033e 	lsr	r0, lr, r3
 884:	e2000001 	and	r0, r0, #1
 888:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 88c:	e1520001 	cmp	r2, r1
            r = r - d;
 890:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 894:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 898:	e2533001 	subs	r3, r3, #1
 89c:	2afffff7 	bcs	880 <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8a0:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 8a4:	e35c0000 	cmp	ip, #0
 8a8:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 8ac:	e2873001 	add	r3, r7, #1
 8b0:	e7d81001 	ldrb	r1, [r8, r1]
 8b4:	e5e61001 	strb	r1, [r6, #1]!
 8b8:	11a07003 	movne	r7, r3
 8bc:	1affffec 	bne	874 <printint+0x44>
  if(neg)
 8c0:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 8c4:	124b201c 	subne	r2, fp, #28
 8c8:	10822003 	addne	r2, r2, r3
 8cc:	13a0102d 	movne	r1, #45	; 0x2d
 8d0:	12873002 	addne	r3, r7, #2
 8d4:	15421010 	strbne	r1, [r2, #-16]
 8d8:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 8dc:	e2435001 	sub	r5, r3, #1
 8e0:	e0826003 	add	r6, r2, r3
 8e4:	e5763001 	ldrb	r3, [r6, #-1]!
 8e8:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 8ec:	e3a02001 	mov	r2, #1
 8f0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 8f4:	e1a00004 	mov	r0, r4
 8f8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 8fc:	ebfffefb 	bl	4f0 <write>
  while(--i >= 0)
 900:	e3750001 	cmn	r5, #1
 904:	1afffff6 	bne	8e4 <printint+0xb4>
    putc(fd, buf[i]);
}
 908:	e24bd01c 	sub	sp, fp, #28
 90c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000910 <div>:
{
 910:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 914:	e3a02000 	mov	r2, #0
{
 918:	e28db008 	add	fp, sp, #8
 91c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 920:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 924:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 928:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 92c:	e1a0c33e 	lsr	ip, lr, r3
 930:	e20cc001 	and	ip, ip, #1
 934:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 938:	e1520001 	cmp	r2, r1
            r = r - d;
 93c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 940:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 944:	e2533001 	subs	r3, r3, #1
 948:	2afffff7 	bcs	92c <div+0x1c>
}
 94c:	e8bd8810 	pop	{r4, fp, pc}

00000950 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 950:	e92d000e 	push	{r1, r2, r3}
 954:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 958:	e28db018 	add	fp, sp, #24
 95c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 960:	e59b6004 	ldr	r6, [fp, #4]
 964:	e5d64000 	ldrb	r4, [r6]
 968:	e3540000 	cmp	r4, #0
 96c:	0a00002b 	beq	a20 <printf+0xd0>
 970:	e1a07000 	mov	r7, r0
 974:	e28b8008 	add	r8, fp, #8
 978:	e3a05000 	mov	r5, #0
 97c:	ea00000a 	b	9ac <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 980:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 984:	01a05004 	moveq	r5, r4
      if(c == '%'){
 988:	0a000004 	beq	9a0 <printf+0x50>
 98c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 990:	e3a02001 	mov	r2, #1
 994:	e1a00007 	mov	r0, r7
 998:	e5614006 	strb	r4, [r1, #-6]!
 99c:	ebfffed3 	bl	4f0 <write>
  for(i = 0; fmt[i]; i++){
 9a0:	e5f64001 	ldrb	r4, [r6, #1]!
 9a4:	e3540000 	cmp	r4, #0
 9a8:	0a00001c 	beq	a20 <printf+0xd0>
    if(state == 0){
 9ac:	e3550000 	cmp	r5, #0
 9b0:	0afffff2 	beq	980 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9b4:	e3550025 	cmp	r5, #37	; 0x25
 9b8:	1afffff8 	bne	9a0 <printf+0x50>
      if(c == 'd'){
 9bc:	e3540064 	cmp	r4, #100	; 0x64
 9c0:	0a000037 	beq	aa4 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9c4:	e20430f7 	and	r3, r4, #247	; 0xf7
 9c8:	e3530070 	cmp	r3, #112	; 0x70
 9cc:	0a000017 	beq	a30 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9d0:	e3540073 	cmp	r4, #115	; 0x73
 9d4:	0a00001c 	beq	a4c <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9d8:	e3540063 	cmp	r4, #99	; 0x63
 9dc:	0a000037 	beq	ac0 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9e0:	e3540025 	cmp	r4, #37	; 0x25
 9e4:	0a000027 	beq	a88 <printf+0x138>
  write(fd, &c, 1);
 9e8:	e3a02001 	mov	r2, #1
 9ec:	e24b1019 	sub	r1, fp, #25
 9f0:	e1a00007 	mov	r0, r7
 9f4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9f8:	ebfffebc 	bl	4f0 <write>
 9fc:	e3a02001 	mov	r2, #1
 a00:	e24b101a 	sub	r1, fp, #26
 a04:	e1a00007 	mov	r0, r7
 a08:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a0c:	ebfffeb7 	bl	4f0 <write>
  for(i = 0; fmt[i]; i++){
 a10:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a14:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 a18:	e3540000 	cmp	r4, #0
 a1c:	1affffe2 	bne	9ac <printf+0x5c>
    }
  }
}
 a20:	e24bd018 	sub	sp, fp, #24
 a24:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a28:	e28dd00c 	add	sp, sp, #12
 a2c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a30:	e3a03000 	mov	r3, #0
 a34:	e3a02010 	mov	r2, #16
 a38:	e4981004 	ldr	r1, [r8], #4
 a3c:	e1a00007 	mov	r0, r7
 a40:	ebffff7a 	bl	830 <printint>
      state = 0;
 a44:	e3a05000 	mov	r5, #0
 a48:	eaffffd4 	b	9a0 <printf+0x50>
        s = (char*)*ap;
 a4c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a50:	e3540000 	cmp	r4, #0
 a54:	0a000021 	beq	ae0 <printf+0x190>
        while(*s != 0){
 a58:	e5d45000 	ldrb	r5, [r4]
 a5c:	e3550000 	cmp	r5, #0
 a60:	0affffce 	beq	9a0 <printf+0x50>
  write(fd, &c, 1);
 a64:	e3a02001 	mov	r2, #1
 a68:	e24b101d 	sub	r1, fp, #29
 a6c:	e1a00007 	mov	r0, r7
 a70:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a74:	ebfffe9d 	bl	4f0 <write>
        while(*s != 0){
 a78:	e5f45001 	ldrb	r5, [r4, #1]!
 a7c:	e3550000 	cmp	r5, #0
 a80:	1afffff7 	bne	a64 <printf+0x114>
 a84:	eaffffc5 	b	9a0 <printf+0x50>
 a88:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a8c:	e3a02001 	mov	r2, #1
 a90:	e1a00007 	mov	r0, r7
 a94:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 a98:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 a9c:	ebfffe93 	bl	4f0 <write>
 aa0:	eaffffbe 	b	9a0 <printf+0x50>
        printint(fd, *ap, 10, 1);
 aa4:	e3a03001 	mov	r3, #1
 aa8:	e3a0200a 	mov	r2, #10
 aac:	e4981004 	ldr	r1, [r8], #4
 ab0:	e1a00007 	mov	r0, r7
 ab4:	ebffff5d 	bl	830 <printint>
      state = 0;
 ab8:	e3a05000 	mov	r5, #0
 abc:	eaffffb7 	b	9a0 <printf+0x50>
        putc(fd, *ap);
 ac0:	e4983004 	ldr	r3, [r8], #4
 ac4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 ac8:	e3a02001 	mov	r2, #1
 acc:	e1a00007 	mov	r0, r7
      state = 0;
 ad0:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 ad4:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 ad8:	ebfffe84 	bl	4f0 <write>
 adc:	eaffffaf 	b	9a0 <printf+0x50>
          s = "(null)";
 ae0:	e3004cb8 	movw	r4, #3256	; 0xcb8
        while(*s != 0){
 ae4:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 ae8:	e3404000 	movt	r4, #0
 aec:	eaffffdc 	b	a64 <printf+0x114>

00000af0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af0:	e300ccc0 	movw	ip, #3264	; 0xcc0
 af4:	e340c000 	movt	ip, #0
{
 af8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 afc:	e2401008 	sub	r1, r0, #8
{
 b00:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b04:	e59c3000 	ldr	r3, [ip]
 b08:	ea000004 	b	b20 <free+0x30>
 b0c:	e1510002 	cmp	r1, r2
 b10:	3a000009 	bcc	b3c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b14:	e1530002 	cmp	r3, r2
 b18:	2a000007 	bcs	b3c <free+0x4c>
{
 b1c:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b20:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b24:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b28:	3afffff7 	bcc	b0c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b2c:	e1530002 	cmp	r3, r2
 b30:	3afffff9 	bcc	b1c <free+0x2c>
 b34:	e1510002 	cmp	r1, r2
 b38:	2afffff7 	bcs	b1c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b3c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b40:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b44:	e081418e 	add	r4, r1, lr, lsl #3
 b48:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b4c:	05922004 	ldreq	r2, [r2, #4]
 b50:	0082e00e 	addeq	lr, r2, lr
 b54:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b58:	05932000 	ldreq	r2, [r3]
 b5c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b60:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b64:	e5932004 	ldr	r2, [r3, #4]
 b68:	e083e182 	add	lr, r3, r2, lsl #3
 b6c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b70:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b74:	05101004 	ldreq	r1, [r0, #-4]
 b78:	00812002 	addeq	r2, r1, r2
 b7c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b80:	05102008 	ldreq	r2, [r0, #-8]
 b84:	05832000 	streq	r2, [r3]
}
 b88:	e8bd8810 	pop	{r4, fp, pc}

00000b8c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b8c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b90:	e3007cc0 	movw	r7, #3264	; 0xcc0
 b94:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b98:	e2804007 	add	r4, r0, #7
{
 b9c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 ba0:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba4:	e1a041a4 	lsr	r4, r4, #3
 ba8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 bac:	e3530000 	cmp	r3, #0
 bb0:	0a000027 	beq	c54 <malloc+0xc8>
 bb4:	e5930000 	ldr	r0, [r3]
 bb8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bbc:	e1540002 	cmp	r4, r2
 bc0:	9a000019 	bls	c2c <malloc+0xa0>
 bc4:	e3540a01 	cmp	r4, #4096	; 0x1000
 bc8:	21a05004 	movcs	r5, r4
 bcc:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 bd0:	e1a06185 	lsl	r6, r5, #3
 bd4:	ea000003 	b	be8 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 bdc:	e5902004 	ldr	r2, [r0, #4]
 be0:	e1540002 	cmp	r4, r2
 be4:	9a000010 	bls	c2c <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 be8:	e5972000 	ldr	r2, [r7]
 bec:	e1a03000 	mov	r3, r0
 bf0:	e1520000 	cmp	r2, r0
 bf4:	1afffff7 	bne	bd8 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 bf8:	e1a00006 	mov	r0, r6
 bfc:	ebfffee4 	bl	794 <sbrk>
 c00:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 c04:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 c08:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 c0c:	0a000004 	beq	c24 <malloc+0x98>
  hp->s.size = nu;
 c10:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 c14:	ebffffb5 	bl	af0 <free>
  return freep;
 c18:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 c1c:	e3530000 	cmp	r3, #0
 c20:	1affffec 	bne	bd8 <malloc+0x4c>
        return 0;
 c24:	e3a00000 	mov	r0, #0
  }
}
 c28:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 c2c:	e1540002 	cmp	r4, r2
      freep = prevp;
 c30:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c34:	10422004 	subne	r2, r2, r4
 c38:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c3c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c40:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c44:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c48:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c4c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c50:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c54:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c58:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c5c:	e5870000 	str	r0, [r7]
 c60:	e5870004 	str	r0, [r7, #4]
 c64:	eaffffd6 	b	bc4 <malloc+0x38>
