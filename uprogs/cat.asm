
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	c1a08000 	movgt	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  10:	c2814004 	addgt	r4, r1, #4
  14:	c3a05001 	movgt	r5, #1
  18:	da000013 	ble	6c <main+0x6c>
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb000138 	bl	50c <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000006 	blt	54 <main+0x54>
  38:	eb00000e 	bl	78 <cat>
  3c:	e2855001 	add	r5, r5, #1
  40:	e1a00007 	mov	r0, r7
  44:	eb000109 	bl	470 <close>
  48:	e1580005 	cmp	r8, r5
  4c:	1afffff2 	bne	1c <main+0x1c>
  50:	eb0000c5 	bl	36c <exit>
  54:	e5962000 	ldr	r2, [r6]
  58:	e3001bc8 	movw	r1, #3016	; 0xbc8
  5c:	e3a00001 	mov	r0, #1
  60:	e3401000 	movt	r1, #0
  64:	eb00020c 	bl	89c <printf>
  68:	eb0000bf 	bl	36c <exit>
  6c:	e3a00000 	mov	r0, #0
  70:	eb000000 	bl	78 <cat>
  74:	eb0000bc 	bl	36c <exit>

00000078 <cat>:
  78:	e92d4830 	push	{r4, r5, fp, lr}
  7c:	e3004c08 	movw	r4, #3080	; 0xc08
  80:	e28db00c 	add	fp, sp, #12
  84:	e1a05000 	mov	r5, r0
  88:	e3404000 	movt	r4, #0
  8c:	ea000002 	b	9c <cat+0x24>
  90:	e1a01004 	mov	r1, r4
  94:	e3a00001 	mov	r0, #1
  98:	eb0000e7 	bl	43c <write>
  9c:	e3a02c02 	mov	r2, #512	; 0x200
  a0:	e1a01004 	mov	r1, r4
  a4:	e1a00005 	mov	r0, r5
  a8:	eb0000d6 	bl	408 <read>
  ac:	e2502000 	subs	r2, r0, #0
  b0:	cafffff6 	bgt	90 <cat+0x18>
  b4:	08bd8830 	popeq	{r4, r5, fp, pc}
  b8:	e3001bb4 	movw	r1, #2996	; 0xbb4
  bc:	e3a00001 	mov	r0, #1
  c0:	e3401000 	movt	r1, #0
  c4:	eb0001f4 	bl	89c <printf>
  c8:	eb0000a7 	bl	36c <exit>

