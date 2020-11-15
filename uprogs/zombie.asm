
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
   8:	eb0000a8 	bl	2b0 <fork>
   c:	e3500000 	cmp	r0, #0
  10:	da000006 	ble	30 <main+0x30>
  14:	e3a00005 	mov	r0, #5
  18:	eb0001a8 	bl	6c0 <sleep>
  1c:	e3001b60 	movw	r1, #2912	; 0xb60
  20:	e3a00002 	mov	r0, #2
  24:	e3401000 	movt	r1, #0
  28:	eb000206 	bl	848 <printf>
  2c:	eb0000ac 	bl	2e4 <exit>
  30:	e3001b70 	movw	r1, #2928	; 0xb70
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb000201 	bl	848 <printf>
  40:	eb0000a7 	bl	2e4 <exit>

00000044 <strcpy>:
  44:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  48:	e2402001 	sub	r2, r0, #1
  4c:	e28db000 	add	fp, sp, #0
  50:	e4d13001 	ldrb	r3, [r1], #1
  54:	e3530000 	cmp	r3, #0
  58:	e5e23001 	strb	r3, [r2, #1]!
  5c:	1afffffb 	bne	50 <strcpy+0xc>
  60:	e28bd000 	add	sp, fp, #0
  64:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  68:	e12fff1e 	bx	lr

0000006c <strcmp>:
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e28db000 	add	fp, sp, #0
  74:	e5d03000 	ldrb	r3, [r0]
  78:	e5d12000 	ldrb	r2, [r1]
  7c:	e3530000 	cmp	r3, #0
  80:	1a000004 	bne	98 <strcmp+0x2c>
  84:	ea000005 	b	a0 <strcmp+0x34>
  88:	e5f03001 	ldrb	r3, [r0, #1]!
  8c:	e3530000 	cmp	r3, #0
  90:	0a000006 	beq	b0 <strcmp+0x44>
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e1530002 	cmp	r3, r2
  9c:	0afffff9 	beq	88 <strcmp+0x1c>
  a0:	e0430002 	sub	r0, r3, r2
  a4:	e28bd000 	add	sp, fp, #0
  a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  ac:	e12fff1e 	bx	lr
  b0:	e5d12001 	ldrb	r2, [r1, #1]
  b4:	e0430002 	sub	r0, r3, r2
  b8:	e28bd000 	add	sp, fp, #0
  bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c0:	e12fff1e 	bx	lr

000000c4 <strlen>:
  c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  c8:	e28db000 	add	fp, sp, #0
  cc:	e5d03000 	ldrb	r3, [r0]
  d0:	e3530000 	cmp	r3, #0
  d4:	0a000009 	beq	100 <strlen+0x3c>
  d8:	e1a02000 	mov	r2, r0
  dc:	e3a03000 	mov	r3, #0
  e0:	e5f21001 	ldrb	r1, [r2, #1]!
  e4:	e2833001 	add	r3, r3, #1
  e8:	e3510000 	cmp	r1, #0
  ec:	e1a00003 	mov	r0, r3
  f0:	1afffffa 	bne	e0 <strlen+0x1c>
  f4:	e28bd000 	add	sp, fp, #0
  f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  fc:	e12fff1e 	bx	lr
 100:	e1a00003 	mov	r0, r3
 104:	eafffffa 	b	f4 <strlen+0x30>

00000108 <memset>:
 108:	e3520000 	cmp	r2, #0
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e28db000 	add	fp, sp, #0
 114:	0a000004 	beq	12c <memset+0x24>
 118:	e6ef1071 	uxtb	r1, r1
 11c:	e0802002 	add	r2, r0, r2
 120:	e4c01001 	strb	r1, [r0], #1
 124:	e1520000 	cmp	r2, r0
 128:	1afffffc 	bne	120 <memset+0x18>
 12c:	e28bd000 	add	sp, fp, #0
 130:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 134:	e12fff1e 	bx	lr

00000138 <strchr>:
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
 140:	e5d02000 	ldrb	r2, [r0]
 144:	e3520000 	cmp	r2, #0
 148:	0a00000b 	beq	17c <strchr+0x44>
 14c:	e1510002 	cmp	r1, r2
 150:	1a000002 	bne	160 <strchr+0x28>
 154:	ea000005 	b	170 <strchr+0x38>
 158:	e1530001 	cmp	r3, r1
 15c:	0a000003 	beq	170 <strchr+0x38>
 160:	e5f03001 	ldrb	r3, [r0, #1]!
 164:	e3530000 	cmp	r3, #0
 168:	1afffffa 	bne	158 <strchr+0x20>
 16c:	e1a00003 	mov	r0, r3
 170:	e28bd000 	add	sp, fp, #0
 174:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 178:	e12fff1e 	bx	lr
 17c:	e1a00002 	mov	r0, r2
 180:	eafffffa 	b	170 <strchr+0x38>

00000184 <gets>:
 184:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 188:	e1a08000 	mov	r8, r0
 18c:	e28db018 	add	fp, sp, #24
 190:	e1a07001 	mov	r7, r1
 194:	e24dd00c 	sub	sp, sp, #12
 198:	e2406001 	sub	r6, r0, #1
 19c:	e3a05000 	mov	r5, #0
 1a0:	ea000008 	b	1c8 <gets+0x44>
 1a4:	eb000082 	bl	3b4 <read>
 1a8:	e3500000 	cmp	r0, #0
 1ac:	da00000b 	ble	1e0 <gets+0x5c>
 1b0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1b4:	e1a05004 	mov	r5, r4
 1b8:	e353000d 	cmp	r3, #13
 1bc:	1353000a 	cmpne	r3, #10
 1c0:	e5e63001 	strb	r3, [r6, #1]!
 1c4:	0a000005 	beq	1e0 <gets+0x5c>
 1c8:	e3a02001 	mov	r2, #1
 1cc:	e0854002 	add	r4, r5, r2
 1d0:	e1540007 	cmp	r4, r7
 1d4:	e24b101d 	sub	r1, fp, #29
 1d8:	e3a00000 	mov	r0, #0
 1dc:	bafffff0 	blt	1a4 <gets+0x20>
 1e0:	e3a03000 	mov	r3, #0
 1e4:	e1a00008 	mov	r0, r8
 1e8:	e7c83005 	strb	r3, [r8, r5]
 1ec:	e24bd018 	sub	sp, fp, #24
 1f0:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000001f4 <stat>:
 1f4:	e92d4830 	push	{r4, r5, fp, lr}
 1f8:	e1a04001 	mov	r4, r1
 1fc:	e28db00c 	add	fp, sp, #12
 200:	e3a01000 	mov	r1, #0
 204:	eb0000ab 	bl	4b8 <open>
 208:	e2505000 	subs	r5, r0, #0
 20c:	ba000006 	blt	22c <stat+0x38>
 210:	e1a01004 	mov	r1, r4
 214:	eb0000ce 	bl	554 <fstat>
 218:	e1a04000 	mov	r4, r0
 21c:	e1a00005 	mov	r0, r5
 220:	eb00007d 	bl	41c <close>
 224:	e1a00004 	mov	r0, r4
 228:	e8bd8830 	pop	{r4, r5, fp, pc}
 22c:	e3e04000 	mvn	r4, #0
 230:	eafffffb 	b	224 <stat+0x30>

00000234 <atoi>:
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
 23c:	e5d02000 	ldrb	r2, [r0]
 240:	e2423030 	sub	r3, r2, #48	; 0x30
 244:	e3530009 	cmp	r3, #9
 248:	e3a03000 	mov	r3, #0
 24c:	8a000006 	bhi	26c <atoi+0x38>
 250:	e3a0c00a 	mov	ip, #10
 254:	e023239c 	mla	r3, ip, r3, r2
 258:	e5f02001 	ldrb	r2, [r0, #1]!
 25c:	e2421030 	sub	r1, r2, #48	; 0x30
 260:	e3510009 	cmp	r1, #9
 264:	e2433030 	sub	r3, r3, #48	; 0x30
 268:	9afffff9 	bls	254 <atoi+0x20>
 26c:	e1a00003 	mov	r0, r3
 270:	e28bd000 	add	sp, fp, #0
 274:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 278:	e12fff1e 	bx	lr

0000027c <memmove>:
 27c:	e3520000 	cmp	r2, #0
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
 288:	da000005 	ble	2a4 <memmove+0x28>
 28c:	e0812002 	add	r2, r1, r2
 290:	e2403001 	sub	r3, r0, #1
 294:	e4d1c001 	ldrb	ip, [r1], #1
 298:	e1510002 	cmp	r1, r2
 29c:	e5e3c001 	strb	ip, [r3, #1]!
 2a0:	1afffffb 	bne	294 <memmove+0x18>
 2a4:	e28bd000 	add	sp, fp, #0
 2a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2ac:	e12fff1e 	bx	lr

000002b0 <fork>:
 2b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2c4:	e3a00001 	mov	r0, #1
 2c8:	ef000040 	svc	0x00000040
 2cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2e0:	e12fff1e 	bx	lr

000002e4 <exit>:
 2e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f8:	e3a00002 	mov	r0, #2
 2fc:	ef000040 	svc	0x00000040
 300:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 304:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 308:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 30c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 310:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 314:	e12fff1e 	bx	lr

00000318 <wait>:
 318:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 31c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 320:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 324:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 328:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 32c:	e3a00003 	mov	r0, #3
 330:	ef000040 	svc	0x00000040
 334:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 338:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 33c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 340:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 344:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 348:	e12fff1e 	bx	lr

0000034c <lseek>:
 34c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 350:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 354:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 358:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 35c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 360:	e3a00016 	mov	r0, #22
 364:	ef000040 	svc	0x00000040
 368:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 374:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 378:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 37c:	e12fff1e 	bx	lr

00000380 <pipe>:
 380:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 384:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 388:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 38c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 390:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 394:	e3a00004 	mov	r0, #4
 398:	ef000040 	svc	0x00000040
 39c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b0:	e12fff1e 	bx	lr

000003b4 <read>:
 3b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c8:	e3a00005 	mov	r0, #5
 3cc:	ef000040 	svc	0x00000040
 3d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e4:	e12fff1e 	bx	lr

000003e8 <write>:
 3e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3fc:	e3a00010 	mov	r0, #16
 400:	ef000040 	svc	0x00000040
 404:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 410:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 414:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 418:	e12fff1e 	bx	lr

0000041c <close>:
 41c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 420:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 424:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 428:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 42c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 430:	e3a00015 	mov	r0, #21
 434:	ef000040 	svc	0x00000040
 438:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 444:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 448:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 44c:	e12fff1e 	bx	lr

00000450 <kill>:
 450:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 454:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 458:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 45c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 460:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 464:	e3a00006 	mov	r0, #6
 468:	ef000040 	svc	0x00000040
 46c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 478:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 47c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 480:	e12fff1e 	bx	lr

00000484 <exec>:
 484:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 488:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 48c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 490:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 494:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 498:	e3a00007 	mov	r0, #7
 49c:	ef000040 	svc	0x00000040
 4a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b4:	e12fff1e 	bx	lr

000004b8 <open>:
 4b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4cc:	e3a0000f 	mov	r0, #15
 4d0:	ef000040 	svc	0x00000040
 4d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e8:	e12fff1e 	bx	lr

000004ec <mknod>:
 4ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 500:	e3a00011 	mov	r0, #17
 504:	ef000040 	svc	0x00000040
 508:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 514:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 518:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 51c:	e12fff1e 	bx	lr

00000520 <unlink>:
 520:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 524:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 528:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 52c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 530:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 534:	e3a00012 	mov	r0, #18
 538:	ef000040 	svc	0x00000040
 53c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 548:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 54c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 550:	e12fff1e 	bx	lr

00000554 <fstat>:
 554:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 558:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 55c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 560:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 564:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 568:	e3a00008 	mov	r0, #8
 56c:	ef000040 	svc	0x00000040
 570:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 57c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 580:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 584:	e12fff1e 	bx	lr

00000588 <link>:
 588:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 58c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 590:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 594:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 598:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 59c:	e3a00013 	mov	r0, #19
 5a0:	ef000040 	svc	0x00000040
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b8:	e12fff1e 	bx	lr

000005bc <mkdir>:
 5bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d0:	e3a00014 	mov	r0, #20
 5d4:	ef000040 	svc	0x00000040
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ec:	e12fff1e 	bx	lr

000005f0 <chdir>:
 5f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 604:	e3a00009 	mov	r0, #9
 608:	ef000040 	svc	0x00000040
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 618:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 61c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 620:	e12fff1e 	bx	lr

00000624 <dup>:
 624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 628:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 62c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 630:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 634:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 638:	e3a0000a 	mov	r0, #10
 63c:	ef000040 	svc	0x00000040
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 64c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 650:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 654:	e12fff1e 	bx	lr

00000658 <getpid>:
 658:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 65c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 660:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 664:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 668:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 66c:	e3a0000b 	mov	r0, #11
 670:	ef000040 	svc	0x00000040
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 680:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 688:	e12fff1e 	bx	lr

0000068c <sbrk>:
 68c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 690:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 694:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 698:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 69c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a0:	e3a0000c 	mov	r0, #12
 6a4:	ef000040 	svc	0x00000040
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6bc:	e12fff1e 	bx	lr

000006c0 <sleep>:
 6c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d4:	e3a0000d 	mov	r0, #13
 6d8:	ef000040 	svc	0x00000040
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f0:	e12fff1e 	bx	lr

000006f4 <uptime>:
 6f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 700:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 704:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 708:	e3a0000e 	mov	r0, #14
 70c:	ef000040 	svc	0x00000040
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 71c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 720:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 724:	e12fff1e 	bx	lr

00000728 <printint>:
 728:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 72c:	e1a09fa1 	lsr	r9, r1, #31
 730:	e3530000 	cmp	r3, #0
 734:	03a09000 	moveq	r9, #0
 738:	12099001 	andne	r9, r9, #1
 73c:	e28db01c 	add	fp, sp, #28
 740:	e3590000 	cmp	r9, #0
 744:	e3008b80 	movw	r8, #2944	; 0xb80
 748:	1261e000 	rsbne	lr, r1, #0
 74c:	e3408000 	movt	r8, #0
 750:	e24b602d 	sub	r6, fp, #45	; 0x2d
 754:	e1a04000 	mov	r4, r0
 758:	13a09001 	movne	r9, #1
 75c:	01a0e001 	moveq	lr, r1
 760:	e3a07000 	mov	r7, #0
 764:	e3a05001 	mov	r5, #1
 768:	e24dd018 	sub	sp, sp, #24
 76c:	e3a0c000 	mov	ip, #0
 770:	e3a0301f 	mov	r3, #31
 774:	e1a0100c 	mov	r1, ip
 778:	e1a0033e 	lsr	r0, lr, r3
 77c:	e2000001 	and	r0, r0, #1
 780:	e1801081 	orr	r1, r0, r1, lsl #1
 784:	e1520001 	cmp	r2, r1
 788:	90411002 	subls	r1, r1, r2
 78c:	918cc315 	orrls	ip, ip, r5, lsl r3
 790:	e2533001 	subs	r3, r3, #1
 794:	2afffff7 	bcs	778 <printint+0x50>
 798:	e061e29c 	mls	r1, ip, r2, lr
 79c:	e35c0000 	cmp	ip, #0
 7a0:	e1a0e00c 	mov	lr, ip
 7a4:	e2873001 	add	r3, r7, #1
 7a8:	e7d81001 	ldrb	r1, [r8, r1]
 7ac:	e5e61001 	strb	r1, [r6, #1]!
 7b0:	11a07003 	movne	r7, r3
 7b4:	1affffec 	bne	76c <printint+0x44>
 7b8:	e3590000 	cmp	r9, #0
 7bc:	124b201c 	subne	r2, fp, #28
 7c0:	10822003 	addne	r2, r2, r3
 7c4:	13a0102d 	movne	r1, #45	; 0x2d
 7c8:	12873002 	addne	r3, r7, #2
 7cc:	15421010 	strbne	r1, [r2, #-16]
 7d0:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7d4:	e2435001 	sub	r5, r3, #1
 7d8:	e0826003 	add	r6, r2, r3
 7dc:	e5763001 	ldrb	r3, [r6, #-1]!
 7e0:	e2455001 	sub	r5, r5, #1
 7e4:	e3a02001 	mov	r2, #1
 7e8:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7ec:	e1a00004 	mov	r0, r4
 7f0:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7f4:	ebfffefb 	bl	3e8 <write>
 7f8:	e3750001 	cmn	r5, #1
 7fc:	1afffff6 	bne	7dc <printint+0xb4>
 800:	e24bd01c 	sub	sp, fp, #28
 804:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000808 <div>:
 808:	e92d4810 	push	{r4, fp, lr}
 80c:	e3a02000 	mov	r2, #0
 810:	e28db008 	add	fp, sp, #8
 814:	e1a0e000 	mov	lr, r0
 818:	e3a0301f 	mov	r3, #31
 81c:	e1a00002 	mov	r0, r2
 820:	e3a04001 	mov	r4, #1
 824:	e1a0c33e 	lsr	ip, lr, r3
 828:	e20cc001 	and	ip, ip, #1
 82c:	e18c2082 	orr	r2, ip, r2, lsl #1
 830:	e1520001 	cmp	r2, r1
 834:	20422001 	subcs	r2, r2, r1
 838:	21800314 	orrcs	r0, r0, r4, lsl r3
 83c:	e2533001 	subs	r3, r3, #1
 840:	2afffff7 	bcs	824 <div+0x1c>
 844:	e8bd8810 	pop	{r4, fp, pc}

00000848 <printf>:
 848:	e92d000e 	push	{r1, r2, r3}
 84c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 850:	e28db018 	add	fp, sp, #24
 854:	e24dd008 	sub	sp, sp, #8
 858:	e59b6004 	ldr	r6, [fp, #4]
 85c:	e5d64000 	ldrb	r4, [r6]
 860:	e3540000 	cmp	r4, #0
 864:	0a00002b 	beq	918 <printf+0xd0>
 868:	e1a07000 	mov	r7, r0
 86c:	e28b8008 	add	r8, fp, #8
 870:	e3a05000 	mov	r5, #0
 874:	ea00000a 	b	8a4 <printf+0x5c>
 878:	e3540025 	cmp	r4, #37	; 0x25
 87c:	01a05004 	moveq	r5, r4
 880:	0a000004 	beq	898 <printf+0x50>
 884:	e24b1018 	sub	r1, fp, #24
 888:	e3a02001 	mov	r2, #1
 88c:	e1a00007 	mov	r0, r7
 890:	e5614006 	strb	r4, [r1, #-6]!
 894:	ebfffed3 	bl	3e8 <write>
 898:	e5f64001 	ldrb	r4, [r6, #1]!
 89c:	e3540000 	cmp	r4, #0
 8a0:	0a00001c 	beq	918 <printf+0xd0>
 8a4:	e3550000 	cmp	r5, #0
 8a8:	0afffff2 	beq	878 <printf+0x30>
 8ac:	e3550025 	cmp	r5, #37	; 0x25
 8b0:	1afffff8 	bne	898 <printf+0x50>
 8b4:	e3540064 	cmp	r4, #100	; 0x64
 8b8:	0a000037 	beq	99c <printf+0x154>
 8bc:	e20430f7 	and	r3, r4, #247	; 0xf7
 8c0:	e3530070 	cmp	r3, #112	; 0x70
 8c4:	0a000017 	beq	928 <printf+0xe0>
 8c8:	e3540073 	cmp	r4, #115	; 0x73
 8cc:	0a00001c 	beq	944 <printf+0xfc>
 8d0:	e3540063 	cmp	r4, #99	; 0x63
 8d4:	0a000037 	beq	9b8 <printf+0x170>
 8d8:	e3540025 	cmp	r4, #37	; 0x25
 8dc:	0a000027 	beq	980 <printf+0x138>
 8e0:	e3a02001 	mov	r2, #1
 8e4:	e24b1019 	sub	r1, fp, #25
 8e8:	e1a00007 	mov	r0, r7
 8ec:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8f0:	ebfffebc 	bl	3e8 <write>
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e24b101a 	sub	r1, fp, #26
 8fc:	e1a00007 	mov	r0, r7
 900:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 904:	ebfffeb7 	bl	3e8 <write>
 908:	e5f64001 	ldrb	r4, [r6, #1]!
 90c:	e3a05000 	mov	r5, #0
 910:	e3540000 	cmp	r4, #0
 914:	1affffe2 	bne	8a4 <printf+0x5c>
 918:	e24bd018 	sub	sp, fp, #24
 91c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 920:	e28dd00c 	add	sp, sp, #12
 924:	e12fff1e 	bx	lr
 928:	e3a03000 	mov	r3, #0
 92c:	e3a02010 	mov	r2, #16
 930:	e4981004 	ldr	r1, [r8], #4
 934:	e1a00007 	mov	r0, r7
 938:	ebffff7a 	bl	728 <printint>
 93c:	e3a05000 	mov	r5, #0
 940:	eaffffd4 	b	898 <printf+0x50>
 944:	e4984004 	ldr	r4, [r8], #4
 948:	e3540000 	cmp	r4, #0
 94c:	0a000021 	beq	9d8 <printf+0x190>
 950:	e5d45000 	ldrb	r5, [r4]
 954:	e3550000 	cmp	r5, #0
 958:	0affffce 	beq	898 <printf+0x50>
 95c:	e3a02001 	mov	r2, #1
 960:	e24b101d 	sub	r1, fp, #29
 964:	e1a00007 	mov	r0, r7
 968:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 96c:	ebfffe9d 	bl	3e8 <write>
 970:	e5f45001 	ldrb	r5, [r4, #1]!
 974:	e3550000 	cmp	r5, #0
 978:	1afffff7 	bne	95c <printf+0x114>
 97c:	eaffffc5 	b	898 <printf+0x50>
 980:	e24b1018 	sub	r1, fp, #24
 984:	e3a02001 	mov	r2, #1
 988:	e1a00007 	mov	r0, r7
 98c:	e5615003 	strb	r5, [r1, #-3]!
 990:	e3a05000 	mov	r5, #0
 994:	ebfffe93 	bl	3e8 <write>
 998:	eaffffbe 	b	898 <printf+0x50>
 99c:	e3a03001 	mov	r3, #1
 9a0:	e3a0200a 	mov	r2, #10
 9a4:	e4981004 	ldr	r1, [r8], #4
 9a8:	e1a00007 	mov	r0, r7
 9ac:	ebffff5d 	bl	728 <printint>
 9b0:	e3a05000 	mov	r5, #0
 9b4:	eaffffb7 	b	898 <printf+0x50>
 9b8:	e4983004 	ldr	r3, [r8], #4
 9bc:	e24b1018 	sub	r1, fp, #24
 9c0:	e3a02001 	mov	r2, #1
 9c4:	e1a00007 	mov	r0, r7
 9c8:	e3a05000 	mov	r5, #0
 9cc:	e5613004 	strb	r3, [r1, #-4]!
 9d0:	ebfffe84 	bl	3e8 <write>
 9d4:	eaffffaf 	b	898 <printf+0x50>
 9d8:	e3004b94 	movw	r4, #2964	; 0xb94
 9dc:	e3a05028 	mov	r5, #40	; 0x28
 9e0:	e3404000 	movt	r4, #0
 9e4:	eaffffdc 	b	95c <printf+0x114>

000009e8 <free>:
 9e8:	e300cb9c 	movw	ip, #2972	; 0xb9c
 9ec:	e340c000 	movt	ip, #0
 9f0:	e92d4810 	push	{r4, fp, lr}
 9f4:	e2401008 	sub	r1, r0, #8
 9f8:	e28db008 	add	fp, sp, #8
 9fc:	e59c3000 	ldr	r3, [ip]
 a00:	ea000004 	b	a18 <free+0x30>
 a04:	e1510002 	cmp	r1, r2
 a08:	3a000009 	bcc	a34 <free+0x4c>
 a0c:	e1530002 	cmp	r3, r2
 a10:	2a000007 	bcs	a34 <free+0x4c>
 a14:	e1a03002 	mov	r3, r2
 a18:	e1530001 	cmp	r3, r1
 a1c:	e5932000 	ldr	r2, [r3]
 a20:	3afffff7 	bcc	a04 <free+0x1c>
 a24:	e1530002 	cmp	r3, r2
 a28:	3afffff9 	bcc	a14 <free+0x2c>
 a2c:	e1510002 	cmp	r1, r2
 a30:	2afffff7 	bcs	a14 <free+0x2c>
 a34:	e510e004 	ldr	lr, [r0, #-4]
 a38:	e58c3000 	str	r3, [ip]
 a3c:	e081418e 	add	r4, r1, lr, lsl #3
 a40:	e1520004 	cmp	r2, r4
 a44:	05922004 	ldreq	r2, [r2, #4]
 a48:	0082e00e 	addeq	lr, r2, lr
 a4c:	0500e004 	streq	lr, [r0, #-4]
 a50:	05932000 	ldreq	r2, [r3]
 a54:	05922000 	ldreq	r2, [r2]
 a58:	e5002008 	str	r2, [r0, #-8]
 a5c:	e5932004 	ldr	r2, [r3, #4]
 a60:	e083e182 	add	lr, r3, r2, lsl #3
 a64:	e151000e 	cmp	r1, lr
 a68:	15831000 	strne	r1, [r3]
 a6c:	05101004 	ldreq	r1, [r0, #-4]
 a70:	00812002 	addeq	r2, r1, r2
 a74:	05832004 	streq	r2, [r3, #4]
 a78:	05102008 	ldreq	r2, [r0, #-8]
 a7c:	05832000 	streq	r2, [r3]
 a80:	e8bd8810 	pop	{r4, fp, pc}

00000a84 <malloc>:
 a84:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 a88:	e3007b9c 	movw	r7, #2972	; 0xb9c
 a8c:	e3407000 	movt	r7, #0
 a90:	e2804007 	add	r4, r0, #7
 a94:	e28db014 	add	fp, sp, #20
 a98:	e5973000 	ldr	r3, [r7]
 a9c:	e1a041a4 	lsr	r4, r4, #3
 aa0:	e2844001 	add	r4, r4, #1
 aa4:	e3530000 	cmp	r3, #0
 aa8:	0a000027 	beq	b4c <malloc+0xc8>
 aac:	e5930000 	ldr	r0, [r3]
 ab0:	e5902004 	ldr	r2, [r0, #4]
 ab4:	e1540002 	cmp	r4, r2
 ab8:	9a000019 	bls	b24 <malloc+0xa0>
 abc:	e3540a01 	cmp	r4, #4096	; 0x1000
 ac0:	21a05004 	movcs	r5, r4
 ac4:	33a05a01 	movcc	r5, #4096	; 0x1000
 ac8:	e1a06185 	lsl	r6, r5, #3
 acc:	ea000003 	b	ae0 <malloc+0x5c>
 ad0:	e5930000 	ldr	r0, [r3]
 ad4:	e5902004 	ldr	r2, [r0, #4]
 ad8:	e1540002 	cmp	r4, r2
 adc:	9a000010 	bls	b24 <malloc+0xa0>
 ae0:	e5972000 	ldr	r2, [r7]
 ae4:	e1a03000 	mov	r3, r0
 ae8:	e1520000 	cmp	r2, r0
 aec:	1afffff7 	bne	ad0 <malloc+0x4c>
 af0:	e1a00006 	mov	r0, r6
 af4:	ebfffee4 	bl	68c <sbrk>
 af8:	e1a03000 	mov	r3, r0
 afc:	e3730001 	cmn	r3, #1
 b00:	e2800008 	add	r0, r0, #8
 b04:	0a000004 	beq	b1c <malloc+0x98>
 b08:	e5835004 	str	r5, [r3, #4]
 b0c:	ebffffb5 	bl	9e8 <free>
 b10:	e5973000 	ldr	r3, [r7]
 b14:	e3530000 	cmp	r3, #0
 b18:	1affffec 	bne	ad0 <malloc+0x4c>
 b1c:	e3a00000 	mov	r0, #0
 b20:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b24:	e1540002 	cmp	r4, r2
 b28:	e5873000 	str	r3, [r7]
 b2c:	10422004 	subne	r2, r2, r4
 b30:	15802004 	strne	r2, [r0, #4]
 b34:	05902000 	ldreq	r2, [r0]
 b38:	10800182 	addne	r0, r0, r2, lsl #3
 b3c:	e2800008 	add	r0, r0, #8
 b40:	15004004 	strne	r4, [r0, #-4]
 b44:	05832000 	streq	r2, [r3]
 b48:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b4c:	e2870004 	add	r0, r7, #4
 b50:	e5873008 	str	r3, [r7, #8]
 b54:	e5870000 	str	r0, [r7]
 b58:	e5870004 	str	r0, [r7, #4]
 b5c:	eaffffd6 	b	abc <malloc+0x38>
