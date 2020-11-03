
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
       0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
       4:	e3014720 	movw	r4, #5920	; 0x1720
       8:	e28db014 	add	fp, sp, #20
       c:	e3404000 	movt	r4, #0
      10:	ea000001 	b	1c <main+0x1c>
      14:	e3530002 	cmp	r3, #2
      18:	ca00002d 	bgt	d4 <main+0xd4>
      1c:	e3a01002 	mov	r1, #2
      20:	e1a00004 	mov	r0, r4
      24:	eb0003e1 	bl	fb0 <open>
      28:	e2503000 	subs	r3, r0, #0
      2c:	aafffff8 	bge	14 <main+0x14>
      30:	e3014764 	movw	r4, #5988	; 0x1764
      34:	e3404000 	movt	r4, #0
      38:	e3016728 	movw	r6, #5928	; 0x1728
      3c:	e2847003 	add	r7, r4, #3
      40:	e1a05004 	mov	r5, r4
      44:	e3406000 	movt	r6, #0
      48:	ea000005 	b	64 <main+0x64>
      4c:	eb000362 	bl	ddc <fork>
      50:	e3700001 	cmn	r0, #1
      54:	0a000021 	beq	e0 <main+0xe0>
      58:	e3500000 	cmp	r0, #0
      5c:	0a000022 	beq	ec <main+0xec>
      60:	eb000377 	bl	e44 <wait>
      64:	e3a01064 	mov	r1, #100	; 0x64
      68:	e1a00005 	mov	r0, r5
      6c:	eb000022 	bl	fc <getcmd>
      70:	e3500000 	cmp	r0, #0
      74:	ba000018 	blt	dc <main+0xdc>
      78:	e5d43000 	ldrb	r3, [r4]
      7c:	e3530063 	cmp	r3, #99	; 0x63
      80:	1afffff1 	bne	4c <main+0x4c>
      84:	e5d43001 	ldrb	r3, [r4, #1]
      88:	e3530064 	cmp	r3, #100	; 0x64
      8c:	1affffee 	bne	4c <main+0x4c>
      90:	e5d43002 	ldrb	r3, [r4, #2]
      94:	e3530020 	cmp	r3, #32
      98:	1affffeb 	bne	4c <main+0x4c>
      9c:	e1a00005 	mov	r0, r5
      a0:	eb0002d2 	bl	bf0 <strlen>
      a4:	e3a02000 	mov	r2, #0
      a8:	e0843000 	add	r3, r4, r0
      ac:	e1a00007 	mov	r0, r7
      b0:	e5432001 	strb	r2, [r3, #-1]
      b4:	eb00040b 	bl	10e8 <chdir>
      b8:	e3500000 	cmp	r0, #0
      bc:	aaffffe8 	bge	64 <main+0x64>
      c0:	e1a02007 	mov	r2, r7
      c4:	e1a01006 	mov	r1, r6
      c8:	e3a00002 	mov	r0, #2
      cc:	eb00049b 	bl	1340 <printf>
      d0:	eaffffe3 	b	64 <main+0x64>
      d4:	eb00038e 	bl	f14 <close>
      d8:	eaffffd4 	b	30 <main+0x30>
      dc:	eb00034b 	bl	e10 <exit>
      e0:	e3010688 	movw	r0, #5768	; 0x1688
      e4:	e3400000 	movt	r0, #0
      e8:	eb000017 	bl	14c <panic>
      ec:	e3010764 	movw	r0, #5988	; 0x1764
      f0:	e3400000 	movt	r0, #0
      f4:	eb00027d 	bl	af0 <parsecmd>
      f8:	eb00001b 	bl	16c <runcmd>

000000fc <getcmd>:
      fc:	e92d4830 	push	{r4, r5, fp, lr}
     100:	e1a04000 	mov	r4, r0
     104:	e28db00c 	add	fp, sp, #12
     108:	e1a05001 	mov	r5, r1
     10c:	e3a00002 	mov	r0, #2
     110:	e3011658 	movw	r1, #5720	; 0x1658
     114:	e3401000 	movt	r1, #0
     118:	eb000488 	bl	1340 <printf>
     11c:	e1a02005 	mov	r2, r5
     120:	e1a00004 	mov	r0, r4
     124:	e3a01000 	mov	r1, #0
     128:	eb0002c1 	bl	c34 <memset>
     12c:	e1a01005 	mov	r1, r5
     130:	e1a00004 	mov	r0, r4
     134:	eb0002dd 	bl	cb0 <gets>
     138:	e5d40000 	ldrb	r0, [r4]
     13c:	e16f0f10 	clz	r0, r0
     140:	e1a002a0 	lsr	r0, r0, #5
     144:	e2600000 	rsb	r0, r0, #0
     148:	e8bd8830 	pop	{r4, r5, fp, pc}

0000014c <panic>:
     14c:	e92d4800 	push	{fp, lr}
     150:	e1a02000 	mov	r2, r0
     154:	e28db004 	add	fp, sp, #4
     158:	e301165c 	movw	r1, #5724	; 0x165c
     15c:	e3a00002 	mov	r0, #2
     160:	e3401000 	movt	r1, #0
     164:	eb000475 	bl	1340 <printf>
     168:	eb000328 	bl	e10 <exit>

0000016c <runcmd>:
     16c:	e92d4810 	push	{r4, fp, lr}
     170:	e2504000 	subs	r4, r0, #0
     174:	e28db008 	add	fp, sp, #8
     178:	e24dd00c 	sub	sp, sp, #12
     17c:	0a00001d 	beq	1f8 <runcmd+0x8c>
     180:	e5943000 	ldr	r3, [r4]
     184:	e2433001 	sub	r3, r3, #1
     188:	e3530004 	cmp	r3, #4
     18c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     190:	ea00003b 	b	284 <runcmd+0x118>
     194:	00000214 	.word	0x00000214
     198:	00000240 	.word	0x00000240
     19c:	000001a8 	.word	0x000001a8
     1a0:	00000264 	.word	0x00000264
     1a4:	000001fc 	.word	0x000001fc
     1a8:	e24b0014 	sub	r0, fp, #20
     1ac:	eb000331 	bl	e78 <pipe>
     1b0:	e3500000 	cmp	r0, #0
     1b4:	ba00003e 	blt	2b4 <runcmd+0x148>
     1b8:	eb000307 	bl	ddc <fork>
     1bc:	e3700001 	cmn	r0, #1
     1c0:	0a000032 	beq	290 <runcmd+0x124>
     1c4:	e3500000 	cmp	r0, #0
     1c8:	0a00003c 	beq	2c0 <runcmd+0x154>
     1cc:	eb000302 	bl	ddc <fork>
     1d0:	e3700001 	cmn	r0, #1
     1d4:	0a00002d 	beq	290 <runcmd+0x124>
     1d8:	e3500000 	cmp	r0, #0
     1dc:	0a000041 	beq	2e8 <runcmd+0x17c>
     1e0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     1e4:	eb00034a 	bl	f14 <close>
     1e8:	e51b0010 	ldr	r0, [fp, #-16]
     1ec:	eb000348 	bl	f14 <close>
     1f0:	eb000313 	bl	e44 <wait>
     1f4:	eb000312 	bl	e44 <wait>
     1f8:	eb000304 	bl	e10 <exit>
     1fc:	eb0002f6 	bl	ddc <fork>
     200:	e3700001 	cmn	r0, #1
     204:	0a000021 	beq	290 <runcmd+0x124>
     208:	e3500000 	cmp	r0, #0
     20c:	1afffff9 	bne	1f8 <runcmd+0x8c>
     210:	ea000011 	b	25c <runcmd+0xf0>
     214:	e5940004 	ldr	r0, [r4, #4]
     218:	e3500000 	cmp	r0, #0
     21c:	0afffff5 	beq	1f8 <runcmd+0x8c>
     220:	e2841004 	add	r1, r4, #4
     224:	eb000354 	bl	f7c <exec>
     228:	e5942004 	ldr	r2, [r4, #4]
     22c:	e3011668 	movw	r1, #5736	; 0x1668
     230:	e3a00002 	mov	r0, #2
     234:	e3401000 	movt	r1, #0
     238:	eb000440 	bl	1340 <printf>
     23c:	eaffffed 	b	1f8 <runcmd+0x8c>
     240:	e5940014 	ldr	r0, [r4, #20]
     244:	eb000332 	bl	f14 <close>
     248:	e5941010 	ldr	r1, [r4, #16]
     24c:	e5940008 	ldr	r0, [r4, #8]
     250:	eb000356 	bl	fb0 <open>
     254:	e3500000 	cmp	r0, #0
     258:	ba00000f 	blt	29c <runcmd+0x130>
     25c:	e5940004 	ldr	r0, [r4, #4]
     260:	ebffffc1 	bl	16c <runcmd>
     264:	eb0002dc 	bl	ddc <fork>
     268:	e3700001 	cmn	r0, #1
     26c:	0a000007 	beq	290 <runcmd+0x124>
     270:	e3500000 	cmp	r0, #0
     274:	0afffff8 	beq	25c <runcmd+0xf0>
     278:	eb0002f1 	bl	e44 <wait>
     27c:	e5940008 	ldr	r0, [r4, #8]
     280:	ebffffb9 	bl	16c <runcmd>
     284:	e3010660 	movw	r0, #5728	; 0x1660
     288:	e3400000 	movt	r0, #0
     28c:	ebffffae 	bl	14c <panic>
     290:	e3010688 	movw	r0, #5768	; 0x1688
     294:	e3400000 	movt	r0, #0
     298:	ebffffab 	bl	14c <panic>
     29c:	e5942008 	ldr	r2, [r4, #8]
     2a0:	e3011678 	movw	r1, #5752	; 0x1678
     2a4:	e3a00002 	mov	r0, #2
     2a8:	e3401000 	movt	r1, #0
     2ac:	eb000423 	bl	1340 <printf>
     2b0:	eaffffd0 	b	1f8 <runcmd+0x8c>
     2b4:	e3010690 	movw	r0, #5776	; 0x1690
     2b8:	e3400000 	movt	r0, #0
     2bc:	ebffffa2 	bl	14c <panic>
     2c0:	e3a00001 	mov	r0, #1
     2c4:	eb000312 	bl	f14 <close>
     2c8:	e51b0010 	ldr	r0, [fp, #-16]
     2cc:	eb000392 	bl	111c <dup>
     2d0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2d4:	eb00030e 	bl	f14 <close>
     2d8:	e51b0010 	ldr	r0, [fp, #-16]
     2dc:	eb00030c 	bl	f14 <close>
     2e0:	e5940004 	ldr	r0, [r4, #4]
     2e4:	ebffffa0 	bl	16c <runcmd>
     2e8:	eb000309 	bl	f14 <close>
     2ec:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2f0:	eb000389 	bl	111c <dup>
     2f4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2f8:	eb000305 	bl	f14 <close>
     2fc:	e51b0010 	ldr	r0, [fp, #-16]
     300:	eb000303 	bl	f14 <close>
     304:	e5940008 	ldr	r0, [r4, #8]
     308:	ebffff97 	bl	16c <runcmd>

0000030c <fork1>:
     30c:	e92d4800 	push	{fp, lr}
     310:	e28db004 	add	fp, sp, #4
     314:	eb0002b0 	bl	ddc <fork>
     318:	e3700001 	cmn	r0, #1
     31c:	18bd8800 	popne	{fp, pc}
     320:	e3010688 	movw	r0, #5768	; 0x1688
     324:	e3400000 	movt	r0, #0
     328:	ebffff87 	bl	14c <panic>

0000032c <execcmd>:
     32c:	e92d4830 	push	{r4, r5, fp, lr}
     330:	e3a00054 	mov	r0, #84	; 0x54
     334:	e28db00c 	add	fp, sp, #12
     338:	eb00048f 	bl	157c <malloc>
     33c:	e3a02054 	mov	r2, #84	; 0x54
     340:	e3a01000 	mov	r1, #0
     344:	e1a04000 	mov	r4, r0
     348:	eb000239 	bl	c34 <memset>
     34c:	e3a03001 	mov	r3, #1
     350:	e1a00004 	mov	r0, r4
     354:	e5843000 	str	r3, [r4]
     358:	e8bd8830 	pop	{r4, r5, fp, pc}

0000035c <redircmd>:
     35c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     360:	e28db01c 	add	fp, sp, #28
     364:	e1a09000 	mov	r9, r0
     368:	e3a00018 	mov	r0, #24
     36c:	e1a08001 	mov	r8, r1
     370:	e1a07002 	mov	r7, r2
     374:	e1a06003 	mov	r6, r3
     378:	e59b5004 	ldr	r5, [fp, #4]
     37c:	eb00047e 	bl	157c <malloc>
     380:	e3a02018 	mov	r2, #24
     384:	e3a01000 	mov	r1, #0
     388:	e1a04000 	mov	r4, r0
     38c:	eb000228 	bl	c34 <memset>
     390:	e3a02002 	mov	r2, #2
     394:	e5849004 	str	r9, [r4, #4]
     398:	e5848008 	str	r8, [r4, #8]
     39c:	e1a00004 	mov	r0, r4
     3a0:	e584700c 	str	r7, [r4, #12]
     3a4:	e5846010 	str	r6, [r4, #16]
     3a8:	e5845014 	str	r5, [r4, #20]
     3ac:	e5842000 	str	r2, [r4]
     3b0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000003b4 <pipecmd>:
     3b4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3b8:	e1a06000 	mov	r6, r0
     3bc:	e28db014 	add	fp, sp, #20
     3c0:	e3a0000c 	mov	r0, #12
     3c4:	e1a05001 	mov	r5, r1
     3c8:	eb00046b 	bl	157c <malloc>
     3cc:	e3a0200c 	mov	r2, #12
     3d0:	e3a01000 	mov	r1, #0
     3d4:	e1a04000 	mov	r4, r0
     3d8:	eb000215 	bl	c34 <memset>
     3dc:	e3a03003 	mov	r3, #3
     3e0:	e5846004 	str	r6, [r4, #4]
     3e4:	e5845008 	str	r5, [r4, #8]
     3e8:	e1a00004 	mov	r0, r4
     3ec:	e5843000 	str	r3, [r4]
     3f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000003f4 <listcmd>:
     3f4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3f8:	e1a06000 	mov	r6, r0
     3fc:	e28db014 	add	fp, sp, #20
     400:	e3a0000c 	mov	r0, #12
     404:	e1a05001 	mov	r5, r1
     408:	eb00045b 	bl	157c <malloc>
     40c:	e3a0200c 	mov	r2, #12
     410:	e3a01000 	mov	r1, #0
     414:	e1a04000 	mov	r4, r0
     418:	eb000205 	bl	c34 <memset>
     41c:	e3a03004 	mov	r3, #4
     420:	e5846004 	str	r6, [r4, #4]
     424:	e5845008 	str	r5, [r4, #8]
     428:	e1a00004 	mov	r0, r4
     42c:	e5843000 	str	r3, [r4]
     430:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

00000434 <backcmd>:
     434:	e92d4830 	push	{r4, r5, fp, lr}
     438:	e1a05000 	mov	r5, r0
     43c:	e28db00c 	add	fp, sp, #12
     440:	e3a00008 	mov	r0, #8
     444:	eb00044c 	bl	157c <malloc>
     448:	e3a02008 	mov	r2, #8
     44c:	e3a01000 	mov	r1, #0
     450:	e1a04000 	mov	r4, r0
     454:	eb0001f6 	bl	c34 <memset>
     458:	e3a03005 	mov	r3, #5
     45c:	e5845004 	str	r5, [r4, #4]
     460:	e1a00004 	mov	r0, r4
     464:	e5843000 	str	r3, [r4]
     468:	e8bd8830 	pop	{r4, r5, fp, pc}

0000046c <gettoken>:
     46c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     470:	e1a08000 	mov	r8, r0
     474:	e5904000 	ldr	r4, [r0]
     478:	e28db024 	add	fp, sp, #36	; 0x24
     47c:	e1a06001 	mov	r6, r1
     480:	e1a0a002 	mov	sl, r2
     484:	e1540001 	cmp	r4, r1
     488:	e1a09003 	mov	r9, r3
     48c:	33017754 	movwcc	r7, #5972	; 0x1754
     490:	31a05004 	movcc	r5, r4
     494:	33407000 	movtcc	r7, #0
     498:	3a000003 	bcc	4ac <gettoken+0x40>
     49c:	ea000009 	b	4c8 <gettoken+0x5c>
     4a0:	e1550006 	cmp	r5, r6
     4a4:	e1a04005 	mov	r4, r5
     4a8:	0a000006 	beq	4c8 <gettoken+0x5c>
     4ac:	e5d51000 	ldrb	r1, [r5]
     4b0:	e1a00007 	mov	r0, r7
     4b4:	eb0001ea 	bl	c64 <strchr>
     4b8:	e1a04005 	mov	r4, r5
     4bc:	e2855001 	add	r5, r5, #1
     4c0:	e3500000 	cmp	r0, #0
     4c4:	1afffff5 	bne	4a0 <gettoken+0x34>
     4c8:	e35a0000 	cmp	sl, #0
     4cc:	158a4000 	strne	r4, [sl]
     4d0:	e5d41000 	ldrb	r1, [r4]
     4d4:	e3510029 	cmp	r1, #41	; 0x29
     4d8:	8a00001a 	bhi	548 <gettoken+0xdc>
     4dc:	e3510028 	cmp	r1, #40	; 0x28
     4e0:	2a00003f 	bcs	5e4 <gettoken+0x178>
     4e4:	e3510000 	cmp	r1, #0
     4e8:	01a0a001 	moveq	sl, r1
     4ec:	1a00003f 	bne	5f0 <gettoken+0x184>
     4f0:	e3590000 	cmp	r9, #0
     4f4:	0a000000 	beq	4fc <gettoken+0x90>
     4f8:	e5894000 	str	r4, [r9]
     4fc:	e1560004 	cmp	r6, r4
     500:	83017754 	movwhi	r7, #5972	; 0x1754
     504:	81a05004 	movhi	r5, r4
     508:	83407000 	movthi	r7, #0
     50c:	8a000003 	bhi	520 <gettoken+0xb4>
     510:	ea000009 	b	53c <gettoken+0xd0>
     514:	e1550006 	cmp	r5, r6
     518:	e1a04005 	mov	r4, r5
     51c:	0a000006 	beq	53c <gettoken+0xd0>
     520:	e5d51000 	ldrb	r1, [r5]
     524:	e1a00007 	mov	r0, r7
     528:	eb0001cd 	bl	c64 <strchr>
     52c:	e1a04005 	mov	r4, r5
     530:	e2855001 	add	r5, r5, #1
     534:	e3500000 	cmp	r0, #0
     538:	1afffff5 	bne	514 <gettoken+0xa8>
     53c:	e5884000 	str	r4, [r8]
     540:	e1a0000a 	mov	r0, sl
     544:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
     548:	e351003e 	cmp	r1, #62	; 0x3e
     54c:	1a000006 	bne	56c <gettoken+0x100>
     550:	e5d43001 	ldrb	r3, [r4, #1]
     554:	e353003e 	cmp	r3, #62	; 0x3e
     558:	12844001 	addne	r4, r4, #1
     55c:	02844002 	addeq	r4, r4, #2
     560:	11a0a001 	movne	sl, r1
     564:	03a0a02b 	moveq	sl, #43	; 0x2b
     568:	eaffffe0 	b	4f0 <gettoken+0x84>
     56c:	8a00001a 	bhi	5dc <gettoken+0x170>
     570:	e241303b 	sub	r3, r1, #59	; 0x3b
     574:	e3530001 	cmp	r3, #1
     578:	9a000019 	bls	5e4 <gettoken+0x178>
     57c:	e1560004 	cmp	r6, r4
     580:	9a00001d 	bls	5fc <gettoken+0x190>
     584:	e3017754 	movw	r7, #5972	; 0x1754
     588:	e3407000 	movt	r7, #0
     58c:	e1a05004 	mov	r5, r4
     590:	e287a008 	add	sl, r7, #8
     594:	ea000007 	b	5b8 <gettoken+0x14c>
     598:	e5d41000 	ldrb	r1, [r4]
     59c:	eb0001b0 	bl	c64 <strchr>
     5a0:	e3500000 	cmp	r0, #0
     5a4:	1a00000a 	bne	5d4 <gettoken+0x168>
     5a8:	e1550006 	cmp	r5, r6
     5ac:	e1a04005 	mov	r4, r5
     5b0:	0a000011 	beq	5fc <gettoken+0x190>
     5b4:	e5d51000 	ldrb	r1, [r5]
     5b8:	e1a00007 	mov	r0, r7
     5bc:	e1a04005 	mov	r4, r5
     5c0:	eb0001a7 	bl	c64 <strchr>
     5c4:	e2855001 	add	r5, r5, #1
     5c8:	e3500000 	cmp	r0, #0
     5cc:	e1a0000a 	mov	r0, sl
     5d0:	0afffff0 	beq	598 <gettoken+0x12c>
     5d4:	e3a0a061 	mov	sl, #97	; 0x61
     5d8:	eaffffc4 	b	4f0 <gettoken+0x84>
     5dc:	e351007c 	cmp	r1, #124	; 0x7c
     5e0:	1affffe5 	bne	57c <gettoken+0x110>
     5e4:	e1a0a001 	mov	sl, r1
     5e8:	e2844001 	add	r4, r4, #1
     5ec:	eaffffbf 	b	4f0 <gettoken+0x84>
     5f0:	e3510026 	cmp	r1, #38	; 0x26
     5f4:	1affffe0 	bne	57c <gettoken+0x110>
     5f8:	eafffff9 	b	5e4 <gettoken+0x178>
     5fc:	e3590000 	cmp	r9, #0
     600:	e3a0a061 	mov	sl, #97	; 0x61
     604:	1affffbb 	bne	4f8 <gettoken+0x8c>
     608:	eaffffcb 	b	53c <gettoken+0xd0>

0000060c <peek>:
     60c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     610:	e1a08000 	mov	r8, r0
     614:	e5905000 	ldr	r5, [r0]
     618:	e28db01c 	add	fp, sp, #28
     61c:	e1a09002 	mov	r9, r2
     620:	e1550001 	cmp	r5, r1
     624:	2a00000e 	bcs	664 <peek+0x58>
     628:	e3016754 	movw	r6, #5972	; 0x1754
     62c:	e1a07001 	mov	r7, r1
     630:	e1a04005 	mov	r4, r5
     634:	e3406000 	movt	r6, #0
     638:	ea000002 	b	648 <peek+0x3c>
     63c:	e1540007 	cmp	r4, r7
     640:	e1a05004 	mov	r5, r4
     644:	0a000006 	beq	664 <peek+0x58>
     648:	e5d41000 	ldrb	r1, [r4]
     64c:	e1a00006 	mov	r0, r6
     650:	eb000183 	bl	c64 <strchr>
     654:	e1a05004 	mov	r5, r4
     658:	e2844001 	add	r4, r4, #1
     65c:	e3500000 	cmp	r0, #0
     660:	1afffff5 	bne	63c <peek+0x30>
     664:	e5885000 	str	r5, [r8]
     668:	e5d51000 	ldrb	r1, [r5]
     66c:	e3510000 	cmp	r1, #0
     670:	1a000001 	bne	67c <peek+0x70>
     674:	e1a00001 	mov	r0, r1
     678:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
     67c:	e1a00009 	mov	r0, r9
     680:	eb000177 	bl	c64 <strchr>
     684:	e2900000 	adds	r0, r0, #0
     688:	13a00001 	movne	r0, #1
     68c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000690 <parseredirs>:
     690:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     694:	e30186b8 	movw	r8, #5816	; 0x16b8
     698:	e3408000 	movt	r8, #0
     69c:	e1a07000 	mov	r7, r0
     6a0:	e1a06001 	mov	r6, r1
     6a4:	e1a05002 	mov	r5, r2
     6a8:	e28db018 	add	fp, sp, #24
     6ac:	e24dd014 	sub	sp, sp, #20
     6b0:	e1a02008 	mov	r2, r8
     6b4:	e1a01005 	mov	r1, r5
     6b8:	e1a00006 	mov	r0, r6
     6bc:	ebffffd2 	bl	60c <peek>
     6c0:	e3500000 	cmp	r0, #0
     6c4:	0a000023 	beq	758 <parseredirs+0xc8>
     6c8:	e3a03000 	mov	r3, #0
     6cc:	e1a01005 	mov	r1, r5
     6d0:	e1a02003 	mov	r2, r3
     6d4:	e1a00006 	mov	r0, r6
     6d8:	ebffff63 	bl	46c <gettoken>
     6dc:	e24b3020 	sub	r3, fp, #32
     6e0:	e24b2024 	sub	r2, fp, #36	; 0x24
     6e4:	e1a01005 	mov	r1, r5
     6e8:	e1a04000 	mov	r4, r0
     6ec:	e1a00006 	mov	r0, r6
     6f0:	ebffff5d 	bl	46c <gettoken>
     6f4:	e3500061 	cmp	r0, #97	; 0x61
     6f8:	1a000019 	bne	764 <parseredirs+0xd4>
     6fc:	e354003c 	cmp	r4, #60	; 0x3c
     700:	0a00000c 	beq	738 <parseredirs+0xa8>
     704:	e354003e 	cmp	r4, #62	; 0x3e
     708:	0a000001 	beq	714 <parseredirs+0x84>
     70c:	e354002b 	cmp	r4, #43	; 0x2b
     710:	1affffe6 	bne	6b0 <parseredirs+0x20>
     714:	e1a00007 	mov	r0, r7
     718:	e3a0c001 	mov	ip, #1
     71c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
     720:	e3003201 	movw	r3, #513	; 0x201
     724:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     728:	e58dc000 	str	ip, [sp]
     72c:	ebffff0a 	bl	35c <redircmd>
     730:	e1a07000 	mov	r7, r0
     734:	eaffffdd 	b	6b0 <parseredirs+0x20>
     738:	e3a03000 	mov	r3, #0
     73c:	e1a00007 	mov	r0, r7
     740:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
     744:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     748:	e58d3000 	str	r3, [sp]
     74c:	ebffff02 	bl	35c <redircmd>
     750:	e1a07000 	mov	r7, r0
     754:	eaffffd5 	b	6b0 <parseredirs+0x20>
     758:	e1a00007 	mov	r0, r7
     75c:	e24bd018 	sub	sp, fp, #24
     760:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
     764:	e3010698 	movw	r0, #5784	; 0x1698
     768:	e3400000 	movt	r0, #0
     76c:	ebfffe76 	bl	14c <panic>

00000770 <parseexec>:
     770:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     774:	e30126bc 	movw	r2, #5820	; 0x16bc
     778:	e28db020 	add	fp, sp, #32
     77c:	e3402000 	movt	r2, #0
     780:	e24dd00c 	sub	sp, sp, #12
     784:	e1a04000 	mov	r4, r0
     788:	e1a05001 	mov	r5, r1
     78c:	ebffff9e 	bl	60c <peek>
     790:	e2506000 	subs	r6, r0, #0
     794:	1a000027 	bne	838 <parseexec+0xc8>
     798:	ebfffee3 	bl	32c <execcmd>
     79c:	e1a02005 	mov	r2, r5
     7a0:	e1a01004 	mov	r1, r4
     7a4:	e30196d8 	movw	r9, #5848	; 0x16d8
     7a8:	e3409000 	movt	r9, #0
     7ac:	e1a0a000 	mov	sl, r0
     7b0:	ebffffb6 	bl	690 <parseredirs>
     7b4:	e1a0700a 	mov	r7, sl
     7b8:	e1a08000 	mov	r8, r0
     7bc:	ea000004 	b	7d4 <parseexec+0x64>
     7c0:	e1a00008 	mov	r0, r8
     7c4:	e1a02005 	mov	r2, r5
     7c8:	e1a01004 	mov	r1, r4
     7cc:	ebffffaf 	bl	690 <parseredirs>
     7d0:	e1a08000 	mov	r8, r0
     7d4:	e1a02009 	mov	r2, r9
     7d8:	e1a01005 	mov	r1, r5
     7dc:	e1a00004 	mov	r0, r4
     7e0:	ebffff89 	bl	60c <peek>
     7e4:	e3500000 	cmp	r0, #0
     7e8:	1a000019 	bne	854 <parseexec+0xe4>
     7ec:	e24b3028 	sub	r3, fp, #40	; 0x28
     7f0:	e24b202c 	sub	r2, fp, #44	; 0x2c
     7f4:	e1a01005 	mov	r1, r5
     7f8:	e1a00004 	mov	r0, r4
     7fc:	ebffff1a 	bl	46c <gettoken>
     800:	e3500000 	cmp	r0, #0
     804:	0a000012 	beq	854 <parseexec+0xe4>
     808:	e3500061 	cmp	r0, #97	; 0x61
     80c:	1a000017 	bne	870 <parseexec+0x100>
     810:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
     814:	e2866001 	add	r6, r6, #1
     818:	e356000a 	cmp	r6, #10
     81c:	e5a73004 	str	r3, [r7, #4]!
     820:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     824:	e5873028 	str	r3, [r7, #40]	; 0x28
     828:	1affffe4 	bne	7c0 <parseexec+0x50>
     82c:	e30106c8 	movw	r0, #5832	; 0x16c8
     830:	e3400000 	movt	r0, #0
     834:	ebfffe44 	bl	14c <panic>
     838:	e1a01005 	mov	r1, r5
     83c:	e1a00004 	mov	r0, r4
     840:	eb000054 	bl	998 <parseblock>
     844:	e1a08000 	mov	r8, r0
     848:	e1a00008 	mov	r0, r8
     84c:	e24bd020 	sub	sp, fp, #32
     850:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     854:	e08a6106 	add	r6, sl, r6, lsl #2
     858:	e3a03000 	mov	r3, #0
     85c:	e1a00008 	mov	r0, r8
     860:	e5863004 	str	r3, [r6, #4]
     864:	e586302c 	str	r3, [r6, #44]	; 0x2c
     868:	e24bd020 	sub	sp, fp, #32
     86c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     870:	e30106c0 	movw	r0, #5824	; 0x16c0
     874:	e3400000 	movt	r0, #0
     878:	ebfffe33 	bl	14c <panic>

0000087c <parsepipe>:
     87c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     880:	e28db014 	add	fp, sp, #20
     884:	e1a04000 	mov	r4, r0
     888:	e1a05001 	mov	r5, r1
     88c:	ebffffb7 	bl	770 <parseexec>
     890:	e1a01005 	mov	r1, r5
     894:	e30126e0 	movw	r2, #5856	; 0x16e0
     898:	e3402000 	movt	r2, #0
     89c:	e1a06000 	mov	r6, r0
     8a0:	e1a00004 	mov	r0, r4
     8a4:	ebffff58 	bl	60c <peek>
     8a8:	e3500000 	cmp	r0, #0
     8ac:	1a000001 	bne	8b8 <parsepipe+0x3c>
     8b0:	e1a00006 	mov	r0, r6
     8b4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     8b8:	e3a03000 	mov	r3, #0
     8bc:	e1a01005 	mov	r1, r5
     8c0:	e1a02003 	mov	r2, r3
     8c4:	e1a00004 	mov	r0, r4
     8c8:	ebfffee7 	bl	46c <gettoken>
     8cc:	e1a01005 	mov	r1, r5
     8d0:	e1a00004 	mov	r0, r4
     8d4:	ebffffe8 	bl	87c <parsepipe>
     8d8:	e1a01000 	mov	r1, r0
     8dc:	e1a00006 	mov	r0, r6
     8e0:	e24bd014 	sub	sp, fp, #20
     8e4:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
     8e8:	eafffeb1 	b	3b4 <pipecmd>

000008ec <parseline>:
     8ec:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     8f0:	e28db01c 	add	fp, sp, #28
     8f4:	e1a04000 	mov	r4, r0
     8f8:	e1a05001 	mov	r5, r1
     8fc:	ebffffde 	bl	87c <parsepipe>
     900:	e30176e4 	movw	r7, #5860	; 0x16e4
     904:	e3407000 	movt	r7, #0
     908:	e1a06000 	mov	r6, r0
     90c:	ea000003 	b	920 <parseline+0x34>
     910:	ebfffed5 	bl	46c <gettoken>
     914:	e1a00006 	mov	r0, r6
     918:	ebfffec5 	bl	434 <backcmd>
     91c:	e1a06000 	mov	r6, r0
     920:	e1a02007 	mov	r2, r7
     924:	e1a01005 	mov	r1, r5
     928:	e1a00004 	mov	r0, r4
     92c:	ebffff36 	bl	60c <peek>
     930:	e3a03000 	mov	r3, #0
     934:	e1a02003 	mov	r2, r3
     938:	e1a01005 	mov	r1, r5
     93c:	e2508000 	subs	r8, r0, #0
     940:	e1a00004 	mov	r0, r4
     944:	1afffff1 	bne	910 <parseline+0x24>
     948:	e30126e8 	movw	r2, #5864	; 0x16e8
     94c:	e3402000 	movt	r2, #0
     950:	ebffff2d 	bl	60c <peek>
     954:	e3500000 	cmp	r0, #0
     958:	1a000001 	bne	964 <parseline+0x78>
     95c:	e1a00006 	mov	r0, r6
     960:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
     964:	e1a03008 	mov	r3, r8
     968:	e1a02008 	mov	r2, r8
     96c:	e1a01005 	mov	r1, r5
     970:	e1a00004 	mov	r0, r4
     974:	ebfffebc 	bl	46c <gettoken>
     978:	e1a01005 	mov	r1, r5
     97c:	e1a00004 	mov	r0, r4
     980:	ebffffd9 	bl	8ec <parseline>
     984:	e1a01000 	mov	r1, r0
     988:	e1a00006 	mov	r0, r6
     98c:	e24bd01c 	sub	sp, fp, #28
     990:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
     994:	eafffe96 	b	3f4 <listcmd>

00000998 <parseblock>:
     998:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     99c:	e30126bc 	movw	r2, #5820	; 0x16bc
     9a0:	e28db014 	add	fp, sp, #20
     9a4:	e3402000 	movt	r2, #0
     9a8:	e1a04000 	mov	r4, r0
     9ac:	e1a05001 	mov	r5, r1
     9b0:	ebffff15 	bl	60c <peek>
     9b4:	e3500000 	cmp	r0, #0
     9b8:	0a00001a 	beq	a28 <parseblock+0x90>
     9bc:	e3a03000 	mov	r3, #0
     9c0:	e1a01005 	mov	r1, r5
     9c4:	e1a02003 	mov	r2, r3
     9c8:	e1a00004 	mov	r0, r4
     9cc:	ebfffea6 	bl	46c <gettoken>
     9d0:	e1a01005 	mov	r1, r5
     9d4:	e1a00004 	mov	r0, r4
     9d8:	ebffffc3 	bl	8ec <parseline>
     9dc:	e30126f8 	movw	r2, #5880	; 0x16f8
     9e0:	e1a01005 	mov	r1, r5
     9e4:	e3402000 	movt	r2, #0
     9e8:	e1a06000 	mov	r6, r0
     9ec:	e1a00004 	mov	r0, r4
     9f0:	ebffff05 	bl	60c <peek>
     9f4:	e3500000 	cmp	r0, #0
     9f8:	0a00000d 	beq	a34 <parseblock+0x9c>
     9fc:	e3a03000 	mov	r3, #0
     a00:	e1a01005 	mov	r1, r5
     a04:	e1a02003 	mov	r2, r3
     a08:	e1a00004 	mov	r0, r4
     a0c:	ebfffe96 	bl	46c <gettoken>
     a10:	e1a02005 	mov	r2, r5
     a14:	e1a01004 	mov	r1, r4
     a18:	e1a00006 	mov	r0, r6
     a1c:	e24bd014 	sub	sp, fp, #20
     a20:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
     a24:	eaffff19 	b	690 <parseredirs>
     a28:	e30106ec 	movw	r0, #5868	; 0x16ec
     a2c:	e3400000 	movt	r0, #0
     a30:	ebfffdc5 	bl	14c <panic>
     a34:	e30106fc 	movw	r0, #5884	; 0x16fc
     a38:	e3400000 	movt	r0, #0
     a3c:	ebfffdc2 	bl	14c <panic>

00000a40 <nulterminate>:
     a40:	e92d4830 	push	{r4, r5, fp, lr}
     a44:	e2504000 	subs	r4, r0, #0
     a48:	e28db00c 	add	fp, sp, #12
     a4c:	0a00000b 	beq	a80 <nulterminate+0x40>
     a50:	e5943000 	ldr	r3, [r4]
     a54:	e2433001 	sub	r3, r3, #1
     a58:	e3530004 	cmp	r3, #4
     a5c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     a60:	ea000006 	b	a80 <nulterminate+0x40>
     a64:	00000aa0 	.word	0x00000aa0
     a68:	00000ad4 	.word	0x00000ad4
     a6c:	00000a88 	.word	0x00000a88
     a70:	00000a88 	.word	0x00000a88
     a74:	00000a78 	.word	0x00000a78
     a78:	e5940004 	ldr	r0, [r4, #4]
     a7c:	ebffffef 	bl	a40 <nulterminate>
     a80:	e1a00004 	mov	r0, r4
     a84:	e8bd8830 	pop	{r4, r5, fp, pc}
     a88:	e5940004 	ldr	r0, [r4, #4]
     a8c:	ebffffeb 	bl	a40 <nulterminate>
     a90:	e5940008 	ldr	r0, [r4, #8]
     a94:	ebffffe9 	bl	a40 <nulterminate>
     a98:	e1a00004 	mov	r0, r4
     a9c:	e8bd8830 	pop	{r4, r5, fp, pc}
     aa0:	e5943004 	ldr	r3, [r4, #4]
     aa4:	e3530000 	cmp	r3, #0
     aa8:	0afffff4 	beq	a80 <nulterminate+0x40>
     aac:	e2842004 	add	r2, r4, #4
     ab0:	e2843028 	add	r3, r4, #40	; 0x28
     ab4:	e3a00000 	mov	r0, #0
     ab8:	e5b31004 	ldr	r1, [r3, #4]!
     abc:	e5c10000 	strb	r0, [r1]
     ac0:	e5b21004 	ldr	r1, [r2, #4]!
     ac4:	e3510000 	cmp	r1, #0
     ac8:	1afffffa 	bne	ab8 <nulterminate+0x78>
     acc:	e1a00004 	mov	r0, r4
     ad0:	e8bd8830 	pop	{r4, r5, fp, pc}
     ad4:	e5940004 	ldr	r0, [r4, #4]
     ad8:	ebffffd8 	bl	a40 <nulterminate>
     adc:	e594300c 	ldr	r3, [r4, #12]
     ae0:	e3a02000 	mov	r2, #0
     ae4:	e1a00004 	mov	r0, r4
     ae8:	e5c32000 	strb	r2, [r3]
     aec:	e8bd8830 	pop	{r4, r5, fp, pc}

00000af0 <parsecmd>:
     af0:	e92d4870 	push	{r4, r5, r6, fp, lr}
     af4:	e28db010 	add	fp, sp, #16
     af8:	e24b5014 	sub	r5, fp, #20
     afc:	e24dd00c 	sub	sp, sp, #12
     b00:	e1a04000 	mov	r4, r0
     b04:	e5250004 	str	r0, [r5, #-4]!
     b08:	eb000038 	bl	bf0 <strlen>
     b0c:	e0844000 	add	r4, r4, r0
     b10:	e1a00005 	mov	r0, r5
     b14:	e1a01004 	mov	r1, r4
     b18:	ebffff73 	bl	8ec <parseline>
     b1c:	e1a01004 	mov	r1, r4
     b20:	e30126dc 	movw	r2, #5852	; 0x16dc
     b24:	e3402000 	movt	r2, #0
     b28:	e1a06000 	mov	r6, r0
     b2c:	e1a00005 	mov	r0, r5
     b30:	ebfffeb5 	bl	60c <peek>
     b34:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     b38:	e1540002 	cmp	r4, r2
     b3c:	1a000004 	bne	b54 <parsecmd+0x64>
     b40:	e1a00006 	mov	r0, r6
     b44:	ebffffbd 	bl	a40 <nulterminate>
     b48:	e1a00006 	mov	r0, r6
     b4c:	e24bd010 	sub	sp, fp, #16
     b50:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
     b54:	e3a00002 	mov	r0, #2
     b58:	e3011710 	movw	r1, #5904	; 0x1710
     b5c:	e3401000 	movt	r1, #0
     b60:	eb0001f6 	bl	1340 <printf>
     b64:	e30106c0 	movw	r0, #5824	; 0x16c0
     b68:	e3400000 	movt	r0, #0
     b6c:	ebfffd76 	bl	14c <panic>

00000b70 <strcpy>:
     b70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b74:	e2402001 	sub	r2, r0, #1
     b78:	e28db000 	add	fp, sp, #0
     b7c:	e4d13001 	ldrb	r3, [r1], #1
     b80:	e3530000 	cmp	r3, #0
     b84:	e5e23001 	strb	r3, [r2, #1]!
     b88:	1afffffb 	bne	b7c <strcpy+0xc>
     b8c:	e28bd000 	add	sp, fp, #0
     b90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b94:	e12fff1e 	bx	lr

00000b98 <strcmp>:
     b98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b9c:	e28db000 	add	fp, sp, #0
     ba0:	e5d03000 	ldrb	r3, [r0]
     ba4:	e5d12000 	ldrb	r2, [r1]
     ba8:	e3530000 	cmp	r3, #0
     bac:	1a000004 	bne	bc4 <strcmp+0x2c>
     bb0:	ea000005 	b	bcc <strcmp+0x34>
     bb4:	e5f03001 	ldrb	r3, [r0, #1]!
     bb8:	e3530000 	cmp	r3, #0
     bbc:	0a000006 	beq	bdc <strcmp+0x44>
     bc0:	e5f12001 	ldrb	r2, [r1, #1]!
     bc4:	e1530002 	cmp	r3, r2
     bc8:	0afffff9 	beq	bb4 <strcmp+0x1c>
     bcc:	e0430002 	sub	r0, r3, r2
     bd0:	e28bd000 	add	sp, fp, #0
     bd4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     bd8:	e12fff1e 	bx	lr
     bdc:	e5d12001 	ldrb	r2, [r1, #1]
     be0:	e0430002 	sub	r0, r3, r2
     be4:	e28bd000 	add	sp, fp, #0
     be8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     bec:	e12fff1e 	bx	lr

00000bf0 <strlen>:
     bf0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bf4:	e28db000 	add	fp, sp, #0
     bf8:	e5d03000 	ldrb	r3, [r0]
     bfc:	e3530000 	cmp	r3, #0
     c00:	0a000009 	beq	c2c <strlen+0x3c>
     c04:	e1a02000 	mov	r2, r0
     c08:	e3a03000 	mov	r3, #0
     c0c:	e5f21001 	ldrb	r1, [r2, #1]!
     c10:	e2833001 	add	r3, r3, #1
     c14:	e3510000 	cmp	r1, #0
     c18:	e1a00003 	mov	r0, r3
     c1c:	1afffffa 	bne	c0c <strlen+0x1c>
     c20:	e28bd000 	add	sp, fp, #0
     c24:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c28:	e12fff1e 	bx	lr
     c2c:	e1a00003 	mov	r0, r3
     c30:	eafffffa 	b	c20 <strlen+0x30>

00000c34 <memset>:
     c34:	e3520000 	cmp	r2, #0
     c38:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c3c:	e28db000 	add	fp, sp, #0
     c40:	0a000004 	beq	c58 <memset+0x24>
     c44:	e6ef1071 	uxtb	r1, r1
     c48:	e0802002 	add	r2, r0, r2
     c4c:	e4c01001 	strb	r1, [r0], #1
     c50:	e1520000 	cmp	r2, r0
     c54:	1afffffc 	bne	c4c <memset+0x18>
     c58:	e28bd000 	add	sp, fp, #0
     c5c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c60:	e12fff1e 	bx	lr

00000c64 <strchr>:
     c64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c68:	e28db000 	add	fp, sp, #0
     c6c:	e5d02000 	ldrb	r2, [r0]
     c70:	e3520000 	cmp	r2, #0
     c74:	0a00000b 	beq	ca8 <strchr+0x44>
     c78:	e1510002 	cmp	r1, r2
     c7c:	1a000002 	bne	c8c <strchr+0x28>
     c80:	ea000005 	b	c9c <strchr+0x38>
     c84:	e1530001 	cmp	r3, r1
     c88:	0a000003 	beq	c9c <strchr+0x38>
     c8c:	e5f03001 	ldrb	r3, [r0, #1]!
     c90:	e3530000 	cmp	r3, #0
     c94:	1afffffa 	bne	c84 <strchr+0x20>
     c98:	e1a00003 	mov	r0, r3
     c9c:	e28bd000 	add	sp, fp, #0
     ca0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     ca4:	e12fff1e 	bx	lr
     ca8:	e1a00002 	mov	r0, r2
     cac:	eafffffa 	b	c9c <strchr+0x38>

00000cb0 <gets>:
     cb0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     cb4:	e1a08000 	mov	r8, r0
     cb8:	e28db018 	add	fp, sp, #24
     cbc:	e1a07001 	mov	r7, r1
     cc0:	e24dd00c 	sub	sp, sp, #12
     cc4:	e2406001 	sub	r6, r0, #1
     cc8:	e3a05000 	mov	r5, #0
     ccc:	ea000008 	b	cf4 <gets+0x44>
     cd0:	eb000075 	bl	eac <read>
     cd4:	e3500000 	cmp	r0, #0
     cd8:	da00000b 	ble	d0c <gets+0x5c>
     cdc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
     ce0:	e1a05004 	mov	r5, r4
     ce4:	e353000d 	cmp	r3, #13
     ce8:	1353000a 	cmpne	r3, #10
     cec:	e5e63001 	strb	r3, [r6, #1]!
     cf0:	0a000005 	beq	d0c <gets+0x5c>
     cf4:	e3a02001 	mov	r2, #1
     cf8:	e0854002 	add	r4, r5, r2
     cfc:	e1540007 	cmp	r4, r7
     d00:	e24b101d 	sub	r1, fp, #29
     d04:	e3a00000 	mov	r0, #0
     d08:	bafffff0 	blt	cd0 <gets+0x20>
     d0c:	e3a03000 	mov	r3, #0
     d10:	e1a00008 	mov	r0, r8
     d14:	e7c83005 	strb	r3, [r8, r5]
     d18:	e24bd018 	sub	sp, fp, #24
     d1c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000d20 <stat>:
     d20:	e92d4830 	push	{r4, r5, fp, lr}
     d24:	e1a04001 	mov	r4, r1
     d28:	e28db00c 	add	fp, sp, #12
     d2c:	e3a01000 	mov	r1, #0
     d30:	eb00009e 	bl	fb0 <open>
     d34:	e2505000 	subs	r5, r0, #0
     d38:	ba000006 	blt	d58 <stat+0x38>
     d3c:	e1a01004 	mov	r1, r4
     d40:	eb0000c1 	bl	104c <fstat>
     d44:	e1a04000 	mov	r4, r0
     d48:	e1a00005 	mov	r0, r5
     d4c:	eb000070 	bl	f14 <close>
     d50:	e1a00004 	mov	r0, r4
     d54:	e8bd8830 	pop	{r4, r5, fp, pc}
     d58:	e3e04000 	mvn	r4, #0
     d5c:	eafffffb 	b	d50 <stat+0x30>

00000d60 <atoi>:
     d60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d64:	e28db000 	add	fp, sp, #0
     d68:	e5d02000 	ldrb	r2, [r0]
     d6c:	e2423030 	sub	r3, r2, #48	; 0x30
     d70:	e3530009 	cmp	r3, #9
     d74:	e3a03000 	mov	r3, #0
     d78:	8a000006 	bhi	d98 <atoi+0x38>
     d7c:	e3a0c00a 	mov	ip, #10
     d80:	e023239c 	mla	r3, ip, r3, r2
     d84:	e5f02001 	ldrb	r2, [r0, #1]!
     d88:	e2421030 	sub	r1, r2, #48	; 0x30
     d8c:	e3510009 	cmp	r1, #9
     d90:	e2433030 	sub	r3, r3, #48	; 0x30
     d94:	9afffff9 	bls	d80 <atoi+0x20>
     d98:	e1a00003 	mov	r0, r3
     d9c:	e28bd000 	add	sp, fp, #0
     da0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     da4:	e12fff1e 	bx	lr

00000da8 <memmove>:
     da8:	e3520000 	cmp	r2, #0
     dac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     db0:	e28db000 	add	fp, sp, #0
     db4:	da000005 	ble	dd0 <memmove+0x28>
     db8:	e0812002 	add	r2, r1, r2
     dbc:	e2403001 	sub	r3, r0, #1
     dc0:	e4d1c001 	ldrb	ip, [r1], #1
     dc4:	e1510002 	cmp	r1, r2
     dc8:	e5e3c001 	strb	ip, [r3, #1]!
     dcc:	1afffffb 	bne	dc0 <memmove+0x18>
     dd0:	e28bd000 	add	sp, fp, #0
     dd4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     dd8:	e12fff1e 	bx	lr

00000ddc <fork>:
     ddc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     de0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     de4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     de8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     dec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     df0:	e3a00001 	mov	r0, #1
     df4:	ef000040 	svc	0x00000040
     df8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dfc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e00:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e04:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e08:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e0c:	e12fff1e 	bx	lr

00000e10 <exit>:
     e10:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e14:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e18:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e1c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e20:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e24:	e3a00002 	mov	r0, #2
     e28:	ef000040 	svc	0x00000040
     e2c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e30:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e34:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e38:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e3c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e40:	e12fff1e 	bx	lr

00000e44 <wait>:
     e44:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e48:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e4c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e50:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e54:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e58:	e3a00003 	mov	r0, #3
     e5c:	ef000040 	svc	0x00000040
     e60:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e64:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e68:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e6c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e74:	e12fff1e 	bx	lr

00000e78 <pipe>:
     e78:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e7c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e80:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e84:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e88:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e8c:	e3a00004 	mov	r0, #4
     e90:	ef000040 	svc	0x00000040
     e94:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e98:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e9c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ea0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ea4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ea8:	e12fff1e 	bx	lr

00000eac <read>:
     eac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     eb0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     eb4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     eb8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ebc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ec0:	e3a00005 	mov	r0, #5
     ec4:	ef000040 	svc	0x00000040
     ec8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ecc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ed0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ed4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ed8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     edc:	e12fff1e 	bx	lr

00000ee0 <write>:
     ee0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ee4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ee8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     eec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ef0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ef4:	e3a00010 	mov	r0, #16
     ef8:	ef000040 	svc	0x00000040
     efc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f00:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f04:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f08:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f10:	e12fff1e 	bx	lr

00000f14 <close>:
     f14:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f18:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f1c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f20:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f24:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f28:	e3a00015 	mov	r0, #21
     f2c:	ef000040 	svc	0x00000040
     f30:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f34:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f38:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f3c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f40:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f44:	e12fff1e 	bx	lr

00000f48 <kill>:
     f48:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f4c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f50:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f54:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f58:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f5c:	e3a00006 	mov	r0, #6
     f60:	ef000040 	svc	0x00000040
     f64:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f68:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f6c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f70:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f74:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f78:	e12fff1e 	bx	lr

00000f7c <exec>:
     f7c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f80:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f84:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f88:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f8c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f90:	e3a00007 	mov	r0, #7
     f94:	ef000040 	svc	0x00000040
     f98:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f9c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fa0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fa4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fa8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fac:	e12fff1e 	bx	lr

00000fb0 <open>:
     fb0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fb4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fb8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fbc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fc0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fc4:	e3a0000f 	mov	r0, #15
     fc8:	ef000040 	svc	0x00000040
     fcc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fd0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fd4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fd8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fdc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fe0:	e12fff1e 	bx	lr

00000fe4 <mknod>:
     fe4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fe8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ff0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ff4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ff8:	e3a00011 	mov	r0, #17
     ffc:	ef000040 	svc	0x00000040
    1000:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1004:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1008:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    100c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1010:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1014:	e12fff1e 	bx	lr

00001018 <unlink>:
    1018:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    101c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1020:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1024:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1028:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    102c:	e3a00012 	mov	r0, #18
    1030:	ef000040 	svc	0x00000040
    1034:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1038:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    103c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1040:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1044:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1048:	e12fff1e 	bx	lr

0000104c <fstat>:
    104c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1050:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1054:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1058:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    105c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1060:	e3a00008 	mov	r0, #8
    1064:	ef000040 	svc	0x00000040
    1068:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    106c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1070:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1074:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1078:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    107c:	e12fff1e 	bx	lr

00001080 <link>:
    1080:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1084:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1088:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    108c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1090:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1094:	e3a00013 	mov	r0, #19
    1098:	ef000040 	svc	0x00000040
    109c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10b0:	e12fff1e 	bx	lr

000010b4 <mkdir>:
    10b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10c8:	e3a00014 	mov	r0, #20
    10cc:	ef000040 	svc	0x00000040
    10d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10e4:	e12fff1e 	bx	lr

000010e8 <chdir>:
    10e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10fc:	e3a00009 	mov	r0, #9
    1100:	ef000040 	svc	0x00000040
    1104:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1108:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    110c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1110:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1114:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1118:	e12fff1e 	bx	lr

0000111c <dup>:
    111c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1120:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1124:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1128:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    112c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1130:	e3a0000a 	mov	r0, #10
    1134:	ef000040 	svc	0x00000040
    1138:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    113c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1140:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1144:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1148:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    114c:	e12fff1e 	bx	lr

00001150 <getpid>:
    1150:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1154:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1158:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    115c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1160:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1164:	e3a0000b 	mov	r0, #11
    1168:	ef000040 	svc	0x00000040
    116c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1170:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1174:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1178:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    117c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1180:	e12fff1e 	bx	lr

00001184 <sbrk>:
    1184:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1188:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    118c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1190:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1194:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1198:	e3a0000c 	mov	r0, #12
    119c:	ef000040 	svc	0x00000040
    11a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    11ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11b4:	e12fff1e 	bx	lr

000011b8 <sleep>:
    11b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    11cc:	e3a0000d 	mov	r0, #13
    11d0:	ef000040 	svc	0x00000040
    11d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    11e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11e8:	e12fff1e 	bx	lr

000011ec <uptime>:
    11ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1200:	e3a0000e 	mov	r0, #14
    1204:	ef000040 	svc	0x00000040
    1208:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    120c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1210:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1214:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1218:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    121c:	e12fff1e 	bx	lr

00001220 <printint>:
    1220:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    1224:	e1a09fa1 	lsr	r9, r1, #31
    1228:	e3530000 	cmp	r3, #0
    122c:	03a09000 	moveq	r9, #0
    1230:	12099001 	andne	r9, r9, #1
    1234:	e28db01c 	add	fp, sp, #28
    1238:	e3590000 	cmp	r9, #0
    123c:	e3018738 	movw	r8, #5944	; 0x1738
    1240:	1261e000 	rsbne	lr, r1, #0
    1244:	e3408000 	movt	r8, #0
    1248:	e24b602d 	sub	r6, fp, #45	; 0x2d
    124c:	e1a04000 	mov	r4, r0
    1250:	13a09001 	movne	r9, #1
    1254:	01a0e001 	moveq	lr, r1
    1258:	e3a07000 	mov	r7, #0
    125c:	e3a05001 	mov	r5, #1
    1260:	e24dd018 	sub	sp, sp, #24
    1264:	e3a0c000 	mov	ip, #0
    1268:	e3a0301f 	mov	r3, #31
    126c:	e1a0100c 	mov	r1, ip
    1270:	e1a0033e 	lsr	r0, lr, r3
    1274:	e2000001 	and	r0, r0, #1
    1278:	e1801081 	orr	r1, r0, r1, lsl #1
    127c:	e1520001 	cmp	r2, r1
    1280:	90411002 	subls	r1, r1, r2
    1284:	918cc315 	orrls	ip, ip, r5, lsl r3
    1288:	e2533001 	subs	r3, r3, #1
    128c:	2afffff7 	bcs	1270 <printint+0x50>
    1290:	e061e29c 	mls	r1, ip, r2, lr
    1294:	e35c0000 	cmp	ip, #0
    1298:	e1a0e00c 	mov	lr, ip
    129c:	e2873001 	add	r3, r7, #1
    12a0:	e7d81001 	ldrb	r1, [r8, r1]
    12a4:	e5e61001 	strb	r1, [r6, #1]!
    12a8:	11a07003 	movne	r7, r3
    12ac:	1affffec 	bne	1264 <printint+0x44>
    12b0:	e3590000 	cmp	r9, #0
    12b4:	124b201c 	subne	r2, fp, #28
    12b8:	10822003 	addne	r2, r2, r3
    12bc:	13a0102d 	movne	r1, #45	; 0x2d
    12c0:	12873002 	addne	r3, r7, #2
    12c4:	15421010 	strbne	r1, [r2, #-16]
    12c8:	e24b202c 	sub	r2, fp, #44	; 0x2c
    12cc:	e2435001 	sub	r5, r3, #1
    12d0:	e0826003 	add	r6, r2, r3
    12d4:	e5763001 	ldrb	r3, [r6, #-1]!
    12d8:	e2455001 	sub	r5, r5, #1
    12dc:	e3a02001 	mov	r2, #1
    12e0:	e24b102d 	sub	r1, fp, #45	; 0x2d
    12e4:	e1a00004 	mov	r0, r4
    12e8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    12ec:	ebfffefb 	bl	ee0 <write>
    12f0:	e3750001 	cmn	r5, #1
    12f4:	1afffff6 	bne	12d4 <printint+0xb4>
    12f8:	e24bd01c 	sub	sp, fp, #28
    12fc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00001300 <div>:
    1300:	e92d4810 	push	{r4, fp, lr}
    1304:	e3a02000 	mov	r2, #0
    1308:	e28db008 	add	fp, sp, #8
    130c:	e1a0e000 	mov	lr, r0
    1310:	e3a0301f 	mov	r3, #31
    1314:	e1a00002 	mov	r0, r2
    1318:	e3a04001 	mov	r4, #1
    131c:	e1a0c33e 	lsr	ip, lr, r3
    1320:	e20cc001 	and	ip, ip, #1
    1324:	e18c2082 	orr	r2, ip, r2, lsl #1
    1328:	e1520001 	cmp	r2, r1
    132c:	20422001 	subcs	r2, r2, r1
    1330:	21800314 	orrcs	r0, r0, r4, lsl r3
    1334:	e2533001 	subs	r3, r3, #1
    1338:	2afffff7 	bcs	131c <div+0x1c>
    133c:	e8bd8810 	pop	{r4, fp, pc}

00001340 <printf>:
    1340:	e92d000e 	push	{r1, r2, r3}
    1344:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    1348:	e28db018 	add	fp, sp, #24
    134c:	e24dd008 	sub	sp, sp, #8
    1350:	e59b6004 	ldr	r6, [fp, #4]
    1354:	e5d64000 	ldrb	r4, [r6]
    1358:	e3540000 	cmp	r4, #0
    135c:	0a00002b 	beq	1410 <printf+0xd0>
    1360:	e1a07000 	mov	r7, r0
    1364:	e28b8008 	add	r8, fp, #8
    1368:	e3a05000 	mov	r5, #0
    136c:	ea00000a 	b	139c <printf+0x5c>
    1370:	e3540025 	cmp	r4, #37	; 0x25
    1374:	01a05004 	moveq	r5, r4
    1378:	0a000004 	beq	1390 <printf+0x50>
    137c:	e24b1018 	sub	r1, fp, #24
    1380:	e3a02001 	mov	r2, #1
    1384:	e1a00007 	mov	r0, r7
    1388:	e5614006 	strb	r4, [r1, #-6]!
    138c:	ebfffed3 	bl	ee0 <write>
    1390:	e5f64001 	ldrb	r4, [r6, #1]!
    1394:	e3540000 	cmp	r4, #0
    1398:	0a00001c 	beq	1410 <printf+0xd0>
    139c:	e3550000 	cmp	r5, #0
    13a0:	0afffff2 	beq	1370 <printf+0x30>
    13a4:	e3550025 	cmp	r5, #37	; 0x25
    13a8:	1afffff8 	bne	1390 <printf+0x50>
    13ac:	e3540064 	cmp	r4, #100	; 0x64
    13b0:	0a000037 	beq	1494 <printf+0x154>
    13b4:	e20430f7 	and	r3, r4, #247	; 0xf7
    13b8:	e3530070 	cmp	r3, #112	; 0x70
    13bc:	0a000017 	beq	1420 <printf+0xe0>
    13c0:	e3540073 	cmp	r4, #115	; 0x73
    13c4:	0a00001c 	beq	143c <printf+0xfc>
    13c8:	e3540063 	cmp	r4, #99	; 0x63
    13cc:	0a000037 	beq	14b0 <printf+0x170>
    13d0:	e3540025 	cmp	r4, #37	; 0x25
    13d4:	0a000027 	beq	1478 <printf+0x138>
    13d8:	e3a02001 	mov	r2, #1
    13dc:	e24b1019 	sub	r1, fp, #25
    13e0:	e1a00007 	mov	r0, r7
    13e4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    13e8:	ebfffebc 	bl	ee0 <write>
    13ec:	e3a02001 	mov	r2, #1
    13f0:	e24b101a 	sub	r1, fp, #26
    13f4:	e1a00007 	mov	r0, r7
    13f8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    13fc:	ebfffeb7 	bl	ee0 <write>
    1400:	e5f64001 	ldrb	r4, [r6, #1]!
    1404:	e3a05000 	mov	r5, #0
    1408:	e3540000 	cmp	r4, #0
    140c:	1affffe2 	bne	139c <printf+0x5c>
    1410:	e24bd018 	sub	sp, fp, #24
    1414:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    1418:	e28dd00c 	add	sp, sp, #12
    141c:	e12fff1e 	bx	lr
    1420:	e3a03000 	mov	r3, #0
    1424:	e3a02010 	mov	r2, #16
    1428:	e4981004 	ldr	r1, [r8], #4
    142c:	e1a00007 	mov	r0, r7
    1430:	ebffff7a 	bl	1220 <printint>
    1434:	e3a05000 	mov	r5, #0
    1438:	eaffffd4 	b	1390 <printf+0x50>
    143c:	e4984004 	ldr	r4, [r8], #4
    1440:	e3540000 	cmp	r4, #0
    1444:	0a000021 	beq	14d0 <printf+0x190>
    1448:	e5d45000 	ldrb	r5, [r4]
    144c:	e3550000 	cmp	r5, #0
    1450:	0affffce 	beq	1390 <printf+0x50>
    1454:	e3a02001 	mov	r2, #1
    1458:	e24b101d 	sub	r1, fp, #29
    145c:	e1a00007 	mov	r0, r7
    1460:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
    1464:	ebfffe9d 	bl	ee0 <write>
    1468:	e5f45001 	ldrb	r5, [r4, #1]!
    146c:	e3550000 	cmp	r5, #0
    1470:	1afffff7 	bne	1454 <printf+0x114>
    1474:	eaffffc5 	b	1390 <printf+0x50>
    1478:	e24b1018 	sub	r1, fp, #24
    147c:	e3a02001 	mov	r2, #1
    1480:	e1a00007 	mov	r0, r7
    1484:	e5615003 	strb	r5, [r1, #-3]!
    1488:	e3a05000 	mov	r5, #0
    148c:	ebfffe93 	bl	ee0 <write>
    1490:	eaffffbe 	b	1390 <printf+0x50>
    1494:	e3a03001 	mov	r3, #1
    1498:	e3a0200a 	mov	r2, #10
    149c:	e4981004 	ldr	r1, [r8], #4
    14a0:	e1a00007 	mov	r0, r7
    14a4:	ebffff5d 	bl	1220 <printint>
    14a8:	e3a05000 	mov	r5, #0
    14ac:	eaffffb7 	b	1390 <printf+0x50>
    14b0:	e4983004 	ldr	r3, [r8], #4
    14b4:	e24b1018 	sub	r1, fp, #24
    14b8:	e3a02001 	mov	r2, #1
    14bc:	e1a00007 	mov	r0, r7
    14c0:	e3a05000 	mov	r5, #0
    14c4:	e5613004 	strb	r3, [r1, #-4]!
    14c8:	ebfffe84 	bl	ee0 <write>
    14cc:	eaffffaf 	b	1390 <printf+0x50>
    14d0:	e301474c 	movw	r4, #5964	; 0x174c
    14d4:	e3a05028 	mov	r5, #40	; 0x28
    14d8:	e3404000 	movt	r4, #0
    14dc:	eaffffdc 	b	1454 <printf+0x114>

000014e0 <free>:
    14e0:	e301c7c8 	movw	ip, #6088	; 0x17c8
    14e4:	e340c000 	movt	ip, #0
    14e8:	e92d4810 	push	{r4, fp, lr}
    14ec:	e2401008 	sub	r1, r0, #8
    14f0:	e28db008 	add	fp, sp, #8
    14f4:	e59c3000 	ldr	r3, [ip]
    14f8:	ea000004 	b	1510 <free+0x30>
    14fc:	e1510002 	cmp	r1, r2
    1500:	3a000009 	bcc	152c <free+0x4c>
    1504:	e1530002 	cmp	r3, r2
    1508:	2a000007 	bcs	152c <free+0x4c>
    150c:	e1a03002 	mov	r3, r2
    1510:	e1530001 	cmp	r3, r1
    1514:	e5932000 	ldr	r2, [r3]
    1518:	3afffff7 	bcc	14fc <free+0x1c>
    151c:	e1530002 	cmp	r3, r2
    1520:	3afffff9 	bcc	150c <free+0x2c>
    1524:	e1510002 	cmp	r1, r2
    1528:	2afffff7 	bcs	150c <free+0x2c>
    152c:	e510e004 	ldr	lr, [r0, #-4]
    1530:	e58c3000 	str	r3, [ip]
    1534:	e081418e 	add	r4, r1, lr, lsl #3
    1538:	e1520004 	cmp	r2, r4
    153c:	05922004 	ldreq	r2, [r2, #4]
    1540:	0082e00e 	addeq	lr, r2, lr
    1544:	0500e004 	streq	lr, [r0, #-4]
    1548:	05932000 	ldreq	r2, [r3]
    154c:	05922000 	ldreq	r2, [r2]
    1550:	e5002008 	str	r2, [r0, #-8]
    1554:	e5932004 	ldr	r2, [r3, #4]
    1558:	e083e182 	add	lr, r3, r2, lsl #3
    155c:	e151000e 	cmp	r1, lr
    1560:	15831000 	strne	r1, [r3]
    1564:	05101004 	ldreq	r1, [r0, #-4]
    1568:	00812002 	addeq	r2, r1, r2
    156c:	05832004 	streq	r2, [r3, #4]
    1570:	05102008 	ldreq	r2, [r0, #-8]
    1574:	05832000 	streq	r2, [r3]
    1578:	e8bd8810 	pop	{r4, fp, pc}

0000157c <malloc>:
    157c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1580:	e30177c8 	movw	r7, #6088	; 0x17c8
    1584:	e3407000 	movt	r7, #0
    1588:	e2804007 	add	r4, r0, #7
    158c:	e28db014 	add	fp, sp, #20
    1590:	e5973000 	ldr	r3, [r7]
    1594:	e1a041a4 	lsr	r4, r4, #3
    1598:	e2844001 	add	r4, r4, #1
    159c:	e3530000 	cmp	r3, #0
    15a0:	0a000027 	beq	1644 <malloc+0xc8>
    15a4:	e5930000 	ldr	r0, [r3]
    15a8:	e5902004 	ldr	r2, [r0, #4]
    15ac:	e1540002 	cmp	r4, r2
    15b0:	9a000019 	bls	161c <malloc+0xa0>
    15b4:	e3540a01 	cmp	r4, #4096	; 0x1000
    15b8:	21a05004 	movcs	r5, r4
    15bc:	33a05a01 	movcc	r5, #4096	; 0x1000
    15c0:	e1a06185 	lsl	r6, r5, #3
    15c4:	ea000003 	b	15d8 <malloc+0x5c>
    15c8:	e5930000 	ldr	r0, [r3]
    15cc:	e5902004 	ldr	r2, [r0, #4]
    15d0:	e1540002 	cmp	r4, r2
    15d4:	9a000010 	bls	161c <malloc+0xa0>
    15d8:	e5972000 	ldr	r2, [r7]
    15dc:	e1a03000 	mov	r3, r0
    15e0:	e1520000 	cmp	r2, r0
    15e4:	1afffff7 	bne	15c8 <malloc+0x4c>
    15e8:	e1a00006 	mov	r0, r6
    15ec:	ebfffee4 	bl	1184 <sbrk>
    15f0:	e1a03000 	mov	r3, r0
    15f4:	e3730001 	cmn	r3, #1
    15f8:	e2800008 	add	r0, r0, #8
    15fc:	0a000004 	beq	1614 <malloc+0x98>
    1600:	e5835004 	str	r5, [r3, #4]
    1604:	ebffffb5 	bl	14e0 <free>
    1608:	e5973000 	ldr	r3, [r7]
    160c:	e3530000 	cmp	r3, #0
    1610:	1affffec 	bne	15c8 <malloc+0x4c>
    1614:	e3a00000 	mov	r0, #0
    1618:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    161c:	e1540002 	cmp	r4, r2
    1620:	e5873000 	str	r3, [r7]
    1624:	10422004 	subne	r2, r2, r4
    1628:	15802004 	strne	r2, [r0, #4]
    162c:	05902000 	ldreq	r2, [r0]
    1630:	10800182 	addne	r0, r0, r2, lsl #3
    1634:	e2800008 	add	r0, r0, #8
    1638:	15004004 	strne	r4, [r0, #-4]
    163c:	05832000 	streq	r2, [r3]
    1640:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    1644:	e2870004 	add	r0, r7, #4
    1648:	e5873008 	str	r3, [r7, #8]
    164c:	e5870000 	str	r0, [r7]
    1650:	e5870004 	str	r0, [r7, #4]
    1654:	eaffffd6 	b	15b4 <malloc+0x38>
