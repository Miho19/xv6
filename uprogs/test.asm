
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
  14:	eb0002f6 	bl	bf4 <malloc>
  18:	e3005d9c 	movw	r5, #3484	; 0xd9c
  1c:	e3405000 	movt	r5, #0
  20:	e5850000 	str	r0, [r5]


	if(mkdir("dev") != 0){
  24:	e3000cd0 	movw	r0, #3280	; 0xcd0
  28:	e3400000 	movt	r0, #0
  2c:	eb0001be 	bl	72c <mkdir>
  30:	e3500000 	cmp	r0, #0
  34:	1a000037 	bne	118 <main+0x118>
		printf(1,"did not make dev\n");
	}
	if(chdir("dev") < 0){
  38:	e3000cd0 	movw	r0, #3280	; 0xcd0
  3c:	e3400000 	movt	r0, #0
  40:	eb0001c6 	bl	760 <chdir>
  44:	e3500000 	cmp	r0, #0
  48:	ba000047 	blt	16c <main+0x16c>
		printf(1,"could not change dir into dev\n");
	}

	if(argc < 1) {
  4c:	e3560000 	cmp	r6, #0
  50:	da000035 	ble	12c <main+0x12c>
		printf(1,"Usage: test filepath\n");
		clean();
	}
	
	if(mknod(argv[1],15,15) < 0) {
  54:	e3a0200f 	mov	r2, #15
  58:	e5940004 	ldr	r0, [r4, #4]
  5c:	e1a01002 	mov	r1, r2
  60:	eb00017d 	bl	65c <mknod>
  64:	e3500000 	cmp	r0, #0
  68:	ba000034 	blt	140 <main+0x140>
		printf(1,"mknod failure");
		clean();
	}
	

	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  6c:	e3a01002 	mov	r1, #2
  70:	e5940004 	ldr	r0, [r4, #4]
  74:	eb00016b 	bl	628 <open>
  78:	e3007d98 	movw	r7, #3480	; 0xd98
  7c:	e3407000 	movt	r7, #0
  80:	e3500000 	cmp	r0, #0
  84:	e5870000 	str	r0, [r7]
  88:	ba000031 	blt	154 <main+0x154>
		printf(1,"Could not open %s \n", argv[1]);
		clean();
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  8c:	e5942004 	ldr	r2, [r4, #4]
  90:	e1a03000 	mov	r3, r0
  94:	e3001d44 	movw	r1, #3396	; 0xd44
  98:	e3a00001 	mov	r0, #1
  9c:	e3401000 	movt	r1, #0


	read(fd, buf, 512);
	for(i=0;i<512;i++){
		printf(1, "%d", buf[i]);
  a0:	e3006d58 	movw	r6, #3416	; 0xd58
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  a4:	eb000243 	bl	9b8 <printf>
	read(fd, buf, 512);
  a8:	e3a02c02 	mov	r2, #512	; 0x200
  ac:	e5951000 	ldr	r1, [r5]
		printf(1, "%d", buf[i]);
  b0:	e3406000 	movt	r6, #0
	read(fd, buf, 512);
  b4:	e5970000 	ldr	r0, [r7]
	for(i=0;i<512;i++){
  b8:	e3a04000 	mov	r4, #0
	read(fd, buf, 512);
  bc:	eb000118 	bl	524 <read>
		printf(1, "%d", buf[i]);
  c0:	e5953000 	ldr	r3, [r5]
  c4:	e3a00001 	mov	r0, #1
  c8:	e1a01006 	mov	r1, r6
  cc:	e7d32004 	ldrb	r2, [r3, r4]
	for(i=0;i<512;i++){
  d0:	e0844000 	add	r4, r4, r0
		printf(1, "%d", buf[i]);
  d4:	eb000237 	bl	9b8 <printf>
	for(i=0;i<512;i++){
  d8:	e3540c02 	cmp	r4, #512	; 0x200
  dc:	1afffff7 	bne	c0 <main+0xc0>
	}
	printf(1,"\n");
  e0:	e3a00001 	mov	r0, #1
  e4:	e3001d1c 	movw	r1, #3356	; 0xd1c
  e8:	e3401000 	movt	r1, #0
  ec:	eb000231 	bl	9b8 <printf>
	printf(1, "lseek returned %d\n", lseek(fd, 0, 0));
  f0:	e3a02000 	mov	r2, #0
  f4:	e1a01002 	mov	r1, r2
  f8:	e5970000 	ldr	r0, [r7]
  fc:	eb0000ee 	bl	4bc <lseek>
 100:	e3001d5c 	movw	r1, #3420	; 0xd5c
 104:	e3401000 	movt	r1, #0
 108:	e1a02000 	mov	r2, r0
 10c:	e3a00001 	mov	r0, #1
 110:	eb000228 	bl	9b8 <printf>
	
 
	clean();
 114:	eb000019 	bl	180 <clean>
		printf(1,"did not make dev\n");
 118:	e3001cd4 	movw	r1, #3284	; 0xcd4
 11c:	e3a00001 	mov	r0, #1
 120:	e3401000 	movt	r1, #0
 124:	eb000223 	bl	9b8 <printf>
 128:	eaffffc2 	b	38 <main+0x38>
		printf(1,"Usage: test filepath\n");
 12c:	e3001d08 	movw	r1, #3336	; 0xd08
 130:	e3a00001 	mov	r0, #1
 134:	e3401000 	movt	r1, #0
 138:	eb00021e 	bl	9b8 <printf>
		clean();
 13c:	eb00000f 	bl	180 <clean>
		printf(1,"mknod failure");
 140:	e3001d20 	movw	r1, #3360	; 0xd20
 144:	e3a00001 	mov	r0, #1
 148:	e3401000 	movt	r1, #0
 14c:	eb000219 	bl	9b8 <printf>
		clean();
 150:	eb00000a 	bl	180 <clean>
		printf(1,"Could not open %s \n", argv[1]);
 154:	e5942004 	ldr	r2, [r4, #4]
 158:	e3001d30 	movw	r1, #3376	; 0xd30
 15c:	e3a00001 	mov	r0, #1
 160:	e3401000 	movt	r1, #0
 164:	eb000213 	bl	9b8 <printf>
		clean();
 168:	eb000004 	bl	180 <clean>
		printf(1,"could not change dir into dev\n");
 16c:	e3001ce8 	movw	r1, #3304	; 0xce8
 170:	e3a00001 	mov	r0, #1
 174:	e3401000 	movt	r1, #0
 178:	eb00020e 	bl	9b8 <printf>
 17c:	eaffffb2 	b	4c <main+0x4c>

00000180 <clean>:
	free(buf);
 180:	e3003d9c 	movw	r3, #3484	; 0xd9c
 184:	e3403000 	movt	r3, #0
void clean(void){
 188:	e92d4800 	push	{fp, lr}
 18c:	e28db004 	add	fp, sp, #4
	free(buf);
 190:	e5930000 	ldr	r0, [r3]
 194:	eb00026f 	bl	b58 <free>
	if(fd > 0)
 198:	e3003d98 	movw	r3, #3480	; 0xd98
 19c:	e3403000 	movt	r3, #0
 1a0:	e5930000 	ldr	r0, [r3]
 1a4:	e3500000 	cmp	r0, #0
 1a8:	da000000 	ble	1b0 <clean+0x30>
		close(fd);
 1ac:	eb0000f6 	bl	58c <close>
	exit();
 1b0:	eb0000a7 	bl	454 <exit>

000001b4 <strcpy>:
 1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b8:	e2402001 	sub	r2, r0, #1
 1bc:	e28db000 	add	fp, sp, #0
 1c0:	e4d13001 	ldrb	r3, [r1], #1
 1c4:	e3530000 	cmp	r3, #0
 1c8:	e5e23001 	strb	r3, [r2, #1]!
 1cc:	1afffffb 	bne	1c0 <strcpy+0xc>
 1d0:	e28bd000 	add	sp, fp, #0
 1d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d8:	e12fff1e 	bx	lr

000001dc <strcmp>:
 1dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1e0:	e28db000 	add	fp, sp, #0
 1e4:	e5d03000 	ldrb	r3, [r0]
 1e8:	e5d12000 	ldrb	r2, [r1]
 1ec:	e3530000 	cmp	r3, #0
 1f0:	1a000004 	bne	208 <strcmp+0x2c>
 1f4:	ea000005 	b	210 <strcmp+0x34>
 1f8:	e5f03001 	ldrb	r3, [r0, #1]!
 1fc:	e3530000 	cmp	r3, #0
 200:	0a000006 	beq	220 <strcmp+0x44>
 204:	e5f12001 	ldrb	r2, [r1, #1]!
 208:	e1530002 	cmp	r3, r2
 20c:	0afffff9 	beq	1f8 <strcmp+0x1c>
 210:	e0430002 	sub	r0, r3, r2
 214:	e28bd000 	add	sp, fp, #0
 218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 21c:	e12fff1e 	bx	lr
 220:	e5d12001 	ldrb	r2, [r1, #1]
 224:	e0430002 	sub	r0, r3, r2
 228:	e28bd000 	add	sp, fp, #0
 22c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 230:	e12fff1e 	bx	lr

00000234 <strlen>:
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
 23c:	e5d03000 	ldrb	r3, [r0]
 240:	e3530000 	cmp	r3, #0
 244:	0a000009 	beq	270 <strlen+0x3c>
 248:	e1a02000 	mov	r2, r0
 24c:	e3a03000 	mov	r3, #0
 250:	e5f21001 	ldrb	r1, [r2, #1]!
 254:	e2833001 	add	r3, r3, #1
 258:	e3510000 	cmp	r1, #0
 25c:	e1a00003 	mov	r0, r3
 260:	1afffffa 	bne	250 <strlen+0x1c>
 264:	e28bd000 	add	sp, fp, #0
 268:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 26c:	e12fff1e 	bx	lr
 270:	e1a00003 	mov	r0, r3
 274:	eafffffa 	b	264 <strlen+0x30>

00000278 <memset>:
 278:	e3520000 	cmp	r2, #0
 27c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 280:	e28db000 	add	fp, sp, #0
 284:	0a000004 	beq	29c <memset+0x24>
 288:	e6ef1071 	uxtb	r1, r1
 28c:	e0802002 	add	r2, r0, r2
 290:	e4c01001 	strb	r1, [r0], #1
 294:	e1520000 	cmp	r2, r0
 298:	1afffffc 	bne	290 <memset+0x18>
 29c:	e28bd000 	add	sp, fp, #0
 2a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a4:	e12fff1e 	bx	lr

000002a8 <strchr>:
 2a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ac:	e28db000 	add	fp, sp, #0
 2b0:	e5d02000 	ldrb	r2, [r0]
 2b4:	e3520000 	cmp	r2, #0
 2b8:	0a00000b 	beq	2ec <strchr+0x44>
 2bc:	e1510002 	cmp	r1, r2
 2c0:	1a000002 	bne	2d0 <strchr+0x28>
 2c4:	ea000005 	b	2e0 <strchr+0x38>
 2c8:	e1530001 	cmp	r3, r1
 2cc:	0a000003 	beq	2e0 <strchr+0x38>
 2d0:	e5f03001 	ldrb	r3, [r0, #1]!
 2d4:	e3530000 	cmp	r3, #0
 2d8:	1afffffa 	bne	2c8 <strchr+0x20>
 2dc:	e1a00003 	mov	r0, r3
 2e0:	e28bd000 	add	sp, fp, #0
 2e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2e8:	e12fff1e 	bx	lr
 2ec:	e1a00002 	mov	r0, r2
 2f0:	eafffffa 	b	2e0 <strchr+0x38>

000002f4 <gets>:
 2f4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2f8:	e1a08000 	mov	r8, r0
 2fc:	e28db018 	add	fp, sp, #24
 300:	e1a07001 	mov	r7, r1
 304:	e24dd00c 	sub	sp, sp, #12
 308:	e2406001 	sub	r6, r0, #1
 30c:	e3a05000 	mov	r5, #0
 310:	ea000008 	b	338 <gets+0x44>
 314:	eb000082 	bl	524 <read>
 318:	e3500000 	cmp	r0, #0
 31c:	da00000b 	ble	350 <gets+0x5c>
 320:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 324:	e1a05004 	mov	r5, r4
 328:	e353000d 	cmp	r3, #13
 32c:	1353000a 	cmpne	r3, #10
 330:	e5e63001 	strb	r3, [r6, #1]!
 334:	0a000005 	beq	350 <gets+0x5c>
 338:	e3a02001 	mov	r2, #1
 33c:	e0854002 	add	r4, r5, r2
 340:	e1540007 	cmp	r4, r7
 344:	e24b101d 	sub	r1, fp, #29
 348:	e3a00000 	mov	r0, #0
 34c:	bafffff0 	blt	314 <gets+0x20>
 350:	e3a03000 	mov	r3, #0
 354:	e1a00008 	mov	r0, r8
 358:	e7c83005 	strb	r3, [r8, r5]
 35c:	e24bd018 	sub	sp, fp, #24
 360:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000364 <stat>:
 364:	e92d4830 	push	{r4, r5, fp, lr}
 368:	e1a04001 	mov	r4, r1
 36c:	e28db00c 	add	fp, sp, #12
 370:	e3a01000 	mov	r1, #0
 374:	eb0000ab 	bl	628 <open>
 378:	e2505000 	subs	r5, r0, #0
 37c:	ba000006 	blt	39c <stat+0x38>
 380:	e1a01004 	mov	r1, r4
 384:	eb0000ce 	bl	6c4 <fstat>
 388:	e1a04000 	mov	r4, r0
 38c:	e1a00005 	mov	r0, r5
 390:	eb00007d 	bl	58c <close>
 394:	e1a00004 	mov	r0, r4
 398:	e8bd8830 	pop	{r4, r5, fp, pc}
 39c:	e3e04000 	mvn	r4, #0
 3a0:	eafffffb 	b	394 <stat+0x30>

000003a4 <atoi>:
 3a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3a8:	e28db000 	add	fp, sp, #0
 3ac:	e5d02000 	ldrb	r2, [r0]
 3b0:	e2423030 	sub	r3, r2, #48	; 0x30
 3b4:	e3530009 	cmp	r3, #9
 3b8:	e3a03000 	mov	r3, #0
 3bc:	8a000006 	bhi	3dc <atoi+0x38>
 3c0:	e3a0c00a 	mov	ip, #10
 3c4:	e023239c 	mla	r3, ip, r3, r2
 3c8:	e5f02001 	ldrb	r2, [r0, #1]!
 3cc:	e2421030 	sub	r1, r2, #48	; 0x30
 3d0:	e3510009 	cmp	r1, #9
 3d4:	e2433030 	sub	r3, r3, #48	; 0x30
 3d8:	9afffff9 	bls	3c4 <atoi+0x20>
 3dc:	e1a00003 	mov	r0, r3
 3e0:	e28bd000 	add	sp, fp, #0
 3e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e8:	e12fff1e 	bx	lr

000003ec <memmove>:
 3ec:	e3520000 	cmp	r2, #0
 3f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3f4:	e28db000 	add	fp, sp, #0
 3f8:	da000005 	ble	414 <memmove+0x28>
 3fc:	e0812002 	add	r2, r1, r2
 400:	e2403001 	sub	r3, r0, #1
 404:	e4d1c001 	ldrb	ip, [r1], #1
 408:	e1510002 	cmp	r1, r2
 40c:	e5e3c001 	strb	ip, [r3, #1]!
 410:	1afffffb 	bne	404 <memmove+0x18>
 414:	e28bd000 	add	sp, fp, #0
 418:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 41c:	e12fff1e 	bx	lr

00000420 <fork>:
 420:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 424:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 428:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 42c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 430:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 434:	e3a00001 	mov	r0, #1
 438:	ef000040 	svc	0x00000040
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 448:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 44c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 450:	e12fff1e 	bx	lr

00000454 <exit>:
 454:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 458:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 45c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 460:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 464:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 468:	e3a00002 	mov	r0, #2
 46c:	ef000040 	svc	0x00000040
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 47c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 480:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 484:	e12fff1e 	bx	lr

00000488 <wait>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00003 	mov	r0, #3
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <lseek>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a00016 	mov	r0, #22
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <pipe>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00004 	mov	r0, #4
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <read>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a00005 	mov	r0, #5
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <write>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00010 	mov	r0, #16
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <close>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00015 	mov	r0, #21
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <kill>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00006 	mov	r0, #6
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <exec>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a00007 	mov	r0, #7
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <open>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a0000f 	mov	r0, #15
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <mknod>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00011 	mov	r0, #17
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <unlink>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a00012 	mov	r0, #18
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <fstat>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a00008 	mov	r0, #8
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <link>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a00013 	mov	r0, #19
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <mkdir>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a00014 	mov	r0, #20
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <chdir>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a00009 	mov	r0, #9
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <dup>:
 794:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 798:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 79c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a8:	e3a0000a 	mov	r0, #10
 7ac:	ef000040 	svc	0x00000040
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c4:	e12fff1e 	bx	lr

000007c8 <getpid>:
 7c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7dc:	e3a0000b 	mov	r0, #11
 7e0:	ef000040 	svc	0x00000040
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f8:	e12fff1e 	bx	lr

000007fc <sbrk>:
 7fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 800:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 804:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 808:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 80c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 810:	e3a0000c 	mov	r0, #12
 814:	ef000040 	svc	0x00000040
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 824:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 828:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 82c:	e12fff1e 	bx	lr

00000830 <sleep>:
 830:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 834:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 838:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 83c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 840:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 844:	e3a0000d 	mov	r0, #13
 848:	ef000040 	svc	0x00000040
 84c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 850:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 854:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 858:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 85c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 860:	e12fff1e 	bx	lr

00000864 <uptime>:
 864:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 868:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 86c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 870:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 874:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 878:	e3a0000e 	mov	r0, #14
 87c:	ef000040 	svc	0x00000040
 880:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 884:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 888:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 88c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 890:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 894:	e12fff1e 	bx	lr

00000898 <printint>:
 898:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 89c:	e1a09fa1 	lsr	r9, r1, #31
 8a0:	e3530000 	cmp	r3, #0
 8a4:	03a09000 	moveq	r9, #0
 8a8:	12099001 	andne	r9, r9, #1
 8ac:	e28db01c 	add	fp, sp, #28
 8b0:	e3590000 	cmp	r9, #0
 8b4:	e3008d70 	movw	r8, #3440	; 0xd70
 8b8:	1261e000 	rsbne	lr, r1, #0
 8bc:	e3408000 	movt	r8, #0
 8c0:	e24b602d 	sub	r6, fp, #45	; 0x2d
 8c4:	e1a04000 	mov	r4, r0
 8c8:	13a09001 	movne	r9, #1
 8cc:	01a0e001 	moveq	lr, r1
 8d0:	e3a07000 	mov	r7, #0
 8d4:	e3a05001 	mov	r5, #1
 8d8:	e24dd018 	sub	sp, sp, #24
 8dc:	e3a0c000 	mov	ip, #0
 8e0:	e3a0301f 	mov	r3, #31
 8e4:	e1a0100c 	mov	r1, ip
 8e8:	e1a0033e 	lsr	r0, lr, r3
 8ec:	e2000001 	and	r0, r0, #1
 8f0:	e1801081 	orr	r1, r0, r1, lsl #1
 8f4:	e1520001 	cmp	r2, r1
 8f8:	90411002 	subls	r1, r1, r2
 8fc:	918cc315 	orrls	ip, ip, r5, lsl r3
 900:	e2533001 	subs	r3, r3, #1
 904:	2afffff7 	bcs	8e8 <printint+0x50>
 908:	e061e29c 	mls	r1, ip, r2, lr
 90c:	e35c0000 	cmp	ip, #0
 910:	e1a0e00c 	mov	lr, ip
 914:	e2873001 	add	r3, r7, #1
 918:	e7d81001 	ldrb	r1, [r8, r1]
 91c:	e5e61001 	strb	r1, [r6, #1]!
 920:	11a07003 	movne	r7, r3
 924:	1affffec 	bne	8dc <printint+0x44>
 928:	e3590000 	cmp	r9, #0
 92c:	124b201c 	subne	r2, fp, #28
 930:	10822003 	addne	r2, r2, r3
 934:	13a0102d 	movne	r1, #45	; 0x2d
 938:	12873002 	addne	r3, r7, #2
 93c:	15421010 	strbne	r1, [r2, #-16]
 940:	e24b202c 	sub	r2, fp, #44	; 0x2c
 944:	e2435001 	sub	r5, r3, #1
 948:	e0826003 	add	r6, r2, r3
 94c:	e5763001 	ldrb	r3, [r6, #-1]!
 950:	e2455001 	sub	r5, r5, #1
 954:	e3a02001 	mov	r2, #1
 958:	e24b102d 	sub	r1, fp, #45	; 0x2d
 95c:	e1a00004 	mov	r0, r4
 960:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 964:	ebfffefb 	bl	558 <write>
 968:	e3750001 	cmn	r5, #1
 96c:	1afffff6 	bne	94c <printint+0xb4>
 970:	e24bd01c 	sub	sp, fp, #28
 974:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000978 <div>:
 978:	e92d4810 	push	{r4, fp, lr}
 97c:	e3a02000 	mov	r2, #0
 980:	e28db008 	add	fp, sp, #8
 984:	e1a0e000 	mov	lr, r0
 988:	e3a0301f 	mov	r3, #31
 98c:	e1a00002 	mov	r0, r2
 990:	e3a04001 	mov	r4, #1
 994:	e1a0c33e 	lsr	ip, lr, r3
 998:	e20cc001 	and	ip, ip, #1
 99c:	e18c2082 	orr	r2, ip, r2, lsl #1
 9a0:	e1520001 	cmp	r2, r1
 9a4:	20422001 	subcs	r2, r2, r1
 9a8:	21800314 	orrcs	r0, r0, r4, lsl r3
 9ac:	e2533001 	subs	r3, r3, #1
 9b0:	2afffff7 	bcs	994 <div+0x1c>
 9b4:	e8bd8810 	pop	{r4, fp, pc}

000009b8 <printf>:
 9b8:	e92d000e 	push	{r1, r2, r3}
 9bc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 9c0:	e28db018 	add	fp, sp, #24
 9c4:	e24dd008 	sub	sp, sp, #8
 9c8:	e59b6004 	ldr	r6, [fp, #4]
 9cc:	e5d64000 	ldrb	r4, [r6]
 9d0:	e3540000 	cmp	r4, #0
 9d4:	0a00002b 	beq	a88 <printf+0xd0>
 9d8:	e1a07000 	mov	r7, r0
 9dc:	e28b8008 	add	r8, fp, #8
 9e0:	e3a05000 	mov	r5, #0
 9e4:	ea00000a 	b	a14 <printf+0x5c>
 9e8:	e3540025 	cmp	r4, #37	; 0x25
 9ec:	01a05004 	moveq	r5, r4
 9f0:	0a000004 	beq	a08 <printf+0x50>
 9f4:	e24b1018 	sub	r1, fp, #24
 9f8:	e3a02001 	mov	r2, #1
 9fc:	e1a00007 	mov	r0, r7
 a00:	e5614006 	strb	r4, [r1, #-6]!
 a04:	ebfffed3 	bl	558 <write>
 a08:	e5f64001 	ldrb	r4, [r6, #1]!
 a0c:	e3540000 	cmp	r4, #0
 a10:	0a00001c 	beq	a88 <printf+0xd0>
 a14:	e3550000 	cmp	r5, #0
 a18:	0afffff2 	beq	9e8 <printf+0x30>
 a1c:	e3550025 	cmp	r5, #37	; 0x25
 a20:	1afffff8 	bne	a08 <printf+0x50>
 a24:	e3540064 	cmp	r4, #100	; 0x64
 a28:	0a000037 	beq	b0c <printf+0x154>
 a2c:	e20430f7 	and	r3, r4, #247	; 0xf7
 a30:	e3530070 	cmp	r3, #112	; 0x70
 a34:	0a000017 	beq	a98 <printf+0xe0>
 a38:	e3540073 	cmp	r4, #115	; 0x73
 a3c:	0a00001c 	beq	ab4 <printf+0xfc>
 a40:	e3540063 	cmp	r4, #99	; 0x63
 a44:	0a000037 	beq	b28 <printf+0x170>
 a48:	e3540025 	cmp	r4, #37	; 0x25
 a4c:	0a000027 	beq	af0 <printf+0x138>
 a50:	e3a02001 	mov	r2, #1
 a54:	e24b1019 	sub	r1, fp, #25
 a58:	e1a00007 	mov	r0, r7
 a5c:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a60:	ebfffebc 	bl	558 <write>
 a64:	e3a02001 	mov	r2, #1
 a68:	e24b101a 	sub	r1, fp, #26
 a6c:	e1a00007 	mov	r0, r7
 a70:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a74:	ebfffeb7 	bl	558 <write>
 a78:	e5f64001 	ldrb	r4, [r6, #1]!
 a7c:	e3a05000 	mov	r5, #0
 a80:	e3540000 	cmp	r4, #0
 a84:	1affffe2 	bne	a14 <printf+0x5c>
 a88:	e24bd018 	sub	sp, fp, #24
 a8c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a90:	e28dd00c 	add	sp, sp, #12
 a94:	e12fff1e 	bx	lr
 a98:	e3a03000 	mov	r3, #0
 a9c:	e3a02010 	mov	r2, #16
 aa0:	e4981004 	ldr	r1, [r8], #4
 aa4:	e1a00007 	mov	r0, r7
 aa8:	ebffff7a 	bl	898 <printint>
 aac:	e3a05000 	mov	r5, #0
 ab0:	eaffffd4 	b	a08 <printf+0x50>
 ab4:	e4984004 	ldr	r4, [r8], #4
 ab8:	e3540000 	cmp	r4, #0
 abc:	0a000021 	beq	b48 <printf+0x190>
 ac0:	e5d45000 	ldrb	r5, [r4]
 ac4:	e3550000 	cmp	r5, #0
 ac8:	0affffce 	beq	a08 <printf+0x50>
 acc:	e3a02001 	mov	r2, #1
 ad0:	e24b101d 	sub	r1, fp, #29
 ad4:	e1a00007 	mov	r0, r7
 ad8:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 adc:	ebfffe9d 	bl	558 <write>
 ae0:	e5f45001 	ldrb	r5, [r4, #1]!
 ae4:	e3550000 	cmp	r5, #0
 ae8:	1afffff7 	bne	acc <printf+0x114>
 aec:	eaffffc5 	b	a08 <printf+0x50>
 af0:	e24b1018 	sub	r1, fp, #24
 af4:	e3a02001 	mov	r2, #1
 af8:	e1a00007 	mov	r0, r7
 afc:	e5615003 	strb	r5, [r1, #-3]!
 b00:	e3a05000 	mov	r5, #0
 b04:	ebfffe93 	bl	558 <write>
 b08:	eaffffbe 	b	a08 <printf+0x50>
 b0c:	e3a03001 	mov	r3, #1
 b10:	e3a0200a 	mov	r2, #10
 b14:	e4981004 	ldr	r1, [r8], #4
 b18:	e1a00007 	mov	r0, r7
 b1c:	ebffff5d 	bl	898 <printint>
 b20:	e3a05000 	mov	r5, #0
 b24:	eaffffb7 	b	a08 <printf+0x50>
 b28:	e4983004 	ldr	r3, [r8], #4
 b2c:	e24b1018 	sub	r1, fp, #24
 b30:	e3a02001 	mov	r2, #1
 b34:	e1a00007 	mov	r0, r7
 b38:	e3a05000 	mov	r5, #0
 b3c:	e5613004 	strb	r3, [r1, #-4]!
 b40:	ebfffe84 	bl	558 <write>
 b44:	eaffffaf 	b	a08 <printf+0x50>
 b48:	e3004d84 	movw	r4, #3460	; 0xd84
 b4c:	e3a05028 	mov	r5, #40	; 0x28
 b50:	e3404000 	movt	r4, #0
 b54:	eaffffdc 	b	acc <printf+0x114>

00000b58 <free>:
 b58:	e300cd8c 	movw	ip, #3468	; 0xd8c
 b5c:	e340c000 	movt	ip, #0
 b60:	e92d4810 	push	{r4, fp, lr}
 b64:	e2401008 	sub	r1, r0, #8
 b68:	e28db008 	add	fp, sp, #8
 b6c:	e59c3000 	ldr	r3, [ip]
 b70:	ea000004 	b	b88 <free+0x30>
 b74:	e1510002 	cmp	r1, r2
 b78:	3a000009 	bcc	ba4 <free+0x4c>
 b7c:	e1530002 	cmp	r3, r2
 b80:	2a000007 	bcs	ba4 <free+0x4c>
 b84:	e1a03002 	mov	r3, r2
 b88:	e1530001 	cmp	r3, r1
 b8c:	e5932000 	ldr	r2, [r3]
 b90:	3afffff7 	bcc	b74 <free+0x1c>
 b94:	e1530002 	cmp	r3, r2
 b98:	3afffff9 	bcc	b84 <free+0x2c>
 b9c:	e1510002 	cmp	r1, r2
 ba0:	2afffff7 	bcs	b84 <free+0x2c>
 ba4:	e510e004 	ldr	lr, [r0, #-4]
 ba8:	e58c3000 	str	r3, [ip]
 bac:	e081418e 	add	r4, r1, lr, lsl #3
 bb0:	e1520004 	cmp	r2, r4
 bb4:	05922004 	ldreq	r2, [r2, #4]
 bb8:	0082e00e 	addeq	lr, r2, lr
 bbc:	0500e004 	streq	lr, [r0, #-4]
 bc0:	05932000 	ldreq	r2, [r3]
 bc4:	05922000 	ldreq	r2, [r2]
 bc8:	e5002008 	str	r2, [r0, #-8]
 bcc:	e5932004 	ldr	r2, [r3, #4]
 bd0:	e083e182 	add	lr, r3, r2, lsl #3
 bd4:	e151000e 	cmp	r1, lr
 bd8:	15831000 	strne	r1, [r3]
 bdc:	05101004 	ldreq	r1, [r0, #-4]
 be0:	00812002 	addeq	r2, r1, r2
 be4:	05832004 	streq	r2, [r3, #4]
 be8:	05102008 	ldreq	r2, [r0, #-8]
 bec:	05832000 	streq	r2, [r3]
 bf0:	e8bd8810 	pop	{r4, fp, pc}

00000bf4 <malloc>:
 bf4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 bf8:	e3007d8c 	movw	r7, #3468	; 0xd8c
 bfc:	e3407000 	movt	r7, #0
 c00:	e2804007 	add	r4, r0, #7
 c04:	e28db014 	add	fp, sp, #20
 c08:	e5973000 	ldr	r3, [r7]
 c0c:	e1a041a4 	lsr	r4, r4, #3
 c10:	e2844001 	add	r4, r4, #1
 c14:	e3530000 	cmp	r3, #0
 c18:	0a000027 	beq	cbc <malloc+0xc8>
 c1c:	e5930000 	ldr	r0, [r3]
 c20:	e5902004 	ldr	r2, [r0, #4]
 c24:	e1540002 	cmp	r4, r2
 c28:	9a000019 	bls	c94 <malloc+0xa0>
 c2c:	e3540a01 	cmp	r4, #4096	; 0x1000
 c30:	21a05004 	movcs	r5, r4
 c34:	33a05a01 	movcc	r5, #4096	; 0x1000
 c38:	e1a06185 	lsl	r6, r5, #3
 c3c:	ea000003 	b	c50 <malloc+0x5c>
 c40:	e5930000 	ldr	r0, [r3]
 c44:	e5902004 	ldr	r2, [r0, #4]
 c48:	e1540002 	cmp	r4, r2
 c4c:	9a000010 	bls	c94 <malloc+0xa0>
 c50:	e5972000 	ldr	r2, [r7]
 c54:	e1a03000 	mov	r3, r0
 c58:	e1520000 	cmp	r2, r0
 c5c:	1afffff7 	bne	c40 <malloc+0x4c>
 c60:	e1a00006 	mov	r0, r6
 c64:	ebfffee4 	bl	7fc <sbrk>
 c68:	e1a03000 	mov	r3, r0
 c6c:	e3730001 	cmn	r3, #1
 c70:	e2800008 	add	r0, r0, #8
 c74:	0a000004 	beq	c8c <malloc+0x98>
 c78:	e5835004 	str	r5, [r3, #4]
 c7c:	ebffffb5 	bl	b58 <free>
 c80:	e5973000 	ldr	r3, [r7]
 c84:	e3530000 	cmp	r3, #0
 c88:	1affffec 	bne	c40 <malloc+0x4c>
 c8c:	e3a00000 	mov	r0, #0
 c90:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c94:	e1540002 	cmp	r4, r2
 c98:	e5873000 	str	r3, [r7]
 c9c:	10422004 	subne	r2, r2, r4
 ca0:	15802004 	strne	r2, [r0, #4]
 ca4:	05902000 	ldreq	r2, [r0]
 ca8:	10800182 	addne	r0, r0, r2, lsl #3
 cac:	e2800008 	add	r0, r0, #8
 cb0:	15004004 	strne	r4, [r0, #-4]
 cb4:	05832000 	streq	r2, [r3]
 cb8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 cbc:	e2870004 	add	r0, r7, #4
 cc0:	e5873008 	str	r3, [r7, #8]
 cc4:	e5870000 	str	r0, [r7]
 cc8:	e5870004 	str	r0, [r7, #4]
 ccc:	eaffffd6 	b	c2c <malloc+0x38>
