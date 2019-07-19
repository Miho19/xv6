
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
	
	buf = malloc(512*sizeof(buf));	
   c:	e3a00b02 	mov	r0, #2048	; 0x800
int main(int argc, char *argv[]) {
  10:	e1a06001 	mov	r6, r1
	buf = malloc(512*sizeof(buf));	
  14:	eb0002d7 	bl	b78 <malloc>
  18:	e3004d24 	movw	r4, #3364	; 0xd24
  1c:	e3404000 	movt	r4, #0
  20:	e5840000 	str	r0, [r4]


	if(mkdir("dev") != 0){
  24:	e3000c54 	movw	r0, #3156	; 0xc54
  28:	e3400000 	movt	r0, #0
  2c:	eb00019f 	bl	6b0 <mkdir>
  30:	e3500000 	cmp	r0, #0
  34:	1a000025 	bne	d0 <main+0xd0>
		printf(1,"did not make dev\n");
	}
	if(chdir("dev") < 0){
  38:	e3000c54 	movw	r0, #3156	; 0xc54
  3c:	e3400000 	movt	r0, #0
  40:	eb0001a7 	bl	6e4 <chdir>
  44:	e3500000 	cmp	r0, #0
  48:	ba000035 	blt	124 <main+0x124>
		printf(1,"could not change dir into dev\n");
	}

	if(argc < 1) {
  4c:	e3550000 	cmp	r5, #0
  50:	da000023 	ble	e4 <main+0xe4>
		printf(1,"Usage: test filepath\n");
		clean();
	}
	
	if(mknod(argv[1],15,15) < 0) {
  54:	e3a0200f 	mov	r2, #15
  58:	e5960004 	ldr	r0, [r6, #4]
  5c:	e1a01002 	mov	r1, r2
  60:	eb00015e 	bl	5e0 <mknod>
  64:	e3500000 	cmp	r0, #0
  68:	ba000028 	blt	110 <main+0x110>
		printf(1,"mknod failure");
		clean();
	}
	

	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  6c:	e3a01002 	mov	r1, #2
  70:	e5960004 	ldr	r0, [r6, #4]
  74:	eb00014c 	bl	5ac <open>
  78:	e3005d20 	movw	r5, #3360	; 0xd20
  7c:	e3405000 	movt	r5, #0
  80:	e3500000 	cmp	r0, #0
  84:	e5850000 	str	r0, [r5]
  88:	ba00001a 	blt	f8 <main+0xf8>
		printf(1,"Could not open %s \n", argv[1]);
		clean();
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  8c:	e1a03000 	mov	r3, r0
  90:	e3001cc8 	movw	r1, #3272	; 0xcc8
  94:	e5962004 	ldr	r2, [r6, #4]
  98:	e3a00001 	mov	r0, #1
  9c:	e3401000 	movt	r1, #0
  a0:	eb000225 	bl	93c <printf>


	while(read(fd, buf, 512) != -1){
  a4:	e3a02c02 	mov	r2, #512	; 0x200
  a8:	e5941000 	ldr	r1, [r4]
  ac:	e5950000 	ldr	r0, [r5]
  b0:	eb0000fc 	bl	4a8 <read>
  b4:	e3700001 	cmn	r0, #1
  b8:	1afffff9 	bne	a4 <main+0xa4>
			
	}
	printf(1,"somehow we left the looop\n");
  bc:	e3001cdc 	movw	r1, #3292	; 0xcdc
  c0:	e3a00001 	mov	r0, #1
  c4:	e3401000 	movt	r1, #0
  c8:	eb00021b 	bl	93c <printf>
 
	clean();
  cc:	eb000019 	bl	138 <clean>
		printf(1,"did not make dev\n");
  d0:	e3001c58 	movw	r1, #3160	; 0xc58
  d4:	e3a00001 	mov	r0, #1
  d8:	e3401000 	movt	r1, #0
  dc:	eb000216 	bl	93c <printf>
  e0:	eaffffd4 	b	38 <main+0x38>
		printf(1,"Usage: test filepath\n");
  e4:	e3001c8c 	movw	r1, #3212	; 0xc8c
  e8:	e3a00001 	mov	r0, #1
  ec:	e3401000 	movt	r1, #0
  f0:	eb000211 	bl	93c <printf>
		clean();
  f4:	eb00000f 	bl	138 <clean>
		printf(1,"Could not open %s \n", argv[1]);
  f8:	e5962004 	ldr	r2, [r6, #4]
  fc:	e3001cb4 	movw	r1, #3252	; 0xcb4
 100:	e3a00001 	mov	r0, #1
 104:	e3401000 	movt	r1, #0
 108:	eb00020b 	bl	93c <printf>
		clean();
 10c:	eb000009 	bl	138 <clean>
		printf(1,"mknod failure");
 110:	e3001ca4 	movw	r1, #3236	; 0xca4
 114:	e3a00001 	mov	r0, #1
 118:	e3401000 	movt	r1, #0
 11c:	eb000206 	bl	93c <printf>
		clean();
 120:	eb000004 	bl	138 <clean>
		printf(1,"could not change dir into dev\n");
 124:	e3001c6c 	movw	r1, #3180	; 0xc6c
 128:	e3a00001 	mov	r0, #1
 12c:	e3401000 	movt	r1, #0
 130:	eb000201 	bl	93c <printf>
 134:	eaffffc4 	b	4c <main+0x4c>

00000138 <clean>:
	free(buf);
 138:	e3003d24 	movw	r3, #3364	; 0xd24
 13c:	e3403000 	movt	r3, #0
void clean(void){
 140:	e92d4800 	push	{fp, lr}
 144:	e28db004 	add	fp, sp, #4
	free(buf);
 148:	e5930000 	ldr	r0, [r3]
 14c:	eb000262 	bl	adc <free>
	if(fd > 0)
 150:	e3003d20 	movw	r3, #3360	; 0xd20
 154:	e3403000 	movt	r3, #0
 158:	e5930000 	ldr	r0, [r3]
 15c:	e3500000 	cmp	r0, #0
 160:	da000000 	ble	168 <clean+0x30>
		close(fd);
 164:	eb0000e9 	bl	510 <close>
	exit();
 168:	eb0000a7 	bl	40c <exit>

0000016c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 16c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 170:	e2402001 	sub	r2, r0, #1
 174:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 178:	e4d13001 	ldrb	r3, [r1], #1
 17c:	e3530000 	cmp	r3, #0
 180:	e5e23001 	strb	r3, [r2, #1]!
 184:	1afffffb 	bne	178 <strcpy+0xc>
    ;
  return os;
}
 188:	e28bd000 	add	sp, fp, #0
 18c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 190:	e12fff1e 	bx	lr

00000194 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 198:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 19c:	e5d03000 	ldrb	r3, [r0]
 1a0:	e5d12000 	ldrb	r2, [r1]
 1a4:	e3530000 	cmp	r3, #0
 1a8:	1a000004 	bne	1c0 <strcmp+0x2c>
 1ac:	ea000005 	b	1c8 <strcmp+0x34>
 1b0:	e5f03001 	ldrb	r3, [r0, #1]!
 1b4:	e3530000 	cmp	r3, #0
 1b8:	0a000006 	beq	1d8 <strcmp+0x44>
 1bc:	e5f12001 	ldrb	r2, [r1, #1]!
 1c0:	e1530002 	cmp	r3, r2
 1c4:	0afffff9 	beq	1b0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1c8:	e0430002 	sub	r0, r3, r2
 1cc:	e28bd000 	add	sp, fp, #0
 1d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d4:	e12fff1e 	bx	lr
 1d8:	e5d12001 	ldrb	r2, [r1, #1]
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
 1fc:	0a000009 	beq	228 <strlen+0x3c>
 200:	e1a02000 	mov	r2, r0
 204:	e3a03000 	mov	r3, #0
 208:	e5f21001 	ldrb	r1, [r2, #1]!
 20c:	e2833001 	add	r3, r3, #1
 210:	e3510000 	cmp	r1, #0
 214:	e1a00003 	mov	r0, r3
 218:	1afffffa 	bne	208 <strlen+0x1c>
    ;
  return n;
}
 21c:	e28bd000 	add	sp, fp, #0
 220:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 224:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 228:	e1a00003 	mov	r0, r3
 22c:	eafffffa 	b	21c <strlen+0x30>

00000230 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 230:	e3520000 	cmp	r2, #0
{
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 23c:	0a000004 	beq	254 <memset+0x24>
 240:	e6ef1071 	uxtb	r1, r1
 244:	e0802002 	add	r2, r0, r2
 248:	e4c01001 	strb	r1, [r0], #1
 24c:	e1520000 	cmp	r2, r0
 250:	1afffffc 	bne	248 <memset+0x18>
  return (void *)p;
}
 254:	e28bd000 	add	sp, fp, #0
 258:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 25c:	e12fff1e 	bx	lr

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 264:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 268:	e5d02000 	ldrb	r2, [r0]
 26c:	e3520000 	cmp	r2, #0
 270:	0a00000b 	beq	2a4 <strchr+0x44>
    if(*s == c)
 274:	e1510002 	cmp	r1, r2
 278:	1a000002 	bne	288 <strchr+0x28>
 27c:	ea000005 	b	298 <strchr+0x38>
 280:	e1530001 	cmp	r3, r1
 284:	0a000003 	beq	298 <strchr+0x38>
  for(; *s; s++)
 288:	e5f03001 	ldrb	r3, [r0, #1]!
 28c:	e3530000 	cmp	r3, #0
 290:	1afffffa 	bne	280 <strchr+0x20>
      return (char*)s;
  return 0;
 294:	e1a00003 	mov	r0, r3
}
 298:	e28bd000 	add	sp, fp, #0
 29c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a0:	e12fff1e 	bx	lr
  return 0;
 2a4:	e1a00002 	mov	r0, r2
 2a8:	eafffffa 	b	298 <strchr+0x38>

000002ac <gets>:

char*
gets(char *buf, int max)
{
 2ac:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2b0:	e1a08000 	mov	r8, r0
 2b4:	e28db018 	add	fp, sp, #24
 2b8:	e1a07001 	mov	r7, r1
 2bc:	e24dd00c 	sub	sp, sp, #12
 2c0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c4:	e3a05000 	mov	r5, #0
 2c8:	ea000008 	b	2f0 <gets+0x44>
    cc = read(0, &c, 1);
 2cc:	eb000075 	bl	4a8 <read>
    if(cc < 1)
 2d0:	e3500000 	cmp	r0, #0
 2d4:	da00000b 	ble	308 <gets+0x5c>
      break;
    buf[i++] = c;
 2d8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2dc:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 2e0:	e353000d 	cmp	r3, #13
 2e4:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 2e8:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 2ec:	0a000005 	beq	308 <gets+0x5c>
    cc = read(0, &c, 1);
 2f0:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 2f4:	e0854002 	add	r4, r5, r2
 2f8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 2fc:	e24b101d 	sub	r1, fp, #29
 300:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 304:	bafffff0 	blt	2cc <gets+0x20>
      break;
  }
  buf[i] = '\0';
 308:	e3a03000 	mov	r3, #0
  return buf;
}
 30c:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 310:	e7c83005 	strb	r3, [r8, r5]
}
 314:	e24bd018 	sub	sp, fp, #24
 318:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000031c <stat>:

int
stat(char *n, struct stat *st)
{
 31c:	e92d4830 	push	{r4, r5, fp, lr}
 320:	e1a04001 	mov	r4, r1
 324:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 328:	e3a01000 	mov	r1, #0
 32c:	eb00009e 	bl	5ac <open>
  if(fd < 0)
 330:	e2505000 	subs	r5, r0, #0
 334:	ba000006 	blt	354 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 338:	e1a01004 	mov	r1, r4
 33c:	eb0000c1 	bl	648 <fstat>
 340:	e1a04000 	mov	r4, r0
  close(fd);
 344:	e1a00005 	mov	r0, r5
 348:	eb000070 	bl	510 <close>
  return r;
}
 34c:	e1a00004 	mov	r0, r4
 350:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 354:	e3e04000 	mvn	r4, #0
 358:	eafffffb 	b	34c <stat+0x30>

0000035c <atoi>:

int
atoi(const char *s)
{
 35c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 360:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 364:	e5d02000 	ldrb	r2, [r0]
 368:	e2423030 	sub	r3, r2, #48	; 0x30
 36c:	e3530009 	cmp	r3, #9
 370:	e3a03000 	mov	r3, #0
 374:	8a000006 	bhi	394 <atoi+0x38>
    n = n*10 + *s++ - '0';
 378:	e3a0c00a 	mov	ip, #10
 37c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 380:	e5f02001 	ldrb	r2, [r0, #1]!
 384:	e2421030 	sub	r1, r2, #48	; 0x30
 388:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 38c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 390:	9afffff9 	bls	37c <atoi+0x20>
  return n;
}
 394:	e1a00003 	mov	r0, r3
 398:	e28bd000 	add	sp, fp, #0
 39c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3a0:	e12fff1e 	bx	lr

000003a4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a4:	e3520000 	cmp	r2, #0
{
 3a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3ac:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 3b0:	da000005 	ble	3cc <memmove+0x28>
 3b4:	e0812002 	add	r2, r1, r2
 3b8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3bc:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 3c0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3c4:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 3c8:	1afffffb 	bne	3bc <memmove+0x18>
  return vdst;
}
 3cc:	e28bd000 	add	sp, fp, #0
 3d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d4:	e12fff1e 	bx	lr

000003d8 <fork>:
 3d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3ec:	e3a00001 	mov	r0, #1
 3f0:	ef000040 	svc	0x00000040
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 400:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 404:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 408:	e12fff1e 	bx	lr

0000040c <exit>:
 40c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 410:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 414:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 418:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 41c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 420:	e3a00002 	mov	r0, #2
 424:	ef000040 	svc	0x00000040
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 434:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 43c:	e12fff1e 	bx	lr

00000440 <wait>:
 440:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 444:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 448:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 44c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 450:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 454:	e3a00003 	mov	r0, #3
 458:	ef000040 	svc	0x00000040
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 468:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 46c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 470:	e12fff1e 	bx	lr

00000474 <pipe>:
 474:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 478:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 47c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 480:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 484:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 488:	e3a00004 	mov	r0, #4
 48c:	ef000040 	svc	0x00000040
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 49c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a4:	e12fff1e 	bx	lr

000004a8 <read>:
 4a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4bc:	e3a00005 	mov	r0, #5
 4c0:	ef000040 	svc	0x00000040
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d8:	e12fff1e 	bx	lr

000004dc <write>:
 4dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f0:	e3a00010 	mov	r0, #16
 4f4:	ef000040 	svc	0x00000040
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 504:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 50c:	e12fff1e 	bx	lr

00000510 <close>:
 510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 514:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 518:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 51c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 520:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 524:	e3a00015 	mov	r0, #21
 528:	ef000040 	svc	0x00000040
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 538:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 53c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 540:	e12fff1e 	bx	lr

00000544 <kill>:
 544:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 548:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 54c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 550:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 554:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 558:	e3a00006 	mov	r0, #6
 55c:	ef000040 	svc	0x00000040
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 56c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 570:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 574:	e12fff1e 	bx	lr

00000578 <exec>:
 578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 57c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 580:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 584:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 588:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 58c:	e3a00007 	mov	r0, #7
 590:	ef000040 	svc	0x00000040
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a8:	e12fff1e 	bx	lr

000005ac <open>:
 5ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c0:	e3a0000f 	mov	r0, #15
 5c4:	ef000040 	svc	0x00000040
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5dc:	e12fff1e 	bx	lr

000005e0 <mknod>:
 5e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f4:	e3a00011 	mov	r0, #17
 5f8:	ef000040 	svc	0x00000040
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 608:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 60c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 610:	e12fff1e 	bx	lr

00000614 <unlink>:
 614:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 618:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 61c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 620:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 624:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 628:	e3a00012 	mov	r0, #18
 62c:	ef000040 	svc	0x00000040
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 63c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 640:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 644:	e12fff1e 	bx	lr

00000648 <fstat>:
 648:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 64c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 650:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 654:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 658:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 65c:	e3a00008 	mov	r0, #8
 660:	ef000040 	svc	0x00000040
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 670:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 674:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 678:	e12fff1e 	bx	lr

0000067c <link>:
 67c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 680:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 684:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 688:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 68c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 690:	e3a00013 	mov	r0, #19
 694:	ef000040 	svc	0x00000040
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ac:	e12fff1e 	bx	lr

000006b0 <mkdir>:
 6b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c4:	e3a00014 	mov	r0, #20
 6c8:	ef000040 	svc	0x00000040
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e0:	e12fff1e 	bx	lr

000006e4 <chdir>:
 6e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f8:	e3a00009 	mov	r0, #9
 6fc:	ef000040 	svc	0x00000040
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 70c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 710:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 714:	e12fff1e 	bx	lr

00000718 <dup>:
 718:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 71c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 720:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 724:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 728:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 72c:	e3a0000a 	mov	r0, #10
 730:	ef000040 	svc	0x00000040
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 740:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 744:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 748:	e12fff1e 	bx	lr

0000074c <getpid>:
 74c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 750:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 754:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 758:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 75c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 760:	e3a0000b 	mov	r0, #11
 764:	ef000040 	svc	0x00000040
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 770:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 774:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 778:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 77c:	e12fff1e 	bx	lr

00000780 <sbrk>:
 780:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 784:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 788:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 78c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 790:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 794:	e3a0000c 	mov	r0, #12
 798:	ef000040 	svc	0x00000040
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b0:	e12fff1e 	bx	lr

000007b4 <sleep>:
 7b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c8:	e3a0000d 	mov	r0, #13
 7cc:	ef000040 	svc	0x00000040
 7d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e4:	e12fff1e 	bx	lr

000007e8 <uptime>:
 7e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7fc:	e3a0000e 	mov	r0, #14
 800:	ef000040 	svc	0x00000040
 804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 808:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 80c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 810:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 814:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 818:	e12fff1e 	bx	lr

0000081c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 81c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 820:	e1a09fa1 	lsr	r9, r1, #31
 824:	e3530000 	cmp	r3, #0
 828:	03a09000 	moveq	r9, #0
 82c:	12099001 	andne	r9, r9, #1
{
 830:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 834:	e3590000 	cmp	r9, #0
 838:	e3008cf8 	movw	r8, #3320	; 0xcf8
    neg = 1;
    x = -xx;
 83c:	1261e000 	rsbne	lr, r1, #0
 840:	e3408000 	movt	r8, #0
 844:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 848:	e1a04000 	mov	r4, r0
    neg = 1;
 84c:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 850:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 854:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 858:	e3a05001 	mov	r5, #1
{
 85c:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 860:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 864:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 868:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 86c:	e1a0033e 	lsr	r0, lr, r3
 870:	e2000001 	and	r0, r0, #1
 874:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 878:	e1520001 	cmp	r2, r1
            r = r - d;
 87c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 880:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 884:	e2533001 	subs	r3, r3, #1
 888:	2afffff7 	bcs	86c <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 88c:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 890:	e35c0000 	cmp	ip, #0
 894:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 898:	e2873001 	add	r3, r7, #1
 89c:	e7d81001 	ldrb	r1, [r8, r1]
 8a0:	e5e61001 	strb	r1, [r6, #1]!
 8a4:	11a07003 	movne	r7, r3
 8a8:	1affffec 	bne	860 <printint+0x44>
  if(neg)
 8ac:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 8b0:	124b201c 	subne	r2, fp, #28
 8b4:	10822003 	addne	r2, r2, r3
 8b8:	13a0102d 	movne	r1, #45	; 0x2d
 8bc:	12873002 	addne	r3, r7, #2
 8c0:	15421010 	strbne	r1, [r2, #-16]
 8c4:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 8c8:	e2435001 	sub	r5, r3, #1
 8cc:	e0826003 	add	r6, r2, r3
 8d0:	e5763001 	ldrb	r3, [r6, #-1]!
 8d4:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 8d8:	e3a02001 	mov	r2, #1
 8dc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 8e0:	e1a00004 	mov	r0, r4
 8e4:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 8e8:	ebfffefb 	bl	4dc <write>
  while(--i >= 0)
 8ec:	e3750001 	cmn	r5, #1
 8f0:	1afffff6 	bne	8d0 <printint+0xb4>
    putc(fd, buf[i]);
}
 8f4:	e24bd01c 	sub	sp, fp, #28
 8f8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000008fc <div>:
{
 8fc:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 900:	e3a02000 	mov	r2, #0
{
 904:	e28db008 	add	fp, sp, #8
 908:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 90c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 910:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 914:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 918:	e1a0c33e 	lsr	ip, lr, r3
 91c:	e20cc001 	and	ip, ip, #1
 920:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 924:	e1520001 	cmp	r2, r1
            r = r - d;
 928:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 92c:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 930:	e2533001 	subs	r3, r3, #1
 934:	2afffff7 	bcs	918 <div+0x1c>
}
 938:	e8bd8810 	pop	{r4, fp, pc}

0000093c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 93c:	e92d000e 	push	{r1, r2, r3}
 940:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 944:	e28db018 	add	fp, sp, #24
 948:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 94c:	e59b6004 	ldr	r6, [fp, #4]
 950:	e5d64000 	ldrb	r4, [r6]
 954:	e3540000 	cmp	r4, #0
 958:	0a00002b 	beq	a0c <printf+0xd0>
 95c:	e1a07000 	mov	r7, r0
 960:	e28b8008 	add	r8, fp, #8
 964:	e3a05000 	mov	r5, #0
 968:	ea00000a 	b	998 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 96c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 970:	01a05004 	moveq	r5, r4
      if(c == '%'){
 974:	0a000004 	beq	98c <printf+0x50>
 978:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 97c:	e3a02001 	mov	r2, #1
 980:	e1a00007 	mov	r0, r7
 984:	e5614006 	strb	r4, [r1, #-6]!
 988:	ebfffed3 	bl	4dc <write>
  for(i = 0; fmt[i]; i++){
 98c:	e5f64001 	ldrb	r4, [r6, #1]!
 990:	e3540000 	cmp	r4, #0
 994:	0a00001c 	beq	a0c <printf+0xd0>
    if(state == 0){
 998:	e3550000 	cmp	r5, #0
 99c:	0afffff2 	beq	96c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9a0:	e3550025 	cmp	r5, #37	; 0x25
 9a4:	1afffff8 	bne	98c <printf+0x50>
      if(c == 'd'){
 9a8:	e3540064 	cmp	r4, #100	; 0x64
 9ac:	0a000037 	beq	a90 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9b0:	e20430f7 	and	r3, r4, #247	; 0xf7
 9b4:	e3530070 	cmp	r3, #112	; 0x70
 9b8:	0a000017 	beq	a1c <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9bc:	e3540073 	cmp	r4, #115	; 0x73
 9c0:	0a00001c 	beq	a38 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9c4:	e3540063 	cmp	r4, #99	; 0x63
 9c8:	0a000037 	beq	aac <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9cc:	e3540025 	cmp	r4, #37	; 0x25
 9d0:	0a000027 	beq	a74 <printf+0x138>
  write(fd, &c, 1);
 9d4:	e3a02001 	mov	r2, #1
 9d8:	e24b1019 	sub	r1, fp, #25
 9dc:	e1a00007 	mov	r0, r7
 9e0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9e4:	ebfffebc 	bl	4dc <write>
 9e8:	e3a02001 	mov	r2, #1
 9ec:	e24b101a 	sub	r1, fp, #26
 9f0:	e1a00007 	mov	r0, r7
 9f4:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9f8:	ebfffeb7 	bl	4dc <write>
  for(i = 0; fmt[i]; i++){
 9fc:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a00:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 a04:	e3540000 	cmp	r4, #0
 a08:	1affffe2 	bne	998 <printf+0x5c>
    }
  }
}
 a0c:	e24bd018 	sub	sp, fp, #24
 a10:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a14:	e28dd00c 	add	sp, sp, #12
 a18:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 a1c:	e3a03000 	mov	r3, #0
 a20:	e3a02010 	mov	r2, #16
 a24:	e4981004 	ldr	r1, [r8], #4
 a28:	e1a00007 	mov	r0, r7
 a2c:	ebffff7a 	bl	81c <printint>
      state = 0;
 a30:	e3a05000 	mov	r5, #0
 a34:	eaffffd4 	b	98c <printf+0x50>
        s = (char*)*ap;
 a38:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a3c:	e3540000 	cmp	r4, #0
 a40:	0a000021 	beq	acc <printf+0x190>
        while(*s != 0){
 a44:	e5d45000 	ldrb	r5, [r4]
 a48:	e3550000 	cmp	r5, #0
 a4c:	0affffce 	beq	98c <printf+0x50>
  write(fd, &c, 1);
 a50:	e3a02001 	mov	r2, #1
 a54:	e24b101d 	sub	r1, fp, #29
 a58:	e1a00007 	mov	r0, r7
 a5c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a60:	ebfffe9d 	bl	4dc <write>
        while(*s != 0){
 a64:	e5f45001 	ldrb	r5, [r4, #1]!
 a68:	e3550000 	cmp	r5, #0
 a6c:	1afffff7 	bne	a50 <printf+0x114>
 a70:	eaffffc5 	b	98c <printf+0x50>
 a74:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a78:	e3a02001 	mov	r2, #1
 a7c:	e1a00007 	mov	r0, r7
 a80:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 a84:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 a88:	ebfffe93 	bl	4dc <write>
 a8c:	eaffffbe 	b	98c <printf+0x50>
        printint(fd, *ap, 10, 1);
 a90:	e3a03001 	mov	r3, #1
 a94:	e3a0200a 	mov	r2, #10
 a98:	e4981004 	ldr	r1, [r8], #4
 a9c:	e1a00007 	mov	r0, r7
 aa0:	ebffff5d 	bl	81c <printint>
      state = 0;
 aa4:	e3a05000 	mov	r5, #0
 aa8:	eaffffb7 	b	98c <printf+0x50>
        putc(fd, *ap);
 aac:	e4983004 	ldr	r3, [r8], #4
 ab0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 ab4:	e3a02001 	mov	r2, #1
 ab8:	e1a00007 	mov	r0, r7
      state = 0;
 abc:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 ac0:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 ac4:	ebfffe84 	bl	4dc <write>
 ac8:	eaffffaf 	b	98c <printf+0x50>
          s = "(null)";
 acc:	e3004d0c 	movw	r4, #3340	; 0xd0c
        while(*s != 0){
 ad0:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 ad4:	e3404000 	movt	r4, #0
 ad8:	eaffffdc 	b	a50 <printf+0x114>

00000adc <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 adc:	e300cd14 	movw	ip, #3348	; 0xd14
 ae0:	e340c000 	movt	ip, #0
{
 ae4:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 ae8:	e2401008 	sub	r1, r0, #8
{
 aec:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af0:	e59c3000 	ldr	r3, [ip]
 af4:	ea000004 	b	b0c <free+0x30>
 af8:	e1510002 	cmp	r1, r2
 afc:	3a000009 	bcc	b28 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b00:	e1530002 	cmp	r3, r2
 b04:	2a000007 	bcs	b28 <free+0x4c>
{
 b08:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b0c:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b10:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b14:	3afffff7 	bcc	af8 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b18:	e1530002 	cmp	r3, r2
 b1c:	3afffff9 	bcc	b08 <free+0x2c>
 b20:	e1510002 	cmp	r1, r2
 b24:	2afffff7 	bcs	b08 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b28:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b2c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 b30:	e081418e 	add	r4, r1, lr, lsl #3
 b34:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 b38:	05922004 	ldreq	r2, [r2, #4]
 b3c:	0082e00e 	addeq	lr, r2, lr
 b40:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b44:	05932000 	ldreq	r2, [r3]
 b48:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 b4c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b50:	e5932004 	ldr	r2, [r3, #4]
 b54:	e083e182 	add	lr, r3, r2, lsl #3
 b58:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 b5c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 b60:	05101004 	ldreq	r1, [r0, #-4]
 b64:	00812002 	addeq	r2, r1, r2
 b68:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b6c:	05102008 	ldreq	r2, [r0, #-8]
 b70:	05832000 	streq	r2, [r3]
}
 b74:	e8bd8810 	pop	{r4, fp, pc}

00000b78 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b78:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b7c:	e3007d14 	movw	r7, #3348	; 0xd14
 b80:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b84:	e2804007 	add	r4, r0, #7
{
 b88:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b8c:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b90:	e1a041a4 	lsr	r4, r4, #3
 b94:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b98:	e3530000 	cmp	r3, #0
 b9c:	0a000027 	beq	c40 <malloc+0xc8>
 ba0:	e5930000 	ldr	r0, [r3]
 ba4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ba8:	e1540002 	cmp	r4, r2
 bac:	9a000019 	bls	c18 <malloc+0xa0>
 bb0:	e3540a01 	cmp	r4, #4096	; 0x1000
 bb4:	21a05004 	movcs	r5, r4
 bb8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 bbc:	e1a06185 	lsl	r6, r5, #3
 bc0:	ea000003 	b	bd4 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bc4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 bc8:	e5902004 	ldr	r2, [r0, #4]
 bcc:	e1540002 	cmp	r4, r2
 bd0:	9a000010 	bls	c18 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bd4:	e5972000 	ldr	r2, [r7]
 bd8:	e1a03000 	mov	r3, r0
 bdc:	e1520000 	cmp	r2, r0
 be0:	1afffff7 	bne	bc4 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 be4:	e1a00006 	mov	r0, r6
 be8:	ebfffee4 	bl	780 <sbrk>
 bec:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 bf0:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 bf4:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 bf8:	0a000004 	beq	c10 <malloc+0x98>
  hp->s.size = nu;
 bfc:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 c00:	ebffffb5 	bl	adc <free>
  return freep;
 c04:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 c08:	e3530000 	cmp	r3, #0
 c0c:	1affffec 	bne	bc4 <malloc+0x4c>
        return 0;
 c10:	e3a00000 	mov	r0, #0
  }
}
 c14:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 c18:	e1540002 	cmp	r4, r2
      freep = prevp;
 c1c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 c20:	10422004 	subne	r2, r2, r4
 c24:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c28:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c2c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c30:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c34:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c38:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c3c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c40:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c44:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c48:	e5870000 	str	r0, [r7]
 c4c:	e5870004 	str	r0, [r7, #4]
 c50:	eaffffd6 	b	bb0 <malloc+0x38>
