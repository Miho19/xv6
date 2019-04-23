
_forktest:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  forktest();
   8:	eb00000e 	bl	48 <forktest>
  exit();
   c:	eb0000f7 	bl	3f0 <exit>

00000010 <printf>:
{
  10:	e92d000e 	push	{r1, r2, r3}
  14:	e92d4810 	push	{r4, fp, lr}
  18:	e28db008 	add	fp, sp, #8
  1c:	e1a04000 	mov	r4, r0
  write(fd, s, strlen(s));
  20:	e59b0004 	ldr	r0, [fp, #4]
  24:	eb000069 	bl	1d0 <strlen>
  28:	e59b1004 	ldr	r1, [fp, #4]
  2c:	e1a02000 	mov	r2, r0
  30:	e1a00004 	mov	r0, r4
  34:	eb000121 	bl	4c0 <write>
}
  38:	e24bd008 	sub	sp, fp, #8
  3c:	e8bd4810 	pop	{r4, fp, lr}
  40:	e28dd00c 	add	sp, sp, #12
  44:	e12fff1e 	bx	lr

00000048 <forktest>:
{
  48:	e92d4830 	push	{r4, r5, fp, lr}
  write(fd, s, strlen(s));
  4c:	e3000800 	movw	r0, #2048	; 0x800
{
  50:	e28db00c 	add	fp, sp, #12
  write(fd, s, strlen(s));
  54:	e3400000 	movt	r0, #0
  58:	eb00005c 	bl	1d0 <strlen>
  5c:	e3001800 	movw	r1, #2048	; 0x800
  60:	e3401000 	movt	r1, #0
  for(n=0; n<N; n++){
  64:	e3a04000 	mov	r4, #0
  write(fd, s, strlen(s));
  68:	e1a02000 	mov	r2, r0
  6c:	e3a00001 	mov	r0, #1
  70:	eb000112 	bl	4c0 <write>
  74:	ea000003 	b	88 <forktest+0x40>
    if(pid == 0)
  78:	0a00002a 	beq	128 <forktest+0xe0>
  for(n=0; n<N; n++){
  7c:	e2844001 	add	r4, r4, #1
  80:	e3540ffa 	cmp	r4, #1000	; 0x3e8
  84:	0a000016 	beq	e4 <forktest+0x9c>
    pid = fork();
  88:	eb0000cb 	bl	3bc <fork>
    if(pid < 0)
  8c:	e3500000 	cmp	r0, #0
  90:	aafffff8 	bge	78 <forktest+0x30>
  for(; n > 0; n--){
  94:	e3540000 	cmp	r4, #0
  98:	0a000004 	beq	b0 <forktest+0x68>
    if(wait() < 0){
  9c:	eb0000e0 	bl	424 <wait>
  a0:	e3500000 	cmp	r0, #0
  a4:	ba000017 	blt	108 <forktest+0xc0>
  for(; n > 0; n--){
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffffa 	bne	9c <forktest+0x54>
  if(wait() != -1){
  b0:	eb0000db 	bl	424 <wait>
  b4:	e3700001 	cmn	r0, #1
  b8:	1a00001b 	bne	12c <forktest+0xe4>
  write(fd, s, strlen(s));
  bc:	e3000834 	movw	r0, #2100	; 0x834
  c0:	e3400000 	movt	r0, #0
  c4:	eb000041 	bl	1d0 <strlen>
  c8:	e3001834 	movw	r1, #2100	; 0x834
  cc:	e3401000 	movt	r1, #0
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a00001 	mov	r0, #1
}
  d8:	e24bd00c 	sub	sp, fp, #12
  dc:	e8bd4830 	pop	{r4, r5, fp, lr}
  write(fd, s, strlen(s));
  e0:	ea0000f6 	b	4c0 <write>
  e4:	e3000844 	movw	r0, #2116	; 0x844
  e8:	e3400000 	movt	r0, #0
  ec:	eb000037 	bl	1d0 <strlen>
  f0:	e3001844 	movw	r1, #2116	; 0x844
  f4:	e3401000 	movt	r1, #0
  f8:	e1a02000 	mov	r2, r0
  fc:	e3a00001 	mov	r0, #1
 100:	eb0000ee 	bl	4c0 <write>
    exit();
 104:	eb0000b9 	bl	3f0 <exit>
  write(fd, s, strlen(s));
 108:	e300080c 	movw	r0, #2060	; 0x80c
 10c:	e3400000 	movt	r0, #0
 110:	eb00002e 	bl	1d0 <strlen>
 114:	e300180c 	movw	r1, #2060	; 0x80c
 118:	e3401000 	movt	r1, #0
 11c:	e1a02000 	mov	r2, r0
 120:	e3a00001 	mov	r0, #1
 124:	eb0000e5 	bl	4c0 <write>
      exit();
 128:	eb0000b0 	bl	3f0 <exit>
  write(fd, s, strlen(s));
 12c:	e3000820 	movw	r0, #2080	; 0x820
 130:	e3400000 	movt	r0, #0
 134:	eb000025 	bl	1d0 <strlen>
 138:	e3001820 	movw	r1, #2080	; 0x820
 13c:	e3401000 	movt	r1, #0
 140:	e1a02000 	mov	r2, r0
 144:	e3a00001 	mov	r0, #1
 148:	eb0000dc 	bl	4c0 <write>
    exit();
 14c:	eb0000a7 	bl	3f0 <exit>

00000150 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 150:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 154:	e2402001 	sub	r2, r0, #1
 158:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15c:	e4d13001 	ldrb	r3, [r1], #1
 160:	e3530000 	cmp	r3, #0
 164:	e5e23001 	strb	r3, [r2, #1]!
 168:	1afffffb 	bne	15c <strcpy+0xc>
    ;
  return os;
}
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 180:	e5d03000 	ldrb	r3, [r0]
 184:	e5d12000 	ldrb	r2, [r1]
 188:	e3530000 	cmp	r3, #0
 18c:	1a000004 	bne	1a4 <strcmp+0x2c>
 190:	ea000005 	b	1ac <strcmp+0x34>
 194:	e5f03001 	ldrb	r3, [r0, #1]!
 198:	e3530000 	cmp	r3, #0
 19c:	0a000006 	beq	1bc <strcmp+0x44>
 1a0:	e5f12001 	ldrb	r2, [r1, #1]!
 1a4:	e1530002 	cmp	r3, r2
 1a8:	0afffff9 	beq	194 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1ac:	e0430002 	sub	r0, r3, r2
 1b0:	e28bd000 	add	sp, fp, #0
 1b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b8:	e12fff1e 	bx	lr
 1bc:	e5d12001 	ldrb	r2, [r1, #1]
 1c0:	e0430002 	sub	r0, r3, r2
 1c4:	e28bd000 	add	sp, fp, #0
 1c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1cc:	e12fff1e 	bx	lr

000001d0 <strlen>:

uint
strlen(char *s)
{
 1d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1d4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1d8:	e5d03000 	ldrb	r3, [r0]
 1dc:	e3530000 	cmp	r3, #0
 1e0:	0a000009 	beq	20c <strlen+0x3c>
 1e4:	e1a02000 	mov	r2, r0
 1e8:	e3a03000 	mov	r3, #0
 1ec:	e5f21001 	ldrb	r1, [r2, #1]!
 1f0:	e2833001 	add	r3, r3, #1
 1f4:	e3510000 	cmp	r1, #0
 1f8:	e1a00003 	mov	r0, r3
 1fc:	1afffffa 	bne	1ec <strlen+0x1c>
    ;
  return n;
}
 200:	e28bd000 	add	sp, fp, #0
 204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 208:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 20c:	e1a00003 	mov	r0, r3
 210:	eafffffa 	b	200 <strlen+0x30>

00000214 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 214:	e3520000 	cmp	r2, #0
{
 218:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 21c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 220:	0a000004 	beq	238 <memset+0x24>
 224:	e6ef1071 	uxtb	r1, r1
 228:	e0802002 	add	r2, r0, r2
 22c:	e4c01001 	strb	r1, [r0], #1
 230:	e1520000 	cmp	r2, r0
 234:	1afffffc 	bne	22c <memset+0x18>
  return (void *)p;
}
 238:	e28bd000 	add	sp, fp, #0
 23c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 240:	e12fff1e 	bx	lr

00000244 <strchr>:

char*
strchr(const char *s, char c)
{
 244:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 248:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 24c:	e5d02000 	ldrb	r2, [r0]
 250:	e3520000 	cmp	r2, #0
 254:	0a00000b 	beq	288 <strchr+0x44>
    if(*s == c)
 258:	e1510002 	cmp	r1, r2
 25c:	1a000002 	bne	26c <strchr+0x28>
 260:	ea000005 	b	27c <strchr+0x38>
 264:	e1530001 	cmp	r3, r1
 268:	0a000003 	beq	27c <strchr+0x38>
  for(; *s; s++)
 26c:	e5f03001 	ldrb	r3, [r0, #1]!
 270:	e3530000 	cmp	r3, #0
 274:	1afffffa 	bne	264 <strchr+0x20>
      return (char*)s;
  return 0;
 278:	e1a00003 	mov	r0, r3
}
 27c:	e28bd000 	add	sp, fp, #0
 280:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 284:	e12fff1e 	bx	lr
  return 0;
 288:	e1a00002 	mov	r0, r2
 28c:	eafffffa 	b	27c <strchr+0x38>

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 294:	e1a08000 	mov	r8, r0
 298:	e28db018 	add	fp, sp, #24
 29c:	e1a07001 	mov	r7, r1
 2a0:	e24dd00c 	sub	sp, sp, #12
 2a4:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a8:	e3a05000 	mov	r5, #0
 2ac:	ea000008 	b	2d4 <gets+0x44>
    cc = read(0, &c, 1);
 2b0:	eb000075 	bl	48c <read>
    if(cc < 1)
 2b4:	e3500000 	cmp	r0, #0
 2b8:	da00000b 	ble	2ec <gets+0x5c>
      break;
    buf[i++] = c;
 2bc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2c0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 2c4:	e353000d 	cmp	r3, #13
 2c8:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 2cc:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 2d0:	0a000005 	beq	2ec <gets+0x5c>
    cc = read(0, &c, 1);
 2d4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 2d8:	e0854002 	add	r4, r5, r2
 2dc:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 2e0:	e24b101d 	sub	r1, fp, #29
 2e4:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 2e8:	bafffff0 	blt	2b0 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 2ec:	e3a03000 	mov	r3, #0
  return buf;
}
 2f0:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 2f4:	e7c83005 	strb	r3, [r8, r5]
}
 2f8:	e24bd018 	sub	sp, fp, #24
 2fc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000300 <stat>:

int
stat(char *n, struct stat *st)
{
 300:	e92d4830 	push	{r4, r5, fp, lr}
 304:	e1a04001 	mov	r4, r1
 308:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 30c:	e3a01000 	mov	r1, #0
 310:	eb00009e 	bl	590 <open>
  if(fd < 0)
 314:	e2505000 	subs	r5, r0, #0
 318:	ba000006 	blt	338 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 31c:	e1a01004 	mov	r1, r4
 320:	eb0000c1 	bl	62c <fstat>
 324:	e1a04000 	mov	r4, r0
  close(fd);
 328:	e1a00005 	mov	r0, r5
 32c:	eb000070 	bl	4f4 <close>
  return r;
}
 330:	e1a00004 	mov	r0, r4
 334:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 338:	e3e04000 	mvn	r4, #0
 33c:	eafffffb 	b	330 <stat+0x30>

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 344:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 348:	e5d02000 	ldrb	r2, [r0]
 34c:	e2423030 	sub	r3, r2, #48	; 0x30
 350:	e3530009 	cmp	r3, #9
 354:	e3a03000 	mov	r3, #0
 358:	8a000006 	bhi	378 <atoi+0x38>
    n = n*10 + *s++ - '0';
 35c:	e3a0c00a 	mov	ip, #10
 360:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 364:	e5f02001 	ldrb	r2, [r0, #1]!
 368:	e2421030 	sub	r1, r2, #48	; 0x30
 36c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 370:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 374:	9afffff9 	bls	360 <atoi+0x20>
  return n;
}
 378:	e1a00003 	mov	r0, r3
 37c:	e28bd000 	add	sp, fp, #0
 380:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 384:	e12fff1e 	bx	lr

00000388 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 388:	e3520000 	cmp	r2, #0
{
 38c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 390:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 394:	da000005 	ble	3b0 <memmove+0x28>
 398:	e0812002 	add	r2, r1, r2
 39c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3a0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 3a4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3a8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3ac:	1afffffb 	bne	3a0 <memmove+0x18>
  return vdst;
}
 3b0:	e28bd000 	add	sp, fp, #0
 3b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3b8:	e12fff1e 	bx	lr

000003bc <fork>:
 3bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d0:	e3a00001 	mov	r0, #1
 3d4:	ef000040 	svc	0x00000040
 3d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3ec:	e12fff1e 	bx	lr

000003f0 <exit>:
 3f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 400:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 404:	e3a00002 	mov	r0, #2
 408:	ef000040 	svc	0x00000040
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 418:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 41c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 420:	e12fff1e 	bx	lr

00000424 <wait>:
 424:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 428:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 42c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 430:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 434:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 438:	e3a00003 	mov	r0, #3
 43c:	ef000040 	svc	0x00000040
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 44c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 450:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 454:	e12fff1e 	bx	lr

00000458 <pipe>:
 458:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 45c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 460:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 464:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 468:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 46c:	e3a00004 	mov	r0, #4
 470:	ef000040 	svc	0x00000040
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 480:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 484:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 488:	e12fff1e 	bx	lr

0000048c <read>:
 48c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 490:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 494:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 498:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 49c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a0:	e3a00005 	mov	r0, #5
 4a4:	ef000040 	svc	0x00000040
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4bc:	e12fff1e 	bx	lr

000004c0 <write>:
 4c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d4:	e3a00010 	mov	r0, #16
 4d8:	ef000040 	svc	0x00000040
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f0:	e12fff1e 	bx	lr

000004f4 <close>:
 4f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 500:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 504:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 508:	e3a00015 	mov	r0, #21
 50c:	ef000040 	svc	0x00000040
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 51c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 520:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 524:	e12fff1e 	bx	lr

00000528 <kill>:
 528:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 52c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 530:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 534:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 538:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 53c:	e3a00006 	mov	r0, #6
 540:	ef000040 	svc	0x00000040
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 550:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 554:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 558:	e12fff1e 	bx	lr

0000055c <exec>:
 55c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 560:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 564:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 568:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 56c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 570:	e3a00007 	mov	r0, #7
 574:	ef000040 	svc	0x00000040
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 584:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 588:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 58c:	e12fff1e 	bx	lr

00000590 <open>:
 590:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 594:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 598:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 59c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a4:	e3a0000f 	mov	r0, #15
 5a8:	ef000040 	svc	0x00000040
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c0:	e12fff1e 	bx	lr

000005c4 <mknod>:
 5c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d8:	e3a00011 	mov	r0, #17
 5dc:	ef000040 	svc	0x00000040
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f4:	e12fff1e 	bx	lr

000005f8 <unlink>:
 5f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 600:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 604:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 608:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 60c:	e3a00012 	mov	r0, #18
 610:	ef000040 	svc	0x00000040
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 620:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 624:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 628:	e12fff1e 	bx	lr

0000062c <fstat>:
 62c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 630:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 634:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 638:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 63c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 640:	e3a00008 	mov	r0, #8
 644:	ef000040 	svc	0x00000040
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 654:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 658:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 65c:	e12fff1e 	bx	lr

00000660 <link>:
 660:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 664:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 668:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 66c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 670:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 674:	e3a00013 	mov	r0, #19
 678:	ef000040 	svc	0x00000040
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 688:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 68c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 690:	e12fff1e 	bx	lr

00000694 <mkdir>:
 694:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 698:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 69c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a8:	e3a00014 	mov	r0, #20
 6ac:	ef000040 	svc	0x00000040
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c4:	e12fff1e 	bx	lr

000006c8 <chdir>:
 6c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6dc:	e3a00009 	mov	r0, #9
 6e0:	ef000040 	svc	0x00000040
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f8:	e12fff1e 	bx	lr

000006fc <dup>:
 6fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 700:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 704:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 708:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 70c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 710:	e3a0000a 	mov	r0, #10
 714:	ef000040 	svc	0x00000040
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 724:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 728:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 72c:	e12fff1e 	bx	lr

00000730 <getpid>:
 730:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 734:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 738:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 73c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 740:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 744:	e3a0000b 	mov	r0, #11
 748:	ef000040 	svc	0x00000040
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 754:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 758:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 75c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 760:	e12fff1e 	bx	lr

00000764 <sbrk>:
 764:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 768:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 76c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 770:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 774:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 778:	e3a0000c 	mov	r0, #12
 77c:	ef000040 	svc	0x00000040
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 788:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 78c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 790:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 794:	e12fff1e 	bx	lr

00000798 <sleep>:
 798:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 79c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ac:	e3a0000d 	mov	r0, #13
 7b0:	ef000040 	svc	0x00000040
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c8:	e12fff1e 	bx	lr

000007cc <uptime>:
 7cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7e0:	e3a0000e 	mov	r0, #14
 7e4:	ef000040 	svc	0x00000040
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7fc:	e12fff1e 	bx	lr
