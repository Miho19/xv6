
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500003 	cmp	r0, #3
   4:	e92d4800 	push	{fp, lr}
   8:	e28db004 	add	fp, sp, #4
   c:	0a000004 	beq	24 <main+0x24>
  10:	e3001b40 	movw	r1, #2880	; 0xb40
  14:	e3a00002 	mov	r0, #2
  18:	e3401000 	movt	r1, #0
  1c:	eb000201 	bl	828 <printf>
  20:	eb0000b4 	bl	2f8 <exit>
  24:	e1a04001 	mov	r4, r1
  28:	e9910003 	ldmib	r1, {r0, r1}
  2c:	eb00014d 	bl	568 <link>
  30:	e3500000 	cmp	r0, #0
  34:	ba000000 	blt	3c <main+0x3c>
  38:	eb0000ae 	bl	2f8 <exit>
  3c:	e3001b54 	movw	r1, #2900	; 0xb54
  40:	e5943008 	ldr	r3, [r4, #8]
  44:	e3401000 	movt	r1, #0
  48:	e5942004 	ldr	r2, [r4, #4]
  4c:	e3a00002 	mov	r0, #2
  50:	eb0001f4 	bl	828 <printf>
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
 1b8:	eb000075 	bl	394 <read>
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
 218:	eb00009e 	bl	498 <open>
 21c:	e2505000 	subs	r5, r0, #0
 220:	ba000006 	blt	240 <stat+0x38>
 224:	e1a01004 	mov	r1, r4
 228:	eb0000c1 	bl	534 <fstat>
 22c:	e1a04000 	mov	r4, r0
 230:	e1a00005 	mov	r0, r5
 234:	eb000070 	bl	3fc <close>
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

00000360 <pipe>:
 360:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 364:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 368:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 36c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 370:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 374:	e3a00004 	mov	r0, #4
 378:	ef000040 	svc	0x00000040
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 388:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 38c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <read>:
 394:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 398:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 39c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a8:	e3a00005 	mov	r0, #5
 3ac:	ef000040 	svc	0x00000040
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <write>:
 3c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3dc:	e3a00010 	mov	r0, #16
 3e0:	ef000040 	svc	0x00000040
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <close>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00015 	mov	r0, #21
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <kill>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00006 	mov	r0, #6
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <exec>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00007 	mov	r0, #7
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <open>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a0000f 	mov	r0, #15
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <mknod>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00011 	mov	r0, #17
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <unlink>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00012 	mov	r0, #18
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <fstat>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00008 	mov	r0, #8
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <link>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00013 	mov	r0, #19
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <mkdir>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00014 	mov	r0, #20
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <chdir>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00009 	mov	r0, #9
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <dup>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a0000a 	mov	r0, #10
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <getpid>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a0000b 	mov	r0, #11
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <sbrk>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a0000c 	mov	r0, #12
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <sleep>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a0000d 	mov	r0, #13
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <uptime>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a0000e 	mov	r0, #14
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <printint>:
 708:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 70c:	e1a09fa1 	lsr	r9, r1, #31
 710:	e3530000 	cmp	r3, #0
 714:	03a09000 	moveq	r9, #0
 718:	12099001 	andne	r9, r9, #1
 71c:	e28db01c 	add	fp, sp, #28
 720:	e3590000 	cmp	r9, #0
 724:	e3008b68 	movw	r8, #2920	; 0xb68
 728:	1261e000 	rsbne	lr, r1, #0
 72c:	e3408000 	movt	r8, #0
 730:	e24b602d 	sub	r6, fp, #45	; 0x2d
 734:	e1a04000 	mov	r4, r0
 738:	13a09001 	movne	r9, #1
 73c:	01a0e001 	moveq	lr, r1
 740:	e3a07000 	mov	r7, #0
 744:	e3a05001 	mov	r5, #1
 748:	e24dd018 	sub	sp, sp, #24
 74c:	e3a0c000 	mov	ip, #0
 750:	e3a0301f 	mov	r3, #31
 754:	e1a0100c 	mov	r1, ip
 758:	e1a0033e 	lsr	r0, lr, r3
 75c:	e2000001 	and	r0, r0, #1
 760:	e1801081 	orr	r1, r0, r1, lsl #1
 764:	e1520001 	cmp	r2, r1
 768:	90411002 	subls	r1, r1, r2
 76c:	918cc315 	orrls	ip, ip, r5, lsl r3
 770:	e2533001 	subs	r3, r3, #1
 774:	2afffff7 	bcs	758 <printint+0x50>
 778:	e061e29c 	mls	r1, ip, r2, lr
 77c:	e35c0000 	cmp	ip, #0
 780:	e1a0e00c 	mov	lr, ip
 784:	e2873001 	add	r3, r7, #1
 788:	e7d81001 	ldrb	r1, [r8, r1]
 78c:	e5e61001 	strb	r1, [r6, #1]!
 790:	11a07003 	movne	r7, r3
 794:	1affffec 	bne	74c <printint+0x44>
 798:	e3590000 	cmp	r9, #0
 79c:	124b201c 	subne	r2, fp, #28
 7a0:	10822003 	addne	r2, r2, r3
 7a4:	13a0102d 	movne	r1, #45	; 0x2d
 7a8:	12873002 	addne	r3, r7, #2
 7ac:	15421010 	strbne	r1, [r2, #-16]
 7b0:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7b4:	e2435001 	sub	r5, r3, #1
 7b8:	e0826003 	add	r6, r2, r3
 7bc:	e5763001 	ldrb	r3, [r6, #-1]!
 7c0:	e2455001 	sub	r5, r5, #1
 7c4:	e3a02001 	mov	r2, #1
 7c8:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7cc:	e1a00004 	mov	r0, r4
 7d0:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7d4:	ebfffefb 	bl	3c8 <write>
 7d8:	e3750001 	cmn	r5, #1
 7dc:	1afffff6 	bne	7bc <printint+0xb4>
 7e0:	e24bd01c 	sub	sp, fp, #28
 7e4:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007e8 <div>:
 7e8:	e92d4810 	push	{r4, fp, lr}
 7ec:	e3a02000 	mov	r2, #0
 7f0:	e28db008 	add	fp, sp, #8
 7f4:	e1a0e000 	mov	lr, r0
 7f8:	e3a0301f 	mov	r3, #31
 7fc:	e1a00002 	mov	r0, r2
 800:	e3a04001 	mov	r4, #1
 804:	e1a0c33e 	lsr	ip, lr, r3
 808:	e20cc001 	and	ip, ip, #1
 80c:	e18c2082 	orr	r2, ip, r2, lsl #1
 810:	e1520001 	cmp	r2, r1
 814:	20422001 	subcs	r2, r2, r1
 818:	21800314 	orrcs	r0, r0, r4, lsl r3
 81c:	e2533001 	subs	r3, r3, #1
 820:	2afffff7 	bcs	804 <div+0x1c>
 824:	e8bd8810 	pop	{r4, fp, pc}

00000828 <printf>:
 828:	e92d000e 	push	{r1, r2, r3}
 82c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 830:	e28db018 	add	fp, sp, #24
 834:	e24dd008 	sub	sp, sp, #8
 838:	e59b6004 	ldr	r6, [fp, #4]
 83c:	e5d64000 	ldrb	r4, [r6]
 840:	e3540000 	cmp	r4, #0
 844:	0a00002b 	beq	8f8 <printf+0xd0>
 848:	e1a07000 	mov	r7, r0
 84c:	e28b8008 	add	r8, fp, #8
 850:	e3a05000 	mov	r5, #0
 854:	ea00000a 	b	884 <printf+0x5c>
 858:	e3540025 	cmp	r4, #37	; 0x25
 85c:	01a05004 	moveq	r5, r4
 860:	0a000004 	beq	878 <printf+0x50>
 864:	e24b1018 	sub	r1, fp, #24
 868:	e3a02001 	mov	r2, #1
 86c:	e1a00007 	mov	r0, r7
 870:	e5614006 	strb	r4, [r1, #-6]!
 874:	ebfffed3 	bl	3c8 <write>
 878:	e5f64001 	ldrb	r4, [r6, #1]!
 87c:	e3540000 	cmp	r4, #0
 880:	0a00001c 	beq	8f8 <printf+0xd0>
 884:	e3550000 	cmp	r5, #0
 888:	0afffff2 	beq	858 <printf+0x30>
 88c:	e3550025 	cmp	r5, #37	; 0x25
 890:	1afffff8 	bne	878 <printf+0x50>
 894:	e3540064 	cmp	r4, #100	; 0x64
 898:	0a000037 	beq	97c <printf+0x154>
 89c:	e20430f7 	and	r3, r4, #247	; 0xf7
 8a0:	e3530070 	cmp	r3, #112	; 0x70
 8a4:	0a000017 	beq	908 <printf+0xe0>
 8a8:	e3540073 	cmp	r4, #115	; 0x73
 8ac:	0a00001c 	beq	924 <printf+0xfc>
 8b0:	e3540063 	cmp	r4, #99	; 0x63
 8b4:	0a000037 	beq	998 <printf+0x170>
 8b8:	e3540025 	cmp	r4, #37	; 0x25
 8bc:	0a000027 	beq	960 <printf+0x138>
 8c0:	e3a02001 	mov	r2, #1
 8c4:	e24b1019 	sub	r1, fp, #25
 8c8:	e1a00007 	mov	r0, r7
 8cc:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8d0:	ebfffebc 	bl	3c8 <write>
 8d4:	e3a02001 	mov	r2, #1
 8d8:	e24b101a 	sub	r1, fp, #26
 8dc:	e1a00007 	mov	r0, r7
 8e0:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8e4:	ebfffeb7 	bl	3c8 <write>
 8e8:	e5f64001 	ldrb	r4, [r6, #1]!
 8ec:	e3a05000 	mov	r5, #0
 8f0:	e3540000 	cmp	r4, #0
 8f4:	1affffe2 	bne	884 <printf+0x5c>
 8f8:	e24bd018 	sub	sp, fp, #24
 8fc:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 900:	e28dd00c 	add	sp, sp, #12
 904:	e12fff1e 	bx	lr
 908:	e3a03000 	mov	r3, #0
 90c:	e3a02010 	mov	r2, #16
 910:	e4981004 	ldr	r1, [r8], #4
 914:	e1a00007 	mov	r0, r7
 918:	ebffff7a 	bl	708 <printint>
 91c:	e3a05000 	mov	r5, #0
 920:	eaffffd4 	b	878 <printf+0x50>
 924:	e4984004 	ldr	r4, [r8], #4
 928:	e3540000 	cmp	r4, #0
 92c:	0a000021 	beq	9b8 <printf+0x190>
 930:	e5d45000 	ldrb	r5, [r4]
 934:	e3550000 	cmp	r5, #0
 938:	0affffce 	beq	878 <printf+0x50>
 93c:	e3a02001 	mov	r2, #1
 940:	e24b101d 	sub	r1, fp, #29
 944:	e1a00007 	mov	r0, r7
 948:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 94c:	ebfffe9d 	bl	3c8 <write>
 950:	e5f45001 	ldrb	r5, [r4, #1]!
 954:	e3550000 	cmp	r5, #0
 958:	1afffff7 	bne	93c <printf+0x114>
 95c:	eaffffc5 	b	878 <printf+0x50>
 960:	e24b1018 	sub	r1, fp, #24
 964:	e3a02001 	mov	r2, #1
 968:	e1a00007 	mov	r0, r7
 96c:	e5615003 	strb	r5, [r1, #-3]!
 970:	e3a05000 	mov	r5, #0
 974:	ebfffe93 	bl	3c8 <write>
 978:	eaffffbe 	b	878 <printf+0x50>
 97c:	e3a03001 	mov	r3, #1
 980:	e3a0200a 	mov	r2, #10
 984:	e4981004 	ldr	r1, [r8], #4
 988:	e1a00007 	mov	r0, r7
 98c:	ebffff5d 	bl	708 <printint>
 990:	e3a05000 	mov	r5, #0
 994:	eaffffb7 	b	878 <printf+0x50>
 998:	e4983004 	ldr	r3, [r8], #4
 99c:	e24b1018 	sub	r1, fp, #24
 9a0:	e3a02001 	mov	r2, #1
 9a4:	e1a00007 	mov	r0, r7
 9a8:	e3a05000 	mov	r5, #0
 9ac:	e5613004 	strb	r3, [r1, #-4]!
 9b0:	ebfffe84 	bl	3c8 <write>
 9b4:	eaffffaf 	b	878 <printf+0x50>
 9b8:	e3004b7c 	movw	r4, #2940	; 0xb7c
 9bc:	e3a05028 	mov	r5, #40	; 0x28
 9c0:	e3404000 	movt	r4, #0
 9c4:	eaffffdc 	b	93c <printf+0x114>

000009c8 <free>:
 9c8:	e300cb84 	movw	ip, #2948	; 0xb84
 9cc:	e340c000 	movt	ip, #0
 9d0:	e92d4810 	push	{r4, fp, lr}
 9d4:	e2401008 	sub	r1, r0, #8
 9d8:	e28db008 	add	fp, sp, #8
 9dc:	e59c3000 	ldr	r3, [ip]
 9e0:	ea000004 	b	9f8 <free+0x30>
 9e4:	e1510002 	cmp	r1, r2
 9e8:	3a000009 	bcc	a14 <free+0x4c>
 9ec:	e1530002 	cmp	r3, r2
 9f0:	2a000007 	bcs	a14 <free+0x4c>
 9f4:	e1a03002 	mov	r3, r2
 9f8:	e1530001 	cmp	r3, r1
 9fc:	e5932000 	ldr	r2, [r3]
 a00:	3afffff7 	bcc	9e4 <free+0x1c>
 a04:	e1530002 	cmp	r3, r2
 a08:	3afffff9 	bcc	9f4 <free+0x2c>
 a0c:	e1510002 	cmp	r1, r2
 a10:	2afffff7 	bcs	9f4 <free+0x2c>
 a14:	e510e004 	ldr	lr, [r0, #-4]
 a18:	e58c3000 	str	r3, [ip]
 a1c:	e081418e 	add	r4, r1, lr, lsl #3
 a20:	e1520004 	cmp	r2, r4
 a24:	05922004 	ldreq	r2, [r2, #4]
 a28:	0082e00e 	addeq	lr, r2, lr
 a2c:	0500e004 	streq	lr, [r0, #-4]
 a30:	05932000 	ldreq	r2, [r3]
 a34:	05922000 	ldreq	r2, [r2]
 a38:	e5002008 	str	r2, [r0, #-8]
 a3c:	e5932004 	ldr	r2, [r3, #4]
 a40:	e083e182 	add	lr, r3, r2, lsl #3
 a44:	e151000e 	cmp	r1, lr
 a48:	15831000 	strne	r1, [r3]
 a4c:	05101004 	ldreq	r1, [r0, #-4]
 a50:	00812002 	addeq	r2, r1, r2
 a54:	05832004 	streq	r2, [r3, #4]
 a58:	05102008 	ldreq	r2, [r0, #-8]
 a5c:	05832000 	streq	r2, [r3]
 a60:	e8bd8810 	pop	{r4, fp, pc}

00000a64 <malloc>:
 a64:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 a68:	e3007b84 	movw	r7, #2948	; 0xb84
 a6c:	e3407000 	movt	r7, #0
 a70:	e2804007 	add	r4, r0, #7
 a74:	e28db014 	add	fp, sp, #20
 a78:	e5973000 	ldr	r3, [r7]
 a7c:	e1a041a4 	lsr	r4, r4, #3
 a80:	e2844001 	add	r4, r4, #1
 a84:	e3530000 	cmp	r3, #0
 a88:	0a000027 	beq	b2c <malloc+0xc8>
 a8c:	e5930000 	ldr	r0, [r3]
 a90:	e5902004 	ldr	r2, [r0, #4]
 a94:	e1540002 	cmp	r4, r2
 a98:	9a000019 	bls	b04 <malloc+0xa0>
 a9c:	e3540a01 	cmp	r4, #4096	; 0x1000
 aa0:	21a05004 	movcs	r5, r4
 aa4:	33a05a01 	movcc	r5, #4096	; 0x1000
 aa8:	e1a06185 	lsl	r6, r5, #3
 aac:	ea000003 	b	ac0 <malloc+0x5c>
 ab0:	e5930000 	ldr	r0, [r3]
 ab4:	e5902004 	ldr	r2, [r0, #4]
 ab8:	e1540002 	cmp	r4, r2
 abc:	9a000010 	bls	b04 <malloc+0xa0>
 ac0:	e5972000 	ldr	r2, [r7]
 ac4:	e1a03000 	mov	r3, r0
 ac8:	e1520000 	cmp	r2, r0
 acc:	1afffff7 	bne	ab0 <malloc+0x4c>
 ad0:	e1a00006 	mov	r0, r6
 ad4:	ebfffee4 	bl	66c <sbrk>
 ad8:	e1a03000 	mov	r3, r0
 adc:	e3730001 	cmn	r3, #1
 ae0:	e2800008 	add	r0, r0, #8
 ae4:	0a000004 	beq	afc <malloc+0x98>
 ae8:	e5835004 	str	r5, [r3, #4]
 aec:	ebffffb5 	bl	9c8 <free>
 af0:	e5973000 	ldr	r3, [r7]
 af4:	e3530000 	cmp	r3, #0
 af8:	1affffec 	bne	ab0 <malloc+0x4c>
 afc:	e3a00000 	mov	r0, #0
 b00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b04:	e1540002 	cmp	r4, r2
 b08:	e5873000 	str	r3, [r7]
 b0c:	10422004 	subne	r2, r2, r4
 b10:	15802004 	strne	r2, [r0, #4]
 b14:	05902000 	ldreq	r2, [r0]
 b18:	10800182 	addne	r0, r0, r2, lsl #3
 b1c:	e2800008 	add	r0, r0, #8
 b20:	15004004 	strne	r4, [r0, #-4]
 b24:	05832000 	streq	r2, [r3]
 b28:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b2c:	e2870004 	add	r0, r7, #4
 b30:	e5873008 	str	r3, [r7, #8]
 b34:	e5870000 	str	r0, [r7]
 b38:	e5870004 	str	r0, [r7, #4]
 b3c:	eaffffd6 	b	a9c <malloc+0x38>
