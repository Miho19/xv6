
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	e28db01c 	add	fp, sp, #28
   c:	da000015 	ble	68 <main+0x68>
  10:	e3007b54 	movw	r7, #2900	; 0xb54
  14:	e3006b58 	movw	r6, #2904	; 0xb58
  18:	e1a08000 	mov	r8, r0
  1c:	e3407000 	movt	r7, #0
  20:	e3406000 	movt	r6, #0
  24:	e1a05001 	mov	r5, r1
  28:	e3a04001 	mov	r4, #1
  2c:	ea000003 	b	40 <main+0x40>
  30:	e1a03007 	mov	r3, r7
  34:	e1a01006 	mov	r1, r6
  38:	e3a00001 	mov	r0, #1
  3c:	eb0001fe 	bl	83c <printf>
  40:	e2844001 	add	r4, r4, #1
  44:	e5b52004 	ldr	r2, [r5, #4]!
  48:	e1580004 	cmp	r8, r4
  4c:	1afffff7 	bne	30 <main+0x30>
  50:	e3003b60 	movw	r3, #2912	; 0xb60
  54:	e3001b58 	movw	r1, #2904	; 0xb58
  58:	e3403000 	movt	r3, #0
  5c:	e3401000 	movt	r1, #0
  60:	e3a00001 	mov	r0, #1
  64:	eb0001f4 	bl	83c <printf>
  68:	eb0000a7 	bl	30c <exit>

0000006c <strcpy>:
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e2402001 	sub	r2, r0, #1
  74:	e28db000 	add	fp, sp, #0
  78:	e4d13001 	ldrb	r3, [r1], #1
  7c:	e3530000 	cmp	r3, #0
  80:	e5e23001 	strb	r3, [r2, #1]!
  84:	1afffffb 	bne	78 <strcpy+0xc>
  88:	e28bd000 	add	sp, fp, #0
  8c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  90:	e12fff1e 	bx	lr

00000094 <strcmp>:
  94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  98:	e28db000 	add	fp, sp, #0
  9c:	e5d03000 	ldrb	r3, [r0]
  a0:	e5d12000 	ldrb	r2, [r1]
  a4:	e3530000 	cmp	r3, #0
  a8:	1a000004 	bne	c0 <strcmp+0x2c>
  ac:	ea000005 	b	c8 <strcmp+0x34>
  b0:	e5f03001 	ldrb	r3, [r0, #1]!
  b4:	e3530000 	cmp	r3, #0
  b8:	0a000006 	beq	d8 <strcmp+0x44>
  bc:	e5f12001 	ldrb	r2, [r1, #1]!
  c0:	e1530002 	cmp	r3, r2
  c4:	0afffff9 	beq	b0 <strcmp+0x1c>
  c8:	e0430002 	sub	r0, r3, r2
  cc:	e28bd000 	add	sp, fp, #0
  d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d4:	e12fff1e 	bx	lr
  d8:	e5d12001 	ldrb	r2, [r1, #1]
  dc:	e0430002 	sub	r0, r3, r2
  e0:	e28bd000 	add	sp, fp, #0
  e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  e8:	e12fff1e 	bx	lr

000000ec <strlen>:
  ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f0:	e28db000 	add	fp, sp, #0
  f4:	e5d03000 	ldrb	r3, [r0]
  f8:	e3530000 	cmp	r3, #0
  fc:	0a000009 	beq	128 <strlen+0x3c>
 100:	e1a02000 	mov	r2, r0
 104:	e3a03000 	mov	r3, #0
 108:	e5f21001 	ldrb	r1, [r2, #1]!
 10c:	e2833001 	add	r3, r3, #1
 110:	e3510000 	cmp	r1, #0
 114:	e1a00003 	mov	r0, r3
 118:	1afffffa 	bne	108 <strlen+0x1c>
 11c:	e28bd000 	add	sp, fp, #0
 120:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 124:	e12fff1e 	bx	lr
 128:	e1a00003 	mov	r0, r3
 12c:	eafffffa 	b	11c <strlen+0x30>

00000130 <memset>:
 130:	e3520000 	cmp	r2, #0
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
 13c:	0a000004 	beq	154 <memset+0x24>
 140:	e6ef1071 	uxtb	r1, r1
 144:	e0802002 	add	r2, r0, r2
 148:	e4c01001 	strb	r1, [r0], #1
 14c:	e1520000 	cmp	r2, r0
 150:	1afffffc 	bne	148 <memset+0x18>
 154:	e28bd000 	add	sp, fp, #0
 158:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 15c:	e12fff1e 	bx	lr

00000160 <strchr>:
 160:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 164:	e28db000 	add	fp, sp, #0
 168:	e5d02000 	ldrb	r2, [r0]
 16c:	e3520000 	cmp	r2, #0
 170:	0a00000b 	beq	1a4 <strchr+0x44>
 174:	e1510002 	cmp	r1, r2
 178:	1a000002 	bne	188 <strchr+0x28>
 17c:	ea000005 	b	198 <strchr+0x38>
 180:	e1530001 	cmp	r3, r1
 184:	0a000003 	beq	198 <strchr+0x38>
 188:	e5f03001 	ldrb	r3, [r0, #1]!
 18c:	e3530000 	cmp	r3, #0
 190:	1afffffa 	bne	180 <strchr+0x20>
 194:	e1a00003 	mov	r0, r3
 198:	e28bd000 	add	sp, fp, #0
 19c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a0:	e12fff1e 	bx	lr
 1a4:	e1a00002 	mov	r0, r2
 1a8:	eafffffa 	b	198 <strchr+0x38>

000001ac <gets>:
 1ac:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1b0:	e1a08000 	mov	r8, r0
 1b4:	e28db018 	add	fp, sp, #24
 1b8:	e1a07001 	mov	r7, r1
 1bc:	e24dd00c 	sub	sp, sp, #12
 1c0:	e2406001 	sub	r6, r0, #1
 1c4:	e3a05000 	mov	r5, #0
 1c8:	ea000008 	b	1f0 <gets+0x44>
 1cc:	eb000075 	bl	3a8 <read>
 1d0:	e3500000 	cmp	r0, #0
 1d4:	da00000b 	ble	208 <gets+0x5c>
 1d8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1dc:	e1a05004 	mov	r5, r4
 1e0:	e353000d 	cmp	r3, #13
 1e4:	1353000a 	cmpne	r3, #10
 1e8:	e5e63001 	strb	r3, [r6, #1]!
 1ec:	0a000005 	beq	208 <gets+0x5c>
 1f0:	e3a02001 	mov	r2, #1
 1f4:	e0854002 	add	r4, r5, r2
 1f8:	e1540007 	cmp	r4, r7
 1fc:	e24b101d 	sub	r1, fp, #29
 200:	e3a00000 	mov	r0, #0
 204:	bafffff0 	blt	1cc <gets+0x20>
 208:	e3a03000 	mov	r3, #0
 20c:	e1a00008 	mov	r0, r8
 210:	e7c83005 	strb	r3, [r8, r5]
 214:	e24bd018 	sub	sp, fp, #24
 218:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000021c <stat>:
 21c:	e92d4830 	push	{r4, r5, fp, lr}
 220:	e1a04001 	mov	r4, r1
 224:	e28db00c 	add	fp, sp, #12
 228:	e3a01000 	mov	r1, #0
 22c:	eb00009e 	bl	4ac <open>
 230:	e2505000 	subs	r5, r0, #0
 234:	ba000006 	blt	254 <stat+0x38>
 238:	e1a01004 	mov	r1, r4
 23c:	eb0000c1 	bl	548 <fstat>
 240:	e1a04000 	mov	r4, r0
 244:	e1a00005 	mov	r0, r5
 248:	eb000070 	bl	410 <close>
 24c:	e1a00004 	mov	r0, r4
 250:	e8bd8830 	pop	{r4, r5, fp, pc}
 254:	e3e04000 	mvn	r4, #0
 258:	eafffffb 	b	24c <stat+0x30>

0000025c <atoi>:
 25c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 260:	e28db000 	add	fp, sp, #0
 264:	e5d02000 	ldrb	r2, [r0]
 268:	e2423030 	sub	r3, r2, #48	; 0x30
 26c:	e3530009 	cmp	r3, #9
 270:	e3a03000 	mov	r3, #0
 274:	8a000006 	bhi	294 <atoi+0x38>
 278:	e3a0c00a 	mov	ip, #10
 27c:	e023239c 	mla	r3, ip, r3, r2
 280:	e5f02001 	ldrb	r2, [r0, #1]!
 284:	e2421030 	sub	r1, r2, #48	; 0x30
 288:	e3510009 	cmp	r1, #9
 28c:	e2433030 	sub	r3, r3, #48	; 0x30
 290:	9afffff9 	bls	27c <atoi+0x20>
 294:	e1a00003 	mov	r0, r3
 298:	e28bd000 	add	sp, fp, #0
 29c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a0:	e12fff1e 	bx	lr

000002a4 <memmove>:
 2a4:	e3520000 	cmp	r2, #0
 2a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ac:	e28db000 	add	fp, sp, #0
 2b0:	da000005 	ble	2cc <memmove+0x28>
 2b4:	e0812002 	add	r2, r1, r2
 2b8:	e2403001 	sub	r3, r0, #1
 2bc:	e4d1c001 	ldrb	ip, [r1], #1
 2c0:	e1510002 	cmp	r1, r2
 2c4:	e5e3c001 	strb	ip, [r3, #1]!
 2c8:	1afffffb 	bne	2bc <memmove+0x18>
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d4:	e12fff1e 	bx	lr

000002d8 <fork>:
 2d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2ec:	e3a00001 	mov	r0, #1
 2f0:	ef000040 	svc	0x00000040
 2f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 300:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 304:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 308:	e12fff1e 	bx	lr

0000030c <exit>:
 30c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 310:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 314:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 318:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 31c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 320:	e3a00002 	mov	r0, #2
 324:	ef000040 	svc	0x00000040
 328:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 334:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 338:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 33c:	e12fff1e 	bx	lr

00000340 <wait>:
 340:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 344:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 348:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 34c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 350:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 354:	e3a00003 	mov	r0, #3
 358:	ef000040 	svc	0x00000040
 35c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 368:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 36c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 370:	e12fff1e 	bx	lr

00000374 <pipe>:
 374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 378:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 37c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 380:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 384:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 388:	e3a00004 	mov	r0, #4
 38c:	ef000040 	svc	0x00000040
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 39c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a4:	e12fff1e 	bx	lr

000003a8 <read>:
 3a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3bc:	e3a00005 	mov	r0, #5
 3c0:	ef000040 	svc	0x00000040
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d8:	e12fff1e 	bx	lr

000003dc <write>:
 3dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f0:	e3a00010 	mov	r0, #16
 3f4:	ef000040 	svc	0x00000040
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 404:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 408:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 40c:	e12fff1e 	bx	lr

00000410 <close>:
 410:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 414:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 418:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 41c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 420:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 424:	e3a00015 	mov	r0, #21
 428:	ef000040 	svc	0x00000040
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 438:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 43c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <kill>:
 444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 448:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 44c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 450:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 454:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 458:	e3a00006 	mov	r0, #6
 45c:	ef000040 	svc	0x00000040
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 46c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 474:	e12fff1e 	bx	lr

00000478 <exec>:
 478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 47c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 480:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 484:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 488:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 48c:	e3a00007 	mov	r0, #7
 490:	ef000040 	svc	0x00000040
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a8:	e12fff1e 	bx	lr

000004ac <open>:
 4ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c0:	e3a0000f 	mov	r0, #15
 4c4:	ef000040 	svc	0x00000040
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4dc:	e12fff1e 	bx	lr

000004e0 <mknod>:
 4e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f4:	e3a00011 	mov	r0, #17
 4f8:	ef000040 	svc	0x00000040
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 508:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 50c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 510:	e12fff1e 	bx	lr

00000514 <unlink>:
 514:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 518:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 51c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 520:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 524:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 528:	e3a00012 	mov	r0, #18
 52c:	ef000040 	svc	0x00000040
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 53c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 540:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 544:	e12fff1e 	bx	lr

00000548 <fstat>:
 548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 54c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 550:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 554:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 558:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 55c:	e3a00008 	mov	r0, #8
 560:	ef000040 	svc	0x00000040
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 570:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 574:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 578:	e12fff1e 	bx	lr

0000057c <link>:
 57c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 580:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 584:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 588:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 58c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 590:	e3a00013 	mov	r0, #19
 594:	ef000040 	svc	0x00000040
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ac:	e12fff1e 	bx	lr

000005b0 <mkdir>:
 5b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c4:	e3a00014 	mov	r0, #20
 5c8:	ef000040 	svc	0x00000040
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e0:	e12fff1e 	bx	lr

000005e4 <chdir>:
 5e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f8:	e3a00009 	mov	r0, #9
 5fc:	ef000040 	svc	0x00000040
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 60c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 614:	e12fff1e 	bx	lr

00000618 <dup>:
 618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 61c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 620:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 624:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 628:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 62c:	e3a0000a 	mov	r0, #10
 630:	ef000040 	svc	0x00000040
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 640:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 648:	e12fff1e 	bx	lr

0000064c <getpid>:
 64c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 650:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 654:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 658:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 65c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 660:	e3a0000b 	mov	r0, #11
 664:	ef000040 	svc	0x00000040
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 674:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 67c:	e12fff1e 	bx	lr

00000680 <sbrk>:
 680:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 684:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 688:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 68c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 690:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 694:	e3a0000c 	mov	r0, #12
 698:	ef000040 	svc	0x00000040
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b0:	e12fff1e 	bx	lr

000006b4 <sleep>:
 6b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c8:	e3a0000d 	mov	r0, #13
 6cc:	ef000040 	svc	0x00000040
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e4:	e12fff1e 	bx	lr

000006e8 <uptime>:
 6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6fc:	e3a0000e 	mov	r0, #14
 700:	ef000040 	svc	0x00000040
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 710:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 718:	e12fff1e 	bx	lr

0000071c <printint>:
 71c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 720:	e1a09fa1 	lsr	r9, r1, #31
 724:	e3530000 	cmp	r3, #0
 728:	03a09000 	moveq	r9, #0
 72c:	12099001 	andne	r9, r9, #1
 730:	e28db01c 	add	fp, sp, #28
 734:	e3590000 	cmp	r9, #0
 738:	e3008b64 	movw	r8, #2916	; 0xb64
 73c:	1261e000 	rsbne	lr, r1, #0
 740:	e3408000 	movt	r8, #0
 744:	e24b602d 	sub	r6, fp, #45	; 0x2d
 748:	e1a04000 	mov	r4, r0
 74c:	13a09001 	movne	r9, #1
 750:	01a0e001 	moveq	lr, r1
 754:	e3a07000 	mov	r7, #0
 758:	e3a05001 	mov	r5, #1
 75c:	e24dd018 	sub	sp, sp, #24
 760:	e3a0c000 	mov	ip, #0
 764:	e3a0301f 	mov	r3, #31
 768:	e1a0100c 	mov	r1, ip
 76c:	e1a0033e 	lsr	r0, lr, r3
 770:	e2000001 	and	r0, r0, #1
 774:	e1801081 	orr	r1, r0, r1, lsl #1
 778:	e1520001 	cmp	r2, r1
 77c:	90411002 	subls	r1, r1, r2
 780:	918cc315 	orrls	ip, ip, r5, lsl r3
 784:	e2533001 	subs	r3, r3, #1
 788:	2afffff7 	bcs	76c <printint+0x50>
 78c:	e061e29c 	mls	r1, ip, r2, lr
 790:	e35c0000 	cmp	ip, #0
 794:	e1a0e00c 	mov	lr, ip
 798:	e2873001 	add	r3, r7, #1
 79c:	e7d81001 	ldrb	r1, [r8, r1]
 7a0:	e5e61001 	strb	r1, [r6, #1]!
 7a4:	11a07003 	movne	r7, r3
 7a8:	1affffec 	bne	760 <printint+0x44>
 7ac:	e3590000 	cmp	r9, #0
 7b0:	124b201c 	subne	r2, fp, #28
 7b4:	10822003 	addne	r2, r2, r3
 7b8:	13a0102d 	movne	r1, #45	; 0x2d
 7bc:	12873002 	addne	r3, r7, #2
 7c0:	15421010 	strbne	r1, [r2, #-16]
 7c4:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7c8:	e2435001 	sub	r5, r3, #1
 7cc:	e0826003 	add	r6, r2, r3
 7d0:	e5763001 	ldrb	r3, [r6, #-1]!
 7d4:	e2455001 	sub	r5, r5, #1
 7d8:	e3a02001 	mov	r2, #1
 7dc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7e0:	e1a00004 	mov	r0, r4
 7e4:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7e8:	ebfffefb 	bl	3dc <write>
 7ec:	e3750001 	cmn	r5, #1
 7f0:	1afffff6 	bne	7d0 <printint+0xb4>
 7f4:	e24bd01c 	sub	sp, fp, #28
 7f8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007fc <div>:
 7fc:	e92d4810 	push	{r4, fp, lr}
 800:	e3a02000 	mov	r2, #0
 804:	e28db008 	add	fp, sp, #8
 808:	e1a0e000 	mov	lr, r0
 80c:	e3a0301f 	mov	r3, #31
 810:	e1a00002 	mov	r0, r2
 814:	e3a04001 	mov	r4, #1
 818:	e1a0c33e 	lsr	ip, lr, r3
 81c:	e20cc001 	and	ip, ip, #1
 820:	e18c2082 	orr	r2, ip, r2, lsl #1
 824:	e1520001 	cmp	r2, r1
 828:	20422001 	subcs	r2, r2, r1
 82c:	21800314 	orrcs	r0, r0, r4, lsl r3
 830:	e2533001 	subs	r3, r3, #1
 834:	2afffff7 	bcs	818 <div+0x1c>
 838:	e8bd8810 	pop	{r4, fp, pc}

0000083c <printf>:
 83c:	e92d000e 	push	{r1, r2, r3}
 840:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 844:	e28db018 	add	fp, sp, #24
 848:	e24dd008 	sub	sp, sp, #8
 84c:	e59b6004 	ldr	r6, [fp, #4]
 850:	e5d64000 	ldrb	r4, [r6]
 854:	e3540000 	cmp	r4, #0
 858:	0a00002b 	beq	90c <printf+0xd0>
 85c:	e1a07000 	mov	r7, r0
 860:	e28b8008 	add	r8, fp, #8
 864:	e3a05000 	mov	r5, #0
 868:	ea00000a 	b	898 <printf+0x5c>
 86c:	e3540025 	cmp	r4, #37	; 0x25
 870:	01a05004 	moveq	r5, r4
 874:	0a000004 	beq	88c <printf+0x50>
 878:	e24b1018 	sub	r1, fp, #24
 87c:	e3a02001 	mov	r2, #1
 880:	e1a00007 	mov	r0, r7
 884:	e5614006 	strb	r4, [r1, #-6]!
 888:	ebfffed3 	bl	3dc <write>
 88c:	e5f64001 	ldrb	r4, [r6, #1]!
 890:	e3540000 	cmp	r4, #0
 894:	0a00001c 	beq	90c <printf+0xd0>
 898:	e3550000 	cmp	r5, #0
 89c:	0afffff2 	beq	86c <printf+0x30>
 8a0:	e3550025 	cmp	r5, #37	; 0x25
 8a4:	1afffff8 	bne	88c <printf+0x50>
 8a8:	e3540064 	cmp	r4, #100	; 0x64
 8ac:	0a000037 	beq	990 <printf+0x154>
 8b0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8b4:	e3530070 	cmp	r3, #112	; 0x70
 8b8:	0a000017 	beq	91c <printf+0xe0>
 8bc:	e3540073 	cmp	r4, #115	; 0x73
 8c0:	0a00001c 	beq	938 <printf+0xfc>
 8c4:	e3540063 	cmp	r4, #99	; 0x63
 8c8:	0a000037 	beq	9ac <printf+0x170>
 8cc:	e3540025 	cmp	r4, #37	; 0x25
 8d0:	0a000027 	beq	974 <printf+0x138>
 8d4:	e3a02001 	mov	r2, #1
 8d8:	e24b1019 	sub	r1, fp, #25
 8dc:	e1a00007 	mov	r0, r7
 8e0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 8e4:	ebfffebc 	bl	3dc <write>
 8e8:	e3a02001 	mov	r2, #1
 8ec:	e24b101a 	sub	r1, fp, #26
 8f0:	e1a00007 	mov	r0, r7
 8f4:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 8f8:	ebfffeb7 	bl	3dc <write>
 8fc:	e5f64001 	ldrb	r4, [r6, #1]!
 900:	e3a05000 	mov	r5, #0
 904:	e3540000 	cmp	r4, #0
 908:	1affffe2 	bne	898 <printf+0x5c>
 90c:	e24bd018 	sub	sp, fp, #24
 910:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 914:	e28dd00c 	add	sp, sp, #12
 918:	e12fff1e 	bx	lr
 91c:	e3a03000 	mov	r3, #0
 920:	e3a02010 	mov	r2, #16
 924:	e4981004 	ldr	r1, [r8], #4
 928:	e1a00007 	mov	r0, r7
 92c:	ebffff7a 	bl	71c <printint>
 930:	e3a05000 	mov	r5, #0
 934:	eaffffd4 	b	88c <printf+0x50>
 938:	e4984004 	ldr	r4, [r8], #4
 93c:	e3540000 	cmp	r4, #0
 940:	0a000021 	beq	9cc <printf+0x190>
 944:	e5d45000 	ldrb	r5, [r4]
 948:	e3550000 	cmp	r5, #0
 94c:	0affffce 	beq	88c <printf+0x50>
 950:	e3a02001 	mov	r2, #1
 954:	e24b101d 	sub	r1, fp, #29
 958:	e1a00007 	mov	r0, r7
 95c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 960:	ebfffe9d 	bl	3dc <write>
 964:	e5f45001 	ldrb	r5, [r4, #1]!
 968:	e3550000 	cmp	r5, #0
 96c:	1afffff7 	bne	950 <printf+0x114>
 970:	eaffffc5 	b	88c <printf+0x50>
 974:	e24b1018 	sub	r1, fp, #24
 978:	e3a02001 	mov	r2, #1
 97c:	e1a00007 	mov	r0, r7
 980:	e5615003 	strb	r5, [r1, #-3]!
 984:	e3a05000 	mov	r5, #0
 988:	ebfffe93 	bl	3dc <write>
 98c:	eaffffbe 	b	88c <printf+0x50>
 990:	e3a03001 	mov	r3, #1
 994:	e3a0200a 	mov	r2, #10
 998:	e4981004 	ldr	r1, [r8], #4
 99c:	e1a00007 	mov	r0, r7
 9a0:	ebffff5d 	bl	71c <printint>
 9a4:	e3a05000 	mov	r5, #0
 9a8:	eaffffb7 	b	88c <printf+0x50>
 9ac:	e4983004 	ldr	r3, [r8], #4
 9b0:	e24b1018 	sub	r1, fp, #24
 9b4:	e3a02001 	mov	r2, #1
 9b8:	e1a00007 	mov	r0, r7
 9bc:	e3a05000 	mov	r5, #0
 9c0:	e5613004 	strb	r3, [r1, #-4]!
 9c4:	ebfffe84 	bl	3dc <write>
 9c8:	eaffffaf 	b	88c <printf+0x50>
 9cc:	e3004b78 	movw	r4, #2936	; 0xb78
 9d0:	e3a05028 	mov	r5, #40	; 0x28
 9d4:	e3404000 	movt	r4, #0
 9d8:	eaffffdc 	b	950 <printf+0x114>

000009dc <free>:
 9dc:	e300cb80 	movw	ip, #2944	; 0xb80
 9e0:	e340c000 	movt	ip, #0
 9e4:	e92d4810 	push	{r4, fp, lr}
 9e8:	e2401008 	sub	r1, r0, #8
 9ec:	e28db008 	add	fp, sp, #8
 9f0:	e59c3000 	ldr	r3, [ip]
 9f4:	ea000004 	b	a0c <free+0x30>
 9f8:	e1510002 	cmp	r1, r2
 9fc:	3a000009 	bcc	a28 <free+0x4c>
 a00:	e1530002 	cmp	r3, r2
 a04:	2a000007 	bcs	a28 <free+0x4c>
 a08:	e1a03002 	mov	r3, r2
 a0c:	e1530001 	cmp	r3, r1
 a10:	e5932000 	ldr	r2, [r3]
 a14:	3afffff7 	bcc	9f8 <free+0x1c>
 a18:	e1530002 	cmp	r3, r2
 a1c:	3afffff9 	bcc	a08 <free+0x2c>
 a20:	e1510002 	cmp	r1, r2
 a24:	2afffff7 	bcs	a08 <free+0x2c>
 a28:	e510e004 	ldr	lr, [r0, #-4]
 a2c:	e58c3000 	str	r3, [ip]
 a30:	e081418e 	add	r4, r1, lr, lsl #3
 a34:	e1520004 	cmp	r2, r4
 a38:	05922004 	ldreq	r2, [r2, #4]
 a3c:	0082e00e 	addeq	lr, r2, lr
 a40:	0500e004 	streq	lr, [r0, #-4]
 a44:	05932000 	ldreq	r2, [r3]
 a48:	05922000 	ldreq	r2, [r2]
 a4c:	e5002008 	str	r2, [r0, #-8]
 a50:	e5932004 	ldr	r2, [r3, #4]
 a54:	e083e182 	add	lr, r3, r2, lsl #3
 a58:	e151000e 	cmp	r1, lr
 a5c:	15831000 	strne	r1, [r3]
 a60:	05101004 	ldreq	r1, [r0, #-4]
 a64:	00812002 	addeq	r2, r1, r2
 a68:	05832004 	streq	r2, [r3, #4]
 a6c:	05102008 	ldreq	r2, [r0, #-8]
 a70:	05832000 	streq	r2, [r3]
 a74:	e8bd8810 	pop	{r4, fp, pc}

00000a78 <malloc>:
 a78:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 a7c:	e3007b80 	movw	r7, #2944	; 0xb80
 a80:	e3407000 	movt	r7, #0
 a84:	e2804007 	add	r4, r0, #7
 a88:	e28db014 	add	fp, sp, #20
 a8c:	e5973000 	ldr	r3, [r7]
 a90:	e1a041a4 	lsr	r4, r4, #3
 a94:	e2844001 	add	r4, r4, #1
 a98:	e3530000 	cmp	r3, #0
 a9c:	0a000027 	beq	b40 <malloc+0xc8>
 aa0:	e5930000 	ldr	r0, [r3]
 aa4:	e5902004 	ldr	r2, [r0, #4]
 aa8:	e1540002 	cmp	r4, r2
 aac:	9a000019 	bls	b18 <malloc+0xa0>
 ab0:	e3540a01 	cmp	r4, #4096	; 0x1000
 ab4:	21a05004 	movcs	r5, r4
 ab8:	33a05a01 	movcc	r5, #4096	; 0x1000
 abc:	e1a06185 	lsl	r6, r5, #3
 ac0:	ea000003 	b	ad4 <malloc+0x5c>
 ac4:	e5930000 	ldr	r0, [r3]
 ac8:	e5902004 	ldr	r2, [r0, #4]
 acc:	e1540002 	cmp	r4, r2
 ad0:	9a000010 	bls	b18 <malloc+0xa0>
 ad4:	e5972000 	ldr	r2, [r7]
 ad8:	e1a03000 	mov	r3, r0
 adc:	e1520000 	cmp	r2, r0
 ae0:	1afffff7 	bne	ac4 <malloc+0x4c>
 ae4:	e1a00006 	mov	r0, r6
 ae8:	ebfffee4 	bl	680 <sbrk>
 aec:	e1a03000 	mov	r3, r0
 af0:	e3730001 	cmn	r3, #1
 af4:	e2800008 	add	r0, r0, #8
 af8:	0a000004 	beq	b10 <malloc+0x98>
 afc:	e5835004 	str	r5, [r3, #4]
 b00:	ebffffb5 	bl	9dc <free>
 b04:	e5973000 	ldr	r3, [r7]
 b08:	e3530000 	cmp	r3, #0
 b0c:	1affffec 	bne	ac4 <malloc+0x4c>
 b10:	e3a00000 	mov	r0, #0
 b14:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b18:	e1540002 	cmp	r4, r2
 b1c:	e5873000 	str	r3, [r7]
 b20:	10422004 	subne	r2, r2, r4
 b24:	15802004 	strne	r2, [r0, #4]
 b28:	05902000 	ldreq	r2, [r0]
 b2c:	10800182 	addne	r0, r0, r2, lsl #3
 b30:	e2800008 	add	r0, r0, #8
 b34:	15004004 	strne	r4, [r0, #-4]
 b38:	05832000 	streq	r2, [r3]
 b3c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b40:	e2870004 	add	r0, r7, #4
 b44:	e5873008 	str	r3, [r7, #8]
 b48:	e5870000 	str	r0, [r7]
 b4c:	e5870004 	str	r0, [r7, #4]
 b50:	eaffffd6 	b	ab0 <malloc+0x38>
