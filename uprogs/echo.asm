
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3500001 	cmp	r0, #1
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	e28db01c 	add	fp, sp, #28
   c:	da000015 	ble	68 <main+0x68>
  10:	e3007b88 	movw	r7, #2952	; 0xb88
  14:	e3006b8c 	movw	r6, #2956	; 0xb8c
  18:	e1a08000 	mov	r8, r0
  1c:	e3407000 	movt	r7, #0
  20:	e3406000 	movt	r6, #0
  24:	e1a05001 	mov	r5, r1
  28:	e3a04001 	mov	r4, #1
  2c:	ea000003 	b	40 <main+0x40>
  30:	e1a03007 	mov	r3, r7
  34:	e1a01006 	mov	r1, r6
  38:	e3a00001 	mov	r0, #1
  3c:	eb00020b 	bl	870 <printf>
  40:	e2844001 	add	r4, r4, #1
  44:	e5b52004 	ldr	r2, [r5, #4]!
  48:	e1580004 	cmp	r8, r4
  4c:	1afffff7 	bne	30 <main+0x30>
  50:	e3003b94 	movw	r3, #2964	; 0xb94
  54:	e3001b8c 	movw	r1, #2956	; 0xb8c
  58:	e3403000 	movt	r3, #0
  5c:	e3401000 	movt	r1, #0
  60:	e3a00001 	mov	r0, #1
  64:	eb000201 	bl	870 <printf>
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
 1cc:	eb000082 	bl	3dc <read>
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
 22c:	eb0000ab 	bl	4e0 <open>
 230:	e2505000 	subs	r5, r0, #0
 234:	ba000006 	blt	254 <stat+0x38>
 238:	e1a01004 	mov	r1, r4
 23c:	eb0000ce 	bl	57c <fstat>
 240:	e1a04000 	mov	r4, r0
 244:	e1a00005 	mov	r0, r5
 248:	eb00007d 	bl	444 <close>
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

00000374 <lseek>:
 374:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 378:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 37c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 380:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 384:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 388:	e3a00016 	mov	r0, #22
 38c:	ef000040 	svc	0x00000040
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 39c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a4:	e12fff1e 	bx	lr

000003a8 <pipe>:
 3a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3bc:	e3a00004 	mov	r0, #4
 3c0:	ef000040 	svc	0x00000040
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d8:	e12fff1e 	bx	lr

000003dc <read>:
 3dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f0:	e3a00005 	mov	r0, #5
 3f4:	ef000040 	svc	0x00000040
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 404:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 408:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 40c:	e12fff1e 	bx	lr

00000410 <write>:
 410:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 414:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 418:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 41c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 420:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 424:	e3a00010 	mov	r0, #16
 428:	ef000040 	svc	0x00000040
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 438:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 43c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <close>:
 444:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 448:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 44c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 450:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 454:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 458:	e3a00015 	mov	r0, #21
 45c:	ef000040 	svc	0x00000040
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 46c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 470:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 474:	e12fff1e 	bx	lr

00000478 <kill>:
 478:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 47c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 480:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 484:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 488:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 48c:	e3a00006 	mov	r0, #6
 490:	ef000040 	svc	0x00000040
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a8:	e12fff1e 	bx	lr

000004ac <exec>:
 4ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c0:	e3a00007 	mov	r0, #7
 4c4:	ef000040 	svc	0x00000040
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4dc:	e12fff1e 	bx	lr

000004e0 <open>:
 4e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f4:	e3a0000f 	mov	r0, #15
 4f8:	ef000040 	svc	0x00000040
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 508:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 50c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 510:	e12fff1e 	bx	lr

00000514 <mknod>:
 514:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 518:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 51c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 520:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 524:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 528:	e3a00011 	mov	r0, #17
 52c:	ef000040 	svc	0x00000040
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 53c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 540:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 544:	e12fff1e 	bx	lr

00000548 <unlink>:
 548:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 54c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 550:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 554:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 558:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 55c:	e3a00012 	mov	r0, #18
 560:	ef000040 	svc	0x00000040
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 570:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 574:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 578:	e12fff1e 	bx	lr

0000057c <fstat>:
 57c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 580:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 584:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 588:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 58c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 590:	e3a00008 	mov	r0, #8
 594:	ef000040 	svc	0x00000040
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ac:	e12fff1e 	bx	lr

000005b0 <link>:
 5b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c4:	e3a00013 	mov	r0, #19
 5c8:	ef000040 	svc	0x00000040
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e0:	e12fff1e 	bx	lr

000005e4 <mkdir>:
 5e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f8:	e3a00014 	mov	r0, #20
 5fc:	ef000040 	svc	0x00000040
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 60c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 610:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 614:	e12fff1e 	bx	lr

00000618 <chdir>:
 618:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 61c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 620:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 624:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 628:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 62c:	e3a00009 	mov	r0, #9
 630:	ef000040 	svc	0x00000040
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 640:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 648:	e12fff1e 	bx	lr

0000064c <dup>:
 64c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 650:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 654:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 658:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 65c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 660:	e3a0000a 	mov	r0, #10
 664:	ef000040 	svc	0x00000040
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 674:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 67c:	e12fff1e 	bx	lr

00000680 <getpid>:
 680:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 684:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 688:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 68c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 690:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 694:	e3a0000b 	mov	r0, #11
 698:	ef000040 	svc	0x00000040
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b0:	e12fff1e 	bx	lr

000006b4 <sbrk>:
 6b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c8:	e3a0000c 	mov	r0, #12
 6cc:	ef000040 	svc	0x00000040
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e4:	e12fff1e 	bx	lr

000006e8 <sleep>:
 6e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6fc:	e3a0000d 	mov	r0, #13
 700:	ef000040 	svc	0x00000040
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 710:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 714:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 718:	e12fff1e 	bx	lr

0000071c <uptime>:
 71c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 720:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 724:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 728:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 72c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 730:	e3a0000e 	mov	r0, #14
 734:	ef000040 	svc	0x00000040
 738:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 744:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 748:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 74c:	e12fff1e 	bx	lr

00000750 <printint>:
 750:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 754:	e1a09fa1 	lsr	r9, r1, #31
 758:	e3530000 	cmp	r3, #0
 75c:	03a09000 	moveq	r9, #0
 760:	12099001 	andne	r9, r9, #1
 764:	e28db01c 	add	fp, sp, #28
 768:	e3590000 	cmp	r9, #0
 76c:	e3008b98 	movw	r8, #2968	; 0xb98
 770:	1261e000 	rsbne	lr, r1, #0
 774:	e3408000 	movt	r8, #0
 778:	e24b602d 	sub	r6, fp, #45	; 0x2d
 77c:	e1a04000 	mov	r4, r0
 780:	13a09001 	movne	r9, #1
 784:	01a0e001 	moveq	lr, r1
 788:	e3a07000 	mov	r7, #0
 78c:	e3a05001 	mov	r5, #1
 790:	e24dd018 	sub	sp, sp, #24
 794:	e3a0c000 	mov	ip, #0
 798:	e3a0301f 	mov	r3, #31
 79c:	e1a0100c 	mov	r1, ip
 7a0:	e1a0033e 	lsr	r0, lr, r3
 7a4:	e2000001 	and	r0, r0, #1
 7a8:	e1801081 	orr	r1, r0, r1, lsl #1
 7ac:	e1520001 	cmp	r2, r1
 7b0:	90411002 	subls	r1, r1, r2
 7b4:	918cc315 	orrls	ip, ip, r5, lsl r3
 7b8:	e2533001 	subs	r3, r3, #1
 7bc:	2afffff7 	bcs	7a0 <printint+0x50>
 7c0:	e061e29c 	mls	r1, ip, r2, lr
 7c4:	e35c0000 	cmp	ip, #0
 7c8:	e1a0e00c 	mov	lr, ip
 7cc:	e2873001 	add	r3, r7, #1
 7d0:	e7d81001 	ldrb	r1, [r8, r1]
 7d4:	e5e61001 	strb	r1, [r6, #1]!
 7d8:	11a07003 	movne	r7, r3
 7dc:	1affffec 	bne	794 <printint+0x44>
 7e0:	e3590000 	cmp	r9, #0
 7e4:	124b201c 	subne	r2, fp, #28
 7e8:	10822003 	addne	r2, r2, r3
 7ec:	13a0102d 	movne	r1, #45	; 0x2d
 7f0:	12873002 	addne	r3, r7, #2
 7f4:	15421010 	strbne	r1, [r2, #-16]
 7f8:	e24b202c 	sub	r2, fp, #44	; 0x2c
 7fc:	e2435001 	sub	r5, r3, #1
 800:	e0826003 	add	r6, r2, r3
 804:	e5763001 	ldrb	r3, [r6, #-1]!
 808:	e2455001 	sub	r5, r5, #1
 80c:	e3a02001 	mov	r2, #1
 810:	e24b102d 	sub	r1, fp, #45	; 0x2d
 814:	e1a00004 	mov	r0, r4
 818:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 81c:	ebfffefb 	bl	410 <write>
 820:	e3750001 	cmn	r5, #1
 824:	1afffff6 	bne	804 <printint+0xb4>
 828:	e24bd01c 	sub	sp, fp, #28
 82c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000830 <div>:
 830:	e92d4810 	push	{r4, fp, lr}
 834:	e3a02000 	mov	r2, #0
 838:	e28db008 	add	fp, sp, #8
 83c:	e1a0e000 	mov	lr, r0
 840:	e3a0301f 	mov	r3, #31
 844:	e1a00002 	mov	r0, r2
 848:	e3a04001 	mov	r4, #1
 84c:	e1a0c33e 	lsr	ip, lr, r3
 850:	e20cc001 	and	ip, ip, #1
 854:	e18c2082 	orr	r2, ip, r2, lsl #1
 858:	e1520001 	cmp	r2, r1
 85c:	20422001 	subcs	r2, r2, r1
 860:	21800314 	orrcs	r0, r0, r4, lsl r3
 864:	e2533001 	subs	r3, r3, #1
 868:	2afffff7 	bcs	84c <div+0x1c>
 86c:	e8bd8810 	pop	{r4, fp, pc}

00000870 <printf>:
 870:	e92d000e 	push	{r1, r2, r3}
 874:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 878:	e28db018 	add	fp, sp, #24
 87c:	e24dd008 	sub	sp, sp, #8
 880:	e59b6004 	ldr	r6, [fp, #4]
 884:	e5d64000 	ldrb	r4, [r6]
 888:	e3540000 	cmp	r4, #0
 88c:	0a00002b 	beq	940 <printf+0xd0>
 890:	e1a07000 	mov	r7, r0
 894:	e28b8008 	add	r8, fp, #8
 898:	e3a05000 	mov	r5, #0
 89c:	ea00000a 	b	8cc <printf+0x5c>
 8a0:	e3540025 	cmp	r4, #37	; 0x25
 8a4:	01a05004 	moveq	r5, r4
 8a8:	0a000004 	beq	8c0 <printf+0x50>
 8ac:	e24b1018 	sub	r1, fp, #24
 8b0:	e3a02001 	mov	r2, #1
 8b4:	e1a00007 	mov	r0, r7
 8b8:	e5614006 	strb	r4, [r1, #-6]!
 8bc:	ebfffed3 	bl	410 <write>
 8c0:	e5f64001 	ldrb	r4, [r6, #1]!
 8c4:	e3540000 	cmp	r4, #0
 8c8:	0a00001c 	beq	940 <printf+0xd0>
 8cc:	e3550000 	cmp	r5, #0
 8d0:	0afffff2 	beq	8a0 <printf+0x30>
 8d4:	e3550025 	cmp	r5, #37	; 0x25
 8d8:	1afffff8 	bne	8c0 <printf+0x50>
 8dc:	e3540064 	cmp	r4, #100	; 0x64
 8e0:	0a000037 	beq	9c4 <printf+0x154>
 8e4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8e8:	e3530070 	cmp	r3, #112	; 0x70
 8ec:	0a000017 	beq	950 <printf+0xe0>
 8f0:	e3540073 	cmp	r4, #115	; 0x73
 8f4:	0a00001c 	beq	96c <printf+0xfc>
 8f8:	e3540063 	cmp	r4, #99	; 0x63
 8fc:	0a000037 	beq	9e0 <printf+0x170>
 900:	e3540025 	cmp	r4, #37	; 0x25
 904:	0a000027 	beq	9a8 <printf+0x138>
 908:	e3a02001 	mov	r2, #1
 90c:	e24b1019 	sub	r1, fp, #25
 910:	e1a00007 	mov	r0, r7
 914:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 918:	ebfffebc 	bl	410 <write>
 91c:	e3a02001 	mov	r2, #1
 920:	e24b101a 	sub	r1, fp, #26
 924:	e1a00007 	mov	r0, r7
 928:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 92c:	ebfffeb7 	bl	410 <write>
 930:	e5f64001 	ldrb	r4, [r6, #1]!
 934:	e3a05000 	mov	r5, #0
 938:	e3540000 	cmp	r4, #0
 93c:	1affffe2 	bne	8cc <printf+0x5c>
 940:	e24bd018 	sub	sp, fp, #24
 944:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 948:	e28dd00c 	add	sp, sp, #12
 94c:	e12fff1e 	bx	lr
 950:	e3a03000 	mov	r3, #0
 954:	e3a02010 	mov	r2, #16
 958:	e4981004 	ldr	r1, [r8], #4
 95c:	e1a00007 	mov	r0, r7
 960:	ebffff7a 	bl	750 <printint>
 964:	e3a05000 	mov	r5, #0
 968:	eaffffd4 	b	8c0 <printf+0x50>
 96c:	e4984004 	ldr	r4, [r8], #4
 970:	e3540000 	cmp	r4, #0
 974:	0a000021 	beq	a00 <printf+0x190>
 978:	e5d45000 	ldrb	r5, [r4]
 97c:	e3550000 	cmp	r5, #0
 980:	0affffce 	beq	8c0 <printf+0x50>
 984:	e3a02001 	mov	r2, #1
 988:	e24b101d 	sub	r1, fp, #29
 98c:	e1a00007 	mov	r0, r7
 990:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 994:	ebfffe9d 	bl	410 <write>
 998:	e5f45001 	ldrb	r5, [r4, #1]!
 99c:	e3550000 	cmp	r5, #0
 9a0:	1afffff7 	bne	984 <printf+0x114>
 9a4:	eaffffc5 	b	8c0 <printf+0x50>
 9a8:	e24b1018 	sub	r1, fp, #24
 9ac:	e3a02001 	mov	r2, #1
 9b0:	e1a00007 	mov	r0, r7
 9b4:	e5615003 	strb	r5, [r1, #-3]!
 9b8:	e3a05000 	mov	r5, #0
 9bc:	ebfffe93 	bl	410 <write>
 9c0:	eaffffbe 	b	8c0 <printf+0x50>
 9c4:	e3a03001 	mov	r3, #1
 9c8:	e3a0200a 	mov	r2, #10
 9cc:	e4981004 	ldr	r1, [r8], #4
 9d0:	e1a00007 	mov	r0, r7
 9d4:	ebffff5d 	bl	750 <printint>
 9d8:	e3a05000 	mov	r5, #0
 9dc:	eaffffb7 	b	8c0 <printf+0x50>
 9e0:	e4983004 	ldr	r3, [r8], #4
 9e4:	e24b1018 	sub	r1, fp, #24
 9e8:	e3a02001 	mov	r2, #1
 9ec:	e1a00007 	mov	r0, r7
 9f0:	e3a05000 	mov	r5, #0
 9f4:	e5613004 	strb	r3, [r1, #-4]!
 9f8:	ebfffe84 	bl	410 <write>
 9fc:	eaffffaf 	b	8c0 <printf+0x50>
 a00:	e3004bac 	movw	r4, #2988	; 0xbac
 a04:	e3a05028 	mov	r5, #40	; 0x28
 a08:	e3404000 	movt	r4, #0
 a0c:	eaffffdc 	b	984 <printf+0x114>

00000a10 <free>:
 a10:	e300cbb4 	movw	ip, #2996	; 0xbb4
 a14:	e340c000 	movt	ip, #0
 a18:	e92d4810 	push	{r4, fp, lr}
 a1c:	e2401008 	sub	r1, r0, #8
 a20:	e28db008 	add	fp, sp, #8
 a24:	e59c3000 	ldr	r3, [ip]
 a28:	ea000004 	b	a40 <free+0x30>
 a2c:	e1510002 	cmp	r1, r2
 a30:	3a000009 	bcc	a5c <free+0x4c>
 a34:	e1530002 	cmp	r3, r2
 a38:	2a000007 	bcs	a5c <free+0x4c>
 a3c:	e1a03002 	mov	r3, r2
 a40:	e1530001 	cmp	r3, r1
 a44:	e5932000 	ldr	r2, [r3]
 a48:	3afffff7 	bcc	a2c <free+0x1c>
 a4c:	e1530002 	cmp	r3, r2
 a50:	3afffff9 	bcc	a3c <free+0x2c>
 a54:	e1510002 	cmp	r1, r2
 a58:	2afffff7 	bcs	a3c <free+0x2c>
 a5c:	e510e004 	ldr	lr, [r0, #-4]
 a60:	e58c3000 	str	r3, [ip]
 a64:	e081418e 	add	r4, r1, lr, lsl #3
 a68:	e1520004 	cmp	r2, r4
 a6c:	05922004 	ldreq	r2, [r2, #4]
 a70:	0082e00e 	addeq	lr, r2, lr
 a74:	0500e004 	streq	lr, [r0, #-4]
 a78:	05932000 	ldreq	r2, [r3]
 a7c:	05922000 	ldreq	r2, [r2]
 a80:	e5002008 	str	r2, [r0, #-8]
 a84:	e5932004 	ldr	r2, [r3, #4]
 a88:	e083e182 	add	lr, r3, r2, lsl #3
 a8c:	e151000e 	cmp	r1, lr
 a90:	15831000 	strne	r1, [r3]
 a94:	05101004 	ldreq	r1, [r0, #-4]
 a98:	00812002 	addeq	r2, r1, r2
 a9c:	05832004 	streq	r2, [r3, #4]
 aa0:	05102008 	ldreq	r2, [r0, #-8]
 aa4:	05832000 	streq	r2, [r3]
 aa8:	e8bd8810 	pop	{r4, fp, pc}

00000aac <malloc>:
 aac:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 ab0:	e3007bb4 	movw	r7, #2996	; 0xbb4
 ab4:	e3407000 	movt	r7, #0
 ab8:	e2804007 	add	r4, r0, #7
 abc:	e28db014 	add	fp, sp, #20
 ac0:	e5973000 	ldr	r3, [r7]
 ac4:	e1a041a4 	lsr	r4, r4, #3
 ac8:	e2844001 	add	r4, r4, #1
 acc:	e3530000 	cmp	r3, #0
 ad0:	0a000027 	beq	b74 <malloc+0xc8>
 ad4:	e5930000 	ldr	r0, [r3]
 ad8:	e5902004 	ldr	r2, [r0, #4]
 adc:	e1540002 	cmp	r4, r2
 ae0:	9a000019 	bls	b4c <malloc+0xa0>
 ae4:	e3540a01 	cmp	r4, #4096	; 0x1000
 ae8:	21a05004 	movcs	r5, r4
 aec:	33a05a01 	movcc	r5, #4096	; 0x1000
 af0:	e1a06185 	lsl	r6, r5, #3
 af4:	ea000003 	b	b08 <malloc+0x5c>
 af8:	e5930000 	ldr	r0, [r3]
 afc:	e5902004 	ldr	r2, [r0, #4]
 b00:	e1540002 	cmp	r4, r2
 b04:	9a000010 	bls	b4c <malloc+0xa0>
 b08:	e5972000 	ldr	r2, [r7]
 b0c:	e1a03000 	mov	r3, r0
 b10:	e1520000 	cmp	r2, r0
 b14:	1afffff7 	bne	af8 <malloc+0x4c>
 b18:	e1a00006 	mov	r0, r6
 b1c:	ebfffee4 	bl	6b4 <sbrk>
 b20:	e1a03000 	mov	r3, r0
 b24:	e3730001 	cmn	r3, #1
 b28:	e2800008 	add	r0, r0, #8
 b2c:	0a000004 	beq	b44 <malloc+0x98>
 b30:	e5835004 	str	r5, [r3, #4]
 b34:	ebffffb5 	bl	a10 <free>
 b38:	e5973000 	ldr	r3, [r7]
 b3c:	e3530000 	cmp	r3, #0
 b40:	1affffec 	bne	af8 <malloc+0x4c>
 b44:	e3a00000 	mov	r0, #0
 b48:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b4c:	e1540002 	cmp	r4, r2
 b50:	e5873000 	str	r3, [r7]
 b54:	10422004 	subne	r2, r2, r4
 b58:	15802004 	strne	r2, [r0, #4]
 b5c:	05902000 	ldreq	r2, [r0]
 b60:	10800182 	addne	r0, r0, r2, lsl #3
 b64:	e2800008 	add	r0, r0, #8
 b68:	15004004 	strne	r4, [r0, #-4]
 b6c:	05832000 	streq	r2, [r3]
 b70:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 b74:	e2870004 	add	r0, r7, #4
 b78:	e5873008 	str	r3, [r7, #8]
 b7c:	e5870000 	str	r0, [r7]
 b80:	e5870004 	str	r0, [r7, #4]
 b84:	eaffffd6 	b	ae4 <malloc+0x38>
