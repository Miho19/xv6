
_test:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
	if(fd)
		close(fd);
	
}

int main(int argc, char *argv[]) {
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
	int i;
	int result;
	int size;
	int fd;

	read_buf = malloc(sizeof(read_buf[0]) * 512);
   4:	e3a00c02 	mov	r0, #512	; 0x200
int main(int argc, char *argv[]) {
   8:	e28db014 	add	fp, sp, #20
   c:	e24dd010 	sub	sp, sp, #16
  10:	e1a06001 	mov	r6, r1
	read_buf = malloc(sizeof(read_buf[0]) * 512);
  14:	eb000309 	bl	c40 <malloc>
  18:	e3005da0 	movw	r5, #3488	; 0xda0
  1c:	e3405000 	movt	r5, #0
	write_buf = malloc(sizeof(write_buf[0]) * 512);
  20:	e3004d9c 	movw	r4, #3484	; 0xd9c
  24:	e3404000 	movt	r4, #0
	read_buf = malloc(sizeof(read_buf[0]) * 512);
  28:	e5850000 	str	r0, [r5]
	write_buf = malloc(sizeof(write_buf[0]) * 512);
  2c:	e3a00c02 	mov	r0, #512	; 0x200
  30:	eb000302 	bl	c40 <malloc>


	char send_text[13] = {72,101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33};
  34:	e3a02000 	mov	r2, #0
	
	size = (int)sizeof(send_text);


	for(i=0;i<size;i++)
  38:	e1a03002 	mov	r3, r2
	char send_text[13] = {72,101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33};
  3c:	e306c548 	movw	ip, #25928	; 0x6548
  40:	e54b2018 	strb	r2, [fp, #-24]	; 0xffffffe8
  44:	e346cc6c 	movt	ip, #27756	; 0x6c6c
  48:	e24b1024 	sub	r1, fp, #36	; 0x24
  4c:	e50bc024 	str	ip, [fp, #-36]	; 0xffffffdc
  50:	e3a02048 	mov	r2, #72	; 0x48
  54:	e302c06f 	movw	ip, #8303	; 0x206f
  58:	e346cf57 	movt	ip, #28503	; 0x6f57
  5c:	e50bc020 	str	ip, [fp, #-32]	; 0xffffffe0
  60:	e306cc72 	movw	ip, #27762	; 0x6c72
  64:	e342c164 	movt	ip, #8548	; 0x2164
  68:	e50bc01c 	str	ip, [fp, #-28]	; 0xffffffe4
	write_buf = malloc(sizeof(write_buf[0]) * 512);
  6c:	e5840000 	str	r0, [r4]
	for(i=0;i<size;i++)
  70:	ea000001 	b	7c <main+0x7c>
  74:	e5940000 	ldr	r0, [r4]
  78:	e5f12001 	ldrb	r2, [r1, #1]!
		write_buf[i] = send_text[i];
  7c:	e7c02003 	strb	r2, [r0, r3]
	for(i=0;i<size;i++)
  80:	e2833001 	add	r3, r3, #1
  84:	e353000d 	cmp	r3, #13
  88:	1afffff9 	bne	74 <main+0x74>


	fd = 0;


	if(mknod(argv[1],15,15) < 0) {
  8c:	e3a0200f 	mov	r2, #15
  90:	e5960004 	ldr	r0, [r6, #4]
  94:	e1a01002 	mov	r1, r2
  98:	eb000182 	bl	6a8 <mknod>
  9c:	e3500000 	cmp	r0, #0
  a0:	ba000040 	blt	1a8 <main+0x1a8>
		printf(1,"Already a device\n");
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  a4:	e3a01002 	mov	r1, #2
  a8:	e5960004 	ldr	r0, [r6, #4]
  ac:	eb000170 	bl	674 <open>
  b0:	e2507000 	subs	r7, r0, #0
  b4:	ba000033 	blt	188 <main+0x188>
		printf(1,"Could not open %s \n", argv[1]);
		clean(fd);
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  b8:	e1a03007 	mov	r3, r7
  bc:	e5962004 	ldr	r2, [r6, #4]
  c0:	e3a00001 	mov	r0, #1
  c4:	e3001d44 	movw	r1, #3396	; 0xd44
  c8:	e3401000 	movt	r1, #0
  cc:	eb00024c 	bl	a04 <printf>

	

	lseek(fd, POS, 0);
  d0:	e3a02000 	mov	r2, #0
  d4:	e3a01702 	mov	r1, #524288	; 0x80000
  d8:	e1a00007 	mov	r0, r7
  dc:	eb000109 	bl	508 <lseek>

	result = write(fd, write_buf, 512);
  e0:	e3a02c02 	mov	r2, #512	; 0x200
  e4:	e5941000 	ldr	r1, [r4]
  e8:	e1a00007 	mov	r0, r7
  ec:	eb00012c 	bl	5a4 <write>

	if(result != size){
  f0:	e350000d 	cmp	r0, #13
  f4:	0a000004 	beq	10c <main+0x10c>
		printf(1, "write %d\n", result);
  f8:	e1a02000 	mov	r2, r0
  fc:	e3001d58 	movw	r1, #3416	; 0xd58
 100:	e3a00001 	mov	r0, #1
 104:	e3401000 	movt	r1, #0
 108:	eb00023d 	bl	a04 <printf>
	}

	lseek(fd, POS, 0);
 10c:	e3a02000 	mov	r2, #0
 110:	e3a01702 	mov	r1, #524288	; 0x80000
 114:	e1a00007 	mov	r0, r7
 118:	eb0000fa 	bl	508 <lseek>

	result = read(fd, read_buf, 512);
 11c:	e3a02c02 	mov	r2, #512	; 0x200
 120:	e5951000 	ldr	r1, [r5]
 124:	e1a00007 	mov	r0, r7
 128:	eb000110 	bl	570 <read>

	if(result != size) {
 12c:	e350000d 	cmp	r0, #13
 130:	0a000004 	beq	148 <main+0x148>
		printf(1, "read %d\n", result);
 134:	e1a02000 	mov	r2, r0
 138:	e3001d64 	movw	r1, #3428	; 0xd64
 13c:	e3a00001 	mov	r0, #1
 140:	e3401000 	movt	r1, #0
 144:	eb00022e 	bl	a04 <printf>
	}

	printf(1,"%s\n", read_buf);
 148:	e5952000 	ldr	r2, [r5]
 14c:	e3a00001 	mov	r0, #1
 150:	e3001d70 	movw	r1, #3440	; 0xd70
 154:	e3401000 	movt	r1, #0
 158:	eb000229 	bl	a04 <printf>

	printf(1, "\n");
 15c:	e3a00001 	mov	r0, #1
 160:	e3001d60 	movw	r1, #3424	; 0xd60
 164:	e3401000 	movt	r1, #0
 168:	eb000225 	bl	a04 <printf>

	free(write_buf);
 16c:	e5940000 	ldr	r0, [r4]
 170:	eb00028b 	bl	ba4 <free>
	free(read_buf);
 174:	e5950000 	ldr	r0, [r5]
 178:	eb000289 	bl	ba4 <free>
	close(fd);
 17c:	e1a00007 	mov	r0, r7
 180:	eb000114 	bl	5d8 <close>
	exit();	
 184:	eb0000c5 	bl	4a0 <exit>
		printf(1,"Could not open %s \n", argv[1]);
 188:	e5962004 	ldr	r2, [r6, #4]
 18c:	e3a00001 	mov	r0, #1
 190:	e3001d30 	movw	r1, #3376	; 0xd30
 194:	e3401000 	movt	r1, #0
 198:	eb000219 	bl	a04 <printf>
		clean(fd);
 19c:	e1a00007 	mov	r0, r7
 1a0:	eb000005 	bl	1bc <clean>
 1a4:	eaffffc3 	b	b8 <main+0xb8>
		printf(1,"Already a device\n");
 1a8:	e3001d1c 	movw	r1, #3356	; 0xd1c
 1ac:	e3a00001 	mov	r0, #1
 1b0:	e3401000 	movt	r1, #0
 1b4:	eb000212 	bl	a04 <printf>
 1b8:	eaffffb9 	b	a4 <main+0xa4>

000001bc <clean>:
	free(read_buf);
 1bc:	e3003da0 	movw	r3, #3488	; 0xda0
 1c0:	e3403000 	movt	r3, #0
void clean(int fd){
 1c4:	e92d4830 	push	{r4, r5, fp, lr}
 1c8:	e1a04000 	mov	r4, r0
 1cc:	e28db00c 	add	fp, sp, #12
	free(read_buf);
 1d0:	e5930000 	ldr	r0, [r3]
 1d4:	eb000272 	bl	ba4 <free>
	free(write_buf);
 1d8:	e3003d9c 	movw	r3, #3484	; 0xd9c
 1dc:	e3403000 	movt	r3, #0
 1e0:	e5930000 	ldr	r0, [r3]
 1e4:	eb00026e 	bl	ba4 <free>
	if(fd)
 1e8:	e3540000 	cmp	r4, #0
 1ec:	08bd8830 	popeq	{r4, r5, fp, pc}
		close(fd);
 1f0:	e1a00004 	mov	r0, r4
}
 1f4:	e24bd00c 	sub	sp, fp, #12
 1f8:	e8bd4830 	pop	{r4, r5, fp, lr}
		close(fd);
 1fc:	ea0000f5 	b	5d8 <close>

00000200 <strcpy>:
 200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 204:	e2402001 	sub	r2, r0, #1
 208:	e28db000 	add	fp, sp, #0
 20c:	e4d13001 	ldrb	r3, [r1], #1
 210:	e3530000 	cmp	r3, #0
 214:	e5e23001 	strb	r3, [r2, #1]!
 218:	1afffffb 	bne	20c <strcpy+0xc>
 21c:	e28bd000 	add	sp, fp, #0
 220:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 224:	e12fff1e 	bx	lr

00000228 <strcmp>:
 228:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 22c:	e28db000 	add	fp, sp, #0
 230:	e5d03000 	ldrb	r3, [r0]
 234:	e5d12000 	ldrb	r2, [r1]
 238:	e3530000 	cmp	r3, #0
 23c:	1a000004 	bne	254 <strcmp+0x2c>
 240:	ea000005 	b	25c <strcmp+0x34>
 244:	e5f03001 	ldrb	r3, [r0, #1]!
 248:	e3530000 	cmp	r3, #0
 24c:	0a000006 	beq	26c <strcmp+0x44>
 250:	e5f12001 	ldrb	r2, [r1, #1]!
 254:	e1530002 	cmp	r3, r2
 258:	0afffff9 	beq	244 <strcmp+0x1c>
 25c:	e0430002 	sub	r0, r3, r2
 260:	e28bd000 	add	sp, fp, #0
 264:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 268:	e12fff1e 	bx	lr
 26c:	e5d12001 	ldrb	r2, [r1, #1]
 270:	e0430002 	sub	r0, r3, r2
 274:	e28bd000 	add	sp, fp, #0
 278:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 27c:	e12fff1e 	bx	lr

00000280 <strlen>:
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
 288:	e5d03000 	ldrb	r3, [r0]
 28c:	e3530000 	cmp	r3, #0
 290:	0a000009 	beq	2bc <strlen+0x3c>
 294:	e1a02000 	mov	r2, r0
 298:	e3a03000 	mov	r3, #0
 29c:	e5f21001 	ldrb	r1, [r2, #1]!
 2a0:	e2833001 	add	r3, r3, #1
 2a4:	e3510000 	cmp	r1, #0
 2a8:	e1a00003 	mov	r0, r3
 2ac:	1afffffa 	bne	29c <strlen+0x1c>
 2b0:	e28bd000 	add	sp, fp, #0
 2b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b8:	e12fff1e 	bx	lr
 2bc:	e1a00003 	mov	r0, r3
 2c0:	eafffffa 	b	2b0 <strlen+0x30>

000002c4 <memset>:
 2c4:	e3520000 	cmp	r2, #0
 2c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2cc:	e28db000 	add	fp, sp, #0
 2d0:	0a000004 	beq	2e8 <memset+0x24>
 2d4:	e6ef1071 	uxtb	r1, r1
 2d8:	e0802002 	add	r2, r0, r2
 2dc:	e4c01001 	strb	r1, [r0], #1
 2e0:	e1520000 	cmp	r2, r0
 2e4:	1afffffc 	bne	2dc <memset+0x18>
 2e8:	e28bd000 	add	sp, fp, #0
 2ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2f0:	e12fff1e 	bx	lr

000002f4 <strchr>:
 2f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2f8:	e28db000 	add	fp, sp, #0
 2fc:	e5d02000 	ldrb	r2, [r0]
 300:	e3520000 	cmp	r2, #0
 304:	0a00000b 	beq	338 <strchr+0x44>
 308:	e1510002 	cmp	r1, r2
 30c:	1a000002 	bne	31c <strchr+0x28>
 310:	ea000005 	b	32c <strchr+0x38>
 314:	e1530001 	cmp	r3, r1
 318:	0a000003 	beq	32c <strchr+0x38>
 31c:	e5f03001 	ldrb	r3, [r0, #1]!
 320:	e3530000 	cmp	r3, #0
 324:	1afffffa 	bne	314 <strchr+0x20>
 328:	e1a00003 	mov	r0, r3
 32c:	e28bd000 	add	sp, fp, #0
 330:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 334:	e12fff1e 	bx	lr
 338:	e1a00002 	mov	r0, r2
 33c:	eafffffa 	b	32c <strchr+0x38>

00000340 <gets>:
 340:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 344:	e1a08000 	mov	r8, r0
 348:	e28db018 	add	fp, sp, #24
 34c:	e1a07001 	mov	r7, r1
 350:	e24dd00c 	sub	sp, sp, #12
 354:	e2406001 	sub	r6, r0, #1
 358:	e3a05000 	mov	r5, #0
 35c:	ea000008 	b	384 <gets+0x44>
 360:	eb000082 	bl	570 <read>
 364:	e3500000 	cmp	r0, #0
 368:	da00000b 	ble	39c <gets+0x5c>
 36c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 370:	e1a05004 	mov	r5, r4
 374:	e353000d 	cmp	r3, #13
 378:	1353000a 	cmpne	r3, #10
 37c:	e5e63001 	strb	r3, [r6, #1]!
 380:	0a000005 	beq	39c <gets+0x5c>
 384:	e3a02001 	mov	r2, #1
 388:	e0854002 	add	r4, r5, r2
 38c:	e1540007 	cmp	r4, r7
 390:	e24b101d 	sub	r1, fp, #29
 394:	e3a00000 	mov	r0, #0
 398:	bafffff0 	blt	360 <gets+0x20>
 39c:	e3a03000 	mov	r3, #0
 3a0:	e1a00008 	mov	r0, r8
 3a4:	e7c83005 	strb	r3, [r8, r5]
 3a8:	e24bd018 	sub	sp, fp, #24
 3ac:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000003b0 <stat>:
 3b0:	e92d4830 	push	{r4, r5, fp, lr}
 3b4:	e1a04001 	mov	r4, r1
 3b8:	e28db00c 	add	fp, sp, #12
 3bc:	e3a01000 	mov	r1, #0
 3c0:	eb0000ab 	bl	674 <open>
 3c4:	e2505000 	subs	r5, r0, #0
 3c8:	ba000006 	blt	3e8 <stat+0x38>
 3cc:	e1a01004 	mov	r1, r4
 3d0:	eb0000ce 	bl	710 <fstat>
 3d4:	e1a04000 	mov	r4, r0
 3d8:	e1a00005 	mov	r0, r5
 3dc:	eb00007d 	bl	5d8 <close>
 3e0:	e1a00004 	mov	r0, r4
 3e4:	e8bd8830 	pop	{r4, r5, fp, pc}
 3e8:	e3e04000 	mvn	r4, #0
 3ec:	eafffffb 	b	3e0 <stat+0x30>

000003f0 <atoi>:
 3f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3f4:	e28db000 	add	fp, sp, #0
 3f8:	e5d02000 	ldrb	r2, [r0]
 3fc:	e2423030 	sub	r3, r2, #48	; 0x30
 400:	e3530009 	cmp	r3, #9
 404:	e3a03000 	mov	r3, #0
 408:	8a000006 	bhi	428 <atoi+0x38>
 40c:	e3a0c00a 	mov	ip, #10
 410:	e023239c 	mla	r3, ip, r3, r2
 414:	e5f02001 	ldrb	r2, [r0, #1]!
 418:	e2421030 	sub	r1, r2, #48	; 0x30
 41c:	e3510009 	cmp	r1, #9
 420:	e2433030 	sub	r3, r3, #48	; 0x30
 424:	9afffff9 	bls	410 <atoi+0x20>
 428:	e1a00003 	mov	r0, r3
 42c:	e28bd000 	add	sp, fp, #0
 430:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 434:	e12fff1e 	bx	lr

00000438 <memmove>:
 438:	e3520000 	cmp	r2, #0
 43c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 440:	e28db000 	add	fp, sp, #0
 444:	da000005 	ble	460 <memmove+0x28>
 448:	e0812002 	add	r2, r1, r2
 44c:	e2403001 	sub	r3, r0, #1
 450:	e4d1c001 	ldrb	ip, [r1], #1
 454:	e1510002 	cmp	r1, r2
 458:	e5e3c001 	strb	ip, [r3, #1]!
 45c:	1afffffb 	bne	450 <memmove+0x18>
 460:	e28bd000 	add	sp, fp, #0
 464:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 468:	e12fff1e 	bx	lr

0000046c <fork>:
 46c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 470:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 474:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 478:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 47c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 480:	e3a00001 	mov	r0, #1
 484:	ef000040 	svc	0x00000040
 488:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 494:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 498:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 49c:	e12fff1e 	bx	lr

000004a0 <exit>:
 4a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b4:	e3a00002 	mov	r0, #2
 4b8:	ef000040 	svc	0x00000040
 4bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d0:	e12fff1e 	bx	lr

000004d4 <wait>:
 4d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e8:	e3a00003 	mov	r0, #3
 4ec:	ef000040 	svc	0x00000040
 4f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 500:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 504:	e12fff1e 	bx	lr

00000508 <lseek>:
 508:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 50c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 510:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 514:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 518:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 51c:	e3a00016 	mov	r0, #22
 520:	ef000040 	svc	0x00000040
 524:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 530:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 534:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 538:	e12fff1e 	bx	lr

0000053c <pipe>:
 53c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 540:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 544:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 548:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 54c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 550:	e3a00004 	mov	r0, #4
 554:	ef000040 	svc	0x00000040
 558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 564:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 568:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 56c:	e12fff1e 	bx	lr

00000570 <read>:
 570:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 574:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 578:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 57c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 580:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 584:	e3a00005 	mov	r0, #5
 588:	ef000040 	svc	0x00000040
 58c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 598:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 59c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a0:	e12fff1e 	bx	lr

000005a4 <write>:
 5a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b8:	e3a00010 	mov	r0, #16
 5bc:	ef000040 	svc	0x00000040
 5c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d4:	e12fff1e 	bx	lr

000005d8 <close>:
 5d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ec:	e3a00015 	mov	r0, #21
 5f0:	ef000040 	svc	0x00000040
 5f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 600:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 604:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 608:	e12fff1e 	bx	lr

0000060c <kill>:
 60c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 610:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 614:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 618:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 61c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 620:	e3a00006 	mov	r0, #6
 624:	ef000040 	svc	0x00000040
 628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 634:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 638:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 63c:	e12fff1e 	bx	lr

00000640 <exec>:
 640:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 644:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 648:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 64c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 650:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 654:	e3a00007 	mov	r0, #7
 658:	ef000040 	svc	0x00000040
 65c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 668:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 66c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 670:	e12fff1e 	bx	lr

00000674 <open>:
 674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 678:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 67c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 680:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 684:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 688:	e3a0000f 	mov	r0, #15
 68c:	ef000040 	svc	0x00000040
 690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 69c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a4:	e12fff1e 	bx	lr

000006a8 <mknod>:
 6a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6bc:	e3a00011 	mov	r0, #17
 6c0:	ef000040 	svc	0x00000040
 6c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d8:	e12fff1e 	bx	lr

000006dc <unlink>:
 6dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f0:	e3a00012 	mov	r0, #18
 6f4:	ef000040 	svc	0x00000040
 6f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 704:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 708:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 70c:	e12fff1e 	bx	lr

00000710 <fstat>:
 710:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 714:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 718:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 71c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 720:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 724:	e3a00008 	mov	r0, #8
 728:	ef000040 	svc	0x00000040
 72c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 738:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 73c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 740:	e12fff1e 	bx	lr

00000744 <link>:
 744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 748:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 74c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 750:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 754:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 758:	e3a00013 	mov	r0, #19
 75c:	ef000040 	svc	0x00000040
 760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 76c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 774:	e12fff1e 	bx	lr

00000778 <mkdir>:
 778:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 77c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 780:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 784:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 788:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 78c:	e3a00014 	mov	r0, #20
 790:	ef000040 	svc	0x00000040
 794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 79c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a8:	e12fff1e 	bx	lr

000007ac <chdir>:
 7ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c0:	e3a00009 	mov	r0, #9
 7c4:	ef000040 	svc	0x00000040
 7c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7dc:	e12fff1e 	bx	lr

000007e0 <dup>:
 7e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7f4:	e3a0000a 	mov	r0, #10
 7f8:	ef000040 	svc	0x00000040
 7fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 804:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 808:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 80c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 810:	e12fff1e 	bx	lr

00000814 <getpid>:
 814:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 818:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 81c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 820:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 824:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 828:	e3a0000b 	mov	r0, #11
 82c:	ef000040 	svc	0x00000040
 830:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 834:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 838:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 83c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 840:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 844:	e12fff1e 	bx	lr

00000848 <sbrk>:
 848:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 84c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 850:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 854:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 858:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 85c:	e3a0000c 	mov	r0, #12
 860:	ef000040 	svc	0x00000040
 864:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 868:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 86c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 870:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 874:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 878:	e12fff1e 	bx	lr

0000087c <sleep>:
 87c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 880:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 884:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 888:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 88c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 890:	e3a0000d 	mov	r0, #13
 894:	ef000040 	svc	0x00000040
 898:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 89c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8ac:	e12fff1e 	bx	lr

000008b0 <uptime>:
 8b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8c4:	e3a0000e 	mov	r0, #14
 8c8:	ef000040 	svc	0x00000040
 8cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8e0:	e12fff1e 	bx	lr

000008e4 <printint>:
 8e4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 8e8:	e1a09fa1 	lsr	r9, r1, #31
 8ec:	e3530000 	cmp	r3, #0
 8f0:	03a09000 	moveq	r9, #0
 8f4:	12099001 	andne	r9, r9, #1
 8f8:	e28db01c 	add	fp, sp, #28
 8fc:	e3590000 	cmp	r9, #0
 900:	e3008d74 	movw	r8, #3444	; 0xd74
 904:	1261e000 	rsbne	lr, r1, #0
 908:	e3408000 	movt	r8, #0
 90c:	e24b602d 	sub	r6, fp, #45	; 0x2d
 910:	e1a04000 	mov	r4, r0
 914:	13a09001 	movne	r9, #1
 918:	01a0e001 	moveq	lr, r1
 91c:	e3a07000 	mov	r7, #0
 920:	e3a05001 	mov	r5, #1
 924:	e24dd018 	sub	sp, sp, #24
 928:	e3a0c000 	mov	ip, #0
 92c:	e3a0301f 	mov	r3, #31
 930:	e1a0100c 	mov	r1, ip
 934:	e1a0033e 	lsr	r0, lr, r3
 938:	e2000001 	and	r0, r0, #1
 93c:	e1801081 	orr	r1, r0, r1, lsl #1
 940:	e1520001 	cmp	r2, r1
 944:	90411002 	subls	r1, r1, r2
 948:	918cc315 	orrls	ip, ip, r5, lsl r3
 94c:	e2533001 	subs	r3, r3, #1
 950:	2afffff7 	bcs	934 <printint+0x50>
 954:	e061e29c 	mls	r1, ip, r2, lr
 958:	e35c0000 	cmp	ip, #0
 95c:	e1a0e00c 	mov	lr, ip
 960:	e2873001 	add	r3, r7, #1
 964:	e7d81001 	ldrb	r1, [r8, r1]
 968:	e5e61001 	strb	r1, [r6, #1]!
 96c:	11a07003 	movne	r7, r3
 970:	1affffec 	bne	928 <printint+0x44>
 974:	e3590000 	cmp	r9, #0
 978:	124b201c 	subne	r2, fp, #28
 97c:	10822003 	addne	r2, r2, r3
 980:	13a0102d 	movne	r1, #45	; 0x2d
 984:	12873002 	addne	r3, r7, #2
 988:	15421010 	strbne	r1, [r2, #-16]
 98c:	e24b202c 	sub	r2, fp, #44	; 0x2c
 990:	e2435001 	sub	r5, r3, #1
 994:	e0826003 	add	r6, r2, r3
 998:	e5763001 	ldrb	r3, [r6, #-1]!
 99c:	e2455001 	sub	r5, r5, #1
 9a0:	e3a02001 	mov	r2, #1
 9a4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 9a8:	e1a00004 	mov	r0, r4
 9ac:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 9b0:	ebfffefb 	bl	5a4 <write>
 9b4:	e3750001 	cmn	r5, #1
 9b8:	1afffff6 	bne	998 <printint+0xb4>
 9bc:	e24bd01c 	sub	sp, fp, #28
 9c0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000009c4 <div>:
 9c4:	e92d4810 	push	{r4, fp, lr}
 9c8:	e3a02000 	mov	r2, #0
 9cc:	e28db008 	add	fp, sp, #8
 9d0:	e1a0e000 	mov	lr, r0
 9d4:	e3a0301f 	mov	r3, #31
 9d8:	e1a00002 	mov	r0, r2
 9dc:	e3a04001 	mov	r4, #1
 9e0:	e1a0c33e 	lsr	ip, lr, r3
 9e4:	e20cc001 	and	ip, ip, #1
 9e8:	e18c2082 	orr	r2, ip, r2, lsl #1
 9ec:	e1520001 	cmp	r2, r1
 9f0:	20422001 	subcs	r2, r2, r1
 9f4:	21800314 	orrcs	r0, r0, r4, lsl r3
 9f8:	e2533001 	subs	r3, r3, #1
 9fc:	2afffff7 	bcs	9e0 <div+0x1c>
 a00:	e8bd8810 	pop	{r4, fp, pc}

00000a04 <printf>:
 a04:	e92d000e 	push	{r1, r2, r3}
 a08:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 a0c:	e28db018 	add	fp, sp, #24
 a10:	e24dd008 	sub	sp, sp, #8
 a14:	e59b6004 	ldr	r6, [fp, #4]
 a18:	e5d64000 	ldrb	r4, [r6]
 a1c:	e3540000 	cmp	r4, #0
 a20:	0a00002b 	beq	ad4 <printf+0xd0>
 a24:	e1a07000 	mov	r7, r0
 a28:	e28b8008 	add	r8, fp, #8
 a2c:	e3a05000 	mov	r5, #0
 a30:	ea00000a 	b	a60 <printf+0x5c>
 a34:	e3540025 	cmp	r4, #37	; 0x25
 a38:	01a05004 	moveq	r5, r4
 a3c:	0a000004 	beq	a54 <printf+0x50>
 a40:	e24b1018 	sub	r1, fp, #24
 a44:	e3a02001 	mov	r2, #1
 a48:	e1a00007 	mov	r0, r7
 a4c:	e5614006 	strb	r4, [r1, #-6]!
 a50:	ebfffed3 	bl	5a4 <write>
 a54:	e5f64001 	ldrb	r4, [r6, #1]!
 a58:	e3540000 	cmp	r4, #0
 a5c:	0a00001c 	beq	ad4 <printf+0xd0>
 a60:	e3550000 	cmp	r5, #0
 a64:	0afffff2 	beq	a34 <printf+0x30>
 a68:	e3550025 	cmp	r5, #37	; 0x25
 a6c:	1afffff8 	bne	a54 <printf+0x50>
 a70:	e3540064 	cmp	r4, #100	; 0x64
 a74:	0a000037 	beq	b58 <printf+0x154>
 a78:	e20430f7 	and	r3, r4, #247	; 0xf7
 a7c:	e3530070 	cmp	r3, #112	; 0x70
 a80:	0a000017 	beq	ae4 <printf+0xe0>
 a84:	e3540073 	cmp	r4, #115	; 0x73
 a88:	0a00001c 	beq	b00 <printf+0xfc>
 a8c:	e3540063 	cmp	r4, #99	; 0x63
 a90:	0a000037 	beq	b74 <printf+0x170>
 a94:	e3540025 	cmp	r4, #37	; 0x25
 a98:	0a000027 	beq	b3c <printf+0x138>
 a9c:	e3a02001 	mov	r2, #1
 aa0:	e24b1019 	sub	r1, fp, #25
 aa4:	e1a00007 	mov	r0, r7
 aa8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 aac:	ebfffebc 	bl	5a4 <write>
 ab0:	e3a02001 	mov	r2, #1
 ab4:	e24b101a 	sub	r1, fp, #26
 ab8:	e1a00007 	mov	r0, r7
 abc:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 ac0:	ebfffeb7 	bl	5a4 <write>
 ac4:	e5f64001 	ldrb	r4, [r6, #1]!
 ac8:	e3a05000 	mov	r5, #0
 acc:	e3540000 	cmp	r4, #0
 ad0:	1affffe2 	bne	a60 <printf+0x5c>
 ad4:	e24bd018 	sub	sp, fp, #24
 ad8:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 adc:	e28dd00c 	add	sp, sp, #12
 ae0:	e12fff1e 	bx	lr
 ae4:	e3a03000 	mov	r3, #0
 ae8:	e3a02010 	mov	r2, #16
 aec:	e4981004 	ldr	r1, [r8], #4
 af0:	e1a00007 	mov	r0, r7
 af4:	ebffff7a 	bl	8e4 <printint>
 af8:	e3a05000 	mov	r5, #0
 afc:	eaffffd4 	b	a54 <printf+0x50>
 b00:	e4984004 	ldr	r4, [r8], #4
 b04:	e3540000 	cmp	r4, #0
 b08:	0a000021 	beq	b94 <printf+0x190>
 b0c:	e5d45000 	ldrb	r5, [r4]
 b10:	e3550000 	cmp	r5, #0
 b14:	0affffce 	beq	a54 <printf+0x50>
 b18:	e3a02001 	mov	r2, #1
 b1c:	e24b101d 	sub	r1, fp, #29
 b20:	e1a00007 	mov	r0, r7
 b24:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 b28:	ebfffe9d 	bl	5a4 <write>
 b2c:	e5f45001 	ldrb	r5, [r4, #1]!
 b30:	e3550000 	cmp	r5, #0
 b34:	1afffff7 	bne	b18 <printf+0x114>
 b38:	eaffffc5 	b	a54 <printf+0x50>
 b3c:	e24b1018 	sub	r1, fp, #24
 b40:	e3a02001 	mov	r2, #1
 b44:	e1a00007 	mov	r0, r7
 b48:	e5615003 	strb	r5, [r1, #-3]!
 b4c:	e3a05000 	mov	r5, #0
 b50:	ebfffe93 	bl	5a4 <write>
 b54:	eaffffbe 	b	a54 <printf+0x50>
 b58:	e3a03001 	mov	r3, #1
 b5c:	e3a0200a 	mov	r2, #10
 b60:	e4981004 	ldr	r1, [r8], #4
 b64:	e1a00007 	mov	r0, r7
 b68:	ebffff5d 	bl	8e4 <printint>
 b6c:	e3a05000 	mov	r5, #0
 b70:	eaffffb7 	b	a54 <printf+0x50>
 b74:	e4983004 	ldr	r3, [r8], #4
 b78:	e24b1018 	sub	r1, fp, #24
 b7c:	e3a02001 	mov	r2, #1
 b80:	e1a00007 	mov	r0, r7
 b84:	e3a05000 	mov	r5, #0
 b88:	e5613004 	strb	r3, [r1, #-4]!
 b8c:	ebfffe84 	bl	5a4 <write>
 b90:	eaffffaf 	b	a54 <printf+0x50>
 b94:	e3004d88 	movw	r4, #3464	; 0xd88
 b98:	e3a05028 	mov	r5, #40	; 0x28
 b9c:	e3404000 	movt	r4, #0
 ba0:	eaffffdc 	b	b18 <printf+0x114>

00000ba4 <free>:
 ba4:	e300cd90 	movw	ip, #3472	; 0xd90
 ba8:	e340c000 	movt	ip, #0
 bac:	e92d4810 	push	{r4, fp, lr}
 bb0:	e2401008 	sub	r1, r0, #8
 bb4:	e28db008 	add	fp, sp, #8
 bb8:	e59c3000 	ldr	r3, [ip]
 bbc:	ea000004 	b	bd4 <free+0x30>
 bc0:	e1510002 	cmp	r1, r2
 bc4:	3a000009 	bcc	bf0 <free+0x4c>
 bc8:	e1530002 	cmp	r3, r2
 bcc:	2a000007 	bcs	bf0 <free+0x4c>
 bd0:	e1a03002 	mov	r3, r2
 bd4:	e1530001 	cmp	r3, r1
 bd8:	e5932000 	ldr	r2, [r3]
 bdc:	3afffff7 	bcc	bc0 <free+0x1c>
 be0:	e1530002 	cmp	r3, r2
 be4:	3afffff9 	bcc	bd0 <free+0x2c>
 be8:	e1510002 	cmp	r1, r2
 bec:	2afffff7 	bcs	bd0 <free+0x2c>
 bf0:	e510e004 	ldr	lr, [r0, #-4]
 bf4:	e58c3000 	str	r3, [ip]
 bf8:	e081418e 	add	r4, r1, lr, lsl #3
 bfc:	e1520004 	cmp	r2, r4
 c00:	05922004 	ldreq	r2, [r2, #4]
 c04:	0082e00e 	addeq	lr, r2, lr
 c08:	0500e004 	streq	lr, [r0, #-4]
 c0c:	05932000 	ldreq	r2, [r3]
 c10:	05922000 	ldreq	r2, [r2]
 c14:	e5002008 	str	r2, [r0, #-8]
 c18:	e5932004 	ldr	r2, [r3, #4]
 c1c:	e083e182 	add	lr, r3, r2, lsl #3
 c20:	e151000e 	cmp	r1, lr
 c24:	15831000 	strne	r1, [r3]
 c28:	05101004 	ldreq	r1, [r0, #-4]
 c2c:	00812002 	addeq	r2, r1, r2
 c30:	05832004 	streq	r2, [r3, #4]
 c34:	05102008 	ldreq	r2, [r0, #-8]
 c38:	05832000 	streq	r2, [r3]
 c3c:	e8bd8810 	pop	{r4, fp, pc}

00000c40 <malloc>:
 c40:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 c44:	e3007d90 	movw	r7, #3472	; 0xd90
 c48:	e3407000 	movt	r7, #0
 c4c:	e2804007 	add	r4, r0, #7
 c50:	e28db014 	add	fp, sp, #20
 c54:	e5973000 	ldr	r3, [r7]
 c58:	e1a041a4 	lsr	r4, r4, #3
 c5c:	e2844001 	add	r4, r4, #1
 c60:	e3530000 	cmp	r3, #0
 c64:	0a000027 	beq	d08 <malloc+0xc8>
 c68:	e5930000 	ldr	r0, [r3]
 c6c:	e5902004 	ldr	r2, [r0, #4]
 c70:	e1540002 	cmp	r4, r2
 c74:	9a000019 	bls	ce0 <malloc+0xa0>
 c78:	e3540a01 	cmp	r4, #4096	; 0x1000
 c7c:	21a05004 	movcs	r5, r4
 c80:	33a05a01 	movcc	r5, #4096	; 0x1000
 c84:	e1a06185 	lsl	r6, r5, #3
 c88:	ea000003 	b	c9c <malloc+0x5c>
 c8c:	e5930000 	ldr	r0, [r3]
 c90:	e5902004 	ldr	r2, [r0, #4]
 c94:	e1540002 	cmp	r4, r2
 c98:	9a000010 	bls	ce0 <malloc+0xa0>
 c9c:	e5972000 	ldr	r2, [r7]
 ca0:	e1a03000 	mov	r3, r0
 ca4:	e1520000 	cmp	r2, r0
 ca8:	1afffff7 	bne	c8c <malloc+0x4c>
 cac:	e1a00006 	mov	r0, r6
 cb0:	ebfffee4 	bl	848 <sbrk>
 cb4:	e1a03000 	mov	r3, r0
 cb8:	e3730001 	cmn	r3, #1
 cbc:	e2800008 	add	r0, r0, #8
 cc0:	0a000004 	beq	cd8 <malloc+0x98>
 cc4:	e5835004 	str	r5, [r3, #4]
 cc8:	ebffffb5 	bl	ba4 <free>
 ccc:	e5973000 	ldr	r3, [r7]
 cd0:	e3530000 	cmp	r3, #0
 cd4:	1affffec 	bne	c8c <malloc+0x4c>
 cd8:	e3a00000 	mov	r0, #0
 cdc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 ce0:	e1540002 	cmp	r4, r2
 ce4:	e5873000 	str	r3, [r7]
 ce8:	10422004 	subne	r2, r2, r4
 cec:	15802004 	strne	r2, [r0, #4]
 cf0:	05902000 	ldreq	r2, [r0]
 cf4:	10800182 	addne	r0, r0, r2, lsl #3
 cf8:	e2800008 	add	r0, r0, #8
 cfc:	15004004 	strne	r4, [r0, #-4]
 d00:	05832000 	streq	r2, [r3]
 d04:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 d08:	e2870004 	add	r0, r7, #4
 d0c:	e5873008 	str	r3, [r7, #8]
 d10:	e5870000 	str	r0, [r7]
 d14:	e5870004 	str	r0, [r7, #4]
 d18:	eaffffd6 	b	c78 <malloc+0x38>
