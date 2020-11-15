
_wc:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
  14:	c3a05001 	movgt	r5, #1
  18:	da000013 	ble	6c <main+0x6c>
  1c:	e3a01000 	mov	r1, #0
  20:	e5940000 	ldr	r0, [r4]
  24:	eb000172 	bl	5f4 <open>
  28:	e2506000 	subs	r6, r0, #0
  2c:	ba000008 	blt	54 <main+0x54>
  30:	e5941000 	ldr	r1, [r4]
  34:	e2855001 	add	r5, r5, #1
  38:	eb000010 	bl	80 <wc>
  3c:	e1a00006 	mov	r0, r6
  40:	eb000144 	bl	558 <close>
  44:	e1570005 	cmp	r7, r5
  48:	e2844004 	add	r4, r4, #4
  4c:	1afffff2 	bne	1c <main+0x1c>
  50:	eb0000f2 	bl	420 <exit>
  54:	e5942000 	ldr	r2, [r4]
  58:	e3001cc4 	movw	r1, #3268	; 0xcc4
  5c:	e3a00001 	mov	r0, #1
  60:	e3401000 	movt	r1, #0
  64:	eb000246 	bl	984 <printf>
  68:	eb0000ec 	bl	420 <exit>
  6c:	e3001cc0 	movw	r1, #3264	; 0xcc0
  70:	e3a00000 	mov	r0, #0
  74:	e3401000 	movt	r1, #0
  78:	eb000000 	bl	80 <wc>
  7c:	eb0000e7 	bl	420 <exit>

