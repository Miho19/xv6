
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500003 	cmp	r0, #3
   4:	e92d4800 	push	{fp, lr}
   8:	e28db004 	add	fp, sp, #4
   c:	0a000004 	beq	24 <main+0x24>
  10:	e3001b74 	movw	r1, #2932	; 0xb74
  14:	e3a00002 	mov	r0, #2
  18:	e3401000 	movt	r1, #0
  1c:	eb00020e 	bl	85c <printf>
  20:	eb0000b4 	bl	2f8 <exit>
  24:	e1a04001 	mov	r4, r1
  28:	e9910003 	ldmib	r1, {r0, r1}
  2c:	eb00015a 	bl	59c <link>
  30:	e3500000 	cmp	r0, #0
  34:	ba000000 	blt	3c <main+0x3c>
  38:	eb0000ae 	bl	2f8 <exit>
  3c:	e3001b88 	movw	r1, #2952	; 0xb88
  40:	e5943008 	ldr	r3, [r4, #8]
  44:	e3401000 	movt	r1, #0
  48:	e5942004 	ldr	r2, [r4, #4]
  4c:	e3a00002 	mov	r0, #2
  50:	eb000201 	bl	85c <printf>
  54:	eafffff7 	b	38 <main+0x38>

00000058 <strcpy>:
  58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  5c:	e2402001 	sub	r2, r0, #1
  60:	e28db000 	add	fp, sp, #0
  64:	e4d13001 	ldrb	r3, [r1], #1
  68:	e3530000 	cmp	r3, #0
  6c:	e5e23001 	strb	r3, [r2, #1]!
  70:	1afffffb 	bne	64 <strcpy+0xc>
  74:	e28bd000 	add	sp, fp, #0
  78:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  7c:	e12fff1e 	bx	lr

00000080 <strcmp>:
  80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  84:	e28db000 	add	fp, sp, #0
  88:	e5d03000 	ldrb	r3, [r0]
  8c:	e5d12000 	ldrb	r2, [r1]
  90:	e3530000 	cmp	r3, #0
  94:	1a000004 	bne	ac <strcmp+0x2c>
  98:	ea000005 	b	b4 <strcmp+0x34>
  9c:	e5f03001 	ldrb	r3, [r0, #1]!
  a0:	e3530000 	cmp	r3, #0
  a4:	0a000006 	beq	c4 <strcmp+0x44>
  a8:	e5f12001 	ldrb	r2, [r1, #1]!
  ac:	e1530002 	cmp	r3, r2
  b0:	0afffff9 	beq	9c <strcmp+0x1c>
  b4:	e0430002 	sub	r0, r3, r2
  b8:	e28bd000 	add	sp, fp, #0
  bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c0:	e12fff1e 	bx	lr
  c4:	e5d12001 	ldrb	r2, [r1, #1]
  c8:	e0430002 	sub	r0, r3, r2
  cc:	e28bd000 	add	sp, fp, #0
  d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d4:	e12fff1e 	bx	lr

000000d8 <strlen>:
  d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  dc:	e28db000 	add	fp, sp, #0
  e0:	e5d03000 	ldrb	r3, [r0]
  e4:	e3530000 	cmp	r3, #0
  e8:	0a000009 	beq	114 <strlen+0x3c>
  ec:	e1a02000 	mov	r2, r0
  f0:	e3a03000 	mov	r3, #0
  f4:	e5f21001 	ldrb	r1, [r2, #1]!
  f8:	e2833001 	add	r3, r3, #1
  fc:	e3510000 	cmp	r1, #0
 100:	e1a00003 	mov	r0, r3
 104:	1afffffa 	bne	f4 <strlen+0x1c>
 108:	e28bd000 	add	sp, fp, #0
 10c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 110:	e12fff1e 	bx	lr
 114:	e1a00003 	mov	r0, r3
 118:	eafffffa 	b	108 <strlen+0x30>

0000011c <memset>:
 11c:	e3520000 	cmp	r2, #0
 120:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 124:	e28db000 	add	fp, sp, #0
 128:	0a000004 	beq	140 <memset+0x24>
 12c:	e6ef1071 	uxtb	r1, r1
 130:	e0802002 	add	r2, r0, r2
 134:	e4c01001 	strb	r1, [r0], #1
 138:	e1520000 	cmp	r2, r0
 13c:	1afffffc 	bne	134 <memset+0x18>
 140:	e28bd000 	add	sp, fp, #0
 144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 148:	e12fff1e 	bx	lr

0000014c <strchr>:
 14c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 150:	e28db000 	add	fp, sp, #0
 154:	e5d02000 	ldrb	r2, [r0]
 158:	e3520000 	cmp	r2, #0
 15c:	0a00000b 	beq	190 <strchr+0x44>
 160:	e1510002 	cmp	r1, r2
 164:	1a000002 	bne	174 <strchr+0x28>
 168:	ea000005 	b	184 <strchr+0x38>
 16c:	e1530001 	cmp	r3, r1
 170:	0a000003 	beq	184 <strchr+0x38>
 174:	e5f03001 	ldrb	r3, [r0, #1]!
 178:	e3530000 	cmp	r3, #0
 17c:	1afffffa 	bne	16c <strchr+0x20>
 180:	e1a00003 	mov	r0, r3
 184:	e28bd000 	add	sp, fp, #0
 188:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 18c:	e12fff1e 	bx	lr
 190:	e1a00002 	mov	r0, r2
 194:	eafffffa 	b	184 <strchr+0x38>

00000198 <gets>:
 198:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 19c:	e1a08000 	mov	r8, r0
 1a0:	e28db018 	add	fp, sp, #24
 1a4:	e1a07001 	mov	r7, r1
 1a8:	e24dd00c 	sub	sp, sp, #12
 1ac:	e2406001 	sub	r6, r0, #1
 1b0:	e3a05000 	mov	r5, #0
 1b4:	ea000008 	b	1dc <gets+0x44>
 1b8:	eb000082 	bl	3c8 <read>
 1bc:	e3500000 	cmp	r0, #0
 1c0:	da00000b 	ble	1f4 <gets+0x5c>
 1c4:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1c8:	e1a05004 	mov	r5, r4
 1cc:	e353000d 	cmp	r3, #13
 1d0:	1353000a 	cmpne	r3, #10
 1d4:	e5e63001 	strb	r3, [r6, #1]!
 1d8:	0a000005 	beq	1f4 <gets+0x5c>
 1dc:	e3a02001 	mov	r2, #1
 1e0:	e0854002 	add	r4, r5, r2
 1e4:	e1540007 	cmp	r4, r7
 1e8:	e24b101d 	sub	r1, fp, #29
 1ec:	e3a00000 	mov	r0, #0
 1f0:	bafffff0 	blt	1b8 <gets+0x20>
 1f4:	e3a03000 	mov	r3, #0
 1f8:	e1a00008 	mov	r0, r8
 1fc:	e7c83005 	strb	r3, [r8, r5]
 200:	e24bd018 	sub	sp, fp, #24
 204:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000208 <stat>:
 208:	e92d4830 	push	{r4, r5, fp, lr}
 20c:	e1a04001 	mov	r4, r1
 210:	e28db00c 	add	fp, sp, #12
 214:	e3a01000 	mov	r1, #0
 218:	eb0000ab 	bl	4cc <open>
 21c:	e2505000 	subs	r5, r0, #0
 220:	ba000006 	blt	240 <stat+0x38>
 224:	e1a01004 	mov	r1, r4
 228:	eb0000ce 	bl	568 <fstat>
 22c:	e1a04000 	mov	r4, r0
 230:	e1a00005 	mov	r0, r5
 234:	eb00007d 	bl	430 <close>
 238:	e1a00004 	mov	r0, r4
 23c:	e8bd8830 	pop	{r4, r5, fp, pc}
 240:	e3e04000 	mvn	r4, #0
 244:	eafffffb 	b	238 <stat+0x30>

00000248 <atoi>:
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
 250:	e5d02000 	ldrb	r2, [r0]
 254:	e2423030 	sub	r3, r2, #48	; 0x30
 258:	e3530009 	cmp	r3, #9
 25c:	e3a03000 	mov	r3, #0
 260:	8a000006 	bhi	280 <atoi+0x38>
 264:	e3a0c00a 	mov	ip, #10
 268:	e023239c 	mla	r3, ip, r3, r2
 26c:	e5f02001 	ldrb	r2, [r0, #1]!
 270:	e2421030 	sub	r1, r2, #48	; 0x30
 274:	e3510009 	cmp	r1, #9
 278:	e2433030 	sub	r3, r3, #48	; 0x30
 27c:	9afffff9 	bls	268 <atoi+0x20>
 280:	e1a00003 	mov	r0, r3
 284:	e28bd000 	add	sp, fp, #0
 288:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 28c:	e12fff1e 	bx	lr

00000290 <memmove>:
 290:	e3520000 	cmp	r2, #0
 294:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 298:	e28db000 	add	fp, sp, #0
 29c:	da000005 	ble	2b8 <memmove+0x28>
 2a0:	e0812002 	add	r2, r1, r2
 2a4:	e2403001 	sub	r3, r0, #1
 2a8:	e4d1c001 	ldrb	ip, [r1], #1
 2ac:	e1510002 	cmp	r1, r2
 2b0:	e5e3c001 	strb	ip, [r3, #1]!
 2b4:	1afffffb 	bne	2a8 <memmove+0x18>
 2b8:	e28bd000 	add	sp, fp, #0
 2bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c0:	e12fff1e 	bx	lr

000002c4 <fork>:
 2c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2d8:	e3a00001 	mov	r0, #1
 2dc:	ef000040 	svc	0x00000040
 2e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2f4:	e12fff1e 	bx	lr

000002f8 <exit>:
 2f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 300:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 304:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 308:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 30c:	e3a00002 	mov	r0, #2
 310:	ef000040 	svc	0x00000040
 314:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 318:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 31c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 320:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 324:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 328:	e12fff1e 	bx	lr

0000032c <wait>:
 32c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 330:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 334:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 338:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 33c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 340:	e3a00003 	mov	r0, #3
 344:	ef000040 	svc	0x00000040
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 350:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 354:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 358:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <lseek>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00016 	mov	r0, #22
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <pipe>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00004 	mov	r0, #4
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <read>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00005 	mov	r0, #5
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <write>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00010 	mov	r0, #16
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <close>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00015 	mov	r0, #21
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <kill>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00006 	mov	r0, #6
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <exec>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00007 	mov	r0, #7
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <open>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a0000f 	mov	r0, #15
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <mknod>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00011 	mov	r0, #17
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <unlink>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00012 	mov	r0, #18
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <fstat>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00008 	mov	r0, #8
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <link>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00013 	mov	r0, #19
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <mkdir>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00014 	mov	r0, #20
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <chdir>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00009 	mov	r0, #9
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <dup>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a0000a 	mov	r0, #10
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <getpid>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a0000b 	mov	r0, #11
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <sbrk>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a0000c 	mov	r0, #12
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <sleep>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a0000d 	mov	r0, #13
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <uptime>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a0000e 	mov	r0, #14
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <printint>:
 73c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 740:	e1a09fa1 	lsr	r9, r1, #31
 744:	e3530000 	cmp	r3, #0
 748:	03a09000 	moveq	r9, #0
 74c:	12099001 	andne	r9, r9, #1
 750:	e28db01c 	add	fp, sp, #28
 754:	e3590000 	cmp	r9, #0
 758:	e3008b9c 	movw	r8, #2972	; 0xb9c
 75c:	1261e000 	rsbne	lr, r1, #0
 760:	e3408000 	movt	r8, #0
 764:	e24b602d 	sub	r6, fp, #45	; 0x2d
 768:	e1a04000 	mov	r4, r0
 76c:	13a09001 	movne	r9, #1
 770:	01a0e001 	moveq	lr, r1
 774:	e3a07000 	mov	r7, #0
 778:	e3a05001 	mov	r5, #1
 77c:	e24dd018 	sub	sp, sp, #24
 780:	e3a0c000 	mov	ip, #0
 784:	e3a0301f 	mov	r3, #31
 788:	e1a0100c 	mov	r1, ip
 78c:	e1a0033e 	lsr	r0, lr, r3
 790:	e2000001 	and	r0, r0, #1
 794:	e1801081 	orr	r1, r0, r1, lsl #1
 798:	e1520001 	cmp	r2, r1
 79c:	90411002 	subls	r1, r1, r2
 7a0:	918cc315 	orrls	ip, ip, r5, lsl r3
 7a4:	e2533001 	subs	r3, r3, #1
 7a8:	2afffff7 	bcs	78c <printint+0x50>
 7ac:	e061e29c 	mls	r1, ip, r2, lr
 7b0:	e35c0000 	cmp	ip, #0
 7b4:	e1a0e00c 	mov	lr, ip
 7b8:	e2873001 	add	r3, r7, #1
 7bc:	e7d81001 	ldrb	r1, [r8, r1]
 7c0:	e5e61001 	strb	r1, [r6, #1]!
 7c4:	11a07003 	movne	r7, r3
 7c8:	1affffec 	bne	780 <printint+0x44>
 7cc:	e3590000 	cmp	r9, #0
 7d0:	124b201c 	subne	r2, fp, #28
 7d4:	10822003 	addne	r2, r2, r3
 7d8:	13a0102d 	movne	r1, #45	; 0x2d
 7dc:	12873002 	addne	r3, r7, #2
 7e0:	15421010 	strbne	r1, [r2, #-16]
 7e4:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7e8:	e2435001 	sub	r5, r3, #1
 7ec:	e0826003 	add	r6, r2, r3
 7f0:	e5763001 	ldrb	r3, [r6, #-1]!
 7f4:	e2455001 	sub	r5, r5, #1
 7f8:	e3a02001 	mov	r2, #1
 7fc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 800:	e1a00004 	mov	r0, r4
 804:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 808:	ebfffefb 	bl	3fc <write>
 80c:	e3750001 	cmn	r5, #1
 810:	1afffff6 	bne	7f0 <printint+0xb4>
 814:	e24bd01c 	sub	sp, fp, #28
 818:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000081c <div>:
 81c:	e92d4810 	push	{r4, fp, lr}
 820:	e3a02000 	mov	r2, #0
 824:	e28db008 	add	fp, sp, #8
 828:	e1a0e000 	mov	lr, r0
 82c:	e3a0301f 	mov	r3, #31
 830:	e1a00002 	mov	r0, r2
 834:	e3a04001 	mov	r4, #1
 838:	e1a0c33e 	lsr	ip, lr, r3
 83c:	e20cc001 	and	ip, ip, #1
 840:	e18c2082 	orr	r2, ip, r2, lsl #1
 844:	e1520001 	cmp	r2, r1
 848:	20422001 	subcs	r2, r2, r1
 84c:	21800314 	orrcs	r0, r0, r4, lsl r3
 850:	e2533001 	subs	r3, r3, #1
 854:	2afffff7 	bcs	838 <div+0x1c>
 858:	e8bd8810 	pop	{r4, fp, pc}

0000085c <printf>:
 85c:	e92d000e 	push	{r1, r2, r3}
 860:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 864:	e28db018 	add	fp, sp, #24
 868:	e24dd008 	sub	sp, sp, #8
 86c:	e59b6004 	ldr	r6, [fp, #4]
 870:	e5d64000 	ldrb	r4, [r6]
 874:	e3540000 	cmp	r4, #0
 878:	0a00002b 	beq	92c <printf+0xd0>
 87c:	e1a07000 	mov	r7, r0
 880:	e28b8008 	add	r8, fp, #8
 884:	e3a05000 	mov	r5, #0
 888:	ea00000a 	b	8b8 <printf+0x5c>
 88c:	e3540025 	cmp	r4, #37	; 0x25
 890:	01a05004 	moveq	r5, r4
 894:	0a000004 	beq	8ac <printf+0x50>
 898:	e24b1018 	sub	r1, fp, #24
 89c:	e3a02001 	mov	r2, #1
 8a0:	e1a00007 	mov	r0, r7
 8a4:	e5614006 	strb	r4, [r1, #-6]!
 8a8:	ebfffed3 	bl	3fc <write>
 8ac:	e5f64001 	ldrb	r4, [r6, #1]!
 8b0:	e3540000 	cmp	r4, #0
 8b4:	0a00001c 	beq	92c <printf+0xd0>
 8b8:	e3550000 	cmp	r5, #0
 8bc:	0afffff2 	beq	88c <printf+0x30>
 8c0:	e3550025 	cmp	r5, #37	; 0x25
 8c4:	1afffff8 	bne	8ac <printf+0x50>
 8c8:	e3540064 	cmp	r4, #100	; 0x64
 8cc:	0a000037 	beq	9b0 <printf+0x154>
 8d0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8d4:	e3530070 	cmp	r3, #112	; 0x70
 8d8:	0a000017 	beq	93c <printf+0xe0>
 8dc:	e3540073 	cmp	r4, #115	; 0x73
 8e0:	0a00001c 	beq	958 <printf+0xfc>
 8e4:	e3540063 	cmp	r4, #99	; 0x63
 8e8:	0a000037 	beq	9cc <printf+0x170>
 8ec:	e3540025 	cmp	r4, #37	; 0x25
 8f0:	0a000027 	beq	994 <printf+0x138>
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e24b1019 	sub	r1, fp, #25
 8fc:	e1a00007 	mov	r0, r7
 900:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 904:	ebfffebc 	bl	3fc <write>
 908:	e3a02001 	mov	r2, #1
 90c:	e24b101a 	sub	r1, fp, #26
 910:	e1a00007 	mov	r0, r7
 914:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 918:	ebfffeb7 	bl	3fc <write>
 91c:	e5f64001 	ldrb	r4, [r6, #1]!
 920:	e3a05000 	mov	r5, #0
 924:	e3540000 	cmp	r4, #0
 928:	1affffe2 	bne	8b8 <printf+0x5c>
 92c:	e24bd018 	sub	sp, fp, #24
 930:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 934:	e28dd00c 	add	sp, sp, #12
 938:	e12fff1e 	bx	lr
 93c:	e3a03000 	mov	r3, #0
 940:	e3a02010 	mov	r2, #16
 944:	e4981004 	ldr	r1, [r8], #4
 948:	e1a00007 	mov	r0, r7
 94c:	ebffff7a 	bl	73c <printint>
 950:	e3a05000 	mov	r5, #0
 954:	eaffffd4 	b	8ac <printf+0x50>
 958:	e4984004 	ldr	r4, [r8], #4
 95c:	e3540000 	cmp	r4, #0
 960:	0a000021 	beq	9ec <printf+0x190>
 964:	e5d45000 	ldrb	r5, [r4]
 968:	e3550000 	cmp	r5, #0
 96c:	0affffce 	beq	8ac <printf+0x50>
 970:	e3a02001 	mov	r2, #1
 974:	e24b101d 	sub	r1, fp, #29
 978:	e1a00007 	mov	r0, r7
 97c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 980:	ebfffe9d 	bl	3fc <write>
 984:	e5f45001 	ldrb	r5, [r4, #1]!
 988:	e3550000 	cmp	r5, #0
 98c:	1afffff7 	bne	970 <printf+0x114>
 990:	eaffffc5 	b	8ac <printf+0x50>
 994:	e24b1018 	sub	r1, fp, #24
 998:	e3a02001 	mov	r2, #1
 99c:	e1a00007 	mov	r0, r7
 9a0:	e5615003 	strb	r5, [r1, #-3]!
 9a4:	e3a05000 	mov	r5, #0
 9a8:	ebfffe93 	bl	3fc <write>
 9ac:	eaffffbe 	b	8ac <printf+0x50>
 9b0:	e3a03001 	mov	r3, #1
 9b4:	e3a0200a 	mov	r2, #10
 9b8:	e4981004 	ldr	r1, [r8], #4
 9bc:	e1a00007 	mov	r0, r7
 9c0:	ebffff5d 	bl	73c <printint>
 9c4:	e3a05000 	mov	r5, #0
 9c8:	eaffffb7 	b	8ac <printf+0x50>
 9cc:	e4983004 	ldr	r3, [r8], #4
 9d0:	e24b1018 	sub	r1, fp, #24
 9d4:	e3a02001 	mov	r2, #1
 9d8:	e1a00007 	mov	r0, r7
 9dc:	e3a05000 	mov	r5, #0
 9e0:	e5613004 	strb	r3, [r1, #-4]!
 9e4:	ebfffe84 	bl	3fc <write>
 9e8:	eaffffaf 	b	8ac <printf+0x50>
 9ec:	e3004bb0 	movw	r4, #2992	; 0xbb0
 9f0:	e3a05028 	mov	r5, #40	; 0x28
 9f4:	e3404000 	movt	r4, #0
 9f8:	eaffffdc 	b	970 <printf+0x114>

000009fc <free>:
 9fc:	e300cbb8 	movw	ip, #3000	; 0xbb8
 a00:	e340c000 	movt	ip, #0
 a04:	e92d4810 	push	{r4, fp, lr}
 a08:	e2401008 	sub	r1, r0, #8
 a0c:	e28db008 	add	fp, sp, #8
 a10:	e59c3000 	ldr	r3, [ip]
 a14:	ea000004 	b	a2c <free+0x30>
 a18:	e1510002 	cmp	r1, r2
 a1c:	3a000009 	bcc	a48 <free+0x4c>
 a20:	e1530002 	cmp	r3, r2
 a24:	2a000007 	bcs	a48 <free+0x4c>
 a28:	e1a03002 	mov	r3, r2
 a2c:	e1530001 	cmp	r3, r1
 a30:	e5932000 	ldr	r2, [r3]
 a34:	3afffff7 	bcc	a18 <free+0x1c>
 a38:	e1530002 	cmp	r3, r2
 a3c:	3afffff9 	bcc	a28 <free+0x2c>
 a40:	e1510002 	cmp	r1, r2
 a44:	2afffff7 	bcs	a28 <free+0x2c>
 a48:	e510e004 	ldr	lr, [r0, #-4]
 a4c:	e58c3000 	str	r3, [ip]
 a50:	e081418e 	add	r4, r1, lr, lsl #3
 a54:	e1520004 	cmp	r2, r4
 a58:	05922004 	ldreq	r2, [r2, #4]
 a5c:	0082e00e 	addeq	lr, r2, lr
 a60:	0500e004 	streq	lr, [r0, #-4]
 a64:	05932000 	ldreq	r2, [r3]
 a68:	05922000 	ldreq	r2, [r2]
 a6c:	e5002008 	str	r2, [r0, #-8]
 a70:	e5932004 	ldr	r2, [r3, #4]
 a74:	e083e182 	add	lr, r3, r2, lsl #3
 a78:	e151000e 	cmp	r1, lr
 a7c:	15831000 	strne	r1, [r3]
 a80:	05101004 	ldreq	r1, [r0, #-4]
 a84:	00812002 	addeq	r2, r1, r2
 a88:	05832004 	streq	r2, [r3, #4]
 a8c:	05102008 	ldreq	r2, [r0, #-8]
 a90:	05832000 	streq	r2, [r3]
 a94:	e8bd8810 	pop	{r4, fp, pc}

00000a98 <malloc>:
 a98:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 a9c:	e3007bb8 	movw	r7, #3000	; 0xbb8
 aa0:	e3407000 	movt	r7, #0
 aa4:	e2804007 	add	r4, r0, #7
 aa8:	e28db014 	add	fp, sp, #20
 aac:	e5973000 	ldr	r3, [r7]
 ab0:	e1a041a4 	lsr	r4, r4, #3
 ab4:	e2844001 	add	r4, r4, #1
 ab8:	e3530000 	cmp	r3, #0
 abc:	0a000027 	beq	b60 <malloc+0xc8>
 ac0:	e5930000 	ldr	r0, [r3]
 ac4:	e5902004 	ldr	r2, [r0, #4]
 ac8:	e1540002 	cmp	r4, r2
 acc:	9a000019 	bls	b38 <malloc+0xa0>
 ad0:	e3540a01 	cmp	r4, #4096	; 0x1000
 ad4:	21a05004 	movcs	r5, r4
 ad8:	33a05a01 	movcc	r5, #4096	; 0x1000
 adc:	e1a06185 	lsl	r6, r5, #3
 ae0:	ea000003 	b	af4 <malloc+0x5c>
 ae4:	e5930000 	ldr	r0, [r3]
 ae8:	e5902004 	ldr	r2, [r0, #4]
 aec:	e1540002 	cmp	r4, r2
 af0:	9a000010 	bls	b38 <malloc+0xa0>
 af4:	e5972000 	ldr	r2, [r7]
 af8:	e1a03000 	mov	r3, r0
 afc:	e1520000 	cmp	r2, r0
 b00:	1afffff7 	bne	ae4 <malloc+0x4c>
 b04:	e1a00006 	mov	r0, r6
 b08:	ebfffee4 	bl	6a0 <sbrk>
 b0c:	e1a03000 	mov	r3, r0
 b10:	e3730001 	cmn	r3, #1
 b14:	e2800008 	add	r0, r0, #8
 b18:	0a000004 	beq	b30 <malloc+0x98>
 b1c:	e5835004 	str	r5, [r3, #4]
 b20:	ebffffb5 	bl	9fc <free>
 b24:	e5973000 	ldr	r3, [r7]
 b28:	e3530000 	cmp	r3, #0
 b2c:	1affffec 	bne	ae4 <malloc+0x4c>
 b30:	e3a00000 	mov	r0, #0
 b34:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b38:	e1540002 	cmp	r4, r2
 b3c:	e5873000 	str	r3, [r7]
 b40:	10422004 	subne	r2, r2, r4
 b44:	15802004 	strne	r2, [r0, #4]
 b48:	05902000 	ldreq	r2, [r0]
 b4c:	10800182 	addne	r0, r0, r2, lsl #3
 b50:	e2800008 	add	r0, r0, #8
 b54:	15004004 	strne	r4, [r0, #-4]
 b58:	05832000 	streq	r2, [r3]
 b5c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b60:	e2870004 	add	r0, r7, #4
 b64:	e5873008 	str	r3, [r7, #8]
 b68:	e5870000 	str	r0, [r7]
 b6c:	e5870004 	str	r0, [r7, #4]
 b70:	eaffffd6 	b	ad0 <malloc+0x38>
