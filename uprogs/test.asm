
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

	read_buf = malloc(sizeof(*read_buf) * 512);
   4:	e3a00c02 	mov	r0, #512	; 0x200
int main(int argc, char *argv[]) {
   8:	e28db014 	add	fp, sp, #20
   c:	e24dd010 	sub	sp, sp, #16
  10:	e1a06001 	mov	r6, r1
	read_buf = malloc(sizeof(*read_buf) * 512);
  14:	eb000311 	bl	c60 <malloc>
  18:	e3005dbc 	movw	r5, #3516	; 0xdbc
  1c:	e3405000 	movt	r5, #0
	write_buf = malloc(sizeof(*write_buf) * 512);
  20:	e3004db8 	movw	r4, #3512	; 0xdb8
  24:	e3404000 	movt	r4, #0
	read_buf = malloc(sizeof(*read_buf) * 512);
  28:	e5850000 	str	r0, [r5]
	write_buf = malloc(sizeof(*write_buf) * 512);
  2c:	e3a00c02 	mov	r0, #512	; 0x200
  30:	eb00030a 	bl	c60 <malloc>


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
	write_buf = malloc(sizeof(*write_buf) * 512);
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
  98:	eb00018a 	bl	6c8 <mknod>
  9c:	e3500000 	cmp	r0, #0
  a0:	ba000046 	blt	1c0 <main+0x1c0>
		printf(1,"mknod failure");
		clean(fd);
	}
	
	if( (fd = open(argv[1],O_RDWR)) < 0 ){
  a4:	e3a01002 	mov	r1, #2
  a8:	e5960004 	ldr	r0, [r6, #4]
  ac:	eb000178 	bl	694 <open>
  b0:	e2507000 	subs	r7, r0, #0
  b4:	ba000039 	blt	1a0 <main+0x1a0>
		printf(1,"Could not open %s \n", argv[1]);
		clean(fd);
	}
	printf(1,"opened : %s FD: %d\n",argv[1],fd);
  b8:	e1a03007 	mov	r3, r7
  bc:	e5962004 	ldr	r2, [r6, #4]
  c0:	e3a00001 	mov	r0, #1
  c4:	e3001d60 	movw	r1, #3424	; 0xd60
  c8:	e3401000 	movt	r1, #0
  cc:	eb000254 	bl	a24 <printf>

	

	lseek(fd, pos, 0);
  d0:	e3a02000 	mov	r2, #0
  d4:	e3a01701 	mov	r1, #262144	; 0x40000
  d8:	e1a00007 	mov	r0, r7
  dc:	eb000111 	bl	528 <lseek>

	result = write(fd, write_buf, 512);
  e0:	e5941000 	ldr	r1, [r4]
  e4:	e3a02c02 	mov	r2, #512	; 0x200
  e8:	e1a00007 	mov	r0, r7
  ec:	eb000134 	bl	5c4 <write>

	if(result != size){
  f0:	e350000d 	cmp	r0, #13
  f4:	0a000004 	beq	10c <main+0x10c>
		printf(1, "write %d\n", result);
  f8:	e1a02000 	mov	r2, r0
  fc:	e3001d74 	movw	r1, #3444	; 0xd74
 100:	e3a00001 	mov	r0, #1
 104:	e3401000 	movt	r1, #0
 108:	eb000245 	bl	a24 <printf>
	}

	lseek(fd, pos, 0);
 10c:	e3a02000 	mov	r2, #0
 110:	e3a01701 	mov	r1, #262144	; 0x40000
 114:	e1a00007 	mov	r0, r7
 118:	eb000102 	bl	528 <lseek>

	
	

	result = read(fd, read_buf, 512);
 11c:	e1a00007 	mov	r0, r7
 120:	e3a02c02 	mov	r2, #512	; 0x200
 124:	e5951000 	ldr	r1, [r5]
 128:	eb000118 	bl	590 <read>

	if(result != size) {
 12c:	e350000d 	cmp	r0, #13
	result = read(fd, read_buf, 512);
 130:	e1a06000 	mov	r6, r0
	if(result != size) {
 134:	1a000011 	bne	180 <main+0x180>
		printf(1, "read %d\n", result);
	}

	for(i=0;i<result;i++){
		printf(1, "%c ", read_buf[i]);
 138:	e3007d8c 	movw	r7, #3468	; 0xd8c
 13c:	e3407000 	movt	r7, #0
	for(i=0;i<size;i++)
 140:	e3a04000 	mov	r4, #0
		printf(1, "%c ", read_buf[i]);
 144:	e5953000 	ldr	r3, [r5]
 148:	e3a00001 	mov	r0, #1
 14c:	e1a01007 	mov	r1, r7
 150:	e7d32004 	ldrb	r2, [r3, r4]
	for(i=0;i<result;i++){
 154:	e0844000 	add	r4, r4, r0
		printf(1, "%c ", read_buf[i]);
 158:	eb000231 	bl	a24 <printf>
	for(i=0;i<result;i++){
 15c:	e1560004 	cmp	r6, r4
 160:	cafffff7 	bgt	144 <main+0x144>
	}

	printf(1, "\n");
 164:	e3a00001 	mov	r0, #1
 168:	e3001d7c 	movw	r1, #3452	; 0xd7c
 16c:	e3401000 	movt	r1, #0
 170:	eb00022b 	bl	a24 <printf>

	return 0;
}
 174:	e3a00000 	mov	r0, #0
 178:	e24bd014 	sub	sp, fp, #20
 17c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
		printf(1, "read %d\n", result);
 180:	e1a02000 	mov	r2, r0
 184:	e3001d80 	movw	r1, #3456	; 0xd80
 188:	e3a00001 	mov	r0, #1
 18c:	e3401000 	movt	r1, #0
 190:	eb000223 	bl	a24 <printf>
	for(i=0;i<result;i++){
 194:	e3560000 	cmp	r6, #0
 198:	caffffe6 	bgt	138 <main+0x138>
 19c:	eafffff0 	b	164 <main+0x164>
		printf(1,"Could not open %s \n", argv[1]);
 1a0:	e5962004 	ldr	r2, [r6, #4]
 1a4:	e3a00001 	mov	r0, #1
 1a8:	e3001d4c 	movw	r1, #3404	; 0xd4c
 1ac:	e3401000 	movt	r1, #0
 1b0:	eb00021b 	bl	a24 <printf>
		clean(fd);
 1b4:	e1a00007 	mov	r0, r7
 1b8:	eb000007 	bl	1dc <clean>
 1bc:	eaffffbd 	b	b8 <main+0xb8>
		printf(1,"mknod failure");
 1c0:	e3a00001 	mov	r0, #1
 1c4:	e3001d3c 	movw	r1, #3388	; 0xd3c
 1c8:	e3401000 	movt	r1, #0
 1cc:	eb000214 	bl	a24 <printf>
		clean(fd);
 1d0:	e3a00000 	mov	r0, #0
 1d4:	eb000000 	bl	1dc <clean>
 1d8:	eaffffb1 	b	a4 <main+0xa4>

000001dc <clean>:
	free(read_buf);
 1dc:	e3003dbc 	movw	r3, #3516	; 0xdbc
 1e0:	e3403000 	movt	r3, #0
void clean(int fd){
 1e4:	e92d4830 	push	{r4, r5, fp, lr}
 1e8:	e1a04000 	mov	r4, r0
 1ec:	e28db00c 	add	fp, sp, #12
	free(read_buf);
 1f0:	e5930000 	ldr	r0, [r3]
 1f4:	eb000272 	bl	bc4 <free>
	free(write_buf);
 1f8:	e3003db8 	movw	r3, #3512	; 0xdb8
 1fc:	e3403000 	movt	r3, #0
 200:	e5930000 	ldr	r0, [r3]
 204:	eb00026e 	bl	bc4 <free>
	if(fd)
 208:	e3540000 	cmp	r4, #0
 20c:	08bd8830 	popeq	{r4, r5, fp, pc}
		close(fd);
 210:	e1a00004 	mov	r0, r4
}
 214:	e24bd00c 	sub	sp, fp, #12
 218:	e8bd4830 	pop	{r4, r5, fp, lr}
		close(fd);
 21c:	ea0000f5 	b	5f8 <close>

00000220 <strcpy>:
 220:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 224:	e2402001 	sub	r2, r0, #1
 228:	e28db000 	add	fp, sp, #0
 22c:	e4d13001 	ldrb	r3, [r1], #1
 230:	e3530000 	cmp	r3, #0
 234:	e5e23001 	strb	r3, [r2, #1]!
 238:	1afffffb 	bne	22c <strcpy+0xc>
 23c:	e28bd000 	add	sp, fp, #0
 240:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 244:	e12fff1e 	bx	lr

00000248 <strcmp>:
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
 250:	e5d03000 	ldrb	r3, [r0]
 254:	e5d12000 	ldrb	r2, [r1]
 258:	e3530000 	cmp	r3, #0
 25c:	1a000004 	bne	274 <strcmp+0x2c>
 260:	ea000005 	b	27c <strcmp+0x34>
 264:	e5f03001 	ldrb	r3, [r0, #1]!
 268:	e3530000 	cmp	r3, #0
 26c:	0a000006 	beq	28c <strcmp+0x44>
 270:	e5f12001 	ldrb	r2, [r1, #1]!
 274:	e1530002 	cmp	r3, r2
 278:	0afffff9 	beq	264 <strcmp+0x1c>
 27c:	e0430002 	sub	r0, r3, r2
 280:	e28bd000 	add	sp, fp, #0
 284:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 288:	e12fff1e 	bx	lr
 28c:	e5d12001 	ldrb	r2, [r1, #1]
 290:	e0430002 	sub	r0, r3, r2
 294:	e28bd000 	add	sp, fp, #0
 298:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 29c:	e12fff1e 	bx	lr

000002a0 <strlen>:
 2a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2a4:	e28db000 	add	fp, sp, #0
 2a8:	e5d03000 	ldrb	r3, [r0]
 2ac:	e3530000 	cmp	r3, #0
 2b0:	0a000009 	beq	2dc <strlen+0x3c>
 2b4:	e1a02000 	mov	r2, r0
 2b8:	e3a03000 	mov	r3, #0
 2bc:	e5f21001 	ldrb	r1, [r2, #1]!
 2c0:	e2833001 	add	r3, r3, #1
 2c4:	e3510000 	cmp	r1, #0
 2c8:	e1a00003 	mov	r0, r3
 2cc:	1afffffa 	bne	2bc <strlen+0x1c>
 2d0:	e28bd000 	add	sp, fp, #0
 2d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d8:	e12fff1e 	bx	lr
 2dc:	e1a00003 	mov	r0, r3
 2e0:	eafffffa 	b	2d0 <strlen+0x30>

000002e4 <memset>:
 2e4:	e3520000 	cmp	r2, #0
 2e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ec:	e28db000 	add	fp, sp, #0
 2f0:	0a000004 	beq	308 <memset+0x24>
 2f4:	e6ef1071 	uxtb	r1, r1
 2f8:	e0802002 	add	r2, r0, r2
 2fc:	e4c01001 	strb	r1, [r0], #1
 300:	e1520000 	cmp	r2, r0
 304:	1afffffc 	bne	2fc <memset+0x18>
 308:	e28bd000 	add	sp, fp, #0
 30c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 310:	e12fff1e 	bx	lr

00000314 <strchr>:
 314:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 318:	e28db000 	add	fp, sp, #0
 31c:	e5d02000 	ldrb	r2, [r0]
 320:	e3520000 	cmp	r2, #0
 324:	0a00000b 	beq	358 <strchr+0x44>
 328:	e1510002 	cmp	r1, r2
 32c:	1a000002 	bne	33c <strchr+0x28>
 330:	ea000005 	b	34c <strchr+0x38>
 334:	e1530001 	cmp	r3, r1
 338:	0a000003 	beq	34c <strchr+0x38>
 33c:	e5f03001 	ldrb	r3, [r0, #1]!
 340:	e3530000 	cmp	r3, #0
 344:	1afffffa 	bne	334 <strchr+0x20>
 348:	e1a00003 	mov	r0, r3
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr
 358:	e1a00002 	mov	r0, r2
 35c:	eafffffa 	b	34c <strchr+0x38>

00000360 <gets>:
 360:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 364:	e1a08000 	mov	r8, r0
 368:	e28db018 	add	fp, sp, #24
 36c:	e1a07001 	mov	r7, r1
 370:	e24dd00c 	sub	sp, sp, #12
 374:	e2406001 	sub	r6, r0, #1
 378:	e3a05000 	mov	r5, #0
 37c:	ea000008 	b	3a4 <gets+0x44>
 380:	eb000082 	bl	590 <read>
 384:	e3500000 	cmp	r0, #0
 388:	da00000b 	ble	3bc <gets+0x5c>
 38c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 390:	e1a05004 	mov	r5, r4
 394:	e353000d 	cmp	r3, #13
 398:	1353000a 	cmpne	r3, #10
 39c:	e5e63001 	strb	r3, [r6, #1]!
 3a0:	0a000005 	beq	3bc <gets+0x5c>
 3a4:	e3a02001 	mov	r2, #1
 3a8:	e0854002 	add	r4, r5, r2
 3ac:	e1540007 	cmp	r4, r7
 3b0:	e24b101d 	sub	r1, fp, #29
 3b4:	e3a00000 	mov	r0, #0
 3b8:	bafffff0 	blt	380 <gets+0x20>
 3bc:	e3a03000 	mov	r3, #0
 3c0:	e1a00008 	mov	r0, r8
 3c4:	e7c83005 	strb	r3, [r8, r5]
 3c8:	e24bd018 	sub	sp, fp, #24
 3cc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000003d0 <stat>:
 3d0:	e92d4830 	push	{r4, r5, fp, lr}
 3d4:	e1a04001 	mov	r4, r1
 3d8:	e28db00c 	add	fp, sp, #12
 3dc:	e3a01000 	mov	r1, #0
 3e0:	eb0000ab 	bl	694 <open>
 3e4:	e2505000 	subs	r5, r0, #0
 3e8:	ba000006 	blt	408 <stat+0x38>
 3ec:	e1a01004 	mov	r1, r4
 3f0:	eb0000ce 	bl	730 <fstat>
 3f4:	e1a04000 	mov	r4, r0
 3f8:	e1a00005 	mov	r0, r5
 3fc:	eb00007d 	bl	5f8 <close>
 400:	e1a00004 	mov	r0, r4
 404:	e8bd8830 	pop	{r4, r5, fp, pc}
 408:	e3e04000 	mvn	r4, #0
 40c:	eafffffb 	b	400 <stat+0x30>

00000410 <atoi>:
 410:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 414:	e28db000 	add	fp, sp, #0
 418:	e5d02000 	ldrb	r2, [r0]
 41c:	e2423030 	sub	r3, r2, #48	; 0x30
 420:	e3530009 	cmp	r3, #9
 424:	e3a03000 	mov	r3, #0
 428:	8a000006 	bhi	448 <atoi+0x38>
 42c:	e3a0c00a 	mov	ip, #10
 430:	e023239c 	mla	r3, ip, r3, r2
 434:	e5f02001 	ldrb	r2, [r0, #1]!
 438:	e2421030 	sub	r1, r2, #48	; 0x30
 43c:	e3510009 	cmp	r1, #9
 440:	e2433030 	sub	r3, r3, #48	; 0x30
 444:	9afffff9 	bls	430 <atoi+0x20>
 448:	e1a00003 	mov	r0, r3
 44c:	e28bd000 	add	sp, fp, #0
 450:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 454:	e12fff1e 	bx	lr

00000458 <memmove>:
 458:	e3520000 	cmp	r2, #0
 45c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 460:	e28db000 	add	fp, sp, #0
 464:	da000005 	ble	480 <memmove+0x28>
 468:	e0812002 	add	r2, r1, r2
 46c:	e2403001 	sub	r3, r0, #1
 470:	e4d1c001 	ldrb	ip, [r1], #1
 474:	e1510002 	cmp	r1, r2
 478:	e5e3c001 	strb	ip, [r3, #1]!
 47c:	1afffffb 	bne	470 <memmove+0x18>
 480:	e28bd000 	add	sp, fp, #0
 484:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 488:	e12fff1e 	bx	lr

0000048c <fork>:
 48c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 490:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 494:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 498:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 49c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a0:	e3a00001 	mov	r0, #1
 4a4:	ef000040 	svc	0x00000040
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4bc:	e12fff1e 	bx	lr

000004c0 <exit>:
 4c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d4:	e3a00002 	mov	r0, #2
 4d8:	ef000040 	svc	0x00000040
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f0:	e12fff1e 	bx	lr

000004f4 <wait>:
 4f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 500:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 504:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 508:	e3a00003 	mov	r0, #3
 50c:	ef000040 	svc	0x00000040
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 51c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 520:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 524:	e12fff1e 	bx	lr

00000528 <lseek>:
 528:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 52c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 530:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 534:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 538:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 53c:	e3a00016 	mov	r0, #22
 540:	ef000040 	svc	0x00000040
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 550:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 554:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 558:	e12fff1e 	bx	lr

0000055c <pipe>:
 55c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 560:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 564:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 568:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 56c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 570:	e3a00004 	mov	r0, #4
 574:	ef000040 	svc	0x00000040
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 584:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 588:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 58c:	e12fff1e 	bx	lr

00000590 <read>:
 590:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 594:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 598:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 59c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a4:	e3a00005 	mov	r0, #5
 5a8:	ef000040 	svc	0x00000040
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c0:	e12fff1e 	bx	lr

000005c4 <write>:
 5c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d8:	e3a00010 	mov	r0, #16
 5dc:	ef000040 	svc	0x00000040
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f4:	e12fff1e 	bx	lr

000005f8 <close>:
 5f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 600:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 604:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 608:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 60c:	e3a00015 	mov	r0, #21
 610:	ef000040 	svc	0x00000040
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 620:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 624:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 628:	e12fff1e 	bx	lr

0000062c <kill>:
 62c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 630:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 634:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 638:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 63c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 640:	e3a00006 	mov	r0, #6
 644:	ef000040 	svc	0x00000040
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 654:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 658:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 65c:	e12fff1e 	bx	lr

00000660 <exec>:
 660:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 664:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 668:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 66c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 670:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 674:	e3a00007 	mov	r0, #7
 678:	ef000040 	svc	0x00000040
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 688:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 68c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 690:	e12fff1e 	bx	lr

00000694 <open>:
 694:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 698:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 69c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a8:	e3a0000f 	mov	r0, #15
 6ac:	ef000040 	svc	0x00000040
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c4:	e12fff1e 	bx	lr

000006c8 <mknod>:
 6c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6dc:	e3a00011 	mov	r0, #17
 6e0:	ef000040 	svc	0x00000040
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f8:	e12fff1e 	bx	lr

000006fc <unlink>:
 6fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 700:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 704:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 708:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 70c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 710:	e3a00012 	mov	r0, #18
 714:	ef000040 	svc	0x00000040
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 724:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 728:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 72c:	e12fff1e 	bx	lr

00000730 <fstat>:
 730:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 734:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 738:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 73c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 740:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 744:	e3a00008 	mov	r0, #8
 748:	ef000040 	svc	0x00000040
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 754:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 758:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 75c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 760:	e12fff1e 	bx	lr

00000764 <link>:
 764:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 768:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 76c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 770:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 774:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 778:	e3a00013 	mov	r0, #19
 77c:	ef000040 	svc	0x00000040
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 788:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 78c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 790:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 794:	e12fff1e 	bx	lr

00000798 <mkdir>:
 798:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 79c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ac:	e3a00014 	mov	r0, #20
 7b0:	ef000040 	svc	0x00000040
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c8:	e12fff1e 	bx	lr

000007cc <chdir>:
 7cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7e0:	e3a00009 	mov	r0, #9
 7e4:	ef000040 	svc	0x00000040
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7fc:	e12fff1e 	bx	lr

00000800 <dup>:
 800:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 804:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 808:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 80c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 810:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 814:	e3a0000a 	mov	r0, #10
 818:	ef000040 	svc	0x00000040
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 824:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 828:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 82c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 830:	e12fff1e 	bx	lr

00000834 <getpid>:
 834:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 838:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 83c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 840:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 844:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 848:	e3a0000b 	mov	r0, #11
 84c:	ef000040 	svc	0x00000040
 850:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 854:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 858:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 85c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 860:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 864:	e12fff1e 	bx	lr

00000868 <sbrk>:
 868:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 86c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 870:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 874:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 878:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 87c:	e3a0000c 	mov	r0, #12
 880:	ef000040 	svc	0x00000040
 884:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 888:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 88c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 890:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 894:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 898:	e12fff1e 	bx	lr

0000089c <sleep>:
 89c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8b0:	e3a0000d 	mov	r0, #13
 8b4:	ef000040 	svc	0x00000040
 8b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8cc:	e12fff1e 	bx	lr

000008d0 <uptime>:
 8d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8e4:	e3a0000e 	mov	r0, #14
 8e8:	ef000040 	svc	0x00000040
 8ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 900:	e12fff1e 	bx	lr

00000904 <printint>:
 904:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 908:	e1a09fa1 	lsr	r9, r1, #31
 90c:	e3530000 	cmp	r3, #0
 910:	03a09000 	moveq	r9, #0
 914:	12099001 	andne	r9, r9, #1
 918:	e28db01c 	add	fp, sp, #28
 91c:	e3590000 	cmp	r9, #0
 920:	e3008d90 	movw	r8, #3472	; 0xd90
 924:	1261e000 	rsbne	lr, r1, #0
 928:	e3408000 	movt	r8, #0
 92c:	e24b602d 	sub	r6, fp, #45	; 0x2d
 930:	e1a04000 	mov	r4, r0
 934:	13a09001 	movne	r9, #1
 938:	01a0e001 	moveq	lr, r1
 93c:	e3a07000 	mov	r7, #0
 940:	e3a05001 	mov	r5, #1
 944:	e24dd018 	sub	sp, sp, #24
 948:	e3a0c000 	mov	ip, #0
 94c:	e3a0301f 	mov	r3, #31
 950:	e1a0100c 	mov	r1, ip
 954:	e1a0033e 	lsr	r0, lr, r3
 958:	e2000001 	and	r0, r0, #1
 95c:	e1801081 	orr	r1, r0, r1, lsl #1
 960:	e1520001 	cmp	r2, r1
 964:	90411002 	subls	r1, r1, r2
 968:	918cc315 	orrls	ip, ip, r5, lsl r3
 96c:	e2533001 	subs	r3, r3, #1
 970:	2afffff7 	bcs	954 <printint+0x50>
 974:	e061e29c 	mls	r1, ip, r2, lr
 978:	e35c0000 	cmp	ip, #0
 97c:	e1a0e00c 	mov	lr, ip
 980:	e2873001 	add	r3, r7, #1
 984:	e7d81001 	ldrb	r1, [r8, r1]
 988:	e5e61001 	strb	r1, [r6, #1]!
 98c:	11a07003 	movne	r7, r3
 990:	1affffec 	bne	948 <printint+0x44>
 994:	e3590000 	cmp	r9, #0
 998:	124b201c 	subne	r2, fp, #28
 99c:	10822003 	addne	r2, r2, r3
 9a0:	13a0102d 	movne	r1, #45	; 0x2d
 9a4:	12873002 	addne	r3, r7, #2
 9a8:	15421010 	strbne	r1, [r2, #-16]
 9ac:	e24b202c 	sub	r2, fp, #44	; 0x2c
 9b0:	e2435001 	sub	r5, r3, #1
 9b4:	e0826003 	add	r6, r2, r3
 9b8:	e5763001 	ldrb	r3, [r6, #-1]!
 9bc:	e2455001 	sub	r5, r5, #1
 9c0:	e3a02001 	mov	r2, #1
 9c4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 9c8:	e1a00004 	mov	r0, r4
 9cc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 9d0:	ebfffefb 	bl	5c4 <write>
 9d4:	e3750001 	cmn	r5, #1
 9d8:	1afffff6 	bne	9b8 <printint+0xb4>
 9dc:	e24bd01c 	sub	sp, fp, #28
 9e0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000009e4 <div>:
 9e4:	e92d4810 	push	{r4, fp, lr}
 9e8:	e3a02000 	mov	r2, #0
 9ec:	e28db008 	add	fp, sp, #8
 9f0:	e1a0e000 	mov	lr, r0
 9f4:	e3a0301f 	mov	r3, #31
 9f8:	e1a00002 	mov	r0, r2
 9fc:	e3a04001 	mov	r4, #1
 a00:	e1a0c33e 	lsr	ip, lr, r3
 a04:	e20cc001 	and	ip, ip, #1
 a08:	e18c2082 	orr	r2, ip, r2, lsl #1
 a0c:	e1520001 	cmp	r2, r1
 a10:	20422001 	subcs	r2, r2, r1
 a14:	21800314 	orrcs	r0, r0, r4, lsl r3
 a18:	e2533001 	subs	r3, r3, #1
 a1c:	2afffff7 	bcs	a00 <div+0x1c>
 a20:	e8bd8810 	pop	{r4, fp, pc}

00000a24 <printf>:
 a24:	e92d000e 	push	{r1, r2, r3}
 a28:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 a2c:	e28db018 	add	fp, sp, #24
 a30:	e24dd008 	sub	sp, sp, #8
 a34:	e59b6004 	ldr	r6, [fp, #4]
 a38:	e5d64000 	ldrb	r4, [r6]
 a3c:	e3540000 	cmp	r4, #0
 a40:	0a00002b 	beq	af4 <printf+0xd0>
 a44:	e1a07000 	mov	r7, r0
 a48:	e28b8008 	add	r8, fp, #8
 a4c:	e3a05000 	mov	r5, #0
 a50:	ea00000a 	b	a80 <printf+0x5c>
 a54:	e3540025 	cmp	r4, #37	; 0x25
 a58:	01a05004 	moveq	r5, r4
 a5c:	0a000004 	beq	a74 <printf+0x50>
 a60:	e24b1018 	sub	r1, fp, #24
 a64:	e3a02001 	mov	r2, #1
 a68:	e1a00007 	mov	r0, r7
 a6c:	e5614006 	strb	r4, [r1, #-6]!
 a70:	ebfffed3 	bl	5c4 <write>
 a74:	e5f64001 	ldrb	r4, [r6, #1]!
 a78:	e3540000 	cmp	r4, #0
 a7c:	0a00001c 	beq	af4 <printf+0xd0>
 a80:	e3550000 	cmp	r5, #0
 a84:	0afffff2 	beq	a54 <printf+0x30>
 a88:	e3550025 	cmp	r5, #37	; 0x25
 a8c:	1afffff8 	bne	a74 <printf+0x50>
 a90:	e3540064 	cmp	r4, #100	; 0x64
 a94:	0a000037 	beq	b78 <printf+0x154>
 a98:	e20430f7 	and	r3, r4, #247	; 0xf7
 a9c:	e3530070 	cmp	r3, #112	; 0x70
 aa0:	0a000017 	beq	b04 <printf+0xe0>
 aa4:	e3540073 	cmp	r4, #115	; 0x73
 aa8:	0a00001c 	beq	b20 <printf+0xfc>
 aac:	e3540063 	cmp	r4, #99	; 0x63
 ab0:	0a000037 	beq	b94 <printf+0x170>
 ab4:	e3540025 	cmp	r4, #37	; 0x25
 ab8:	0a000027 	beq	b5c <printf+0x138>
 abc:	e3a02001 	mov	r2, #1
 ac0:	e24b1019 	sub	r1, fp, #25
 ac4:	e1a00007 	mov	r0, r7
 ac8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 acc:	ebfffebc 	bl	5c4 <write>
 ad0:	e3a02001 	mov	r2, #1
 ad4:	e24b101a 	sub	r1, fp, #26
 ad8:	e1a00007 	mov	r0, r7
 adc:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 ae0:	ebfffeb7 	bl	5c4 <write>
 ae4:	e5f64001 	ldrb	r4, [r6, #1]!
 ae8:	e3a05000 	mov	r5, #0
 aec:	e3540000 	cmp	r4, #0
 af0:	1affffe2 	bne	a80 <printf+0x5c>
 af4:	e24bd018 	sub	sp, fp, #24
 af8:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 afc:	e28dd00c 	add	sp, sp, #12
 b00:	e12fff1e 	bx	lr
 b04:	e3a03000 	mov	r3, #0
 b08:	e3a02010 	mov	r2, #16
 b0c:	e4981004 	ldr	r1, [r8], #4
 b10:	e1a00007 	mov	r0, r7
 b14:	ebffff7a 	bl	904 <printint>
 b18:	e3a05000 	mov	r5, #0
 b1c:	eaffffd4 	b	a74 <printf+0x50>
 b20:	e4984004 	ldr	r4, [r8], #4
 b24:	e3540000 	cmp	r4, #0
 b28:	0a000021 	beq	bb4 <printf+0x190>
 b2c:	e5d45000 	ldrb	r5, [r4]
 b30:	e3550000 	cmp	r5, #0
 b34:	0affffce 	beq	a74 <printf+0x50>
 b38:	e3a02001 	mov	r2, #1
 b3c:	e24b101d 	sub	r1, fp, #29
 b40:	e1a00007 	mov	r0, r7
 b44:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 b48:	ebfffe9d 	bl	5c4 <write>
 b4c:	e5f45001 	ldrb	r5, [r4, #1]!
 b50:	e3550000 	cmp	r5, #0
 b54:	1afffff7 	bne	b38 <printf+0x114>
 b58:	eaffffc5 	b	a74 <printf+0x50>
 b5c:	e24b1018 	sub	r1, fp, #24
 b60:	e3a02001 	mov	r2, #1
 b64:	e1a00007 	mov	r0, r7
 b68:	e5615003 	strb	r5, [r1, #-3]!
 b6c:	e3a05000 	mov	r5, #0
 b70:	ebfffe93 	bl	5c4 <write>
 b74:	eaffffbe 	b	a74 <printf+0x50>
 b78:	e3a03001 	mov	r3, #1
 b7c:	e3a0200a 	mov	r2, #10
 b80:	e4981004 	ldr	r1, [r8], #4
 b84:	e1a00007 	mov	r0, r7
 b88:	ebffff5d 	bl	904 <printint>
 b8c:	e3a05000 	mov	r5, #0
 b90:	eaffffb7 	b	a74 <printf+0x50>
 b94:	e4983004 	ldr	r3, [r8], #4
 b98:	e24b1018 	sub	r1, fp, #24
 b9c:	e3a02001 	mov	r2, #1
 ba0:	e1a00007 	mov	r0, r7
 ba4:	e3a05000 	mov	r5, #0
 ba8:	e5613004 	strb	r3, [r1, #-4]!
 bac:	ebfffe84 	bl	5c4 <write>
 bb0:	eaffffaf 	b	a74 <printf+0x50>
 bb4:	e3004da4 	movw	r4, #3492	; 0xda4
 bb8:	e3a05028 	mov	r5, #40	; 0x28
 bbc:	e3404000 	movt	r4, #0
 bc0:	eaffffdc 	b	b38 <printf+0x114>

00000bc4 <free>:
 bc4:	e300cdac 	movw	ip, #3500	; 0xdac
 bc8:	e340c000 	movt	ip, #0
 bcc:	e92d4810 	push	{r4, fp, lr}
 bd0:	e2401008 	sub	r1, r0, #8
 bd4:	e28db008 	add	fp, sp, #8
 bd8:	e59c3000 	ldr	r3, [ip]
 bdc:	ea000004 	b	bf4 <free+0x30>
 be0:	e1510002 	cmp	r1, r2
 be4:	3a000009 	bcc	c10 <free+0x4c>
 be8:	e1530002 	cmp	r3, r2
 bec:	2a000007 	bcs	c10 <free+0x4c>
 bf0:	e1a03002 	mov	r3, r2
 bf4:	e1530001 	cmp	r3, r1
 bf8:	e5932000 	ldr	r2, [r3]
 bfc:	3afffff7 	bcc	be0 <free+0x1c>
 c00:	e1530002 	cmp	r3, r2
 c04:	3afffff9 	bcc	bf0 <free+0x2c>
 c08:	e1510002 	cmp	r1, r2
 c0c:	2afffff7 	bcs	bf0 <free+0x2c>
 c10:	e510e004 	ldr	lr, [r0, #-4]
 c14:	e58c3000 	str	r3, [ip]
 c18:	e081418e 	add	r4, r1, lr, lsl #3
 c1c:	e1520004 	cmp	r2, r4
 c20:	05922004 	ldreq	r2, [r2, #4]
 c24:	0082e00e 	addeq	lr, r2, lr
 c28:	0500e004 	streq	lr, [r0, #-4]
 c2c:	05932000 	ldreq	r2, [r3]
 c30:	05922000 	ldreq	r2, [r2]
 c34:	e5002008 	str	r2, [r0, #-8]
 c38:	e5932004 	ldr	r2, [r3, #4]
 c3c:	e083e182 	add	lr, r3, r2, lsl #3
 c40:	e151000e 	cmp	r1, lr
 c44:	15831000 	strne	r1, [r3]
 c48:	05101004 	ldreq	r1, [r0, #-4]
 c4c:	00812002 	addeq	r2, r1, r2
 c50:	05832004 	streq	r2, [r3, #4]
 c54:	05102008 	ldreq	r2, [r0, #-8]
 c58:	05832000 	streq	r2, [r3]
 c5c:	e8bd8810 	pop	{r4, fp, pc}

00000c60 <malloc>:
 c60:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 c64:	e3007dac 	movw	r7, #3500	; 0xdac
 c68:	e3407000 	movt	r7, #0
 c6c:	e2804007 	add	r4, r0, #7
 c70:	e28db014 	add	fp, sp, #20
 c74:	e5973000 	ldr	r3, [r7]
 c78:	e1a041a4 	lsr	r4, r4, #3
 c7c:	e2844001 	add	r4, r4, #1
 c80:	e3530000 	cmp	r3, #0
 c84:	0a000027 	beq	d28 <malloc+0xc8>
 c88:	e5930000 	ldr	r0, [r3]
 c8c:	e5902004 	ldr	r2, [r0, #4]
 c90:	e1540002 	cmp	r4, r2
 c94:	9a000019 	bls	d00 <malloc+0xa0>
 c98:	e3540a01 	cmp	r4, #4096	; 0x1000
 c9c:	21a05004 	movcs	r5, r4
 ca0:	33a05a01 	movcc	r5, #4096	; 0x1000
 ca4:	e1a06185 	lsl	r6, r5, #3
 ca8:	ea000003 	b	cbc <malloc+0x5c>
 cac:	e5930000 	ldr	r0, [r3]
 cb0:	e5902004 	ldr	r2, [r0, #4]
 cb4:	e1540002 	cmp	r4, r2
 cb8:	9a000010 	bls	d00 <malloc+0xa0>
 cbc:	e5972000 	ldr	r2, [r7]
 cc0:	e1a03000 	mov	r3, r0
 cc4:	e1520000 	cmp	r2, r0
 cc8:	1afffff7 	bne	cac <malloc+0x4c>
 ccc:	e1a00006 	mov	r0, r6
 cd0:	ebfffee4 	bl	868 <sbrk>
 cd4:	e1a03000 	mov	r3, r0
 cd8:	e3730001 	cmn	r3, #1
 cdc:	e2800008 	add	r0, r0, #8
 ce0:	0a000004 	beq	cf8 <malloc+0x98>
 ce4:	e5835004 	str	r5, [r3, #4]
 ce8:	ebffffb5 	bl	bc4 <free>
 cec:	e5973000 	ldr	r3, [r7]
 cf0:	e3530000 	cmp	r3, #0
 cf4:	1affffec 	bne	cac <malloc+0x4c>
 cf8:	e3a00000 	mov	r0, #0
 cfc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 d00:	e1540002 	cmp	r4, r2
 d04:	e5873000 	str	r3, [r7]
 d08:	10422004 	subne	r2, r2, r4
 d0c:	15802004 	strne	r2, [r0, #4]
 d10:	05902000 	ldreq	r2, [r0]
 d14:	10800182 	addne	r0, r0, r2, lsl #3
 d18:	e2800008 	add	r0, r0, #8
 d1c:	15004004 	strne	r4, [r0, #-4]
 d20:	05832000 	streq	r2, [r3]
 d24:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 d28:	e2870004 	add	r0, r7, #4
 d2c:	e5873008 	str	r3, [r7, #8]
 d30:	e5870000 	str	r0, [r7]
 d34:	e5870004 	str	r0, [r7, #4]
 d38:	eaffffd6 	b	c98 <malloc+0x38>
