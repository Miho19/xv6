
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   4:	e2506000 	subs	r6, r0, #0
   8:	e28db014 	add	fp, sp, #20
   c:	da00000a 	ble	3c <main+0x3c>
  10:	e3560001 	cmp	r6, #1
  14:	11a05001 	movne	r5, r1
  18:	13a04001 	movne	r4, #1
  1c:	0a000005 	beq	38 <main+0x38>
  20:	e5b50004 	ldr	r0, [r5, #4]!
  24:	e2844001 	add	r4, r4, #1
  28:	eb000084 	bl	240 <atoi>
  2c:	eb0000fd 	bl	428 <kill>
  30:	e1560004 	cmp	r6, r4
  34:	1afffff9 	bne	20 <main+0x20>
  38:	eb0000ac 	bl	2f0 <exit>
  3c:	e3001b38 	movw	r1, #2872	; 0xb38
  40:	e3a00002 	mov	r0, #2
  44:	e3401000 	movt	r1, #0
  48:	eb0001f4 	bl	820 <printf>
  4c:	eafffff9 	b	38 <main+0x38>

00000050 <strcpy>:
  50:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  54:	e2402001 	sub	r2, r0, #1
  58:	e28db000 	add	fp, sp, #0
  5c:	e4d13001 	ldrb	r3, [r1], #1
  60:	e3530000 	cmp	r3, #0
  64:	e5e23001 	strb	r3, [r2, #1]!
  68:	1afffffb 	bne	5c <strcpy+0xc>
  6c:	e28bd000 	add	sp, fp, #0
  70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  74:	e12fff1e 	bx	lr

00000078 <strcmp>:
  78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  7c:	e28db000 	add	fp, sp, #0
  80:	e5d03000 	ldrb	r3, [r0]
  84:	e5d12000 	ldrb	r2, [r1]
  88:	e3530000 	cmp	r3, #0
  8c:	1a000004 	bne	a4 <strcmp+0x2c>
  90:	ea000005 	b	ac <strcmp+0x34>
  94:	e5f03001 	ldrb	r3, [r0, #1]!
  98:	e3530000 	cmp	r3, #0
  9c:	0a000006 	beq	bc <strcmp+0x44>
  a0:	e5f12001 	ldrb	r2, [r1, #1]!
  a4:	e1530002 	cmp	r3, r2
  a8:	0afffff9 	beq	94 <strcmp+0x1c>
  ac:	e0430002 	sub	r0, r3, r2
  b0:	e28bd000 	add	sp, fp, #0
  b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  b8:	e12fff1e 	bx	lr
  bc:	e5d12001 	ldrb	r2, [r1, #1]
  c0:	e0430002 	sub	r0, r3, r2
  c4:	e28bd000 	add	sp, fp, #0
  c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  cc:	e12fff1e 	bx	lr

000000d0 <strlen>:
  d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d4:	e28db000 	add	fp, sp, #0
  d8:	e5d03000 	ldrb	r3, [r0]
  dc:	e3530000 	cmp	r3, #0
  e0:	0a000009 	beq	10c <strlen+0x3c>
  e4:	e1a02000 	mov	r2, r0
  e8:	e3a03000 	mov	r3, #0
  ec:	e5f21001 	ldrb	r1, [r2, #1]!
  f0:	e2833001 	add	r3, r3, #1
  f4:	e3510000 	cmp	r1, #0
  f8:	e1a00003 	mov	r0, r3
  fc:	1afffffa 	bne	ec <strlen+0x1c>
 100:	e28bd000 	add	sp, fp, #0
 104:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 108:	e12fff1e 	bx	lr
 10c:	e1a00003 	mov	r0, r3
 110:	eafffffa 	b	100 <strlen+0x30>

00000114 <memset>:
 114:	e3520000 	cmp	r2, #0
 118:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 11c:	e28db000 	add	fp, sp, #0
 120:	0a000004 	beq	138 <memset+0x24>
 124:	e6ef1071 	uxtb	r1, r1
 128:	e0802002 	add	r2, r0, r2
 12c:	e4c01001 	strb	r1, [r0], #1
 130:	e1520000 	cmp	r2, r0
 134:	1afffffc 	bne	12c <memset+0x18>
 138:	e28bd000 	add	sp, fp, #0
 13c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 140:	e12fff1e 	bx	lr

00000144 <strchr>:
 144:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 148:	e28db000 	add	fp, sp, #0
 14c:	e5d02000 	ldrb	r2, [r0]
 150:	e3520000 	cmp	r2, #0
 154:	0a00000b 	beq	188 <strchr+0x44>
 158:	e1510002 	cmp	r1, r2
 15c:	1a000002 	bne	16c <strchr+0x28>
 160:	ea000005 	b	17c <strchr+0x38>
 164:	e1530001 	cmp	r3, r1
 168:	0a000003 	beq	17c <strchr+0x38>
 16c:	e5f03001 	ldrb	r3, [r0, #1]!
 170:	e3530000 	cmp	r3, #0
 174:	1afffffa 	bne	164 <strchr+0x20>
 178:	e1a00003 	mov	r0, r3
 17c:	e28bd000 	add	sp, fp, #0
 180:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 184:	e12fff1e 	bx	lr
 188:	e1a00002 	mov	r0, r2
 18c:	eafffffa 	b	17c <strchr+0x38>

00000190 <gets>:
 190:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 194:	e1a08000 	mov	r8, r0
 198:	e28db018 	add	fp, sp, #24
 19c:	e1a07001 	mov	r7, r1
 1a0:	e24dd00c 	sub	sp, sp, #12
 1a4:	e2406001 	sub	r6, r0, #1
 1a8:	e3a05000 	mov	r5, #0
 1ac:	ea000008 	b	1d4 <gets+0x44>
 1b0:	eb000075 	bl	38c <read>
 1b4:	e3500000 	cmp	r0, #0
 1b8:	da00000b 	ble	1ec <gets+0x5c>
 1bc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1c0:	e1a05004 	mov	r5, r4
 1c4:	e353000d 	cmp	r3, #13
 1c8:	1353000a 	cmpne	r3, #10
 1cc:	e5e63001 	strb	r3, [r6, #1]!
 1d0:	0a000005 	beq	1ec <gets+0x5c>
 1d4:	e3a02001 	mov	r2, #1
 1d8:	e0854002 	add	r4, r5, r2
 1dc:	e1540007 	cmp	r4, r7
 1e0:	e24b101d 	sub	r1, fp, #29
 1e4:	e3a00000 	mov	r0, #0
 1e8:	bafffff0 	blt	1b0 <gets+0x20>
 1ec:	e3a03000 	mov	r3, #0
 1f0:	e1a00008 	mov	r0, r8
 1f4:	e7c83005 	strb	r3, [r8, r5]
 1f8:	e24bd018 	sub	sp, fp, #24
 1fc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000200 <stat>:
 200:	e92d4830 	push	{r4, r5, fp, lr}
 204:	e1a04001 	mov	r4, r1
 208:	e28db00c 	add	fp, sp, #12
 20c:	e3a01000 	mov	r1, #0
 210:	eb00009e 	bl	490 <open>
 214:	e2505000 	subs	r5, r0, #0
 218:	ba000006 	blt	238 <stat+0x38>
 21c:	e1a01004 	mov	r1, r4
 220:	eb0000c1 	bl	52c <fstat>
 224:	e1a04000 	mov	r4, r0
 228:	e1a00005 	mov	r0, r5
 22c:	eb000070 	bl	3f4 <close>
 230:	e1a00004 	mov	r0, r4
 234:	e8bd8830 	pop	{r4, r5, fp, pc}
 238:	e3e04000 	mvn	r4, #0
 23c:	eafffffb 	b	230 <stat+0x30>

00000240 <atoi>:
 240:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 244:	e28db000 	add	fp, sp, #0
 248:	e5d02000 	ldrb	r2, [r0]
 24c:	e2423030 	sub	r3, r2, #48	; 0x30
 250:	e3530009 	cmp	r3, #9
 254:	e3a03000 	mov	r3, #0
 258:	8a000006 	bhi	278 <atoi+0x38>
 25c:	e3a0c00a 	mov	ip, #10
 260:	e023239c 	mla	r3, ip, r3, r2
 264:	e5f02001 	ldrb	r2, [r0, #1]!
 268:	e2421030 	sub	r1, r2, #48	; 0x30
 26c:	e3510009 	cmp	r1, #9
 270:	e2433030 	sub	r3, r3, #48	; 0x30
 274:	9afffff9 	bls	260 <atoi+0x20>
 278:	e1a00003 	mov	r0, r3
 27c:	e28bd000 	add	sp, fp, #0
 280:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 284:	e12fff1e 	bx	lr

00000288 <memmove>:
 288:	e3520000 	cmp	r2, #0
 28c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 290:	e28db000 	add	fp, sp, #0
 294:	da000005 	ble	2b0 <memmove+0x28>
 298:	e0812002 	add	r2, r1, r2
 29c:	e2403001 	sub	r3, r0, #1
 2a0:	e4d1c001 	ldrb	ip, [r1], #1
 2a4:	e1510002 	cmp	r1, r2
 2a8:	e5e3c001 	strb	ip, [r3, #1]!
 2ac:	1afffffb 	bne	2a0 <memmove+0x18>
 2b0:	e28bd000 	add	sp, fp, #0
 2b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b8:	e12fff1e 	bx	lr

000002bc <fork>:
 2bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2d0:	e3a00001 	mov	r0, #1
 2d4:	ef000040 	svc	0x00000040
 2d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2ec:	e12fff1e 	bx	lr

000002f0 <exit>:
 2f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 300:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 304:	e3a00002 	mov	r0, #2
 308:	ef000040 	svc	0x00000040
 30c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 310:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 314:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 318:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 31c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 320:	e12fff1e 	bx	lr

00000324 <wait>:
 324:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 328:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 32c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 330:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 334:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 338:	e3a00003 	mov	r0, #3
 33c:	ef000040 	svc	0x00000040
 340:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 344:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 348:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 34c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 350:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <pipe>:
 358:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 35c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 360:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 364:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 368:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 36c:	e3a00004 	mov	r0, #4
 370:	ef000040 	svc	0x00000040
 374:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 378:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 37c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 380:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 384:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 388:	e12fff1e 	bx	lr

0000038c <read>:
 38c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 390:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 394:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 398:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 39c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a0:	e3a00005 	mov	r0, #5
 3a4:	ef000040 	svc	0x00000040
 3a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3bc:	e12fff1e 	bx	lr

000003c0 <write>:
 3c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d4:	e3a00010 	mov	r0, #16
 3d8:	ef000040 	svc	0x00000040
 3dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f0:	e12fff1e 	bx	lr

000003f4 <close>:
 3f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 400:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 404:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 408:	e3a00015 	mov	r0, #21
 40c:	ef000040 	svc	0x00000040
 410:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 41c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 420:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 424:	e12fff1e 	bx	lr

00000428 <kill>:
 428:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 42c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 430:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 434:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 438:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 43c:	e3a00006 	mov	r0, #6
 440:	ef000040 	svc	0x00000040
 444:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 450:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 454:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 458:	e12fff1e 	bx	lr

0000045c <exec>:
 45c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 460:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 464:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 468:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 46c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 470:	e3a00007 	mov	r0, #7
 474:	ef000040 	svc	0x00000040
 478:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 484:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 488:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 48c:	e12fff1e 	bx	lr

00000490 <open>:
 490:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 494:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 498:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 49c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a4:	e3a0000f 	mov	r0, #15
 4a8:	ef000040 	svc	0x00000040
 4ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c0:	e12fff1e 	bx	lr

000004c4 <mknod>:
 4c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d8:	e3a00011 	mov	r0, #17
 4dc:	ef000040 	svc	0x00000040
 4e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f4:	e12fff1e 	bx	lr

000004f8 <unlink>:
 4f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 500:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 504:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 508:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 50c:	e3a00012 	mov	r0, #18
 510:	ef000040 	svc	0x00000040
 514:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 520:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 524:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 528:	e12fff1e 	bx	lr

0000052c <fstat>:
 52c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 530:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 534:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 538:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 53c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 540:	e3a00008 	mov	r0, #8
 544:	ef000040 	svc	0x00000040
 548:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 554:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 558:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 55c:	e12fff1e 	bx	lr

00000560 <link>:
 560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 564:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 568:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 56c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 570:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 574:	e3a00013 	mov	r0, #19
 578:	ef000040 	svc	0x00000040
 57c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 588:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 58c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 590:	e12fff1e 	bx	lr

00000594 <mkdir>:
 594:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 598:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 59c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a8:	e3a00014 	mov	r0, #20
 5ac:	ef000040 	svc	0x00000040
 5b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c4:	e12fff1e 	bx	lr

000005c8 <chdir>:
 5c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5dc:	e3a00009 	mov	r0, #9
 5e0:	ef000040 	svc	0x00000040
 5e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f8:	e12fff1e 	bx	lr

000005fc <dup>:
 5fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 600:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 604:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 608:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 60c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 610:	e3a0000a 	mov	r0, #10
 614:	ef000040 	svc	0x00000040
 618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 624:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 628:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 62c:	e12fff1e 	bx	lr

00000630 <getpid>:
 630:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 634:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 638:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 63c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 640:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 644:	e3a0000b 	mov	r0, #11
 648:	ef000040 	svc	0x00000040
 64c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 658:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 65c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 660:	e12fff1e 	bx	lr

00000664 <sbrk>:
 664:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 668:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 66c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 670:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 674:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 678:	e3a0000c 	mov	r0, #12
 67c:	ef000040 	svc	0x00000040
 680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 68c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 694:	e12fff1e 	bx	lr

00000698 <sleep>:
 698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 69c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ac:	e3a0000d 	mov	r0, #13
 6b0:	ef000040 	svc	0x00000040
 6b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c8:	e12fff1e 	bx	lr

000006cc <uptime>:
 6cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e0:	e3a0000e 	mov	r0, #14
 6e4:	ef000040 	svc	0x00000040
 6e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6fc:	e12fff1e 	bx	lr

00000700 <printint>:
 700:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 704:	e1a09fa1 	lsr	r9, r1, #31
 708:	e3530000 	cmp	r3, #0
 70c:	03a09000 	moveq	r9, #0
 710:	12099001 	andne	r9, r9, #1
 714:	e28db01c 	add	fp, sp, #28
 718:	e3590000 	cmp	r9, #0
 71c:	e3008b4c 	movw	r8, #2892	; 0xb4c
 720:	1261e000 	rsbne	lr, r1, #0
 724:	e3408000 	movt	r8, #0
 728:	e24b602d 	sub	r6, fp, #45	; 0x2d
 72c:	e1a04000 	mov	r4, r0
 730:	13a09001 	movne	r9, #1
 734:	01a0e001 	moveq	lr, r1
 738:	e3a07000 	mov	r7, #0
 73c:	e3a05001 	mov	r5, #1
 740:	e24dd018 	sub	sp, sp, #24
 744:	e3a0c000 	mov	ip, #0
 748:	e3a0301f 	mov	r3, #31
 74c:	e1a0100c 	mov	r1, ip
 750:	e1a0033e 	lsr	r0, lr, r3
 754:	e2000001 	and	r0, r0, #1
 758:	e1801081 	orr	r1, r0, r1, lsl #1
 75c:	e1520001 	cmp	r2, r1
 760:	90411002 	subls	r1, r1, r2
 764:	918cc315 	orrls	ip, ip, r5, lsl r3
 768:	e2533001 	subs	r3, r3, #1
 76c:	2afffff7 	bcs	750 <printint+0x50>
 770:	e061e29c 	mls	r1, ip, r2, lr
 774:	e35c0000 	cmp	ip, #0
 778:	e1a0e00c 	mov	lr, ip
 77c:	e2873001 	add	r3, r7, #1
 780:	e7d81001 	ldrb	r1, [r8, r1]
 784:	e5e61001 	strb	r1, [r6, #1]!
 788:	11a07003 	movne	r7, r3
 78c:	1affffec 	bne	744 <printint+0x44>
 790:	e3590000 	cmp	r9, #0
 794:	124b201c 	subne	r2, fp, #28
 798:	10822003 	addne	r2, r2, r3
 79c:	13a0102d 	movne	r1, #45	; 0x2d
 7a0:	12873002 	addne	r3, r7, #2
 7a4:	15421010 	strbne	r1, [r2, #-16]
 7a8:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7ac:	e2435001 	sub	r5, r3, #1
 7b0:	e0826003 	add	r6, r2, r3
 7b4:	e5763001 	ldrb	r3, [r6, #-1]!
 7b8:	e2455001 	sub	r5, r5, #1
 7bc:	e3a02001 	mov	r2, #1
 7c0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7c4:	e1a00004 	mov	r0, r4
 7c8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7cc:	ebfffefb 	bl	3c0 <write>
 7d0:	e3750001 	cmn	r5, #1
 7d4:	1afffff6 	bne	7b4 <printint+0xb4>
 7d8:	e24bd01c 	sub	sp, fp, #28
 7dc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007e0 <div>:
 7e0:	e92d4810 	push	{r4, fp, lr}
 7e4:	e3a02000 	mov	r2, #0
 7e8:	e28db008 	add	fp, sp, #8
 7ec:	e1a0e000 	mov	lr, r0
 7f0:	e3a0301f 	mov	r3, #31
 7f4:	e1a00002 	mov	r0, r2
 7f8:	e3a04001 	mov	r4, #1
 7fc:	e1a0c33e 	lsr	ip, lr, r3
 800:	e20cc001 	and	ip, ip, #1
 804:	e18c2082 	orr	r2, ip, r2, lsl #1
 808:	e1520001 	cmp	r2, r1
 80c:	20422001 	subcs	r2, r2, r1
 810:	21800314 	orrcs	r0, r0, r4, lsl r3
 814:	e2533001 	subs	r3, r3, #1
 818:	2afffff7 	bcs	7fc <div+0x1c>
 81c:	e8bd8810 	pop	{r4, fp, pc}

00000820 <printf>:
 820:	e92d000e 	push	{r1, r2, r3}
 824:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 828:	e28db018 	add	fp, sp, #24
 82c:	e24dd008 	sub	sp, sp, #8
 830:	e59b6004 	ldr	r6, [fp, #4]
 834:	e5d64000 	ldrb	r4, [r6]
 838:	e3540000 	cmp	r4, #0
 83c:	0a00002b 	beq	8f0 <printf+0xd0>
 840:	e1a07000 	mov	r7, r0
 844:	e28b8008 	add	r8, fp, #8
 848:	e3a05000 	mov	r5, #0
 84c:	ea00000a 	b	87c <printf+0x5c>
 850:	e3540025 	cmp	r4, #37	; 0x25
 854:	01a05004 	moveq	r5, r4
 858:	0a000004 	beq	870 <printf+0x50>
 85c:	e24b1018 	sub	r1, fp, #24
 860:	e3a02001 	mov	r2, #1
 864:	e1a00007 	mov	r0, r7
 868:	e5614006 	strb	r4, [r1, #-6]!
 86c:	ebfffed3 	bl	3c0 <write>
 870:	e5f64001 	ldrb	r4, [r6, #1]!
 874:	e3540000 	cmp	r4, #0
 878:	0a00001c 	beq	8f0 <printf+0xd0>
 87c:	e3550000 	cmp	r5, #0
 880:	0afffff2 	beq	850 <printf+0x30>
 884:	e3550025 	cmp	r5, #37	; 0x25
 888:	1afffff8 	bne	870 <printf+0x50>
 88c:	e3540064 	cmp	r4, #100	; 0x64
 890:	0a000037 	beq	974 <printf+0x154>
 894:	e20430f7 	and	r3, r4, #247	; 0xf7
 898:	e3530070 	cmp	r3, #112	; 0x70
 89c:	0a000017 	beq	900 <printf+0xe0>
 8a0:	e3540073 	cmp	r4, #115	; 0x73
 8a4:	0a00001c 	beq	91c <printf+0xfc>
 8a8:	e3540063 	cmp	r4, #99	; 0x63
 8ac:	0a000037 	beq	990 <printf+0x170>
 8b0:	e3540025 	cmp	r4, #37	; 0x25
 8b4:	0a000027 	beq	958 <printf+0x138>
 8b8:	e3a02001 	mov	r2, #1
 8bc:	e24b1019 	sub	r1, fp, #25
 8c0:	e1a00007 	mov	r0, r7
 8c4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8c8:	ebfffebc 	bl	3c0 <write>
 8cc:	e3a02001 	mov	r2, #1
 8d0:	e24b101a 	sub	r1, fp, #26
 8d4:	e1a00007 	mov	r0, r7
 8d8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8dc:	ebfffeb7 	bl	3c0 <write>
 8e0:	e5f64001 	ldrb	r4, [r6, #1]!
 8e4:	e3a05000 	mov	r5, #0
 8e8:	e3540000 	cmp	r4, #0
 8ec:	1affffe2 	bne	87c <printf+0x5c>
 8f0:	e24bd018 	sub	sp, fp, #24
 8f4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 8f8:	e28dd00c 	add	sp, sp, #12
 8fc:	e12fff1e 	bx	lr
 900:	e3a03000 	mov	r3, #0
 904:	e3a02010 	mov	r2, #16
 908:	e4981004 	ldr	r1, [r8], #4
 90c:	e1a00007 	mov	r0, r7
 910:	ebffff7a 	bl	700 <printint>
 914:	e3a05000 	mov	r5, #0
 918:	eaffffd4 	b	870 <printf+0x50>
 91c:	e4984004 	ldr	r4, [r8], #4
 920:	e3540000 	cmp	r4, #0
 924:	0a000021 	beq	9b0 <printf+0x190>
 928:	e5d45000 	ldrb	r5, [r4]
 92c:	e3550000 	cmp	r5, #0
 930:	0affffce 	beq	870 <printf+0x50>
 934:	e3a02001 	mov	r2, #1
 938:	e24b101d 	sub	r1, fp, #29
 93c:	e1a00007 	mov	r0, r7
 940:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 944:	ebfffe9d 	bl	3c0 <write>
 948:	e5f45001 	ldrb	r5, [r4, #1]!
 94c:	e3550000 	cmp	r5, #0
 950:	1afffff7 	bne	934 <printf+0x114>
 954:	eaffffc5 	b	870 <printf+0x50>
 958:	e24b1018 	sub	r1, fp, #24
 95c:	e3a02001 	mov	r2, #1
 960:	e1a00007 	mov	r0, r7
 964:	e5615003 	strb	r5, [r1, #-3]!
 968:	e3a05000 	mov	r5, #0
 96c:	ebfffe93 	bl	3c0 <write>
 970:	eaffffbe 	b	870 <printf+0x50>
 974:	e3a03001 	mov	r3, #1
 978:	e3a0200a 	mov	r2, #10
 97c:	e4981004 	ldr	r1, [r8], #4
 980:	e1a00007 	mov	r0, r7
 984:	ebffff5d 	bl	700 <printint>
 988:	e3a05000 	mov	r5, #0
 98c:	eaffffb7 	b	870 <printf+0x50>
 990:	e4983004 	ldr	r3, [r8], #4
 994:	e24b1018 	sub	r1, fp, #24
 998:	e3a02001 	mov	r2, #1
 99c:	e1a00007 	mov	r0, r7
 9a0:	e3a05000 	mov	r5, #0
 9a4:	e5613004 	strb	r3, [r1, #-4]!
 9a8:	ebfffe84 	bl	3c0 <write>
 9ac:	eaffffaf 	b	870 <printf+0x50>
 9b0:	e3004b60 	movw	r4, #2912	; 0xb60
 9b4:	e3a05028 	mov	r5, #40	; 0x28
 9b8:	e3404000 	movt	r4, #0
 9bc:	eaffffdc 	b	934 <printf+0x114>

000009c0 <free>:
 9c0:	e300cb68 	movw	ip, #2920	; 0xb68
 9c4:	e340c000 	movt	ip, #0
 9c8:	e92d4810 	push	{r4, fp, lr}
 9cc:	e2401008 	sub	r1, r0, #8
 9d0:	e28db008 	add	fp, sp, #8
 9d4:	e59c3000 	ldr	r3, [ip]
 9d8:	ea000004 	b	9f0 <free+0x30>
 9dc:	e1510002 	cmp	r1, r2
 9e0:	3a000009 	bcc	a0c <free+0x4c>
 9e4:	e1530002 	cmp	r3, r2
 9e8:	2a000007 	bcs	a0c <free+0x4c>
 9ec:	e1a03002 	mov	r3, r2
 9f0:	e1530001 	cmp	r3, r1
 9f4:	e5932000 	ldr	r2, [r3]
 9f8:	3afffff7 	bcc	9dc <free+0x1c>
 9fc:	e1530002 	cmp	r3, r2
 a00:	3afffff9 	bcc	9ec <free+0x2c>
 a04:	e1510002 	cmp	r1, r2
 a08:	2afffff7 	bcs	9ec <free+0x2c>
 a0c:	e510e004 	ldr	lr, [r0, #-4]
 a10:	e58c3000 	str	r3, [ip]
 a14:	e081418e 	add	r4, r1, lr, lsl #3
 a18:	e1520004 	cmp	r2, r4
 a1c:	05922004 	ldreq	r2, [r2, #4]
 a20:	0082e00e 	addeq	lr, r2, lr
 a24:	0500e004 	streq	lr, [r0, #-4]
 a28:	05932000 	ldreq	r2, [r3]
 a2c:	05922000 	ldreq	r2, [r2]
 a30:	e5002008 	str	r2, [r0, #-8]
 a34:	e5932004 	ldr	r2, [r3, #4]
 a38:	e083e182 	add	lr, r3, r2, lsl #3
 a3c:	e151000e 	cmp	r1, lr
 a40:	15831000 	strne	r1, [r3]
 a44:	05101004 	ldreq	r1, [r0, #-4]
 a48:	00812002 	addeq	r2, r1, r2
 a4c:	05832004 	streq	r2, [r3, #4]
 a50:	05102008 	ldreq	r2, [r0, #-8]
 a54:	05832000 	streq	r2, [r3]
 a58:	e8bd8810 	pop	{r4, fp, pc}

00000a5c <malloc>:
 a5c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 a60:	e3007b68 	movw	r7, #2920	; 0xb68
 a64:	e3407000 	movt	r7, #0
 a68:	e2804007 	add	r4, r0, #7
 a6c:	e28db014 	add	fp, sp, #20
 a70:	e5973000 	ldr	r3, [r7]
 a74:	e1a041a4 	lsr	r4, r4, #3
 a78:	e2844001 	add	r4, r4, #1
 a7c:	e3530000 	cmp	r3, #0
 a80:	0a000027 	beq	b24 <malloc+0xc8>
 a84:	e5930000 	ldr	r0, [r3]
 a88:	e5902004 	ldr	r2, [r0, #4]
 a8c:	e1540002 	cmp	r4, r2
 a90:	9a000019 	bls	afc <malloc+0xa0>
 a94:	e3540a01 	cmp	r4, #4096	; 0x1000
 a98:	21a05004 	movcs	r5, r4
 a9c:	33a05a01 	movcc	r5, #4096	; 0x1000
 aa0:	e1a06185 	lsl	r6, r5, #3
 aa4:	ea000003 	b	ab8 <malloc+0x5c>
 aa8:	e5930000 	ldr	r0, [r3]
 aac:	e5902004 	ldr	r2, [r0, #4]
 ab0:	e1540002 	cmp	r4, r2
 ab4:	9a000010 	bls	afc <malloc+0xa0>
 ab8:	e5972000 	ldr	r2, [r7]
 abc:	e1a03000 	mov	r3, r0
 ac0:	e1520000 	cmp	r2, r0
 ac4:	1afffff7 	bne	aa8 <malloc+0x4c>
 ac8:	e1a00006 	mov	r0, r6
 acc:	ebfffee4 	bl	664 <sbrk>
 ad0:	e1a03000 	mov	r3, r0
 ad4:	e3730001 	cmn	r3, #1
 ad8:	e2800008 	add	r0, r0, #8
 adc:	0a000004 	beq	af4 <malloc+0x98>
 ae0:	e5835004 	str	r5, [r3, #4]
 ae4:	ebffffb5 	bl	9c0 <free>
 ae8:	e5973000 	ldr	r3, [r7]
 aec:	e3530000 	cmp	r3, #0
 af0:	1affffec 	bne	aa8 <malloc+0x4c>
 af4:	e3a00000 	mov	r0, #0
 af8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 afc:	e1540002 	cmp	r4, r2
 b00:	e5873000 	str	r3, [r7]
 b04:	10422004 	subne	r2, r2, r4
 b08:	15802004 	strne	r2, [r0, #4]
 b0c:	05902000 	ldreq	r2, [r0]
 b10:	10800182 	addne	r0, r0, r2, lsl #3
 b14:	e2800008 	add	r0, r0, #8
 b18:	15004004 	strne	r4, [r0, #-4]
 b1c:	05832000 	streq	r2, [r3]
 b20:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b24:	e2870004 	add	r0, r7, #4
 b28:	e5873008 	str	r3, [r7, #8]
 b2c:	e5870000 	str	r0, [r7]
 b30:	e5870004 	str	r0, [r7, #4]
 b34:	eaffffd6 	b	a94 <malloc+0x38>