00000080 <wc>:
  80:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  84:	e3a04000 	mov	r4, #0
  88:	e28db020 	add	fp, sp, #32
  8c:	e3006c9c 	movw	r6, #3228	; 0xc9c
  90:	e3406000 	movt	r6, #0
  94:	e1a08004 	mov	r8, r4
  98:	e1a07004 	mov	r7, r4
  9c:	e24dd01c 	sub	sp, sp, #28
  a0:	e3003d00 	movw	r3, #3328	; 0xd00
  a4:	e3403000 	movt	r3, #0
  a8:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
  ac:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
  b0:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
  b4:	e50b4028 	str	r4, [fp, #-40]	; 0xffffffd8
  b8:	e3a02c02 	mov	r2, #512	; 0x200
  bc:	e3001d00 	movw	r1, #3328	; 0xd00
  c0:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
  c4:	e3401000 	movt	r1, #0
  c8:	eb000108 	bl	4f0 <read>
  cc:	e2509000 	subs	r9, r0, #0
  d0:	da000017 	ble	134 <wc+0xb4>
  d4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
  d8:	e2495001 	sub	r5, r9, #1
  dc:	e59fa098 	ldr	sl, [pc, #152]	; 17c <wc+0xfc>
  e0:	e0835005 	add	r5, r3, r5
  e4:	ea000001 	b	f0 <wc+0x70>
  e8:	e155000a 	cmp	r5, sl
  ec:	0a00000c 	beq	124 <wc+0xa4>
  f0:	e5fa1001 	ldrb	r1, [sl, #1]!
  f4:	e1a00006 	mov	r0, r6
  f8:	e351000a 	cmp	r1, #10
  fc:	02877001 	addeq	r7, r7, #1
 100:	eb00005b 	bl	274 <strchr>
 104:	e3500000 	cmp	r0, #0
 108:	13a04000 	movne	r4, #0
 10c:	1afffff5 	bne	e8 <wc+0x68>
 110:	e3540000 	cmp	r4, #0
 114:	02888001 	addeq	r8, r8, #1
 118:	03a04001 	moveq	r4, #1
 11c:	e155000a 	cmp	r5, sl
 120:	1afffff2 	bne	f0 <wc+0x70>
 124:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 128:	e0833009 	add	r3, r3, r9
 12c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
 130:	eaffffe0 	b	b8 <wc+0x38>
 134:	1a00000b 	bne	168 <wc+0xe8>
 138:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
 13c:	e3a00001 	mov	r0, #1
 140:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
 144:	e3001cb4 	movw	r1, #3252	; 0xcb4
 148:	e3401000 	movt	r1, #0
 14c:	e58d3004 	str	r3, [sp, #4]
 150:	e1a03008 	mov	r3, r8
 154:	e58d2000 	str	r2, [sp]
 158:	e1a02007 	mov	r2, r7
 15c:	eb000208 	bl	984 <printf>
 160:	e24bd020 	sub	sp, fp, #32
 164:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 168:	e3001ca4 	movw	r1, #3236	; 0xca4
 16c:	e3a00001 	mov	r0, #1
 170:	e3401000 	movt	r1, #0
 174:	eb000202 	bl	984 <printf>
 178:	eb0000a8 	bl	420 <exit>
 17c:	00000cff 	.word	0x00000cff

00000180 <strcpy>:
 180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 184:	e2402001 	sub	r2, r0, #1
 188:	e28db000 	add	fp, sp, #0
 18c:	e4d13001 	ldrb	r3, [r1], #1
 190:	e3530000 	cmp	r3, #0
 194:	e5e23001 	strb	r3, [r2, #1]!
 198:	1afffffb 	bne	18c <strcpy+0xc>
 19c:	e28bd000 	add	sp, fp, #0
 1a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a4:	e12fff1e 	bx	lr

000001a8 <strcmp>:
 1a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ac:	e28db000 	add	fp, sp, #0
 1b0:	e5d03000 	ldrb	r3, [r0]
 1b4:	e5d12000 	ldrb	r2, [r1]
 1b8:	e3530000 	cmp	r3, #0
 1bc:	1a000004 	bne	1d4 <strcmp+0x2c>
 1c0:	ea000005 	b	1dc <strcmp+0x34>
 1c4:	e5f03001 	ldrb	r3, [r0, #1]!
 1c8:	e3530000 	cmp	r3, #0
 1cc:	0a000006 	beq	1ec <strcmp+0x44>
 1d0:	e5f12001 	ldrb	r2, [r1, #1]!
 1d4:	e1530002 	cmp	r3, r2
 1d8:	0afffff9 	beq	1c4 <strcmp+0x1c>
 1dc:	e0430002 	sub	r0, r3, r2
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr
 1ec:	e5d12001 	ldrb	r2, [r1, #1]
 1f0:	e0430002 	sub	r0, r3, r2
 1f4:	e28bd000 	add	sp, fp, #0
 1f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1fc:	e12fff1e 	bx	lr

00000200 <strlen>:
 200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 204:	e28db000 	add	fp, sp, #0
 208:	e5d03000 	ldrb	r3, [r0]
 20c:	e3530000 	cmp	r3, #0
 210:	0a000009 	beq	23c <strlen+0x3c>
 214:	e1a02000 	mov	r2, r0
 218:	e3a03000 	mov	r3, #0
 21c:	e5f21001 	ldrb	r1, [r2, #1]!
 220:	e2833001 	add	r3, r3, #1
 224:	e3510000 	cmp	r1, #0
 228:	e1a00003 	mov	r0, r3
 22c:	1afffffa 	bne	21c <strlen+0x1c>
 230:	e28bd000 	add	sp, fp, #0
 234:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 238:	e12fff1e 	bx	lr
 23c:	e1a00003 	mov	r0, r3
 240:	eafffffa 	b	230 <strlen+0x30>

00000244 <memset>:
 244:	e3520000 	cmp	r2, #0
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
 250:	0a000004 	beq	268 <memset+0x24>
 254:	e6ef1071 	uxtb	r1, r1
 258:	e0802002 	add	r2, r0, r2
 25c:	e4c01001 	strb	r1, [r0], #1
 260:	e1520000 	cmp	r2, r0
 264:	1afffffc 	bne	25c <memset+0x18>
 268:	e28bd000 	add	sp, fp, #0
 26c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 270:	e12fff1e 	bx	lr

00000274 <strchr>:
 274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 278:	e28db000 	add	fp, sp, #0
 27c:	e5d02000 	ldrb	r2, [r0]
 280:	e3520000 	cmp	r2, #0
 284:	0a00000b 	beq	2b8 <strchr+0x44>
 288:	e1510002 	cmp	r1, r2
 28c:	1a000002 	bne	29c <strchr+0x28>
 290:	ea000005 	b	2ac <strchr+0x38>
 294:	e1530001 	cmp	r3, r1
 298:	0a000003 	beq	2ac <strchr+0x38>
 29c:	e5f03001 	ldrb	r3, [r0, #1]!
 2a0:	e3530000 	cmp	r3, #0
 2a4:	1afffffa 	bne	294 <strchr+0x20>
 2a8:	e1a00003 	mov	r0, r3
 2ac:	e28bd000 	add	sp, fp, #0
 2b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b4:	e12fff1e 	bx	lr
 2b8:	e1a00002 	mov	r0, r2
 2bc:	eafffffa 	b	2ac <strchr+0x38>

000002c0 <gets>:
 2c0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2c4:	e1a08000 	mov	r8, r0
 2c8:	e28db018 	add	fp, sp, #24
 2cc:	e1a07001 	mov	r7, r1
 2d0:	e24dd00c 	sub	sp, sp, #12
 2d4:	e2406001 	sub	r6, r0, #1
 2d8:	e3a05000 	mov	r5, #0
 2dc:	ea000008 	b	304 <gets+0x44>
 2e0:	eb000082 	bl	4f0 <read>
 2e4:	e3500000 	cmp	r0, #0
 2e8:	da00000b 	ble	31c <gets+0x5c>
 2ec:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2f0:	e1a05004 	mov	r5, r4
 2f4:	e353000d 	cmp	r3, #13
 2f8:	1353000a 	cmpne	r3, #10
 2fc:	e5e63001 	strb	r3, [r6, #1]!
 300:	0a000005 	beq	31c <gets+0x5c>
 304:	e3a02001 	mov	r2, #1
 308:	e0854002 	add	r4, r5, r2
 30c:	e1540007 	cmp	r4, r7
 310:	e24b101d 	sub	r1, fp, #29
 314:	e3a00000 	mov	r0, #0
 318:	bafffff0 	blt	2e0 <gets+0x20>
 31c:	e3a03000 	mov	r3, #0
 320:	e1a00008 	mov	r0, r8
 324:	e7c83005 	strb	r3, [r8, r5]
 328:	e24bd018 	sub	sp, fp, #24
 32c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000330 <stat>:
 330:	e92d4830 	push	{r4, r5, fp, lr}
 334:	e1a04001 	mov	r4, r1
 338:	e28db00c 	add	fp, sp, #12
 33c:	e3a01000 	mov	r1, #0
 340:	eb0000ab 	bl	5f4 <open>
 344:	e2505000 	subs	r5, r0, #0
 348:	ba000006 	blt	368 <stat+0x38>
 34c:	e1a01004 	mov	r1, r4
 350:	eb0000ce 	bl	690 <fstat>
 354:	e1a04000 	mov	r4, r0
 358:	e1a00005 	mov	r0, r5
 35c:	eb00007d 	bl	558 <close>
 360:	e1a00004 	mov	r0, r4
 364:	e8bd8830 	pop	{r4, r5, fp, pc}
 368:	e3e04000 	mvn	r4, #0
 36c:	eafffffb 	b	360 <stat+0x30>

00000370 <atoi>:
 370:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 374:	e28db000 	add	fp, sp, #0
 378:	e5d02000 	ldrb	r2, [r0]
 37c:	e2423030 	sub	r3, r2, #48	; 0x30
 380:	e3530009 	cmp	r3, #9
 384:	e3a03000 	mov	r3, #0
 388:	8a000006 	bhi	3a8 <atoi+0x38>
 38c:	e3a0c00a 	mov	ip, #10
 390:	e023239c 	mla	r3, ip, r3, r2
 394:	e5f02001 	ldrb	r2, [r0, #1]!
 398:	e2421030 	sub	r1, r2, #48	; 0x30
 39c:	e3510009 	cmp	r1, #9
 3a0:	e2433030 	sub	r3, r3, #48	; 0x30
 3a4:	9afffff9 	bls	390 <atoi+0x20>
 3a8:	e1a00003 	mov	r0, r3
 3ac:	e28bd000 	add	sp, fp, #0
 3b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3b4:	e12fff1e 	bx	lr

000003b8 <memmove>:
 3b8:	e3520000 	cmp	r2, #0
 3bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3c0:	e28db000 	add	fp, sp, #0
 3c4:	da000005 	ble	3e0 <memmove+0x28>
 3c8:	e0812002 	add	r2, r1, r2
 3cc:	e2403001 	sub	r3, r0, #1
 3d0:	e4d1c001 	ldrb	ip, [r1], #1
 3d4:	e1510002 	cmp	r1, r2
 3d8:	e5e3c001 	strb	ip, [r3, #1]!
 3dc:	1afffffb 	bne	3d0 <memmove+0x18>
 3e0:	e28bd000 	add	sp, fp, #0
 3e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e8:	e12fff1e 	bx	lr

000003ec <fork>:
 3ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 400:	e3a00001 	mov	r0, #1
 404:	ef000040 	svc	0x00000040
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 414:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 418:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 41c:	e12fff1e 	bx	lr

00000420 <exit>:
 420:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 424:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 428:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 42c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 430:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 434:	e3a00002 	mov	r0, #2
 438:	ef000040 	svc	0x00000040
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 448:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 44c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 450:	e12fff1e 	bx	lr

00000454 <wait>:
 454:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 458:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 45c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 460:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 464:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 468:	e3a00003 	mov	r0, #3
 46c:	ef000040 	svc	0x00000040
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 47c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 480:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 484:	e12fff1e 	bx	lr

00000488 <lseek>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00016 	mov	r0, #22
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <pipe>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a00004 	mov	r0, #4
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <read>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00005 	mov	r0, #5
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <write>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a00010 	mov	r0, #16
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <close>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00015 	mov	r0, #21
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <kill>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00006 	mov	r0, #6
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <exec>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00007 	mov	r0, #7
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <open>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a0000f 	mov	r0, #15
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <mknod>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a00011 	mov	r0, #17
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <unlink>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00012 	mov	r0, #18
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <fstat>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a00008 	mov	r0, #8
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <link>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a00013 	mov	r0, #19
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <mkdir>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a00014 	mov	r0, #20
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <chdir>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a00009 	mov	r0, #9
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <dup>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a0000a 	mov	r0, #10
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <getpid>:
 794:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 798:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 79c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a8:	e3a0000b 	mov	r0, #11
 7ac:	ef000040 	svc	0x00000040
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c4:	e12fff1e 	bx	lr

000007c8 <sbrk>:
 7c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7dc:	e3a0000c 	mov	r0, #12
 7e0:	ef000040 	svc	0x00000040
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f8:	e12fff1e 	bx	lr

000007fc <sleep>:
 7fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 800:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 804:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 808:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 80c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 810:	e3a0000d 	mov	r0, #13
 814:	ef000040 	svc	0x00000040
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 824:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 828:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 82c:	e12fff1e 	bx	lr

00000830 <uptime>:
 830:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 834:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 838:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 83c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 840:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 844:	e3a0000e 	mov	r0, #14
 848:	ef000040 	svc	0x00000040
 84c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 850:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 854:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 858:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 85c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 860:	e12fff1e 	bx	lr

00000864 <printint>:
 864:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 868:	e1a09fa1 	lsr	r9, r1, #31
 86c:	e3530000 	cmp	r3, #0
 870:	03a09000 	moveq	r9, #0
 874:	12099001 	andne	r9, r9, #1
 878:	e28db01c 	add	fp, sp, #28
 87c:	e3590000 	cmp	r9, #0
 880:	e3008cd8 	movw	r8, #3288	; 0xcd8
 884:	1261e000 	rsbne	lr, r1, #0
 888:	e3408000 	movt	r8, #0
 88c:	e24b602d 	sub	r6, fp, #45	; 0x2d
 890:	e1a04000 	mov	r4, r0
 894:	13a09001 	movne	r9, #1
 898:	01a0e001 	moveq	lr, r1
 89c:	e3a07000 	mov	r7, #0
 8a0:	e3a05001 	mov	r5, #1
 8a4:	e24dd018 	sub	sp, sp, #24
 8a8:	e3a0c000 	mov	ip, #0
 8ac:	e3a0301f 	mov	r3, #31
 8b0:	e1a0100c 	mov	r1, ip
 8b4:	e1a0033e 	lsr	r0, lr, r3
 8b8:	e2000001 	and	r0, r0, #1
 8bc:	e1801081 	orr	r1, r0, r1, lsl #1
 8c0:	e1520001 	cmp	r2, r1
 8c4:	90411002 	subls	r1, r1, r2
 8c8:	918cc315 	orrls	ip, ip, r5, lsl r3
 8cc:	e2533001 	subs	r3, r3, #1
 8d0:	2afffff7 	bcs	8b4 <printint+0x50>
 8d4:	e061e29c 	mls	r1, ip, r2, lr
 8d8:	e35c0000 	cmp	ip, #0
 8dc:	e1a0e00c 	mov	lr, ip
 8e0:	e2873001 	add	r3, r7, #1
 8e4:	e7d81001 	ldrb	r1, [r8, r1]
 8e8:	e5e61001 	strb	r1, [r6, #1]!
 8ec:	11a07003 	movne	r7, r3
 8f0:	1affffec 	bne	8a8 <printint+0x44>
 8f4:	e3590000 	cmp	r9, #0
 8f8:	124b201c 	subne	r2, fp, #28
 8fc:	10822003 	addne	r2, r2, r3
 900:	13a0102d 	movne	r1, #45	; 0x2d
 904:	12873002 	addne	r3, r7, #2
 908:	15421010 	strbne	r1, [r2, #-16]
 90c:	e24b202c 	sub	r2, fp, #44	; 0x2c
 910:	e2435001 	sub	r5, r3, #1
 914:	e0826003 	add	r6, r2, r3
 918:	e5763001 	ldrb	r3, [r6, #-1]!
 91c:	e2455001 	sub	r5, r5, #1
 920:	e3a02001 	mov	r2, #1
 924:	e24b102d 	sub	r1, fp, #45	; 0x2d
 928:	e1a00004 	mov	r0, r4
 92c:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 930:	ebfffefb 	bl	524 <write>
 934:	e3750001 	cmn	r5, #1
 938:	1afffff6 	bne	918 <printint+0xb4>
 93c:	e24bd01c 	sub	sp, fp, #28
 940:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000944 <div>:
 944:	e92d4810 	push	{r4, fp, lr}
 948:	e3a02000 	mov	r2, #0
 94c:	e28db008 	add	fp, sp, #8
 950:	e1a0e000 	mov	lr, r0
 954:	e3a0301f 	mov	r3, #31
 958:	e1a00002 	mov	r0, r2
 95c:	e3a04001 	mov	r4, #1
 960:	e1a0c33e 	lsr	ip, lr, r3
 964:	e20cc001 	and	ip, ip, #1
 968:	e18c2082 	orr	r2, ip, r2, lsl #1
 96c:	e1520001 	cmp	r2, r1
 970:	20422001 	subcs	r2, r2, r1
 974:	21800314 	orrcs	r0, r0, r4, lsl r3
 978:	e2533001 	subs	r3, r3, #1
 97c:	2afffff7 	bcs	960 <div+0x1c>
 980:	e8bd8810 	pop	{r4, fp, pc}

00000984 <printf>:
 984:	e92d000e 	push	{r1, r2, r3}
 988:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 98c:	e28db018 	add	fp, sp, #24
 990:	e24dd008 	sub	sp, sp, #8
 994:	e59b6004 	ldr	r6, [fp, #4]
 998:	e5d64000 	ldrb	r4, [r6]
 99c:	e3540000 	cmp	r4, #0
 9a0:	0a00002b 	beq	a54 <printf+0xd0>
 9a4:	e1a07000 	mov	r7, r0
 9a8:	e28b8008 	add	r8, fp, #8
 9ac:	e3a05000 	mov	r5, #0
 9b0:	ea00000a 	b	9e0 <printf+0x5c>
 9b4:	e3540025 	cmp	r4, #37	; 0x25
 9b8:	01a05004 	moveq	r5, r4
 9bc:	0a000004 	beq	9d4 <printf+0x50>
 9c0:	e24b1018 	sub	r1, fp, #24
 9c4:	e3a02001 	mov	r2, #1
 9c8:	e1a00007 	mov	r0, r7
 9cc:	e5614006 	strb	r4, [r1, #-6]!
 9d0:	ebfffed3 	bl	524 <write>
 9d4:	e5f64001 	ldrb	r4, [r6, #1]!
 9d8:	e3540000 	cmp	r4, #0
 9dc:	0a00001c 	beq	a54 <printf+0xd0>
 9e0:	e3550000 	cmp	r5, #0
 9e4:	0afffff2 	beq	9b4 <printf+0x30>
 9e8:	e3550025 	cmp	r5, #37	; 0x25
 9ec:	1afffff8 	bne	9d4 <printf+0x50>
 9f0:	e3540064 	cmp	r4, #100	; 0x64
 9f4:	0a000037 	beq	ad8 <printf+0x154>
 9f8:	e20430f7 	and	r3, r4, #247	; 0xf7
 9fc:	e3530070 	cmp	r3, #112	; 0x70
 a00:	0a000017 	beq	a64 <printf+0xe0>
 a04:	e3540073 	cmp	r4, #115	; 0x73
 a08:	0a00001c 	beq	a80 <printf+0xfc>
 a0c:	e3540063 	cmp	r4, #99	; 0x63
 a10:	0a000037 	beq	af4 <printf+0x170>
 a14:	e3540025 	cmp	r4, #37	; 0x25
 a18:	0a000027 	beq	abc <printf+0x138>
 a1c:	e3a02001 	mov	r2, #1
 a20:	e24b1019 	sub	r1, fp, #25
 a24:	e1a00007 	mov	r0, r7
 a28:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 a2c:	ebfffebc 	bl	524 <write>
 a30:	e3a02001 	mov	r2, #1
 a34:	e24b101a 	sub	r1, fp, #26
 a38:	e1a00007 	mov	r0, r7
 a3c:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 a40:	ebfffeb7 	bl	524 <write>
 a44:	e5f64001 	ldrb	r4, [r6, #1]!
 a48:	e3a05000 	mov	r5, #0
 a4c:	e3540000 	cmp	r4, #0
 a50:	1affffe2 	bne	9e0 <printf+0x5c>
 a54:	e24bd018 	sub	sp, fp, #24
 a58:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 a5c:	e28dd00c 	add	sp, sp, #12
 a60:	e12fff1e 	bx	lr
 a64:	e3a03000 	mov	r3, #0
 a68:	e3a02010 	mov	r2, #16
 a6c:	e4981004 	ldr	r1, [r8], #4
 a70:	e1a00007 	mov	r0, r7
 a74:	ebffff7a 	bl	864 <printint>
 a78:	e3a05000 	mov	r5, #0
 a7c:	eaffffd4 	b	9d4 <printf+0x50>
 a80:	e4984004 	ldr	r4, [r8], #4
 a84:	e3540000 	cmp	r4, #0
 a88:	0a000021 	beq	b14 <printf+0x190>
 a8c:	e5d45000 	ldrb	r5, [r4]
 a90:	e3550000 	cmp	r5, #0
 a94:	0affffce 	beq	9d4 <printf+0x50>
 a98:	e3a02001 	mov	r2, #1
 a9c:	e24b101d 	sub	r1, fp, #29
 aa0:	e1a00007 	mov	r0, r7
 aa4:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 aa8:	ebfffe9d 	bl	524 <write>
 aac:	e5f45001 	ldrb	r5, [r4, #1]!
 ab0:	e3550000 	cmp	r5, #0
 ab4:	1afffff7 	bne	a98 <printf+0x114>
 ab8:	eaffffc5 	b	9d4 <printf+0x50>
 abc:	e24b1018 	sub	r1, fp, #24
 ac0:	e3a02001 	mov	r2, #1
 ac4:	e1a00007 	mov	r0, r7
 ac8:	e5615003 	strb	r5, [r1, #-3]!
 acc:	e3a05000 	mov	r5, #0
 ad0:	ebfffe93 	bl	524 <write>
 ad4:	eaffffbe 	b	9d4 <printf+0x50>
 ad8:	e3a03001 	mov	r3, #1
 adc:	e3a0200a 	mov	r2, #10
 ae0:	e4981004 	ldr	r1, [r8], #4
 ae4:	e1a00007 	mov	r0, r7
 ae8:	ebffff5d 	bl	864 <printint>
 aec:	e3a05000 	mov	r5, #0
 af0:	eaffffb7 	b	9d4 <printf+0x50>
 af4:	e4983004 	ldr	r3, [r8], #4
 af8:	e24b1018 	sub	r1, fp, #24
 afc:	e3a02001 	mov	r2, #1
 b00:	e1a00007 	mov	r0, r7
 b04:	e3a05000 	mov	r5, #0
 b08:	e5613004 	strb	r3, [r1, #-4]!
 b0c:	ebfffe84 	bl	524 <write>
 b10:	eaffffaf 	b	9d4 <printf+0x50>
 b14:	e3004cec 	movw	r4, #3308	; 0xcec
 b18:	e3a05028 	mov	r5, #40	; 0x28
 b1c:	e3404000 	movt	r4, #0
 b20:	eaffffdc 	b	a98 <printf+0x114>

00000b24 <free>:
 b24:	e300ccf4 	movw	ip, #3316	; 0xcf4
 b28:	e340c000 	movt	ip, #0
 b2c:	e92d4810 	push	{r4, fp, lr}
 b30:	e2401008 	sub	r1, r0, #8
 b34:	e28db008 	add	fp, sp, #8
 b38:	e59c3000 	ldr	r3, [ip]
 b3c:	ea000004 	b	b54 <free+0x30>
 b40:	e1510002 	cmp	r1, r2
 b44:	3a000009 	bcc	b70 <free+0x4c>
 b48:	e1530002 	cmp	r3, r2
 b4c:	2a000007 	bcs	b70 <free+0x4c>
 b50:	e1a03002 	mov	r3, r2
 b54:	e1530001 	cmp	r3, r1
 b58:	e5932000 	ldr	r2, [r3]
 b5c:	3afffff7 	bcc	b40 <free+0x1c>
 b60:	e1530002 	cmp	r3, r2
 b64:	3afffff9 	bcc	b50 <free+0x2c>
 b68:	e1510002 	cmp	r1, r2
 b6c:	2afffff7 	bcs	b50 <free+0x2c>
 b70:	e510e004 	ldr	lr, [r0, #-4]
 b74:	e58c3000 	str	r3, [ip]
 b78:	e081418e 	add	r4, r1, lr, lsl #3
 b7c:	e1520004 	cmp	r2, r4
 b80:	05922004 	ldreq	r2, [r2, #4]
 b84:	0082e00e 	addeq	lr, r2, lr
 b88:	0500e004 	streq	lr, [r0, #-4]
 b8c:	05932000 	ldreq	r2, [r3]
 b90:	05922000 	ldreq	r2, [r2]
 b94:	e5002008 	str	r2, [r0, #-8]
 b98:	e5932004 	ldr	r2, [r3, #4]
 b9c:	e083e182 	add	lr, r3, r2, lsl #3
 ba0:	e151000e 	cmp	r1, lr
 ba4:	15831000 	strne	r1, [r3]
 ba8:	05101004 	ldreq	r1, [r0, #-4]
 bac:	00812002 	addeq	r2, r1, r2
 bb0:	05832004 	streq	r2, [r3, #4]
 bb4:	05102008 	ldreq	r2, [r0, #-8]
 bb8:	05832000 	streq	r2, [r3]
 bbc:	e8bd8810 	pop	{r4, fp, pc}

00000bc0 <malloc>:
 bc0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 bc4:	e3007cf4 	movw	r7, #3316	; 0xcf4
 bc8:	e3407000 	movt	r7, #0
 bcc:	e2804007 	add	r4, r0, #7
 bd0:	e28db014 	add	fp, sp, #20
 bd4:	e5973000 	ldr	r3, [r7]
 bd8:	e1a041a4 	lsr	r4, r4, #3
 bdc:	e2844001 	add	r4, r4, #1
 be0:	e3530000 	cmp	r3, #0
 be4:	0a000027 	beq	c88 <malloc+0xc8>
 be8:	e5930000 	ldr	r0, [r3]
 bec:	e5902004 	ldr	r2, [r0, #4]
 bf0:	e1540002 	cmp	r4, r2
 bf4:	9a000019 	bls	c60 <malloc+0xa0>
 bf8:	e3540a01 	cmp	r4, #4096	; 0x1000
 bfc:	21a05004 	movcs	r5, r4
 c00:	33a05a01 	movcc	r5, #4096	; 0x1000
 c04:	e1a06185 	lsl	r6, r5, #3
 c08:	ea000003 	b	c1c <malloc+0x5c>
 c0c:	e5930000 	ldr	r0, [r3]
 c10:	e5902004 	ldr	r2, [r0, #4]
 c14:	e1540002 	cmp	r4, r2
 c18:	9a000010 	bls	c60 <malloc+0xa0>
 c1c:	e5972000 	ldr	r2, [r7]
 c20:	e1a03000 	mov	r3, r0
 c24:	e1520000 	cmp	r2, r0
 c28:	1afffff7 	bne	c0c <malloc+0x4c>
 c2c:	e1a00006 	mov	r0, r6
 c30:	ebfffee4 	bl	7c8 <sbrk>
 c34:	e1a03000 	mov	r3, r0
 c38:	e3730001 	cmn	r3, #1
 c3c:	e2800008 	add	r0, r0, #8
 c40:	0a000004 	beq	c58 <malloc+0x98>
 c44:	e5835004 	str	r5, [r3, #4]
 c48:	ebffffb5 	bl	b24 <free>
 c4c:	e5973000 	ldr	r3, [r7]
 c50:	e3530000 	cmp	r3, #0
 c54:	1affffec 	bne	c0c <malloc+0x4c>
 c58:	e3a00000 	mov	r0, #0
 c5c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c60:	e1540002 	cmp	r4, r2
 c64:	e5873000 	str	r3, [r7]
 c68:	10422004 	subne	r2, r2, r4
 c6c:	15802004 	strne	r2, [r0, #4]
 c70:	05902000 	ldreq	r2, [r0]
 c74:	10800182 	addne	r0, r0, r2, lsl #3
 c78:	e2800008 	add	r0, r0, #8
 c7c:	15004004 	strne	r4, [r0, #-4]
 c80:	05832000 	streq	r2, [r3]
 c84:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c88:	e2870004 	add	r0, r7, #4
 c8c:	e5873008 	str	r3, [r7, #8]
 c90:	e5870000 	str	r0, [r7]
 c94:	e5870004 	str	r0, [r7, #4]
 c98:	eaffffd6 	b	bf8 <malloc+0x38>
