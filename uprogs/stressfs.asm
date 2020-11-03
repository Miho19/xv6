
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	e3003c1c 	movw	r3, #3100	; 0xc1c
   4:	e3403000 	movt	r3, #0
   8:	e92d4830 	push	{r4, r5, fp, lr}
   c:	e28db00c 	add	fp, sp, #12
  10:	e24dde21 	sub	sp, sp, #528	; 0x210
  14:	e8930007 	ldm	r3, {r0, r1, r2}
  18:	e24b3f86 	sub	r3, fp, #536	; 0x218
  1c:	e3a04000 	mov	r4, #0
  20:	e8a30003 	stmia	r3!, {r0, r1}
  24:	e3a00001 	mov	r0, #1
  28:	e3001bf4 	movw	r1, #3060	; 0xbf4
  2c:	e3401000 	movt	r1, #0
  30:	e1c320b0 	strh	r2, [r3]
  34:	eb000228 	bl	8dc <printf>
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
  6c:	e3001c08 	movw	r1, #3080	; 0xc08
  70:	e3401000 	movt	r1, #0
  74:	eb000218 	bl	8dc <printf>
  78:	e55b3210 	ldrb	r3, [fp, #-528]	; 0xfffffdf0
  7c:	e3001202 	movw	r1, #514	; 0x202
  80:	e24b0f86 	sub	r0, fp, #536	; 0x218
  84:	e0855003 	add	r5, r5, r3
  88:	e54b5210 	strb	r5, [fp, #-528]	; 0xfffffdf0
  8c:	eb00012e 	bl	54c <open>
  90:	e3a04014 	mov	r4, #20
  94:	e1a05000 	mov	r5, r0
  98:	e3a02c02 	mov	r2, #512	; 0x200
  9c:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  a0:	e1a00005 	mov	r0, r5
  a4:	eb0000f4 	bl	47c <write>
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffff9 	bne	98 <main+0x98>
  b0:	e1a00005 	mov	r0, r5
  b4:	e3a05014 	mov	r5, #20
  b8:	eb0000fc 	bl	4b0 <close>
  bc:	e3a00001 	mov	r0, #1
  c0:	e3001c14 	movw	r1, #3092	; 0xc14
  c4:	e3401000 	movt	r1, #0
  c8:	eb000203 	bl	8dc <printf>
  cc:	e1a01004 	mov	r1, r4
  d0:	e24b0f86 	sub	r0, fp, #536	; 0x218
  d4:	eb00011c 	bl	54c <open>
  d8:	e1a04000 	mov	r4, r0
  dc:	e3a02c02 	mov	r2, #512	; 0x200
  e0:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  e4:	e1a00004 	mov	r0, r4
  e8:	eb0000d6 	bl	448 <read>
  ec:	e2555001 	subs	r5, r5, #1
  f0:	1afffff9 	bne	dc <main+0xdc>
  f4:	e1a00004 	mov	r0, r4
  f8:	eb0000ec 	bl	4b0 <close>
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
 26c:	eb000075 	bl	448 <read>
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
 2cc:	eb00009e 	bl	54c <open>
 2d0:	e2505000 	subs	r5, r0, #0
 2d4:	ba000006 	blt	2f4 <stat+0x38>
 2d8:	e1a01004 	mov	r1, r4
 2dc:	eb0000c1 	bl	5e8 <fstat>
 2e0:	e1a04000 	mov	r4, r0
 2e4:	e1a00005 	mov	r0, r5
 2e8:	eb000070 	bl	4b0 <close>
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

00000414 <pipe>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00004 	mov	r0, #4
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <read>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00005 	mov	r0, #5
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <write>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00010 	mov	r0, #16
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <close>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a00015 	mov	r0, #21
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <kill>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00006 	mov	r0, #6
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <exec>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00007 	mov	r0, #7
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <open>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a0000f 	mov	r0, #15
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <mknod>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00011 	mov	r0, #17
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <unlink>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00012 	mov	r0, #18
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <fstat>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00008 	mov	r0, #8
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <link>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00013 	mov	r0, #19
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <mkdir>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a00014 	mov	r0, #20
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <chdir>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a00009 	mov	r0, #9
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <dup>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000a 	mov	r0, #10
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <getpid>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000b 	mov	r0, #11
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <sbrk>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000c 	mov	r0, #12
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <sleep>:
 754:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 758:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 75c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 760:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 764:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 768:	e3a0000d 	mov	r0, #13
 76c:	ef000040 	svc	0x00000040
 770:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 77c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 780:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 784:	e12fff1e 	bx	lr

00000788 <uptime>:
 788:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 78c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 790:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 794:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 798:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 79c:	e3a0000e 	mov	r0, #14
 7a0:	ef000040 	svc	0x00000040
 7a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b8:	e12fff1e 	bx	lr

000007bc <printint>:
 7bc:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 7c0:	e1a09fa1 	lsr	r9, r1, #31
 7c4:	e3530000 	cmp	r3, #0
 7c8:	03a09000 	moveq	r9, #0
 7cc:	12099001 	andne	r9, r9, #1
 7d0:	e28db01c 	add	fp, sp, #28
 7d4:	e3590000 	cmp	r9, #0
 7d8:	e3008c28 	movw	r8, #3112	; 0xc28
 7dc:	1261e000 	rsbne	lr, r1, #0
 7e0:	e3408000 	movt	r8, #0
 7e4:	e24b602d 	sub	r6, fp, #45	; 0x2d
 7e8:	e1a04000 	mov	r4, r0
 7ec:	13a09001 	movne	r9, #1
 7f0:	01a0e001 	moveq	lr, r1
 7f4:	e3a07000 	mov	r7, #0
 7f8:	e3a05001 	mov	r5, #1
 7fc:	e24dd018 	sub	sp, sp, #24
 800:	e3a0c000 	mov	ip, #0
 804:	e3a0301f 	mov	r3, #31
 808:	e1a0100c 	mov	r1, ip
 80c:	e1a0033e 	lsr	r0, lr, r3
 810:	e2000001 	and	r0, r0, #1
 814:	e1801081 	orr	r1, r0, r1, lsl #1
 818:	e1520001 	cmp	r2, r1
 81c:	90411002 	subls	r1, r1, r2
 820:	918cc315 	orrls	ip, ip, r5, lsl r3
 824:	e2533001 	subs	r3, r3, #1
 828:	2afffff7 	bcs	80c <printint+0x50>
 82c:	e061e29c 	mls	r1, ip, r2, lr
 830:	e35c0000 	cmp	ip, #0
 834:	e1a0e00c 	mov	lr, ip
 838:	e2873001 	add	r3, r7, #1
 83c:	e7d81001 	ldrb	r1, [r8, r1]
 840:	e5e61001 	strb	r1, [r6, #1]!
 844:	11a07003 	movne	r7, r3
 848:	1affffec 	bne	800 <printint+0x44>
 84c:	e3590000 	cmp	r9, #0
 850:	124b201c 	subne	r2, fp, #28
 854:	10822003 	addne	r2, r2, r3
 858:	13a0102d 	movne	r1, #45	; 0x2d
 85c:	12873002 	addne	r3, r7, #2
 860:	15421010 	strbne	r1, [r2, #-16]
 864:	e24b202c 	sub	r2, fp, #44	; 0x2c
 868:	e2435001 	sub	r5, r3, #1
 86c:	e0826003 	add	r6, r2, r3
 870:	e5763001 	ldrb	r3, [r6, #-1]!
 874:	e2455001 	sub	r5, r5, #1
 878:	e3a02001 	mov	r2, #1
 87c:	e24b102d 	sub	r1, fp, #45	; 0x2d
 880:	e1a00004 	mov	r0, r4
 884:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 888:	ebfffefb 	bl	47c <write>
 88c:	e3750001 	cmn	r5, #1
 890:	1afffff6 	bne	870 <printint+0xb4>
 894:	e24bd01c 	sub	sp, fp, #28
 898:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000089c <div>:
 89c:	e92d4810 	push	{r4, fp, lr}
 8a0:	e3a02000 	mov	r2, #0
 8a4:	e28db008 	add	fp, sp, #8
 8a8:	e1a0e000 	mov	lr, r0
 8ac:	e3a0301f 	mov	r3, #31
 8b0:	e1a00002 	mov	r0, r2
 8b4:	e3a04001 	mov	r4, #1
 8b8:	e1a0c33e 	lsr	ip, lr, r3
 8bc:	e20cc001 	and	ip, ip, #1
 8c0:	e18c2082 	orr	r2, ip, r2, lsl #1
 8c4:	e1520001 	cmp	r2, r1
 8c8:	20422001 	subcs	r2, r2, r1
 8cc:	21800314 	orrcs	r0, r0, r4, lsl r3
 8d0:	e2533001 	subs	r3, r3, #1
 8d4:	2afffff7 	bcs	8b8 <div+0x1c>
 8d8:	e8bd8810 	pop	{r4, fp, pc}

000008dc <printf>:
 8dc:	e92d000e 	push	{r1, r2, r3}
 8e0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 8e4:	e28db018 	add	fp, sp, #24
 8e8:	e24dd008 	sub	sp, sp, #8
 8ec:	e59b6004 	ldr	r6, [fp, #4]
 8f0:	e5d64000 	ldrb	r4, [r6]
 8f4:	e3540000 	cmp	r4, #0
 8f8:	0a00002b 	beq	9ac <printf+0xd0>
 8fc:	e1a07000 	mov	r7, r0
 900:	e28b8008 	add	r8, fp, #8
 904:	e3a05000 	mov	r5, #0
 908:	ea00000a 	b	938 <printf+0x5c>
 90c:	e3540025 	cmp	r4, #37	; 0x25
 910:	01a05004 	moveq	r5, r4
 914:	0a000004 	beq	92c <printf+0x50>
 918:	e24b1018 	sub	r1, fp, #24
 91c:	e3a02001 	mov	r2, #1
 920:	e1a00007 	mov	r0, r7
 924:	e5614006 	strb	r4, [r1, #-6]!
 928:	ebfffed3 	bl	47c <write>
 92c:	e5f64001 	ldrb	r4, [r6, #1]!
 930:	e3540000 	cmp	r4, #0
 934:	0a00001c 	beq	9ac <printf+0xd0>
 938:	e3550000 	cmp	r5, #0
 93c:	0afffff2 	beq	90c <printf+0x30>
 940:	e3550025 	cmp	r5, #37	; 0x25
 944:	1afffff8 	bne	92c <printf+0x50>
 948:	e3540064 	cmp	r4, #100	; 0x64
 94c:	0a000037 	beq	a30 <printf+0x154>
 950:	e20430f7 	and	r3, r4, #247	; 0xf7
 954:	e3530070 	cmp	r3, #112	; 0x70
 958:	0a000017 	beq	9bc <printf+0xe0>
 95c:	e3540073 	cmp	r4, #115	; 0x73
 960:	0a00001c 	beq	9d8 <printf+0xfc>
 964:	e3540063 	cmp	r4, #99	; 0x63
 968:	0a000037 	beq	a4c <printf+0x170>
 96c:	e3540025 	cmp	r4, #37	; 0x25
 970:	0a000027 	beq	a14 <printf+0x138>
 974:	e3a02001 	mov	r2, #1
 978:	e24b1019 	sub	r1, fp, #25
 97c:	e1a00007 	mov	r0, r7
 980:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 984:	ebfffebc 	bl	47c <write>
 988:	e3a02001 	mov	r2, #1
 98c:	e24b101a 	sub	r1, fp, #26
 990:	e1a00007 	mov	r0, r7
 994:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 998:	ebfffeb7 	bl	47c <write>
 99c:	e5f64001 	ldrb	r4, [r6, #1]!
 9a0:	e3a05000 	mov	r5, #0
 9a4:	e3540000 	cmp	r4, #0
 9a8:	1affffe2 	bne	938 <printf+0x5c>
 9ac:	e24bd018 	sub	sp, fp, #24
 9b0:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 9b4:	e28dd00c 	add	sp, sp, #12
 9b8:	e12fff1e 	bx	lr
 9bc:	e3a03000 	mov	r3, #0
 9c0:	e3a02010 	mov	r2, #16
 9c4:	e4981004 	ldr	r1, [r8], #4
 9c8:	e1a00007 	mov	r0, r7
 9cc:	ebffff7a 	bl	7bc <printint>
 9d0:	e3a05000 	mov	r5, #0
 9d4:	eaffffd4 	b	92c <printf+0x50>
 9d8:	e4984004 	ldr	r4, [r8], #4
 9dc:	e3540000 	cmp	r4, #0
 9e0:	0a000021 	beq	a6c <printf+0x190>
 9e4:	e5d45000 	ldrb	r5, [r4]
 9e8:	e3550000 	cmp	r5, #0
 9ec:	0affffce 	beq	92c <printf+0x50>
 9f0:	e3a02001 	mov	r2, #1
 9f4:	e24b101d 	sub	r1, fp, #29
 9f8:	e1a00007 	mov	r0, r7
 9fc:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 a00:	ebfffe9d 	bl	47c <write>
 a04:	e5f45001 	ldrb	r5, [r4, #1]!
 a08:	e3550000 	cmp	r5, #0
 a0c:	1afffff7 	bne	9f0 <printf+0x114>
 a10:	eaffffc5 	b	92c <printf+0x50>
 a14:	e24b1018 	sub	r1, fp, #24
 a18:	e3a02001 	mov	r2, #1
 a1c:	e1a00007 	mov	r0, r7
 a20:	e5615003 	strb	r5, [r1, #-3]!
 a24:	e3a05000 	mov	r5, #0
 a28:	ebfffe93 	bl	47c <write>
 a2c:	eaffffbe 	b	92c <printf+0x50>
 a30:	e3a03001 	mov	r3, #1
 a34:	e3a0200a 	mov	r2, #10
 a38:	e4981004 	ldr	r1, [r8], #4
 a3c:	e1a00007 	mov	r0, r7
 a40:	ebffff5d 	bl	7bc <printint>
 a44:	e3a05000 	mov	r5, #0
 a48:	eaffffb7 	b	92c <printf+0x50>
 a4c:	e4983004 	ldr	r3, [r8], #4
 a50:	e24b1018 	sub	r1, fp, #24
 a54:	e3a02001 	mov	r2, #1
 a58:	e1a00007 	mov	r0, r7
 a5c:	e3a05000 	mov	r5, #0
 a60:	e5613004 	strb	r3, [r1, #-4]!
 a64:	ebfffe84 	bl	47c <write>
 a68:	eaffffaf 	b	92c <printf+0x50>
 a6c:	e3004c3c 	movw	r4, #3132	; 0xc3c
 a70:	e3a05028 	mov	r5, #40	; 0x28
 a74:	e3404000 	movt	r4, #0
 a78:	eaffffdc 	b	9f0 <printf+0x114>

00000a7c <free>:
 a7c:	e300cc44 	movw	ip, #3140	; 0xc44
 a80:	e340c000 	movt	ip, #0
 a84:	e92d4810 	push	{r4, fp, lr}
 a88:	e2401008 	sub	r1, r0, #8
 a8c:	e28db008 	add	fp, sp, #8
 a90:	e59c3000 	ldr	r3, [ip]
 a94:	ea000004 	b	aac <free+0x30>
 a98:	e1510002 	cmp	r1, r2
 a9c:	3a000009 	bcc	ac8 <free+0x4c>
 aa0:	e1530002 	cmp	r3, r2
 aa4:	2a000007 	bcs	ac8 <free+0x4c>
 aa8:	e1a03002 	mov	r3, r2
 aac:	e1530001 	cmp	r3, r1
 ab0:	e5932000 	ldr	r2, [r3]
 ab4:	3afffff7 	bcc	a98 <free+0x1c>
 ab8:	e1530002 	cmp	r3, r2
 abc:	3afffff9 	bcc	aa8 <free+0x2c>
 ac0:	e1510002 	cmp	r1, r2
 ac4:	2afffff7 	bcs	aa8 <free+0x2c>
 ac8:	e510e004 	ldr	lr, [r0, #-4]
 acc:	e58c3000 	str	r3, [ip]
 ad0:	e081418e 	add	r4, r1, lr, lsl #3
 ad4:	e1520004 	cmp	r2, r4
 ad8:	05922004 	ldreq	r2, [r2, #4]
 adc:	0082e00e 	addeq	lr, r2, lr
 ae0:	0500e004 	streq	lr, [r0, #-4]
 ae4:	05932000 	ldreq	r2, [r3]
 ae8:	05922000 	ldreq	r2, [r2]
 aec:	e5002008 	str	r2, [r0, #-8]
 af0:	e5932004 	ldr	r2, [r3, #4]
 af4:	e083e182 	add	lr, r3, r2, lsl #3
 af8:	e151000e 	cmp	r1, lr
 afc:	15831000 	strne	r1, [r3]
 b00:	05101004 	ldreq	r1, [r0, #-4]
 b04:	00812002 	addeq	r2, r1, r2
 b08:	05832004 	streq	r2, [r3, #4]
 b0c:	05102008 	ldreq	r2, [r0, #-8]
 b10:	05832000 	streq	r2, [r3]
 b14:	e8bd8810 	pop	{r4, fp, pc}

00000b18 <malloc>:
 b18:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 b1c:	e3007c44 	movw	r7, #3140	; 0xc44
 b20:	e3407000 	movt	r7, #0
 b24:	e2804007 	add	r4, r0, #7
 b28:	e28db014 	add	fp, sp, #20
 b2c:	e5973000 	ldr	r3, [r7]
 b30:	e1a041a4 	lsr	r4, r4, #3
 b34:	e2844001 	add	r4, r4, #1
 b38:	e3530000 	cmp	r3, #0
 b3c:	0a000027 	beq	be0 <malloc+0xc8>
 b40:	e5930000 	ldr	r0, [r3]
 b44:	e5902004 	ldr	r2, [r0, #4]
 b48:	e1540002 	cmp	r4, r2
 b4c:	9a000019 	bls	bb8 <malloc+0xa0>
 b50:	e3540a01 	cmp	r4, #4096	; 0x1000
 b54:	21a05004 	movcs	r5, r4
 b58:	33a05a01 	movcc	r5, #4096	; 0x1000
 b5c:	e1a06185 	lsl	r6, r5, #3
 b60:	ea000003 	b	b74 <malloc+0x5c>
 b64:	e5930000 	ldr	r0, [r3]
 b68:	e5902004 	ldr	r2, [r0, #4]
 b6c:	e1540002 	cmp	r4, r2
 b70:	9a000010 	bls	bb8 <malloc+0xa0>
 b74:	e5972000 	ldr	r2, [r7]
 b78:	e1a03000 	mov	r3, r0
 b7c:	e1520000 	cmp	r2, r0
 b80:	1afffff7 	bne	b64 <malloc+0x4c>
 b84:	e1a00006 	mov	r0, r6
 b88:	ebfffee4 	bl	720 <sbrk>
 b8c:	e1a03000 	mov	r3, r0
 b90:	e3730001 	cmn	r3, #1
 b94:	e2800008 	add	r0, r0, #8
 b98:	0a000004 	beq	bb0 <malloc+0x98>
 b9c:	e5835004 	str	r5, [r3, #4]
 ba0:	ebffffb5 	bl	a7c <free>
 ba4:	e5973000 	ldr	r3, [r7]
 ba8:	e3530000 	cmp	r3, #0
 bac:	1affffec 	bne	b64 <malloc+0x4c>
 bb0:	e3a00000 	mov	r0, #0
 bb4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 bb8:	e1540002 	cmp	r4, r2
 bbc:	e5873000 	str	r3, [r7]
 bc0:	10422004 	subne	r2, r2, r4
 bc4:	15802004 	strne	r2, [r0, #4]
 bc8:	05902000 	ldreq	r2, [r0]
 bcc:	10800182 	addne	r0, r0, r2, lsl #3
 bd0:	e2800008 	add	r0, r0, #8
 bd4:	15004004 	strne	r4, [r0, #-4]
 bd8:	05832000 	streq	r2, [r3]
 bdc:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 be0:	e2870004 	add	r0, r7, #4
 be4:	e5873008 	str	r3, [r7, #8]
 be8:	e5870000 	str	r0, [r7]
 bec:	e5870004 	str	r0, [r7, #4]
 bf0:	eaffffd6 	b	b50 <malloc+0x38>
