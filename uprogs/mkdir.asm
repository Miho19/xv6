
_mkdir:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
  14:	c3a05001 	movgt	r5, #1
  18:	da00000f 	ble	5c <main+0x5c>
  1c:	e1a06004 	mov	r6, r4
  20:	e2844004 	add	r4, r4, #4
  24:	e5960000 	ldr	r0, [r6]
  28:	eb00016e 	bl	5e8 <mkdir>
  2c:	e3500000 	cmp	r0, #0
  30:	ba000003 	blt	44 <main+0x44>
  34:	e2855001 	add	r5, r5, #1
  38:	e1570005 	cmp	r7, r5
  3c:	1afffff6 	bne	1c <main+0x1c>
  40:	eb0000b2 	bl	310 <exit>
  44:	e5962000 	ldr	r2, [r6]
  48:	e3001ba4 	movw	r1, #2980	; 0xba4
  4c:	e3a00002 	mov	r0, #2
  50:	e3401000 	movt	r1, #0
  54:	eb000206 	bl	874 <printf>
  58:	eafffff8 	b	40 <main+0x40>
  5c:	e3001b8c 	movw	r1, #2956	; 0xb8c
  60:	e3a00002 	mov	r0, #2
  64:	e3401000 	movt	r1, #0
  68:	eb000201 	bl	874 <printf>
  6c:	eb0000a7 	bl	310 <exit>

