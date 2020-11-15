
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   4:	e3000c08 	movw	r0, #3080	; 0xc08
   8:	e28db014 	add	fp, sp, #20
   c:	e3a01002 	mov	r1, #2
  10:	e3400000 	movt	r0, #0
  14:	eb000151 	bl	560 <open>
  18:	e3500000 	cmp	r0, #0
  1c:	ba000028 	blt	c4 <main+0xc4>
  20:	e3a00000 	mov	r0, #0
  24:	e3006c10 	movw	r6, #3088	; 0xc10
  28:	eb0001a7 	bl	6cc <dup>
  2c:	e3a00000 	mov	r0, #0
  30:	eb0001a5 	bl	6cc <dup>
  34:	e3005c54 	movw	r5, #3156	; 0xc54
  38:	e3406000 	movt	r6, #0
  3c:	e3405000 	movt	r5, #0
  40:	e1a01006 	mov	r1, r6
  44:	e3a00001 	mov	r0, #1
  48:	eb000228 	bl	8f0 <printf>
  4c:	eb0000c1 	bl	358 <fork>
  50:	e2504000 	subs	r4, r0, #0
  54:	ba00000b 	blt	88 <main+0x88>
  58:	0a00000f 	beq	9c <main+0x9c>
  5c:	eb0000d7 	bl	3c0 <wait>
  60:	e1540000 	cmp	r4, r0
  64:	e1e03000 	mvn	r3, r0
  68:	e1a03fa3 	lsr	r3, r3, #31
  6c:	03a03000 	moveq	r3, #0
  70:	e3530000 	cmp	r3, #0
  74:	0afffff1 	beq	40 <main+0x40>
  78:	e1a01005 	mov	r1, r5
  7c:	e3a00001 	mov	r0, #1
  80:	eb00021a 	bl	8f0 <printf>
  84:	eafffff4 	b	5c <main+0x5c>
  88:	e3001c24 	movw	r1, #3108	; 0xc24
  8c:	e3a00001 	mov	r0, #1
  90:	e3401000 	movt	r1, #0
  94:	eb000215 	bl	8f0 <printf>
  98:	eb0000bb 	bl	38c <exit>
  9c:	e3001c7c 	movw	r1, #3196	; 0xc7c
  a0:	e3000c38 	movw	r0, #3128	; 0xc38
  a4:	e3401000 	movt	r1, #0
  a8:	e3400000 	movt	r0, #0
  ac:	eb00011e 	bl	52c <exec>
  b0:	e3001c3c 	movw	r1, #3132	; 0xc3c
  b4:	e3a00001 	mov	r0, #1
  b8:	e3401000 	movt	r1, #0
  bc:	eb00020b 	bl	8f0 <printf>
  c0:	eb0000b1 	bl	38c <exit>
  c4:	e3a02001 	mov	r2, #1
  c8:	e3000c08 	movw	r0, #3080	; 0xc08
  cc:	e1a01002 	mov	r1, r2
  d0:	e3400000 	movt	r0, #0
  d4:	eb00012e 	bl	594 <mknod>
  d8:	e3000c08 	movw	r0, #3080	; 0xc08
  dc:	e3a01002 	mov	r1, #2
  e0:	e3400000 	movt	r0, #0
  e4:	eb00011d 	bl	560 <open>
  e8:	eaffffcc 	b	20 <main+0x20>

