
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
   0:	e3003c4c 	movw	r3, #3148	; 0xc4c
   4:	e3403000 	movt	r3, #0
{
   8:	e92d4830 	push	{r4, r5, fp, lr}
   c:	e28db00c 	add	fp, sp, #12
  10:	e24dde21 	sub	sp, sp, #528	; 0x210
  char path[] = "stressfs0";
  14:	e8930007 	ldm	r3, {r0, r1, r2}
  18:	e24b3f86 	sub	r3, fp, #536	; 0x218
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  1c:	e3a04000 	mov	r4, #0
  char path[] = "stressfs0";
  20:	e8a30003 	stmia	r3!, {r0, r1}
  printf(1, "stressfs starting\n");
  24:	e3a00001 	mov	r0, #1
  28:	e3001c24 	movw	r1, #3108	; 0xc24
  2c:	e3401000 	movt	r1, #0
  char path[] = "stressfs0";
  30:	e1c320b0 	strh	r2, [r3]
  printf(1, "stressfs starting\n");
  34:	eb000235 	bl	910 <printf>
  memset(data, 'a', sizeof(data));
  38:	e24b0f83 	sub	r0, fp, #524	; 0x20c
  3c:	e3a02c02 	mov	r2, #512	; 0x200
  40:	e3a01061 	mov	r1, #97	; 0x61
  44:	eb00005d 	bl	1c0 <memset>
    if(fork() > 0)
  48:	eb0000ca 	bl	378 <fork>
  4c:	e3500000 	cmp	r0, #0
  50:	ca00002b 	bgt	104 <main+0x104>
  for(i = 0; i < 4; i++)
  54:	e2844001 	add	r4, r4, #1
  58:	e3540004 	cmp	r4, #4
  5c:	1afffff9 	bne	48 <main+0x48>
  60:	e1a05004 	mov	r5, r4
      break;

  printf(1, "write %d\n", i);
  64:	e1a02004 	mov	r2, r4
  68:	e3a00001 	mov	r0, #1
  6c:	e3001c38 	movw	r1, #3128	; 0xc38
  70:	e3401000 	movt	r1, #0
  74:	eb000225 	bl	910 <printf>

  path[8] += i;
  78:	e55b3210 	ldrb	r3, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  7c:	e3001202 	movw	r1, #514	; 0x202
  80:	e24b0f86 	sub	r0, fp, #536	; 0x218
  path[8] += i;
  84:	e0855003 	add	r5, r5, r3
  88:	e54b5210 	strb	r5, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  8c:	eb00013b 	bl	580 <open>
  90:	e3a04014 	mov	r4, #20
  94:	e1a05000 	mov	r5, r0
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  98:	e3a02c02 	mov	r2, #512	; 0x200
  9c:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  a0:	e1a00005 	mov	r0, r5
  a4:	eb000101 	bl	4b0 <write>
  for(i = 0; i < 20; i++)
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffff9 	bne	98 <main+0x98>
  close(fd);
  b0:	e1a00005 	mov	r0, r5

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  b4:	e3a05014 	mov	r5, #20
  close(fd);
  b8:	eb000109 	bl	4e4 <close>
  printf(1, "read\n");
  bc:	e3a00001 	mov	r0, #1
  c0:	e3001c44 	movw	r1, #3140	; 0xc44
  c4:	e3401000 	movt	r1, #0
  c8:	eb000210 	bl	910 <printf>
  fd = open(path, O_RDONLY);
  cc:	e1a01004 	mov	r1, r4
  d0:	e24b0f86 	sub	r0, fp, #536	; 0x218
  d4:	eb000129 	bl	580 <open>
  d8:	e1a04000 	mov	r4, r0
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  dc:	e3a02c02 	mov	r2, #512	; 0x200
  e0:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  e4:	e1a00004 	mov	r0, r4
  e8:	eb0000e3 	bl	47c <read>
  for (i = 0; i < 20; i++)
  ec:	e2555001 	subs	r5, r5, #1
  f0:	1afffff9 	bne	dc <main+0xdc>
  close(fd);
  f4:	e1a00004 	mov	r0, r4
  f8:	eb0000f9 	bl	4e4 <close>

  wait();
  fc:	eb0000b7 	bl	3e0 <wait>
  
  exit();
 100:	eb0000a9 	bl	3ac <exit>
 104:	e6ef5074 	uxtb	r5, r4
 108:	eaffffd5 	b	64 <main+0x64>

0000010c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e2402001 	sub	r2, r0, #1
 114:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 118:	e4d13001 	ldrb	r3, [r1], #1
 11c:	e3530000 	cmp	r3, #0
 120:	e5e23001 	strb	r3, [r2, #1]!
 124:	1afffffb 	bne	118 <strcpy+0xc>
    ;
  return os;
}
 128:	e28bd000 	add	sp, fp, #0
 12c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 130:	e12fff1e 	bx	lr

00000134 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 13c:	e5d03000 	ldrb	r3, [r0]
 140:	e5d12000 	ldrb	r2, [r1]
 144:	e3530000 	cmp	r3, #0
 148:	1a000004 	bne	160 <strcmp+0x2c>
 14c:	ea000005 	b	168 <strcmp+0x34>
 150:	e5f03001 	ldrb	r3, [r0, #1]!
 154:	e5f12001 	ldrb	r2, [r1, #1]!
 158:	e3530000 	cmp	r3, #0
 15c:	0a000001 	beq	168 <strcmp+0x34>
 160:	e1530002 	cmp	r3, r2
 164:	0afffff9 	beq	150 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 168:	e0430002 	sub	r0, r3, r2
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strlen>:

uint
strlen(char *s)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 180:	e5d03000 	ldrb	r3, [r0]
 184:	e3530000 	cmp	r3, #0
 188:	0a000008 	beq	1b0 <strlen+0x38>
 18c:	e2601001 	rsb	r1, r0, #1
 190:	e1a03000 	mov	r3, r0
    ;
 194:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 198:	e5f32001 	ldrb	r2, [r3, #1]!
 19c:	e3520000 	cmp	r2, #0
 1a0:	1afffffb 	bne	194 <strlen+0x1c>
  return n;
}
 1a4:	e28bd000 	add	sp, fp, #0
 1a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1ac:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 1b0:	e1a00003 	mov	r0, r3
}
 1b4:	e28bd000 	add	sp, fp, #0
 1b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1bc:	e12fff1e 	bx	lr

000001c0 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1c0:	e3520000 	cmp	r2, #0
{
 1c4:	e1a03000 	mov	r3, r0
 1c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1cc:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1d0:	0a000004 	beq	1e8 <memset+0x28>
 1d4:	e6ef1071 	uxtb	r1, r1
 1d8:	e0800002 	add	r0, r0, r2
 1dc:	e4c31001 	strb	r1, [r3], #1
 1e0:	e1500003 	cmp	r0, r3
 1e4:	1afffffc 	bne	1dc <memset+0x1c>
  return (void *)p;
}
 1e8:	e28bd000 	add	sp, fp, #0
 1ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1f0:	e12fff1e 	bx	lr

000001f4 <strchr>:

char*
strchr(const char *s, char c)
{
 1f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1fc:	e5d02000 	ldrb	r2, [r0]
 200:	e3520000 	cmp	r2, #0
 204:	0a00000b 	beq	238 <strchr+0x44>
    if(*s == c)
 208:	e1520001 	cmp	r2, r1
 20c:	1a000002 	bne	21c <strchr+0x28>
 210:	ea000005 	b	22c <strchr+0x38>
 214:	e1530001 	cmp	r3, r1
 218:	0a000003 	beq	22c <strchr+0x38>
  for(; *s; s++)
 21c:	e5f03001 	ldrb	r3, [r0, #1]!
 220:	e3530000 	cmp	r3, #0
 224:	1afffffa 	bne	214 <strchr+0x20>
      return (char*)s;
  return 0;
 228:	e1a00003 	mov	r0, r3
}
 22c:	e28bd000 	add	sp, fp, #0
 230:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 234:	e12fff1e 	bx	lr
  return 0;
 238:	e1a00002 	mov	r0, r2
 23c:	eafffffa 	b	22c <strchr+0x38>

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 244:	e1a03000 	mov	r3, r0
 248:	e28db014 	add	fp, sp, #20
 24c:	e1a07000 	mov	r7, r0
 250:	e24dd008 	sub	sp, sp, #8
 254:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 258:	e3a04000 	mov	r4, #0
 25c:	ea000008 	b	284 <gets+0x44>
    cc = read(0, &c, 1);
 260:	eb000085 	bl	47c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 264:	e1a03005 	mov	r3, r5
    if(cc < 1)
 268:	e3500000 	cmp	r0, #0
 26c:	da00000b 	ble	2a0 <gets+0x60>
    buf[i++] = c;
 270:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 274:	e352000d 	cmp	r2, #13
 278:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 27c:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 280:	0a00000b 	beq	2b4 <gets+0x74>
    cc = read(0, &c, 1);
 284:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 288:	e0844002 	add	r4, r4, r2
 28c:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 290:	e24b1015 	sub	r1, fp, #21
 294:	e3a00000 	mov	r0, #0
 298:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 29c:	baffffef 	blt	260 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2a0:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 2a4:	e3a03000 	mov	r3, #0
 2a8:	e5c53000 	strb	r3, [r5]
}
 2ac:	e24bd014 	sub	sp, fp, #20
 2b0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 2b4:	e0875004 	add	r5, r7, r4
 2b8:	eafffff8 	b	2a0 <gets+0x60>

000002bc <stat>:

int
stat(char *n, struct stat *st)
{
 2bc:	e92d4830 	push	{r4, r5, fp, lr}
 2c0:	e1a04001 	mov	r4, r1
 2c4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c8:	e3a01000 	mov	r1, #0
 2cc:	eb0000ab 	bl	580 <open>
  if(fd < 0)
 2d0:	e2505000 	subs	r5, r0, #0
 2d4:	ba000006 	blt	2f4 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2d8:	e1a01004 	mov	r1, r4
 2dc:	eb0000ce 	bl	61c <fstat>
 2e0:	e1a04000 	mov	r4, r0
  close(fd);
 2e4:	e1a00005 	mov	r0, r5
 2e8:	eb00007d 	bl	4e4 <close>
  return r;
}
 2ec:	e1a00004 	mov	r0, r4
 2f0:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2f4:	e3e04000 	mvn	r4, #0
 2f8:	eafffffb 	b	2ec <stat+0x30>

000002fc <atoi>:

int
atoi(const char *s)
{
 2fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 300:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 304:	e5d02000 	ldrb	r2, [r0]
 308:	e2423030 	sub	r3, r2, #48	; 0x30
 30c:	e3530009 	cmp	r3, #9
  n = 0;
 310:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 314:	8a000006 	bhi	334 <atoi+0x38>
    n = n*10 + *s++ - '0';
 318:	e3a0c00a 	mov	ip, #10
 31c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 320:	e5f02001 	ldrb	r2, [r0, #1]!
 324:	e2421030 	sub	r1, r2, #48	; 0x30
 328:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 32c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 330:	9afffff9 	bls	31c <atoi+0x20>
  return n;
}
 334:	e1a00003 	mov	r0, r3
 338:	e28bd000 	add	sp, fp, #0
 33c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 344:	e3520000 	cmp	r2, #0
{
 348:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 34c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 350:	da000005 	ble	36c <memmove+0x28>
 354:	e0812002 	add	r2, r1, r2
 358:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 35c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 360:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 364:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 368:	1afffffb 	bne	35c <memmove+0x18>
  return vdst;
}
 36c:	e28bd000 	add	sp, fp, #0
 370:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <fork>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00001 	mov	r0, #1
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <exit>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00002 	mov	r0, #2
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <wait>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00003 	mov	r0, #3
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <lseek>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00016 	mov	r0, #22
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <pipe>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00004 	mov	r0, #4
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <read>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00005 	mov	r0, #5
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <write>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00010 	mov	r0, #16
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <close>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00015 	mov	r0, #21
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <kill>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00006 	mov	r0, #6
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <exec>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00007 	mov	r0, #7
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <open>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a0000f 	mov	r0, #15
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <mknod>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00011 	mov	r0, #17
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <unlink>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00012 	mov	r0, #18
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <fstat>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00008 	mov	r0, #8
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <link>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a00013 	mov	r0, #19
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <mkdir>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a00014 	mov	r0, #20
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <chdir>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a00009 	mov	r0, #9
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <dup>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000a 	mov	r0, #10
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <getpid>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000b 	mov	r0, #11
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <sbrk>:
 754:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 758:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 75c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 760:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 764:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 768:	e3a0000c 	mov	r0, #12
 76c:	ef000040 	svc	0x00000040
 770:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 77c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 780:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 784:	e12fff1e 	bx	lr

00000788 <sleep>:
 788:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 78c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 790:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 794:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 798:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 79c:	e3a0000d 	mov	r0, #13
 7a0:	ef000040 	svc	0x00000040
 7a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b8:	e12fff1e 	bx	lr

000007bc <uptime>:
 7bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d0:	e3a0000e 	mov	r0, #14
 7d4:	ef000040 	svc	0x00000040
 7d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ec:	e12fff1e 	bx	lr

000007f0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7f0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7f4:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7f8:	e0133fa1 	ands	r3, r3, r1, lsr #31
 7fc:	e24b4034 	sub	r4, fp, #52	; 0x34
 800:	e3009c58 	movw	r9, #3160	; 0xc58
    neg = 1;
    x = -xx;
 804:	1261e000 	rsbne	lr, r1, #0
 808:	e3409000 	movt	r9, #0
{
 80c:	e1a05000 	mov	r5, r0
    neg = 1;
 810:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 814:	01a0e001 	moveq	lr, r1
  neg = 0;
 818:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 81c:	e3a07000 	mov	r7, #0
  b = base;
 820:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 824:	e3a06001 	mov	r6, #1
{
 828:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 82c:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 830:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 834:	e3a0c000 	mov	ip, #0
 838:	ea000002 	b	848 <printint+0x58>
        if(r >= d) {
 83c:	e1520000 	cmp	r2, r0
            r = r - d;
 840:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 844:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 848:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 84c:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 850:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 854:	e2011001 	and	r1, r1, #1
 858:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 85c:	1afffff6 	bne	83c <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 860:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 864:	e35c0000 	cmp	ip, #0
 868:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 86c:	e2871001 	add	r1, r7, #1
 870:	e7d93003 	ldrb	r3, [r9, r3]
 874:	e4c83001 	strb	r3, [r8], #1
 878:	11a07001 	movne	r7, r1
 87c:	1affffea 	bne	82c <printint+0x3c>
  if(neg)
 880:	e35a0000 	cmp	sl, #0
 884:	0a000005 	beq	8a0 <printint+0xb0>
    buf[i++] = '-';
 888:	e24b3024 	sub	r3, fp, #36	; 0x24
 88c:	e3a0202d 	mov	r2, #45	; 0x2d
 890:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 894:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 898:	e1a03002 	mov	r3, r2
 89c:	e5402010 	strb	r2, [r0, #-16]
 8a0:	e0847007 	add	r7, r4, r7
 8a4:	ea000000 	b	8ac <printint+0xbc>
 8a8:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 8ac:	e3a02001 	mov	r2, #1
 8b0:	e24b1035 	sub	r1, fp, #53	; 0x35
 8b4:	e1a00005 	mov	r0, r5
 8b8:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 8bc:	ebfffefb 	bl	4b0 <write>

  while(--i >= 0)
 8c0:	e1570004 	cmp	r7, r4
 8c4:	1afffff7 	bne	8a8 <printint+0xb8>
    putc(fd, buf[i]);
}
 8c8:	e24bd020 	sub	sp, fp, #32
 8cc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000008d0 <div>:
{
 8d0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8d4:	e3a02000 	mov	r2, #0
{
 8d8:	e28db008 	add	fp, sp, #8
 8dc:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8e0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8e4:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8e8:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 8ec:	e1a0c33e 	lsr	ip, lr, r3
 8f0:	e20cc001 	and	ip, ip, #1
 8f4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8f8:	e1520001 	cmp	r2, r1
            r = r - d;
 8fc:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 900:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 904:	e2533001 	subs	r3, r3, #1
 908:	38bd8810 	popcc	{r4, fp, pc}
 90c:	eafffff6 	b	8ec <div+0x1c>

00000910 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 910:	e92d000e 	push	{r1, r2, r3}
 914:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 918:	e28db018 	add	fp, sp, #24
 91c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 920:	e59b6004 	ldr	r6, [fp, #4]
 924:	e5d64000 	ldrb	r4, [r6]
 928:	e3540000 	cmp	r4, #0
 92c:	0a00002b 	beq	9e0 <printf+0xd0>
 930:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 934:	e28b8008 	add	r8, fp, #8
  state = 0;
 938:	e3a05000 	mov	r5, #0
 93c:	ea00000a 	b	96c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 940:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 944:	01a05004 	moveq	r5, r4
      if(c == '%'){
 948:	0a000004 	beq	960 <printf+0x50>
  write(fd, &c, 1);
 94c:	e3a02001 	mov	r2, #1
 950:	e24b1019 	sub	r1, fp, #25
 954:	e1a00007 	mov	r0, r7
 958:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 95c:	ebfffed3 	bl	4b0 <write>
  for(i = 0; fmt[i]; i++){
 960:	e5f64001 	ldrb	r4, [r6, #1]!
 964:	e3540000 	cmp	r4, #0
 968:	0a00001c 	beq	9e0 <printf+0xd0>
    if(state == 0){
 96c:	e3550000 	cmp	r5, #0
 970:	0afffff2 	beq	940 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 974:	e3550025 	cmp	r5, #37	; 0x25
 978:	1afffff8 	bne	960 <printf+0x50>
      if(c == 'd'){
 97c:	e3540064 	cmp	r4, #100	; 0x64
 980:	0a000021 	beq	a0c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 984:	e20430f7 	and	r3, r4, #247	; 0xf7
 988:	e3530070 	cmp	r3, #112	; 0x70
 98c:	0a000017 	beq	9f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 990:	e3540073 	cmp	r4, #115	; 0x73
 994:	0a00002e 	beq	a54 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 998:	e3540063 	cmp	r4, #99	; 0x63
 99c:	0a000021 	beq	a28 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9a0:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 9a4:	e3a02001 	mov	r2, #1
 9a8:	e24b1019 	sub	r1, fp, #25
 9ac:	e1a00007 	mov	r0, r7
 9b0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 9b4:	0a000023 	beq	a48 <printf+0x138>
  write(fd, &c, 1);
 9b8:	ebfffebc 	bl	4b0 <write>
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e24b1019 	sub	r1, fp, #25
 9c4:	e1a00007 	mov	r0, r7
 9c8:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 9cc:	ebfffeb7 	bl	4b0 <write>
  for(i = 0; fmt[i]; i++){
 9d0:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9d4:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 9d8:	e3540000 	cmp	r4, #0
 9dc:	1affffe2 	bne	96c <printf+0x5c>
    }
  }
}
 9e0:	e24bd018 	sub	sp, fp, #24
 9e4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9e8:	e28dd00c 	add	sp, sp, #12
 9ec:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 9f0:	e3a03000 	mov	r3, #0
 9f4:	e3a02010 	mov	r2, #16
 9f8:	e4981004 	ldr	r1, [r8], #4
 9fc:	e1a00007 	mov	r0, r7
 a00:	ebffff7a 	bl	7f0 <printint>
      state = 0;
 a04:	e3a05000 	mov	r5, #0
 a08:	eaffffd4 	b	960 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a0c:	e3a03001 	mov	r3, #1
 a10:	e3a0200a 	mov	r2, #10
 a14:	e4981004 	ldr	r1, [r8], #4
 a18:	e1a00007 	mov	r0, r7
 a1c:	ebffff73 	bl	7f0 <printint>
      state = 0;
 a20:	e3a05000 	mov	r5, #0
 a24:	eaffffcd 	b	960 <printf+0x50>
        putc(fd, *ap);
 a28:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 a2c:	e3a02001 	mov	r2, #1
 a30:	e24b1019 	sub	r1, fp, #25
 a34:	e1a00007 	mov	r0, r7
      state = 0;
 a38:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 a3c:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 a40:	ebfffe9a 	bl	4b0 <write>
        ap++;
 a44:	eaffffc5 	b	960 <printf+0x50>
  write(fd, &c, 1);
 a48:	ebfffe98 	bl	4b0 <write>
      state = 0;
 a4c:	e3a05000 	mov	r5, #0
 a50:	eaffffc2 	b	960 <printf+0x50>
        s = (char*)*ap;
 a54:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a58:	e3540000 	cmp	r4, #0
 a5c:	0a00000b 	beq	a90 <printf+0x180>
        while(*s != 0){
 a60:	e5d45000 	ldrb	r5, [r4]
 a64:	e3550000 	cmp	r5, #0
 a68:	0affffbc 	beq	960 <printf+0x50>
  write(fd, &c, 1);
 a6c:	e3a02001 	mov	r2, #1
 a70:	e24b1019 	sub	r1, fp, #25
 a74:	e1a00007 	mov	r0, r7
 a78:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a7c:	ebfffe8b 	bl	4b0 <write>
        while(*s != 0){
 a80:	e5f45001 	ldrb	r5, [r4, #1]!
 a84:	e3550000 	cmp	r5, #0
 a88:	1afffff7 	bne	a6c <printf+0x15c>
 a8c:	eaffffb3 	b	960 <printf+0x50>
          s = "(null)";
 a90:	e3004c6c 	movw	r4, #3180	; 0xc6c
        while(*s != 0){
 a94:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 a98:	e3404000 	movt	r4, #0
 a9c:	eafffff2 	b	a6c <printf+0x15c>

00000aa0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aa0:	e300cc74 	movw	ip, #3188	; 0xc74
 aa4:	e340c000 	movt	ip, #0
{
 aa8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 aac:	e2401008 	sub	r1, r0, #8
{
 ab0:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab4:	e59c3000 	ldr	r3, [ip]
 ab8:	ea000004 	b	ad0 <free+0x30>
 abc:	e1510002 	cmp	r1, r2
 ac0:	3a000009 	bcc	aec <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac4:	e1530002 	cmp	r3, r2
 ac8:	2a000007 	bcs	aec <free+0x4c>
{
 acc:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad0:	e1530001 	cmp	r3, r1
 ad4:	e5932000 	ldr	r2, [r3]
 ad8:	3afffff7 	bcc	abc <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 adc:	e1530002 	cmp	r3, r2
 ae0:	3afffff9 	bcc	acc <free+0x2c>
 ae4:	e1510002 	cmp	r1, r2
 ae8:	2afffff7 	bcs	acc <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aec:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 af0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 af4:	e081418e 	add	r4, r1, lr, lsl #3
 af8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 afc:	05922004 	ldreq	r2, [r2, #4]
 b00:	0082e00e 	addeq	lr, r2, lr
 b04:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b08:	05932000 	ldreq	r2, [r3]
 b0c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b10:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b14:	e5932004 	ldr	r2, [r3, #4]
 b18:	e083e182 	add	lr, r3, r2, lsl #3
 b1c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b20:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b24:	05101004 	ldreq	r1, [r0, #-4]
 b28:	00812002 	addeq	r2, r1, r2
 b2c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b30:	05102008 	ldreq	r2, [r0, #-8]
 b34:	05832000 	streq	r2, [r3]
}
 b38:	e8bd8810 	pop	{r4, fp, pc}

00000b3c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b3c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b40:	e3007c74 	movw	r7, #3188	; 0xc74
 b44:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b48:	e2804007 	add	r4, r0, #7
{
 b4c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b50:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b54:	e1a041a4 	lsr	r4, r4, #3
 b58:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b5c:	e3510000 	cmp	r1, #0
 b60:	0a000029 	beq	c0c <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b64:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 b68:	e5932004 	ldr	r2, [r3, #4]
 b6c:	e1520004 	cmp	r2, r4
 b70:	2a000019 	bcs	bdc <malloc+0xa0>
 b74:	e3540a01 	cmp	r4, #4096	; 0x1000
 b78:	21a05004 	movcs	r5, r4
 b7c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b80:	e1a06185 	lsl	r6, r5, #3
 b84:	ea000005 	b	ba0 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b88:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b8c:	e5902004 	ldr	r2, [r0, #4]
 b90:	e1520004 	cmp	r2, r4
 b94:	2a000012 	bcs	be4 <malloc+0xa8>
 b98:	e5971000 	ldr	r1, [r7]
 b9c:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ba0:	e1510003 	cmp	r1, r3
 ba4:	1afffff7 	bne	b88 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 ba8:	e1a00006 	mov	r0, r6
 bac:	ebfffee8 	bl	754 <sbrk>
 bb0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 bb4:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 bb8:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 bbc:	0a000004 	beq	bd4 <malloc+0x98>
  hp->s.size = nu;
 bc0:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 bc4:	ebffffb5 	bl	aa0 <free>
  return freep;
 bc8:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 bcc:	e3530000 	cmp	r3, #0
 bd0:	1affffec 	bne	b88 <malloc+0x4c>
        return 0;
 bd4:	e3a00000 	mov	r0, #0
  }
}
 bd8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 bdc:	e1a00003 	mov	r0, r3
 be0:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 be4:	e1540002 	cmp	r4, r2
      freep = prevp;
 be8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bec:	10422004 	subne	r2, r2, r4
 bf0:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 bf4:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 bf8:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 bfc:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c00:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c04:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c08:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c0c:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 c10:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c14:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 c18:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 c1c:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 c20:	eaffffd3 	b	b74 <malloc+0x38>
