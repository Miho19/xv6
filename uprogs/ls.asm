
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a06000 	movgt	r6, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c1a05001 	movgt	r5, r1
  14:	c3a04001 	movgt	r4, #1
  18:	da000005 	ble	34 <main+0x34>
  1c:	e2844001 	add	r4, r4, #1
  20:	e5b50004 	ldr	r0, [r5, #4]!
  24:	eb000032 	bl	f4 <ls>
  28:	e1560004 	cmp	r6, r4
  2c:	1afffffa 	bne	1c <main+0x1c>
  30:	eb000146 	bl	550 <exit>
  34:	e3000de4 	movw	r0, #3556	; 0xde4
  38:	e3400000 	movt	r0, #0
  3c:	eb00002c 	bl	f4 <ls>
  40:	eb000142 	bl	550 <exit>

00000044 <fmtname>:
  44:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  48:	e28db014 	add	fp, sp, #20
  4c:	e1a04000 	mov	r4, r0
  50:	eb0000b6 	bl	330 <strlen>
  54:	e0942000 	adds	r2, r4, r0
  58:	2a00000c 	bcs	90 <fmtname+0x4c>
  5c:	e7d43000 	ldrb	r3, [r4, r0]
  60:	e353002f 	cmp	r3, #47	; 0x2f
  64:	0a000009 	beq	90 <fmtname+0x4c>
  68:	e2423001 	sub	r3, r2, #1
  6c:	e2440001 	sub	r0, r4, #1
  70:	ea000002 	b	80 <fmtname+0x3c>
  74:	e5d21000 	ldrb	r1, [r2]
  78:	e351002f 	cmp	r1, #47	; 0x2f
  7c:	0a000003 	beq	90 <fmtname+0x4c>
  80:	e1530000 	cmp	r3, r0
  84:	e1a02003 	mov	r2, r3
  88:	e2433001 	sub	r3, r3, #1
  8c:	1afffff8 	bne	74 <fmtname+0x30>
  90:	e2824001 	add	r4, r2, #1
  94:	e1a00004 	mov	r0, r4
  98:	eb0000a4 	bl	330 <strlen>
  9c:	e350000d 	cmp	r0, #13
  a0:	8a000011 	bhi	ec <fmtname+0xa8>
  a4:	e1a00004 	mov	r0, r4
  a8:	e3005e04 	movw	r5, #3588	; 0xe04
  ac:	eb00009f 	bl	330 <strlen>
  b0:	e3405000 	movt	r5, #0
  b4:	e1a01004 	mov	r1, r4
  b8:	e1a02000 	mov	r2, r0
  bc:	e1a00005 	mov	r0, r5
  c0:	eb000108 	bl	4e8 <memmove>
  c4:	e1a00004 	mov	r0, r4
  c8:	eb000098 	bl	330 <strlen>
  cc:	e1a06000 	mov	r6, r0
  d0:	e1a00004 	mov	r0, r4
  d4:	eb000095 	bl	330 <strlen>
  d8:	e3a01020 	mov	r1, #32
  dc:	e1a04005 	mov	r4, r5
  e0:	e260200e 	rsb	r2, r0, #14
  e4:	e0850006 	add	r0, r5, r6
  e8:	eb0000a1 	bl	374 <memset>
  ec:	e1a00004 	mov	r0, r4
  f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f4 <ls>:
  f4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  f8:	e3a01000 	mov	r1, #0
  fc:	e28db020 	add	fp, sp, #32
 100:	e24ddf8d 	sub	sp, sp, #564	; 0x234
 104:	e1a05000 	mov	r5, r0
 108:	eb000178 	bl	6f0 <open>
 10c:	e2504000 	subs	r4, r0, #0
 110:	ba00004d 	blt	24c <ls+0x158>
 114:	e24b1f8e 	sub	r1, fp, #568	; 0x238
 118:	eb00019b 	bl	78c <fstat>
 11c:	e3500000 	cmp	r0, #0
 120:	ba000055 	blt	27c <ls+0x188>
 124:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 128:	e1d360f0 	ldrsh	r6, [r3]
 12c:	e3560001 	cmp	r6, #1
 130:	0a000011 	beq	17c <ls+0x88>
 134:	e3560002 	cmp	r6, #2
 138:	1a00000b 	bne	16c <ls+0x78>
 13c:	e1a00005 	mov	r0, r5
 140:	ebffffbf 	bl	44 <fmtname>
 144:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 148:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 14c:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 150:	e3001dc0 	movw	r1, #3520	; 0xdc0
 154:	e3401000 	movt	r1, #0
 158:	e1d330f0 	ldrsh	r3, [r3]
 15c:	e88d1004 	stm	sp, {r2, ip}
 160:	e1a02000 	mov	r2, r0
 164:	e3a00001 	mov	r0, #1
 168:	eb000244 	bl	a80 <printf>
 16c:	e1a00004 	mov	r0, r4
 170:	eb000137 	bl	654 <close>
 174:	e24bd020 	sub	sp, fp, #32
 178:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 17c:	e1a00005 	mov	r0, r5
 180:	eb00006a 	bl	330 <strlen>
 184:	e2800010 	add	r0, r0, #16
 188:	e3500c02 	cmp	r0, #512	; 0x200
 18c:	8a000035 	bhi	268 <ls+0x174>
 190:	e24b6f89 	sub	r6, fp, #548	; 0x224
 194:	e1a01005 	mov	r1, r5
 198:	e3007dc0 	movw	r7, #3520	; 0xdc0
 19c:	e300adac 	movw	sl, #3500	; 0xdac
 1a0:	e1a00006 	mov	r0, r6
 1a4:	e3407000 	movt	r7, #0
 1a8:	eb000040 	bl	2b0 <strcpy>
 1ac:	e1a00006 	mov	r0, r6
 1b0:	eb00005e 	bl	330 <strlen>
 1b4:	e340a000 	movt	sl, #0
 1b8:	e24b5f92 	sub	r5, fp, #584	; 0x248
 1bc:	e3a0302f 	mov	r3, #47	; 0x2f
 1c0:	e0868000 	add	r8, r6, r0
 1c4:	e7c63000 	strb	r3, [r6, r0]
 1c8:	e2889001 	add	r9, r8, #1
 1cc:	e3a02010 	mov	r2, #16
 1d0:	e1a01005 	mov	r1, r5
 1d4:	e1a00004 	mov	r0, r4
 1d8:	eb000103 	bl	5ec <read>
 1dc:	e3500010 	cmp	r0, #16
 1e0:	1affffe1 	bne	16c <ls+0x78>
 1e4:	e1d530b0 	ldrh	r3, [r5]
 1e8:	e3530000 	cmp	r3, #0
 1ec:	0afffff6 	beq	1cc <ls+0xd8>
 1f0:	e3a0200e 	mov	r2, #14
 1f4:	e2851002 	add	r1, r5, #2
 1f8:	e1a00009 	mov	r0, r9
 1fc:	eb0000b9 	bl	4e8 <memmove>
 200:	e3a03000 	mov	r3, #0
 204:	e24b1f8e 	sub	r1, fp, #568	; 0x238
 208:	e1a00006 	mov	r0, r6
 20c:	e5c8300f 	strb	r3, [r8, #15]
 210:	eb000092 	bl	460 <stat>
 214:	e3500000 	cmp	r0, #0
 218:	e1a00006 	mov	r0, r6
 21c:	ba00001e 	blt	29c <ls+0x1a8>
 220:	ebffff87 	bl	44 <fmtname>
 224:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 228:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 22c:	e24b3f8e 	sub	r3, fp, #568	; 0x238
 230:	e1a01007 	mov	r1, r7
 234:	e1d330f0 	ldrsh	r3, [r3]
 238:	e88d1004 	stm	sp, {r2, ip}
 23c:	e1a02000 	mov	r2, r0
 240:	e3a00001 	mov	r0, #1
 244:	eb00020d 	bl	a80 <printf>
 248:	eaffffdf 	b	1cc <ls+0xd8>
 24c:	e1a02005 	mov	r2, r5
 250:	e3a00002 	mov	r0, #2
 254:	e3001d98 	movw	r1, #3480	; 0xd98
 258:	e3401000 	movt	r1, #0
 25c:	eb000207 	bl	a80 <printf>
 260:	e24bd020 	sub	sp, fp, #32
 264:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 268:	e1a00006 	mov	r0, r6
 26c:	e3001dd0 	movw	r1, #3536	; 0xdd0
 270:	e3401000 	movt	r1, #0
 274:	eb000201 	bl	a80 <printf>
 278:	eaffffbb 	b	16c <ls+0x78>
 27c:	e1a02005 	mov	r2, r5
 280:	e3a00002 	mov	r0, #2
 284:	e3001dac 	movw	r1, #3500	; 0xdac
 288:	e3401000 	movt	r1, #0
 28c:	eb0001fb 	bl	a80 <printf>
 290:	e1a00004 	mov	r0, r4
 294:	eb0000ee 	bl	654 <close>
 298:	eaffffb5 	b	174 <ls+0x80>
 29c:	e1a02006 	mov	r2, r6
 2a0:	e1a0100a 	mov	r1, sl
 2a4:	e3a00001 	mov	r0, #1
 2a8:	eb0001f4 	bl	a80 <printf>
 2ac:	eaffffc6 	b	1cc <ls+0xd8>

000002b0 <strcpy>:
 2b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b4:	e2402001 	sub	r2, r0, #1
 2b8:	e28db000 	add	fp, sp, #0
 2bc:	e4d13001 	ldrb	r3, [r1], #1
 2c0:	e3530000 	cmp	r3, #0
 2c4:	e5e23001 	strb	r3, [r2, #1]!
 2c8:	1afffffb 	bne	2bc <strcpy+0xc>
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d4:	e12fff1e 	bx	lr

000002d8 <strcmp>:
 2d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2dc:	e28db000 	add	fp, sp, #0
 2e0:	e5d03000 	ldrb	r3, [r0]
 2e4:	e5d12000 	ldrb	r2, [r1]
 2e8:	e3530000 	cmp	r3, #0
 2ec:	1a000004 	bne	304 <strcmp+0x2c>
 2f0:	ea000005 	b	30c <strcmp+0x34>
 2f4:	e5f03001 	ldrb	r3, [r0, #1]!
 2f8:	e3530000 	cmp	r3, #0
 2fc:	0a000006 	beq	31c <strcmp+0x44>
 300:	e5f12001 	ldrb	r2, [r1, #1]!
 304:	e1530002 	cmp	r3, r2
 308:	0afffff9 	beq	2f4 <strcmp+0x1c>
 30c:	e0430002 	sub	r0, r3, r2
 310:	e28bd000 	add	sp, fp, #0
 314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 318:	e12fff1e 	bx	lr
 31c:	e5d12001 	ldrb	r2, [r1, #1]
 320:	e0430002 	sub	r0, r3, r2
 324:	e28bd000 	add	sp, fp, #0
 328:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 32c:	e12fff1e 	bx	lr

00000330 <strlen>:
 330:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 334:	e28db000 	add	fp, sp, #0
 338:	e5d03000 	ldrb	r3, [r0]
 33c:	e3530000 	cmp	r3, #0
 340:	0a000009 	beq	36c <strlen+0x3c>
 344:	e1a02000 	mov	r2, r0
 348:	e3a03000 	mov	r3, #0
 34c:	e5f21001 	ldrb	r1, [r2, #1]!
 350:	e2833001 	add	r3, r3, #1
 354:	e3510000 	cmp	r1, #0
 358:	e1a00003 	mov	r0, r3
 35c:	1afffffa 	bne	34c <strlen+0x1c>
 360:	e28bd000 	add	sp, fp, #0
 364:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 368:	e12fff1e 	bx	lr
 36c:	e1a00003 	mov	r0, r3
 370:	eafffffa 	b	360 <strlen+0x30>

00000374 <memset>:
 374:	e3520000 	cmp	r2, #0
 378:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 37c:	e28db000 	add	fp, sp, #0
 380:	0a000004 	beq	398 <memset+0x24>
 384:	e6ef1071 	uxtb	r1, r1
 388:	e0802002 	add	r2, r0, r2
 38c:	e4c01001 	strb	r1, [r0], #1
 390:	e1520000 	cmp	r2, r0
 394:	1afffffc 	bne	38c <memset+0x18>
 398:	e28bd000 	add	sp, fp, #0
 39c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3a0:	e12fff1e 	bx	lr

000003a4 <strchr>:
 3a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3a8:	e28db000 	add	fp, sp, #0
 3ac:	e5d02000 	ldrb	r2, [r0]
 3b0:	e3520000 	cmp	r2, #0
 3b4:	0a00000b 	beq	3e8 <strchr+0x44>
 3b8:	e1510002 	cmp	r1, r2
 3bc:	1a000002 	bne	3cc <strchr+0x28>
 3c0:	ea000005 	b	3dc <strchr+0x38>
 3c4:	e1530001 	cmp	r3, r1
 3c8:	0a000003 	beq	3dc <strchr+0x38>
 3cc:	e5f03001 	ldrb	r3, [r0, #1]!
 3d0:	e3530000 	cmp	r3, #0
 3d4:	1afffffa 	bne	3c4 <strchr+0x20>
 3d8:	e1a00003 	mov	r0, r3
 3dc:	e28bd000 	add	sp, fp, #0
 3e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e4:	e12fff1e 	bx	lr
 3e8:	e1a00002 	mov	r0, r2
 3ec:	eafffffa 	b	3dc <strchr+0x38>

000003f0 <gets>:
 3f0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 3f4:	e1a08000 	mov	r8, r0
 3f8:	e28db018 	add	fp, sp, #24
 3fc:	e1a07001 	mov	r7, r1
 400:	e24dd00c 	sub	sp, sp, #12
 404:	e2406001 	sub	r6, r0, #1
 408:	e3a05000 	mov	r5, #0
 40c:	ea000008 	b	434 <gets+0x44>
 410:	eb000075 	bl	5ec <read>
 414:	e3500000 	cmp	r0, #0
 418:	da00000b 	ble	44c <gets+0x5c>
 41c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 420:	e1a05004 	mov	r5, r4
 424:	e353000d 	cmp	r3, #13
 428:	1353000a 	cmpne	r3, #10
 42c:	e5e63001 	strb	r3, [r6, #1]!
 430:	0a000005 	beq	44c <gets+0x5c>
 434:	e3a02001 	mov	r2, #1
 438:	e0854002 	add	r4, r5, r2
 43c:	e1540007 	cmp	r4, r7
 440:	e24b101d 	sub	r1, fp, #29
 444:	e3a00000 	mov	r0, #0
 448:	bafffff0 	blt	410 <gets+0x20>
 44c:	e3a03000 	mov	r3, #0
 450:	e1a00008 	mov	r0, r8
 454:	e7c83005 	strb	r3, [r8, r5]
 458:	e24bd018 	sub	sp, fp, #24
 45c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000460 <stat>:
 460:	e92d4830 	push	{r4, r5, fp, lr}
 464:	e1a04001 	mov	r4, r1
 468:	e28db00c 	add	fp, sp, #12
 46c:	e3a01000 	mov	r1, #0
 470:	eb00009e 	bl	6f0 <open>
 474:	e2505000 	subs	r5, r0, #0
 478:	ba000006 	blt	498 <stat+0x38>
 47c:	e1a01004 	mov	r1, r4
 480:	eb0000c1 	bl	78c <fstat>
 484:	e1a04000 	mov	r4, r0
 488:	e1a00005 	mov	r0, r5
 48c:	eb000070 	bl	654 <close>
 490:	e1a00004 	mov	r0, r4
 494:	e8bd8830 	pop	{r4, r5, fp, pc}
 498:	e3e04000 	mvn	r4, #0
 49c:	eafffffb 	b	490 <stat+0x30>

000004a0 <atoi>:
 4a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4a4:	e28db000 	add	fp, sp, #0
 4a8:	e5d02000 	ldrb	r2, [r0]
 4ac:	e2423030 	sub	r3, r2, #48	; 0x30
 4b0:	e3530009 	cmp	r3, #9
 4b4:	e3a03000 	mov	r3, #0
 4b8:	8a000006 	bhi	4d8 <atoi+0x38>
 4bc:	e3a0c00a 	mov	ip, #10
 4c0:	e023239c 	mla	r3, ip, r3, r2
 4c4:	e5f02001 	ldrb	r2, [r0, #1]!
 4c8:	e2421030 	sub	r1, r2, #48	; 0x30
 4cc:	e3510009 	cmp	r1, #9
 4d0:	e2433030 	sub	r3, r3, #48	; 0x30
 4d4:	9afffff9 	bls	4c0 <atoi+0x20>
 4d8:	e1a00003 	mov	r0, r3
 4dc:	e28bd000 	add	sp, fp, #0
 4e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 4e4:	e12fff1e 	bx	lr

000004e8 <memmove>:
 4e8:	e3520000 	cmp	r2, #0
 4ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4f0:	e28db000 	add	fp, sp, #0
 4f4:	da000005 	ble	510 <memmove+0x28>
 4f8:	e0812002 	add	r2, r1, r2
 4fc:	e2403001 	sub	r3, r0, #1
 500:	e4d1c001 	ldrb	ip, [r1], #1
 504:	e1510002 	cmp	r1, r2
 508:	e5e3c001 	strb	ip, [r3, #1]!
 50c:	1afffffb 	bne	500 <memmove+0x18>
 510:	e28bd000 	add	sp, fp, #0
 514:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 518:	e12fff1e 	bx	lr

0000051c <fork>:
 51c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 520:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 524:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 528:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 52c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 530:	e3a00001 	mov	r0, #1
 534:	ef000040 	svc	0x00000040
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 544:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 548:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 54c:	e12fff1e 	bx	lr

00000550 <exit>:
 550:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 554:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 558:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 55c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 560:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 564:	e3a00002 	mov	r0, #2
 568:	ef000040 	svc	0x00000040
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 578:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 57c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 580:	e12fff1e 	bx	lr

00000584 <wait>:
 584:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 588:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 58c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 590:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 594:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 598:	e3a00003 	mov	r0, #3
 59c:	ef000040 	svc	0x00000040
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b4:	e12fff1e 	bx	lr

000005b8 <pipe>:
 5b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5cc:	e3a00004 	mov	r0, #4
 5d0:	ef000040 	svc	0x00000040
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e8:	e12fff1e 	bx	lr

000005ec <read>:
 5ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 600:	e3a00005 	mov	r0, #5
 604:	ef000040 	svc	0x00000040
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 614:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 618:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 61c:	e12fff1e 	bx	lr

00000620 <write>:
 620:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 624:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 628:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 62c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 630:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 634:	e3a00010 	mov	r0, #16
 638:	ef000040 	svc	0x00000040
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 648:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 64c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 650:	e12fff1e 	bx	lr

00000654 <close>:
 654:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 658:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 65c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 660:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 664:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 668:	e3a00015 	mov	r0, #21
 66c:	ef000040 	svc	0x00000040
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 67c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 680:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 684:	e12fff1e 	bx	lr

00000688 <kill>:
 688:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 68c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 690:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 694:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 698:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 69c:	e3a00006 	mov	r0, #6
 6a0:	ef000040 	svc	0x00000040
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b8:	e12fff1e 	bx	lr

000006bc <exec>:
 6bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d0:	e3a00007 	mov	r0, #7
 6d4:	ef000040 	svc	0x00000040
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ec:	e12fff1e 	bx	lr

000006f0 <open>:
 6f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 700:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 704:	e3a0000f 	mov	r0, #15
 708:	ef000040 	svc	0x00000040
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 718:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 71c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 720:	e12fff1e 	bx	lr

00000724 <mknod>:
 724:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 728:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 72c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 730:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 734:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 738:	e3a00011 	mov	r0, #17
 73c:	ef000040 	svc	0x00000040
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 748:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 74c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 750:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 754:	e12fff1e 	bx	lr

00000758 <unlink>:
 758:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 75c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 760:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 764:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 768:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 76c:	e3a00012 	mov	r0, #18
 770:	ef000040 	svc	0x00000040
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 77c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 780:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 784:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 788:	e12fff1e 	bx	lr

0000078c <fstat>:
 78c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 790:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 794:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 798:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 79c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a0:	e3a00008 	mov	r0, #8
 7a4:	ef000040 	svc	0x00000040
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7bc:	e12fff1e 	bx	lr

000007c0 <link>:
 7c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d4:	e3a00013 	mov	r0, #19
 7d8:	ef000040 	svc	0x00000040
 7dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f0:	e12fff1e 	bx	lr

000007f4 <mkdir>:
 7f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 800:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 804:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 808:	e3a00014 	mov	r0, #20
 80c:	ef000040 	svc	0x00000040
 810:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 814:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 818:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 81c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 820:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 824:	e12fff1e 	bx	lr

00000828 <chdir>:
 828:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 82c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 830:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 834:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 838:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 83c:	e3a00009 	mov	r0, #9
 840:	ef000040 	svc	0x00000040
 844:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 848:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 84c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 850:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 854:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 858:	e12fff1e 	bx	lr

0000085c <dup>:
 85c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 860:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 864:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 868:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 86c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 870:	e3a0000a 	mov	r0, #10
 874:	ef000040 	svc	0x00000040
 878:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 87c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 880:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 884:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 888:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 88c:	e12fff1e 	bx	lr

00000890 <getpid>:
 890:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 894:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 898:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 89c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8a4:	e3a0000b 	mov	r0, #11
 8a8:	ef000040 	svc	0x00000040
 8ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8c0:	e12fff1e 	bx	lr

000008c4 <sbrk>:
 8c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8d8:	e3a0000c 	mov	r0, #12
 8dc:	ef000040 	svc	0x00000040
 8e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8f4:	e12fff1e 	bx	lr

000008f8 <sleep>:
 8f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 900:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 904:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 908:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 90c:	e3a0000d 	mov	r0, #13
 910:	ef000040 	svc	0x00000040
 914:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 918:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 91c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 920:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 924:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 928:	e12fff1e 	bx	lr

0000092c <uptime>:
 92c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 930:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 934:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 938:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 93c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 940:	e3a0000e 	mov	r0, #14
 944:	ef000040 	svc	0x00000040
 948:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 94c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 950:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 954:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 958:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 95c:	e12fff1e 	bx	lr

00000960 <printint>:
 960:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 964:	e1a09fa1 	lsr	r9, r1, #31
 968:	e3530000 	cmp	r3, #0
 96c:	03a09000 	moveq	r9, #0
 970:	12099001 	andne	r9, r9, #1
 974:	e28db01c 	add	fp, sp, #28
 978:	e3590000 	cmp	r9, #0
 97c:	e3008de8 	movw	r8, #3560	; 0xde8
 980:	1261e000 	rsbne	lr, r1, #0
 984:	e3408000 	movt	r8, #0
 988:	e24b602d 	sub	r6, fp, #45	; 0x2d
 98c:	e1a04000 	mov	r4, r0
 990:	13a09001 	movne	r9, #1
 994:	01a0e001 	moveq	lr, r1
 998:	e3a07000 	mov	r7, #0
 99c:	e3a05001 	mov	r5, #1
 9a0:	e24dd018 	sub	sp, sp, #24
 9a4:	e3a0c000 	mov	ip, #0
 9a8:	e3a0301f 	mov	r3, #31
 9ac:	e1a0100c 	mov	r1, ip
 9b0:	e1a0033e 	lsr	r0, lr, r3
 9b4:	e2000001 	and	r0, r0, #1
 9b8:	e1801081 	orr	r1, r0, r1, lsl #1
 9bc:	e1520001 	cmp	r2, r1
 9c0:	90411002 	subls	r1, r1, r2
 9c4:	918cc315 	orrls	ip, ip, r5, lsl r3
 9c8:	e2533001 	subs	r3, r3, #1
 9cc:	2afffff7 	bcs	9b0 <printint+0x50>
 9d0:	e061e29c 	mls	r1, ip, r2, lr
 9d4:	e35c0000 	cmp	ip, #0
 9d8:	e1a0e00c 	mov	lr, ip
 9dc:	e2873001 	add	r3, r7, #1
 9e0:	e7d81001 	ldrb	r1, [r8, r1]
 9e4:	e5e61001 	strb	r1, [r6, #1]!
 9e8:	11a07003 	movne	r7, r3
 9ec:	1affffec 	bne	9a4 <printint+0x44>
 9f0:	e3590000 	cmp	r9, #0
 9f4:	124b201c 	subne	r2, fp, #28
 9f8:	10822003 	addne	r2, r2, r3
 9fc:	13a0102d 	movne	r1, #45	; 0x2d
 a00:	12873002 	addne	r3, r7, #2
 a04:	15421010 	strbne	r1, [r2, #-16]
 a08:	e24b202c 	sub	r2, fp, #44	; 0x2c
 a0c:	e2435001 	sub	r5, r3, #1
 a10:	e0826003 	add	r6, r2, r3
 a14:	e5763001 	ldrb	r3, [r6, #-1]!
 a18:	e2455001 	sub	r5, r5, #1
 a1c:	e3a02001 	mov	r2, #1
 a20:	e24b102d 	sub	r1, fp, #45	; 0x2d
 a24:	e1a00004 	mov	r0, r4
 a28:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 a2c:	ebfffefb 	bl	620 <write>
 a30:	e3750001 	cmn	r5, #1
 a34:	1afffff6 	bne	a14 <printint+0xb4>
 a38:	e24bd01c 	sub	sp, fp, #28
 a3c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000a40 <div>:
 a40:	e92d4810 	push	{r4, fp, lr}
 a44:	e3a02000 	mov	r2, #0
 a48:	e28db008 	add	fp, sp, #8
 a4c:	e1a0e000 	mov	lr, r0
 a50:	e3a0301f 	mov	r3, #31
 a54:	e1a00002 	mov	r0, r2
 a58:	e3a04001 	mov	r4, #1
 a5c:	e1a0c33e 	lsr	ip, lr, r3
 a60:	e20cc001 	and	ip, ip, #1
 a64:	e18c2082 	orr	r2, ip, r2, lsl #1
 a68:	e1520001 	cmp	r2, r1
 a6c:	20422001 	subcs	r2, r2, r1
 a70:	21800314 	orrcs	r0, r0, r4, lsl r3
 a74:	e2533001 	subs	r3, r3, #1
 a78:	2afffff7 	bcs	a5c <div+0x1c>
 a7c:	e8bd8810 	pop	{r4, fp, pc}

00000a80 <printf>:
 a80:	e92d000e 	push	{r1, r2, r3}
 a84:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 a88:	e28db018 	add	fp, sp, #24
 a8c:	e24dd008 	sub	sp, sp, #8
 a90:	e59b6004 	ldr	r6, [fp, #4]
 a94:	e5d64000 	ldrb	r4, [r6]
 a98:	e3540000 	cmp	r4, #0
 a9c:	0a00002b 	beq	b50 <printf+0xd0>
 aa0:	e1a07000 	mov	r7, r0
 aa4:	e28b8008 	add	r8, fp, #8
 aa8:	e3a05000 	mov	r5, #0
 aac:	ea00000a 	b	adc <printf+0x5c>
 ab0:	e3540025 	cmp	r4, #37	; 0x25
 ab4:	01a05004 	moveq	r5, r4
 ab8:	0a000004 	beq	ad0 <printf+0x50>
 abc:	e24b1018 	sub	r1, fp, #24
 ac0:	e3a02001 	mov	r2, #1
 ac4:	e1a00007 	mov	r0, r7
 ac8:	e5614006 	strb	r4, [r1, #-6]!
 acc:	ebfffed3 	bl	620 <write>
 ad0:	e5f64001 	ldrb	r4, [r6, #1]!
 ad4:	e3540000 	cmp	r4, #0
 ad8:	0a00001c 	beq	b50 <printf+0xd0>
 adc:	e3550000 	cmp	r5, #0
 ae0:	0afffff2 	beq	ab0 <printf+0x30>
 ae4:	e3550025 	cmp	r5, #37	; 0x25
 ae8:	1afffff8 	bne	ad0 <printf+0x50>
 aec:	e3540064 	cmp	r4, #100	; 0x64
 af0:	0a000037 	beq	bd4 <printf+0x154>
 af4:	e20430f7 	and	r3, r4, #247	; 0xf7
 af8:	e3530070 	cmp	r3, #112	; 0x70
 afc:	0a000017 	beq	b60 <printf+0xe0>
 b00:	e3540073 	cmp	r4, #115	; 0x73
 b04:	0a00001c 	beq	b7c <printf+0xfc>
 b08:	e3540063 	cmp	r4, #99	; 0x63
 b0c:	0a000037 	beq	bf0 <printf+0x170>
 b10:	e3540025 	cmp	r4, #37	; 0x25
 b14:	0a000027 	beq	bb8 <printf+0x138>
 b18:	e3a02001 	mov	r2, #1
 b1c:	e24b1019 	sub	r1, fp, #25
 b20:	e1a00007 	mov	r0, r7
 b24:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 b28:	ebfffebc 	bl	620 <write>
 b2c:	e3a02001 	mov	r2, #1
 b30:	e24b101a 	sub	r1, fp, #26
 b34:	e1a00007 	mov	r0, r7
 b38:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 b3c:	ebfffeb7 	bl	620 <write>
 b40:	e5f64001 	ldrb	r4, [r6, #1]!
 b44:	e3a05000 	mov	r5, #0
 b48:	e3540000 	cmp	r4, #0
 b4c:	1affffe2 	bne	adc <printf+0x5c>
 b50:	e24bd018 	sub	sp, fp, #24
 b54:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 b58:	e28dd00c 	add	sp, sp, #12
 b5c:	e12fff1e 	bx	lr
 b60:	e3a03000 	mov	r3, #0
 b64:	e3a02010 	mov	r2, #16
 b68:	e4981004 	ldr	r1, [r8], #4
 b6c:	e1a00007 	mov	r0, r7
 b70:	ebffff7a 	bl	960 <printint>
 b74:	e3a05000 	mov	r5, #0
 b78:	eaffffd4 	b	ad0 <printf+0x50>
 b7c:	e4984004 	ldr	r4, [r8], #4
 b80:	e3540000 	cmp	r4, #0
 b84:	0a000021 	beq	c10 <printf+0x190>
 b88:	e5d45000 	ldrb	r5, [r4]
 b8c:	e3550000 	cmp	r5, #0
 b90:	0affffce 	beq	ad0 <printf+0x50>
 b94:	e3a02001 	mov	r2, #1
 b98:	e24b101d 	sub	r1, fp, #29
 b9c:	e1a00007 	mov	r0, r7
 ba0:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 ba4:	ebfffe9d 	bl	620 <write>
 ba8:	e5f45001 	ldrb	r5, [r4, #1]!
 bac:	e3550000 	cmp	r5, #0
 bb0:	1afffff7 	bne	b94 <printf+0x114>
 bb4:	eaffffc5 	b	ad0 <printf+0x50>
 bb8:	e24b1018 	sub	r1, fp, #24
 bbc:	e3a02001 	mov	r2, #1
 bc0:	e1a00007 	mov	r0, r7
 bc4:	e5615003 	strb	r5, [r1, #-3]!
 bc8:	e3a05000 	mov	r5, #0
 bcc:	ebfffe93 	bl	620 <write>
 bd0:	eaffffbe 	b	ad0 <printf+0x50>
 bd4:	e3a03001 	mov	r3, #1
 bd8:	e3a0200a 	mov	r2, #10
 bdc:	e4981004 	ldr	r1, [r8], #4
 be0:	e1a00007 	mov	r0, r7
 be4:	ebffff5d 	bl	960 <printint>
 be8:	e3a05000 	mov	r5, #0
 bec:	eaffffb7 	b	ad0 <printf+0x50>
 bf0:	e4983004 	ldr	r3, [r8], #4
 bf4:	e24b1018 	sub	r1, fp, #24
 bf8:	e3a02001 	mov	r2, #1
 bfc:	e1a00007 	mov	r0, r7
 c00:	e3a05000 	mov	r5, #0
 c04:	e5613004 	strb	r3, [r1, #-4]!
 c08:	ebfffe84 	bl	620 <write>
 c0c:	eaffffaf 	b	ad0 <printf+0x50>
 c10:	e3004dfc 	movw	r4, #3580	; 0xdfc
 c14:	e3a05028 	mov	r5, #40	; 0x28
 c18:	e3404000 	movt	r4, #0
 c1c:	eaffffdc 	b	b94 <printf+0x114>

00000c20 <free>:
 c20:	e300ce14 	movw	ip, #3604	; 0xe14
 c24:	e340c000 	movt	ip, #0
 c28:	e92d4810 	push	{r4, fp, lr}
 c2c:	e2401008 	sub	r1, r0, #8
 c30:	e28db008 	add	fp, sp, #8
 c34:	e59c3000 	ldr	r3, [ip]
 c38:	ea000004 	b	c50 <free+0x30>
 c3c:	e1510002 	cmp	r1, r2
 c40:	3a000009 	bcc	c6c <free+0x4c>
 c44:	e1530002 	cmp	r3, r2
 c48:	2a000007 	bcs	c6c <free+0x4c>
 c4c:	e1a03002 	mov	r3, r2
 c50:	e1530001 	cmp	r3, r1
 c54:	e5932000 	ldr	r2, [r3]
 c58:	3afffff7 	bcc	c3c <free+0x1c>
 c5c:	e1530002 	cmp	r3, r2
 c60:	3afffff9 	bcc	c4c <free+0x2c>
 c64:	e1510002 	cmp	r1, r2
 c68:	2afffff7 	bcs	c4c <free+0x2c>
 c6c:	e510e004 	ldr	lr, [r0, #-4]
 c70:	e58c3000 	str	r3, [ip]
 c74:	e081418e 	add	r4, r1, lr, lsl #3
 c78:	e1520004 	cmp	r2, r4
 c7c:	05922004 	ldreq	r2, [r2, #4]
 c80:	0082e00e 	addeq	lr, r2, lr
 c84:	0500e004 	streq	lr, [r0, #-4]
 c88:	05932000 	ldreq	r2, [r3]
 c8c:	05922000 	ldreq	r2, [r2]
 c90:	e5002008 	str	r2, [r0, #-8]
 c94:	e5932004 	ldr	r2, [r3, #4]
 c98:	e083e182 	add	lr, r3, r2, lsl #3
 c9c:	e151000e 	cmp	r1, lr
 ca0:	15831000 	strne	r1, [r3]
 ca4:	05101004 	ldreq	r1, [r0, #-4]
 ca8:	00812002 	addeq	r2, r1, r2
 cac:	05832004 	streq	r2, [r3, #4]
 cb0:	05102008 	ldreq	r2, [r0, #-8]
 cb4:	05832000 	streq	r2, [r3]
 cb8:	e8bd8810 	pop	{r4, fp, pc}

00000cbc <malloc>:
 cbc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 cc0:	e3007e14 	movw	r7, #3604	; 0xe14
 cc4:	e3407000 	movt	r7, #0
 cc8:	e2804007 	add	r4, r0, #7
 ccc:	e28db014 	add	fp, sp, #20
 cd0:	e5973000 	ldr	r3, [r7]
 cd4:	e1a041a4 	lsr	r4, r4, #3
 cd8:	e2844001 	add	r4, r4, #1
 cdc:	e3530000 	cmp	r3, #0
 ce0:	0a000027 	beq	d84 <malloc+0xc8>
 ce4:	e5930000 	ldr	r0, [r3]
 ce8:	e5902004 	ldr	r2, [r0, #4]
 cec:	e1540002 	cmp	r4, r2
 cf0:	9a000019 	bls	d5c <malloc+0xa0>
 cf4:	e3540a01 	cmp	r4, #4096	; 0x1000
 cf8:	21a05004 	movcs	r5, r4
 cfc:	33a05a01 	movcc	r5, #4096	; 0x1000
 d00:	e1a06185 	lsl	r6, r5, #3
 d04:	ea000003 	b	d18 <malloc+0x5c>
 d08:	e5930000 	ldr	r0, [r3]
 d0c:	e5902004 	ldr	r2, [r0, #4]
 d10:	e1540002 	cmp	r4, r2
 d14:	9a000010 	bls	d5c <malloc+0xa0>
 d18:	e5972000 	ldr	r2, [r7]
 d1c:	e1a03000 	mov	r3, r0
 d20:	e1520000 	cmp	r2, r0
 d24:	1afffff7 	bne	d08 <malloc+0x4c>
 d28:	e1a00006 	mov	r0, r6
 d2c:	ebfffee4 	bl	8c4 <sbrk>
 d30:	e1a03000 	mov	r3, r0
 d34:	e3730001 	cmn	r3, #1
 d38:	e2800008 	add	r0, r0, #8
 d3c:	0a000004 	beq	d54 <malloc+0x98>
 d40:	e5835004 	str	r5, [r3, #4]
 d44:	ebffffb5 	bl	c20 <free>
 d48:	e5973000 	ldr	r3, [r7]
 d4c:	e3530000 	cmp	r3, #0
 d50:	1affffec 	bne	d08 <malloc+0x4c>
 d54:	e3a00000 	mov	r0, #0
 d58:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 d5c:	e1540002 	cmp	r4, r2
 d60:	e5873000 	str	r3, [r7]
 d64:	10422004 	subne	r2, r2, r4
 d68:	15802004 	strne	r2, [r0, #4]
 d6c:	05902000 	ldreq	r2, [r0]
 d70:	10800182 	addne	r0, r0, r2, lsl #3
 d74:	e2800008 	add	r0, r0, #8
 d78:	15004004 	strne	r4, [r0, #-4]
 d7c:	05832000 	streq	r2, [r3]
 d80:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 d84:	e2870004 	add	r0, r7, #4
 d88:	e5873008 	str	r3, [r7, #8]
 d8c:	e5870000 	str	r0, [r7]
 d90:	e5870004 	str	r0, [r7, #4]
 d94:	eaffffd6 	b	cf4 <malloc+0x38>