000000cc <strcpy>:
  cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d0:	e2402001 	sub	r2, r0, #1
  d4:	e28db000 	add	fp, sp, #0
  d8:	e4d13001 	ldrb	r3, [r1], #1
  dc:	e3530000 	cmp	r3, #0
  e0:	e5e23001 	strb	r3, [r2, #1]!
  e4:	1afffffb 	bne	d8 <strcpy+0xc>
  e8:	e28bd000 	add	sp, fp, #0
  ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f0:	e12fff1e 	bx	lr

000000f4 <strcmp>:
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  fc:	e5d03000 	ldrb	r3, [r0]
 100:	e5d12000 	ldrb	r2, [r1]
 104:	e3530000 	cmp	r3, #0
 108:	1a000004 	bne	120 <strcmp+0x2c>
 10c:	ea000005 	b	128 <strcmp+0x34>
 110:	e5f03001 	ldrb	r3, [r0, #1]!
 114:	e3530000 	cmp	r3, #0
 118:	0a000006 	beq	138 <strcmp+0x44>
 11c:	e5f12001 	ldrb	r2, [r1, #1]!
 120:	e1530002 	cmp	r3, r2
 124:	0afffff9 	beq	110 <strcmp+0x1c>
 128:	e0430002 	sub	r0, r3, r2
 12c:	e28bd000 	add	sp, fp, #0
 130:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 134:	e12fff1e 	bx	lr
 138:	e5d12001 	ldrb	r2, [r1, #1]
 13c:	e0430002 	sub	r0, r3, r2
 140:	e28bd000 	add	sp, fp, #0
 144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 148:	e12fff1e 	bx	lr

0000014c <strlen>:
 14c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 150:	e28db000 	add	fp, sp, #0
 154:	e5d03000 	ldrb	r3, [r0]
 158:	e3530000 	cmp	r3, #0
 15c:	0a000009 	beq	188 <strlen+0x3c>
 160:	e1a02000 	mov	r2, r0
 164:	e3a03000 	mov	r3, #0
 168:	e5f21001 	ldrb	r1, [r2, #1]!
 16c:	e2833001 	add	r3, r3, #1
 170:	e3510000 	cmp	r1, #0
 174:	e1a00003 	mov	r0, r3
 178:	1afffffa 	bne	168 <strlen+0x1c>
 17c:	e28bd000 	add	sp, fp, #0
 180:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 184:	e12fff1e 	bx	lr
 188:	e1a00003 	mov	r0, r3
 18c:	eafffffa 	b	17c <strlen+0x30>

00000190 <memset>:
 190:	e3520000 	cmp	r2, #0
 194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 198:	e28db000 	add	fp, sp, #0
 19c:	0a000004 	beq	1b4 <memset+0x24>
 1a0:	e6ef1071 	uxtb	r1, r1
 1a4:	e0802002 	add	r2, r0, r2
 1a8:	e4c01001 	strb	r1, [r0], #1
 1ac:	e1520000 	cmp	r2, r0
 1b0:	1afffffc 	bne	1a8 <memset+0x18>
 1b4:	e28bd000 	add	sp, fp, #0
 1b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1bc:	e12fff1e 	bx	lr

000001c0 <strchr>:
 1c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c4:	e28db000 	add	fp, sp, #0
 1c8:	e5d02000 	ldrb	r2, [r0]
 1cc:	e3520000 	cmp	r2, #0
 1d0:	0a00000b 	beq	204 <strchr+0x44>
 1d4:	e1510002 	cmp	r1, r2
 1d8:	1a000002 	bne	1e8 <strchr+0x28>
 1dc:	ea000005 	b	1f8 <strchr+0x38>
 1e0:	e1530001 	cmp	r3, r1
 1e4:	0a000003 	beq	1f8 <strchr+0x38>
 1e8:	e5f03001 	ldrb	r3, [r0, #1]!
 1ec:	e3530000 	cmp	r3, #0
 1f0:	1afffffa 	bne	1e0 <strchr+0x20>
 1f4:	e1a00003 	mov	r0, r3
 1f8:	e28bd000 	add	sp, fp, #0
 1fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 200:	e12fff1e 	bx	lr
 204:	e1a00002 	mov	r0, r2
 208:	eafffffa 	b	1f8 <strchr+0x38>

0000020c <gets>:
 20c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 210:	e1a08000 	mov	r8, r0
 214:	e28db018 	add	fp, sp, #24
 218:	e1a07001 	mov	r7, r1
 21c:	e24dd00c 	sub	sp, sp, #12
 220:	e2406001 	sub	r6, r0, #1
 224:	e3a05000 	mov	r5, #0
 228:	ea000008 	b	250 <gets+0x44>
 22c:	eb000075 	bl	408 <read>
 230:	e3500000 	cmp	r0, #0
 234:	da00000b 	ble	268 <gets+0x5c>
 238:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 23c:	e1a05004 	mov	r5, r4
 240:	e353000d 	cmp	r3, #13
 244:	1353000a 	cmpne	r3, #10
 248:	e5e63001 	strb	r3, [r6, #1]!
 24c:	0a000005 	beq	268 <gets+0x5c>
 250:	e3a02001 	mov	r2, #1
 254:	e0854002 	add	r4, r5, r2
 258:	e1540007 	cmp	r4, r7
 25c:	e24b101d 	sub	r1, fp, #29
 260:	e3a00000 	mov	r0, #0
 264:	bafffff0 	blt	22c <gets+0x20>
 268:	e3a03000 	mov	r3, #0
 26c:	e1a00008 	mov	r0, r8
 270:	e7c83005 	strb	r3, [r8, r5]
 274:	e24bd018 	sub	sp, fp, #24
 278:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000027c <stat>:
 27c:	e92d4830 	push	{r4, r5, fp, lr}
 280:	e1a04001 	mov	r4, r1
 284:	e28db00c 	add	fp, sp, #12
 288:	e3a01000 	mov	r1, #0
 28c:	eb00009e 	bl	50c <open>
 290:	e2505000 	subs	r5, r0, #0
 294:	ba000006 	blt	2b4 <stat+0x38>
 298:	e1a01004 	mov	r1, r4
 29c:	eb0000c1 	bl	5a8 <fstat>
 2a0:	e1a04000 	mov	r4, r0
 2a4:	e1a00005 	mov	r0, r5
 2a8:	eb000070 	bl	470 <close>
 2ac:	e1a00004 	mov	r0, r4
 2b0:	e8bd8830 	pop	{r4, r5, fp, pc}
 2b4:	e3e04000 	mvn	r4, #0
 2b8:	eafffffb 	b	2ac <stat+0x30>

000002bc <atoi>:
 2bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2c0:	e28db000 	add	fp, sp, #0
 2c4:	e5d02000 	ldrb	r2, [r0]
 2c8:	e2423030 	sub	r3, r2, #48	; 0x30
 2cc:	e3530009 	cmp	r3, #9
 2d0:	e3a03000 	mov	r3, #0
 2d4:	8a000006 	bhi	2f4 <atoi+0x38>
 2d8:	e3a0c00a 	mov	ip, #10
 2dc:	e023239c 	mla	r3, ip, r3, r2
 2e0:	e5f02001 	ldrb	r2, [r0, #1]!
 2e4:	e2421030 	sub	r1, r2, #48	; 0x30
 2e8:	e3510009 	cmp	r1, #9
 2ec:	e2433030 	sub	r3, r3, #48	; 0x30
 2f0:	9afffff9 	bls	2dc <atoi+0x20>
 2f4:	e1a00003 	mov	r0, r3
 2f8:	e28bd000 	add	sp, fp, #0
 2fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 300:	e12fff1e 	bx	lr

00000304 <memmove>:
 304:	e3520000 	cmp	r2, #0
 308:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 30c:	e28db000 	add	fp, sp, #0
 310:	da000005 	ble	32c <memmove+0x28>
 314:	e0812002 	add	r2, r1, r2
 318:	e2403001 	sub	r3, r0, #1
 31c:	e4d1c001 	ldrb	ip, [r1], #1
 320:	e1510002 	cmp	r1, r2
 324:	e5e3c001 	strb	ip, [r3, #1]!
 328:	1afffffb 	bne	31c <memmove+0x18>
 32c:	e28bd000 	add	sp, fp, #0
 330:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 334:	e12fff1e 	bx	lr

00000338 <fork>:
 338:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 33c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 340:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 344:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 348:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 34c:	e3a00001 	mov	r0, #1
 350:	ef000040 	svc	0x00000040
 354:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 358:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 35c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 360:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 364:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 368:	e12fff1e 	bx	lr

0000036c <exit>:
 36c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 370:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 374:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 378:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 37c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 380:	e3a00002 	mov	r0, #2
 384:	ef000040 	svc	0x00000040
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 394:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 398:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <wait>:
 3a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b4:	e3a00003 	mov	r0, #3
 3b8:	ef000040 	svc	0x00000040
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <pipe>:
 3d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e8:	e3a00004 	mov	r0, #4
 3ec:	ef000040 	svc	0x00000040
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 404:	e12fff1e 	bx	lr

00000408 <read>:
 408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 40c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 410:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 414:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 418:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 41c:	e3a00005 	mov	r0, #5
 420:	ef000040 	svc	0x00000040
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 430:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 438:	e12fff1e 	bx	lr

0000043c <write>:
 43c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 440:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 444:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 448:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 44c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 450:	e3a00010 	mov	r0, #16
 454:	ef000040 	svc	0x00000040
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 464:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 468:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 46c:	e12fff1e 	bx	lr

00000470 <close>:
 470:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 474:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 478:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 47c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 480:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 484:	e3a00015 	mov	r0, #21
 488:	ef000040 	svc	0x00000040
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 498:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a0:	e12fff1e 	bx	lr

000004a4 <kill>:
 4a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b8:	e3a00006 	mov	r0, #6
 4bc:	ef000040 	svc	0x00000040
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d4:	e12fff1e 	bx	lr

000004d8 <exec>:
 4d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ec:	e3a00007 	mov	r0, #7
 4f0:	ef000040 	svc	0x00000040
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 500:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 508:	e12fff1e 	bx	lr

0000050c <open>:
 50c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 51c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 520:	e3a0000f 	mov	r0, #15
 524:	ef000040 	svc	0x00000040
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 53c:	e12fff1e 	bx	lr

00000540 <mknod>:
 540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 54c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 554:	e3a00011 	mov	r0, #17
 558:	ef000040 	svc	0x00000040
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 570:	e12fff1e 	bx	lr

00000574 <unlink>:
 574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 57c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 588:	e3a00012 	mov	r0, #18
 58c:	ef000040 	svc	0x00000040
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 59c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a4:	e12fff1e 	bx	lr

000005a8 <fstat>:
 5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5bc:	e3a00008 	mov	r0, #8
 5c0:	ef000040 	svc	0x00000040
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d8:	e12fff1e 	bx	lr

000005dc <link>:
 5dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f0:	e3a00013 	mov	r0, #19
 5f4:	ef000040 	svc	0x00000040
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 60c:	e12fff1e 	bx	lr

00000610 <mkdir>:
 610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 61c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 624:	e3a00014 	mov	r0, #20
 628:	ef000040 	svc	0x00000040
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 63c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 640:	e12fff1e 	bx	lr

00000644 <chdir>:
 644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 64c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 658:	e3a00009 	mov	r0, #9
 65c:	ef000040 	svc	0x00000040
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 66c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 674:	e12fff1e 	bx	lr

00000678 <dup>:
 678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 67c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 68c:	e3a0000a 	mov	r0, #10
 690:	ef000040 	svc	0x00000040
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a8:	e12fff1e 	bx	lr

000006ac <getpid>:
 6ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c0:	e3a0000b 	mov	r0, #11
 6c4:	ef000040 	svc	0x00000040
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6dc:	e12fff1e 	bx	lr

000006e0 <sbrk>:
 6e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f4:	e3a0000c 	mov	r0, #12
 6f8:	ef000040 	svc	0x00000040
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 70c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 710:	e12fff1e 	bx	lr

00000714 <sleep>:
 714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 71c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 728:	e3a0000d 	mov	r0, #13
 72c:	ef000040 	svc	0x00000040
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 73c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 744:	e12fff1e 	bx	lr

00000748 <uptime>:
 748:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 74c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 750:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 754:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 758:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 75c:	e3a0000e 	mov	r0, #14
 760:	ef000040 	svc	0x00000040
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 770:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 774:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 778:	e12fff1e 	bx	lr

0000077c <printint>:
 77c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 780:	e1a09fa1 	lsr	r9, r1, #31
 784:	e3530000 	cmp	r3, #0
 788:	03a09000 	moveq	r9, #0
 78c:	12099001 	andne	r9, r9, #1
 790:	e28db01c 	add	fp, sp, #28
 794:	e3590000 	cmp	r9, #0
 798:	e3008be0 	movw	r8, #3040	; 0xbe0
 79c:	1261e000 	rsbne	lr, r1, #0
 7a0:	e3408000 	movt	r8, #0
 7a4:	e24b602d 	sub	r6, fp, #45	; 0x2d
 7a8:	e1a04000 	mov	r4, r0
 7ac:	13a09001 	movne	r9, #1
 7b0:	01a0e001 	moveq	lr, r1
 7b4:	e3a07000 	mov	r7, #0
 7b8:	e3a05001 	mov	r5, #1
 7bc:	e24dd018 	sub	sp, sp, #24
 7c0:	e3a0c000 	mov	ip, #0
 7c4:	e3a0301f 	mov	r3, #31
 7c8:	e1a0100c 	mov	r1, ip
 7cc:	e1a0033e 	lsr	r0, lr, r3
 7d0:	e2000001 	and	r0, r0, #1
 7d4:	e1801081 	orr	r1, r0, r1, lsl #1
 7d8:	e1520001 	cmp	r2, r1
 7dc:	90411002 	subls	r1, r1, r2
 7e0:	918cc315 	orrls	ip, ip, r5, lsl r3
 7e4:	e2533001 	subs	r3, r3, #1
 7e8:	2afffff7 	bcs	7cc <printint+0x50>
 7ec:	e061e29c 	mls	r1, ip, r2, lr
 7f0:	e35c0000 	cmp	ip, #0
 7f4:	e1a0e00c 	mov	lr, ip
 7f8:	e2873001 	add	r3, r7, #1
 7fc:	e7d81001 	ldrb	r1, [r8, r1]
 800:	e5e61001 	strb	r1, [r6, #1]!
 804:	11a07003 	movne	r7, r3
 808:	1affffec 	bne	7c0 <printint+0x44>
 80c:	e3590000 	cmp	r9, #0
 810:	124b201c 	subne	r2, fp, #28
 814:	10822003 	addne	r2, r2, r3
 818:	13a0102d 	movne	r1, #45	; 0x2d
 81c:	12873002 	addne	r3, r7, #2
 820:	15421010 	strbne	r1, [r2, #-16]
 824:	e24b202c 	sub	r2, fp, #44	; 0x2c
 828:	e2435001 	sub	r5, r3, #1
 82c:	e0826003 	add	r6, r2, r3
 830:	e5763001 	ldrb	r3, [r6, #-1]!
 834:	e2455001 	sub	r5, r5, #1
 838:	e3a02001 	mov	r2, #1
 83c:	e24b102d 	sub	r1, fp, #45	; 0x2d
 840:	e1a00004 	mov	r0, r4
 844:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 848:	ebfffefb 	bl	43c <write>
 84c:	e3750001 	cmn	r5, #1
 850:	1afffff6 	bne	830 <printint+0xb4>
 854:	e24bd01c 	sub	sp, fp, #28
 858:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000085c <div>:
 85c:	e92d4810 	push	{r4, fp, lr}
 860:	e3a02000 	mov	r2, #0
 864:	e28db008 	add	fp, sp, #8
 868:	e1a0e000 	mov	lr, r0
 86c:	e3a0301f 	mov	r3, #31
 870:	e1a00002 	mov	r0, r2
 874:	e3a04001 	mov	r4, #1
 878:	e1a0c33e 	lsr	ip, lr, r3
 87c:	e20cc001 	and	ip, ip, #1
 880:	e18c2082 	orr	r2, ip, r2, lsl #1
 884:	e1520001 	cmp	r2, r1
 888:	20422001 	subcs	r2, r2, r1
 88c:	21800314 	orrcs	r0, r0, r4, lsl r3
 890:	e2533001 	subs	r3, r3, #1
 894:	2afffff7 	bcs	878 <div+0x1c>
 898:	e8bd8810 	pop	{r4, fp, pc}

0000089c <printf>:
 89c:	e92d000e 	push	{r1, r2, r3}
 8a0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8a4:	e28db018 	add	fp, sp, #24
 8a8:	e24dd008 	sub	sp, sp, #8
 8ac:	e59b6004 	ldr	r6, [fp, #4]
 8b0:	e5d64000 	ldrb	r4, [r6]
 8b4:	e3540000 	cmp	r4, #0
 8b8:	0a00002b 	beq	96c <printf+0xd0>
 8bc:	e1a07000 	mov	r7, r0
 8c0:	e28b8008 	add	r8, fp, #8
 8c4:	e3a05000 	mov	r5, #0
 8c8:	ea00000a 	b	8f8 <printf+0x5c>
 8cc:	e3540025 	cmp	r4, #37	; 0x25
 8d0:	01a05004 	moveq	r5, r4
 8d4:	0a000004 	beq	8ec <printf+0x50>
 8d8:	e24b1018 	sub	r1, fp, #24
 8dc:	e3a02001 	mov	r2, #1
 8e0:	e1a00007 	mov	r0, r7
 8e4:	e5614006 	strb	r4, [r1, #-6]!
 8e8:	ebfffed3 	bl	43c <write>
 8ec:	e5f64001 	ldrb	r4, [r6, #1]!
 8f0:	e3540000 	cmp	r4, #0
 8f4:	0a00001c 	beq	96c <printf+0xd0>
 8f8:	e3550000 	cmp	r5, #0
 8fc:	0afffff2 	beq	8cc <printf+0x30>
 900:	e3550025 	cmp	r5, #37	; 0x25
 904:	1afffff8 	bne	8ec <printf+0x50>
 908:	e3540064 	cmp	r4, #100	; 0x64
 90c:	0a000037 	beq	9f0 <printf+0x154>
 910:	e20430f7 	and	r3, r4, #247	; 0xf7
 914:	e3530070 	cmp	r3, #112	; 0x70
 918:	0a000017 	beq	97c <printf+0xe0>
 91c:	e3540073 	cmp	r4, #115	; 0x73
 920:	0a00001c 	beq	998 <printf+0xfc>
 924:	e3540063 	cmp	r4, #99	; 0x63
 928:	0a000037 	beq	a0c <printf+0x170>
 92c:	e3540025 	cmp	r4, #37	; 0x25
 930:	0a000027 	beq	9d4 <printf+0x138>
 934:	e3a02001 	mov	r2, #1
 938:	e24b1019 	sub	r1, fp, #25
 93c:	e1a00007 	mov	r0, r7
 940:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 944:	ebfffebc 	bl	43c <write>
 948:	e3a02001 	mov	r2, #1
 94c:	e24b101a 	sub	r1, fp, #26
 950:	e1a00007 	mov	r0, r7
 954:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 958:	ebfffeb7 	bl	43c <write>
 95c:	e5f64001 	ldrb	r4, [r6, #1]!
 960:	e3a05000 	mov	r5, #0
 964:	e3540000 	cmp	r4, #0
 968:	1affffe2 	bne	8f8 <printf+0x5c>
 96c:	e24bd018 	sub	sp, fp, #24
 970:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 974:	e28dd00c 	add	sp, sp, #12
 978:	e12fff1e 	bx	lr
 97c:	e3a03000 	mov	r3, #0
 980:	e3a02010 	mov	r2, #16
 984:	e4981004 	ldr	r1, [r8], #4
 988:	e1a00007 	mov	r0, r7
 98c:	ebffff7a 	bl	77c <printint>
 990:	e3a05000 	mov	r5, #0
 994:	eaffffd4 	b	8ec <printf+0x50>
 998:	e4984004 	ldr	r4, [r8], #4
 99c:	e3540000 	cmp	r4, #0
 9a0:	0a000021 	beq	a2c <printf+0x190>
 9a4:	e5d45000 	ldrb	r5, [r4]
 9a8:	e3550000 	cmp	r5, #0
 9ac:	0affffce 	beq	8ec <printf+0x50>
 9b0:	e3a02001 	mov	r2, #1
 9b4:	e24b101d 	sub	r1, fp, #29
 9b8:	e1a00007 	mov	r0, r7
 9bc:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 9c0:	ebfffe9d 	bl	43c <write>
 9c4:	e5f45001 	ldrb	r5, [r4, #1]!
 9c8:	e3550000 	cmp	r5, #0
 9cc:	1afffff7 	bne	9b0 <printf+0x114>
 9d0:	eaffffc5 	b	8ec <printf+0x50>
 9d4:	e24b1018 	sub	r1, fp, #24
 9d8:	e3a02001 	mov	r2, #1
 9dc:	e1a00007 	mov	r0, r7
 9e0:	e5615003 	strb	r5, [r1, #-3]!
 9e4:	e3a05000 	mov	r5, #0
 9e8:	ebfffe93 	bl	43c <write>
 9ec:	eaffffbe 	b	8ec <printf+0x50>
 9f0:	e3a03001 	mov	r3, #1
 9f4:	e3a0200a 	mov	r2, #10
 9f8:	e4981004 	ldr	r1, [r8], #4
 9fc:	e1a00007 	mov	r0, r7
 a00:	ebffff5d 	bl	77c <printint>
 a04:	e3a05000 	mov	r5, #0
 a08:	eaffffb7 	b	8ec <printf+0x50>
 a0c:	e4983004 	ldr	r3, [r8], #4
 a10:	e24b1018 	sub	r1, fp, #24
 a14:	e3a02001 	mov	r2, #1
 a18:	e1a00007 	mov	r0, r7
 a1c:	e3a05000 	mov	r5, #0
 a20:	e5613004 	strb	r3, [r1, #-4]!
 a24:	ebfffe84 	bl	43c <write>
 a28:	eaffffaf 	b	8ec <printf+0x50>
 a2c:	e3004bf4 	movw	r4, #3060	; 0xbf4
 a30:	e3a05028 	mov	r5, #40	; 0x28
 a34:	e3404000 	movt	r4, #0
 a38:	eaffffdc 	b	9b0 <printf+0x114>

00000a3c <free>:
 a3c:	e300cbfc 	movw	ip, #3068	; 0xbfc
 a40:	e340c000 	movt	ip, #0
 a44:	e92d4810 	push	{r4, fp, lr}
 a48:	e2401008 	sub	r1, r0, #8
 a4c:	e28db008 	add	fp, sp, #8
 a50:	e59c3000 	ldr	r3, [ip]
 a54:	ea000004 	b	a6c <free+0x30>
 a58:	e1510002 	cmp	r1, r2
 a5c:	3a000009 	bcc	a88 <free+0x4c>
 a60:	e1530002 	cmp	r3, r2
 a64:	2a000007 	bcs	a88 <free+0x4c>
 a68:	e1a03002 	mov	r3, r2
 a6c:	e1530001 	cmp	r3, r1
 a70:	e5932000 	ldr	r2, [r3]
 a74:	3afffff7 	bcc	a58 <free+0x1c>
 a78:	e1530002 	cmp	r3, r2
 a7c:	3afffff9 	bcc	a68 <free+0x2c>
 a80:	e1510002 	cmp	r1, r2
 a84:	2afffff7 	bcs	a68 <free+0x2c>
 a88:	e510e004 	ldr	lr, [r0, #-4]
 a8c:	e58c3000 	str	r3, [ip]
 a90:	e081418e 	add	r4, r1, lr, lsl #3
 a94:	e1520004 	cmp	r2, r4
 a98:	05922004 	ldreq	r2, [r2, #4]
 a9c:	0082e00e 	addeq	lr, r2, lr
 aa0:	0500e004 	streq	lr, [r0, #-4]
 aa4:	05932000 	ldreq	r2, [r3]
 aa8:	05922000 	ldreq	r2, [r2]
 aac:	e5002008 	str	r2, [r0, #-8]
 ab0:	e5932004 	ldr	r2, [r3, #4]
 ab4:	e083e182 	add	lr, r3, r2, lsl #3
 ab8:	e151000e 	cmp	r1, lr
 abc:	15831000 	strne	r1, [r3]
 ac0:	05101004 	ldreq	r1, [r0, #-4]
 ac4:	00812002 	addeq	r2, r1, r2
 ac8:	05832004 	streq	r2, [r3, #4]
 acc:	05102008 	ldreq	r2, [r0, #-8]
 ad0:	05832000 	streq	r2, [r3]
 ad4:	e8bd8810 	pop	{r4, fp, pc}

00000ad8 <malloc>:
 ad8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 adc:	e3007bfc 	movw	r7, #3068	; 0xbfc
 ae0:	e3407000 	movt	r7, #0
 ae4:	e2804007 	add	r4, r0, #7
 ae8:	e28db014 	add	fp, sp, #20
 aec:	e5973000 	ldr	r3, [r7]
 af0:	e1a041a4 	lsr	r4, r4, #3
 af4:	e2844001 	add	r4, r4, #1
 af8:	e3530000 	cmp	r3, #0
 afc:	0a000027 	beq	ba0 <malloc+0xc8>
 b00:	e5930000 	ldr	r0, [r3]
 b04:	e5902004 	ldr	r2, [r0, #4]
 b08:	e1540002 	cmp	r4, r2
 b0c:	9a000019 	bls	b78 <malloc+0xa0>
 b10:	e3540a01 	cmp	r4, #4096	; 0x1000
 b14:	21a05004 	movcs	r5, r4
 b18:	33a05a01 	movcc	r5, #4096	; 0x1000
 b1c:	e1a06185 	lsl	r6, r5, #3
 b20:	ea000003 	b	b34 <malloc+0x5c>
 b24:	e5930000 	ldr	r0, [r3]
 b28:	e5902004 	ldr	r2, [r0, #4]
 b2c:	e1540002 	cmp	r4, r2
 b30:	9a000010 	bls	b78 <malloc+0xa0>
 b34:	e5972000 	ldr	r2, [r7]
 b38:	e1a03000 	mov	r3, r0
 b3c:	e1520000 	cmp	r2, r0
 b40:	1afffff7 	bne	b24 <malloc+0x4c>
 b44:	e1a00006 	mov	r0, r6
 b48:	ebfffee4 	bl	6e0 <sbrk>
 b4c:	e1a03000 	mov	r3, r0
 b50:	e3730001 	cmn	r3, #1
 b54:	e2800008 	add	r0, r0, #8
 b58:	0a000004 	beq	b70 <malloc+0x98>
 b5c:	e5835004 	str	r5, [r3, #4]
 b60:	ebffffb5 	bl	a3c <free>
 b64:	e5973000 	ldr	r3, [r7]
 b68:	e3530000 	cmp	r3, #0
 b6c:	1affffec 	bne	b24 <malloc+0x4c>
 b70:	e3a00000 	mov	r0, #0
 b74:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b78:	e1540002 	cmp	r4, r2
 b7c:	e5873000 	str	r3, [r7]
 b80:	10422004 	subne	r2, r2, r4
 b84:	15802004 	strne	r2, [r0, #4]
 b88:	05902000 	ldreq	r2, [r0]
 b8c:	10800182 	addne	r0, r0, r2, lsl #3
 b90:	e2800008 	add	r0, r0, #8
 b94:	15004004 	strne	r4, [r0, #-4]
 b98:	05832000 	streq	r2, [r3]
 b9c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 ba0:	e2870004 	add	r0, r7, #4
 ba4:	e5873008 	str	r3, [r7, #8]
 ba8:	e5870000 	str	r0, [r7]
 bac:	e5870004 	str	r0, [r7, #4]
 bb0:	eaffffd6 	b	b10 <malloc+0x38>
