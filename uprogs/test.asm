
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
	int result = 0;
	int fd = 0;
	char buffer[512];
	uint offset = 0;

	char path[] = "/usb/new_file.txt";
   0:	e300cc64 	movw	ip, #3172	; 0xc64
   4:	e340c000 	movt	ip, #0
int main(int argc, char *argv[]) {
   8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   c:	e28db014 	add	fp, sp, #20
  10:	e24ddf86 	sub	sp, sp, #536	; 0x218
	char path[] = "/usb/new_file.txt";
  14:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
  18:	e24bef8a 	sub	lr, fp, #552	; 0x228
  1c:	e59cc000 	ldr	ip, [ip]
  20:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}

	fd = open(path, O_CREATE | O_RDWR);	
  24:	e24b0f8a 	sub	r0, fp, #552	; 0x228
  28:	e3001202 	movw	r1, #514	; 0x202
	char path[] = "/usb/new_file.txt";
  2c:	e1cec0b0 	strh	ip, [lr]
	fd = open(path, O_CREATE | O_RDWR);	
  30:	eb000159 	bl	59c <open>
	
	if(fd < 0){
  34:	e2505000 	subs	r5, r0, #0
  38:	ba00002a 	blt	e8 <main+0xe8>
		printf(1, "%s failed to open\n", path);
		exit();
	}

	memset(buffer, 0, sizeof buffer);
  3c:	e24b4f85 	sub	r4, fp, #532	; 0x214
  40:	e3a02c02 	mov	r2, #512	; 0x200
  44:	e3a01000 	mov	r1, #0
  48:	e1a00004 	mov	r0, r4
  4c:	eb000056 	bl	1ac <memset>
	
	for(offset = 0; offset < 512; offset++) {
		buffer[offset] = 65 + (offset % 58);
  50:	e30c0b09 	movw	r0, #51977	; 0xcb09
  54:	e24be014 	sub	lr, fp, #20
  58:	e3480d3d 	movt	r0, #36157	; 0x8d3d
	memset(buffer, 0, sizeof buffer);
  5c:	e1a02004 	mov	r2, r4
		buffer[offset] = 65 + (offset % 58);
  60:	e3a0c03a 	mov	ip, #58	; 0x3a
  64:	e0421004 	sub	r1, r2, r4
  68:	e0876091 	umull	r6, r7, r1, r0
  6c:	e1a032a7 	lsr	r3, r7, #5
  70:	e063139c 	mls	r3, ip, r3, r1
  74:	e2833041 	add	r3, r3, #65	; 0x41
  78:	e4c23001 	strb	r3, [r2], #1
	for(offset = 0; offset < 512; offset++) {
  7c:	e152000e 	cmp	r2, lr
  80:	1afffff7 	bne	64 <main+0x64>
	}

	if(lseek(fd, 0, 0) != 0){
  84:	e3a02000 	mov	r2, #0
  88:	e1a00005 	mov	r0, r5
  8c:	e1a01002 	mov	r1, r2
  90:	eb0000d9 	bl	3fc <lseek>
  94:	e3500000 	cmp	r0, #0
  98:	0a000006 	beq	b8 <main+0xb8>
		printf(1, "lseek error\n");
  9c:	e3a00001 	mov	r0, #1
  a0:	e3001c44 	movw	r1, #3140	; 0xc44
  a4:	e3401000 	movt	r1, #0
  a8:	eb00021a 	bl	918 <printf>
		close(fd);
  ac:	e1a00005 	mov	r0, r5
  b0:	eb000112 	bl	500 <close>
		exit();
  b4:	eb0000b6 	bl	394 <exit>
	}

	result = write(fd, buffer, 512);
  b8:	e1a01004 	mov	r1, r4
  bc:	e3a02c02 	mov	r2, #512	; 0x200
  c0:	e1a00005 	mov	r0, r5
  c4:	eb000100 	bl	4cc <write>
	printf(1, "Write %d bytes\n", result);
  c8:	e3001c54 	movw	r1, #3156	; 0xc54
  cc:	e3401000 	movt	r1, #0
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a00001 	mov	r0, #1
  d8:	eb00020e 	bl	918 <printf>
			
	close(fd);
  dc:	e1a00005 	mov	r0, r5
  e0:	eb000106 	bl	500 <close>
	exit();	
  e4:	eb0000aa 	bl	394 <exit>
		printf(1, "%s failed to open\n", path);
  e8:	e24b2f8a 	sub	r2, fp, #552	; 0x228
  ec:	e3001c30 	movw	r1, #3120	; 0xc30
  f0:	e3a00001 	mov	r0, #1
  f4:	e3401000 	movt	r1, #0
  f8:	eb000206 	bl	918 <printf>
		exit();
  fc:	eb0000a4 	bl	394 <exit>

00000100 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 104:	e2402001 	sub	r2, r0, #1
 108:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10c:	e4d13001 	ldrb	r3, [r1], #1
 110:	e3530000 	cmp	r3, #0
 114:	e5e23001 	strb	r3, [r2, #1]!
 118:	1afffffb 	bne	10c <strcpy+0xc>
    ;
  return os;
}
 11c:	e28bd000 	add	sp, fp, #0
 120:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 124:	e12fff1e 	bx	lr

00000128 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 130:	e5d03000 	ldrb	r3, [r0]
 134:	e5d12000 	ldrb	r2, [r1]
 138:	e3530000 	cmp	r3, #0
 13c:	1a000004 	bne	154 <strcmp+0x2c>
 140:	ea000005 	b	15c <strcmp+0x34>
 144:	e5f03001 	ldrb	r3, [r0, #1]!
 148:	e5f12001 	ldrb	r2, [r1, #1]!
 14c:	e3530000 	cmp	r3, #0
 150:	0a000001 	beq	15c <strcmp+0x34>
 154:	e1530002 	cmp	r3, r2
 158:	0afffff9 	beq	144 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 15c:	e0430002 	sub	r0, r3, r2
 160:	e28bd000 	add	sp, fp, #0
 164:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 168:	e12fff1e 	bx	lr

0000016c <strlen>:

uint
strlen(char *s)
{
 16c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 170:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 174:	e5d03000 	ldrb	r3, [r0]
 178:	e3530000 	cmp	r3, #0
 17c:	01a00003 	moveq	r0, r3
 180:	0a000006 	beq	1a0 <strlen+0x34>
 184:	e1a02000 	mov	r2, r0
 188:	e3a03000 	mov	r3, #0
 18c:	e5f21001 	ldrb	r1, [r2, #1]!
 190:	e2833001 	add	r3, r3, #1
 194:	e3510000 	cmp	r1, #0
 198:	e1a00003 	mov	r0, r3
 19c:	1afffffa 	bne	18c <strlen+0x20>
    ;
  return n;
}
 1a0:	e28bd000 	add	sp, fp, #0
 1a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a8:	e12fff1e 	bx	lr

000001ac <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1ac:	e3520000 	cmp	r2, #0
{
 1b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b4:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 1b8:	0a000004 	beq	1d0 <memset+0x24>
 1bc:	e6ef1071 	uxtb	r1, r1
 1c0:	e0802002 	add	r2, r0, r2
 1c4:	e4c01001 	strb	r1, [r0], #1
 1c8:	e1520000 	cmp	r2, r0
 1cc:	1afffffc 	bne	1c4 <memset+0x18>
  return (void *)p;
}
 1d0:	e28bd000 	add	sp, fp, #0
 1d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d8:	e12fff1e 	bx	lr

000001dc <strchr>:

char*
strchr(const char *s, char c)
{
 1dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1e0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1e4:	e5d02000 	ldrb	r2, [r0]
 1e8:	e3520000 	cmp	r2, #0
 1ec:	0a00000b 	beq	220 <strchr+0x44>
    if(*s == c)
 1f0:	e1510002 	cmp	r1, r2
 1f4:	1a000002 	bne	204 <strchr+0x28>
 1f8:	ea000005 	b	214 <strchr+0x38>
 1fc:	e1530001 	cmp	r3, r1
 200:	0a000003 	beq	214 <strchr+0x38>
  for(; *s; s++)
 204:	e5f03001 	ldrb	r3, [r0, #1]!
 208:	e3530000 	cmp	r3, #0
 20c:	1afffffa 	bne	1fc <strchr+0x20>
      return (char*)s;
  return 0;
 210:	e1a00003 	mov	r0, r3
}
 214:	e28bd000 	add	sp, fp, #0
 218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 21c:	e12fff1e 	bx	lr
  return 0;
 220:	e1a00002 	mov	r0, r2
 224:	eafffffa 	b	214 <strchr+0x38>

00000228 <gets>:

char*
gets(char *buf, int max)
{
 228:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 22c:	e1a03000 	mov	r3, r0
 230:	e28db014 	add	fp, sp, #20
 234:	e1a07000 	mov	r7, r0
 238:	e24dd008 	sub	sp, sp, #8
 23c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 240:	e3a04000 	mov	r4, #0
 244:	ea000008 	b	26c <gets+0x44>
    cc = read(0, &c, 1);
 248:	eb000092 	bl	498 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 24c:	e1a03005 	mov	r3, r5
    if(cc < 1)
 250:	e3500000 	cmp	r0, #0
 254:	da00000b 	ble	288 <gets+0x60>
    buf[i++] = c;
 258:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 25c:	e352000d 	cmp	r2, #13
 260:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 264:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 268:	0a00000b 	beq	29c <gets+0x74>
    cc = read(0, &c, 1);
 26c:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 270:	e0844002 	add	r4, r4, r2
 274:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 278:	e24b1015 	sub	r1, fp, #21
 27c:	e3a00000 	mov	r0, #0
 280:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 284:	baffffef 	blt	248 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 288:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 28c:	e3a03000 	mov	r3, #0
 290:	e5c53000 	strb	r3, [r5]
}
 294:	e24bd014 	sub	sp, fp, #20
 298:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 29c:	e0875004 	add	r5, r7, r4
 2a0:	eafffff8 	b	288 <gets+0x60>

000002a4 <stat>:

int
stat(char *n, struct stat *st)
{
 2a4:	e92d4830 	push	{r4, r5, fp, lr}
 2a8:	e1a04001 	mov	r4, r1
 2ac:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b0:	e3a01000 	mov	r1, #0
 2b4:	eb0000b8 	bl	59c <open>
  if(fd < 0)
 2b8:	e2505000 	subs	r5, r0, #0
 2bc:	ba000006 	blt	2dc <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2c0:	e1a01004 	mov	r1, r4
 2c4:	eb0000db 	bl	638 <fstat>
 2c8:	e1a04000 	mov	r4, r0
  close(fd);
 2cc:	e1a00005 	mov	r0, r5
 2d0:	eb00008a 	bl	500 <close>
  return r;
}
 2d4:	e1a00004 	mov	r0, r4
 2d8:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 2dc:	e3e04000 	mvn	r4, #0
 2e0:	eafffffb 	b	2d4 <stat+0x30>

000002e4 <atoi>:

int
atoi(const char *s)
{
 2e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2e8:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ec:	e5d02000 	ldrb	r2, [r0]
 2f0:	e2423030 	sub	r3, r2, #48	; 0x30
 2f4:	e3530009 	cmp	r3, #9
  n = 0;
 2f8:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 2fc:	8a000006 	bhi	31c <atoi+0x38>
    n = n*10 + *s++ - '0';
 300:	e3a0c00a 	mov	ip, #10
 304:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 308:	e5f02001 	ldrb	r2, [r0, #1]!
 30c:	e2421030 	sub	r1, r2, #48	; 0x30
 310:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 314:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 318:	9afffff9 	bls	304 <atoi+0x20>
  return n;
}
 31c:	e1a00003 	mov	r0, r3
 320:	e28bd000 	add	sp, fp, #0
 324:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 328:	e12fff1e 	bx	lr

0000032c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32c:	e3520000 	cmp	r2, #0
{
 330:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 334:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 338:	da000005 	ble	354 <memmove+0x28>
 33c:	e0812002 	add	r2, r1, r2
 340:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 344:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 348:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 34c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 350:	1afffffb 	bne	344 <memmove+0x18>
  return vdst;
}
 354:	e28bd000 	add	sp, fp, #0
 358:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <fork>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00001 	mov	r0, #1
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <exit>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00002 	mov	r0, #2
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <wait>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00003 	mov	r0, #3
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <lseek>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00016 	mov	r0, #22
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <mount>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00017 	mov	r0, #23
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <pipe>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00004 	mov	r0, #4
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <read>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00005 	mov	r0, #5
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <write>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00010 	mov	r0, #16
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <close>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00015 	mov	r0, #21
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <kill>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00006 	mov	r0, #6
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <exec>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00007 	mov	r0, #7
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <open>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a0000f 	mov	r0, #15
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <mknod>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00011 	mov	r0, #17
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <unlink>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00012 	mov	r0, #18
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <fstat>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a00008 	mov	r0, #8
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <link>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00013 	mov	r0, #19
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <mkdir>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a00014 	mov	r0, #20
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <chdir>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a00009 	mov	r0, #9
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <dup>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a0000a 	mov	r0, #10
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <getpid>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a0000b 	mov	r0, #11
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <sbrk>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a0000c 	mov	r0, #12
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <sleep>:
 7a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b8:	e3a0000d 	mov	r0, #13
 7bc:	ef000040 	svc	0x00000040
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d4:	e12fff1e 	bx	lr

000007d8 <uptime>:
 7d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ec:	e3a0000e 	mov	r0, #14
 7f0:	ef000040 	svc	0x00000040
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 800:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 804:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 808:	e12fff1e 	bx	lr

0000080c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 80c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 810:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 814:	e013afa1 	ands	sl, r3, r1, lsr #31
 818:	e24b4034 	sub	r4, fp, #52	; 0x34
 81c:	e3009c78 	movw	r9, #3192	; 0xc78
    neg = 1;
    x = -xx;
 820:	1261e000 	rsbne	lr, r1, #0
 824:	e3409000 	movt	r9, #0
{
 828:	e1a05000 	mov	r5, r0
    neg = 1;
 82c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 830:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 834:	e3a08000 	mov	r8, #0
  b = base;
 838:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 83c:	e3a06001 	mov	r6, #1
{
 840:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 844:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 848:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 84c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 850:	e1a0033e 	lsr	r0, lr, r3
 854:	e2000001 	and	r0, r0, #1
 858:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 85c:	e1520001 	cmp	r2, r1
            r = r - d;
 860:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 864:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 868:	e2533001 	subs	r3, r3, #1
 86c:	2afffff7 	bcs	850 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 870:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 874:	e35c0000 	cmp	ip, #0
 878:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 87c:	e2883001 	add	r3, r8, #1
 880:	e7d91001 	ldrb	r1, [r9, r1]
 884:	e4c71001 	strb	r1, [r7], #1
 888:	11a08003 	movne	r8, r3
 88c:	1affffec 	bne	844 <printint+0x38>
  if(neg)
 890:	e35a0000 	cmp	sl, #0
 894:	0a000004 	beq	8ac <printint+0xa0>
    buf[i++] = '-';
 898:	e24b2024 	sub	r2, fp, #36	; 0x24
 89c:	e3a0102d 	mov	r1, #45	; 0x2d
 8a0:	e0822003 	add	r2, r2, r3
 8a4:	e2883002 	add	r3, r8, #2
 8a8:	e5421010 	strb	r1, [r2, #-16]
 8ac:	e0846003 	add	r6, r4, r3
 8b0:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 8b4:	e3a02001 	mov	r2, #1
 8b8:	e24b1035 	sub	r1, fp, #53	; 0x35
 8bc:	e1a00005 	mov	r0, r5
 8c0:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 8c4:	ebffff00 	bl	4cc <write>

  while(--i >= 0)
 8c8:	e1540006 	cmp	r4, r6
 8cc:	1afffff7 	bne	8b0 <printint+0xa4>
    putc(fd, buf[i]);
}
 8d0:	e24bd020 	sub	sp, fp, #32
 8d4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000008d8 <div>:
{
 8d8:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8dc:	e3a02000 	mov	r2, #0
{
 8e0:	e28db008 	add	fp, sp, #8
 8e4:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 8e8:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 8ec:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 8f0:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 8f4:	e1a0c33e 	lsr	ip, lr, r3
 8f8:	e20cc001 	and	ip, ip, #1
 8fc:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 900:	e1520001 	cmp	r2, r1
            r = r - d;
 904:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 908:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 90c:	e2533001 	subs	r3, r3, #1
 910:	38bd8810 	popcc	{r4, fp, pc}
 914:	eafffff6 	b	8f4 <div+0x1c>

00000918 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 918:	e92d000e 	push	{r1, r2, r3}
 91c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 920:	e28db018 	add	fp, sp, #24
 924:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 928:	e59b5004 	ldr	r5, [fp, #4]
 92c:	e5d54000 	ldrb	r4, [r5]
 930:	e3540000 	cmp	r4, #0
 934:	0a00002b 	beq	9e8 <printf+0xd0>
 938:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 93c:	e28b8008 	add	r8, fp, #8
  state = 0;
 940:	e3a06000 	mov	r6, #0
 944:	ea00000a 	b	974 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 948:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 94c:	01a06004 	moveq	r6, r4
      if(c == '%'){
 950:	0a000004 	beq	968 <printf+0x50>
 954:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 958:	e3a02001 	mov	r2, #1
 95c:	e1a00007 	mov	r0, r7
 960:	e5614006 	strb	r4, [r1, #-6]!
 964:	ebfffed8 	bl	4cc <write>
  for(i = 0; fmt[i]; i++){
 968:	e5f54001 	ldrb	r4, [r5, #1]!
 96c:	e3540000 	cmp	r4, #0
 970:	0a00001c 	beq	9e8 <printf+0xd0>
    if(state == 0){
 974:	e3560000 	cmp	r6, #0
 978:	0afffff2 	beq	948 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 97c:	e3560025 	cmp	r6, #37	; 0x25
 980:	1afffff8 	bne	968 <printf+0x50>
      if(c == 'd'){
 984:	e3540064 	cmp	r4, #100	; 0x64
 988:	0a000030 	beq	a50 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 98c:	e20430f7 	and	r3, r4, #247	; 0xf7
 990:	e3530070 	cmp	r3, #112	; 0x70
 994:	0a000017 	beq	9f8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 998:	e3540073 	cmp	r4, #115	; 0x73
 99c:	0a00001c 	beq	a14 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9a0:	e3540063 	cmp	r4, #99	; 0x63
 9a4:	0a000037 	beq	a88 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9a8:	e3540025 	cmp	r4, #37	; 0x25
 9ac:	0a00002e 	beq	a6c <printf+0x154>
  write(fd, &c, 1);
 9b0:	e3a02001 	mov	r2, #1
 9b4:	e24b1019 	sub	r1, fp, #25
 9b8:	e1a00007 	mov	r0, r7
 9bc:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 9c0:	ebfffec1 	bl	4cc <write>
 9c4:	e3a02001 	mov	r2, #1
 9c8:	e24b101a 	sub	r1, fp, #26
 9cc:	e1a00007 	mov	r0, r7
 9d0:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9d4:	ebfffebc 	bl	4cc <write>
  for(i = 0; fmt[i]; i++){
 9d8:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9dc:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 9e0:	e3540000 	cmp	r4, #0
 9e4:	1affffe2 	bne	974 <printf+0x5c>
    }
  }
}
 9e8:	e24bd018 	sub	sp, fp, #24
 9ec:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9f0:	e28dd00c 	add	sp, sp, #12
 9f4:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 9f8:	e3a03000 	mov	r3, #0
 9fc:	e3a02010 	mov	r2, #16
 a00:	e4981004 	ldr	r1, [r8], #4
 a04:	e1a00007 	mov	r0, r7
 a08:	ebffff7f 	bl	80c <printint>
      state = 0;
 a0c:	e3a06000 	mov	r6, #0
 a10:	eaffffd4 	b	968 <printf+0x50>
        s = (char*)*ap;
 a14:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 a18:	e3540000 	cmp	r4, #0
 a1c:	0a000021 	beq	aa8 <printf+0x190>
        while(*s != 0){
 a20:	e5d46000 	ldrb	r6, [r4]
 a24:	e3560000 	cmp	r6, #0
 a28:	0affffce 	beq	968 <printf+0x50>
  write(fd, &c, 1);
 a2c:	e3a02001 	mov	r2, #1
 a30:	e24b101d 	sub	r1, fp, #29
 a34:	e1a00007 	mov	r0, r7
 a38:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 a3c:	ebfffea2 	bl	4cc <write>
        while(*s != 0){
 a40:	e5f46001 	ldrb	r6, [r4, #1]!
 a44:	e3560000 	cmp	r6, #0
 a48:	1afffff7 	bne	a2c <printf+0x114>
 a4c:	eaffffc5 	b	968 <printf+0x50>
        printint(fd, *ap, 10, 1);
 a50:	e3a03001 	mov	r3, #1
 a54:	e3a0200a 	mov	r2, #10
 a58:	e4981004 	ldr	r1, [r8], #4
 a5c:	e1a00007 	mov	r0, r7
 a60:	ebffff69 	bl	80c <printint>
      state = 0;
 a64:	e3a06000 	mov	r6, #0
 a68:	eaffffbe 	b	968 <printf+0x50>
 a6c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a70:	e3a02001 	mov	r2, #1
 a74:	e1a00007 	mov	r0, r7
 a78:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 a7c:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 a80:	ebfffe91 	bl	4cc <write>
 a84:	eaffffb7 	b	968 <printf+0x50>
        putc(fd, *ap);
 a88:	e4983004 	ldr	r3, [r8], #4
 a8c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 a90:	e3a02001 	mov	r2, #1
 a94:	e1a00007 	mov	r0, r7
      state = 0;
 a98:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 a9c:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 aa0:	ebfffe89 	bl	4cc <write>
 aa4:	eaffffaf 	b	968 <printf+0x50>
          s = "(null)";
 aa8:	e3004c8c 	movw	r4, #3212	; 0xc8c
        while(*s != 0){
 aac:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 ab0:	e3404000 	movt	r4, #0
 ab4:	eaffffdc 	b	a2c <printf+0x114>

00000ab8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab8:	e300cc94 	movw	ip, #3220	; 0xc94
 abc:	e340c000 	movt	ip, #0
{
 ac0:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 ac4:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac8:	e59c3000 	ldr	r3, [ip]
{
 acc:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad0:	e1530001 	cmp	r3, r1
 ad4:	e5932000 	ldr	r2, [r3]
 ad8:	2a000017 	bcs	b3c <free+0x84>
 adc:	e1510002 	cmp	r1, r2
 ae0:	3a000001 	bcc	aec <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae4:	e1530002 	cmp	r3, r2
 ae8:	3a000017 	bcc	b4c <free+0x94>
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
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b3c:	e1530002 	cmp	r3, r2
 b40:	3a000001 	bcc	b4c <free+0x94>
 b44:	e1510002 	cmp	r1, r2
 b48:	3affffe7 	bcc	aec <free+0x34>
{
 b4c:	e1a03002 	mov	r3, r2
 b50:	eaffffde 	b	ad0 <free+0x18>

00000b54 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b54:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b58:	e3007c94 	movw	r7, #3220	; 0xc94
 b5c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b60:	e2804007 	add	r4, r0, #7
{
 b64:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 b68:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b6c:	e1a041a4 	lsr	r4, r4, #3
 b70:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b74:	e3530000 	cmp	r3, #0
 b78:	0a000027 	beq	c1c <malloc+0xc8>
 b7c:	e5930000 	ldr	r0, [r3]
 b80:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b84:	e1540002 	cmp	r4, r2
 b88:	9a000019 	bls	bf4 <malloc+0xa0>
 b8c:	e3540a01 	cmp	r4, #4096	; 0x1000
 b90:	21a05004 	movcs	r5, r4
 b94:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 b98:	e1a06185 	lsl	r6, r5, #3
 b9c:	ea000003 	b	bb0 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ba4:	e5902004 	ldr	r2, [r0, #4]
 ba8:	e1520004 	cmp	r2, r4
 bac:	2a000010 	bcs	bf4 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bb0:	e5972000 	ldr	r2, [r7]
 bb4:	e1a03000 	mov	r3, r0
 bb8:	e1520000 	cmp	r2, r0
 bbc:	1afffff7 	bne	ba0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 bc0:	e1a00006 	mov	r0, r6
 bc4:	ebfffee9 	bl	770 <sbrk>
 bc8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 bcc:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 bd0:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 bd4:	0a000004 	beq	bec <malloc+0x98>
  hp->s.size = nu;
 bd8:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 bdc:	ebffffb5 	bl	ab8 <free>
  return freep;
 be0:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 be4:	e3530000 	cmp	r3, #0
 be8:	1affffec 	bne	ba0 <malloc+0x4c>
        return 0;
 bec:	e3a00000 	mov	r0, #0
  }
}
 bf0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 bf4:	e1540002 	cmp	r4, r2
      freep = prevp;
 bf8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 bfc:	10422004 	subne	r2, r2, r4
 c00:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 c04:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 c08:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 c0c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 c10:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 c14:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 c18:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 c1c:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 c20:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 c24:	e5870000 	str	r0, [r7]
 c28:	e5870004 	str	r0, [r7, #4]
 c2c:	eaffffd6 	b	b8c <malloc+0x38>
