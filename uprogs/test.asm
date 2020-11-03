
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
	if(fd > 0)
		close(fd);
	exit();
}

int main(int argc, char *argv[]) {
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   4:	e1a06000 	mov	r6, r0
   8:	e28db014 	add	fp, sp, #20
	int i;
	buf = malloc(512*sizeof(buf));	
   c:	e3a00b02 	mov	r0, #2048	; 0x800
int main(int argc, char *argv[]) {
  10:	e1a04001 	mov	r4, r1
	buf = malloc(512*sizeof(buf));	
  14:	eb0002e4 	bl	bac <malloc>
  18:	e3005d5c 	movw	r5, #3420	; 0xd5c
  1c:	e3405000 	movt	r5, #0
  20:	e5850000 	str	r0, [r5]


	if(mkdir("dev") != 0){
  24:	e3000c88 	movw	r0, #3208	; 0xc88
  28:	e3400000 	movt	r0, #0
  2c:	eb0001ac 	bl	6e4 <mkdir>
  30:	e3500000 	cmp	r0, #0
  34:	1a000032 	bne	104 <main+0x104>
		printf(1,"did not make dev\n");
	}
	if(chdir("dev") < 0){
  38:	e3000c88 	movw	r0, #3208	; 0xc88
  3c:	e3400000 	movt	r0, #0
  40:	eb0001b4 	bl	718 <chdir>
  44:	e3500000 	cmp	r0, #0
  48:	ba000042 	blt	158 <main+0x158>
		printf(1,"could not change dir into dev\n");
	}

	if(argc < 1) {
  4c:	e3560000 	cmp	r6, #0
  50:	da000030 	ble	118 <main+0x118>
		printf(1,"Usage: test filepath\n");
		clean();
	}
	
	if(mknod(argv[1],15,15) < 0) {
  54:	e3a0200f 	mov	r2, #15
  58:	e5940004 	ldr	r0, [r4, #4]
  5c:	e1a01002 	mov	r1, r2
  60:	eb00016b 	bl	614 <mknod>
  64:	e3500000 	cmp	r0, #0
  68:	ba00002f 	blt	12c <main+0x12c>
		printf(1,"mknod failure");
		clean();
	}
	

	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  6c:	e3a01002 	mov	r1, #2
  70:	e5940004 	ldr	r0, [r4, #4]
  74:	eb000159 	bl	5e0 <open>
  78:	e3007d58 	movw	r7, #3416	; 0xd58
  7c:	e3407000 	movt	r7, #0
  80:	e3500000 	cmp	r0, #0
  84:	e5870000 	str	r0, [r7]
  88:	ba00002c 	blt	140 <main+0x140>
		printf(1,"Could not open %s \n", argv[1]);
		clean();
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  8c:	e1a03000 	mov	r3, r0
  90:	e5942004 	ldr	r2, [r4, #4]
  94:	e3a00001 	mov	r0, #1
  98:	e3001cfc 	movw	r1, #3324	; 0xcfc
  9c:	e3401000 	movt	r1, #0


	read(fd, buf, 512);
	for(i=0;i<512;i++){
		printf(1, "%d", buf[i]);
  a0:	e3006d10 	movw	r6, #3344	; 0xd10
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  a4:	eb000231 	bl	970 <printf>
	read(fd, buf, 512);
  a8:	e5970000 	ldr	r0, [r7]
  ac:	e3a02c02 	mov	r2, #512	; 0x200
  b0:	e5951000 	ldr	r1, [r5]
  b4:	eb000108 	bl	4dc <read>
		printf(1, "%d", buf[i]);
  b8:	e3406000 	movt	r6, #0
	for(i=0;i<512;i++){
  bc:	e3a04000 	mov	r4, #0
		printf(1, "%d", buf[i]);
  c0:	e5953000 	ldr	r3, [r5]
  c4:	e3a00001 	mov	r0, #1
  c8:	e1a01006 	mov	r1, r6
  cc:	e7d32004 	ldrb	r2, [r3, r4]
	for(i=0;i<512;i++){
  d0:	e0844000 	add	r4, r4, r0
		printf(1, "%d", buf[i]);
  d4:	eb000225 	bl	970 <printf>
	for(i=0;i<512;i++){
  d8:	e3540c02 	cmp	r4, #512	; 0x200
  dc:	1afffff7 	bne	c0 <main+0xc0>
	}
	printf(1,"\n");
  e0:	e3a00001 	mov	r0, #1
  e4:	e3001cd4 	movw	r1, #3284	; 0xcd4
  e8:	e3401000 	movt	r1, #0
  ec:	eb00021f 	bl	970 <printf>
	printf(1,"somehow we left the looop\n");
  f0:	e3001d14 	movw	r1, #3348	; 0xd14
  f4:	e3a00001 	mov	r0, #1
  f8:	e3401000 	movt	r1, #0
  fc:	eb00021b 	bl	970 <printf>
 
	clean();
 100:	eb000019 	bl	16c <clean>
		printf(1,"did not make dev\n");
 104:	e3001c8c 	movw	r1, #3212	; 0xc8c
 108:	e3a00001 	mov	r0, #1
 10c:	e3401000 	movt	r1, #0
 110:	eb000216 	bl	970 <printf>
 114:	eaffffc7 	b	38 <main+0x38>
		printf(1,"Usage: test filepath\n");
 118:	e3001cc0 	movw	r1, #3264	; 0xcc0
 11c:	e3a00001 	mov	r0, #1
 120:	e3401000 	movt	r1, #0
 124:	eb000211 	bl	970 <printf>
		clean();
 128:	eb00000f 	bl	16c <clean>
		printf(1,"mknod failure");
 12c:	e3001cd8 	movw	r1, #3288	; 0xcd8
 130:	e3a00001 	mov	r0, #1
 134:	e3401000 	movt	r1, #0
 138:	eb00020c 	bl	970 <printf>
		clean();
 13c:	eb00000a 	bl	16c <clean>
		printf(1,"Could not open %s \n", argv[1]);
 140:	e5942004 	ldr	r2, [r4, #4]
 144:	e3001ce8 	movw	r1, #3304	; 0xce8
 148:	e3a00001 	mov	r0, #1
 14c:	e3401000 	movt	r1, #0
 150:	eb000206 	bl	970 <printf>
		clean();
 154:	eb000004 	bl	16c <clean>
		printf(1,"could not change dir into dev\n");
 158:	e3001ca0 	movw	r1, #3232	; 0xca0
 15c:	e3a00001 	mov	r0, #1
 160:	e3401000 	movt	r1, #0
 164:	eb000201 	bl	970 <printf>
 168:	eaffffb7 	b	4c <main+0x4c>

0000016c <clean>:
	free(buf);
 16c:	e3003d5c 	movw	r3, #3420	; 0xd5c
 170:	e3403000 	movt	r3, #0
void clean(void){
 174:	e92d4800 	push	{fp, lr}
 178:	e28db004 	add	fp, sp, #4
	free(buf);
 17c:	e5930000 	ldr	r0, [r3]
 180:	eb000262 	bl	b10 <free>
	if(fd > 0)
 184:	e3003d58 	movw	r3, #3416	; 0xd58
 188:	e3403000 	movt	r3, #0
 18c:	e5930000 	ldr	r0, [r3]
 190:	e3500000 	cmp	r0, #0
 194:	da000000 	ble	19c <clean+0x30>
		close(fd);
 198:	eb0000e9 	bl	544 <close>
	exit();
 19c:	eb0000a7 	bl	440 <exit>

000001a0 <strcpy>:
 1a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a4:	e2402001 	sub	r2, r0, #1
 1a8:	e28db000 	add	fp, sp, #0
 1ac:	e4d13001 	ldrb	r3, [r1], #1
 1b0:	e3530000 	cmp	r3, #0
 1b4:	e5e23001 	strb	r3, [r2, #1]!
 1b8:	1afffffb 	bne	1ac <strcpy+0xc>
 1bc:	e28bd000 	add	sp, fp, #0
 1c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1c4:	e12fff1e 	bx	lr

000001c8 <strcmp>:
 1c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1cc:	e28db000 	add	fp, sp, #0
 1d0:	e5d03000 	ldrb	r3, [r0]
 1d4:	e5d12000 	ldrb	r2, [r1]
 1d8:	e3530000 	cmp	r3, #0
 1dc:	1a000004 	bne	1f4 <strcmp+0x2c>
 1e0:	ea000005 	b	1fc <strcmp+0x34>
 1e4:	e5f03001 	ldrb	r3, [r0, #1]!
 1e8:	e3530000 	cmp	r3, #0
 1ec:	0a000006 	beq	20c <strcmp+0x44>
 1f0:	e5f12001 	ldrb	r2, [r1, #1]!
 1f4:	e1530002 	cmp	r3, r2
 1f8:	0afffff9 	beq	1e4 <strcmp+0x1c>
 1fc:	e0430002 	sub	r0, r3, r2
 200:	e28bd000 	add	sp, fp, #0
 204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 208:	e12fff1e 	bx	lr
 20c:	e5d12001 	ldrb	r2, [r1, #1]
 210:	e0430002 	sub	r0, r3, r2
 214:	e28bd000 	add	sp, fp, #0
 218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 21c:	e12fff1e 	bx	lr

00000220 <strlen>:
 220:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 224:	e28db000 	add	fp, sp, #0
 228:	e5d03000 	ldrb	r3, [r0]
 22c:	e3530000 	cmp	r3, #0
 230:	0a000009 	beq	25c <strlen+0x3c>
 234:	e1a02000 	mov	r2, r0
 238:	e3a03000 	mov	r3, #0
 23c:	e5f21001 	ldrb	r1, [r2, #1]!
 240:	e2833001 	add	r3, r3, #1
 244:	e3510000 	cmp	r1, #0
 248:	e1a00003 	mov	r0, r3
 24c:	1afffffa 	bne	23c <strlen+0x1c>
 250:	e28bd000 	add	sp, fp, #0
 254:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 258:	e12fff1e 	bx	lr
 25c:	e1a00003 	mov	r0, r3
 260:	eafffffa 	b	250 <strlen+0x30>

00000264 <memset>:
 264:	e3520000 	cmp	r2, #0
 268:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 26c:	e28db000 	add	fp, sp, #0
 270:	0a000004 	beq	288 <memset+0x24>
 274:	e6ef1071 	uxtb	r1, r1
 278:	e0802002 	add	r2, r0, r2
 27c:	e4c01001 	strb	r1, [r0], #1
 280:	e1520000 	cmp	r2, r0
 284:	1afffffc 	bne	27c <memset+0x18>
 288:	e28bd000 	add	sp, fp, #0
 28c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 290:	e12fff1e 	bx	lr

00000294 <strchr>:
 294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 298:	e28db000 	add	fp, sp, #0
 29c:	e5d02000 	ldrb	r2, [r0]
 2a0:	e3520000 	cmp	r2, #0
 2a4:	0a00000b 	beq	2d8 <strchr+0x44>
 2a8:	e1510002 	cmp	r1, r2
 2ac:	1a000002 	bne	2bc <strchr+0x28>
 2b0:	ea000005 	b	2cc <strchr+0x38>
 2b4:	e1530001 	cmp	r3, r1
 2b8:	0a000003 	beq	2cc <strchr+0x38>
 2bc:	e5f03001 	ldrb	r3, [r0, #1]!
 2c0:	e3530000 	cmp	r3, #0
 2c4:	1afffffa 	bne	2b4 <strchr+0x20>
 2c8:	e1a00003 	mov	r0, r3
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d4:	e12fff1e 	bx	lr
 2d8:	e1a00002 	mov	r0, r2
 2dc:	eafffffa 	b	2cc <strchr+0x38>

000002e0 <gets>:
 2e0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2e4:	e1a08000 	mov	r8, r0
 2e8:	e28db018 	add	fp, sp, #24
 2ec:	e1a07001 	mov	r7, r1
 2f0:	e24dd00c 	sub	sp, sp, #12
 2f4:	e2406001 	sub	r6, r0, #1
 2f8:	e3a05000 	mov	r5, #0
 2fc:	ea000008 	b	324 <gets+0x44>
 300:	eb000075 	bl	4dc <read>
 304:	e3500000 	cmp	r0, #0
 308:	da00000b 	ble	33c <gets+0x5c>
 30c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 310:	e1a05004 	mov	r5, r4
 314:	e353000d 	cmp	r3, #13
 318:	1353000a 	cmpne	r3, #10
 31c:	e5e63001 	strb	r3, [r6, #1]!
 320:	0a000005 	beq	33c <gets+0x5c>
 324:	e3a02001 	mov	r2, #1
 328:	e0854002 	add	r4, r5, r2
 32c:	e1540007 	cmp	r4, r7
 330:	e24b101d 	sub	r1, fp, #29
 334:	e3a00000 	mov	r0, #0
 338:	bafffff0 	blt	300 <gets+0x20>
 33c:	e3a03000 	mov	r3, #0
 340:	e1a00008 	mov	r0, r8
 344:	e7c83005 	strb	r3, [r8, r5]
 348:	e24bd018 	sub	sp, fp, #24
 34c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000350 <stat>:
 350:	e92d4830 	push	{r4, r5, fp, lr}
 354:	e1a04001 	mov	r4, r1
 358:	e28db00c 	add	fp, sp, #12
 35c:	e3a01000 	mov	r1, #0
 360:	eb00009e 	bl	5e0 <open>
 364:	e2505000 	subs	r5, r0, #0
 368:	ba000006 	blt	388 <stat+0x38>
 36c:	e1a01004 	mov	r1, r4
 370:	eb0000c1 	bl	67c <fstat>
 374:	e1a04000 	mov	r4, r0
 378:	e1a00005 	mov	r0, r5
 37c:	eb000070 	bl	544 <close>
 380:	e1a00004 	mov	r0, r4
 384:	e8bd8830 	pop	{r4, r5, fp, pc}
 388:	e3e04000 	mvn	r4, #0
 38c:	eafffffb 	b	380 <stat+0x30>

00000390 <atoi>:
 390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 394:	e28db000 	add	fp, sp, #0
 398:	e5d02000 	ldrb	r2, [r0]
 39c:	e2423030 	sub	r3, r2, #48	; 0x30
 3a0:	e3530009 	cmp	r3, #9
 3a4:	e3a03000 	mov	r3, #0
 3a8:	8a000006 	bhi	3c8 <atoi+0x38>
 3ac:	e3a0c00a 	mov	ip, #10
 3b0:	e023239c 	mla	r3, ip, r3, r2
 3b4:	e5f02001 	ldrb	r2, [r0, #1]!
 3b8:	e2421030 	sub	r1, r2, #48	; 0x30
 3bc:	e3510009 	cmp	r1, #9
 3c0:	e2433030 	sub	r3, r3, #48	; 0x30
 3c4:	9afffff9 	bls	3b0 <atoi+0x20>
 3c8:	e1a00003 	mov	r0, r3
 3cc:	e28bd000 	add	sp, fp, #0
 3d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d4:	e12fff1e 	bx	lr

000003d8 <memmove>:
 3d8:	e3520000 	cmp	r2, #0
 3dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3e0:	e28db000 	add	fp, sp, #0
 3e4:	da000005 	ble	400 <memmove+0x28>
 3e8:	e0812002 	add	r2, r1, r2
 3ec:	e2403001 	sub	r3, r0, #1
 3f0:	e4d1c001 	ldrb	ip, [r1], #1
 3f4:	e1510002 	cmp	r1, r2
 3f8:	e5e3c001 	strb	ip, [r3, #1]!
 3fc:	1afffffb 	bne	3f0 <memmove+0x18>
 400:	e28bd000 	add	sp, fp, #0
 404:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 408:	e12fff1e 	bx	lr

0000040c <fork>:
 40c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 410:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 414:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 418:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 41c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 420:	e3a00001 	mov	r0, #1
 424:	ef000040 	svc	0x00000040
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 434:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 43c:	e12fff1e 	bx	lr

00000440 <exit>:
 440:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 444:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 448:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 44c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 450:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 454:	e3a00002 	mov	r0, #2
 458:	ef000040 	svc	0x00000040
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 468:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 46c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 470:	e12fff1e 	bx	lr

00000474 <wait>:
 474:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 478:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 47c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 480:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 484:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 488:	e3a00003 	mov	r0, #3
 48c:	ef000040 	svc	0x00000040
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 49c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a4:	e12fff1e 	bx	lr

000004a8 <pipe>:
 4a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4bc:	e3a00004 	mov	r0, #4
 4c0:	ef000040 	svc	0x00000040
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d8:	e12fff1e 	bx	lr

000004dc <read>:
 4dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f0:	e3a00005 	mov	r0, #5
 4f4:	ef000040 	svc	0x00000040
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 504:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 50c:	e12fff1e 	bx	lr

00000510 <write>:
 510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 514:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 518:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 51c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 520:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 524:	e3a00010 	mov	r0, #16
 528:	ef000040 	svc	0x00000040
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 538:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 53c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 540:	e12fff1e 	bx	lr

00000544 <close>:
 544:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 548:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 54c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 550:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 554:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 558:	e3a00015 	mov	r0, #21
 55c:	ef000040 	svc	0x00000040
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 56c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 570:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 574:	e12fff1e 	bx	lr

00000578 <kill>:
 578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 57c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 580:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 584:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 588:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 58c:	e3a00006 	mov	r0, #6
 590:	ef000040 	svc	0x00000040
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a8:	e12fff1e 	bx	lr

000005ac <exec>:
 5ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c0:	e3a00007 	mov	r0, #7
 5c4:	ef000040 	svc	0x00000040
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5dc:	e12fff1e 	bx	lr

000005e0 <open>:
 5e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f4:	e3a0000f 	mov	r0, #15
 5f8:	ef000040 	svc	0x00000040
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 608:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 60c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 610:	e12fff1e 	bx	lr

00000614 <mknod>:
 614:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 618:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 61c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 620:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 624:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 628:	e3a00011 	mov	r0, #17
 62c:	ef000040 	svc	0x00000040
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 63c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 640:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 644:	e12fff1e 	bx	lr

00000648 <unlink>:
 648:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 64c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 650:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 654:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 658:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 65c:	e3a00012 	mov	r0, #18
 660:	ef000040 	svc	0x00000040
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 670:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 674:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 678:	e12fff1e 	bx	lr

0000067c <fstat>:
 67c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 680:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 684:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 688:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 68c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 690:	e3a00008 	mov	r0, #8
 694:	ef000040 	svc	0x00000040
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ac:	e12fff1e 	bx	lr

000006b0 <link>:
 6b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c4:	e3a00013 	mov	r0, #19
 6c8:	ef000040 	svc	0x00000040
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e0:	e12fff1e 	bx	lr

000006e4 <mkdir>:
 6e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f8:	e3a00014 	mov	r0, #20
 6fc:	ef000040 	svc	0x00000040
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 70c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 710:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 714:	e12fff1e 	bx	lr

00000718 <chdir>:
 718:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 71c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 720:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 724:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 728:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 72c:	e3a00009 	mov	r0, #9
 730:	ef000040 	svc	0x00000040
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 740:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 744:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 748:	e12fff1e 	bx	lr

0000074c <dup>:
 74c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 750:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 754:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 758:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 75c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 760:	e3a0000a 	mov	r0, #10
 764:	ef000040 	svc	0x00000040
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 770:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 774:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 778:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 77c:	e12fff1e 	bx	lr

00000780 <getpid>:
 780:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 784:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 788:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 78c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 790:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 794:	e3a0000b 	mov	r0, #11
 798:	ef000040 	svc	0x00000040
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b0:	e12fff1e 	bx	lr

000007b4 <sbrk>:
 7b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c8:	e3a0000c 	mov	r0, #12
 7cc:	ef000040 	svc	0x00000040
 7d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e4:	e12fff1e 	bx	lr

000007e8 <sleep>:
 7e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7fc:	e3a0000d 	mov	r0, #13
 800:	ef000040 	svc	0x00000040
 804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 808:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 80c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 810:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 814:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 818:	e12fff1e 	bx	lr

0000081c <uptime>:
 81c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 820:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 824:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 828:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 82c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 830:	e3a0000e 	mov	r0, #14
 834:	ef000040 	svc	0x00000040
 838:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 83c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 840:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 844:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 848:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 84c:	e12fff1e 	bx	lr

00000850 <printint>:
 850:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 854:	e1a09fa1 	lsr	r9, r1, #31
 858:	e3530000 	cmp	r3, #0
 85c:	03a09000 	moveq	r9, #0
 860:	12099001 	andne	r9, r9, #1
 864:	e28db01c 	add	fp, sp, #28
 868:	e3590000 	cmp	r9, #0
 86c:	e3008d30 	movw	r8, #3376	; 0xd30
 870:	1261e000 	rsbne	lr, r1, #0
 874:	e3408000 	movt	r8, #0
 878:	e24b602d 	sub	r6, fp, #45	; 0x2d
 87c:	e1a04000 	mov	r4, r0
 880:	13a09001 	movne	r9, #1
 884:	01a0e001 	moveq	lr, r1
 888:	e3a07000 	mov	r7, #0
 88c:	e3a05001 	mov	r5, #1
 890:	e24dd018 	sub	sp, sp, #24
 894:	e3a0c000 	mov	ip, #0
 898:	e3a0301f 	mov	r3, #31
 89c:	e1a0100c 	mov	r1, ip
 8a0:	e1a0033e 	lsr	r0, lr, r3
 8a4:	e2000001 	and	r0, r0, #1
 8a8:	e1801081 	orr	r1, r0, r1, lsl #1
 8ac:	e1520001 	cmp	r2, r1
 8b0:	90411002 	subls	r1, r1, r2
 8b4:	918cc315 	orrls	ip, ip, r5, lsl r3
 8b8:	e2533001 	subs	r3, r3, #1
 8bc:	2afffff7 	bcs	8a0 <printint+0x50>
 8c0:	e061e29c 	mls	r1, ip, r2, lr
 8c4:	e35c0000 	cmp	ip, #0
 8c8:	e1a0e00c 	mov	lr, ip
 8cc:	e2873001 	add	r3, r7, #1
 8d0:	e7d81001 	ldrb	r1, [r8, r1]
 8d4:	e5e61001 	strb	r1, [r6, #1]!
 8d8:	11a07003 	movne	r7, r3
 8dc:	1affffec 	bne	894 <printint+0x44>
 8e0:	e3590000 	cmp	r9, #0
 8e4:	124b201c 	subne	r2, fp, #28
 8e8:	10822003 	addne	r2, r2, r3
 8ec:	13a0102d 	movne	r1, #45	; 0x2d
 8f0:	12873002 	addne	r3, r7, #2
 8f4:	15421010 	strbne	r1, [r2, #-16]
 8f8:	e24b202c 	sub	r2, fp, #44	; 0x2c
 8fc:	e2435001 	sub	r5, r3, #1
 900:	e0826003 	add	r6, r2, r3
 904:	e5763001 	ldrb	r3, [r6, #-1]!
 908:	e2455001 	sub	r5, r5, #1
 90c:	e3a02001 	mov	r2, #1
 910:	e24b102d 	sub	r1, fp, #45	; 0x2d
 914:	e1a00004 	mov	r0, r4
 918:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 91c:	ebfffefb 	bl	510 <write>
 920:	e3750001 	cmn	r5, #1
 924:	1afffff6 	bne	904 <printint+0xb4>
 928:	e24bd01c 	sub	sp, fp, #28
 92c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000930 <div>:
 930:	e92d4810 	push	{r4, fp, lr}
 934:	e3a02000 	mov	r2, #0
 938:	e28db008 	add	fp, sp, #8
 93c:	e1a0e000 	mov	lr, r0
 940:	e3a0301f 	mov	r3, #31
 944:	e1a00002 	mov	r0, r2
 948:	e3a04001 	mov	r4, #1
 94c:	e1a0c33e 	lsr	ip, lr, r3
 950:	e20cc001 	and	ip, ip, #1
 954:	e18c2082 	orr	r2, ip, r2, lsl #1
 958:	e1520001 	cmp	r2, r1
 95c:	20422001 	subcs	r2, r2, r1
 960:	21800314 	orrcs	r0, r0, r4, lsl r3
 964:	e2533001 	subs	r3, r3, #1
 968:	2afffff7 	bcs	94c <div+0x1c>
 96c:	e8bd8810 	pop	{r4, fp, pc}

00000970 <printf>:
 970:	e92d000e 	push	{r1, r2, r3}
 974:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 978:	e28db018 	add	fp, sp, #24
 97c:	e24dd008 	sub	sp, sp, #8
 980:	e59b6004 	ldr	r6, [fp, #4]
 984:	e5d64000 	ldrb	r4, [r6]
 988:	e3540000 	cmp	r4, #0
 98c:	0a00002b 	beq	a40 <printf+0xd0>
 990:	e1a07000 	mov	r7, r0
 994:	e28b8008 	add	r8, fp, #8
 998:	e3a05000 	mov	r5, #0
 99c:	ea00000a 	b	9cc <printf+0x5c>
 9a0:	e3540025 	cmp	r4, #37	; 0x25
 9a4:	01a05004 	moveq	r5, r4
 9a8:	0a000004 	beq	9c0 <printf+0x50>
 9ac:	e24b1018 	sub	r1, fp, #24
 9b0:	e3a02001 	mov	r2, #1
 9b4:	e1a00007 	mov	r0, r7
 9b8:	e5614006 	strb	r4, [r1, #-6]!
 9bc:	ebfffed3 	bl	510 <write>
 9c0:	e5f64001 	ldrb	r4, [r6, #1]!
 9c4:	e3540000 	cmp	r4, #0
 9c8:	0a00001c 	beq	a40 <printf+0xd0>
 9cc:	e3550000 	cmp	r5, #0
 9d0:	0afffff2 	beq	9a0 <printf+0x30>
 9d4:	e3550025 	cmp	r5, #37	; 0x25
 9d8:	1afffff8 	bne	9c0 <printf+0x50>
 9dc:	e3540064 	cmp	r4, #100	; 0x64
 9e0:	0a000037 	beq	ac4 <printf+0x154>
 9e4:	e20430f7 	and	r3, r4, #247	; 0xf7
 9e8:	e3530070 	cmp	r3, #112	; 0x70
 9ec:	0a000017 	beq	a50 <printf+0xe0>
 9f0:	e3540073 	cmp	r4, #115	; 0x73
 9f4:	0a00001c 	beq	a6c <printf+0xfc>
 9f8:	e3540063 	cmp	r4, #99	; 0x63
 9fc:	0a000037 	beq	ae0 <printf+0x170>
 a00:	e3540025 	cmp	r4, #37	; 0x25
 a04:	0a000027 	beq	aa8 <printf+0x138>
 a08:	e3a02001 	mov	r2, #1
 a0c:	e24b1019 	sub	r1, fp, #25
 a10:	e1a00007 	mov	r0, r7
 a14:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a18:	ebfffebc 	bl	510 <write>
 a1c:	e3a02001 	mov	r2, #1
 a20:	e24b101a 	sub	r1, fp, #26
 a24:	e1a00007 	mov	r0, r7
 a28:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a2c:	ebfffeb7 	bl	510 <write>
 a30:	e5f64001 	ldrb	r4, [r6, #1]!
 a34:	e3a05000 	mov	r5, #0
 a38:	e3540000 	cmp	r4, #0
 a3c:	1affffe2 	bne	9cc <printf+0x5c>
 a40:	e24bd018 	sub	sp, fp, #24
 a44:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a48:	e28dd00c 	add	sp, sp, #12
 a4c:	e12fff1e 	bx	lr
 a50:	e3a03000 	mov	r3, #0
 a54:	e3a02010 	mov	r2, #16
 a58:	e4981004 	ldr	r1, [r8], #4
 a5c:	e1a00007 	mov	r0, r7
 a60:	ebffff7a 	bl	850 <printint>
 a64:	e3a05000 	mov	r5, #0
 a68:	eaffffd4 	b	9c0 <printf+0x50>
 a6c:	e4984004 	ldr	r4, [r8], #4
 a70:	e3540000 	cmp	r4, #0
 a74:	0a000021 	beq	b00 <printf+0x190>
 a78:	e5d45000 	ldrb	r5, [r4]
 a7c:	e3550000 	cmp	r5, #0
 a80:	0affffce 	beq	9c0 <printf+0x50>
 a84:	e3a02001 	mov	r2, #1
 a88:	e24b101d 	sub	r1, fp, #29
 a8c:	e1a00007 	mov	r0, r7
 a90:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a94:	ebfffe9d 	bl	510 <write>
 a98:	e5f45001 	ldrb	r5, [r4, #1]!
 a9c:	e3550000 	cmp	r5, #0
 aa0:	1afffff7 	bne	a84 <printf+0x114>
 aa4:	eaffffc5 	b	9c0 <printf+0x50>
 aa8:	e24b1018 	sub	r1, fp, #24
 aac:	e3a02001 	mov	r2, #1
 ab0:	e1a00007 	mov	r0, r7
 ab4:	e5615003 	strb	r5, [r1, #-3]!
 ab8:	e3a05000 	mov	r5, #0
 abc:	ebfffe93 	bl	510 <write>
 ac0:	eaffffbe 	b	9c0 <printf+0x50>
 ac4:	e3a03001 	mov	r3, #1
 ac8:	e3a0200a 	mov	r2, #10
 acc:	e4981004 	ldr	r1, [r8], #4
 ad0:	e1a00007 	mov	r0, r7
 ad4:	ebffff5d 	bl	850 <printint>
 ad8:	e3a05000 	mov	r5, #0
 adc:	eaffffb7 	b	9c0 <printf+0x50>
 ae0:	e4983004 	ldr	r3, [r8], #4
 ae4:	e24b1018 	sub	r1, fp, #24
 ae8:	e3a02001 	mov	r2, #1
 aec:	e1a00007 	mov	r0, r7
 af0:	e3a05000 	mov	r5, #0
 af4:	e5613004 	strb	r3, [r1, #-4]!
 af8:	ebfffe84 	bl	510 <write>
 afc:	eaffffaf 	b	9c0 <printf+0x50>
 b00:	e3004d44 	movw	r4, #3396	; 0xd44
 b04:	e3a05028 	mov	r5, #40	; 0x28
 b08:	e3404000 	movt	r4, #0
 b0c:	eaffffdc 	b	a84 <printf+0x114>

00000b10 <free>:
 b10:	e300cd4c 	movw	ip, #3404	; 0xd4c
 b14:	e340c000 	movt	ip, #0
 b18:	e92d4810 	push	{r4, fp, lr}
 b1c:	e2401008 	sub	r1, r0, #8
 b20:	e28db008 	add	fp, sp, #8
 b24:	e59c3000 	ldr	r3, [ip]
 b28:	ea000004 	b	b40 <free+0x30>
 b2c:	e1510002 	cmp	r1, r2
 b30:	3a000009 	bcc	b5c <free+0x4c>
 b34:	e1530002 	cmp	r3, r2
 b38:	2a000007 	bcs	b5c <free+0x4c>
 b3c:	e1a03002 	mov	r3, r2
 b40:	e1530001 	cmp	r3, r1
 b44:	e5932000 	ldr	r2, [r3]
 b48:	3afffff7 	bcc	b2c <free+0x1c>
 b4c:	e1530002 	cmp	r3, r2
 b50:	3afffff9 	bcc	b3c <free+0x2c>
 b54:	e1510002 	cmp	r1, r2
 b58:	2afffff7 	bcs	b3c <free+0x2c>
 b5c:	e510e004 	ldr	lr, [r0, #-4]
 b60:	e58c3000 	str	r3, [ip]
 b64:	e081418e 	add	r4, r1, lr, lsl #3
 b68:	e1520004 	cmp	r2, r4
 b6c:	05922004 	ldreq	r2, [r2, #4]
 b70:	0082e00e 	addeq	lr, r2, lr
 b74:	0500e004 	streq	lr, [r0, #-4]
 b78:	05932000 	ldreq	r2, [r3]
 b7c:	05922000 	ldreq	r2, [r2]
 b80:	e5002008 	str	r2, [r0, #-8]
 b84:	e5932004 	ldr	r2, [r3, #4]
 b88:	e083e182 	add	lr, r3, r2, lsl #3
 b8c:	e151000e 	cmp	r1, lr
 b90:	15831000 	strne	r1, [r3]
 b94:	05101004 	ldreq	r1, [r0, #-4]
 b98:	00812002 	addeq	r2, r1, r2
 b9c:	05832004 	streq	r2, [r3, #4]
 ba0:	05102008 	ldreq	r2, [r0, #-8]
 ba4:	05832000 	streq	r2, [r3]
 ba8:	e8bd8810 	pop	{r4, fp, pc}

00000bac <malloc>:
 bac:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 bb0:	e3007d4c 	movw	r7, #3404	; 0xd4c
 bb4:	e3407000 	movt	r7, #0
 bb8:	e2804007 	add	r4, r0, #7
 bbc:	e28db014 	add	fp, sp, #20
 bc0:	e5973000 	ldr	r3, [r7]
 bc4:	e1a041a4 	lsr	r4, r4, #3
 bc8:	e2844001 	add	r4, r4, #1
 bcc:	e3530000 	cmp	r3, #0
 bd0:	0a000027 	beq	c74 <malloc+0xc8>
 bd4:	e5930000 	ldr	r0, [r3]
 bd8:	e5902004 	ldr	r2, [r0, #4]
 bdc:	e1540002 	cmp	r4, r2
 be0:	9a000019 	bls	c4c <malloc+0xa0>
 be4:	e3540a01 	cmp	r4, #4096	; 0x1000
 be8:	21a05004 	movcs	r5, r4
 bec:	33a05a01 	movcc	r5, #4096	; 0x1000
 bf0:	e1a06185 	lsl	r6, r5, #3
 bf4:	ea000003 	b	c08 <malloc+0x5c>
 bf8:	e5930000 	ldr	r0, [r3]
 bfc:	e5902004 	ldr	r2, [r0, #4]
 c00:	e1540002 	cmp	r4, r2
 c04:	9a000010 	bls	c4c <malloc+0xa0>
 c08:	e5972000 	ldr	r2, [r7]
 c0c:	e1a03000 	mov	r3, r0
 c10:	e1520000 	cmp	r2, r0
 c14:	1afffff7 	bne	bf8 <malloc+0x4c>
 c18:	e1a00006 	mov	r0, r6
 c1c:	ebfffee4 	bl	7b4 <sbrk>
 c20:	e1a03000 	mov	r3, r0
 c24:	e3730001 	cmn	r3, #1
 c28:	e2800008 	add	r0, r0, #8
 c2c:	0a000004 	beq	c44 <malloc+0x98>
 c30:	e5835004 	str	r5, [r3, #4]
 c34:	ebffffb5 	bl	b10 <free>
 c38:	e5973000 	ldr	r3, [r7]
 c3c:	e3530000 	cmp	r3, #0
 c40:	1affffec 	bne	bf8 <malloc+0x4c>
 c44:	e3a00000 	mov	r0, #0
 c48:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c4c:	e1540002 	cmp	r4, r2
 c50:	e5873000 	str	r3, [r7]
 c54:	10422004 	subne	r2, r2, r4
 c58:	15802004 	strne	r2, [r0, #4]
 c5c:	05902000 	ldreq	r2, [r0]
 c60:	10800182 	addne	r0, r0, r2, lsl #3
 c64:	e2800008 	add	r0, r0, #8
 c68:	15004004 	strne	r4, [r0, #-4]
 c6c:	05832000 	streq	r2, [r3]
 c70:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c74:	e2870004 	add	r0, r7, #4
 c78:	e5873008 	str	r3, [r7, #8]
 c7c:	e5870000 	str	r0, [r7]
 c80:	e5870004 	str	r0, [r7, #4]
 c84:	eaffffd6 	b	be4 <malloc+0x38>
