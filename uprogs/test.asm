
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
	if(fd > 0)
		close(fd);
	exit();
}

int main(int argc, char *argv[]) {
   0:	e92d4800 	push	{fp, lr}
   4:	e1a05000 	mov	r5, r0
   8:	e28db004 	add	fp, sp, #4
	


	if(mkdir("dev") != 0){
   c:	e3000c74 	movw	r0, #3188	; 0xc74
  10:	e3400000 	movt	r0, #0
int main(int argc, char *argv[]) {
  14:	e1a04001 	mov	r4, r1
	if(mkdir("dev") != 0){
  18:	eb0001ac 	bl	6d0 <mkdir>
  1c:	e3500000 	cmp	r0, #0
  20:	1a000022 	bne	b0 <main+0xb0>
		printf(1,"did not make dev\n");
	}
	if(chdir("dev") < 0){
  24:	e3000c74 	movw	r0, #3188	; 0xc74
  28:	e3400000 	movt	r0, #0
  2c:	eb0001b4 	bl	704 <chdir>
  30:	e3500000 	cmp	r0, #0
  34:	ba000032 	blt	104 <main+0x104>
		printf(1,"could not change dir into dev\n");
	}

	if(argc < 1) {
  38:	e3550000 	cmp	r5, #0
  3c:	da000020 	ble	c4 <main+0xc4>
		printf(1,"Usage: test filepath\n");
		clean();
	}
	
	if(mknod(argv[1],15,15) < 0) {
  40:	e3a0200f 	mov	r2, #15
  44:	e5940004 	ldr	r0, [r4, #4]
  48:	e1a01002 	mov	r1, r2
  4c:	eb00016b 	bl	600 <mknod>
  50:	e3500000 	cmp	r0, #0
  54:	ba000025 	blt	f0 <main+0xf0>
		printf(1,"mknod failure");
		clean();
	}
	

	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  58:	e3a01002 	mov	r1, #2
  5c:	e5940004 	ldr	r0, [r4, #4]
  60:	eb000159 	bl	5cc <open>
  64:	e3005d4c 	movw	r5, #3404	; 0xd4c
  68:	e3405000 	movt	r5, #0
  6c:	e3500000 	cmp	r0, #0
  70:	e5850000 	str	r0, [r5]
  74:	ba000017 	blt	d8 <main+0xd8>
		printf(1,"Could not open %s \n", argv[1]);
		clean();
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  78:	e1a03000 	mov	r3, r0
  7c:	e5942004 	ldr	r2, [r4, #4]
  80:	e3a00001 	mov	r0, #1
  84:	e3001ce8 	movw	r1, #3304	; 0xce8
  88:	e3401000 	movt	r1, #0
  8c:	eb000232 	bl	95c <printf>

	if(read(fd,&buf,512)< 0) {
  90:	e3001d50 	movw	r1, #3408	; 0xd50
  94:	e3a02c02 	mov	r2, #512	; 0x200
  98:	e3401000 	movt	r1, #0
  9c:	e5950000 	ldr	r0, [r5]
  a0:	eb000108 	bl	4c8 <read>
  a4:	e3500000 	cmp	r0, #0
  a8:	ba00001a 	blt	118 <main+0x118>
		printf(1, "Did not read all bytes\n");
		sleep(10);
		printf(1,"bytes read: %d\n",read(fd,&buf,512));
	} 
	clean();
  ac:	eb00002a 	bl	15c <clean>
		printf(1,"did not make dev\n");
  b0:	e3001c78 	movw	r1, #3192	; 0xc78
  b4:	e3a00001 	mov	r0, #1
  b8:	e3401000 	movt	r1, #0
  bc:	eb000226 	bl	95c <printf>
  c0:	eaffffd7 	b	24 <main+0x24>
		printf(1,"Usage: test filepath\n");
  c4:	e3001cac 	movw	r1, #3244	; 0xcac
  c8:	e3a00001 	mov	r0, #1
  cc:	e3401000 	movt	r1, #0
  d0:	eb000221 	bl	95c <printf>
		clean();
  d4:	eb000020 	bl	15c <clean>
		printf(1,"Could not open %s \n", argv[1]);
  d8:	e5942004 	ldr	r2, [r4, #4]
  dc:	e3001cd4 	movw	r1, #3284	; 0xcd4
  e0:	e3a00001 	mov	r0, #1
  e4:	e3401000 	movt	r1, #0
  e8:	eb00021b 	bl	95c <printf>
		clean();
  ec:	eb00001a 	bl	15c <clean>
		printf(1,"mknod failure");
  f0:	e3001cc4 	movw	r1, #3268	; 0xcc4
  f4:	e3a00001 	mov	r0, #1
  f8:	e3401000 	movt	r1, #0
  fc:	eb000216 	bl	95c <printf>
		clean();
 100:	eb000015 	bl	15c <clean>
		printf(1,"could not change dir into dev\n");
 104:	e3001c8c 	movw	r1, #3212	; 0xc8c
 108:	e3a00001 	mov	r0, #1
 10c:	e3401000 	movt	r1, #0
 110:	eb000211 	bl	95c <printf>
 114:	eaffffc7 	b	38 <main+0x38>
		printf(1, "Did not read all bytes\n");
 118:	e3a00001 	mov	r0, #1
 11c:	e3001cfc 	movw	r1, #3324	; 0xcfc
 120:	e3401000 	movt	r1, #0
 124:	eb00020c 	bl	95c <printf>
		sleep(10);
 128:	e3a0000a 	mov	r0, #10
 12c:	eb0001a8 	bl	7d4 <sleep>
		printf(1,"bytes read: %d\n",read(fd,&buf,512));
 130:	e5950000 	ldr	r0, [r5]
 134:	e3a02c02 	mov	r2, #512	; 0x200
 138:	e3001d50 	movw	r1, #3408	; 0xd50
 13c:	e3401000 	movt	r1, #0
 140:	eb0000e0 	bl	4c8 <read>
 144:	e3001d14 	movw	r1, #3348	; 0xd14
 148:	e3401000 	movt	r1, #0
 14c:	e1a02000 	mov	r2, r0
 150:	e3a00001 	mov	r0, #1
 154:	eb000200 	bl	95c <printf>
 158:	eaffffd3 	b	ac <main+0xac>

0000015c <clean>:
void clean(void){
 15c:	e92d4800 	push	{fp, lr}
	free(buf);
 160:	e3000d50 	movw	r0, #3408	; 0xd50
void clean(void){
 164:	e28db004 	add	fp, sp, #4
	free(buf);
 168:	e3400000 	movt	r0, #0
 16c:	eb000262 	bl	afc <free>
	if(fd > 0)
 170:	e3003d4c 	movw	r3, #3404	; 0xd4c
 174:	e3403000 	movt	r3, #0
 178:	e5930000 	ldr	r0, [r3]
 17c:	e3500000 	cmp	r0, #0
 180:	da000000 	ble	188 <clean+0x2c>
		close(fd);
 184:	eb0000e9 	bl	530 <close>
	exit();
 188:	eb0000a7 	bl	42c <exit>

0000018c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 18c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 190:	e2402001 	sub	r2, r0, #1
 194:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 198:	e4d13001 	ldrb	r3, [r1], #1
 19c:	e3530000 	cmp	r3, #0
 1a0:	e5e23001 	strb	r3, [r2, #1]!
 1a4:	1afffffb 	bne	198 <strcpy+0xc>
    ;
  return os;
}
 1a8:	e28bd000 	add	sp, fp, #0
 1ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b0:	e12fff1e 	bx	lr

000001b4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 1bc:	e5d03000 	ldrb	r3, [r0]
 1c0:	e5d12000 	ldrb	r2, [r1]
 1c4:	e3530000 	cmp	r3, #0
 1c8:	1a000004 	bne	1e0 <strcmp+0x2c>
 1cc:	ea000005 	b	1e8 <strcmp+0x34>
 1d0:	e5f03001 	ldrb	r3, [r0, #1]!
 1d4:	e3530000 	cmp	r3, #0
 1d8:	0a000006 	beq	1f8 <strcmp+0x44>
 1dc:	e5f12001 	ldrb	r2, [r1, #1]!
 1e0:	e1530002 	cmp	r3, r2
 1e4:	0afffff9 	beq	1d0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1e8:	e0430002 	sub	r0, r3, r2
 1ec:	e28bd000 	add	sp, fp, #0
 1f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1f4:	e12fff1e 	bx	lr
 1f8:	e5d12001 	ldrb	r2, [r1, #1]
 1fc:	e0430002 	sub	r0, r3, r2
 200:	e28bd000 	add	sp, fp, #0
 204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 208:	e12fff1e 	bx	lr

0000020c <strlen>:

uint
strlen(char *s)
{
 20c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 210:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 214:	e5d03000 	ldrb	r3, [r0]
 218:	e3530000 	cmp	r3, #0
 21c:	0a000009 	beq	248 <strlen+0x3c>
 220:	e1a02000 	mov	r2, r0
 224:	e3a03000 	mov	r3, #0
 228:	e5f21001 	ldrb	r1, [r2, #1]!
 22c:	e2833001 	add	r3, r3, #1
 230:	e3510000 	cmp	r1, #0
 234:	e1a00003 	mov	r0, r3
 238:	1afffffa 	bne	228 <strlen+0x1c>
    ;
  return n;
}
 23c:	e28bd000 	add	sp, fp, #0
 240:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 244:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 248:	e1a00003 	mov	r0, r3
 24c:	eafffffa 	b	23c <strlen+0x30>

00000250 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 250:	e3520000 	cmp	r2, #0
{
 254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 258:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 25c:	0a000004 	beq	274 <memset+0x24>
 260:	e6ef1071 	uxtb	r1, r1
 264:	e0802002 	add	r2, r0, r2
 268:	e4c01001 	strb	r1, [r0], #1
 26c:	e1520000 	cmp	r2, r0
 270:	1afffffc 	bne	268 <memset+0x18>
  return (void *)p;
}
 274:	e28bd000 	add	sp, fp, #0
 278:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 27c:	e12fff1e 	bx	lr

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 288:	e5d02000 	ldrb	r2, [r0]
 28c:	e3520000 	cmp	r2, #0
 290:	0a00000b 	beq	2c4 <strchr+0x44>
    if(*s == c)
 294:	e1510002 	cmp	r1, r2
 298:	1a000002 	bne	2a8 <strchr+0x28>
 29c:	ea000005 	b	2b8 <strchr+0x38>
 2a0:	e1530001 	cmp	r3, r1
 2a4:	0a000003 	beq	2b8 <strchr+0x38>
  for(; *s; s++)
 2a8:	e5f03001 	ldrb	r3, [r0, #1]!
 2ac:	e3530000 	cmp	r3, #0
 2b0:	1afffffa 	bne	2a0 <strchr+0x20>
      return (char*)s;
  return 0;
 2b4:	e1a00003 	mov	r0, r3
}
 2b8:	e28bd000 	add	sp, fp, #0
 2bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c0:	e12fff1e 	bx	lr
  return 0;
 2c4:	e1a00002 	mov	r0, r2
 2c8:	eafffffa 	b	2b8 <strchr+0x38>

000002cc <gets>:

char*
gets(char *buf, int max)
{
 2cc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2d0:	e1a08000 	mov	r8, r0
 2d4:	e28db018 	add	fp, sp, #24
 2d8:	e1a07001 	mov	r7, r1
 2dc:	e24dd00c 	sub	sp, sp, #12
 2e0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e4:	e3a05000 	mov	r5, #0
 2e8:	ea000008 	b	310 <gets+0x44>
    cc = read(0, &c, 1);
 2ec:	eb000075 	bl	4c8 <read>
    if(cc < 1)
 2f0:	e3500000 	cmp	r0, #0
 2f4:	da00000b 	ble	328 <gets+0x5c>
      break;
    buf[i++] = c;
 2f8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2fc:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 300:	e353000d 	cmp	r3, #13
 304:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 308:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 30c:	0a000005 	beq	328 <gets+0x5c>
    cc = read(0, &c, 1);
 310:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 314:	e0854002 	add	r4, r5, r2
 318:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 31c:	e24b101d 	sub	r1, fp, #29
 320:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 324:	bafffff0 	blt	2ec <gets+0x20>
      break;
  }
  buf[i] = '\0';
 328:	e3a03000 	mov	r3, #0
  return buf;
}
 32c:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 330:	e7c83005 	strb	r3, [r8, r5]
}
 334:	e24bd018 	sub	sp, fp, #24
 338:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000033c <stat>:

int
stat(char *n, struct stat *st)
{
 33c:	e92d4830 	push	{r4, r5, fp, lr}
 340:	e1a04001 	mov	r4, r1
 344:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 348:	e3a01000 	mov	r1, #0
 34c:	eb00009e 	bl	5cc <open>
  if(fd < 0)
 350:	e2505000 	subs	r5, r0, #0
 354:	ba000006 	blt	374 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 358:	e1a01004 	mov	r1, r4
 35c:	eb0000c1 	bl	668 <fstat>
 360:	e1a04000 	mov	r4, r0
  close(fd);
 364:	e1a00005 	mov	r0, r5
 368:	eb000070 	bl	530 <close>
  return r;
}
 36c:	e1a00004 	mov	r0, r4
 370:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 374:	e3e04000 	mvn	r4, #0
 378:	eafffffb 	b	36c <stat+0x30>

0000037c <atoi>:

int
atoi(const char *s)
{
 37c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 380:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 384:	e5d02000 	ldrb	r2, [r0]
 388:	e2423030 	sub	r3, r2, #48	; 0x30
 38c:	e3530009 	cmp	r3, #9
 390:	e3a03000 	mov	r3, #0
 394:	8a000006 	bhi	3b4 <atoi+0x38>
    n = n*10 + *s++ - '0';
 398:	e3a0c00a 	mov	ip, #10
 39c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 3a0:	e5f02001 	ldrb	r2, [r0, #1]!
 3a4:	e2421030 	sub	r1, r2, #48	; 0x30
 3a8:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 3ac:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 3b0:	9afffff9 	bls	39c <atoi+0x20>
  return n;
}
 3b4:	e1a00003 	mov	r0, r3
 3b8:	e28bd000 	add	sp, fp, #0
 3bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3c0:	e12fff1e 	bx	lr

000003c4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c4:	e3520000 	cmp	r2, #0
{
 3c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3cc:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 3d0:	da000005 	ble	3ec <memmove+0x28>
 3d4:	e0812002 	add	r2, r1, r2
 3d8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3dc:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 3e0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3e4:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3e8:	1afffffb 	bne	3dc <memmove+0x18>
  return vdst;
}
 3ec:	e28bd000 	add	sp, fp, #0
 3f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3f4:	e12fff1e 	bx	lr

000003f8 <fork>:
 3f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 400:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 404:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 408:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 40c:	e3a00001 	mov	r0, #1
 410:	ef000040 	svc	0x00000040
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 420:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 424:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 428:	e12fff1e 	bx	lr

0000042c <exit>:
 42c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 430:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 434:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 438:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 43c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 440:	e3a00002 	mov	r0, #2
 444:	ef000040 	svc	0x00000040
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 454:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 458:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 45c:	e12fff1e 	bx	lr

00000460 <wait>:
 460:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 464:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 468:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 46c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 470:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 474:	e3a00003 	mov	r0, #3
 478:	ef000040 	svc	0x00000040
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 488:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 48c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 490:	e12fff1e 	bx	lr

00000494 <pipe>:
 494:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 498:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 49c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a8:	e3a00004 	mov	r0, #4
 4ac:	ef000040 	svc	0x00000040
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c4:	e12fff1e 	bx	lr

000004c8 <read>:
 4c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4dc:	e3a00005 	mov	r0, #5
 4e0:	ef000040 	svc	0x00000040
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <write>:
 4fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 500:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 504:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 508:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 50c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 510:	e3a00010 	mov	r0, #16
 514:	ef000040 	svc	0x00000040
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 524:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 52c:	e12fff1e 	bx	lr

00000530 <close>:
 530:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 534:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 538:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 53c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 540:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 544:	e3a00015 	mov	r0, #21
 548:	ef000040 	svc	0x00000040
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 558:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 55c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 560:	e12fff1e 	bx	lr

00000564 <kill>:
 564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 568:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 56c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 570:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 574:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 578:	e3a00006 	mov	r0, #6
 57c:	ef000040 	svc	0x00000040
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 58c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 590:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 594:	e12fff1e 	bx	lr

00000598 <exec>:
 598:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 59c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ac:	e3a00007 	mov	r0, #7
 5b0:	ef000040 	svc	0x00000040
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c8:	e12fff1e 	bx	lr

000005cc <open>:
 5cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e0:	e3a0000f 	mov	r0, #15
 5e4:	ef000040 	svc	0x00000040
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5fc:	e12fff1e 	bx	lr

00000600 <mknod>:
 600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 604:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 608:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 60c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 610:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 614:	e3a00011 	mov	r0, #17
 618:	ef000040 	svc	0x00000040
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 628:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 62c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 630:	e12fff1e 	bx	lr

00000634 <unlink>:
 634:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 638:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 63c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 640:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 644:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 648:	e3a00012 	mov	r0, #18
 64c:	ef000040 	svc	0x00000040
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 65c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 660:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 664:	e12fff1e 	bx	lr

00000668 <fstat>:
 668:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 66c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 670:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 678:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 67c:	e3a00008 	mov	r0, #8
 680:	ef000040 	svc	0x00000040
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 690:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 694:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 698:	e12fff1e 	bx	lr

0000069c <link>:
 69c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b0:	e3a00013 	mov	r0, #19
 6b4:	ef000040 	svc	0x00000040
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6cc:	e12fff1e 	bx	lr

000006d0 <mkdir>:
 6d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e4:	e3a00014 	mov	r0, #20
 6e8:	ef000040 	svc	0x00000040
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 700:	e12fff1e 	bx	lr

00000704 <chdir>:
 704:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 708:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 70c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 710:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 714:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 718:	e3a00009 	mov	r0, #9
 71c:	ef000040 	svc	0x00000040
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 72c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 730:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 734:	e12fff1e 	bx	lr

00000738 <dup>:
 738:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 73c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 740:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 744:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 748:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 74c:	e3a0000a 	mov	r0, #10
 750:	ef000040 	svc	0x00000040
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 760:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 764:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 768:	e12fff1e 	bx	lr

0000076c <getpid>:
 76c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 770:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 774:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 778:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 77c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 780:	e3a0000b 	mov	r0, #11
 784:	ef000040 	svc	0x00000040
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 794:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 798:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 79c:	e12fff1e 	bx	lr

000007a0 <sbrk>:
 7a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b4:	e3a0000c 	mov	r0, #12
 7b8:	ef000040 	svc	0x00000040
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d0:	e12fff1e 	bx	lr

000007d4 <sleep>:
 7d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7e8:	e3a0000d 	mov	r0, #13
 7ec:	ef000040 	svc	0x00000040
 7f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 800:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 804:	e12fff1e 	bx	lr

00000808 <uptime>:
 808:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 80c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 810:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 814:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 818:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 81c:	e3a0000e 	mov	r0, #14
 820:	ef000040 	svc	0x00000040
 824:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 830:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 834:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 838:	e12fff1e 	bx	lr

0000083c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 83c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 840:	e1a09fa1 	lsr	r9, r1, #31
 844:	e3530000 	cmp	r3, #0
 848:	03a09000 	moveq	r9, #0
 84c:	12099001 	andne	r9, r9, #1
{
 850:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 854:	e3590000 	cmp	r9, #0
 858:	e3008d24 	movw	r8, #3364	; 0xd24
    neg = 1;
    x = -xx;
 85c:	1261e000 	rsbne	lr, r1, #0
 860:	e3408000 	movt	r8, #0
 864:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 868:	e1a04000 	mov	r4, r0
    neg = 1;
 86c:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 870:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 874:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 878:	e3a05001 	mov	r5, #1
{
 87c:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 880:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 884:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 888:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 88c:	e1a0033e 	lsr	r0, lr, r3
 890:	e2000001 	and	r0, r0, #1
 894:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 898:	e1520001 	cmp	r2, r1
            r = r - d;
 89c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 8a0:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 8a4:	e2533001 	subs	r3, r3, #1
 8a8:	2afffff7 	bcs	88c <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8ac:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 8b0:	e35c0000 	cmp	ip, #0
 8b4:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 8b8:	e2873001 	add	r3, r7, #1
 8bc:	e7d81001 	ldrb	r1, [r8, r1]
 8c0:	e5e61001 	strb	r1, [r6, #1]!
 8c4:	11a07003 	movne	r7, r3
 8c8:	1affffec 	bne	880 <printint+0x44>
  if(neg)
 8cc:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 8d0:	124b201c 	subne	r2, fp, #28
 8d4:	10822003 	addne	r2, r2, r3
 8d8:	13a0102d 	movne	r1, #45	; 0x2d
 8dc:	12873002 	addne	r3, r7, #2
 8e0:	15421010 	strbne	r1, [r2, #-16]
 8e4:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 8e8:	e2435001 	sub	r5, r3, #1
 8ec:	e0826003 	add	r6, r2, r3
 8f0:	e5763001 	ldrb	r3, [r6, #-1]!
 8f4:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 8f8:	e3a02001 	mov	r2, #1
 8fc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 900:	e1a00004 	mov	r0, r4
 904:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 908:	ebfffefb 	bl	4fc <write>
  while(--i >= 0)
 90c:	e3750001 	cmn	r5, #1
 910:	1afffff6 	bne	8f0 <printint+0xb4>
    putc(fd, buf[i]);
}
 914:	e24bd01c 	sub	sp, fp, #28
 918:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000091c <div>:
{
 91c:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 920:	e3a02000 	mov	r2, #0
{
 924:	e28db008 	add	fp, sp, #8
 928:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 92c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 930:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 934:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 938:	e1a0c33e 	lsr	ip, lr, r3
 93c:	e20cc001 	and	ip, ip, #1
 940:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 944:	e1520001 	cmp	r2, r1
            r = r - d;
 948:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 94c:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 950:	e2533001 	subs	r3, r3, #1
 954:	2afffff7 	bcs	938 <div+0x1c>
}
 958:	e8bd8810 	pop	{r4, fp, pc}

0000095c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 95c:	e92d000e 	push	{r1, r2, r3}
 960:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 964:	e28db018 	add	fp, sp, #24
 968:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96c:	e59b6004 	ldr	r6, [fp, #4]
 970:	e5d64000 	ldrb	r4, [r6]
 974:	e3540000 	cmp	r4, #0
 978:	0a00002b 	beq	a2c <printf+0xd0>
 97c:	e1a07000 	mov	r7, r0
 980:	e28b8008 	add	r8, fp, #8
 984:	e3a05000 	mov	r5, #0
 988:	ea00000a 	b	9b8 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 98c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 990:	01a05004 	moveq	r5, r4
      if(c == '%'){
 994:	0a000004 	beq	9ac <printf+0x50>
 998:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 99c:	e3a02001 	mov	r2, #1
 9a0:	e1a00007 	mov	r0, r7
 9a4:	e5614006 	strb	r4, [r1, #-6]!
 9a8:	ebfffed3 	bl	4fc <write>
  for(i = 0; fmt[i]; i++){
 9ac:	e5f64001 	ldrb	r4, [r6, #1]!
 9b0:	e3540000 	cmp	r4, #0
 9b4:	0a00001c 	beq	a2c <printf+0xd0>
    if(state == 0){
 9b8:	e3550000 	cmp	r5, #0
 9bc:	0afffff2 	beq	98c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9c0:	e3550025 	cmp	r5, #37	; 0x25
 9c4:	1afffff8 	bne	9ac <printf+0x50>
      if(c == 'd'){
 9c8:	e3540064 	cmp	r4, #100	; 0x64
 9cc:	0a000037 	beq	ab0 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d0:	e20430f7 	and	r3, r4, #247	; 0xf7
 9d4:	e3530070 	cmp	r3, #112	; 0x70
 9d8:	0a000017 	beq	a3c <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9dc:	e3540073 	cmp	r4, #115	; 0x73
 9e0:	0a00001c 	beq	a58 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9e4:	e3540063 	cmp	r4, #99	; 0x63
 9e8:	0a000037 	beq	acc <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9ec:	e3540025 	cmp	r4, #37	; 0x25
 9f0:	0a000027 	beq	a94 <printf+0x138>
  write(fd, &c, 1);
 9f4:	e3a02001 	mov	r2, #1
 9f8:	e24b1019 	sub	r1, fp, #25
 9fc:	e1a00007 	mov	r0, r7
 a00:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a04:	ebfffebc 	bl	4fc <write>
 a08:	e3a02001 	mov	r2, #1
 a0c:	e24b101a 	sub	r1, fp, #26
 a10:	e1a00007 	mov	r0, r7
 a14:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a18:	ebfffeb7 	bl	4fc <write>
  for(i = 0; fmt[i]; i++){
 a1c:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a20:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 a24:	e3540000 	cmp	r4, #0
 a28:	1affffe2 	bne	9b8 <printf+0x5c>
    }
  }
}
 a2c:	e24bd018 	sub	sp, fp, #24
 a30:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a34:	e28dd00c 	add	sp, sp, #12
 a38:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a3c:	e3a03000 	mov	r3, #0
 a40:	e3a02010 	mov	r2, #16
 a44:	e4981004 	ldr	r1, [r8], #4
 a48:	e1a00007 	mov	r0, r7
 a4c:	ebffff7a 	bl	83c <printint>
      state = 0;
 a50:	e3a05000 	mov	r5, #0
 a54:	eaffffd4 	b	9ac <printf+0x50>
        s = (char*)*ap;
 a58:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a5c:	e3540000 	cmp	r4, #0
 a60:	0a000021 	beq	aec <printf+0x190>
        while(*s != 0){
 a64:	e5d45000 	ldrb	r5, [r4]
 a68:	e3550000 	cmp	r5, #0
 a6c:	0affffce 	beq	9ac <printf+0x50>
  write(fd, &c, 1);
 a70:	e3a02001 	mov	r2, #1
 a74:	e24b101d 	sub	r1, fp, #29
 a78:	e1a00007 	mov	r0, r7
 a7c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a80:	ebfffe9d 	bl	4fc <write>
        while(*s != 0){
 a84:	e5f45001 	ldrb	r5, [r4, #1]!
 a88:	e3550000 	cmp	r5, #0
 a8c:	1afffff7 	bne	a70 <printf+0x114>
 a90:	eaffffc5 	b	9ac <printf+0x50>
 a94:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a98:	e3a02001 	mov	r2, #1
 a9c:	e1a00007 	mov	r0, r7
 aa0:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 aa4:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 aa8:	ebfffe93 	bl	4fc <write>
 aac:	eaffffbe 	b	9ac <printf+0x50>
        printint(fd, *ap, 10, 1);
 ab0:	e3a03001 	mov	r3, #1
 ab4:	e3a0200a 	mov	r2, #10
 ab8:	e4981004 	ldr	r1, [r8], #4
 abc:	e1a00007 	mov	r0, r7
 ac0:	ebffff5d 	bl	83c <printint>
      state = 0;
 ac4:	e3a05000 	mov	r5, #0
 ac8:	eaffffb7 	b	9ac <printf+0x50>
        putc(fd, *ap);
 acc:	e4983004 	ldr	r3, [r8], #4
 ad0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 ad4:	e3a02001 	mov	r2, #1
 ad8:	e1a00007 	mov	r0, r7
      state = 0;
 adc:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 ae0:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 ae4:	ebfffe84 	bl	4fc <write>
 ae8:	eaffffaf 	b	9ac <printf+0x50>
          s = "(null)";
 aec:	e3004d38 	movw	r4, #3384	; 0xd38
        while(*s != 0){
 af0:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 af4:	e3404000 	movt	r4, #0
 af8:	eaffffdc 	b	a70 <printf+0x114>

00000afc <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 afc:	e300cd40 	movw	ip, #3392	; 0xd40
 b00:	e340c000 	movt	ip, #0
{
 b04:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 b08:	e2401008 	sub	r1, r0, #8
{
 b0c:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b10:	e59c3000 	ldr	r3, [ip]
 b14:	ea000004 	b	b2c <free+0x30>
 b18:	e1510002 	cmp	r1, r2
 b1c:	3a000009 	bcc	b48 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b20:	e1530002 	cmp	r3, r2
 b24:	2a000007 	bcs	b48 <free+0x4c>
{
 b28:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b2c:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b30:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b34:	3afffff7 	bcc	b18 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b38:	e1530002 	cmp	r3, r2
 b3c:	3afffff9 	bcc	b28 <free+0x2c>
 b40:	e1510002 	cmp	r1, r2
 b44:	2afffff7 	bcs	b28 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b48:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b4c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b50:	e081418e 	add	r4, r1, lr, lsl #3
 b54:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b58:	05922004 	ldreq	r2, [r2, #4]
 b5c:	0082e00e 	addeq	lr, r2, lr
 b60:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b64:	05932000 	ldreq	r2, [r3]
 b68:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b6c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b70:	e5932004 	ldr	r2, [r3, #4]
 b74:	e083e182 	add	lr, r3, r2, lsl #3
 b78:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b7c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b80:	05101004 	ldreq	r1, [r0, #-4]
 b84:	00812002 	addeq	r2, r1, r2
 b88:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b8c:	05102008 	ldreq	r2, [r0, #-8]
 b90:	05832000 	streq	r2, [r3]
}
 b94:	e8bd8810 	pop	{r4, fp, pc}

00000b98 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b98:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b9c:	e3007d40 	movw	r7, #3392	; 0xd40
 ba0:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba4:	e2804007 	add	r4, r0, #7
{
 ba8:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 bac:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb0:	e1a041a4 	lsr	r4, r4, #3
 bb4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 bb8:	e3530000 	cmp	r3, #0
 bbc:	0a000027 	beq	c60 <malloc+0xc8>
 bc0:	e5930000 	ldr	r0, [r3]
 bc4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bc8:	e1540002 	cmp	r4, r2
 bcc:	9a000019 	bls	c38 <malloc+0xa0>
 bd0:	e3540a01 	cmp	r4, #4096	; 0x1000
 bd4:	21a05004 	movcs	r5, r4
 bd8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 bdc:	e1a06185 	lsl	r6, r5, #3
 be0:	ea000003 	b	bf4 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 be8:	e5902004 	ldr	r2, [r0, #4]
 bec:	e1540002 	cmp	r4, r2
 bf0:	9a000010 	bls	c38 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bf4:	e5972000 	ldr	r2, [r7]
 bf8:	e1a03000 	mov	r3, r0
 bfc:	e1520000 	cmp	r2, r0
 c00:	1afffff7 	bne	be4 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 c04:	e1a00006 	mov	r0, r6
 c08:	ebfffee4 	bl	7a0 <sbrk>
 c0c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 c10:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 c14:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 c18:	0a000004 	beq	c30 <malloc+0x98>
  hp->s.size = nu;
 c1c:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 c20:	ebffffb5 	bl	afc <free>
  return freep;
 c24:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 c28:	e3530000 	cmp	r3, #0
 c2c:	1affffec 	bne	be4 <malloc+0x4c>
        return 0;
 c30:	e3a00000 	mov	r0, #0
  }
}
 c34:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 c38:	e1540002 	cmp	r4, r2
      freep = prevp;
 c3c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c40:	10422004 	subne	r2, r2, r4
 c44:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c48:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c4c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c50:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c54:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c58:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c5c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c60:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c64:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c68:	e5870000 	str	r0, [r7]
 c6c:	e5870004 	str	r0, [r7, #4]
 c70:	eaffffd6 	b	bd0 <malloc+0x38>
