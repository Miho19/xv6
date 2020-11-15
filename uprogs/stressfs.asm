
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3003c50 	movw	r3, #3152	; 0xc50
   4:	e3403000 	movt	r3, #0
   8:	e92d4830 	push	{r4, r5, fp, lr}
   c:	e28db00c 	add	fp, sp, #12
  10:	e24dde21 	sub	sp, sp, #528	; 0x210
  14:	e8930007 	ldm	r3, {r0, r1, r2}
  18:	e24b3f86 	sub	r3, fp, #536	; 0x218
  1c:	e3a04000 	mov	r4, #0
  20:	e8a30003 	stmia	r3!, {r0, r1}
  24:	e3a00001 	mov	r0, #1
  28:	e3001c28 	movw	r1, #3112	; 0xc28
  2c:	e3401000 	movt	r1, #0
  30:	e1c320b0 	strh	r2, [r3]
  34:	eb000235 	bl	910 <printf>
  38:	e24b0f83 	sub	r0, fp, #524	; 0x20c
  3c:	e3a02c02 	mov	r2, #512	; 0x200
  40:	e3a01061 	mov	r1, #97	; 0x61
  44:	eb000061 	bl	1d0 <memset>
  48:	eb0000ca 	bl	378 <fork>
  4c:	e3500000 	cmp	r0, #0
  50:	ca00002b 	bgt	104 <main+0x104>
  54:	e2844001 	add	r4, r4, #1
  58:	e3540004 	cmp	r4, #4
  5c:	1afffff9 	bne	48 <main+0x48>
  60:	e1a05004 	mov	r5, r4
  64:	e1a02004 	mov	r2, r4
  68:	e3a00001 	mov	r0, #1
  6c:	e3001c3c 	movw	r1, #3132	; 0xc3c
  70:	e3401000 	movt	r1, #0
  74:	eb000225 	bl	910 <printf>
  78:	e55b3210 	ldrb	r3, [fp, #-528]	; 0xfffffdf0
  7c:	e3001202 	movw	r1, #514	; 0x202
  80:	e24b0f86 	sub	r0, fp, #536	; 0x218
  84:	e0855003 	add	r5, r5, r3
  88:	e54b5210 	strb	r5, [fp, #-528]	; 0xfffffdf0
  8c:	eb00013b 	bl	580 <open>
  90:	e3a04014 	mov	r4, #20
  94:	e1a05000 	mov	r5, r0
  98:	e3a02c02 	mov	r2, #512	; 0x200
  9c:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  a0:	e1a00005 	mov	r0, r5
  a4:	eb000101 	bl	4b0 <write>
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffff9 	bne	98 <main+0x98>
  b0:	e1a00005 	mov	r0, r5
  b4:	e3a05014 	mov	r5, #20
  b8:	eb000109 	bl	4e4 <close>
  bc:	e3a00001 	mov	r0, #1
  c0:	e3001c48 	movw	r1, #3144	; 0xc48
  c4:	e3401000 	movt	r1, #0
  c8:	eb000210 	bl	910 <printf>
  cc:	e1a01004 	mov	r1, r4
  d0:	e24b0f86 	sub	r0, fp, #536	; 0x218
  d4:	eb000129 	bl	580 <open>
  d8:	e1a04000 	mov	r4, r0
  dc:	e3a02c02 	mov	r2, #512	; 0x200
  e0:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  e4:	e1a00004 	mov	r0, r4
  e8:	eb0000e3 	bl	47c <read>
  ec:	e2555001 	subs	r5, r5, #1
  f0:	1afffff9 	bne	dc <main+0xdc>
  f4:	e1a00004 	mov	r0, r4
  f8:	eb0000f9 	bl	4e4 <close>
  fc:	eb0000b7 	bl	3e0 <wait>
 100:	eb0000a9 	bl	3ac <exit>
 104:	e6ef5074 	uxtb	r5, r4
 108:	eaffffd5 	b	64 <main+0x64>

0000010c <strcpy>:
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e2402001 	sub	r2, r0, #1
 114:	e28db000 	add	fp, sp, #0
 118:	e4d13001 	ldrb	r3, [r1], #1
 11c:	e3530000 	cmp	r3, #0
 120:	e5e23001 	strb	r3, [r2, #1]!
 124:	1afffffb 	bne	118 <strcpy+0xc>
 128:	e28bd000 	add	sp, fp, #0
 12c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 130:	e12fff1e 	bx	lr

00000134 <strcmp>:
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
 13c:	e5d03000 	ldrb	r3, [r0]
 140:	e5d12000 	ldrb	r2, [r1]
 144:	e3530000 	cmp	r3, #0
 148:	1a000004 	bne	160 <strcmp+0x2c>
 14c:	ea000005 	b	168 <strcmp+0x34>
 150:	e5f03001 	ldrb	r3, [r0, #1]!
 154:	e3530000 	cmp	r3, #0
 158:	0a000006 	beq	178 <strcmp+0x44>
 15c:	e5f12001 	ldrb	r2, [r1, #1]!
 160:	e1530002 	cmp	r3, r2
 164:	0afffff9 	beq	150 <strcmp+0x1c>
 168:	e0430002 	sub	r0, r3, r2
 16c:	e28bd000 	add	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr
 178:	e5d12001 	ldrb	r2, [r1, #1]
 17c:	e0430002 	sub	r0, r3, r2
 180:	e28bd000 	add	sp, fp, #0
 184:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 188:	e12fff1e 	bx	lr

0000018c <strlen>:
 18c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 190:	e28db000 	add	fp, sp, #0
 194:	e5d03000 	ldrb	r3, [r0]
 198:	e3530000 	cmp	r3, #0
 19c:	0a000009 	beq	1c8 <strlen+0x3c>
 1a0:	e1a02000 	mov	r2, r0
 1a4:	e3a03000 	mov	r3, #0
 1a8:	e5f21001 	ldrb	r1, [r2, #1]!
 1ac:	e2833001 	add	r3, r3, #1
 1b0:	e3510000 	cmp	r1, #0
 1b4:	e1a00003 	mov	r0, r3
 1b8:	1afffffa 	bne	1a8 <strlen+0x1c>
 1bc:	e28bd000 	add	sp, fp, #0
 1c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1c4:	e12fff1e 	bx	lr
 1c8:	e1a00003 	mov	r0, r3
 1cc:	eafffffa 	b	1bc <strlen+0x30>

000001d0 <memset>:
 1d0:	e3520000 	cmp	r2, #0
 1d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1d8:	e28db000 	add	fp, sp, #0
 1dc:	0a000004 	beq	1f4 <memset+0x24>
 1e0:	e6ef1071 	uxtb	r1, r1
 1e4:	e0802002 	add	r2, r0, r2
 1e8:	e4c01001 	strb	r1, [r0], #1
 1ec:	e1520000 	cmp	r2, r0
 1f0:	1afffffc 	bne	1e8 <memset+0x18>
 1f4:	e28bd000 	add	sp, fp, #0
 1f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1fc:	e12fff1e 	bx	lr

00000200 <strchr>:
 200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 204:	e28db000 	add	fp, sp, #0
 208:	e5d02000 	ldrb	r2, [r0]
 20c:	e3520000 	cmp	r2, #0
 210:	0a00000b 	beq	244 <strchr+0x44>
 214:	e1510002 	cmp	r1, r2
 218:	1a000002 	bne	228 <strchr+0x28>
 21c:	ea000005 	b	238 <strchr+0x38>
 220:	e1530001 	cmp	r3, r1
 224:	0a000003 	beq	238 <strchr+0x38>
 228:	e5f03001 	ldrb	r3, [r0, #1]!
 22c:	e3530000 	cmp	r3, #0
 230:	1afffffa 	bne	220 <strchr+0x20>
 234:	e1a00003 	mov	r0, r3
 238:	e28bd000 	add	sp, fp, #0
 23c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 240:	e12fff1e 	bx	lr
 244:	e1a00002 	mov	r0, r2
 248:	eafffffa 	b	238 <strchr+0x38>

0000024c <gets>:
 24c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 250:	e1a08000 	mov	r8, r0
 254:	e28db018 	add	fp, sp, #24
 258:	e1a07001 	mov	r7, r1
 25c:	e24dd00c 	sub	sp, sp, #12
 260:	e2406001 	sub	r6, r0, #1
 264:	e3a05000 	mov	r5, #0
 268:	ea000008 	b	290 <gets+0x44>
 26c:	eb000082 	bl	47c <read>
 270:	e3500000 	cmp	r0, #0
 274:	da00000b 	ble	2a8 <gets+0x5c>
 278:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 27c:	e1a05004 	mov	r5, r4
 280:	e353000d 	cmp	r3, #13
 284:	1353000a 	cmpne	r3, #10
 288:	e5e63001 	strb	r3, [r6, #1]!
 28c:	0a000005 	beq	2a8 <gets+0x5c>
 290:	e3a02001 	mov	r2, #1
 294:	e0854002 	add	r4, r5, r2
 298:	e1540007 	cmp	r4, r7
 29c:	e24b101d 	sub	r1, fp, #29
 2a0:	e3a00000 	mov	r0, #0
 2a4:	bafffff0 	blt	26c <gets+0x20>
 2a8:	e3a03000 	mov	r3, #0
 2ac:	e1a00008 	mov	r0, r8
 2b0:	e7c83005 	strb	r3, [r8, r5]
 2b4:	e24bd018 	sub	sp, fp, #24
 2b8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000002bc <stat>:
 2bc:	e92d4830 	push	{r4, r5, fp, lr}
 2c0:	e1a04001 	mov	r4, r1
 2c4:	e28db00c 	add	fp, sp, #12
 2c8:	e3a01000 	mov	r1, #0
 2cc:	eb0000ab 	bl	580 <open>
 2d0:	e2505000 	subs	r5, r0, #0
 2d4:	ba000006 	blt	2f4 <stat+0x38>
 2d8:	e1a01004 	mov	r1, r4
 2dc:	eb0000ce 	bl	61c <fstat>
 2e0:	e1a04000 	mov	r4, r0
 2e4:	e1a00005 	mov	r0, r5
 2e8:	eb00007d 	bl	4e4 <close>
 2ec:	e1a00004 	mov	r0, r4
 2f0:	e8bd8830 	pop	{r4, r5, fp, pc}
 2f4:	e3e04000 	mvn	r4, #0
 2f8:	eafffffb 	b	2ec <stat+0x30>

000002fc <atoi>:
 2fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 300:	e28db000 	add	fp, sp, #0
 304:	e5d02000 	ldrb	r2, [r0]
 308:	e2423030 	sub	r3, r2, #48	; 0x30
 30c:	e3530009 	cmp	r3, #9
 310:	e3a03000 	mov	r3, #0
 314:	8a000006 	bhi	334 <atoi+0x38>
 318:	e3a0c00a 	mov	ip, #10
 31c:	e023239c 	mla	r3, ip, r3, r2
 320:	e5f02001 	ldrb	r2, [r0, #1]!
 324:	e2421030 	sub	r1, r2, #48	; 0x30
 328:	e3510009 	cmp	r1, #9
 32c:	e2433030 	sub	r3, r3, #48	; 0x30
 330:	9afffff9 	bls	31c <atoi+0x20>
 334:	e1a00003 	mov	r0, r3
 338:	e28bd000 	add	sp, fp, #0
 33c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <memmove>:
 344:	e3520000 	cmp	r2, #0
 348:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 34c:	e28db000 	add	fp, sp, #0
 350:	da000005 	ble	36c <memmove+0x28>
 354:	e0812002 	add	r2, r1, r2
 358:	e2403001 	sub	r3, r0, #1
 35c:	e4d1c001 	ldrb	ip, [r1], #1
 360:	e1510002 	cmp	r1, r2
 364:	e5e3c001 	strb	ip, [r3, #1]!
 368:	1afffffb 	bne	35c <memmove+0x18>
 36c:	e28bd000 	add	sp, fp, #0
 370:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <fork>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00001 	mov	r0, #1
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <exit>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00002 	mov	r0, #2
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <wait>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00003 	mov	r0, #3
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <lseek>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00016 	mov	r0, #22
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <pipe>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00004 	mov	r0, #4
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <read>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00005 	mov	r0, #5
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <write>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00010 	mov	r0, #16
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <close>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00015 	mov	r0, #21
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <kill>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00006 	mov	r0, #6
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <exec>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00007 	mov	r0, #7
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <open>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a0000f 	mov	r0, #15
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <mknod>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00011 	mov	r0, #17
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <unlink>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00012 	mov	r0, #18
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <fstat>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00008 	mov	r0, #8
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <link>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a00013 	mov	r0, #19
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <mkdir>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a00014 	mov	r0, #20
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <chdir>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a00009 	mov	r0, #9
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <dup>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000a 	mov	r0, #10
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <getpid>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000b 	mov	r0, #11
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <sbrk>:
 754:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 758:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 75c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 760:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 764:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 768:	e3a0000c 	mov	r0, #12
 76c:	ef000040 	svc	0x00000040
 770:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 77c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 780:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 784:	e12fff1e 	bx	lr

00000788 <sleep>:
 788:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 78c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 790:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 794:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 798:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 79c:	e3a0000d 	mov	r0, #13
 7a0:	ef000040 	svc	0x00000040
 7a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b8:	e12fff1e 	bx	lr

000007bc <uptime>:
 7bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d0:	e3a0000e 	mov	r0, #14
 7d4:	ef000040 	svc	0x00000040
 7d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ec:	e12fff1e 	bx	lr

000007f0 <printint>:
 7f0:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 7f4:	e1a09fa1 	lsr	r9, r1, #31
 7f8:	e3530000 	cmp	r3, #0
 7fc:	03a09000 	moveq	r9, #0
 800:	12099001 	andne	r9, r9, #1
 804:	e28db01c 	add	fp, sp, #28
 808:	e3590000 	cmp	r9, #0
 80c:	e3008c5c 	movw	r8, #3164	; 0xc5c
 810:	1261e000 	rsbne	lr, r1, #0
 814:	e3408000 	movt	r8, #0
 818:	e24b602d 	sub	r6, fp, #45	; 0x2d
 81c:	e1a04000 	mov	r4, r0
 820:	13a09001 	movne	r9, #1
 824:	01a0e001 	moveq	lr, r1
 828:	e3a07000 	mov	r7, #0
 82c:	e3a05001 	mov	r5, #1
 830:	e24dd018 	sub	sp, sp, #24
 834:	e3a0c000 	mov	ip, #0
 838:	e3a0301f 	mov	r3, #31
 83c:	e1a0100c 	mov	r1, ip
 840:	e1a0033e 	lsr	r0, lr, r3
 844:	e2000001 	and	r0, r0, #1
 848:	e1801081 	orr	r1, r0, r1, lsl #1
 84c:	e1520001 	cmp	r2, r1
 850:	90411002 	subls	r1, r1, r2
 854:	918cc315 	orrls	ip, ip, r5, lsl r3
 858:	e2533001 	subs	r3, r3, #1
 85c:	2afffff7 	bcs	840 <printint+0x50>
 860:	e061e29c 	mls	r1, ip, r2, lr
 864:	e35c0000 	cmp	ip, #0
 868:	e1a0e00c 	mov	lr, ip
 86c:	e2873001 	add	r3, r7, #1
 870:	e7d81001 	ldrb	r1, [r8, r1]
 874:	e5e61001 	strb	r1, [r6, #1]!
 878:	11a07003 	movne	r7, r3
 87c:	1affffec 	bne	834 <printint+0x44>
 880:	e3590000 	cmp	r9, #0
 884:	124b201c 	subne	r2, fp, #28
 888:	10822003 	addne	r2, r2, r3
 88c:	13a0102d 	movne	r1, #45	; 0x2d
 890:	12873002 	addne	r3, r7, #2
 894:	15421010 	strbne	r1, [r2, #-16]
 898:	e24b202c 	sub	r2, fp, #44	; 0x2c
 89c:	e2435001 	sub	r5, r3, #1
 8a0:	e0826003 	add	r6, r2, r3
 8a4:	e5763001 	ldrb	r3, [r6, #-1]!
 8a8:	e2455001 	sub	r5, r5, #1
 8ac:	e3a02001 	mov	r2, #1
 8b0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 8b4:	e1a00004 	mov	r0, r4
 8b8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 8bc:	ebfffefb 	bl	4b0 <write>
 8c0:	e3750001 	cmn	r5, #1
 8c4:	1afffff6 	bne	8a4 <printint+0xb4>
 8c8:	e24bd01c 	sub	sp, fp, #28
 8cc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000008d0 <div>:
 8d0:	e92d4810 	push	{r4, fp, lr}
 8d4:	e3a02000 	mov	r2, #0
 8d8:	e28db008 	add	fp, sp, #8
 8dc:	e1a0e000 	mov	lr, r0
 8e0:	e3a0301f 	mov	r3, #31
 8e4:	e1a00002 	mov	r0, r2
 8e8:	e3a04001 	mov	r4, #1
 8ec:	e1a0c33e 	lsr	ip, lr, r3
 8f0:	e20cc001 	and	ip, ip, #1
 8f4:	e18c2082 	orr	r2, ip, r2, lsl #1
 8f8:	e1520001 	cmp	r2, r1
 8fc:	20422001 	subcs	r2, r2, r1
 900:	21800314 	orrcs	r0, r0, r4, lsl r3
 904:	e2533001 	subs	r3, r3, #1
 908:	2afffff7 	bcs	8ec <div+0x1c>
 90c:	e8bd8810 	pop	{r4, fp, pc}

00000910 <printf>:
 910:	e92d000e 	push	{r1, r2, r3}
 914:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 918:	e28db018 	add	fp, sp, #24
 91c:	e24dd008 	sub	sp, sp, #8
 920:	e59b6004 	ldr	r6, [fp, #4]
 924:	e5d64000 	ldrb	r4, [r6]
 928:	e3540000 	cmp	r4, #0
 92c:	0a00002b 	beq	9e0 <printf+0xd0>
 930:	e1a07000 	mov	r7, r0
 934:	e28b8008 	add	r8, fp, #8
 938:	e3a05000 	mov	r5, #0
 93c:	ea00000a 	b	96c <printf+0x5c>
 940:	e3540025 	cmp	r4, #37	; 0x25
 944:	01a05004 	moveq	r5, r4
 948:	0a000004 	beq	960 <printf+0x50>
 94c:	e24b1018 	sub	r1, fp, #24
 950:	e3a02001 	mov	r2, #1
 954:	e1a00007 	mov	r0, r7
 958:	e5614006 	strb	r4, [r1, #-6]!
 95c:	ebfffed3 	bl	4b0 <write>
 960:	e5f64001 	ldrb	r4, [r6, #1]!
 964:	e3540000 	cmp	r4, #0
 968:	0a00001c 	beq	9e0 <printf+0xd0>
 96c:	e3550000 	cmp	r5, #0
 970:	0afffff2 	beq	940 <printf+0x30>
 974:	e3550025 	cmp	r5, #37	; 0x25
 978:	1afffff8 	bne	960 <printf+0x50>
 97c:	e3540064 	cmp	r4, #100	; 0x64
 980:	0a000037 	beq	a64 <printf+0x154>
 984:	e20430f7 	and	r3, r4, #247	; 0xf7
 988:	e3530070 	cmp	r3, #112	; 0x70
 98c:	0a000017 	beq	9f0 <printf+0xe0>
 990:	e3540073 	cmp	r4, #115	; 0x73
 994:	0a00001c 	beq	a0c <printf+0xfc>
 998:	e3540063 	cmp	r4, #99	; 0x63
 99c:	0a000037 	beq	a80 <printf+0x170>
 9a0:	e3540025 	cmp	r4, #37	; 0x25
 9a4:	0a000027 	beq	a48 <printf+0x138>
 9a8:	e3a02001 	mov	r2, #1
 9ac:	e24b1019 	sub	r1, fp, #25
 9b0:	e1a00007 	mov	r0, r7
 9b4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 9b8:	ebfffebc 	bl	4b0 <write>
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e24b101a 	sub	r1, fp, #26
 9c4:	e1a00007 	mov	r0, r7
 9c8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 9cc:	ebfffeb7 	bl	4b0 <write>
 9d0:	e5f64001 	ldrb	r4, [r6, #1]!
 9d4:	e3a05000 	mov	r5, #0
 9d8:	e3540000 	cmp	r4, #0
 9dc:	1affffe2 	bne	96c <printf+0x5c>
 9e0:	e24bd018 	sub	sp, fp, #24
 9e4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9e8:	e28dd00c 	add	sp, sp, #12
 9ec:	e12fff1e 	bx	lr
 9f0:	e3a03000 	mov	r3, #0
 9f4:	e3a02010 	mov	r2, #16
 9f8:	e4981004 	ldr	r1, [r8], #4
 9fc:	e1a00007 	mov	r0, r7
 a00:	ebffff7a 	bl	7f0 <printint>
 a04:	e3a05000 	mov	r5, #0
 a08:	eaffffd4 	b	960 <printf+0x50>
 a0c:	e4984004 	ldr	r4, [r8], #4
 a10:	e3540000 	cmp	r4, #0
 a14:	0a000021 	beq	aa0 <printf+0x190>
 a18:	e5d45000 	ldrb	r5, [r4]
 a1c:	e3550000 	cmp	r5, #0
 a20:	0affffce 	beq	960 <printf+0x50>
 a24:	e3a02001 	mov	r2, #1
 a28:	e24b101d 	sub	r1, fp, #29
 a2c:	e1a00007 	mov	r0, r7
 a30:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a34:	ebfffe9d 	bl	4b0 <write>
 a38:	e5f45001 	ldrb	r5, [r4, #1]!
 a3c:	e3550000 	cmp	r5, #0
 a40:	1afffff7 	bne	a24 <printf+0x114>
 a44:	eaffffc5 	b	960 <printf+0x50>
 a48:	e24b1018 	sub	r1, fp, #24
 a4c:	e3a02001 	mov	r2, #1
 a50:	e1a00007 	mov	r0, r7
 a54:	e5615003 	strb	r5, [r1, #-3]!
 a58:	e3a05000 	mov	r5, #0
 a5c:	ebfffe93 	bl	4b0 <write>
 a60:	eaffffbe 	b	960 <printf+0x50>
 a64:	e3a03001 	mov	r3, #1
 a68:	e3a0200a 	mov	r2, #10
 a6c:	e4981004 	ldr	r1, [r8], #4
 a70:	e1a00007 	mov	r0, r7
 a74:	ebffff5d 	bl	7f0 <printint>
 a78:	e3a05000 	mov	r5, #0
 a7c:	eaffffb7 	b	960 <printf+0x50>
 a80:	e4983004 	ldr	r3, [r8], #4
 a84:	e24b1018 	sub	r1, fp, #24
 a88:	e3a02001 	mov	r2, #1
 a8c:	e1a00007 	mov	r0, r7
 a90:	e3a05000 	mov	r5, #0
 a94:	e5613004 	strb	r3, [r1, #-4]!
 a98:	ebfffe84 	bl	4b0 <write>
 a9c:	eaffffaf 	b	960 <printf+0x50>
 aa0:	e3004c70 	movw	r4, #3184	; 0xc70
 aa4:	e3a05028 	mov	r5, #40	; 0x28
 aa8:	e3404000 	movt	r4, #0
 aac:	eaffffdc 	b	a24 <printf+0x114>

00000ab0 <free>:
 ab0:	e300cc78 	movw	ip, #3192	; 0xc78
 ab4:	e340c000 	movt	ip, #0
 ab8:	e92d4810 	push	{r4, fp, lr}
 abc:	e2401008 	sub	r1, r0, #8
 ac0:	e28db008 	add	fp, sp, #8
 ac4:	e59c3000 	ldr	r3, [ip]
 ac8:	ea000004 	b	ae0 <free+0x30>
 acc:	e1510002 	cmp	r1, r2
 ad0:	3a000009 	bcc	afc <free+0x4c>
 ad4:	e1530002 	cmp	r3, r2
 ad8:	2a000007 	bcs	afc <free+0x4c>
 adc:	e1a03002 	mov	r3, r2
 ae0:	e1530001 	cmp	r3, r1
 ae4:	e5932000 	ldr	r2, [r3]
 ae8:	3afffff7 	bcc	acc <free+0x1c>
 aec:	e1530002 	cmp	r3, r2
 af0:	3afffff9 	bcc	adc <free+0x2c>
 af4:	e1510002 	cmp	r1, r2
 af8:	2afffff7 	bcs	adc <free+0x2c>
 afc:	e510e004 	ldr	lr, [r0, #-4]
 b00:	e58c3000 	str	r3, [ip]
 b04:	e081418e 	add	r4, r1, lr, lsl #3
 b08:	e1520004 	cmp	r2, r4
 b0c:	05922004 	ldreq	r2, [r2, #4]
 b10:	0082e00e 	addeq	lr, r2, lr
 b14:	0500e004 	streq	lr, [r0, #-4]
 b18:	05932000 	ldreq	r2, [r3]
 b1c:	05922000 	ldreq	r2, [r2]
 b20:	e5002008 	str	r2, [r0, #-8]
 b24:	e5932004 	ldr	r2, [r3, #4]
 b28:	e083e182 	add	lr, r3, r2, lsl #3
 b2c:	e151000e 	cmp	r1, lr
 b30:	15831000 	strne	r1, [r3]
 b34:	05101004 	ldreq	r1, [r0, #-4]
 b38:	00812002 	addeq	r2, r1, r2
 b3c:	05832004 	streq	r2, [r3, #4]
 b40:	05102008 	ldreq	r2, [r0, #-8]
 b44:	05832000 	streq	r2, [r3]
 b48:	e8bd8810 	pop	{r4, fp, pc}

00000b4c <malloc>:
 b4c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 b50:	e3007c78 	movw	r7, #3192	; 0xc78
 b54:	e3407000 	movt	r7, #0
 b58:	e2804007 	add	r4, r0, #7
 b5c:	e28db014 	add	fp, sp, #20
 b60:	e5973000 	ldr	r3, [r7]
 b64:	e1a041a4 	lsr	r4, r4, #3
 b68:	e2844001 	add	r4, r4, #1
 b6c:	e3530000 	cmp	r3, #0
 b70:	0a000027 	beq	c14 <malloc+0xc8>
 b74:	e5930000 	ldr	r0, [r3]
 b78:	e5902004 	ldr	r2, [r0, #4]
 b7c:	e1540002 	cmp	r4, r2
 b80:	9a000019 	bls	bec <malloc+0xa0>
 b84:	e3540a01 	cmp	r4, #4096	; 0x1000
 b88:	21a05004 	movcs	r5, r4
 b8c:	33a05a01 	movcc	r5, #4096	; 0x1000
 b90:	e1a06185 	lsl	r6, r5, #3
 b94:	ea000003 	b	ba8 <malloc+0x5c>
 b98:	e5930000 	ldr	r0, [r3]
 b9c:	e5902004 	ldr	r2, [r0, #4]
 ba0:	e1540002 	cmp	r4, r2
 ba4:	9a000010 	bls	bec <malloc+0xa0>
 ba8:	e5972000 	ldr	r2, [r7]
 bac:	e1a03000 	mov	r3, r0
 bb0:	e1520000 	cmp	r2, r0
 bb4:	1afffff7 	bne	b98 <malloc+0x4c>
 bb8:	e1a00006 	mov	r0, r6
 bbc:	ebfffee4 	bl	754 <sbrk>
 bc0:	e1a03000 	mov	r3, r0
 bc4:	e3730001 	cmn	r3, #1
 bc8:	e2800008 	add	r0, r0, #8
 bcc:	0a000004 	beq	be4 <malloc+0x98>
 bd0:	e5835004 	str	r5, [r3, #4]
 bd4:	ebffffb5 	bl	ab0 <free>
 bd8:	e5973000 	ldr	r3, [r7]
 bdc:	e3530000 	cmp	r3, #0
 be0:	1affffec 	bne	b98 <malloc+0x4c>
 be4:	e3a00000 	mov	r0, #0
 be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 bec:	e1540002 	cmp	r4, r2
 bf0:	e5873000 	str	r3, [r7]
 bf4:	10422004 	subne	r2, r2, r4
 bf8:	15802004 	strne	r2, [r0, #4]
 bfc:	05902000 	ldreq	r2, [r0]
 c00:	10800182 	addne	r0, r0, r2, lsl #3
 c04:	e2800008 	add	r0, r0, #8
 c08:	15004004 	strne	r4, [r0, #-4]
 c0c:	05832000 	streq	r2, [r3]
 c10:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 c14:	e2870004 	add	r0, r7, #4
 c18:	e5873008 	str	r3, [r7, #8]
 c1c:	e5870000 	str	r0, [r7]
 c20:	e5870004 	str	r0, [r7, #4]
 c24:	eaffffd6 	b	b84 <malloc+0x38>
