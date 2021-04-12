
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
  14:	eb0002fa 	bl	c04 <malloc>
  18:	e3005d58 	movw	r5, #3416	; 0xd58
  1c:	e3405000 	movt	r5, #0
	write_buf = malloc(sizeof(write_buf[0]) * 512);
  20:	e3004d54 	movw	r4, #3412	; 0xd54
  24:	e3404000 	movt	r4, #0
	read_buf = malloc(sizeof(read_buf[0]) * 512);
  28:	e5850000 	str	r0, [r5]
	write_buf = malloc(sizeof(write_buf[0]) * 512);
  2c:	e3a00c02 	mov	r0, #512	; 0x200
  30:	eb0002f3 	bl	c04 <malloc>


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
  98:	eb000173 	bl	66c <mknod>
  9c:	e3500000 	cmp	r0, #0
  a0:	ba000031 	blt	16c <main+0x16c>
		printf(1,"Already a device\n");
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  a4:	e3a01002 	mov	r1, #2
  a8:	e5960004 	ldr	r0, [r6, #4]
  ac:	eb000161 	bl	638 <open>
  b0:	e2507000 	subs	r7, r0, #0
  b4:	ba000024 	blt	14c <main+0x14c>
		printf(1,"Could not open %s \n", argv[1]);
		clean(fd);
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  b8:	e1a03007 	mov	r3, r7
  bc:	e5962004 	ldr	r2, [r6, #4]
  c0:	e3a00001 	mov	r0, #1
  c4:	e3001d08 	movw	r1, #3336	; 0xd08
  c8:	e3401000 	movt	r1, #0
  cc:	eb00023d 	bl	9c8 <printf>

	

	lseek(fd, POS, 0);
  d0:	e3a02000 	mov	r2, #0
  d4:	e3a01702 	mov	r1, #524288	; 0x80000
  d8:	e1a00007 	mov	r0, r7
  dc:	eb0000fa 	bl	4cc <lseek>


	result = read(fd, read_buf, 512);
  e0:	e3a02c02 	mov	r2, #512	; 0x200
  e4:	e5951000 	ldr	r1, [r5]
  e8:	e1a00007 	mov	r0, r7
  ec:	eb000110 	bl	534 <read>

	if(result != size) {
  f0:	e350000d 	cmp	r0, #13
  f4:	0a000004 	beq	10c <main+0x10c>
		printf(1, "read %d\n", result);
  f8:	e1a02000 	mov	r2, r0
  fc:	e3001d1c 	movw	r1, #3356	; 0xd1c
 100:	e3a00001 	mov	r0, #1
 104:	e3401000 	movt	r1, #0
 108:	eb00022e 	bl	9c8 <printf>
	}

	printf(1,"%s\n", read_buf);
 10c:	e5952000 	ldr	r2, [r5]
 110:	e3a00001 	mov	r0, #1
 114:	e3001d28 	movw	r1, #3368	; 0xd28
 118:	e3401000 	movt	r1, #0
 11c:	eb000229 	bl	9c8 <printf>

	printf(1, "\n");
 120:	e3a00001 	mov	r0, #1
 124:	e3001cf0 	movw	r1, #3312	; 0xcf0
 128:	e3401000 	movt	r1, #0
 12c:	eb000225 	bl	9c8 <printf>

	free(write_buf);
 130:	e5940000 	ldr	r0, [r4]
 134:	eb00028b 	bl	b68 <free>
	free(read_buf);
 138:	e5950000 	ldr	r0, [r5]
 13c:	eb000289 	bl	b68 <free>
	close(fd);
 140:	e1a00007 	mov	r0, r7
 144:	eb000114 	bl	59c <close>
	exit();	
 148:	eb0000c5 	bl	464 <exit>
		printf(1,"Could not open %s \n", argv[1]);
 14c:	e5962004 	ldr	r2, [r6, #4]
 150:	e3a00001 	mov	r0, #1
 154:	e3001cf4 	movw	r1, #3316	; 0xcf4
 158:	e3401000 	movt	r1, #0
 15c:	eb000219 	bl	9c8 <printf>
		clean(fd);
 160:	e1a00007 	mov	r0, r7
 164:	eb000005 	bl	180 <clean>
 168:	eaffffd2 	b	b8 <main+0xb8>
		printf(1,"Already a device\n");
 16c:	e3001ce0 	movw	r1, #3296	; 0xce0
 170:	e3a00001 	mov	r0, #1
 174:	e3401000 	movt	r1, #0
 178:	eb000212 	bl	9c8 <printf>
 17c:	eaffffc8 	b	a4 <main+0xa4>

00000180 <clean>:
	free(read_buf);
 180:	e3003d58 	movw	r3, #3416	; 0xd58
 184:	e3403000 	movt	r3, #0
void clean(int fd){
 188:	e92d4830 	push	{r4, r5, fp, lr}
 18c:	e1a04000 	mov	r4, r0
 190:	e28db00c 	add	fp, sp, #12
	free(read_buf);
 194:	e5930000 	ldr	r0, [r3]
 198:	eb000272 	bl	b68 <free>
	free(write_buf);
 19c:	e3003d54 	movw	r3, #3412	; 0xd54
 1a0:	e3403000 	movt	r3, #0
 1a4:	e5930000 	ldr	r0, [r3]
 1a8:	eb00026e 	bl	b68 <free>
	if(fd)
 1ac:	e3540000 	cmp	r4, #0
 1b0:	08bd8830 	popeq	{r4, r5, fp, pc}
		close(fd);
 1b4:	e1a00004 	mov	r0, r4
}
 1b8:	e24bd00c 	sub	sp, fp, #12
 1bc:	e8bd4830 	pop	{r4, r5, fp, lr}
		close(fd);
 1c0:	ea0000f5 	b	59c <close>

000001c4 <strcpy>:
 1c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c8:	e2402001 	sub	r2, r0, #1
 1cc:	e28db000 	add	fp, sp, #0
 1d0:	e4d13001 	ldrb	r3, [r1], #1
 1d4:	e3530000 	cmp	r3, #0
 1d8:	e5e23001 	strb	r3, [r2, #1]!
 1dc:	1afffffb 	bne	1d0 <strcpy+0xc>
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr

000001ec <strcmp>:
 1ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f0:	e28db000 	add	fp, sp, #0
 1f4:	e5d03000 	ldrb	r3, [r0]
 1f8:	e5d12000 	ldrb	r2, [r1]
 1fc:	e3530000 	cmp	r3, #0
 200:	1a000004 	bne	218 <strcmp+0x2c>
 204:	ea000005 	b	220 <strcmp+0x34>
 208:	e5f03001 	ldrb	r3, [r0, #1]!
 20c:	e3530000 	cmp	r3, #0
 210:	0a000006 	beq	230 <strcmp+0x44>
 214:	e5f12001 	ldrb	r2, [r1, #1]!
 218:	e1530002 	cmp	r3, r2
 21c:	0afffff9 	beq	208 <strcmp+0x1c>
 220:	e0430002 	sub	r0, r3, r2
 224:	e28bd000 	add	sp, fp, #0
 228:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 22c:	e12fff1e 	bx	lr
 230:	e5d12001 	ldrb	r2, [r1, #1]
 234:	e0430002 	sub	r0, r3, r2
 238:	e28bd000 	add	sp, fp, #0
 23c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 240:	e12fff1e 	bx	lr

00000244 <strlen>:
 244:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 248:	e28db000 	add	fp, sp, #0
 24c:	e5d03000 	ldrb	r3, [r0]
 250:	e3530000 	cmp	r3, #0
 254:	0a000009 	beq	280 <strlen+0x3c>
 258:	e1a02000 	mov	r2, r0
 25c:	e3a03000 	mov	r3, #0
 260:	e5f21001 	ldrb	r1, [r2, #1]!
 264:	e2833001 	add	r3, r3, #1
 268:	e3510000 	cmp	r1, #0
 26c:	e1a00003 	mov	r0, r3
 270:	1afffffa 	bne	260 <strlen+0x1c>
 274:	e28bd000 	add	sp, fp, #0
 278:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 27c:	e12fff1e 	bx	lr
 280:	e1a00003 	mov	r0, r3
 284:	eafffffa 	b	274 <strlen+0x30>

00000288 <memset>:
 288:	e3520000 	cmp	r2, #0
 28c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 290:	e28db000 	add	fp, sp, #0
 294:	0a000004 	beq	2ac <memset+0x24>
 298:	e6ef1071 	uxtb	r1, r1
 29c:	e0802002 	add	r2, r0, r2
 2a0:	e4c01001 	strb	r1, [r0], #1
 2a4:	e1520000 	cmp	r2, r0
 2a8:	1afffffc 	bne	2a0 <memset+0x18>
 2ac:	e28bd000 	add	sp, fp, #0
 2b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b4:	e12fff1e 	bx	lr

000002b8 <strchr>:
 2b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2bc:	e28db000 	add	fp, sp, #0
 2c0:	e5d02000 	ldrb	r2, [r0]
 2c4:	e3520000 	cmp	r2, #0
 2c8:	0a00000b 	beq	2fc <strchr+0x44>
 2cc:	e1510002 	cmp	r1, r2
 2d0:	1a000002 	bne	2e0 <strchr+0x28>
 2d4:	ea000005 	b	2f0 <strchr+0x38>
 2d8:	e1530001 	cmp	r3, r1
 2dc:	0a000003 	beq	2f0 <strchr+0x38>
 2e0:	e5f03001 	ldrb	r3, [r0, #1]!
 2e4:	e3530000 	cmp	r3, #0
 2e8:	1afffffa 	bne	2d8 <strchr+0x20>
 2ec:	e1a00003 	mov	r0, r3
 2f0:	e28bd000 	add	sp, fp, #0
 2f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2f8:	e12fff1e 	bx	lr
 2fc:	e1a00002 	mov	r0, r2
 300:	eafffffa 	b	2f0 <strchr+0x38>

00000304 <gets>:
 304:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 308:	e1a08000 	mov	r8, r0
 30c:	e28db018 	add	fp, sp, #24
 310:	e1a07001 	mov	r7, r1
 314:	e24dd00c 	sub	sp, sp, #12
 318:	e2406001 	sub	r6, r0, #1
 31c:	e3a05000 	mov	r5, #0
 320:	ea000008 	b	348 <gets+0x44>
 324:	eb000082 	bl	534 <read>
 328:	e3500000 	cmp	r0, #0
 32c:	da00000b 	ble	360 <gets+0x5c>
 330:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 334:	e1a05004 	mov	r5, r4
 338:	e353000d 	cmp	r3, #13
 33c:	1353000a 	cmpne	r3, #10
 340:	e5e63001 	strb	r3, [r6, #1]!
 344:	0a000005 	beq	360 <gets+0x5c>
 348:	e3a02001 	mov	r2, #1
 34c:	e0854002 	add	r4, r5, r2
 350:	e1540007 	cmp	r4, r7
 354:	e24b101d 	sub	r1, fp, #29
 358:	e3a00000 	mov	r0, #0
 35c:	bafffff0 	blt	324 <gets+0x20>
 360:	e3a03000 	mov	r3, #0
 364:	e1a00008 	mov	r0, r8
 368:	e7c83005 	strb	r3, [r8, r5]
 36c:	e24bd018 	sub	sp, fp, #24
 370:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000374 <stat>:
 374:	e92d4830 	push	{r4, r5, fp, lr}
 378:	e1a04001 	mov	r4, r1
 37c:	e28db00c 	add	fp, sp, #12
 380:	e3a01000 	mov	r1, #0
 384:	eb0000ab 	bl	638 <open>
 388:	e2505000 	subs	r5, r0, #0
 38c:	ba000006 	blt	3ac <stat+0x38>
 390:	e1a01004 	mov	r1, r4
 394:	eb0000ce 	bl	6d4 <fstat>
 398:	e1a04000 	mov	r4, r0
 39c:	e1a00005 	mov	r0, r5
 3a0:	eb00007d 	bl	59c <close>
 3a4:	e1a00004 	mov	r0, r4
 3a8:	e8bd8830 	pop	{r4, r5, fp, pc}
 3ac:	e3e04000 	mvn	r4, #0
 3b0:	eafffffb 	b	3a4 <stat+0x30>

000003b4 <atoi>:
 3b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3b8:	e28db000 	add	fp, sp, #0
 3bc:	e5d02000 	ldrb	r2, [r0]
 3c0:	e2423030 	sub	r3, r2, #48	; 0x30
 3c4:	e3530009 	cmp	r3, #9
 3c8:	e3a03000 	mov	r3, #0
 3cc:	8a000006 	bhi	3ec <atoi+0x38>
 3d0:	e3a0c00a 	mov	ip, #10
 3d4:	e023239c 	mla	r3, ip, r3, r2
 3d8:	e5f02001 	ldrb	r2, [r0, #1]!
 3dc:	e2421030 	sub	r1, r2, #48	; 0x30
 3e0:	e3510009 	cmp	r1, #9
 3e4:	e2433030 	sub	r3, r3, #48	; 0x30
 3e8:	9afffff9 	bls	3d4 <atoi+0x20>
 3ec:	e1a00003 	mov	r0, r3
 3f0:	e28bd000 	add	sp, fp, #0
 3f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <memmove>:
 3fc:	e3520000 	cmp	r2, #0
 400:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 404:	e28db000 	add	fp, sp, #0
 408:	da000005 	ble	424 <memmove+0x28>
 40c:	e0812002 	add	r2, r1, r2
 410:	e2403001 	sub	r3, r0, #1
 414:	e4d1c001 	ldrb	ip, [r1], #1
 418:	e1510002 	cmp	r1, r2
 41c:	e5e3c001 	strb	ip, [r3, #1]!
 420:	1afffffb 	bne	414 <memmove+0x18>
 424:	e28bd000 	add	sp, fp, #0
 428:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <fork>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00001 	mov	r0, #1
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <exit>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00002 	mov	r0, #2
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <wait>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00003 	mov	r0, #3
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <lseek>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00016 	mov	r0, #22
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <pipe>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00004 	mov	r0, #4
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <read>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00005 	mov	r0, #5
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <write>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00010 	mov	r0, #16
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <close>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00015 	mov	r0, #21
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <kill>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00006 	mov	r0, #6
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <exec>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00007 	mov	r0, #7
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <open>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a0000f 	mov	r0, #15
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <mknod>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00011 	mov	r0, #17
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <unlink>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a00012 	mov	r0, #18
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <fstat>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a00008 	mov	r0, #8
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <link>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a00013 	mov	r0, #19
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <mkdir>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a00014 	mov	r0, #20
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <chdir>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a00009 	mov	r0, #9
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <dup>:
 7a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b8:	e3a0000a 	mov	r0, #10
 7bc:	ef000040 	svc	0x00000040
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d4:	e12fff1e 	bx	lr

000007d8 <getpid>:
 7d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ec:	e3a0000b 	mov	r0, #11
 7f0:	ef000040 	svc	0x00000040
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 800:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 804:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 808:	e12fff1e 	bx	lr

0000080c <sbrk>:
 80c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 810:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 814:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 818:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 81c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 820:	e3a0000c 	mov	r0, #12
 824:	ef000040 	svc	0x00000040
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 830:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 834:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 838:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 83c:	e12fff1e 	bx	lr

00000840 <sleep>:
 840:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 844:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 848:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 84c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 850:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 854:	e3a0000d 	mov	r0, #13
 858:	ef000040 	svc	0x00000040
 85c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 860:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 864:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 868:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 86c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 870:	e12fff1e 	bx	lr

00000874 <uptime>:
 874:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 878:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 87c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 880:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 884:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 888:	e3a0000e 	mov	r0, #14
 88c:	ef000040 	svc	0x00000040
 890:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 894:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 898:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 89c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8a4:	e12fff1e 	bx	lr

000008a8 <printint>:
 8a8:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 8ac:	e1a09fa1 	lsr	r9, r1, #31
 8b0:	e3530000 	cmp	r3, #0
 8b4:	03a09000 	moveq	r9, #0
 8b8:	12099001 	andne	r9, r9, #1
 8bc:	e28db01c 	add	fp, sp, #28
 8c0:	e3590000 	cmp	r9, #0
 8c4:	e3008d2c 	movw	r8, #3372	; 0xd2c
 8c8:	1261e000 	rsbne	lr, r1, #0
 8cc:	e3408000 	movt	r8, #0
 8d0:	e24b602d 	sub	r6, fp, #45	; 0x2d
 8d4:	e1a04000 	mov	r4, r0
 8d8:	13a09001 	movne	r9, #1
 8dc:	01a0e001 	moveq	lr, r1
 8e0:	e3a07000 	mov	r7, #0
 8e4:	e3a05001 	mov	r5, #1
 8e8:	e24dd018 	sub	sp, sp, #24
 8ec:	e3a0c000 	mov	ip, #0
 8f0:	e3a0301f 	mov	r3, #31
 8f4:	e1a0100c 	mov	r1, ip
 8f8:	e1a0033e 	lsr	r0, lr, r3
 8fc:	e2000001 	and	r0, r0, #1
 900:	e1801081 	orr	r1, r0, r1, lsl #1
 904:	e1520001 	cmp	r2, r1
 908:	90411002 	subls	r1, r1, r2
 90c:	918cc315 	orrls	ip, ip, r5, lsl r3
 910:	e2533001 	subs	r3, r3, #1
 914:	2afffff7 	bcs	8f8 <printint+0x50>
 918:	e061e29c 	mls	r1, ip, r2, lr
 91c:	e35c0000 	cmp	ip, #0
 920:	e1a0e00c 	mov	lr, ip
 924:	e2873001 	add	r3, r7, #1
 928:	e7d81001 	ldrb	r1, [r8, r1]
 92c:	e5e61001 	strb	r1, [r6, #1]!
 930:	11a07003 	movne	r7, r3
 934:	1affffec 	bne	8ec <printint+0x44>
 938:	e3590000 	cmp	r9, #0
 93c:	124b201c 	subne	r2, fp, #28
 940:	10822003 	addne	r2, r2, r3
 944:	13a0102d 	movne	r1, #45	; 0x2d
 948:	12873002 	addne	r3, r7, #2
 94c:	15421010 	strbne	r1, [r2, #-16]
 950:	e24b202c 	sub	r2, fp, #44	; 0x2c
 954:	e2435001 	sub	r5, r3, #1
 958:	e0826003 	add	r6, r2, r3
 95c:	e5763001 	ldrb	r3, [r6, #-1]!
 960:	e2455001 	sub	r5, r5, #1
 964:	e3a02001 	mov	r2, #1
 968:	e24b102d 	sub	r1, fp, #45	; 0x2d
 96c:	e1a00004 	mov	r0, r4
 970:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 974:	ebfffefb 	bl	568 <write>
 978:	e3750001 	cmn	r5, #1
 97c:	1afffff6 	bne	95c <printint+0xb4>
 980:	e24bd01c 	sub	sp, fp, #28
 984:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000988 <div>:
 988:	e92d4810 	push	{r4, fp, lr}
 98c:	e3a02000 	mov	r2, #0
 990:	e28db008 	add	fp, sp, #8
 994:	e1a0e000 	mov	lr, r0
 998:	e3a0301f 	mov	r3, #31
 99c:	e1a00002 	mov	r0, r2
 9a0:	e3a04001 	mov	r4, #1
 9a4:	e1a0c33e 	lsr	ip, lr, r3
 9a8:	e20cc001 	and	ip, ip, #1
 9ac:	e18c2082 	orr	r2, ip, r2, lsl #1
 9b0:	e1520001 	cmp	r2, r1
 9b4:	20422001 	subcs	r2, r2, r1
 9b8:	21800314 	orrcs	r0, r0, r4, lsl r3
 9bc:	e2533001 	subs	r3, r3, #1
 9c0:	2afffff7 	bcs	9a4 <div+0x1c>
 9c4:	e8bd8810 	pop	{r4, fp, pc}

000009c8 <printf>:
 9c8:	e92d000e 	push	{r1, r2, r3}
 9cc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 9d0:	e28db018 	add	fp, sp, #24
 9d4:	e24dd008 	sub	sp, sp, #8
 9d8:	e59b6004 	ldr	r6, [fp, #4]
 9dc:	e5d64000 	ldrb	r4, [r6]
 9e0:	e3540000 	cmp	r4, #0
 9e4:	0a00002b 	beq	a98 <printf+0xd0>
 9e8:	e1a07000 	mov	r7, r0
 9ec:	e28b8008 	add	r8, fp, #8
 9f0:	e3a05000 	mov	r5, #0
 9f4:	ea00000a 	b	a24 <printf+0x5c>
 9f8:	e3540025 	cmp	r4, #37	; 0x25
 9fc:	01a05004 	moveq	r5, r4
 a00:	0a000004 	beq	a18 <printf+0x50>
 a04:	e24b1018 	sub	r1, fp, #24
 a08:	e3a02001 	mov	r2, #1
 a0c:	e1a00007 	mov	r0, r7
 a10:	e5614006 	strb	r4, [r1, #-6]!
 a14:	ebfffed3 	bl	568 <write>
 a18:	e5f64001 	ldrb	r4, [r6, #1]!
 a1c:	e3540000 	cmp	r4, #0
 a20:	0a00001c 	beq	a98 <printf+0xd0>
 a24:	e3550000 	cmp	r5, #0
 a28:	0afffff2 	beq	9f8 <printf+0x30>
 a2c:	e3550025 	cmp	r5, #37	; 0x25
 a30:	1afffff8 	bne	a18 <printf+0x50>
 a34:	e3540064 	cmp	r4, #100	; 0x64
 a38:	0a000037 	beq	b1c <printf+0x154>
 a3c:	e20430f7 	and	r3, r4, #247	; 0xf7
 a40:	e3530070 	cmp	r3, #112	; 0x70
 a44:	0a000017 	beq	aa8 <printf+0xe0>
 a48:	e3540073 	cmp	r4, #115	; 0x73
 a4c:	0a00001c 	beq	ac4 <printf+0xfc>
 a50:	e3540063 	cmp	r4, #99	; 0x63
 a54:	0a000037 	beq	b38 <printf+0x170>
 a58:	e3540025 	cmp	r4, #37	; 0x25
 a5c:	0a000027 	beq	b00 <printf+0x138>
 a60:	e3a02001 	mov	r2, #1
 a64:	e24b1019 	sub	r1, fp, #25
 a68:	e1a00007 	mov	r0, r7
 a6c:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a70:	ebfffebc 	bl	568 <write>
 a74:	e3a02001 	mov	r2, #1
 a78:	e24b101a 	sub	r1, fp, #26
 a7c:	e1a00007 	mov	r0, r7
 a80:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a84:	ebfffeb7 	bl	568 <write>
 a88:	e5f64001 	ldrb	r4, [r6, #1]!
 a8c:	e3a05000 	mov	r5, #0
 a90:	e3540000 	cmp	r4, #0
 a94:	1affffe2 	bne	a24 <printf+0x5c>
 a98:	e24bd018 	sub	sp, fp, #24
 a9c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 aa0:	e28dd00c 	add	sp, sp, #12
 aa4:	e12fff1e 	bx	lr
 aa8:	e3a03000 	mov	r3, #0
 aac:	e3a02010 	mov	r2, #16
 ab0:	e4981004 	ldr	r1, [r8], #4
 ab4:	e1a00007 	mov	r0, r7
 ab8:	ebffff7a 	bl	8a8 <printint>
 abc:	e3a05000 	mov	r5, #0
 ac0:	eaffffd4 	b	a18 <printf+0x50>
 ac4:	e4984004 	ldr	r4, [r8], #4
 ac8:	e3540000 	cmp	r4, #0
 acc:	0a000021 	beq	b58 <printf+0x190>
 ad0:	e5d45000 	ldrb	r5, [r4]
 ad4:	e3550000 	cmp	r5, #0
 ad8:	0affffce 	beq	a18 <printf+0x50>
 adc:	e3a02001 	mov	r2, #1
 ae0:	e24b101d 	sub	r1, fp, #29
 ae4:	e1a00007 	mov	r0, r7
 ae8:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 aec:	ebfffe9d 	bl	568 <write>
 af0:	e5f45001 	ldrb	r5, [r4, #1]!
 af4:	e3550000 	cmp	r5, #0
 af8:	1afffff7 	bne	adc <printf+0x114>
 afc:	eaffffc5 	b	a18 <printf+0x50>
 b00:	e24b1018 	sub	r1, fp, #24
 b04:	e3a02001 	mov	r2, #1
 b08:	e1a00007 	mov	r0, r7
 b0c:	e5615003 	strb	r5, [r1, #-3]!
 b10:	e3a05000 	mov	r5, #0
 b14:	ebfffe93 	bl	568 <write>
 b18:	eaffffbe 	b	a18 <printf+0x50>
 b1c:	e3a03001 	mov	r3, #1
 b20:	e3a0200a 	mov	r2, #10
 b24:	e4981004 	ldr	r1, [r8], #4
 b28:	e1a00007 	mov	r0, r7
 b2c:	ebffff5d 	bl	8a8 <printint>
 b30:	e3a05000 	mov	r5, #0
 b34:	eaffffb7 	b	a18 <printf+0x50>
 b38:	e4983004 	ldr	r3, [r8], #4
 b3c:	e24b1018 	sub	r1, fp, #24
 b40:	e3a02001 	mov	r2, #1
 b44:	e1a00007 	mov	r0, r7
 b48:	e3a05000 	mov	r5, #0
 b4c:	e5613004 	strb	r3, [r1, #-4]!
 b50:	ebfffe84 	bl	568 <write>
 b54:	eaffffaf 	b	a18 <printf+0x50>
 b58:	e3004d40 	movw	r4, #3392	; 0xd40
 b5c:	e3a05028 	mov	r5, #40	; 0x28
 b60:	e3404000 	movt	r4, #0
 b64:	eaffffdc 	b	adc <printf+0x114>

00000b68 <free>:
 b68:	e300cd48 	movw	ip, #3400	; 0xd48
 b6c:	e340c000 	movt	ip, #0
 b70:	e92d4810 	push	{r4, fp, lr}
 b74:	e2401008 	sub	r1, r0, #8
 b78:	e28db008 	add	fp, sp, #8
 b7c:	e59c3000 	ldr	r3, [ip]
 b80:	ea000004 	b	b98 <free+0x30>
 b84:	e1510002 	cmp	r1, r2
 b88:	3a000009 	bcc	bb4 <free+0x4c>
 b8c:	e1530002 	cmp	r3, r2
 b90:	2a000007 	bcs	bb4 <free+0x4c>
 b94:	e1a03002 	mov	r3, r2
 b98:	e1530001 	cmp	r3, r1
 b9c:	e5932000 	ldr	r2, [r3]
 ba0:	3afffff7 	bcc	b84 <free+0x1c>
 ba4:	e1530002 	cmp	r3, r2
 ba8:	3afffff9 	bcc	b94 <free+0x2c>
 bac:	e1510002 	cmp	r1, r2
 bb0:	2afffff7 	bcs	b94 <free+0x2c>
 bb4:	e510e004 	ldr	lr, [r0, #-4]
 bb8:	e58c3000 	str	r3, [ip]
 bbc:	e081418e 	add	r4, r1, lr, lsl #3
 bc0:	e1520004 	cmp	r2, r4
 bc4:	05922004 	ldreq	r2, [r2, #4]
 bc8:	0082e00e 	addeq	lr, r2, lr
 bcc:	0500e004 	streq	lr, [r0, #-4]
 bd0:	05932000 	ldreq	r2, [r3]
 bd4:	05922000 	ldreq	r2, [r2]
 bd8:	e5002008 	str	r2, [r0, #-8]
 bdc:	e5932004 	ldr	r2, [r3, #4]
 be0:	e083e182 	add	lr, r3, r2, lsl #3
 be4:	e151000e 	cmp	r1, lr
 be8:	15831000 	strne	r1, [r3]
 bec:	05101004 	ldreq	r1, [r0, #-4]
 bf0:	00812002 	addeq	r2, r1, r2
 bf4:	05832004 	streq	r2, [r3, #4]
 bf8:	05102008 	ldreq	r2, [r0, #-8]
 bfc:	05832000 	streq	r2, [r3]
 c00:	e8bd8810 	pop	{r4, fp, pc}

00000c04 <malloc>:
 c04:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 c08:	e3007d48 	movw	r7, #3400	; 0xd48
 c0c:	e3407000 	movt	r7, #0
 c10:	e2804007 	add	r4, r0, #7
 c14:	e28db014 	add	fp, sp, #20
 c18:	e5973000 	ldr	r3, [r7]
 c1c:	e1a041a4 	lsr	r4, r4, #3
 c20:	e2844001 	add	r4, r4, #1
 c24:	e3530000 	cmp	r3, #0
 c28:	0a000027 	beq	ccc <malloc+0xc8>
 c2c:	e5930000 	ldr	r0, [r3]
 c30:	e5902004 	ldr	r2, [r0, #4]
 c34:	e1540002 	cmp	r4, r2
 c38:	9a000019 	bls	ca4 <malloc+0xa0>
 c3c:	e3540a01 	cmp	r4, #4096	; 0x1000
 c40:	21a05004 	movcs	r5, r4
 c44:	33a05a01 	movcc	r5, #4096	; 0x1000
 c48:	e1a06185 	lsl	r6, r5, #3
 c4c:	ea000003 	b	c60 <malloc+0x5c>
 c50:	e5930000 	ldr	r0, [r3]
 c54:	e5902004 	ldr	r2, [r0, #4]
 c58:	e1540002 	cmp	r4, r2
 c5c:	9a000010 	bls	ca4 <malloc+0xa0>
 c60:	e5972000 	ldr	r2, [r7]
 c64:	e1a03000 	mov	r3, r0
 c68:	e1520000 	cmp	r2, r0
 c6c:	1afffff7 	bne	c50 <malloc+0x4c>
 c70:	e1a00006 	mov	r0, r6
 c74:	ebfffee4 	bl	80c <sbrk>
 c78:	e1a03000 	mov	r3, r0
 c7c:	e3730001 	cmn	r3, #1
 c80:	e2800008 	add	r0, r0, #8
 c84:	0a000004 	beq	c9c <malloc+0x98>
 c88:	e5835004 	str	r5, [r3, #4]
 c8c:	ebffffb5 	bl	b68 <free>
 c90:	e5973000 	ldr	r3, [r7]
 c94:	e3530000 	cmp	r3, #0
 c98:	1affffec 	bne	c50 <malloc+0x4c>
 c9c:	e3a00000 	mov	r0, #0
 ca0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 ca4:	e1540002 	cmp	r4, r2
 ca8:	e5873000 	str	r3, [r7]
 cac:	10422004 	subne	r2, r2, r4
 cb0:	15802004 	strne	r2, [r0, #4]
 cb4:	05902000 	ldreq	r2, [r0]
 cb8:	10800182 	addne	r0, r0, r2, lsl #3
 cbc:	e2800008 	add	r0, r0, #8
 cc0:	15004004 	strne	r4, [r0, #-4]
 cc4:	05832000 	streq	r2, [r3]
 cc8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 ccc:	e2870004 	add	r0, r7, #4
 cd0:	e5873008 	str	r3, [r7, #8]
 cd4:	e5870000 	str	r0, [r7]
 cd8:	e5870004 	str	r0, [r7, #4]
 cdc:	eaffffd6 	b	c3c <malloc+0x38>