00000070 <strcpy>:
  70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  74:	e2402001 	sub	r2, r0, #1
  78:	e28db000 	add	fp, sp, #0
  7c:	e4d13001 	ldrb	r3, [r1], #1
  80:	e3530000 	cmp	r3, #0
  84:	e5e23001 	strb	r3, [r2, #1]!
  88:	1afffffb 	bne	7c <strcpy+0xc>
  8c:	e28bd000 	add	sp, fp, #0
  90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  94:	e12fff1e 	bx	lr

00000098 <strcmp>:
  98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  9c:	e28db000 	add	fp, sp, #0
  a0:	e5d03000 	ldrb	r3, [r0]
  a4:	e5d12000 	ldrb	r2, [r1]
  a8:	e3530000 	cmp	r3, #0
  ac:	1a000004 	bne	c4 <strcmp+0x2c>
  b0:	ea000005 	b	cc <strcmp+0x34>
  b4:	e5f03001 	ldrb	r3, [r0, #1]!
  b8:	e3530000 	cmp	r3, #0
  bc:	0a000006 	beq	dc <strcmp+0x44>
  c0:	e5f12001 	ldrb	r2, [r1, #1]!
  c4:	e1530002 	cmp	r3, r2
  c8:	0afffff9 	beq	b4 <strcmp+0x1c>
  cc:	e0430002 	sub	r0, r3, r2
  d0:	e28bd000 	add	sp, fp, #0
  d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d8:	e12fff1e 	bx	lr
  dc:	e5d12001 	ldrb	r2, [r1, #1]
  e0:	e0430002 	sub	r0, r3, r2
  e4:	e28bd000 	add	sp, fp, #0
  e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ec:	e12fff1e 	bx	lr

000000f0 <strlen>:
  f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f4:	e28db000 	add	fp, sp, #0
  f8:	e5d03000 	ldrb	r3, [r0]
  fc:	e3530000 	cmp	r3, #0
 100:	0a000009 	beq	12c <strlen+0x3c>
 104:	e1a02000 	mov	r2, r0
 108:	e3a03000 	mov	r3, #0
 10c:	e5f21001 	ldrb	r1, [r2, #1]!
 110:	e2833001 	add	r3, r3, #1
 114:	e3510000 	cmp	r1, #0
 118:	e1a00003 	mov	r0, r3
 11c:	1afffffa 	bne	10c <strlen+0x1c>
 120:	e28bd000 	add	sp, fp, #0
 124:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 128:	e12fff1e 	bx	lr
 12c:	e1a00003 	mov	r0, r3
 130:	eafffffa 	b	120 <strlen+0x30>

00000134 <memset>:
 134:	e3520000 	cmp	r2, #0
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
 140:	0a000004 	beq	158 <memset+0x24>
 144:	e6ef1071 	uxtb	r1, r1
 148:	e0802002 	add	r2, r0, r2
 14c:	e4c01001 	strb	r1, [r0], #1
 150:	e1520000 	cmp	r2, r0
 154:	1afffffc 	bne	14c <memset+0x18>
 158:	e28bd000 	add	sp, fp, #0
 15c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 160:	e12fff1e 	bx	lr

00000164 <strchr>:
 164:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 168:	e28db000 	add	fp, sp, #0
 16c:	e5d02000 	ldrb	r2, [r0]
 170:	e3520000 	cmp	r2, #0
 174:	0a00000b 	beq	1a8 <strchr+0x44>
 178:	e1510002 	cmp	r1, r2
 17c:	1a000002 	bne	18c <strchr+0x28>
 180:	ea000005 	b	19c <strchr+0x38>
 184:	e1530001 	cmp	r3, r1
 188:	0a000003 	beq	19c <strchr+0x38>
 18c:	e5f03001 	ldrb	r3, [r0, #1]!
 190:	e3530000 	cmp	r3, #0
 194:	1afffffa 	bne	184 <strchr+0x20>
 198:	e1a00003 	mov	r0, r3
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr
 1a8:	e1a00002 	mov	r0, r2
 1ac:	eafffffa 	b	19c <strchr+0x38>

000001b0 <gets>:
 1b0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1b4:	e1a08000 	mov	r8, r0
 1b8:	e28db018 	add	fp, sp, #24
 1bc:	e1a07001 	mov	r7, r1
 1c0:	e24dd00c 	sub	sp, sp, #12
 1c4:	e2406001 	sub	r6, r0, #1
 1c8:	e3a05000 	mov	r5, #0
 1cc:	ea000008 	b	1f4 <gets+0x44>
 1d0:	eb000082 	bl	3e0 <read>
 1d4:	e3500000 	cmp	r0, #0
 1d8:	da00000b 	ble	20c <gets+0x5c>
 1dc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1e0:	e1a05004 	mov	r5, r4
 1e4:	e353000d 	cmp	r3, #13
 1e8:	1353000a 	cmpne	r3, #10
 1ec:	e5e63001 	strb	r3, [r6, #1]!
 1f0:	0a000005 	beq	20c <gets+0x5c>
 1f4:	e3a02001 	mov	r2, #1
 1f8:	e0854002 	add	r4, r5, r2
 1fc:	e1540007 	cmp	r4, r7
 200:	e24b101d 	sub	r1, fp, #29
 204:	e3a00000 	mov	r0, #0
 208:	bafffff0 	blt	1d0 <gets+0x20>
 20c:	e3a03000 	mov	r3, #0
 210:	e1a00008 	mov	r0, r8
 214:	e7c83005 	strb	r3, [r8, r5]
 218:	e24bd018 	sub	sp, fp, #24
 21c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000220 <stat>:
 220:	e92d4830 	push	{r4, r5, fp, lr}
 224:	e1a04001 	mov	r4, r1
 228:	e28db00c 	add	fp, sp, #12
 22c:	e3a01000 	mov	r1, #0
 230:	eb0000ab 	bl	4e4 <open>
 234:	e2505000 	subs	r5, r0, #0
 238:	ba000006 	blt	258 <stat+0x38>
 23c:	e1a01004 	mov	r1, r4
 240:	eb0000ce 	bl	580 <fstat>
 244:	e1a04000 	mov	r4, r0
 248:	e1a00005 	mov	r0, r5
 24c:	eb00007d 	bl	448 <close>
 250:	e1a00004 	mov	r0, r4
 254:	e8bd8830 	pop	{r4, r5, fp, pc}
 258:	e3e04000 	mvn	r4, #0
 25c:	eafffffb 	b	250 <stat+0x30>

00000260 <atoi>:
 260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 264:	e28db000 	add	fp, sp, #0
 268:	e5d02000 	ldrb	r2, [r0]
 26c:	e2423030 	sub	r3, r2, #48	; 0x30
 270:	e3530009 	cmp	r3, #9
 274:	e3a03000 	mov	r3, #0
 278:	8a000006 	bhi	298 <atoi+0x38>
 27c:	e3a0c00a 	mov	ip, #10
 280:	e023239c 	mla	r3, ip, r3, r2
 284:	e5f02001 	ldrb	r2, [r0, #1]!
 288:	e2421030 	sub	r1, r2, #48	; 0x30
 28c:	e3510009 	cmp	r1, #9
 290:	e2433030 	sub	r3, r3, #48	; 0x30
 294:	9afffff9 	bls	280 <atoi+0x20>
 298:	e1a00003 	mov	r0, r3
 29c:	e28bd000 	add	sp, fp, #0
 2a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a4:	e12fff1e 	bx	lr

000002a8 <memmove>:
 2a8:	e3520000 	cmp	r2, #0
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e28db000 	add	fp, sp, #0
 2b4:	da000005 	ble	2d0 <memmove+0x28>
 2b8:	e0812002 	add	r2, r1, r2
 2bc:	e2403001 	sub	r3, r0, #1
 2c0:	e4d1c001 	ldrb	ip, [r1], #1
 2c4:	e1510002 	cmp	r1, r2
 2c8:	e5e3c001 	strb	ip, [r3, #1]!
 2cc:	1afffffb 	bne	2c0 <memmove+0x18>
 2d0:	e28bd000 	add	sp, fp, #0
 2d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d8:	e12fff1e 	bx	lr

000002dc <fork>:
 2dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f0:	e3a00001 	mov	r0, #1
 2f4:	ef000040 	svc	0x00000040
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 300:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 304:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 308:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 30c:	e12fff1e 	bx	lr

00000310 <exit>:
 310:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 314:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 318:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 31c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 320:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 324:	e3a00002 	mov	r0, #2
 328:	ef000040 	svc	0x00000040
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 334:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 338:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 33c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <wait>:
 344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 348:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 34c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 350:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 354:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 358:	e3a00003 	mov	r0, #3
 35c:	ef000040 	svc	0x00000040
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 368:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 36c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 370:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <lseek>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00016 	mov	r0, #22
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <pipe>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00004 	mov	r0, #4
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <read>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00005 	mov	r0, #5
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <write>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00010 	mov	r0, #16
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <close>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00015 	mov	r0, #21
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <kill>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00006 	mov	r0, #6
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <exec>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00007 	mov	r0, #7
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <open>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a0000f 	mov	r0, #15
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <mknod>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00011 	mov	r0, #17
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <unlink>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00012 	mov	r0, #18
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <fstat>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00008 	mov	r0, #8
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <link>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00013 	mov	r0, #19
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <mkdir>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00014 	mov	r0, #20
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <chdir>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00009 	mov	r0, #9
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <dup>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a0000a 	mov	r0, #10
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <getpid>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a0000b 	mov	r0, #11
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <sbrk>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000c 	mov	r0, #12
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <sleep>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000d 	mov	r0, #13
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <uptime>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000e 	mov	r0, #14
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <printint>:
 754:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 758:	e1a09fa1 	lsr	r9, r1, #31
 75c:	e3530000 	cmp	r3, #0
 760:	03a09000 	moveq	r9, #0
 764:	12099001 	andne	r9, r9, #1
 768:	e28db01c 	add	fp, sp, #28
 76c:	e3590000 	cmp	r9, #0
 770:	e3008bc0 	movw	r8, #3008	; 0xbc0
 774:	1261e000 	rsbne	lr, r1, #0
 778:	e3408000 	movt	r8, #0
 77c:	e24b602d 	sub	r6, fp, #45	; 0x2d
 780:	e1a04000 	mov	r4, r0
 784:	13a09001 	movne	r9, #1
 788:	01a0e001 	moveq	lr, r1
 78c:	e3a07000 	mov	r7, #0
 790:	e3a05001 	mov	r5, #1
 794:	e24dd018 	sub	sp, sp, #24
 798:	e3a0c000 	mov	ip, #0
 79c:	e3a0301f 	mov	r3, #31
 7a0:	e1a0100c 	mov	r1, ip
 7a4:	e1a0033e 	lsr	r0, lr, r3
 7a8:	e2000001 	and	r0, r0, #1
 7ac:	e1801081 	orr	r1, r0, r1, lsl #1
 7b0:	e1520001 	cmp	r2, r1
 7b4:	90411002 	subls	r1, r1, r2
 7b8:	918cc315 	orrls	ip, ip, r5, lsl r3
 7bc:	e2533001 	subs	r3, r3, #1
 7c0:	2afffff7 	bcs	7a4 <printint+0x50>
 7c4:	e061e29c 	mls	r1, ip, r2, lr
 7c8:	e35c0000 	cmp	ip, #0
 7cc:	e1a0e00c 	mov	lr, ip
 7d0:	e2873001 	add	r3, r7, #1
 7d4:	e7d81001 	ldrb	r1, [r8, r1]
 7d8:	e5e61001 	strb	r1, [r6, #1]!
 7dc:	11a07003 	movne	r7, r3
 7e0:	1affffec 	bne	798 <printint+0x44>
 7e4:	e3590000 	cmp	r9, #0
 7e8:	124b201c 	subne	r2, fp, #28
 7ec:	10822003 	addne	r2, r2, r3
 7f0:	13a0102d 	movne	r1, #45	; 0x2d
 7f4:	12873002 	addne	r3, r7, #2
 7f8:	15421010 	strbne	r1, [r2, #-16]
 7fc:	e24b202c 	sub	r2, fp, #44	; 0x2c
 800:	e2435001 	sub	r5, r3, #1
 804:	e0826003 	add	r6, r2, r3
 808:	e5763001 	ldrb	r3, [r6, #-1]!
 80c:	e2455001 	sub	r5, r5, #1
 810:	e3a02001 	mov	r2, #1
 814:	e24b102d 	sub	r1, fp, #45	; 0x2d
 818:	e1a00004 	mov	r0, r4
 81c:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 820:	ebfffefb 	bl	414 <write>
 824:	e3750001 	cmn	r5, #1
 828:	1afffff6 	bne	808 <printint+0xb4>
 82c:	e24bd01c 	sub	sp, fp, #28
 830:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000834 <div>:
 834:	e92d4810 	push	{r4, fp, lr}
 838:	e3a02000 	mov	r2, #0
 83c:	e28db008 	add	fp, sp, #8
 840:	e1a0e000 	mov	lr, r0
 844:	e3a0301f 	mov	r3, #31
 848:	e1a00002 	mov	r0, r2
 84c:	e3a04001 	mov	r4, #1
 850:	e1a0c33e 	lsr	ip, lr, r3
 854:	e20cc001 	and	ip, ip, #1
 858:	e18c2082 	orr	r2, ip, r2, lsl #1
 85c:	e1520001 	cmp	r2, r1
 860:	20422001 	subcs	r2, r2, r1
 864:	21800314 	orrcs	r0, r0, r4, lsl r3
 868:	e2533001 	subs	r3, r3, #1
 86c:	2afffff7 	bcs	850 <div+0x1c>
 870:	e8bd8810 	pop	{r4, fp, pc}

00000874 <printf>:
 874:	e92d000e 	push	{r1, r2, r3}
 878:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 87c:	e28db018 	add	fp, sp, #24
 880:	e24dd008 	sub	sp, sp, #8
 884:	e59b6004 	ldr	r6, [fp, #4]
 888:	e5d64000 	ldrb	r4, [r6]
 88c:	e3540000 	cmp	r4, #0
 890:	0a00002b 	beq	944 <printf+0xd0>
 894:	e1a07000 	mov	r7, r0
 898:	e28b8008 	add	r8, fp, #8
 89c:	e3a05000 	mov	r5, #0
 8a0:	ea00000a 	b	8d0 <printf+0x5c>
 8a4:	e3540025 	cmp	r4, #37	; 0x25
 8a8:	01a05004 	moveq	r5, r4
 8ac:	0a000004 	beq	8c4 <printf+0x50>
 8b0:	e24b1018 	sub	r1, fp, #24
 8b4:	e3a02001 	mov	r2, #1
 8b8:	e1a00007 	mov	r0, r7
 8bc:	e5614006 	strb	r4, [r1, #-6]!
 8c0:	ebfffed3 	bl	414 <write>
 8c4:	e5f64001 	ldrb	r4, [r6, #1]!
 8c8:	e3540000 	cmp	r4, #0
 8cc:	0a00001c 	beq	944 <printf+0xd0>
 8d0:	e3550000 	cmp	r5, #0
 8d4:	0afffff2 	beq	8a4 <printf+0x30>
 8d8:	e3550025 	cmp	r5, #37	; 0x25
 8dc:	1afffff8 	bne	8c4 <printf+0x50>
 8e0:	e3540064 	cmp	r4, #100	; 0x64
 8e4:	0a000037 	beq	9c8 <printf+0x154>
 8e8:	e20430f7 	and	r3, r4, #247	; 0xf7
 8ec:	e3530070 	cmp	r3, #112	; 0x70
 8f0:	0a000017 	beq	954 <printf+0xe0>
 8f4:	e3540073 	cmp	r4, #115	; 0x73
 8f8:	0a00001c 	beq	970 <printf+0xfc>
 8fc:	e3540063 	cmp	r4, #99	; 0x63
 900:	0a000037 	beq	9e4 <printf+0x170>
 904:	e3540025 	cmp	r4, #37	; 0x25
 908:	0a000027 	beq	9ac <printf+0x138>
 90c:	e3a02001 	mov	r2, #1
 910:	e24b1019 	sub	r1, fp, #25
 914:	e1a00007 	mov	r0, r7
 918:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 91c:	ebfffebc 	bl	414 <write>
 920:	e3a02001 	mov	r2, #1
 924:	e24b101a 	sub	r1, fp, #26
 928:	e1a00007 	mov	r0, r7
 92c:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 930:	ebfffeb7 	bl	414 <write>
 934:	e5f64001 	ldrb	r4, [r6, #1]!
 938:	e3a05000 	mov	r5, #0
 93c:	e3540000 	cmp	r4, #0
 940:	1affffe2 	bne	8d0 <printf+0x5c>
 944:	e24bd018 	sub	sp, fp, #24
 948:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 94c:	e28dd00c 	add	sp, sp, #12
 950:	e12fff1e 	bx	lr
 954:	e3a03000 	mov	r3, #0
 958:	e3a02010 	mov	r2, #16
 95c:	e4981004 	ldr	r1, [r8], #4
 960:	e1a00007 	mov	r0, r7
 964:	ebffff7a 	bl	754 <printint>
 968:	e3a05000 	mov	r5, #0
 96c:	eaffffd4 	b	8c4 <printf+0x50>
 970:	e4984004 	ldr	r4, [r8], #4
 974:	e3540000 	cmp	r4, #0
 978:	0a000021 	beq	a04 <printf+0x190>
 97c:	e5d45000 	ldrb	r5, [r4]
 980:	e3550000 	cmp	r5, #0
 984:	0affffce 	beq	8c4 <printf+0x50>
 988:	e3a02001 	mov	r2, #1
 98c:	e24b101d 	sub	r1, fp, #29
 990:	e1a00007 	mov	r0, r7
 994:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 998:	ebfffe9d 	bl	414 <write>
 99c:	e5f45001 	ldrb	r5, [r4, #1]!
 9a0:	e3550000 	cmp	r5, #0
 9a4:	1afffff7 	bne	988 <printf+0x114>
 9a8:	eaffffc5 	b	8c4 <printf+0x50>
 9ac:	e24b1018 	sub	r1, fp, #24
 9b0:	e3a02001 	mov	r2, #1
 9b4:	e1a00007 	mov	r0, r7
 9b8:	e5615003 	strb	r5, [r1, #-3]!
 9bc:	e3a05000 	mov	r5, #0
 9c0:	ebfffe93 	bl	414 <write>
 9c4:	eaffffbe 	b	8c4 <printf+0x50>
 9c8:	e3a03001 	mov	r3, #1
 9cc:	e3a0200a 	mov	r2, #10
 9d0:	e4981004 	ldr	r1, [r8], #4
 9d4:	e1a00007 	mov	r0, r7
 9d8:	ebffff5d 	bl	754 <printint>
 9dc:	e3a05000 	mov	r5, #0
 9e0:	eaffffb7 	b	8c4 <printf+0x50>
 9e4:	e4983004 	ldr	r3, [r8], #4
 9e8:	e24b1018 	sub	r1, fp, #24
 9ec:	e3a02001 	mov	r2, #1
 9f0:	e1a00007 	mov	r0, r7
 9f4:	e3a05000 	mov	r5, #0
 9f8:	e5613004 	strb	r3, [r1, #-4]!
 9fc:	ebfffe84 	bl	414 <write>
 a00:	eaffffaf 	b	8c4 <printf+0x50>
 a04:	e3004bd4 	movw	r4, #3028	; 0xbd4
 a08:	e3a05028 	mov	r5, #40	; 0x28
 a0c:	e3404000 	movt	r4, #0
 a10:	eaffffdc 	b	988 <printf+0x114>

00000a14 <free>:
 a14:	e300cbdc 	movw	ip, #3036	; 0xbdc
 a18:	e340c000 	movt	ip, #0
 a1c:	e92d4810 	push	{r4, fp, lr}
 a20:	e2401008 	sub	r1, r0, #8
 a24:	e28db008 	add	fp, sp, #8
 a28:	e59c3000 	ldr	r3, [ip]
 a2c:	ea000004 	b	a44 <free+0x30>
 a30:	e1510002 	cmp	r1, r2
 a34:	3a000009 	bcc	a60 <free+0x4c>
 a38:	e1530002 	cmp	r3, r2
 a3c:	2a000007 	bcs	a60 <free+0x4c>
 a40:	e1a03002 	mov	r3, r2
 a44:	e1530001 	cmp	r3, r1
 a48:	e5932000 	ldr	r2, [r3]
 a4c:	3afffff7 	bcc	a30 <free+0x1c>
 a50:	e1530002 	cmp	r3, r2
 a54:	3afffff9 	bcc	a40 <free+0x2c>
 a58:	e1510002 	cmp	r1, r2
 a5c:	2afffff7 	bcs	a40 <free+0x2c>
 a60:	e510e004 	ldr	lr, [r0, #-4]
 a64:	e58c3000 	str	r3, [ip]
 a68:	e081418e 	add	r4, r1, lr, lsl #3
 a6c:	e1520004 	cmp	r2, r4
 a70:	05922004 	ldreq	r2, [r2, #4]
 a74:	0082e00e 	addeq	lr, r2, lr
 a78:	0500e004 	streq	lr, [r0, #-4]
 a7c:	05932000 	ldreq	r2, [r3]
 a80:	05922000 	ldreq	r2, [r2]
 a84:	e5002008 	str	r2, [r0, #-8]
 a88:	e5932004 	ldr	r2, [r3, #4]
 a8c:	e083e182 	add	lr, r3, r2, lsl #3
 a90:	e151000e 	cmp	r1, lr
 a94:	15831000 	strne	r1, [r3]
 a98:	05101004 	ldreq	r1, [r0, #-4]
 a9c:	00812002 	addeq	r2, r1, r2
 aa0:	05832004 	streq	r2, [r3, #4]
 aa4:	05102008 	ldreq	r2, [r0, #-8]
 aa8:	05832000 	streq	r2, [r3]
 aac:	e8bd8810 	pop	{r4, fp, pc}

00000ab0 <malloc>:
 ab0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 ab4:	e3007bdc 	movw	r7, #3036	; 0xbdc
 ab8:	e3407000 	movt	r7, #0
 abc:	e2804007 	add	r4, r0, #7
 ac0:	e28db014 	add	fp, sp, #20
 ac4:	e5973000 	ldr	r3, [r7]
 ac8:	e1a041a4 	lsr	r4, r4, #3
 acc:	e2844001 	add	r4, r4, #1
 ad0:	e3530000 	cmp	r3, #0
 ad4:	0a000027 	beq	b78 <malloc+0xc8>
 ad8:	e5930000 	ldr	r0, [r3]
 adc:	e5902004 	ldr	r2, [r0, #4]
 ae0:	e1540002 	cmp	r4, r2
 ae4:	9a000019 	bls	b50 <malloc+0xa0>
 ae8:	e3540a01 	cmp	r4, #4096	; 0x1000
 aec:	21a05004 	movcs	r5, r4
 af0:	33a05a01 	movcc	r5, #4096	; 0x1000
 af4:	e1a06185 	lsl	r6, r5, #3
 af8:	ea000003 	b	b0c <malloc+0x5c>
 afc:	e5930000 	ldr	r0, [r3]
 b00:	e5902004 	ldr	r2, [r0, #4]
 b04:	e1540002 	cmp	r4, r2
 b08:	9a000010 	bls	b50 <malloc+0xa0>
 b0c:	e5972000 	ldr	r2, [r7]
 b10:	e1a03000 	mov	r3, r0
 b14:	e1520000 	cmp	r2, r0
 b18:	1afffff7 	bne	afc <malloc+0x4c>
 b1c:	e1a00006 	mov	r0, r6
 b20:	ebfffee4 	bl	6b8 <sbrk>
 b24:	e1a03000 	mov	r3, r0
 b28:	e3730001 	cmn	r3, #1
 b2c:	e2800008 	add	r0, r0, #8
 b30:	0a000004 	beq	b48 <malloc+0x98>
 b34:	e5835004 	str	r5, [r3, #4]
 b38:	ebffffb5 	bl	a14 <free>
 b3c:	e5973000 	ldr	r3, [r7]
 b40:	e3530000 	cmp	r3, #0
 b44:	1affffec 	bne	afc <malloc+0x4c>
 b48:	e3a00000 	mov	r0, #0
 b4c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b50:	e1540002 	cmp	r4, r2
 b54:	e5873000 	str	r3, [r7]
 b58:	10422004 	subne	r2, r2, r4
 b5c:	15802004 	strne	r2, [r0, #4]
 b60:	05902000 	ldreq	r2, [r0]
 b64:	10800182 	addne	r0, r0, r2, lsl #3
 b68:	e2800008 	add	r0, r0, #8
 b6c:	15004004 	strne	r4, [r0, #-4]
 b70:	05832000 	streq	r2, [r3]
 b74:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b78:	e2870004 	add	r0, r7, #4
 b7c:	e5873008 	str	r3, [r7, #8]
 b80:	e5870000 	str	r0, [r7]
 b84:	e5870004 	str	r0, [r7, #4]
 b88:	eaffffd6 	b	ae8 <malloc+0x38>