000000ec <strcpy>:
  ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f0:	e2402001 	sub	r2, r0, #1
  f4:	e28db000 	add	fp, sp, #0
  f8:	e4d13001 	ldrb	r3, [r1], #1
  fc:	e3530000 	cmp	r3, #0
 100:	e5e23001 	strb	r3, [r2, #1]!
 104:	1afffffb 	bne	f8 <strcpy+0xc>
 108:	e28bd000 	add	sp, fp, #0
 10c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 110:	e12fff1e 	bx	lr

00000114 <strcmp>:
 114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 118:	e28db000 	add	fp, sp, #0
 11c:	e5d03000 	ldrb	r3, [r0]
 120:	e5d12000 	ldrb	r2, [r1]
 124:	e3530000 	cmp	r3, #0
 128:	1a000004 	bne	140 <strcmp+0x2c>
 12c:	ea000005 	b	148 <strcmp+0x34>
 130:	e5f03001 	ldrb	r3, [r0, #1]!
 134:	e3530000 	cmp	r3, #0
 138:	0a000006 	beq	158 <strcmp+0x44>
 13c:	e5f12001 	ldrb	r2, [r1, #1]!
 140:	e1530002 	cmp	r3, r2
 144:	0afffff9 	beq	130 <strcmp+0x1c>
 148:	e0430002 	sub	r0, r3, r2
 14c:	e28bd000 	add	sp, fp, #0
 150:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 154:	e12fff1e 	bx	lr
 158:	e5d12001 	ldrb	r2, [r1, #1]
 15c:	e0430002 	sub	r0, r3, r2
 160:	e28bd000 	add	sp, fp, #0
 164:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 168:	e12fff1e 	bx	lr

0000016c <strlen>:
 16c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 170:	e28db000 	add	fp, sp, #0
 174:	e5d03000 	ldrb	r3, [r0]
 178:	e3530000 	cmp	r3, #0
 17c:	0a000009 	beq	1a8 <strlen+0x3c>
 180:	e1a02000 	mov	r2, r0
 184:	e3a03000 	mov	r3, #0
 188:	e5f21001 	ldrb	r1, [r2, #1]!
 18c:	e2833001 	add	r3, r3, #1
 190:	e3510000 	cmp	r1, #0
 194:	e1a00003 	mov	r0, r3
 198:	1afffffa 	bne	188 <strlen+0x1c>
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr
 1a8:	e1a00003 	mov	r0, r3
 1ac:	eafffffa 	b	19c <strlen+0x30>

000001b0 <memset>:
 1b0:	e3520000 	cmp	r2, #0
 1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b8:	e28db000 	add	fp, sp, #0
 1bc:	0a000004 	beq	1d4 <memset+0x24>
 1c0:	e6ef1071 	uxtb	r1, r1
 1c4:	e0802002 	add	r2, r0, r2
 1c8:	e4c01001 	strb	r1, [r0], #1
 1cc:	e1520000 	cmp	r2, r0
 1d0:	1afffffc 	bne	1c8 <memset+0x18>
 1d4:	e28bd000 	add	sp, fp, #0
 1d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1dc:	e12fff1e 	bx	lr

000001e0 <strchr>:
 1e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1e4:	e28db000 	add	fp, sp, #0
 1e8:	e5d02000 	ldrb	r2, [r0]
 1ec:	e3520000 	cmp	r2, #0
 1f0:	0a00000b 	beq	224 <strchr+0x44>
 1f4:	e1510002 	cmp	r1, r2
 1f8:	1a000002 	bne	208 <strchr+0x28>
 1fc:	ea000005 	b	218 <strchr+0x38>
 200:	e1530001 	cmp	r3, r1
 204:	0a000003 	beq	218 <strchr+0x38>
 208:	e5f03001 	ldrb	r3, [r0, #1]!
 20c:	e3530000 	cmp	r3, #0
 210:	1afffffa 	bne	200 <strchr+0x20>
 214:	e1a00003 	mov	r0, r3
 218:	e28bd000 	add	sp, fp, #0
 21c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 220:	e12fff1e 	bx	lr
 224:	e1a00002 	mov	r0, r2
 228:	eafffffa 	b	218 <strchr+0x38>

0000022c <gets>:
 22c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 230:	e1a08000 	mov	r8, r0
 234:	e28db018 	add	fp, sp, #24
 238:	e1a07001 	mov	r7, r1
 23c:	e24dd00c 	sub	sp, sp, #12
 240:	e2406001 	sub	r6, r0, #1
 244:	e3a05000 	mov	r5, #0
 248:	ea000008 	b	270 <gets+0x44>
 24c:	eb000082 	bl	45c <read>
 250:	e3500000 	cmp	r0, #0
 254:	da00000b 	ble	288 <gets+0x5c>
 258:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 25c:	e1a05004 	mov	r5, r4
 260:	e353000d 	cmp	r3, #13
 264:	1353000a 	cmpne	r3, #10
 268:	e5e63001 	strb	r3, [r6, #1]!
 26c:	0a000005 	beq	288 <gets+0x5c>
 270:	e3a02001 	mov	r2, #1
 274:	e0854002 	add	r4, r5, r2
 278:	e1540007 	cmp	r4, r7
 27c:	e24b101d 	sub	r1, fp, #29
 280:	e3a00000 	mov	r0, #0
 284:	bafffff0 	blt	24c <gets+0x20>
 288:	e3a03000 	mov	r3, #0
 28c:	e1a00008 	mov	r0, r8
 290:	e7c83005 	strb	r3, [r8, r5]
 294:	e24bd018 	sub	sp, fp, #24
 298:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000029c <stat>:
 29c:	e92d4830 	push	{r4, r5, fp, lr}
 2a0:	e1a04001 	mov	r4, r1
 2a4:	e28db00c 	add	fp, sp, #12
 2a8:	e3a01000 	mov	r1, #0
 2ac:	eb0000ab 	bl	560 <open>
 2b0:	e2505000 	subs	r5, r0, #0
 2b4:	ba000006 	blt	2d4 <stat+0x38>
 2b8:	e1a01004 	mov	r1, r4
 2bc:	eb0000ce 	bl	5fc <fstat>
 2c0:	e1a04000 	mov	r4, r0
 2c4:	e1a00005 	mov	r0, r5
 2c8:	eb00007d 	bl	4c4 <close>
 2cc:	e1a00004 	mov	r0, r4
 2d0:	e8bd8830 	pop	{r4, r5, fp, pc}
 2d4:	e3e04000 	mvn	r4, #0
 2d8:	eafffffb 	b	2cc <stat+0x30>

000002dc <atoi>:
 2dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2e0:	e28db000 	add	fp, sp, #0
 2e4:	e5d02000 	ldrb	r2, [r0]
 2e8:	e2423030 	sub	r3, r2, #48	; 0x30
 2ec:	e3530009 	cmp	r3, #9
 2f0:	e3a03000 	mov	r3, #0
 2f4:	8a000006 	bhi	314 <atoi+0x38>
 2f8:	e3a0c00a 	mov	ip, #10
 2fc:	e023239c 	mla	r3, ip, r3, r2
 300:	e5f02001 	ldrb	r2, [r0, #1]!
 304:	e2421030 	sub	r1, r2, #48	; 0x30
 308:	e3510009 	cmp	r1, #9
 30c:	e2433030 	sub	r3, r3, #48	; 0x30
 310:	9afffff9 	bls	2fc <atoi+0x20>
 314:	e1a00003 	mov	r0, r3
 318:	e28bd000 	add	sp, fp, #0
 31c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 320:	e12fff1e 	bx	lr

00000324 <memmove>:
 324:	e3520000 	cmp	r2, #0
 328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 32c:	e28db000 	add	fp, sp, #0
 330:	da000005 	ble	34c <memmove+0x28>
 334:	e0812002 	add	r2, r1, r2
 338:	e2403001 	sub	r3, r0, #1
 33c:	e4d1c001 	ldrb	ip, [r1], #1
 340:	e1510002 	cmp	r1, r2
 344:	e5e3c001 	strb	ip, [r3, #1]!
 348:	1afffffb 	bne	33c <memmove+0x18>
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <fork>:
 358:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 35c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 360:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 364:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 368:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 36c:	e3a00001 	mov	r0, #1
 370:	ef000040 	svc	0x00000040
 374:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 378:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 37c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 380:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 384:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 388:	e12fff1e 	bx	lr

0000038c <exit>:
 38c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 390:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 394:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 398:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 39c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a0:	e3a00002 	mov	r0, #2
 3a4:	ef000040 	svc	0x00000040
 3a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3bc:	e12fff1e 	bx	lr

000003c0 <wait>:
 3c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d4:	e3a00003 	mov	r0, #3
 3d8:	ef000040 	svc	0x00000040
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f0:	e12fff1e 	bx	lr

000003f4 <lseek>:
 3f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 400:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 404:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 408:	e3a00016 	mov	r0, #22
 40c:	ef000040 	svc	0x00000040
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 41c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 420:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 424:	e12fff1e 	bx	lr

00000428 <pipe>:
 428:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 42c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 430:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 434:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 438:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 43c:	e3a00004 	mov	r0, #4
 440:	ef000040 	svc	0x00000040
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 450:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 454:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 458:	e12fff1e 	bx	lr

0000045c <read>:
 45c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 460:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 464:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 468:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 46c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 470:	e3a00005 	mov	r0, #5
 474:	ef000040 	svc	0x00000040
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 484:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 488:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 48c:	e12fff1e 	bx	lr

00000490 <write>:
 490:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 494:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 498:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 49c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a4:	e3a00010 	mov	r0, #16
 4a8:	ef000040 	svc	0x00000040
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c0:	e12fff1e 	bx	lr

000004c4 <close>:
 4c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d8:	e3a00015 	mov	r0, #21
 4dc:	ef000040 	svc	0x00000040
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f4:	e12fff1e 	bx	lr

000004f8 <kill>:
 4f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 500:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 504:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 508:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 50c:	e3a00006 	mov	r0, #6
 510:	ef000040 	svc	0x00000040
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 520:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 524:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 528:	e12fff1e 	bx	lr

0000052c <exec>:
 52c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 530:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 534:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 538:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 53c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 540:	e3a00007 	mov	r0, #7
 544:	ef000040 	svc	0x00000040
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 554:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 558:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 55c:	e12fff1e 	bx	lr

00000560 <open>:
 560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 564:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 568:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 56c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 570:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 574:	e3a0000f 	mov	r0, #15
 578:	ef000040 	svc	0x00000040
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 588:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 58c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 590:	e12fff1e 	bx	lr

00000594 <mknod>:
 594:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 598:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 59c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a8:	e3a00011 	mov	r0, #17
 5ac:	ef000040 	svc	0x00000040
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c4:	e12fff1e 	bx	lr

000005c8 <unlink>:
 5c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5dc:	e3a00012 	mov	r0, #18
 5e0:	ef000040 	svc	0x00000040
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f8:	e12fff1e 	bx	lr

000005fc <fstat>:
 5fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 600:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 604:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 608:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 60c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 610:	e3a00008 	mov	r0, #8
 614:	ef000040 	svc	0x00000040
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 624:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 628:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 62c:	e12fff1e 	bx	lr

00000630 <link>:
 630:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 634:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 638:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 63c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 640:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 644:	e3a00013 	mov	r0, #19
 648:	ef000040 	svc	0x00000040
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 658:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 65c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 660:	e12fff1e 	bx	lr

00000664 <mkdir>:
 664:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 668:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 66c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 670:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 674:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 678:	e3a00014 	mov	r0, #20
 67c:	ef000040 	svc	0x00000040
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 68c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 694:	e12fff1e 	bx	lr

00000698 <chdir>:
 698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 69c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ac:	e3a00009 	mov	r0, #9
 6b0:	ef000040 	svc	0x00000040
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c8:	e12fff1e 	bx	lr

000006cc <dup>:
 6cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e0:	e3a0000a 	mov	r0, #10
 6e4:	ef000040 	svc	0x00000040
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6fc:	e12fff1e 	bx	lr

00000700 <getpid>:
 700:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 704:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 708:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 70c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 710:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 714:	e3a0000b 	mov	r0, #11
 718:	ef000040 	svc	0x00000040
 71c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 728:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 72c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 730:	e12fff1e 	bx	lr

00000734 <sbrk>:
 734:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 738:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 73c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 740:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 744:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 748:	e3a0000c 	mov	r0, #12
 74c:	ef000040 	svc	0x00000040
 750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 75c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 760:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 764:	e12fff1e 	bx	lr

00000768 <sleep>:
 768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 76c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 770:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 774:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 778:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 77c:	e3a0000d 	mov	r0, #13
 780:	ef000040 	svc	0x00000040
 784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 790:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 794:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 798:	e12fff1e 	bx	lr

0000079c <uptime>:
 79c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b0:	e3a0000e 	mov	r0, #14
 7b4:	ef000040 	svc	0x00000040
 7b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7cc:	e12fff1e 	bx	lr

000007d0 <printint>:
 7d0:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 7d4:	e1a09fa1 	lsr	r9, r1, #31
 7d8:	e3530000 	cmp	r3, #0
 7dc:	03a09000 	moveq	r9, #0
 7e0:	12099001 	andne	r9, r9, #1
 7e4:	e28db01c 	add	fp, sp, #28
 7e8:	e3590000 	cmp	r9, #0
 7ec:	e3008c60 	movw	r8, #3168	; 0xc60
 7f0:	1261e000 	rsbne	lr, r1, #0
 7f4:	e3408000 	movt	r8, #0
 7f8:	e24b602d 	sub	r6, fp, #45	; 0x2d
 7fc:	e1a04000 	mov	r4, r0
 800:	13a09001 	movne	r9, #1
 804:	01a0e001 	moveq	lr, r1
 808:	e3a07000 	mov	r7, #0
 80c:	e3a05001 	mov	r5, #1
 810:	e24dd018 	sub	sp, sp, #24
 814:	e3a0c000 	mov	ip, #0
 818:	e3a0301f 	mov	r3, #31
 81c:	e1a0100c 	mov	r1, ip
 820:	e1a0033e 	lsr	r0, lr, r3
 824:	e2000001 	and	r0, r0, #1
 828:	e1801081 	orr	r1, r0, r1, lsl #1
 82c:	e1520001 	cmp	r2, r1
 830:	90411002 	subls	r1, r1, r2
 834:	918cc315 	orrls	ip, ip, r5, lsl r3
 838:	e2533001 	subs	r3, r3, #1
 83c:	2afffff7 	bcs	820 <printint+0x50>
 840:	e061e29c 	mls	r1, ip, r2, lr
 844:	e35c0000 	cmp	ip, #0
 848:	e1a0e00c 	mov	lr, ip
 84c:	e2873001 	add	r3, r7, #1
 850:	e7d81001 	ldrb	r1, [r8, r1]
 854:	e5e61001 	strb	r1, [r6, #1]!
 858:	11a07003 	movne	r7, r3
 85c:	1affffec 	bne	814 <printint+0x44>
 860:	e3590000 	cmp	r9, #0
 864:	124b201c 	subne	r2, fp, #28
 868:	10822003 	addne	r2, r2, r3
 86c:	13a0102d 	movne	r1, #45	; 0x2d
 870:	12873002 	addne	r3, r7, #2
 874:	15421010 	strbne	r1, [r2, #-16]
 878:	e24b202c 	sub	r2, fp, #44	; 0x2c
 87c:	e2435001 	sub	r5, r3, #1
 880:	e0826003 	add	r6, r2, r3
 884:	e5763001 	ldrb	r3, [r6, #-1]!
 888:	e2455001 	sub	r5, r5, #1
 88c:	e3a02001 	mov	r2, #1
 890:	e24b102d 	sub	r1, fp, #45	; 0x2d
 894:	e1a00004 	mov	r0, r4
 898:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 89c:	ebfffefb 	bl	490 <write>
 8a0:	e3750001 	cmn	r5, #1
 8a4:	1afffff6 	bne	884 <printint+0xb4>
 8a8:	e24bd01c 	sub	sp, fp, #28
 8ac:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000008b0 <div>:
 8b0:	e92d4810 	push	{r4, fp, lr}
 8b4:	e3a02000 	mov	r2, #0
 8b8:	e28db008 	add	fp, sp, #8
 8bc:	e1a0e000 	mov	lr, r0
 8c0:	e3a0301f 	mov	r3, #31
 8c4:	e1a00002 	mov	r0, r2
 8c8:	e3a04001 	mov	r4, #1
 8cc:	e1a0c33e 	lsr	ip, lr, r3
 8d0:	e20cc001 	and	ip, ip, #1
 8d4:	e18c2082 	orr	r2, ip, r2, lsl #1
 8d8:	e1520001 	cmp	r2, r1
 8dc:	20422001 	subcs	r2, r2, r1
 8e0:	21800314 	orrcs	r0, r0, r4, lsl r3
 8e4:	e2533001 	subs	r3, r3, #1
 8e8:	2afffff7 	bcs	8cc <div+0x1c>
 8ec:	e8bd8810 	pop	{r4, fp, pc}

000008f0 <printf>:
 8f0:	e92d000e 	push	{r1, r2, r3}
 8f4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8f8:	e28db018 	add	fp, sp, #24
 8fc:	e24dd008 	sub	sp, sp, #8
 900:	e59b6004 	ldr	r6, [fp, #4]
 904:	e5d64000 	ldrb	r4, [r6]
 908:	e3540000 	cmp	r4, #0
 90c:	0a00002b 	beq	9c0 <printf+0xd0>
 910:	e1a07000 	mov	r7, r0
 914:	e28b8008 	add	r8, fp, #8
 918:	e3a05000 	mov	r5, #0
 91c:	ea00000a 	b	94c <printf+0x5c>
 920:	e3540025 	cmp	r4, #37	; 0x25
 924:	01a05004 	moveq	r5, r4
 928:	0a000004 	beq	940 <printf+0x50>
 92c:	e24b1018 	sub	r1, fp, #24
 930:	e3a02001 	mov	r2, #1
 934:	e1a00007 	mov	r0, r7
 938:	e5614006 	strb	r4, [r1, #-6]!
 93c:	ebfffed3 	bl	490 <write>
 940:	e5f64001 	ldrb	r4, [r6, #1]!
 944:	e3540000 	cmp	r4, #0
 948:	0a00001c 	beq	9c0 <printf+0xd0>
 94c:	e3550000 	cmp	r5, #0
 950:	0afffff2 	beq	920 <printf+0x30>
 954:	e3550025 	cmp	r5, #37	; 0x25
 958:	1afffff8 	bne	940 <printf+0x50>
 95c:	e3540064 	cmp	r4, #100	; 0x64
 960:	0a000037 	beq	a44 <printf+0x154>
 964:	e20430f7 	and	r3, r4, #247	; 0xf7
 968:	e3530070 	cmp	r3, #112	; 0x70
 96c:	0a000017 	beq	9d0 <printf+0xe0>
 970:	e3540073 	cmp	r4, #115	; 0x73
 974:	0a00001c 	beq	9ec <printf+0xfc>
 978:	e3540063 	cmp	r4, #99	; 0x63
 97c:	0a000037 	beq	a60 <printf+0x170>
 980:	e3540025 	cmp	r4, #37	; 0x25
 984:	0a000027 	beq	a28 <printf+0x138>
 988:	e3a02001 	mov	r2, #1
 98c:	e24b1019 	sub	r1, fp, #25
 990:	e1a00007 	mov	r0, r7
 994:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 998:	ebfffebc 	bl	490 <write>
 99c:	e3a02001 	mov	r2, #1
 9a0:	e24b101a 	sub	r1, fp, #26
 9a4:	e1a00007 	mov	r0, r7
 9a8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9ac:	ebfffeb7 	bl	490 <write>
 9b0:	e5f64001 	ldrb	r4, [r6, #1]!
 9b4:	e3a05000 	mov	r5, #0
 9b8:	e3540000 	cmp	r4, #0
 9bc:	1affffe2 	bne	94c <printf+0x5c>
 9c0:	e24bd018 	sub	sp, fp, #24
 9c4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9c8:	e28dd00c 	add	sp, sp, #12
 9cc:	e12fff1e 	bx	lr
 9d0:	e3a03000 	mov	r3, #0
 9d4:	e3a02010 	mov	r2, #16
 9d8:	e4981004 	ldr	r1, [r8], #4
 9dc:	e1a00007 	mov	r0, r7
 9e0:	ebffff7a 	bl	7d0 <printint>
 9e4:	e3a05000 	mov	r5, #0
 9e8:	eaffffd4 	b	940 <printf+0x50>
 9ec:	e4984004 	ldr	r4, [r8], #4
 9f0:	e3540000 	cmp	r4, #0
 9f4:	0a000021 	beq	a80 <printf+0x190>
 9f8:	e5d45000 	ldrb	r5, [r4]
 9fc:	e3550000 	cmp	r5, #0
 a00:	0affffce 	beq	940 <printf+0x50>
 a04:	e3a02001 	mov	r2, #1
 a08:	e24b101d 	sub	r1, fp, #29
 a0c:	e1a00007 	mov	r0, r7
 a10:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a14:	ebfffe9d 	bl	490 <write>
 a18:	e5f45001 	ldrb	r5, [r4, #1]!
 a1c:	e3550000 	cmp	r5, #0
 a20:	1afffff7 	bne	a04 <printf+0x114>
 a24:	eaffffc5 	b	940 <printf+0x50>
 a28:	e24b1018 	sub	r1, fp, #24
 a2c:	e3a02001 	mov	r2, #1
 a30:	e1a00007 	mov	r0, r7
 a34:	e5615003 	strb	r5, [r1, #-3]!
 a38:	e3a05000 	mov	r5, #0
 a3c:	ebfffe93 	bl	490 <write>
 a40:	eaffffbe 	b	940 <printf+0x50>
 a44:	e3a03001 	mov	r3, #1
 a48:	e3a0200a 	mov	r2, #10
 a4c:	e4981004 	ldr	r1, [r8], #4
 a50:	e1a00007 	mov	r0, r7
 a54:	ebffff5d 	bl	7d0 <printint>
 a58:	e3a05000 	mov	r5, #0
 a5c:	eaffffb7 	b	940 <printf+0x50>
 a60:	e4983004 	ldr	r3, [r8], #4
 a64:	e24b1018 	sub	r1, fp, #24
 a68:	e3a02001 	mov	r2, #1
 a6c:	e1a00007 	mov	r0, r7
 a70:	e3a05000 	mov	r5, #0
 a74:	e5613004 	strb	r3, [r1, #-4]!
 a78:	ebfffe84 	bl	490 <write>
 a7c:	eaffffaf 	b	940 <printf+0x50>
 a80:	e3004c74 	movw	r4, #3188	; 0xc74
 a84:	e3a05028 	mov	r5, #40	; 0x28
 a88:	e3404000 	movt	r4, #0
 a8c:	eaffffdc 	b	a04 <printf+0x114>

00000a90 <free>:
 a90:	e300cc84 	movw	ip, #3204	; 0xc84
 a94:	e340c000 	movt	ip, #0
 a98:	e92d4810 	push	{r4, fp, lr}
 a9c:	e2401008 	sub	r1, r0, #8
 aa0:	e28db008 	add	fp, sp, #8
 aa4:	e59c3000 	ldr	r3, [ip]
 aa8:	ea000004 	b	ac0 <free+0x30>
 aac:	e1510002 	cmp	r1, r2
 ab0:	3a000009 	bcc	adc <free+0x4c>
 ab4:	e1530002 	cmp	r3, r2
 ab8:	2a000007 	bcs	adc <free+0x4c>
 abc:	e1a03002 	mov	r3, r2
 ac0:	e1530001 	cmp	r3, r1
 ac4:	e5932000 	ldr	r2, [r3]
 ac8:	3afffff7 	bcc	aac <free+0x1c>
 acc:	e1530002 	cmp	r3, r2
 ad0:	3afffff9 	bcc	abc <free+0x2c>
 ad4:	e1510002 	cmp	r1, r2
 ad8:	2afffff7 	bcs	abc <free+0x2c>
 adc:	e510e004 	ldr	lr, [r0, #-4]
 ae0:	e58c3000 	str	r3, [ip]
 ae4:	e081418e 	add	r4, r1, lr, lsl #3
 ae8:	e1520004 	cmp	r2, r4
 aec:	05922004 	ldreq	r2, [r2, #4]
 af0:	0082e00e 	addeq	lr, r2, lr
 af4:	0500e004 	streq	lr, [r0, #-4]
 af8:	05932000 	ldreq	r2, [r3]
 afc:	05922000 	ldreq	r2, [r2]
 b00:	e5002008 	str	r2, [r0, #-8]
 b04:	e5932004 	ldr	r2, [r3, #4]
 b08:	e083e182 	add	lr, r3, r2, lsl #3
 b0c:	e151000e 	cmp	r1, lr
 b10:	15831000 	strne	r1, [r3]
 b14:	05101004 	ldreq	r1, [r0, #-4]
 b18:	00812002 	addeq	r2, r1, r2
 b1c:	05832004 	streq	r2, [r3, #4]
 b20:	05102008 	ldreq	r2, [r0, #-8]
 b24:	05832000 	streq	r2, [r3]
 b28:	e8bd8810 	pop	{r4, fp, pc}

00000b2c <malloc>:
 b2c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 b30:	e3007c84 	movw	r7, #3204	; 0xc84
 b34:	e3407000 	movt	r7, #0
 b38:	e2804007 	add	r4, r0, #7
 b3c:	e28db014 	add	fp, sp, #20
 b40:	e5973000 	ldr	r3, [r7]
 b44:	e1a041a4 	lsr	r4, r4, #3
 b48:	e2844001 	add	r4, r4, #1
 b4c:	e3530000 	cmp	r3, #0
 b50:	0a000027 	beq	bf4 <malloc+0xc8>
 b54:	e5930000 	ldr	r0, [r3]
 b58:	e5902004 	ldr	r2, [r0, #4]
 b5c:	e1540002 	cmp	r4, r2
 b60:	9a000019 	bls	bcc <malloc+0xa0>
 b64:	e3540a01 	cmp	r4, #4096	; 0x1000
 b68:	21a05004 	movcs	r5, r4
 b6c:	33a05a01 	movcc	r5, #4096	; 0x1000
 b70:	e1a06185 	lsl	r6, r5, #3
 b74:	ea000003 	b	b88 <malloc+0x5c>
 b78:	e5930000 	ldr	r0, [r3]
 b7c:	e5902004 	ldr	r2, [r0, #4]
 b80:	e1540002 	cmp	r4, r2
 b84:	9a000010 	bls	bcc <malloc+0xa0>
 b88:	e5972000 	ldr	r2, [r7]
 b8c:	e1a03000 	mov	r3, r0
 b90:	e1520000 	cmp	r2, r0
 b94:	1afffff7 	bne	b78 <malloc+0x4c>
 b98:	e1a00006 	mov	r0, r6
 b9c:	ebfffee4 	bl	734 <sbrk>
 ba0:	e1a03000 	mov	r3, r0
 ba4:	e3730001 	cmn	r3, #1
 ba8:	e2800008 	add	r0, r0, #8
 bac:	0a000004 	beq	bc4 <malloc+0x98>
 bb0:	e5835004 	str	r5, [r3, #4]
 bb4:	ebffffb5 	bl	a90 <free>
 bb8:	e5973000 	ldr	r3, [r7]
 bbc:	e3530000 	cmp	r3, #0
 bc0:	1affffec 	bne	b78 <malloc+0x4c>
 bc4:	e3a00000 	mov	r0, #0
 bc8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 bcc:	e1540002 	cmp	r4, r2
 bd0:	e5873000 	str	r3, [r7]
 bd4:	10422004 	subne	r2, r2, r4
 bd8:	15802004 	strne	r2, [r0, #4]
 bdc:	05902000 	ldreq	r2, [r0]
 be0:	10800182 	addne	r0, r0, r2, lsl #3
 be4:	e2800008 	add	r0, r0, #8
 be8:	15004004 	strne	r4, [r0, #-4]
 bec:	05832000 	streq	r2, [r3]
 bf0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 bf4:	e2870004 	add	r0, r7, #4
 bf8:	e5873008 	str	r3, [r7, #8]
 bfc:	e5870000 	str	r0, [r7]
 c00:	e5870004 	str	r0, [r7, #4]
 c04:	eaffffd6 	b	b64 <malloc+0x38>
