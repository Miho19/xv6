
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	e28db01c 	add	fp, sp, #28
   c:	da00001f 	ble	90 <main+0x90>
  10:	e3500002 	cmp	r0, #2
  14:	e1a08000 	mov	r8, r0
  18:	e5919004 	ldr	r9, [r1, #4]
  1c:	12814008 	addne	r4, r1, #8
  20:	13a05002 	movne	r5, #2
  24:	0a000015 	beq	80 <main+0x80>
  28:	e5940000 	ldr	r0, [r4]
  2c:	e3a01000 	mov	r1, #0
  30:	eb0001db 	bl	7a4 <open>
  34:	e1a07004 	mov	r7, r4
  38:	e2844004 	add	r4, r4, #4
  3c:	e2506000 	subs	r6, r0, #0
  40:	ba000008 	blt	68 <main+0x68>
  44:	e1a01006 	mov	r1, r6
  48:	e1a00009 	mov	r0, r9
  4c:	eb000083 	bl	260 <grep>
  50:	e2855001 	add	r5, r5, #1
  54:	e1a00006 	mov	r0, r6
  58:	eb0001aa 	bl	708 <close>
  5c:	e1580005 	cmp	r8, r5
  60:	cafffff0 	bgt	28 <main+0x28>
  64:	eb000159 	bl	5d0 <exit>
  68:	e5972000 	ldr	r2, [r7]
  6c:	e3001e6c 	movw	r1, #3692	; 0xe6c
  70:	e3a00001 	mov	r0, #1
  74:	e3401000 	movt	r1, #0
  78:	eb0002ad 	bl	b34 <printf>
  7c:	eb000153 	bl	5d0 <exit>
  80:	e1a00009 	mov	r0, r9
  84:	e3a01000 	mov	r1, #0
  88:	eb000074 	bl	260 <grep>
  8c:	eb00014f 	bl	5d0 <exit>
  90:	e3001e4c 	movw	r1, #3660	; 0xe4c
  94:	e3a00002 	mov	r0, #2
  98:	e3401000 	movt	r1, #0
  9c:	eb0002a4 	bl	b34 <printf>
  a0:	eb00014a 	bl	5d0 <exit>

000000a4 <matchstar>:
  a4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  a8:	e1a05000 	mov	r5, r0
  ac:	e28db014 	add	fp, sp, #20
  b0:	e1a06001 	mov	r6, r1
  b4:	e1a04002 	mov	r4, r2
  b8:	ea000005 	b	d4 <matchstar+0x30>
  bc:	e4d43001 	ldrb	r3, [r4], #1
  c0:	e3530000 	cmp	r3, #0
  c4:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
  c8:	e1530005 	cmp	r3, r5
  cc:	1355002e 	cmpne	r5, #46	; 0x2e
  d0:	1a000006 	bne	f0 <matchstar+0x4c>
  d4:	e1a01004 	mov	r1, r4
  d8:	e1a00006 	mov	r0, r6
  dc:	eb000004 	bl	f4 <matchhere>
  e0:	e3500000 	cmp	r0, #0
  e4:	0afffff4 	beq	bc <matchstar+0x18>
  e8:	e3a00001 	mov	r0, #1
  ec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f4 <matchhere>:
  f4:	e5d02000 	ldrb	r2, [r0]
  f8:	e3520000 	cmp	r2, #0
  fc:	0a000035 	beq	1d8 <matchhere+0xe4>
 100:	e5d03001 	ldrb	r3, [r0, #1]
 104:	e353002a 	cmp	r3, #42	; 0x2a
 108:	0a000034 	beq	1e0 <matchhere+0xec>
 10c:	e3520024 	cmp	r2, #36	; 0x24
 110:	03530000 	cmpeq	r3, #0
 114:	0a00002b 	beq	1c8 <matchhere+0xd4>
 118:	e5d1c000 	ldrb	ip, [r1]
 11c:	e35c0000 	cmp	ip, #0
 120:	0a000033 	beq	1f4 <matchhere+0x100>
 124:	e352002e 	cmp	r2, #46	; 0x2e
 128:	1152000c 	cmpne	r2, ip
 12c:	03a02001 	moveq	r2, #1
 130:	13a02000 	movne	r2, #0
 134:	1a000030 	bne	1fc <matchhere+0x108>
 138:	e92d4810 	push	{r4, fp, lr}
 13c:	e280c001 	add	ip, r0, #1
 140:	e28db008 	add	fp, sp, #8
 144:	e281e001 	add	lr, r1, #1
 148:	e3530000 	cmp	r3, #0
 14c:	e1a0000c 	mov	r0, ip
 150:	e1a0100e 	mov	r1, lr
 154:	0a000015 	beq	1b0 <matchhere+0xbc>
 158:	e5fc4001 	ldrb	r4, [ip, #1]!
 15c:	e354002a 	cmp	r4, #42	; 0x2a
 160:	0a00000c 	beq	198 <matchhere+0xa4>
 164:	e3530024 	cmp	r3, #36	; 0x24
 168:	03540000 	cmpeq	r4, #0
 16c:	0a000011 	beq	1b8 <matchhere+0xc4>
 170:	e4de0001 	ldrb	r0, [lr], #1
 174:	e3500000 	cmp	r0, #0
 178:	08bd8810 	popeq	{r4, fp, pc}
 17c:	e1500003 	cmp	r0, r3
 180:	1353002e 	cmpne	r3, #46	; 0x2e
 184:	e1a03004 	mov	r3, r4
 188:	03a00001 	moveq	r0, #1
 18c:	13a00000 	movne	r0, #0
 190:	0affffec 	beq	148 <matchhere+0x54>
 194:	e8bd8810 	pop	{r4, fp, pc}
 198:	e1a02001 	mov	r2, r1
 19c:	e2801002 	add	r1, r0, #2
 1a0:	e1a00003 	mov	r0, r3
 1a4:	e24bd008 	sub	sp, fp, #8
 1a8:	e8bd4810 	pop	{r4, fp, lr}
 1ac:	eaffffbc 	b	a4 <matchstar>
 1b0:	e3a00001 	mov	r0, #1
 1b4:	e8bd8810 	pop	{r4, fp, pc}
 1b8:	e5d10000 	ldrb	r0, [r1]
 1bc:	e16f0f10 	clz	r0, r0
 1c0:	e1a002a0 	lsr	r0, r0, #5
 1c4:	e8bd8810 	pop	{r4, fp, pc}
 1c8:	e5d10000 	ldrb	r0, [r1]
 1cc:	e16f0f10 	clz	r0, r0
 1d0:	e1a002a0 	lsr	r0, r0, #5
 1d4:	e12fff1e 	bx	lr
 1d8:	e3a00001 	mov	r0, #1
 1dc:	e12fff1e 	bx	lr
 1e0:	e1a03002 	mov	r3, r2
 1e4:	e1a02001 	mov	r2, r1
 1e8:	e2801002 	add	r1, r0, #2
 1ec:	e1a00003 	mov	r0, r3
 1f0:	eaffffab 	b	a4 <matchstar>
 1f4:	e1a0000c 	mov	r0, ip
 1f8:	e12fff1e 	bx	lr
 1fc:	e1a00002 	mov	r0, r2
 200:	e12fff1e 	bx	lr

00000204 <match>:
 204:	e92d4830 	push	{r4, r5, fp, lr}
 208:	e1a05000 	mov	r5, r0
 20c:	e5d03000 	ldrb	r3, [r0]
 210:	e28db00c 	add	fp, sp, #12
 214:	e353005e 	cmp	r3, #94	; 0x5e
 218:	11a04001 	movne	r4, r1
 21c:	1a000003 	bne	230 <match+0x2c>
 220:	ea00000a 	b	250 <match+0x4c>
 224:	e4d43001 	ldrb	r3, [r4], #1
 228:	e3530000 	cmp	r3, #0
 22c:	0a000006 	beq	24c <match+0x48>
 230:	e1a01004 	mov	r1, r4
 234:	e1a00005 	mov	r0, r5
 238:	ebffffad 	bl	f4 <matchhere>
 23c:	e3500000 	cmp	r0, #0
 240:	0afffff7 	beq	224 <match+0x20>
 244:	e3a00001 	mov	r0, #1
 248:	e8bd8830 	pop	{r4, r5, fp, pc}
 24c:	e8bd8830 	pop	{r4, r5, fp, pc}
 250:	e2800001 	add	r0, r0, #1
 254:	e24bd00c 	sub	sp, fp, #12
 258:	e8bd4830 	pop	{r4, r5, fp, lr}
 25c:	eaffffa4 	b	f4 <matchhere>

00000260 <grep>:
 260:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 264:	e3009eac 	movw	r9, #3756	; 0xeac
 268:	e28db020 	add	fp, sp, #32
 26c:	e3a07000 	mov	r7, #0
 270:	e3409000 	movt	r9, #0
 274:	e1a05000 	mov	r5, r0
 278:	e1a06007 	mov	r6, r7
 27c:	e24dd00c 	sub	sp, sp, #12
 280:	e50b1028 	str	r1, [fp, #-40]	; 0xffffffd8
 284:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 288:	e0891007 	add	r1, r9, r7
 28c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
 290:	eb000102 	bl	6a0 <read>
 294:	e3500000 	cmp	r0, #0
 298:	da000022 	ble	328 <grep+0xc8>
 29c:	e0877000 	add	r7, r7, r0
 2a0:	e1a04009 	mov	r4, r9
 2a4:	e3a0800a 	mov	r8, #10
 2a8:	e3a0100a 	mov	r1, #10
 2ac:	e1a00004 	mov	r0, r4
 2b0:	eb00005b 	bl	424 <strchr>
 2b4:	e1a01004 	mov	r1, r4
 2b8:	e250a000 	subs	sl, r0, #0
 2bc:	e1a00005 	mov	r0, r5
 2c0:	0a00000c 	beq	2f8 <grep+0x98>
 2c4:	e5ca6000 	strb	r6, [sl]
 2c8:	ebffffcd 	bl	204 <match>
 2cc:	e3500000 	cmp	r0, #0
 2d0:	028a4001 	addeq	r4, sl, #1
 2d4:	0afffff3 	beq	2a8 <grep+0x48>
 2d8:	e1a0300a 	mov	r3, sl
 2dc:	e1a01004 	mov	r1, r4
 2e0:	e4c38001 	strb	r8, [r3], #1
 2e4:	e3a00001 	mov	r0, #1
 2e8:	e0432004 	sub	r2, r3, r4
 2ec:	e1a04003 	mov	r4, r3
 2f0:	eb0000f7 	bl	6d4 <write>
 2f4:	eaffffeb 	b	2a8 <grep+0x48>
 2f8:	e1540009 	cmp	r4, r9
 2fc:	01a0700a 	moveq	r7, sl
 300:	0affffdf 	beq	284 <grep+0x24>
 304:	e3570000 	cmp	r7, #0
 308:	daffffdd 	ble	284 <grep+0x24>
 30c:	e0443009 	sub	r3, r4, r9
 310:	e3000eac 	movw	r0, #3756	; 0xeac
 314:	e0477003 	sub	r7, r7, r3
 318:	e3400000 	movt	r0, #0
 31c:	e1a02007 	mov	r2, r7
 320:	eb000090 	bl	568 <memmove>
 324:	eaffffd6 	b	284 <grep+0x24>
 328:	e24bd020 	sub	sp, fp, #32
 32c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000330 <strcpy>:
 330:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 334:	e2402001 	sub	r2, r0, #1
 338:	e28db000 	add	fp, sp, #0
 33c:	e4d13001 	ldrb	r3, [r1], #1
 340:	e3530000 	cmp	r3, #0
 344:	e5e23001 	strb	r3, [r2, #1]!
 348:	1afffffb 	bne	33c <strcpy+0xc>
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <strcmp>:
 358:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 35c:	e28db000 	add	fp, sp, #0
 360:	e5d03000 	ldrb	r3, [r0]
 364:	e5d12000 	ldrb	r2, [r1]
 368:	e3530000 	cmp	r3, #0
 36c:	1a000004 	bne	384 <strcmp+0x2c>
 370:	ea000005 	b	38c <strcmp+0x34>
 374:	e5f03001 	ldrb	r3, [r0, #1]!
 378:	e3530000 	cmp	r3, #0
 37c:	0a000006 	beq	39c <strcmp+0x44>
 380:	e5f12001 	ldrb	r2, [r1, #1]!
 384:	e1530002 	cmp	r3, r2
 388:	0afffff9 	beq	374 <strcmp+0x1c>
 38c:	e0430002 	sub	r0, r3, r2
 390:	e28bd000 	add	sp, fp, #0
 394:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 398:	e12fff1e 	bx	lr
 39c:	e5d12001 	ldrb	r2, [r1, #1]
 3a0:	e0430002 	sub	r0, r3, r2
 3a4:	e28bd000 	add	sp, fp, #0
 3a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3ac:	e12fff1e 	bx	lr

000003b0 <strlen>:
 3b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3b4:	e28db000 	add	fp, sp, #0
 3b8:	e5d03000 	ldrb	r3, [r0]
 3bc:	e3530000 	cmp	r3, #0
 3c0:	0a000009 	beq	3ec <strlen+0x3c>
 3c4:	e1a02000 	mov	r2, r0
 3c8:	e3a03000 	mov	r3, #0
 3cc:	e5f21001 	ldrb	r1, [r2, #1]!
 3d0:	e2833001 	add	r3, r3, #1
 3d4:	e3510000 	cmp	r1, #0
 3d8:	e1a00003 	mov	r0, r3
 3dc:	1afffffa 	bne	3cc <strlen+0x1c>
 3e0:	e28bd000 	add	sp, fp, #0
 3e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e8:	e12fff1e 	bx	lr
 3ec:	e1a00003 	mov	r0, r3
 3f0:	eafffffa 	b	3e0 <strlen+0x30>

000003f4 <memset>:
 3f4:	e3520000 	cmp	r2, #0
 3f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3fc:	e28db000 	add	fp, sp, #0
 400:	0a000004 	beq	418 <memset+0x24>
 404:	e6ef1071 	uxtb	r1, r1
 408:	e0802002 	add	r2, r0, r2
 40c:	e4c01001 	strb	r1, [r0], #1
 410:	e1520000 	cmp	r2, r0
 414:	1afffffc 	bne	40c <memset+0x18>
 418:	e28bd000 	add	sp, fp, #0
 41c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 420:	e12fff1e 	bx	lr

00000424 <strchr>:
 424:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 428:	e28db000 	add	fp, sp, #0
 42c:	e5d02000 	ldrb	r2, [r0]
 430:	e3520000 	cmp	r2, #0
 434:	0a00000b 	beq	468 <strchr+0x44>
 438:	e1510002 	cmp	r1, r2
 43c:	1a000002 	bne	44c <strchr+0x28>
 440:	ea000005 	b	45c <strchr+0x38>
 444:	e1530001 	cmp	r3, r1
 448:	0a000003 	beq	45c <strchr+0x38>
 44c:	e5f03001 	ldrb	r3, [r0, #1]!
 450:	e3530000 	cmp	r3, #0
 454:	1afffffa 	bne	444 <strchr+0x20>
 458:	e1a00003 	mov	r0, r3
 45c:	e28bd000 	add	sp, fp, #0
 460:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 464:	e12fff1e 	bx	lr
 468:	e1a00002 	mov	r0, r2
 46c:	eafffffa 	b	45c <strchr+0x38>

00000470 <gets>:
 470:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 474:	e1a08000 	mov	r8, r0
 478:	e28db018 	add	fp, sp, #24
 47c:	e1a07001 	mov	r7, r1
 480:	e24dd00c 	sub	sp, sp, #12
 484:	e2406001 	sub	r6, r0, #1
 488:	e3a05000 	mov	r5, #0
 48c:	ea000008 	b	4b4 <gets+0x44>
 490:	eb000082 	bl	6a0 <read>
 494:	e3500000 	cmp	r0, #0
 498:	da00000b 	ble	4cc <gets+0x5c>
 49c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 4a0:	e1a05004 	mov	r5, r4
 4a4:	e353000d 	cmp	r3, #13
 4a8:	1353000a 	cmpne	r3, #10
 4ac:	e5e63001 	strb	r3, [r6, #1]!
 4b0:	0a000005 	beq	4cc <gets+0x5c>
 4b4:	e3a02001 	mov	r2, #1
 4b8:	e0854002 	add	r4, r5, r2
 4bc:	e1540007 	cmp	r4, r7
 4c0:	e24b101d 	sub	r1, fp, #29
 4c4:	e3a00000 	mov	r0, #0
 4c8:	bafffff0 	blt	490 <gets+0x20>
 4cc:	e3a03000 	mov	r3, #0
 4d0:	e1a00008 	mov	r0, r8
 4d4:	e7c83005 	strb	r3, [r8, r5]
 4d8:	e24bd018 	sub	sp, fp, #24
 4dc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000004e0 <stat>:
 4e0:	e92d4830 	push	{r4, r5, fp, lr}
 4e4:	e1a04001 	mov	r4, r1
 4e8:	e28db00c 	add	fp, sp, #12
 4ec:	e3a01000 	mov	r1, #0
 4f0:	eb0000ab 	bl	7a4 <open>
 4f4:	e2505000 	subs	r5, r0, #0
 4f8:	ba000006 	blt	518 <stat+0x38>
 4fc:	e1a01004 	mov	r1, r4
 500:	eb0000ce 	bl	840 <fstat>
 504:	e1a04000 	mov	r4, r0
 508:	e1a00005 	mov	r0, r5
 50c:	eb00007d 	bl	708 <close>
 510:	e1a00004 	mov	r0, r4
 514:	e8bd8830 	pop	{r4, r5, fp, pc}
 518:	e3e04000 	mvn	r4, #0
 51c:	eafffffb 	b	510 <stat+0x30>

00000520 <atoi>:
 520:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 524:	e28db000 	add	fp, sp, #0
 528:	e5d02000 	ldrb	r2, [r0]
 52c:	e2423030 	sub	r3, r2, #48	; 0x30
 530:	e3530009 	cmp	r3, #9
 534:	e3a03000 	mov	r3, #0
 538:	8a000006 	bhi	558 <atoi+0x38>
 53c:	e3a0c00a 	mov	ip, #10
 540:	e023239c 	mla	r3, ip, r3, r2
 544:	e5f02001 	ldrb	r2, [r0, #1]!
 548:	e2421030 	sub	r1, r2, #48	; 0x30
 54c:	e3510009 	cmp	r1, #9
 550:	e2433030 	sub	r3, r3, #48	; 0x30
 554:	9afffff9 	bls	540 <atoi+0x20>
 558:	e1a00003 	mov	r0, r3
 55c:	e28bd000 	add	sp, fp, #0
 560:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <memmove>:
 568:	e3520000 	cmp	r2, #0
 56c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 570:	e28db000 	add	fp, sp, #0
 574:	da000005 	ble	590 <memmove+0x28>
 578:	e0812002 	add	r2, r1, r2
 57c:	e2403001 	sub	r3, r0, #1
 580:	e4d1c001 	ldrb	ip, [r1], #1
 584:	e1510002 	cmp	r1, r2
 588:	e5e3c001 	strb	ip, [r3, #1]!
 58c:	1afffffb 	bne	580 <memmove+0x18>
 590:	e28bd000 	add	sp, fp, #0
 594:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <fork>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00001 	mov	r0, #1
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <exit>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00002 	mov	r0, #2
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <wait>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00003 	mov	r0, #3
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <lseek>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a00016 	mov	r0, #22
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <pipe>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00004 	mov	r0, #4
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <read>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a00005 	mov	r0, #5
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <write>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a00010 	mov	r0, #16
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <close>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a00015 	mov	r0, #21
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <kill>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a00006 	mov	r0, #6
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <exec>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a00007 	mov	r0, #7
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <open>:
 7a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b8:	e3a0000f 	mov	r0, #15
 7bc:	ef000040 	svc	0x00000040
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d4:	e12fff1e 	bx	lr

000007d8 <mknod>:
 7d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ec:	e3a00011 	mov	r0, #17
 7f0:	ef000040 	svc	0x00000040
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 800:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 804:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 808:	e12fff1e 	bx	lr

0000080c <unlink>:
 80c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 810:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 814:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 818:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 81c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 820:	e3a00012 	mov	r0, #18
 824:	ef000040 	svc	0x00000040
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 830:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 834:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 838:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 83c:	e12fff1e 	bx	lr

00000840 <fstat>:
 840:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 844:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 848:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 84c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 850:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 854:	e3a00008 	mov	r0, #8
 858:	ef000040 	svc	0x00000040
 85c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 860:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 864:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 868:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 86c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 870:	e12fff1e 	bx	lr

00000874 <link>:
 874:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 878:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 87c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 880:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 884:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 888:	e3a00013 	mov	r0, #19
 88c:	ef000040 	svc	0x00000040
 890:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 894:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 898:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 89c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8a4:	e12fff1e 	bx	lr

000008a8 <mkdir>:
 8a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8bc:	e3a00014 	mov	r0, #20
 8c0:	ef000040 	svc	0x00000040
 8c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8d8:	e12fff1e 	bx	lr

000008dc <chdir>:
 8dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8f0:	e3a00009 	mov	r0, #9
 8f4:	ef000040 	svc	0x00000040
 8f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 900:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 904:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 908:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 90c:	e12fff1e 	bx	lr

00000910 <dup>:
 910:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 914:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 918:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 91c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 920:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 924:	e3a0000a 	mov	r0, #10
 928:	ef000040 	svc	0x00000040
 92c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 930:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 934:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 938:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 93c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 940:	e12fff1e 	bx	lr

00000944 <getpid>:
 944:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 948:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 94c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 950:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 954:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 958:	e3a0000b 	mov	r0, #11
 95c:	ef000040 	svc	0x00000040
 960:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 964:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 968:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 96c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 970:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 974:	e12fff1e 	bx	lr

00000978 <sbrk>:
 978:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 97c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 980:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 984:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 988:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 98c:	e3a0000c 	mov	r0, #12
 990:	ef000040 	svc	0x00000040
 994:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 998:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 99c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9a8:	e12fff1e 	bx	lr

000009ac <sleep>:
 9ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9c0:	e3a0000d 	mov	r0, #13
 9c4:	ef000040 	svc	0x00000040
 9c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9dc:	e12fff1e 	bx	lr

000009e0 <uptime>:
 9e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9f4:	e3a0000e 	mov	r0, #14
 9f8:	ef000040 	svc	0x00000040
 9fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 a00:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 a04:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 a08:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 a0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 a10:	e12fff1e 	bx	lr

00000a14 <printint>:
 a14:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 a18:	e1a09fa1 	lsr	r9, r1, #31
 a1c:	e3530000 	cmp	r3, #0
 a20:	03a09000 	moveq	r9, #0
 a24:	12099001 	andne	r9, r9, #1
 a28:	e28db01c 	add	fp, sp, #28
 a2c:	e3590000 	cmp	r9, #0
 a30:	e3008e84 	movw	r8, #3716	; 0xe84
 a34:	1261e000 	rsbne	lr, r1, #0
 a38:	e3408000 	movt	r8, #0
 a3c:	e24b602d 	sub	r6, fp, #45	; 0x2d
 a40:	e1a04000 	mov	r4, r0
 a44:	13a09001 	movne	r9, #1
 a48:	01a0e001 	moveq	lr, r1
 a4c:	e3a07000 	mov	r7, #0
 a50:	e3a05001 	mov	r5, #1
 a54:	e24dd018 	sub	sp, sp, #24
 a58:	e3a0c000 	mov	ip, #0
 a5c:	e3a0301f 	mov	r3, #31
 a60:	e1a0100c 	mov	r1, ip
 a64:	e1a0033e 	lsr	r0, lr, r3
 a68:	e2000001 	and	r0, r0, #1
 a6c:	e1801081 	orr	r1, r0, r1, lsl #1
 a70:	e1520001 	cmp	r2, r1
 a74:	90411002 	subls	r1, r1, r2
 a78:	918cc315 	orrls	ip, ip, r5, lsl r3
 a7c:	e2533001 	subs	r3, r3, #1
 a80:	2afffff7 	bcs	a64 <printint+0x50>
 a84:	e061e29c 	mls	r1, ip, r2, lr
 a88:	e35c0000 	cmp	ip, #0
 a8c:	e1a0e00c 	mov	lr, ip
 a90:	e2873001 	add	r3, r7, #1
 a94:	e7d81001 	ldrb	r1, [r8, r1]
 a98:	e5e61001 	strb	r1, [r6, #1]!
 a9c:	11a07003 	movne	r7, r3
 aa0:	1affffec 	bne	a58 <printint+0x44>
 aa4:	e3590000 	cmp	r9, #0
 aa8:	124b201c 	subne	r2, fp, #28
 aac:	10822003 	addne	r2, r2, r3
 ab0:	13a0102d 	movne	r1, #45	; 0x2d
 ab4:	12873002 	addne	r3, r7, #2
 ab8:	15421010 	strbne	r1, [r2, #-16]
 abc:	e24b202c 	sub	r2, fp, #44	; 0x2c
 ac0:	e2435001 	sub	r5, r3, #1
 ac4:	e0826003 	add	r6, r2, r3
 ac8:	e5763001 	ldrb	r3, [r6, #-1]!
 acc:	e2455001 	sub	r5, r5, #1
 ad0:	e3a02001 	mov	r2, #1
 ad4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 ad8:	e1a00004 	mov	r0, r4
 adc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 ae0:	ebfffefb 	bl	6d4 <write>
 ae4:	e3750001 	cmn	r5, #1
 ae8:	1afffff6 	bne	ac8 <printint+0xb4>
 aec:	e24bd01c 	sub	sp, fp, #28
 af0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000af4 <div>:
 af4:	e92d4810 	push	{r4, fp, lr}
 af8:	e3a02000 	mov	r2, #0
 afc:	e28db008 	add	fp, sp, #8
 b00:	e1a0e000 	mov	lr, r0
 b04:	e3a0301f 	mov	r3, #31
 b08:	e1a00002 	mov	r0, r2
 b0c:	e3a04001 	mov	r4, #1
 b10:	e1a0c33e 	lsr	ip, lr, r3
 b14:	e20cc001 	and	ip, ip, #1
 b18:	e18c2082 	orr	r2, ip, r2, lsl #1
 b1c:	e1520001 	cmp	r2, r1
 b20:	20422001 	subcs	r2, r2, r1
 b24:	21800314 	orrcs	r0, r0, r4, lsl r3
 b28:	e2533001 	subs	r3, r3, #1
 b2c:	2afffff7 	bcs	b10 <div+0x1c>
 b30:	e8bd8810 	pop	{r4, fp, pc}

00000b34 <printf>:
 b34:	e92d000e 	push	{r1, r2, r3}
 b38:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 b3c:	e28db018 	add	fp, sp, #24
 b40:	e24dd008 	sub	sp, sp, #8
 b44:	e59b6004 	ldr	r6, [fp, #4]
 b48:	e5d64000 	ldrb	r4, [r6]
 b4c:	e3540000 	cmp	r4, #0
 b50:	0a00002b 	beq	c04 <printf+0xd0>
 b54:	e1a07000 	mov	r7, r0
 b58:	e28b8008 	add	r8, fp, #8
 b5c:	e3a05000 	mov	r5, #0
 b60:	ea00000a 	b	b90 <printf+0x5c>
 b64:	e3540025 	cmp	r4, #37	; 0x25
 b68:	01a05004 	moveq	r5, r4
 b6c:	0a000004 	beq	b84 <printf+0x50>
 b70:	e24b1018 	sub	r1, fp, #24
 b74:	e3a02001 	mov	r2, #1
 b78:	e1a00007 	mov	r0, r7
 b7c:	e5614006 	strb	r4, [r1, #-6]!
 b80:	ebfffed3 	bl	6d4 <write>
 b84:	e5f64001 	ldrb	r4, [r6, #1]!
 b88:	e3540000 	cmp	r4, #0
 b8c:	0a00001c 	beq	c04 <printf+0xd0>
 b90:	e3550000 	cmp	r5, #0
 b94:	0afffff2 	beq	b64 <printf+0x30>
 b98:	e3550025 	cmp	r5, #37	; 0x25
 b9c:	1afffff8 	bne	b84 <printf+0x50>
 ba0:	e3540064 	cmp	r4, #100	; 0x64
 ba4:	0a000037 	beq	c88 <printf+0x154>
 ba8:	e20430f7 	and	r3, r4, #247	; 0xf7
 bac:	e3530070 	cmp	r3, #112	; 0x70
 bb0:	0a000017 	beq	c14 <printf+0xe0>
 bb4:	e3540073 	cmp	r4, #115	; 0x73
 bb8:	0a00001c 	beq	c30 <printf+0xfc>
 bbc:	e3540063 	cmp	r4, #99	; 0x63
 bc0:	0a000037 	beq	ca4 <printf+0x170>
 bc4:	e3540025 	cmp	r4, #37	; 0x25
 bc8:	0a000027 	beq	c6c <printf+0x138>
 bcc:	e3a02001 	mov	r2, #1
 bd0:	e24b1019 	sub	r1, fp, #25
 bd4:	e1a00007 	mov	r0, r7
 bd8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 bdc:	ebfffebc 	bl	6d4 <write>
 be0:	e3a02001 	mov	r2, #1
 be4:	e24b101a 	sub	r1, fp, #26
 be8:	e1a00007 	mov	r0, r7
 bec:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 bf0:	ebfffeb7 	bl	6d4 <write>
 bf4:	e5f64001 	ldrb	r4, [r6, #1]!
 bf8:	e3a05000 	mov	r5, #0
 bfc:	e3540000 	cmp	r4, #0
 c00:	1affffe2 	bne	b90 <printf+0x5c>
 c04:	e24bd018 	sub	sp, fp, #24
 c08:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 c0c:	e28dd00c 	add	sp, sp, #12
 c10:	e12fff1e 	bx	lr
 c14:	e3a03000 	mov	r3, #0
 c18:	e3a02010 	mov	r2, #16
 c1c:	e4981004 	ldr	r1, [r8], #4
 c20:	e1a00007 	mov	r0, r7
 c24:	ebffff7a 	bl	a14 <printint>
 c28:	e3a05000 	mov	r5, #0
 c2c:	eaffffd4 	b	b84 <printf+0x50>
 c30:	e4984004 	ldr	r4, [r8], #4
 c34:	e3540000 	cmp	r4, #0
 c38:	0a000021 	beq	cc4 <printf+0x190>
 c3c:	e5d45000 	ldrb	r5, [r4]
 c40:	e3550000 	cmp	r5, #0
 c44:	0affffce 	beq	b84 <printf+0x50>
 c48:	e3a02001 	mov	r2, #1
 c4c:	e24b101d 	sub	r1, fp, #29
 c50:	e1a00007 	mov	r0, r7
 c54:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 c58:	ebfffe9d 	bl	6d4 <write>
 c5c:	e5f45001 	ldrb	r5, [r4, #1]!
 c60:	e3550000 	cmp	r5, #0
 c64:	1afffff7 	bne	c48 <printf+0x114>
 c68:	eaffffc5 	b	b84 <printf+0x50>
 c6c:	e24b1018 	sub	r1, fp, #24
 c70:	e3a02001 	mov	r2, #1
 c74:	e1a00007 	mov	r0, r7
 c78:	e5615003 	strb	r5, [r1, #-3]!
 c7c:	e3a05000 	mov	r5, #0
 c80:	ebfffe93 	bl	6d4 <write>
 c84:	eaffffbe 	b	b84 <printf+0x50>
 c88:	e3a03001 	mov	r3, #1
 c8c:	e3a0200a 	mov	r2, #10
 c90:	e4981004 	ldr	r1, [r8], #4
 c94:	e1a00007 	mov	r0, r7
 c98:	ebffff5d 	bl	a14 <printint>
 c9c:	e3a05000 	mov	r5, #0
 ca0:	eaffffb7 	b	b84 <printf+0x50>
 ca4:	e4983004 	ldr	r3, [r8], #4
 ca8:	e24b1018 	sub	r1, fp, #24
 cac:	e3a02001 	mov	r2, #1
 cb0:	e1a00007 	mov	r0, r7
 cb4:	e3a05000 	mov	r5, #0
 cb8:	e5613004 	strb	r3, [r1, #-4]!
 cbc:	ebfffe84 	bl	6d4 <write>
 cc0:	eaffffaf 	b	b84 <printf+0x50>
 cc4:	e3004e98 	movw	r4, #3736	; 0xe98
 cc8:	e3a05028 	mov	r5, #40	; 0x28
 ccc:	e3404000 	movt	r4, #0
 cd0:	eaffffdc 	b	c48 <printf+0x114>

00000cd4 <free>:
 cd4:	e300cea0 	movw	ip, #3744	; 0xea0
 cd8:	e340c000 	movt	ip, #0
 cdc:	e92d4810 	push	{r4, fp, lr}
 ce0:	e2401008 	sub	r1, r0, #8
 ce4:	e28db008 	add	fp, sp, #8
 ce8:	e59c3000 	ldr	r3, [ip]
 cec:	ea000004 	b	d04 <free+0x30>
 cf0:	e1510002 	cmp	r1, r2
 cf4:	3a000009 	bcc	d20 <free+0x4c>
 cf8:	e1530002 	cmp	r3, r2
 cfc:	2a000007 	bcs	d20 <free+0x4c>
 d00:	e1a03002 	mov	r3, r2
 d04:	e1530001 	cmp	r3, r1
 d08:	e5932000 	ldr	r2, [r3]
 d0c:	3afffff7 	bcc	cf0 <free+0x1c>
 d10:	e1530002 	cmp	r3, r2
 d14:	3afffff9 	bcc	d00 <free+0x2c>
 d18:	e1510002 	cmp	r1, r2
 d1c:	2afffff7 	bcs	d00 <free+0x2c>
 d20:	e510e004 	ldr	lr, [r0, #-4]
 d24:	e58c3000 	str	r3, [ip]
 d28:	e081418e 	add	r4, r1, lr, lsl #3
 d2c:	e1520004 	cmp	r2, r4
 d30:	05922004 	ldreq	r2, [r2, #4]
 d34:	0082e00e 	addeq	lr, r2, lr
 d38:	0500e004 	streq	lr, [r0, #-4]
 d3c:	05932000 	ldreq	r2, [r3]
 d40:	05922000 	ldreq	r2, [r2]
 d44:	e5002008 	str	r2, [r0, #-8]
 d48:	e5932004 	ldr	r2, [r3, #4]
 d4c:	e083e182 	add	lr, r3, r2, lsl #3
 d50:	e151000e 	cmp	r1, lr
 d54:	15831000 	strne	r1, [r3]
 d58:	05101004 	ldreq	r1, [r0, #-4]
 d5c:	00812002 	addeq	r2, r1, r2
 d60:	05832004 	streq	r2, [r3, #4]
 d64:	05102008 	ldreq	r2, [r0, #-8]
 d68:	05832000 	streq	r2, [r3]
 d6c:	e8bd8810 	pop	{r4, fp, pc}

00000d70 <malloc>:
 d70:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 d74:	e3007ea0 	movw	r7, #3744	; 0xea0
 d78:	e3407000 	movt	r7, #0
 d7c:	e2804007 	add	r4, r0, #7
 d80:	e28db014 	add	fp, sp, #20
 d84:	e5973000 	ldr	r3, [r7]
 d88:	e1a041a4 	lsr	r4, r4, #3
 d8c:	e2844001 	add	r4, r4, #1
 d90:	e3530000 	cmp	r3, #0
 d94:	0a000027 	beq	e38 <malloc+0xc8>
 d98:	e5930000 	ldr	r0, [r3]
 d9c:	e5902004 	ldr	r2, [r0, #4]
 da0:	e1540002 	cmp	r4, r2
 da4:	9a000019 	bls	e10 <malloc+0xa0>
 da8:	e3540a01 	cmp	r4, #4096	; 0x1000
 dac:	21a05004 	movcs	r5, r4
 db0:	33a05a01 	movcc	r5, #4096	; 0x1000
 db4:	e1a06185 	lsl	r6, r5, #3
 db8:	ea000003 	b	dcc <malloc+0x5c>
 dbc:	e5930000 	ldr	r0, [r3]
 dc0:	e5902004 	ldr	r2, [r0, #4]
 dc4:	e1540002 	cmp	r4, r2
 dc8:	9a000010 	bls	e10 <malloc+0xa0>
 dcc:	e5972000 	ldr	r2, [r7]
 dd0:	e1a03000 	mov	r3, r0
 dd4:	e1520000 	cmp	r2, r0
 dd8:	1afffff7 	bne	dbc <malloc+0x4c>
 ddc:	e1a00006 	mov	r0, r6
 de0:	ebfffee4 	bl	978 <sbrk>
 de4:	e1a03000 	mov	r3, r0
 de8:	e3730001 	cmn	r3, #1
 dec:	e2800008 	add	r0, r0, #8
 df0:	0a000004 	beq	e08 <malloc+0x98>
 df4:	e5835004 	str	r5, [r3, #4]
 df8:	ebffffb5 	bl	cd4 <free>
 dfc:	e5973000 	ldr	r3, [r7]
 e00:	e3530000 	cmp	r3, #0
 e04:	1affffec 	bne	dbc <malloc+0x4c>
 e08:	e3a00000 	mov	r0, #0
 e0c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 e10:	e1540002 	cmp	r4, r2
 e14:	e5873000 	str	r3, [r7]
 e18:	10422004 	subne	r2, r2, r4
 e1c:	15802004 	strne	r2, [r0, #4]
 e20:	05902000 	ldreq	r2, [r0]
 e24:	10800182 	addne	r0, r0, r2, lsl #3
 e28:	e2800008 	add	r0, r0, #8
 e2c:	15004004 	strne	r4, [r0, #-4]
 e30:	05832000 	streq	r2, [r3]
 e34:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 e38:	e2870004 	add	r0, r7, #4
 e3c:	e5873008 	str	r3, [r7, #8]
 e40:	e5870000 	str	r0, [r7]
 e44:	e5870004 	str	r0, [r7, #4]
 e48:	eaffffd6 	b	da8 <malloc+0x38>
