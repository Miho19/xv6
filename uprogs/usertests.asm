
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
       0:	e92d4800 	push	{fp, lr}
       4:	e3a00001 	mov	r0, #1
       8:	e28db004 	add	fp, sp, #4
       c:	e3051794 	movw	r1, #22420	; 0x5794
      10:	e3401000 	movt	r1, #0
      14:	eb000ea1 	bl	3aa0 <printf>
      18:	e30507a8 	movw	r0, #22440	; 0x57a8
      1c:	e3a01000 	mov	r1, #0
      20:	e3400000 	movt	r0, #0
      24:	eb000db9 	bl	3710 <open>
      28:	e3500000 	cmp	r0, #0
      2c:	ba000004 	blt	44 <main+0x44>
      30:	e30517b8 	movw	r1, #22456	; 0x57b8
      34:	e3a00001 	mov	r0, #1
      38:	e3401000 	movt	r1, #0
      3c:	eb000e97 	bl	3aa0 <printf>
      40:	eb000d3d 	bl	353c <exit>
      44:	e3a01c02 	mov	r1, #512	; 0x200
      48:	e30507a8 	movw	r0, #22440	; 0x57a8
      4c:	e3400000 	movt	r0, #0
      50:	eb000dae 	bl	3710 <open>
      54:	eb000d86 	bl	3674 <close>
      58:	eb000bb1 	bl	2f24 <bigargtest>
      5c:	eb0007ce 	bl	1f9c <bigwrite>
      60:	eb000baf 	bl	2f24 <bigargtest>
      64:	eb000b8f 	bl	2ea8 <bsstest>
      68:	eb000a02 	bl	2878 <sbrktest>
      6c:	eb000b62 	bl	2dfc <validatetest>
      70:	eb000017 	bl	d4 <opentest>
      74:	eb00003a 	bl	164 <writetest>
      78:	eb0000a7 	bl	31c <writetest1>
      7c:	eb00010f 	bl	4c0 <createtest>
      80:	eb000253 	bl	9d4 <mem>
      84:	eb000182 	bl	694 <pipe1>
      88:	eb0001e5 	bl	824 <preempt>
      8c:	eb000230 	bl	954 <exitwait>
      90:	eb0008b5 	bl	236c <rmdot>
      94:	eb000868 	bl	223c <fourteen>
      98:	eb0007f8 	bl	2080 <bigfile>
      9c:	eb00061e 	bl	191c <subdir>
      a0:	eb0004cd 	bl	13dc <concreate>
      a4:	eb000590 	bl	16ec <linkunlink>
      a8:	eb000449 	bl	11d4 <linktest>
      ac:	eb0003e6 	bl	104c <unlinkread>
      b0:	eb00035c 	bl	e28 <createdelete>
      b4:	eb0002d9 	bl	c20 <twofiles>
      b8:	eb000272 	bl	a88 <sharedfd>
      bc:	eb000906 	bl	24dc <dirfile>
      c0:	eb00097f 	bl	26c4 <iref>
      c4:	eb0009bd 	bl	27c0 <forktest>
      c8:	eb0005c4 	bl	17e0 <bigdir>
      cc:	eb00015d 	bl	648 <exectest>
      d0:	eb000d19 	bl	353c <exit>

000000d4 <opentest>:
      d4:	e92d4830 	push	{r4, r5, fp, lr}
      d8:	e3054814 	movw	r4, #22548	; 0x5814
      dc:	e3404000 	movt	r4, #0
      e0:	e28db00c 	add	fp, sp, #12
      e4:	e3031db8 	movw	r1, #15800	; 0x3db8
      e8:	e3401000 	movt	r1, #0
      ec:	e5940000 	ldr	r0, [r4]
      f0:	eb000e6a 	bl	3aa0 <printf>
      f4:	e3030dc4 	movw	r0, #15812	; 0x3dc4
      f8:	e3a01000 	mov	r1, #0
      fc:	e3400000 	movt	r0, #0
     100:	eb000d82 	bl	3710 <open>
     104:	e3500000 	cmp	r0, #0
     108:	ba00000c 	blt	140 <opentest+0x6c>
     10c:	eb000d58 	bl	3674 <close>
     110:	e3030de0 	movw	r0, #15840	; 0x3de0
     114:	e3a01000 	mov	r1, #0
     118:	e3400000 	movt	r0, #0
     11c:	eb000d7b 	bl	3710 <open>
     120:	e3500000 	cmp	r0, #0
     124:	e5940000 	ldr	r0, [r4]
     128:	aa000009 	bge	154 <opentest+0x80>
     12c:	e3031e10 	movw	r1, #15888	; 0x3e10
     130:	e3401000 	movt	r1, #0
     134:	e24bd00c 	sub	sp, fp, #12
     138:	e8bd4830 	pop	{r4, r5, fp, lr}
     13c:	ea000e57 	b	3aa0 <printf>
     140:	e5940000 	ldr	r0, [r4]
     144:	e3031dcc 	movw	r1, #15820	; 0x3dcc
     148:	e3401000 	movt	r1, #0
     14c:	eb000e53 	bl	3aa0 <printf>
     150:	eb000cf9 	bl	353c <exit>
     154:	e3031df0 	movw	r1, #15856	; 0x3df0
     158:	e3401000 	movt	r1, #0
     15c:	eb000e4f 	bl	3aa0 <printf>
     160:	eb000cf5 	bl	353c <exit>

00000164 <writetest>:
     164:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     168:	e3058814 	movw	r8, #22548	; 0x5814
     16c:	e3408000 	movt	r8, #0
     170:	e28db01c 	add	fp, sp, #28
     174:	e3031e20 	movw	r1, #15904	; 0x3e20
     178:	e3401000 	movt	r1, #0
     17c:	e5980000 	ldr	r0, [r8]
     180:	eb000e46 	bl	3aa0 <printf>
     184:	e3030e34 	movw	r0, #15924	; 0x3e34
     188:	e3001202 	movw	r1, #514	; 0x202
     18c:	e3400000 	movt	r0, #0
     190:	eb000d5e 	bl	3710 <open>
     194:	e2505000 	subs	r5, r0, #0
     198:	ba00005a 	blt	308 <writetest+0x1a4>
     19c:	e3031e3c 	movw	r1, #15932	; 0x3e3c
     1a0:	e5980000 	ldr	r0, [r8]
     1a4:	e3401000 	movt	r1, #0
     1a8:	e3036e74 	movw	r6, #15988	; 0x3e74
     1ac:	eb000e3b 	bl	3aa0 <printf>
     1b0:	e3037ea4 	movw	r7, #16036	; 0x3ea4
     1b4:	e3406000 	movt	r6, #0
     1b8:	e3407000 	movt	r7, #0
     1bc:	e3a04000 	mov	r4, #0
     1c0:	e3a0200a 	mov	r2, #10
     1c4:	e1a01006 	mov	r1, r6
     1c8:	e1a00005 	mov	r0, r5
     1cc:	eb000d1b 	bl	3640 <write>
     1d0:	e350000a 	cmp	r0, #10
     1d4:	1a000030 	bne	29c <writetest+0x138>
     1d8:	e1a02000 	mov	r2, r0
     1dc:	e1a01007 	mov	r1, r7
     1e0:	e1a00005 	mov	r0, r5
     1e4:	eb000d15 	bl	3640 <write>
     1e8:	e350000a 	cmp	r0, #10
     1ec:	1a000030 	bne	2b4 <writetest+0x150>
     1f0:	e2844001 	add	r4, r4, #1
     1f4:	e3540064 	cmp	r4, #100	; 0x64
     1f8:	1afffff0 	bne	1c0 <writetest+0x5c>
     1fc:	e5980000 	ldr	r0, [r8]
     200:	e3031ed4 	movw	r1, #16084	; 0x3ed4
     204:	e3401000 	movt	r1, #0
     208:	eb000e24 	bl	3aa0 <printf>
     20c:	e1a00005 	mov	r0, r5
     210:	eb000d17 	bl	3674 <close>
     214:	e3030e34 	movw	r0, #15924	; 0x3e34
     218:	e3a01000 	mov	r1, #0
     21c:	e3400000 	movt	r0, #0
     220:	eb000d3a 	bl	3710 <open>
     224:	e2504000 	subs	r4, r0, #0
     228:	ba000027 	blt	2cc <writetest+0x168>
     22c:	e5980000 	ldr	r0, [r8]
     230:	e3031ee0 	movw	r1, #16096	; 0x3ee0
     234:	e3401000 	movt	r1, #0
     238:	eb000e18 	bl	3aa0 <printf>
     23c:	e3071fcc 	movw	r1, #32716	; 0x7fcc
     240:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     244:	e3401000 	movt	r1, #0
     248:	e1a00004 	mov	r0, r4
     24c:	eb000cee 	bl	360c <read>
     250:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     254:	1a000021 	bne	2e0 <writetest+0x17c>
     258:	e5980000 	ldr	r0, [r8]
     25c:	e3031f18 	movw	r1, #16152	; 0x3f18
     260:	e3401000 	movt	r1, #0
     264:	eb000e0d 	bl	3aa0 <printf>
     268:	e1a00004 	mov	r0, r4
     26c:	eb000d00 	bl	3674 <close>
     270:	e3030e34 	movw	r0, #15924	; 0x3e34
     274:	e3400000 	movt	r0, #0
     278:	eb000d3e 	bl	3778 <unlink>
     27c:	e3500000 	cmp	r0, #0
     280:	ba00001b 	blt	2f4 <writetest+0x190>
     284:	e5980000 	ldr	r0, [r8]
     288:	e3031f54 	movw	r1, #16212	; 0x3f54
     28c:	e3401000 	movt	r1, #0
     290:	e24bd01c 	sub	sp, fp, #28
     294:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
     298:	ea000e00 	b	3aa0 <printf>
     29c:	e1a02004 	mov	r2, r4
     2a0:	e5980000 	ldr	r0, [r8]
     2a4:	e3031e80 	movw	r1, #16000	; 0x3e80
     2a8:	e3401000 	movt	r1, #0
     2ac:	eb000dfb 	bl	3aa0 <printf>
     2b0:	eb000ca1 	bl	353c <exit>
     2b4:	e1a02004 	mov	r2, r4
     2b8:	e5980000 	ldr	r0, [r8]
     2bc:	e3031eb0 	movw	r1, #16048	; 0x3eb0
     2c0:	e3401000 	movt	r1, #0
     2c4:	eb000df5 	bl	3aa0 <printf>
     2c8:	eb000c9b 	bl	353c <exit>
     2cc:	e5980000 	ldr	r0, [r8]
     2d0:	e3031efc 	movw	r1, #16124	; 0x3efc
     2d4:	e3401000 	movt	r1, #0
     2d8:	eb000df0 	bl	3aa0 <printf>
     2dc:	eb000c96 	bl	353c <exit>
     2e0:	e5980000 	ldr	r0, [r8]
     2e4:	e3031f2c 	movw	r1, #16172	; 0x3f2c
     2e8:	e3401000 	movt	r1, #0
     2ec:	eb000deb 	bl	3aa0 <printf>
     2f0:	eb000c91 	bl	353c <exit>
     2f4:	e5980000 	ldr	r0, [r8]
     2f8:	e3031f3c 	movw	r1, #16188	; 0x3f3c
     2fc:	e3401000 	movt	r1, #0
     300:	eb000de6 	bl	3aa0 <printf>
     304:	eb000c8c 	bl	353c <exit>
     308:	e5980000 	ldr	r0, [r8]
     30c:	e3031e58 	movw	r1, #15960	; 0x3e58
     310:	e3401000 	movt	r1, #0
     314:	eb000de1 	bl	3aa0 <printf>
     318:	eb000c87 	bl	353c <exit>

0000031c <writetest1>:
     31c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     320:	e3058814 	movw	r8, #22548	; 0x5814
     324:	e3408000 	movt	r8, #0
     328:	e28db01c 	add	fp, sp, #28
     32c:	e3031f68 	movw	r1, #16232	; 0x3f68
     330:	e3401000 	movt	r1, #0
     334:	e5980000 	ldr	r0, [r8]
     338:	eb000dd8 	bl	3aa0 <printf>
     33c:	e3030f78 	movw	r0, #16248	; 0x3f78
     340:	e3001202 	movw	r1, #514	; 0x202
     344:	e3400000 	movt	r0, #0
     348:	eb000cf0 	bl	3710 <open>
     34c:	e2506000 	subs	r6, r0, #0
     350:	a3075fcc 	movwge	r5, #32716	; 0x7fcc
     354:	a3405000 	movtge	r5, #0
     358:	a3a04000 	movge	r4, #0
     35c:	a1a07005 	movge	r7, r5
     360:	ba00004d 	blt	49c <writetest1+0x180>
     364:	e3a02c02 	mov	r2, #512	; 0x200
     368:	e1a01007 	mov	r1, r7
     36c:	e1a00006 	mov	r0, r6
     370:	e5854000 	str	r4, [r5]
     374:	eb000cb1 	bl	3640 <write>
     378:	e3500c02 	cmp	r0, #512	; 0x200
     37c:	1a000029 	bne	428 <writetest1+0x10c>
     380:	e2844001 	add	r4, r4, #1
     384:	e354008c 	cmp	r4, #140	; 0x8c
     388:	1afffff5 	bne	364 <writetest1+0x48>
     38c:	e1a00006 	mov	r0, r6
     390:	eb000cb7 	bl	3674 <close>
     394:	e3030f78 	movw	r0, #16248	; 0x3f78
     398:	e3a01000 	mov	r1, #0
     39c:	e3400000 	movt	r0, #0
     3a0:	eb000cda 	bl	3710 <open>
     3a4:	e2507000 	subs	r7, r0, #0
     3a8:	ba000036 	blt	488 <writetest1+0x16c>
     3ac:	e3076fcc 	movw	r6, #32716	; 0x7fcc
     3b0:	e3a04000 	mov	r4, #0
     3b4:	e3406000 	movt	r6, #0
     3b8:	ea000005 	b	3d4 <writetest1+0xb8>
     3bc:	e3500c02 	cmp	r0, #512	; 0x200
     3c0:	1a000024 	bne	458 <writetest1+0x13c>
     3c4:	e5953000 	ldr	r3, [r5]
     3c8:	e1540003 	cmp	r4, r3
     3cc:	1a00001b 	bne	440 <writetest1+0x124>
     3d0:	e2844001 	add	r4, r4, #1
     3d4:	e3a02c02 	mov	r2, #512	; 0x200
     3d8:	e1a01006 	mov	r1, r6
     3dc:	e1a00007 	mov	r0, r7
     3e0:	eb000c89 	bl	360c <read>
     3e4:	e3500000 	cmp	r0, #0
     3e8:	1afffff3 	bne	3bc <writetest1+0xa0>
     3ec:	e354008b 	cmp	r4, #139	; 0x8b
     3f0:	0a00001e 	beq	470 <writetest1+0x154>
     3f4:	e1a00007 	mov	r0, r7
     3f8:	eb000c9d 	bl	3674 <close>
     3fc:	e3030f78 	movw	r0, #16248	; 0x3f78
     400:	e3400000 	movt	r0, #0
     404:	eb000cdb 	bl	3778 <unlink>
     408:	e3500000 	cmp	r0, #0
     40c:	e5980000 	ldr	r0, [r8]
     410:	ba000026 	blt	4b0 <writetest1+0x194>
     414:	e3041038 	movw	r1, #16440	; 0x4038
     418:	e3401000 	movt	r1, #0
     41c:	e24bd01c 	sub	sp, fp, #28
     420:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
     424:	ea000d9d 	b	3aa0 <printf>
     428:	e1a02004 	mov	r2, r4
     42c:	e5980000 	ldr	r0, [r8]
     430:	e3031f98 	movw	r1, #16280	; 0x3f98
     434:	e3401000 	movt	r1, #0
     438:	eb000d98 	bl	3aa0 <printf>
     43c:	eb000c3e 	bl	353c <exit>
     440:	e1a02004 	mov	r2, r4
     444:	e5980000 	ldr	r0, [r8]
     448:	e3041004 	movw	r1, #16388	; 0x4004
     44c:	e3401000 	movt	r1, #0
     450:	eb000d92 	bl	3aa0 <printf>
     454:	eb000c38 	bl	353c <exit>
     458:	e1a02000 	mov	r2, r0
     45c:	e3031ff4 	movw	r1, #16372	; 0x3ff4
     460:	e5980000 	ldr	r0, [r8]
     464:	e3401000 	movt	r1, #0
     468:	eb000d8c 	bl	3aa0 <printf>
     46c:	eb000c32 	bl	353c <exit>
     470:	e1a02004 	mov	r2, r4
     474:	e5980000 	ldr	r0, [r8]
     478:	e3031fd4 	movw	r1, #16340	; 0x3fd4
     47c:	e3401000 	movt	r1, #0
     480:	eb000d86 	bl	3aa0 <printf>
     484:	eb000c2c 	bl	353c <exit>
     488:	e5980000 	ldr	r0, [r8]
     48c:	e3031fb8 	movw	r1, #16312	; 0x3fb8
     490:	e3401000 	movt	r1, #0
     494:	eb000d81 	bl	3aa0 <printf>
     498:	eb000c27 	bl	353c <exit>
     49c:	e5980000 	ldr	r0, [r8]
     4a0:	e3031f7c 	movw	r1, #16252	; 0x3f7c
     4a4:	e3401000 	movt	r1, #0
     4a8:	eb000d7c 	bl	3aa0 <printf>
     4ac:	eb000c22 	bl	353c <exit>
     4b0:	e3041024 	movw	r1, #16420	; 0x4024
     4b4:	e3401000 	movt	r1, #0
     4b8:	eb000d78 	bl	3aa0 <printf>
     4bc:	eb000c1e 	bl	353c <exit>

000004c0 <createtest>:
     4c0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     4c4:	e3057814 	movw	r7, #22548	; 0x5814
     4c8:	e3095fcc 	movw	r5, #40908	; 0x9fcc
     4cc:	e3407000 	movt	r7, #0
     4d0:	e3405000 	movt	r5, #0
     4d4:	e28db014 	add	fp, sp, #20
     4d8:	e3041048 	movw	r1, #16456	; 0x4048
     4dc:	e5970000 	ldr	r0, [r7]
     4e0:	e3401000 	movt	r1, #0
     4e4:	e3a04030 	mov	r4, #48	; 0x30
     4e8:	e1a06005 	mov	r6, r5
     4ec:	eb000d6b 	bl	3aa0 <printf>
     4f0:	e3a02061 	mov	r2, #97	; 0x61
     4f4:	e3a03000 	mov	r3, #0
     4f8:	e5c52000 	strb	r2, [r5]
     4fc:	e5c53002 	strb	r3, [r5, #2]
     500:	e5c54001 	strb	r4, [r5, #1]
     504:	e2844001 	add	r4, r4, #1
     508:	e3001202 	movw	r1, #514	; 0x202
     50c:	e1a00006 	mov	r0, r6
     510:	eb000c7e 	bl	3710 <open>
     514:	e6ef4074 	uxtb	r4, r4
     518:	eb000c55 	bl	3674 <close>
     51c:	e3540064 	cmp	r4, #100	; 0x64
     520:	1afffff6 	bne	500 <createtest+0x40>
     524:	e3096fcc 	movw	r6, #40908	; 0x9fcc
     528:	e3406000 	movt	r6, #0
     52c:	e3a04030 	mov	r4, #48	; 0x30
     530:	e3a02061 	mov	r2, #97	; 0x61
     534:	e3a03000 	mov	r3, #0
     538:	e5c52000 	strb	r2, [r5]
     53c:	e5c53002 	strb	r3, [r5, #2]
     540:	e5c54001 	strb	r4, [r5, #1]
     544:	e2844001 	add	r4, r4, #1
     548:	e1a00006 	mov	r0, r6
     54c:	e6ef4074 	uxtb	r4, r4
     550:	eb000c88 	bl	3778 <unlink>
     554:	e3540064 	cmp	r4, #100	; 0x64
     558:	1afffff8 	bne	540 <createtest+0x80>
     55c:	e5970000 	ldr	r0, [r7]
     560:	e3041070 	movw	r1, #16496	; 0x4070
     564:	e3401000 	movt	r1, #0
     568:	e24bd014 	sub	sp, fp, #20
     56c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
     570:	ea000d4a 	b	3aa0 <printf>

00000574 <dirtest>:
     574:	e92d4830 	push	{r4, r5, fp, lr}
     578:	e3054814 	movw	r4, #22548	; 0x5814
     57c:	e3404000 	movt	r4, #0
     580:	e28db00c 	add	fp, sp, #12
     584:	e3041098 	movw	r1, #16536	; 0x4098
     588:	e3401000 	movt	r1, #0
     58c:	e5940000 	ldr	r0, [r4]
     590:	eb000d42 	bl	3aa0 <printf>
     594:	e30400a4 	movw	r0, #16548	; 0x40a4
     598:	e3400000 	movt	r0, #0
     59c:	eb000c9c 	bl	3814 <mkdir>
     5a0:	e3500000 	cmp	r0, #0
     5a4:	ba000014 	blt	5fc <dirtest+0x88>
     5a8:	e30400a4 	movw	r0, #16548	; 0x40a4
     5ac:	e3400000 	movt	r0, #0
     5b0:	eb000ca4 	bl	3848 <chdir>
     5b4:	e3500000 	cmp	r0, #0
     5b8:	ba00001d 	blt	634 <dirtest+0xc0>
     5bc:	e30400d0 	movw	r0, #16592	; 0x40d0
     5c0:	e3400000 	movt	r0, #0
     5c4:	eb000c9f 	bl	3848 <chdir>
     5c8:	e3500000 	cmp	r0, #0
     5cc:	ba000013 	blt	620 <dirtest+0xac>
     5d0:	e30400a4 	movw	r0, #16548	; 0x40a4
     5d4:	e3400000 	movt	r0, #0
     5d8:	eb000c66 	bl	3778 <unlink>
     5dc:	e3500000 	cmp	r0, #0
     5e0:	e5940000 	ldr	r0, [r4]
     5e4:	ba000009 	blt	610 <dirtest+0x9c>
     5e8:	e3041098 	movw	r1, #16536	; 0x4098
     5ec:	e3401000 	movt	r1, #0
     5f0:	e24bd00c 	sub	sp, fp, #12
     5f4:	e8bd4830 	pop	{r4, r5, fp, lr}
     5f8:	ea000d28 	b	3aa0 <printf>
     5fc:	e5940000 	ldr	r0, [r4]
     600:	e30410ac 	movw	r1, #16556	; 0x40ac
     604:	e3401000 	movt	r1, #0
     608:	eb000d24 	bl	3aa0 <printf>
     60c:	eb000bca 	bl	353c <exit>
     610:	e30410e8 	movw	r1, #16616	; 0x40e8
     614:	e3401000 	movt	r1, #0
     618:	eb000d20 	bl	3aa0 <printf>
     61c:	eb000bc6 	bl	353c <exit>
     620:	e5940000 	ldr	r0, [r4]
     624:	e30410d4 	movw	r1, #16596	; 0x40d4
     628:	e3401000 	movt	r1, #0
     62c:	eb000d1b 	bl	3aa0 <printf>
     630:	eb000bc1 	bl	353c <exit>
     634:	e5940000 	ldr	r0, [r4]
     638:	e30410bc 	movw	r1, #16572	; 0x40bc
     63c:	e3401000 	movt	r1, #0
     640:	eb000d16 	bl	3aa0 <printf>
     644:	eb000bbc 	bl	353c <exit>

00000648 <exectest>:
     648:	e92d4830 	push	{r4, r5, fp, lr}
     64c:	e3054814 	movw	r4, #22548	; 0x5814
     650:	e3404000 	movt	r4, #0
     654:	e28db00c 	add	fp, sp, #12
     658:	e30410fc 	movw	r1, #16636	; 0x40fc
     65c:	e3401000 	movt	r1, #0
     660:	e5940000 	ldr	r0, [r4]
     664:	eb000d0d 	bl	3aa0 <printf>
     668:	e2841004 	add	r1, r4, #4
     66c:	e3030dc4 	movw	r0, #15812	; 0x3dc4
     670:	e3400000 	movt	r0, #0
     674:	eb000c18 	bl	36dc <exec>
     678:	e3500000 	cmp	r0, #0
     67c:	a8bd8830 	popge	{r4, r5, fp, pc}
     680:	e5940000 	ldr	r0, [r4]
     684:	e3041108 	movw	r1, #16648	; 0x4108
     688:	e3401000 	movt	r1, #0
     68c:	eb000d03 	bl	3aa0 <printf>
     690:	eb000ba9 	bl	353c <exit>

00000694 <pipe1>:
     694:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     698:	e28db018 	add	fp, sp, #24
     69c:	e24b0024 	sub	r0, fp, #36	; 0x24
     6a0:	e24dd00c 	sub	sp, sp, #12
     6a4:	eb000bcb 	bl	35d8 <pipe>
     6a8:	e2504000 	subs	r4, r0, #0
     6ac:	1a00004b 	bne	7e0 <pipe1+0x14c>
     6b0:	eb000b94 	bl	3508 <fork>
     6b4:	e2505000 	subs	r5, r0, #0
     6b8:	0a000020 	beq	740 <pipe1+0xac>
     6bc:	da00004c 	ble	7f4 <pipe1+0x160>
     6c0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     6c4:	e3075fcc 	movw	r5, #32716	; 0x7fcc
     6c8:	eb000be9 	bl	3674 <close>
     6cc:	e3405000 	movt	r5, #0
     6d0:	e1a06004 	mov	r6, r4
     6d4:	e3a07001 	mov	r7, #1
     6d8:	e1a02007 	mov	r2, r7
     6dc:	e1a01005 	mov	r1, r5
     6e0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     6e4:	eb000bc8 	bl	360c <read>
     6e8:	e3500000 	cmp	r0, #0
     6ec:	da00002a 	ble	79c <pipe1+0x108>
     6f0:	e59f3124 	ldr	r3, [pc, #292]	; 81c <pipe1+0x188>
     6f4:	e080c004 	add	ip, r0, r4
     6f8:	e5f31001 	ldrb	r1, [r3, #1]!
     6fc:	e6ef2074 	uxtb	r2, r4
     700:	e2844001 	add	r4, r4, #1
     704:	e1510002 	cmp	r1, r2
     708:	1a000006 	bne	728 <pipe1+0x94>
     70c:	e154000c 	cmp	r4, ip
     710:	1afffff8 	bne	6f8 <pipe1+0x64>
     714:	e1a07087 	lsl	r7, r7, #1
     718:	e0866000 	add	r6, r6, r0
     71c:	e3570a02 	cmp	r7, #8192	; 0x2000
     720:	a3a07a02 	movge	r7, #8192	; 0x2000
     724:	eaffffeb 	b	6d8 <pipe1+0x44>
     728:	e304113c 	movw	r1, #16700	; 0x413c
     72c:	e3a00001 	mov	r0, #1
     730:	e3401000 	movt	r1, #0
     734:	eb000cd9 	bl	3aa0 <printf>
     738:	e24bd018 	sub	sp, fp, #24
     73c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
     740:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     744:	e3077fcc 	movw	r7, #32716	; 0x7fcc
     748:	eb000bc9 	bl	3674 <close>
     74c:	e59f40cc 	ldr	r4, [pc, #204]	; 820 <pipe1+0x18c>
     750:	e3407000 	movt	r7, #0
     754:	e3006409 	movw	r6, #1033	; 0x409
     758:	e301842d 	movw	r8, #5165	; 0x142d
     75c:	e59f30b8 	ldr	r3, [pc, #184]	; 81c <pipe1+0x188>
     760:	e1a02005 	mov	r2, r5
     764:	e5e32001 	strb	r2, [r3, #1]!
     768:	e1530004 	cmp	r3, r4
     76c:	e2822001 	add	r2, r2, #1
     770:	1afffffb 	bne	764 <pipe1+0xd0>
     774:	e3002409 	movw	r2, #1033	; 0x409
     778:	e1a01007 	mov	r1, r7
     77c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     780:	e0855006 	add	r5, r5, r6
     784:	eb000bad 	bl	3640 <write>
     788:	e1500006 	cmp	r0, r6
     78c:	1a00001d 	bne	808 <pipe1+0x174>
     790:	e1550008 	cmp	r5, r8
     794:	1afffff0 	bne	75c <pipe1+0xc8>
     798:	eb000b67 	bl	353c <exit>
     79c:	e301342d 	movw	r3, #5165	; 0x142d
     7a0:	e1560003 	cmp	r6, r3
     7a4:	1a000007 	bne	7c8 <pipe1+0x134>
     7a8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     7ac:	eb000bb0 	bl	3674 <close>
     7b0:	eb000b6e 	bl	3570 <wait>
     7b4:	e3041164 	movw	r1, #16740	; 0x4164
     7b8:	e3a00001 	mov	r0, #1
     7bc:	e3401000 	movt	r1, #0
     7c0:	eb000cb6 	bl	3aa0 <printf>
     7c4:	eaffffdb 	b	738 <pipe1+0xa4>
     7c8:	e1a02006 	mov	r2, r6
     7cc:	e304114c 	movw	r1, #16716	; 0x414c
     7d0:	e3a00001 	mov	r0, #1
     7d4:	e3401000 	movt	r1, #0
     7d8:	eb000cb0 	bl	3aa0 <printf>
     7dc:	eaffffed 	b	798 <pipe1+0x104>
     7e0:	e304111c 	movw	r1, #16668	; 0x411c
     7e4:	e3a00001 	mov	r0, #1
     7e8:	e3401000 	movt	r1, #0
     7ec:	eb000cab 	bl	3aa0 <printf>
     7f0:	eb000b51 	bl	353c <exit>
     7f4:	e3041170 	movw	r1, #16752	; 0x4170
     7f8:	e3a00001 	mov	r0, #1
     7fc:	e3401000 	movt	r1, #0
     800:	eb000ca6 	bl	3aa0 <printf>
     804:	eb000b4c 	bl	353c <exit>
     808:	e304112c 	movw	r1, #16684	; 0x412c
     80c:	e3a00001 	mov	r0, #1
     810:	e3401000 	movt	r1, #0
     814:	eb000ca1 	bl	3aa0 <printf>
     818:	eb000b47 	bl	353c <exit>
     81c:	00007fcb 	.word	0x00007fcb
     820:	000083d4 	.word	0x000083d4

00000824 <preempt>:
     824:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     828:	e3a00001 	mov	r0, #1
     82c:	e28db014 	add	fp, sp, #20
     830:	e3041180 	movw	r1, #16768	; 0x4180
     834:	e24dd008 	sub	sp, sp, #8
     838:	e3401000 	movt	r1, #0
     83c:	eb000c97 	bl	3aa0 <printf>
     840:	eb000b30 	bl	3508 <fork>
     844:	e2507000 	subs	r7, r0, #0
     848:	1a000000 	bne	850 <preempt+0x2c>
     84c:	eafffffe 	b	84c <preempt+0x28>
     850:	eb000b2c 	bl	3508 <fork>
     854:	e2506000 	subs	r6, r0, #0
     858:	1a000000 	bne	860 <preempt+0x3c>
     85c:	eafffffe 	b	85c <preempt+0x38>
     860:	e24b001c 	sub	r0, fp, #28
     864:	eb000b5b 	bl	35d8 <pipe>
     868:	eb000b26 	bl	3508 <fork>
     86c:	e2505000 	subs	r5, r0, #0
     870:	1a00000f 	bne	8b4 <preempt+0x90>
     874:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     878:	eb000b7d 	bl	3674 <close>
     87c:	e3041aec 	movw	r1, #19180	; 0x4aec
     880:	e3a02001 	mov	r2, #1
     884:	e3401000 	movt	r1, #0
     888:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     88c:	eb000b6b 	bl	3640 <write>
     890:	e3500001 	cmp	r0, #1
     894:	0a000003 	beq	8a8 <preempt+0x84>
     898:	e304118c 	movw	r1, #16780	; 0x418c
     89c:	e3a00001 	mov	r0, #1
     8a0:	e3401000 	movt	r1, #0
     8a4:	eb000c7d 	bl	3aa0 <printf>
     8a8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8ac:	eb000b70 	bl	3674 <close>
     8b0:	eafffffe 	b	8b0 <preempt+0x8c>
     8b4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8b8:	eb000b6d 	bl	3674 <close>
     8bc:	e3071fcc 	movw	r1, #32716	; 0x7fcc
     8c0:	e3a02a02 	mov	r2, #8192	; 0x2000
     8c4:	e3401000 	movt	r1, #0
     8c8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8cc:	eb000b4e 	bl	360c <read>
     8d0:	e3500001 	cmp	r0, #1
     8d4:	e1a04000 	mov	r4, r0
     8d8:	0a000005 	beq	8f4 <preempt+0xd0>
     8dc:	e30411a0 	movw	r1, #16800	; 0x41a0
     8e0:	e3a00001 	mov	r0, #1
     8e4:	e3401000 	movt	r1, #0
     8e8:	eb000c6c 	bl	3aa0 <printf>
     8ec:	e24bd014 	sub	sp, fp, #20
     8f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     8f4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8f8:	eb000b5d 	bl	3674 <close>
     8fc:	e1a00004 	mov	r0, r4
     900:	e30411b4 	movw	r1, #16820	; 0x41b4
     904:	e3401000 	movt	r1, #0
     908:	eb000c64 	bl	3aa0 <printf>
     90c:	e1a00007 	mov	r0, r7
     910:	eb000b64 	bl	36a8 <kill>
     914:	e1a00006 	mov	r0, r6
     918:	eb000b62 	bl	36a8 <kill>
     91c:	e1a00005 	mov	r0, r5
     920:	eb000b60 	bl	36a8 <kill>
     924:	e1a00004 	mov	r0, r4
     928:	e30411c0 	movw	r1, #16832	; 0x41c0
     92c:	e3401000 	movt	r1, #0
     930:	eb000c5a 	bl	3aa0 <printf>
     934:	eb000b0d 	bl	3570 <wait>
     938:	eb000b0c 	bl	3570 <wait>
     93c:	eb000b0b 	bl	3570 <wait>
     940:	e1a00004 	mov	r0, r4
     944:	e30411cc 	movw	r1, #16844	; 0x41cc
     948:	e3401000 	movt	r1, #0
     94c:	eb000c53 	bl	3aa0 <printf>
     950:	eaffffe5 	b	8ec <preempt+0xc8>

00000954 <exitwait>:
     954:	e92d4830 	push	{r4, r5, fp, lr}
     958:	e3a04064 	mov	r4, #100	; 0x64
     95c:	e28db00c 	add	fp, sp, #12
     960:	ea000005 	b	97c <exitwait+0x28>
     964:	0a000019 	beq	9d0 <exitwait+0x7c>
     968:	eb000b00 	bl	3570 <wait>
     96c:	e1550000 	cmp	r5, r0
     970:	1a00000a 	bne	9a0 <exitwait+0x4c>
     974:	e2544001 	subs	r4, r4, #1
     978:	0a00000e 	beq	9b8 <exitwait+0x64>
     97c:	eb000ae1 	bl	3508 <fork>
     980:	e2505000 	subs	r5, r0, #0
     984:	aafffff6 	bge	964 <exitwait+0x10>
     988:	e3051718 	movw	r1, #22296	; 0x5718
     98c:	e3a00001 	mov	r0, #1
     990:	e3401000 	movt	r1, #0
     994:	e24bd00c 	sub	sp, fp, #12
     998:	e8bd4830 	pop	{r4, r5, fp, lr}
     99c:	ea000c3f 	b	3aa0 <printf>
     9a0:	e30411d8 	movw	r1, #16856	; 0x41d8
     9a4:	e3a00001 	mov	r0, #1
     9a8:	e3401000 	movt	r1, #0
     9ac:	e24bd00c 	sub	sp, fp, #12
     9b0:	e8bd4830 	pop	{r4, r5, fp, lr}
     9b4:	ea000c39 	b	3aa0 <printf>
     9b8:	e30411e8 	movw	r1, #16872	; 0x41e8
     9bc:	e3a00001 	mov	r0, #1
     9c0:	e3401000 	movt	r1, #0
     9c4:	e24bd00c 	sub	sp, fp, #12
     9c8:	e8bd4830 	pop	{r4, r5, fp, lr}
     9cc:	ea000c33 	b	3aa0 <printf>
     9d0:	eb000ad9 	bl	353c <exit>

000009d4 <mem>:
     9d4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     9d8:	e3a00001 	mov	r0, #1
     9dc:	e28db014 	add	fp, sp, #20
     9e0:	e30411f8 	movw	r1, #16888	; 0x41f8
     9e4:	e3401000 	movt	r1, #0
     9e8:	eb000c2c 	bl	3aa0 <printf>
     9ec:	eb000baf 	bl	38b0 <getpid>
     9f0:	e1a06000 	mov	r6, r0
     9f4:	eb000ac3 	bl	3508 <fork>
     9f8:	e2504000 	subs	r4, r0, #0
     9fc:	0a000002 	beq	a0c <mem+0x38>
     a00:	ea000016 	b	a60 <mem+0x8c>
     a04:	e5804000 	str	r4, [r0]
     a08:	e1a04000 	mov	r4, r0
     a0c:	e3020711 	movw	r0, #10001	; 0x2711
     a10:	eb000cb1 	bl	3cdc <malloc>
     a14:	e3500000 	cmp	r0, #0
     a18:	1afffff9 	bne	a04 <mem+0x30>
     a1c:	e3540000 	cmp	r4, #0
     a20:	0a000004 	beq	a38 <mem+0x64>
     a24:	e5945000 	ldr	r5, [r4]
     a28:	e1a00004 	mov	r0, r4
     a2c:	eb000c83 	bl	3c40 <free>
     a30:	e2554000 	subs	r4, r5, #0
     a34:	1afffffa 	bne	a24 <mem+0x50>
     a38:	e3a00a05 	mov	r0, #20480	; 0x5000
     a3c:	eb000ca6 	bl	3cdc <malloc>
     a40:	e3500000 	cmp	r0, #0
     a44:	0a000008 	beq	a6c <mem+0x98>
     a48:	eb000c7c 	bl	3c40 <free>
     a4c:	e3041220 	movw	r1, #16928	; 0x4220
     a50:	e3a00001 	mov	r0, #1
     a54:	e3401000 	movt	r1, #0
     a58:	eb000c10 	bl	3aa0 <printf>
     a5c:	eb000ab6 	bl	353c <exit>
     a60:	e24bd014 	sub	sp, fp, #20
     a64:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
     a68:	ea000ac0 	b	3570 <wait>
     a6c:	e3a00001 	mov	r0, #1
     a70:	e3041204 	movw	r1, #16900	; 0x4204
     a74:	e3401000 	movt	r1, #0
     a78:	eb000c08 	bl	3aa0 <printf>
     a7c:	e1a00006 	mov	r0, r6
     a80:	eb000b08 	bl	36a8 <kill>
     a84:	eb000aac 	bl	353c <exit>

00000a88 <sharedfd>:
     a88:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     a8c:	e3a00001 	mov	r0, #1
     a90:	e28db014 	add	fp, sp, #20
     a94:	e3041228 	movw	r1, #16936	; 0x4228
     a98:	e24dd010 	sub	sp, sp, #16
     a9c:	e3401000 	movt	r1, #0
     aa0:	eb000bfe 	bl	3aa0 <printf>
     aa4:	e3040238 	movw	r0, #16952	; 0x4238
     aa8:	e3400000 	movt	r0, #0
     aac:	eb000b31 	bl	3778 <unlink>
     ab0:	e3040238 	movw	r0, #16952	; 0x4238
     ab4:	e3001202 	movw	r1, #514	; 0x202
     ab8:	e3400000 	movt	r0, #0
     abc:	eb000b13 	bl	3710 <open>
     ac0:	e2505000 	subs	r5, r0, #0
     ac4:	ba000042 	blt	bd4 <sharedfd+0x14c>
     ac8:	eb000a8e 	bl	3508 <fork>
     acc:	e3a0200a 	mov	r2, #10
     ad0:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     ad4:	e3500000 	cmp	r0, #0
     ad8:	e1a06000 	mov	r6, r0
     adc:	e24b0020 	sub	r0, fp, #32
     ae0:	03a01063 	moveq	r1, #99	; 0x63
     ae4:	13a01070 	movne	r1, #112	; 0x70
     ae8:	eb000a1c 	bl	3360 <memset>
     aec:	ea000001 	b	af8 <sharedfd+0x70>
     af0:	e2544001 	subs	r4, r4, #1
     af4:	0a000009 	beq	b20 <sharedfd+0x98>
     af8:	e3a0200a 	mov	r2, #10
     afc:	e24b1020 	sub	r1, fp, #32
     b00:	e1a00005 	mov	r0, r5
     b04:	eb000acd 	bl	3640 <write>
     b08:	e350000a 	cmp	r0, #10
     b0c:	0afffff7 	beq	af0 <sharedfd+0x68>
     b10:	e3041270 	movw	r1, #17008	; 0x4270
     b14:	e3a00001 	mov	r0, #1
     b18:	e3401000 	movt	r1, #0
     b1c:	eb000bdf 	bl	3aa0 <printf>
     b20:	e3560000 	cmp	r6, #0
     b24:	0a00003c 	beq	c1c <sharedfd+0x194>
     b28:	eb000a90 	bl	3570 <wait>
     b2c:	e1a00005 	mov	r0, r5
     b30:	eb000acf 	bl	3674 <close>
     b34:	e3040238 	movw	r0, #16952	; 0x4238
     b38:	e3a01000 	mov	r1, #0
     b3c:	e3400000 	movt	r0, #0
     b40:	eb000af2 	bl	3710 <open>
     b44:	e2507000 	subs	r7, r0, #0
     b48:	a24b4016 	subge	r4, fp, #22
     b4c:	a3a05000 	movge	r5, #0
     b50:	a1a06005 	movge	r6, r5
     b54:	ba000024 	blt	bec <sharedfd+0x164>
     b58:	e3a0200a 	mov	r2, #10
     b5c:	e24b1020 	sub	r1, fp, #32
     b60:	e1a00007 	mov	r0, r7
     b64:	eb000aa8 	bl	360c <read>
     b68:	e3500000 	cmp	r0, #0
     b6c:	da000009 	ble	b98 <sharedfd+0x110>
     b70:	e24b2020 	sub	r2, fp, #32
     b74:	e4d21001 	ldrb	r1, [r2], #1
     b78:	e3510063 	cmp	r1, #99	; 0x63
     b7c:	02866001 	addeq	r6, r6, #1
     b80:	0a000001 	beq	b8c <sharedfd+0x104>
     b84:	e3510070 	cmp	r1, #112	; 0x70
     b88:	02855001 	addeq	r5, r5, #1
     b8c:	e1540002 	cmp	r4, r2
     b90:	1afffff7 	bne	b74 <sharedfd+0xec>
     b94:	eaffffef 	b	b58 <sharedfd+0xd0>
     b98:	e1a00007 	mov	r0, r7
     b9c:	eb000ab4 	bl	3674 <close>
     ba0:	e3040238 	movw	r0, #16952	; 0x4238
     ba4:	e3400000 	movt	r0, #0
     ba8:	eb000af2 	bl	3778 <unlink>
     bac:	e3023710 	movw	r3, #10000	; 0x2710
     bb0:	e1560003 	cmp	r6, r3
     bb4:	01550003 	cmpeq	r5, r3
     bb8:	1a000011 	bne	c04 <sharedfd+0x17c>
     bbc:	e3a00001 	mov	r0, #1
     bc0:	e30412bc 	movw	r1, #17084	; 0x42bc
     bc4:	e3401000 	movt	r1, #0
     bc8:	eb000bb4 	bl	3aa0 <printf>
     bcc:	e24bd014 	sub	sp, fp, #20
     bd0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     bd4:	e3a00001 	mov	r0, #1
     bd8:	e3041244 	movw	r1, #16964	; 0x4244
     bdc:	e3401000 	movt	r1, #0
     be0:	eb000bae 	bl	3aa0 <printf>
     be4:	e24bd014 	sub	sp, fp, #20
     be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     bec:	e3a00001 	mov	r0, #1
     bf0:	e3041290 	movw	r1, #17040	; 0x4290
     bf4:	e3401000 	movt	r1, #0
     bf8:	eb000ba8 	bl	3aa0 <printf>
     bfc:	e24bd014 	sub	sp, fp, #20
     c00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     c04:	e30412cc 	movw	r1, #17100	; 0x42cc
     c08:	e1a03005 	mov	r3, r5
     c0c:	e1a02006 	mov	r2, r6
     c10:	e3a00001 	mov	r0, #1
     c14:	e3401000 	movt	r1, #0
     c18:	eb000ba0 	bl	3aa0 <printf>
     c1c:	eb000a46 	bl	353c <exit>

00000c20 <twofiles>:
     c20:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     c24:	e3a00001 	mov	r0, #1
     c28:	e28db024 	add	fp, sp, #36	; 0x24
     c2c:	e30412e8 	movw	r1, #17128	; 0x42e8
     c30:	e3401000 	movt	r1, #0
     c34:	eb000b99 	bl	3aa0 <printf>
     c38:	e30402f8 	movw	r0, #17144	; 0x42f8
     c3c:	e3400000 	movt	r0, #0
     c40:	eb000acc 	bl	3778 <unlink>
     c44:	e30402e4 	movw	r0, #17124	; 0x42e4
     c48:	e3400000 	movt	r0, #0
     c4c:	eb000ac9 	bl	3778 <unlink>
     c50:	eb000a2c 	bl	3508 <fork>
     c54:	e2507000 	subs	r7, r0, #0
     c58:	ba000061 	blt	de4 <twofiles+0x1c4>
     c5c:	0a00004d 	beq	d98 <twofiles+0x178>
     c60:	e30402f8 	movw	r0, #17144	; 0x42f8
     c64:	e3001202 	movw	r1, #514	; 0x202
     c68:	e3400000 	movt	r0, #0
     c6c:	eb000aa7 	bl	3710 <open>
     c70:	e2504000 	subs	r4, r0, #0
     c74:	ba00005f 	blt	df8 <twofiles+0x1d8>
     c78:	e3a01070 	mov	r1, #112	; 0x70
     c7c:	e3070fcc 	movw	r0, #32716	; 0x7fcc
     c80:	e3a02c02 	mov	r2, #512	; 0x200
     c84:	e3400000 	movt	r0, #0
     c88:	e3076fcc 	movw	r6, #32716	; 0x7fcc
     c8c:	eb0009b3 	bl	3360 <memset>
     c90:	e3406000 	movt	r6, #0
     c94:	e3a0500c 	mov	r5, #12
     c98:	e3a02f7d 	mov	r2, #500	; 0x1f4
     c9c:	e1a01006 	mov	r1, r6
     ca0:	e1a00004 	mov	r0, r4
     ca4:	eb000a65 	bl	3640 <write>
     ca8:	e3500f7d 	cmp	r0, #500	; 0x1f4
     cac:	1a000046 	bne	dcc <twofiles+0x1ac>
     cb0:	e2555001 	subs	r5, r5, #1
     cb4:	1afffff7 	bne	c98 <twofiles+0x78>
     cb8:	e1a00004 	mov	r0, r4
     cbc:	eb000a6c 	bl	3674 <close>
     cc0:	e3570000 	cmp	r7, #0
     cc4:	0a00003f 	beq	dc8 <twofiles+0x1a8>
     cc8:	e3077fcc 	movw	r7, #32716	; 0x7fcc
     ccc:	e3407000 	movt	r7, #0
     cd0:	eb000a26 	bl	3570 <wait>
     cd4:	e30492f8 	movw	r9, #17144	; 0x42f8
     cd8:	e30402e4 	movw	r0, #17124	; 0x42e4
     cdc:	e3409000 	movt	r9, #0
     ce0:	e3400000 	movt	r0, #0
     ce4:	e1a08007 	mov	r8, r7
     ce8:	e3a01000 	mov	r1, #0
     cec:	e3a04000 	mov	r4, #0
     cf0:	eb000a86 	bl	3710 <open>
     cf4:	e3550000 	cmp	r5, #0
     cf8:	13a0a070 	movne	sl, #112	; 0x70
     cfc:	03a0a063 	moveq	sl, #99	; 0x63
     d00:	e1a06000 	mov	r6, r0
     d04:	e3a02a02 	mov	r2, #8192	; 0x2000
     d08:	e1a01008 	mov	r1, r8
     d0c:	e1a00006 	mov	r0, r6
     d10:	eb000a3d 	bl	360c <read>
     d14:	e3500000 	cmp	r0, #0
     d18:	da000009 	ble	d44 <twofiles+0x124>
     d1c:	e2401001 	sub	r1, r0, #1
     d20:	e59f30fc 	ldr	r3, [pc, #252]	; e24 <twofiles+0x204>
     d24:	e0871001 	add	r1, r7, r1
     d28:	e5f32001 	ldrb	r2, [r3, #1]!
     d2c:	e15a0002 	cmp	sl, r2
     d30:	1a000020 	bne	db8 <twofiles+0x198>
     d34:	e1530001 	cmp	r3, r1
     d38:	1afffffa 	bne	d28 <twofiles+0x108>
     d3c:	e0844000 	add	r4, r4, r0
     d40:	eaffffef 	b	d04 <twofiles+0xe4>
     d44:	e1a00006 	mov	r0, r6
     d48:	eb000a49 	bl	3674 <close>
     d4c:	e3013770 	movw	r3, #6000	; 0x1770
     d50:	e1540003 	cmp	r4, r3
     d54:	1a00002c 	bne	e0c <twofiles+0x1ec>
     d58:	e2855001 	add	r5, r5, #1
     d5c:	e1a00009 	mov	r0, r9
     d60:	e3550002 	cmp	r5, #2
     d64:	1affffdf 	bne	ce8 <twofiles+0xc8>
     d68:	e30402f8 	movw	r0, #17144	; 0x42f8
     d6c:	e3400000 	movt	r0, #0
     d70:	eb000a80 	bl	3778 <unlink>
     d74:	e30402e4 	movw	r0, #17124	; 0x42e4
     d78:	e3400000 	movt	r0, #0
     d7c:	eb000a7d 	bl	3778 <unlink>
     d80:	e3041340 	movw	r1, #17216	; 0x4340
     d84:	e3a00001 	mov	r0, #1
     d88:	e3401000 	movt	r1, #0
     d8c:	e24bd024 	sub	sp, fp, #36	; 0x24
     d90:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     d94:	ea000b41 	b	3aa0 <printf>
     d98:	e30402e4 	movw	r0, #17124	; 0x42e4
     d9c:	e3001202 	movw	r1, #514	; 0x202
     da0:	e3400000 	movt	r0, #0
     da4:	eb000a59 	bl	3710 <open>
     da8:	e2504000 	subs	r4, r0, #0
     dac:	ba000011 	blt	df8 <twofiles+0x1d8>
     db0:	e3a01063 	mov	r1, #99	; 0x63
     db4:	eaffffb0 	b	c7c <twofiles+0x5c>
     db8:	e3041320 	movw	r1, #17184	; 0x4320
     dbc:	e3a00001 	mov	r0, #1
     dc0:	e3401000 	movt	r1, #0
     dc4:	eb000b35 	bl	3aa0 <printf>
     dc8:	eb0009db 	bl	353c <exit>
     dcc:	e1a02000 	mov	r2, r0
     dd0:	e304130c 	movw	r1, #17164	; 0x430c
     dd4:	e3a00001 	mov	r0, #1
     dd8:	e3401000 	movt	r1, #0
     ddc:	eb000b2f 	bl	3aa0 <printf>
     de0:	eb0009d5 	bl	353c <exit>
     de4:	e3051718 	movw	r1, #22296	; 0x5718
     de8:	e3a00001 	mov	r0, #1
     dec:	e3401000 	movt	r1, #0
     df0:	eb000b2a 	bl	3aa0 <printf>
     df4:	eb0009d0 	bl	353c <exit>
     df8:	e30412fc 	movw	r1, #17148	; 0x42fc
     dfc:	e3a00001 	mov	r0, #1
     e00:	e3401000 	movt	r1, #0
     e04:	eb000b25 	bl	3aa0 <printf>
     e08:	eb0009cb 	bl	353c <exit>
     e0c:	e1a02004 	mov	r2, r4
     e10:	e304132c 	movw	r1, #17196	; 0x432c
     e14:	e3a00001 	mov	r0, #1
     e18:	e3401000 	movt	r1, #0
     e1c:	eb000b1f 	bl	3aa0 <printf>
     e20:	eb0009c5 	bl	353c <exit>
     e24:	00007fcb 	.word	0x00007fcb

00000e28 <createdelete>:
     e28:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     e2c:	e3a00001 	mov	r0, #1
     e30:	e28db018 	add	fp, sp, #24
     e34:	e3041350 	movw	r1, #17232	; 0x4350
     e38:	e24dd024 	sub	sp, sp, #36	; 0x24
     e3c:	e3401000 	movt	r1, #0
     e40:	eb000b16 	bl	3aa0 <printf>
     e44:	eb0009af 	bl	3508 <fork>
     e48:	e2506000 	subs	r6, r0, #0
     e4c:	ba000069 	blt	ff8 <createdelete+0x1d0>
     e50:	03a03063 	moveq	r3, #99	; 0x63
     e54:	13a03070 	movne	r3, #112	; 0x70
     e58:	e3a04000 	mov	r4, #0
     e5c:	e54b303c 	strb	r3, [fp, #-60]	; 0xffffffc4
     e60:	e54b403a 	strb	r4, [fp, #-58]	; 0xffffffc6
     e64:	e3a05001 	mov	r5, #1
     e68:	ea000003 	b	e7c <createdelete+0x54>
     e6c:	e3550014 	cmp	r5, #20
     e70:	0a000019 	beq	edc <createdelete+0xb4>
     e74:	e2844001 	add	r4, r4, #1
     e78:	e2855001 	add	r5, r5, #1
     e7c:	e3001202 	movw	r1, #514	; 0x202
     e80:	e24b003c 	sub	r0, fp, #60	; 0x3c
     e84:	e2843030 	add	r3, r4, #48	; 0x30
     e88:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
     e8c:	eb000a1f 	bl	3710 <open>
     e90:	e3500000 	cmp	r0, #0
     e94:	ba00004c 	blt	fcc <createdelete+0x1a4>
     e98:	eb0009f5 	bl	3674 <close>
     e9c:	e3540000 	cmp	r4, #0
     ea0:	0afffff3 	beq	e74 <createdelete+0x4c>
     ea4:	e3140001 	tst	r4, #1
     ea8:	1affffef 	bne	e6c <createdelete+0x44>
     eac:	e1a030c4 	asr	r3, r4, #1
     eb0:	e24b003c 	sub	r0, fp, #60	; 0x3c
     eb4:	e2833030 	add	r3, r3, #48	; 0x30
     eb8:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
     ebc:	eb000a2d 	bl	3778 <unlink>
     ec0:	e3500000 	cmp	r0, #0
     ec4:	aaffffe8 	bge	e6c <createdelete+0x44>
     ec8:	e3041364 	movw	r1, #17252	; 0x4364
     ecc:	e3a00001 	mov	r0, #1
     ed0:	e3401000 	movt	r1, #0
     ed4:	eb000af1 	bl	3aa0 <printf>
     ed8:	eb000997 	bl	353c <exit>
     edc:	e3560000 	cmp	r6, #0
     ee0:	0a000043 	beq	ff4 <createdelete+0x1cc>
     ee4:	eb0009a1 	bl	3570 <wait>
     ee8:	e3a04000 	mov	r4, #0
     eec:	e3a07070 	mov	r7, #112	; 0x70
     ef0:	e3a06063 	mov	r6, #99	; 0x63
     ef4:	e2845030 	add	r5, r4, #48	; 0x30
     ef8:	e3a01000 	mov	r1, #0
     efc:	e24b003c 	sub	r0, fp, #60	; 0x3c
     f00:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
     f04:	e6ef5075 	uxtb	r5, r5
     f08:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
     f0c:	eb0009ff 	bl	3710 <open>
     f10:	e3540009 	cmp	r4, #9
     f14:	d3a08000 	movle	r8, #0
     f18:	c3a08001 	movgt	r8, #1
     f1c:	e3540000 	cmp	r4, #0
     f20:	03888001 	orreq	r8, r8, #1
     f24:	e0181fa0 	ands	r1, r8, r0, lsr #31
     f28:	1a00002c 	bne	fe0 <createdelete+0x1b8>
     f2c:	e2442001 	sub	r2, r4, #1
     f30:	e3520008 	cmp	r2, #8
     f34:	9a000034 	bls	100c <createdelete+0x1e4>
     f38:	e3500000 	cmp	r0, #0
     f3c:	ba000000 	blt	f44 <createdelete+0x11c>
     f40:	eb0009cb 	bl	3674 <close>
     f44:	e3a01000 	mov	r1, #0
     f48:	e24b003c 	sub	r0, fp, #60	; 0x3c
     f4c:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
     f50:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
     f54:	eb0009ed 	bl	3710 <open>
     f58:	e0182fa0 	ands	r2, r8, r0, lsr #31
     f5c:	e1a03000 	mov	r3, r0
     f60:	1a00001e 	bne	fe0 <createdelete+0x1b8>
     f64:	e3530000 	cmp	r3, #0
     f68:	ba000000 	blt	f70 <createdelete+0x148>
     f6c:	eb0009c0 	bl	3674 <close>
     f70:	e2844001 	add	r4, r4, #1
     f74:	e3540014 	cmp	r4, #20
     f78:	1affffdd 	bne	ef4 <createdelete+0xcc>
     f7c:	e3a04030 	mov	r4, #48	; 0x30
     f80:	e3a06070 	mov	r6, #112	; 0x70
     f84:	e3a05063 	mov	r5, #99	; 0x63
     f88:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
     f8c:	e2844001 	add	r4, r4, #1
     f90:	e24b003c 	sub	r0, fp, #60	; 0x3c
     f94:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
     f98:	e6ef4074 	uxtb	r4, r4
     f9c:	eb0009f5 	bl	3778 <unlink>
     fa0:	e24b003c 	sub	r0, fp, #60	; 0x3c
     fa4:	e54b503c 	strb	r5, [fp, #-60]	; 0xffffffc4
     fa8:	eb0009f2 	bl	3778 <unlink>
     fac:	e3540044 	cmp	r4, #68	; 0x44
     fb0:	1afffff4 	bne	f88 <createdelete+0x160>
     fb4:	e3a00001 	mov	r0, #1
     fb8:	e30413b8 	movw	r1, #17336	; 0x43b8
     fbc:	e3401000 	movt	r1, #0
     fc0:	eb000ab6 	bl	3aa0 <printf>
     fc4:	e24bd018 	sub	sp, fp, #24
     fc8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
     fcc:	e30412fc 	movw	r1, #17148	; 0x42fc
     fd0:	e3a00001 	mov	r0, #1
     fd4:	e3401000 	movt	r1, #0
     fd8:	eb000ab0 	bl	3aa0 <printf>
     fdc:	eb000956 	bl	353c <exit>
     fe0:	e3041374 	movw	r1, #17268	; 0x4374
     fe4:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fe8:	e3a00001 	mov	r0, #1
     fec:	e3401000 	movt	r1, #0
     ff0:	eb000aaa 	bl	3aa0 <printf>
     ff4:	eb000950 	bl	353c <exit>
     ff8:	e3051718 	movw	r1, #22296	; 0x5718
     ffc:	e3a00001 	mov	r0, #1
    1000:	e3401000 	movt	r1, #0
    1004:	eb000aa5 	bl	3aa0 <printf>
    1008:	eb00094b 	bl	353c <exit>
    100c:	e3500000 	cmp	r0, #0
    1010:	aa000007 	bge	1034 <createdelete+0x20c>
    1014:	e24b003c 	sub	r0, fp, #60	; 0x3c
    1018:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    101c:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    1020:	eb0009ba 	bl	3710 <open>
    1024:	e0183fa0 	ands	r3, r8, r0, lsr #31
    1028:	1affffec 	bne	fe0 <createdelete+0x1b8>
    102c:	e3500000 	cmp	r0, #0
    1030:	baffffce 	blt	f70 <createdelete+0x148>
    1034:	e24b203c 	sub	r2, fp, #60	; 0x3c
    1038:	e3041398 	movw	r1, #17304	; 0x4398
    103c:	e3a00001 	mov	r0, #1
    1040:	e3401000 	movt	r1, #0
    1044:	eb000a95 	bl	3aa0 <printf>
    1048:	eb00093b 	bl	353c <exit>

0000104c <unlinkread>:
    104c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1050:	e3a00001 	mov	r0, #1
    1054:	e28db014 	add	fp, sp, #20
    1058:	e30413cc 	movw	r1, #17356	; 0x43cc
    105c:	e3401000 	movt	r1, #0
    1060:	eb000a8e 	bl	3aa0 <printf>
    1064:	e30403e0 	movw	r0, #17376	; 0x43e0
    1068:	e3001202 	movw	r1, #514	; 0x202
    106c:	e3400000 	movt	r0, #0
    1070:	eb0009a6 	bl	3710 <open>
    1074:	e2504000 	subs	r4, r0, #0
    1078:	ba000037 	blt	115c <unlinkread+0x110>
    107c:	e3a02005 	mov	r2, #5
    1080:	e3041408 	movw	r1, #17416	; 0x4408
    1084:	e3401000 	movt	r1, #0
    1088:	eb00096c 	bl	3640 <write>
    108c:	e1a00004 	mov	r0, r4
    1090:	eb000977 	bl	3674 <close>
    1094:	e30403e0 	movw	r0, #17376	; 0x43e0
    1098:	e3a01002 	mov	r1, #2
    109c:	e3400000 	movt	r0, #0
    10a0:	eb00099a 	bl	3710 <open>
    10a4:	e2505000 	subs	r5, r0, #0
    10a8:	ba000044 	blt	11c0 <unlinkread+0x174>
    10ac:	e30403e0 	movw	r0, #17376	; 0x43e0
    10b0:	e3400000 	movt	r0, #0
    10b4:	eb0009af 	bl	3778 <unlink>
    10b8:	e3500000 	cmp	r0, #0
    10bc:	1a00003a 	bne	11ac <unlinkread+0x160>
    10c0:	e3001202 	movw	r1, #514	; 0x202
    10c4:	e30403e0 	movw	r0, #17376	; 0x43e0
    10c8:	e3400000 	movt	r0, #0
    10cc:	e3074fcc 	movw	r4, #32716	; 0x7fcc
    10d0:	eb00098e 	bl	3710 <open>
    10d4:	e3404000 	movt	r4, #0
    10d8:	e3a02003 	mov	r2, #3
    10dc:	e3041444 	movw	r1, #17476	; 0x4444
    10e0:	e3401000 	movt	r1, #0
    10e4:	e1a06000 	mov	r6, r0
    10e8:	eb000954 	bl	3640 <write>
    10ec:	e1a00006 	mov	r0, r6
    10f0:	eb00095f 	bl	3674 <close>
    10f4:	e1a01004 	mov	r1, r4
    10f8:	e3a02a02 	mov	r2, #8192	; 0x2000
    10fc:	e1a00005 	mov	r0, r5
    1100:	eb000941 	bl	360c <read>
    1104:	e3500005 	cmp	r0, #5
    1108:	1a000022 	bne	1198 <unlinkread+0x14c>
    110c:	e5d43000 	ldrb	r3, [r4]
    1110:	e3530068 	cmp	r3, #104	; 0x68
    1114:	1a00001a 	bne	1184 <unlinkread+0x138>
    1118:	e1a01004 	mov	r1, r4
    111c:	e3a0200a 	mov	r2, #10
    1120:	e1a00005 	mov	r0, r5
    1124:	eb000945 	bl	3640 <write>
    1128:	e350000a 	cmp	r0, #10
    112c:	1a00000f 	bne	1170 <unlinkread+0x124>
    1130:	e1a00005 	mov	r0, r5
    1134:	eb00094e 	bl	3674 <close>
    1138:	e30403e0 	movw	r0, #17376	; 0x43e0
    113c:	e3400000 	movt	r0, #0
    1140:	eb00098c 	bl	3778 <unlink>
    1144:	e3041494 	movw	r1, #17556	; 0x4494
    1148:	e3a00001 	mov	r0, #1
    114c:	e3401000 	movt	r1, #0
    1150:	e24bd014 	sub	sp, fp, #20
    1154:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    1158:	ea000a50 	b	3aa0 <printf>
    115c:	e30413ec 	movw	r1, #17388	; 0x43ec
    1160:	e3a00001 	mov	r0, #1
    1164:	e3401000 	movt	r1, #0
    1168:	eb000a4c 	bl	3aa0 <printf>
    116c:	eb0008f2 	bl	353c <exit>
    1170:	e3041478 	movw	r1, #17528	; 0x4478
    1174:	e3a00001 	mov	r0, #1
    1178:	e3401000 	movt	r1, #0
    117c:	eb000a47 	bl	3aa0 <printf>
    1180:	eb0008ed 	bl	353c <exit>
    1184:	e3041460 	movw	r1, #17504	; 0x4460
    1188:	e3a00001 	mov	r0, #1
    118c:	e3401000 	movt	r1, #0
    1190:	eb000a42 	bl	3aa0 <printf>
    1194:	eb0008e8 	bl	353c <exit>
    1198:	e3041448 	movw	r1, #17480	; 0x4448
    119c:	e3a00001 	mov	r0, #1
    11a0:	e3401000 	movt	r1, #0
    11a4:	eb000a3d 	bl	3aa0 <printf>
    11a8:	eb0008e3 	bl	353c <exit>
    11ac:	e3041428 	movw	r1, #17448	; 0x4428
    11b0:	e3a00001 	mov	r0, #1
    11b4:	e3401000 	movt	r1, #0
    11b8:	eb000a38 	bl	3aa0 <printf>
    11bc:	eb0008de 	bl	353c <exit>
    11c0:	e3041410 	movw	r1, #17424	; 0x4410
    11c4:	e3a00001 	mov	r0, #1
    11c8:	e3401000 	movt	r1, #0
    11cc:	eb000a33 	bl	3aa0 <printf>
    11d0:	eb0008d9 	bl	353c <exit>

000011d4 <linktest>:
    11d4:	e92d4830 	push	{r4, r5, fp, lr}
    11d8:	e3a00001 	mov	r0, #1
    11dc:	e28db00c 	add	fp, sp, #12
    11e0:	e30414a4 	movw	r1, #17572	; 0x44a4
    11e4:	e3401000 	movt	r1, #0
    11e8:	eb000a2c 	bl	3aa0 <printf>
    11ec:	e30404b0 	movw	r0, #17584	; 0x44b0
    11f0:	e3400000 	movt	r0, #0
    11f4:	eb00095f 	bl	3778 <unlink>
    11f8:	e30404b4 	movw	r0, #17588	; 0x44b4
    11fc:	e3400000 	movt	r0, #0
    1200:	eb00095c 	bl	3778 <unlink>
    1204:	e30404b0 	movw	r0, #17584	; 0x44b0
    1208:	e3001202 	movw	r1, #514	; 0x202
    120c:	e3400000 	movt	r0, #0
    1210:	eb00093e 	bl	3710 <open>
    1214:	e2504000 	subs	r4, r0, #0
    1218:	ba000042 	blt	1328 <linktest+0x154>
    121c:	e3041408 	movw	r1, #17416	; 0x4408
    1220:	e3a02005 	mov	r2, #5
    1224:	e3401000 	movt	r1, #0
    1228:	eb000904 	bl	3640 <write>
    122c:	e3500005 	cmp	r0, #5
    1230:	1a000064 	bne	13c8 <linktest+0x1f4>
    1234:	e1a00004 	mov	r0, r4
    1238:	eb00090d 	bl	3674 <close>
    123c:	e30414b4 	movw	r1, #17588	; 0x44b4
    1240:	e30404b0 	movw	r0, #17584	; 0x44b0
    1244:	e3401000 	movt	r1, #0
    1248:	e3400000 	movt	r0, #0
    124c:	eb000963 	bl	37e0 <link>
    1250:	e3500000 	cmp	r0, #0
    1254:	ba000056 	blt	13b4 <linktest+0x1e0>
    1258:	e30404b0 	movw	r0, #17584	; 0x44b0
    125c:	e3400000 	movt	r0, #0
    1260:	eb000944 	bl	3778 <unlink>
    1264:	e30404b0 	movw	r0, #17584	; 0x44b0
    1268:	e3a01000 	mov	r1, #0
    126c:	e3400000 	movt	r0, #0
    1270:	eb000926 	bl	3710 <open>
    1274:	e3500000 	cmp	r0, #0
    1278:	aa000048 	bge	13a0 <linktest+0x1cc>
    127c:	e30404b4 	movw	r0, #17588	; 0x44b4
    1280:	e3a01000 	mov	r1, #0
    1284:	e3400000 	movt	r0, #0
    1288:	eb000920 	bl	3710 <open>
    128c:	e2504000 	subs	r4, r0, #0
    1290:	ba00003d 	blt	138c <linktest+0x1b8>
    1294:	e3071fcc 	movw	r1, #32716	; 0x7fcc
    1298:	e3a02a02 	mov	r2, #8192	; 0x2000
    129c:	e3401000 	movt	r1, #0
    12a0:	eb0008d9 	bl	360c <read>
    12a4:	e3500005 	cmp	r0, #5
    12a8:	1a000032 	bne	1378 <linktest+0x1a4>
    12ac:	e1a00004 	mov	r0, r4
    12b0:	eb0008ef 	bl	3674 <close>
    12b4:	e30414b4 	movw	r1, #17588	; 0x44b4
    12b8:	e3401000 	movt	r1, #0
    12bc:	e1a00001 	mov	r0, r1
    12c0:	eb000946 	bl	37e0 <link>
    12c4:	e3500000 	cmp	r0, #0
    12c8:	aa000025 	bge	1364 <linktest+0x190>
    12cc:	e30404b4 	movw	r0, #17588	; 0x44b4
    12d0:	e3400000 	movt	r0, #0
    12d4:	eb000927 	bl	3778 <unlink>
    12d8:	e30414b0 	movw	r1, #17584	; 0x44b0
    12dc:	e30404b4 	movw	r0, #17588	; 0x44b4
    12e0:	e3401000 	movt	r1, #0
    12e4:	e3400000 	movt	r0, #0
    12e8:	eb00093c 	bl	37e0 <link>
    12ec:	e3500000 	cmp	r0, #0
    12f0:	aa000016 	bge	1350 <linktest+0x17c>
    12f4:	e30414b0 	movw	r1, #17584	; 0x44b0
    12f8:	e304058c 	movw	r0, #17804	; 0x458c
    12fc:	e3401000 	movt	r1, #0
    1300:	e3400000 	movt	r0, #0
    1304:	eb000935 	bl	37e0 <link>
    1308:	e3500000 	cmp	r0, #0
    130c:	aa00000a 	bge	133c <linktest+0x168>
    1310:	e30415ac 	movw	r1, #17836	; 0x45ac
    1314:	e3a00001 	mov	r0, #1
    1318:	e3401000 	movt	r1, #0
    131c:	e24bd00c 	sub	sp, fp, #12
    1320:	e8bd4830 	pop	{r4, r5, fp, lr}
    1324:	ea0009dd 	b	3aa0 <printf>
    1328:	e30414b8 	movw	r1, #17592	; 0x44b8
    132c:	e3a00001 	mov	r0, #1
    1330:	e3401000 	movt	r1, #0
    1334:	eb0009d9 	bl	3aa0 <printf>
    1338:	eb00087f 	bl	353c <exit>
    133c:	e3041590 	movw	r1, #17808	; 0x4590
    1340:	e3a00001 	mov	r0, #1
    1344:	e3401000 	movt	r1, #0
    1348:	eb0009d4 	bl	3aa0 <printf>
    134c:	eb00087a 	bl	353c <exit>
    1350:	e3041568 	movw	r1, #17768	; 0x4568
    1354:	e3a00001 	mov	r0, #1
    1358:	e3401000 	movt	r1, #0
    135c:	eb0009cf 	bl	3aa0 <printf>
    1360:	eb000875 	bl	353c <exit>
    1364:	e3041548 	movw	r1, #17736	; 0x4548
    1368:	e3a00001 	mov	r0, #1
    136c:	e3401000 	movt	r1, #0
    1370:	eb0009ca 	bl	3aa0 <printf>
    1374:	eb000870 	bl	353c <exit>
    1378:	e3041534 	movw	r1, #17716	; 0x4534
    137c:	e3a00001 	mov	r0, #1
    1380:	e3401000 	movt	r1, #0
    1384:	eb0009c5 	bl	3aa0 <printf>
    1388:	eb00086b 	bl	353c <exit>
    138c:	e3041520 	movw	r1, #17696	; 0x4520
    1390:	e3a00001 	mov	r0, #1
    1394:	e3401000 	movt	r1, #0
    1398:	eb0009c0 	bl	3aa0 <printf>
    139c:	eb000866 	bl	353c <exit>
    13a0:	e30414f8 	movw	r1, #17656	; 0x44f8
    13a4:	e3a00001 	mov	r0, #1
    13a8:	e3401000 	movt	r1, #0
    13ac:	eb0009bb 	bl	3aa0 <printf>
    13b0:	eb000861 	bl	353c <exit>
    13b4:	e30414e0 	movw	r1, #17632	; 0x44e0
    13b8:	e3a00001 	mov	r0, #1
    13bc:	e3401000 	movt	r1, #0
    13c0:	eb0009b6 	bl	3aa0 <printf>
    13c4:	eb00085c 	bl	353c <exit>
    13c8:	e30414cc 	movw	r1, #17612	; 0x44cc
    13cc:	e3a00001 	mov	r0, #1
    13d0:	e3401000 	movt	r1, #0
    13d4:	eb0009b1 	bl	3aa0 <printf>
    13d8:	eb000857 	bl	353c <exit>

000013dc <concreate>:
    13dc:	e92d4870 	push	{r4, r5, r6, fp, lr}
    13e0:	e30415bc 	movw	r1, #17852	; 0x45bc
    13e4:	e28db010 	add	fp, sp, #16
    13e8:	e3a00001 	mov	r0, #1
    13ec:	e24dd044 	sub	sp, sp, #68	; 0x44
    13f0:	e3401000 	movt	r1, #0
    13f4:	e3055556 	movw	r5, #21846	; 0x5556
    13f8:	eb0009a8 	bl	3aa0 <printf>
    13fc:	e3a03000 	mov	r3, #0
    1400:	e30465cc 	movw	r6, #17868	; 0x45cc
    1404:	e1a04003 	mov	r4, r3
    1408:	e54b304e 	strb	r3, [fp, #-78]	; 0xffffffb2
    140c:	e3455555 	movt	r5, #21845	; 0x5555
    1410:	e3a03043 	mov	r3, #67	; 0x43
    1414:	e3406000 	movt	r6, #0
    1418:	e54b3050 	strb	r3, [fp, #-80]	; 0xffffffb0
    141c:	ea00000f 	b	1460 <concreate+0x84>
    1420:	e0c32594 	smull	r2, r3, r4, r5
    1424:	e0433fc4 	sub	r3, r3, r4, asr #31
    1428:	e0833083 	add	r3, r3, r3, lsl #1
    142c:	e0443003 	sub	r3, r4, r3
    1430:	e3530001 	cmp	r3, #1
    1434:	0a000029 	beq	14e0 <concreate+0x104>
    1438:	e3001202 	movw	r1, #514	; 0x202
    143c:	e24b0050 	sub	r0, fp, #80	; 0x50
    1440:	eb0008b2 	bl	3710 <open>
    1444:	e3500000 	cmp	r0, #0
    1448:	ba000019 	blt	14b4 <concreate+0xd8>
    144c:	e2844001 	add	r4, r4, #1
    1450:	eb000887 	bl	3674 <close>
    1454:	eb000845 	bl	3570 <wait>
    1458:	e3540028 	cmp	r4, #40	; 0x28
    145c:	0a000026 	beq	14fc <concreate+0x120>
    1460:	e24b0050 	sub	r0, fp, #80	; 0x50
    1464:	e2843030 	add	r3, r4, #48	; 0x30
    1468:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    146c:	eb0008c1 	bl	3778 <unlink>
    1470:	eb000824 	bl	3508 <fork>
    1474:	e3500000 	cmp	r0, #0
    1478:	1affffe8 	bne	1420 <concreate+0x44>
    147c:	e3060667 	movw	r0, #26215	; 0x6667
    1480:	e3460666 	movt	r0, #26214	; 0x6666
    1484:	e1a02fc4 	asr	r2, r4, #31
    1488:	e0c10094 	smull	r0, r1, r4, r0
    148c:	e06220c1 	rsb	r2, r2, r1, asr #1
    1490:	e0822102 	add	r2, r2, r2, lsl #2
    1494:	e0444002 	sub	r4, r4, r2
    1498:	e3540001 	cmp	r4, #1
    149c:	0a00000a 	beq	14cc <concreate+0xf0>
    14a0:	e3001202 	movw	r1, #514	; 0x202
    14a4:	e24b0050 	sub	r0, fp, #80	; 0x50
    14a8:	eb000898 	bl	3710 <open>
    14ac:	e3500000 	cmp	r0, #0
    14b0:	aa00008b 	bge	16e4 <concreate+0x308>
    14b4:	e24b2050 	sub	r2, fp, #80	; 0x50
    14b8:	e30415d0 	movw	r1, #17872	; 0x45d0
    14bc:	e3a00001 	mov	r0, #1
    14c0:	e3401000 	movt	r1, #0
    14c4:	eb000975 	bl	3aa0 <printf>
    14c8:	eb00081b 	bl	353c <exit>
    14cc:	e30405cc 	movw	r0, #17868	; 0x45cc
    14d0:	e24b1050 	sub	r1, fp, #80	; 0x50
    14d4:	e3400000 	movt	r0, #0
    14d8:	eb0008c0 	bl	37e0 <link>
    14dc:	eb000816 	bl	353c <exit>
    14e0:	e24b1050 	sub	r1, fp, #80	; 0x50
    14e4:	e1a00006 	mov	r0, r6
    14e8:	e2844001 	add	r4, r4, #1
    14ec:	eb0008bb 	bl	37e0 <link>
    14f0:	eb00081e 	bl	3570 <wait>
    14f4:	e3540028 	cmp	r4, #40	; 0x28
    14f8:	1affffd8 	bne	1460 <concreate+0x84>
    14fc:	e3a01000 	mov	r1, #0
    1500:	e1a02004 	mov	r2, r4
    1504:	e1a05001 	mov	r5, r1
    1508:	e24b003c 	sub	r0, fp, #60	; 0x3c
    150c:	eb000793 	bl	3360 <memset>
    1510:	e304058c 	movw	r0, #17804	; 0x458c
    1514:	e1a01005 	mov	r1, r5
    1518:	e3400000 	movt	r0, #0
    151c:	eb00087b 	bl	3710 <open>
    1520:	e3a06001 	mov	r6, #1
    1524:	e1a04000 	mov	r4, r0
    1528:	e3a02010 	mov	r2, #16
    152c:	e24b104c 	sub	r1, fp, #76	; 0x4c
    1530:	e1a00004 	mov	r0, r4
    1534:	eb000834 	bl	360c <read>
    1538:	e3500000 	cmp	r0, #0
    153c:	da000014 	ble	1594 <concreate+0x1b8>
    1540:	e15b34bc 	ldrh	r3, [fp, #-76]	; 0xffffffb4
    1544:	e3530000 	cmp	r3, #0
    1548:	0afffff6 	beq	1528 <concreate+0x14c>
    154c:	e55b304a 	ldrb	r3, [fp, #-74]	; 0xffffffb6
    1550:	e3530043 	cmp	r3, #67	; 0x43
    1554:	1afffff3 	bne	1528 <concreate+0x14c>
    1558:	e55b3048 	ldrb	r3, [fp, #-72]	; 0xffffffb8
    155c:	e3530000 	cmp	r3, #0
    1560:	1afffff0 	bne	1528 <concreate+0x14c>
    1564:	e55b3049 	ldrb	r3, [fp, #-73]	; 0xffffffb7
    1568:	e2433030 	sub	r3, r3, #48	; 0x30
    156c:	e3530027 	cmp	r3, #39	; 0x27
    1570:	8a000055 	bhi	16cc <concreate+0x2f0>
    1574:	e24b2014 	sub	r2, fp, #20
    1578:	e0823003 	add	r3, r2, r3
    157c:	e5532028 	ldrb	r2, [r3, #-40]	; 0xffffffd8
    1580:	e3520000 	cmp	r2, #0
    1584:	1a00004a 	bne	16b4 <concreate+0x2d8>
    1588:	e2855001 	add	r5, r5, #1
    158c:	e5436028 	strb	r6, [r3, #-40]	; 0xffffffd8
    1590:	eaffffe4 	b	1528 <concreate+0x14c>
    1594:	e1a00004 	mov	r0, r4
    1598:	eb000835 	bl	3674 <close>
    159c:	e3550028 	cmp	r5, #40	; 0x28
    15a0:	03056556 	movweq	r6, #21846	; 0x5556
    15a4:	03a04000 	moveq	r4, #0
    15a8:	03456555 	movteq	r6, #21845	; 0x5555
    15ac:	0a000016 	beq	160c <concreate+0x230>
    15b0:	ea00003a 	b	16a0 <concreate+0x2c4>
    15b4:	e3a01000 	mov	r1, #0
    15b8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15bc:	eb000853 	bl	3710 <open>
    15c0:	eb00082b 	bl	3674 <close>
    15c4:	e3a01000 	mov	r1, #0
    15c8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15cc:	eb00084f 	bl	3710 <open>
    15d0:	eb000827 	bl	3674 <close>
    15d4:	e3a01000 	mov	r1, #0
    15d8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15dc:	eb00084b 	bl	3710 <open>
    15e0:	eb000823 	bl	3674 <close>
    15e4:	e3a01000 	mov	r1, #0
    15e8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15ec:	eb000847 	bl	3710 <open>
    15f0:	eb00081f 	bl	3674 <close>
    15f4:	e3550000 	cmp	r5, #0
    15f8:	0affffb7 	beq	14dc <concreate+0x100>
    15fc:	e2844001 	add	r4, r4, #1
    1600:	eb0007da 	bl	3570 <wait>
    1604:	e3540028 	cmp	r4, #40	; 0x28
    1608:	0a000019 	beq	1674 <concreate+0x298>
    160c:	e2843030 	add	r3, r4, #48	; 0x30
    1610:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    1614:	eb0007bb 	bl	3508 <fork>
    1618:	e2505000 	subs	r5, r0, #0
    161c:	ba00001a 	blt	168c <concreate+0x2b0>
    1620:	e0c32694 	smull	r2, r3, r4, r6
    1624:	e0433fc4 	sub	r3, r3, r4, asr #31
    1628:	e0833083 	add	r3, r3, r3, lsl #1
    162c:	e0443003 	sub	r3, r4, r3
    1630:	e1952003 	orrs	r2, r5, r3
    1634:	0affffde 	beq	15b4 <concreate+0x1d8>
    1638:	e2952000 	adds	r2, r5, #0
    163c:	13a02001 	movne	r2, #1
    1640:	e3530001 	cmp	r3, #1
    1644:	13a02000 	movne	r2, #0
    1648:	e3520000 	cmp	r2, #0
    164c:	1affffd8 	bne	15b4 <concreate+0x1d8>
    1650:	e24b0050 	sub	r0, fp, #80	; 0x50
    1654:	eb000847 	bl	3778 <unlink>
    1658:	e24b0050 	sub	r0, fp, #80	; 0x50
    165c:	eb000845 	bl	3778 <unlink>
    1660:	e24b0050 	sub	r0, fp, #80	; 0x50
    1664:	eb000843 	bl	3778 <unlink>
    1668:	e24b0050 	sub	r0, fp, #80	; 0x50
    166c:	eb000841 	bl	3778 <unlink>
    1670:	eaffffdf 	b	15f4 <concreate+0x218>
    1674:	e3a00001 	mov	r0, #1
    1678:	e304165c 	movw	r1, #18012	; 0x465c
    167c:	e3401000 	movt	r1, #0
    1680:	eb000906 	bl	3aa0 <printf>
    1684:	e24bd010 	sub	sp, fp, #16
    1688:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
    168c:	e3051718 	movw	r1, #22296	; 0x5718
    1690:	e3a00001 	mov	r0, #1
    1694:	e3401000 	movt	r1, #0
    1698:	eb000900 	bl	3aa0 <printf>
    169c:	eb0007a6 	bl	353c <exit>
    16a0:	e3041628 	movw	r1, #17960	; 0x4628
    16a4:	e3a00001 	mov	r0, #1
    16a8:	e3401000 	movt	r1, #0
    16ac:	eb0008fb 	bl	3aa0 <printf>
    16b0:	eb0007a1 	bl	353c <exit>
    16b4:	e3041608 	movw	r1, #17928	; 0x4608
    16b8:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16bc:	e3401000 	movt	r1, #0
    16c0:	e3a00001 	mov	r0, #1
    16c4:	eb0008f5 	bl	3aa0 <printf>
    16c8:	eb00079b 	bl	353c <exit>
    16cc:	e30415ec 	movw	r1, #17900	; 0x45ec
    16d0:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16d4:	e3401000 	movt	r1, #0
    16d8:	e3a00001 	mov	r0, #1
    16dc:	eb0008ef 	bl	3aa0 <printf>
    16e0:	eaffff7d 	b	14dc <concreate+0x100>
    16e4:	eb0007e2 	bl	3674 <close>
    16e8:	eaffff7b 	b	14dc <concreate+0x100>

000016ec <linkunlink>:
    16ec:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    16f0:	e3a00001 	mov	r0, #1
    16f4:	e28db01c 	add	fp, sp, #28
    16f8:	e304166c 	movw	r1, #18028	; 0x466c
    16fc:	e3401000 	movt	r1, #0
    1700:	eb0008e6 	bl	3aa0 <printf>
    1704:	e3040aec 	movw	r0, #19180	; 0x4aec
    1708:	e3400000 	movt	r0, #0
    170c:	eb000819 	bl	3778 <unlink>
    1710:	eb00077c 	bl	3508 <fork>
    1714:	e2508000 	subs	r8, r0, #0
    1718:	ba00002a 	blt	17c8 <linkunlink+0xdc>
    171c:	e3047e6d 	movw	r7, #20077	; 0x4e6d
    1720:	e30a6aab 	movw	r6, #43691	; 0xaaab
    1724:	e3045aec 	movw	r5, #19180	; 0x4aec
    1728:	13a04001 	movne	r4, #1
    172c:	03a04061 	moveq	r4, #97	; 0x61
    1730:	e34471c6 	movt	r7, #16838	; 0x41c6
    1734:	e34a6aaa 	movt	r6, #43690	; 0xaaaa
    1738:	e3405000 	movt	r5, #0
    173c:	e3a09064 	mov	r9, #100	; 0x64
    1740:	ea000005 	b	175c <linkunlink+0x70>
    1744:	e3530001 	cmp	r3, #1
    1748:	0a000019 	beq	17b4 <linkunlink+0xc8>
    174c:	e1a00005 	mov	r0, r5
    1750:	eb000808 	bl	3778 <unlink>
    1754:	e2599001 	subs	r9, r9, #1
    1758:	0a00000c 	beq	1790 <linkunlink+0xa4>
    175c:	e3033039 	movw	r3, #12345	; 0x3039
    1760:	e0243497 	mla	r4, r7, r4, r3
    1764:	e0832694 	umull	r2, r3, r4, r6
    1768:	e1a030a3 	lsr	r3, r3, #1
    176c:	e0833083 	add	r3, r3, r3, lsl #1
    1770:	e0543003 	subs	r3, r4, r3
    1774:	1afffff2 	bne	1744 <linkunlink+0x58>
    1778:	e3001202 	movw	r1, #514	; 0x202
    177c:	e1a00005 	mov	r0, r5
    1780:	eb0007e2 	bl	3710 <open>
    1784:	eb0007ba 	bl	3674 <close>
    1788:	e2599001 	subs	r9, r9, #1
    178c:	1afffff2 	bne	175c <linkunlink+0x70>
    1790:	e3580000 	cmp	r8, #0
    1794:	0a000010 	beq	17dc <linkunlink+0xf0>
    1798:	eb000774 	bl	3570 <wait>
    179c:	e3041684 	movw	r1, #18052	; 0x4684
    17a0:	e3a00001 	mov	r0, #1
    17a4:	e3401000 	movt	r1, #0
    17a8:	e24bd01c 	sub	sp, fp, #28
    17ac:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
    17b0:	ea0008ba 	b	3aa0 <printf>
    17b4:	e3040680 	movw	r0, #18048	; 0x4680
    17b8:	e1a01005 	mov	r1, r5
    17bc:	e3400000 	movt	r0, #0
    17c0:	eb000806 	bl	37e0 <link>
    17c4:	eaffffe2 	b	1754 <linkunlink+0x68>
    17c8:	e3051718 	movw	r1, #22296	; 0x5718
    17cc:	e3a00001 	mov	r0, #1
    17d0:	e3401000 	movt	r1, #0
    17d4:	eb0008b1 	bl	3aa0 <printf>
    17d8:	eb000757 	bl	353c <exit>
    17dc:	eb000756 	bl	353c <exit>

000017e0 <bigdir>:
    17e0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    17e4:	e3a00001 	mov	r0, #1
    17e8:	e28db018 	add	fp, sp, #24
    17ec:	e3041694 	movw	r1, #18068	; 0x4694
    17f0:	e24dd014 	sub	sp, sp, #20
    17f4:	e3401000 	movt	r1, #0
    17f8:	eb0008a8 	bl	3aa0 <printf>
    17fc:	e30406a4 	movw	r0, #18084	; 0x46a4
    1800:	e3400000 	movt	r0, #0
    1804:	eb0007db 	bl	3778 <unlink>
    1808:	e30406a4 	movw	r0, #18084	; 0x46a4
    180c:	e3a01c02 	mov	r1, #512	; 0x200
    1810:	e3400000 	movt	r0, #0
    1814:	eb0007bd 	bl	3710 <open>
    1818:	e3500000 	cmp	r0, #0
    181c:	ba000039 	blt	1908 <bigdir+0x128>
    1820:	eb000793 	bl	3674 <close>
    1824:	e3a07000 	mov	r7, #0
    1828:	e30446a4 	movw	r4, #18084	; 0x46a4
    182c:	e3404000 	movt	r4, #0
    1830:	e1a06007 	mov	r6, r7
    1834:	e3a05078 	mov	r5, #120	; 0x78
    1838:	e1a02347 	asr	r2, r7, #6
    183c:	e207303f 	and	r3, r7, #63	; 0x3f
    1840:	e24b1028 	sub	r1, fp, #40	; 0x28
    1844:	e1a00004 	mov	r0, r4
    1848:	e2822030 	add	r2, r2, #48	; 0x30
    184c:	e2833030 	add	r3, r3, #48	; 0x30
    1850:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    1854:	e54b6025 	strb	r6, [fp, #-37]	; 0xffffffdb
    1858:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    185c:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    1860:	eb0007de 	bl	37e0 <link>
    1864:	e2508000 	subs	r8, r0, #0
    1868:	1a00001c 	bne	18e0 <bigdir+0x100>
    186c:	e2877001 	add	r7, r7, #1
    1870:	e3570f7d 	cmp	r7, #500	; 0x1f4
    1874:	1affffef 	bne	1838 <bigdir+0x58>
    1878:	e30406a4 	movw	r0, #18084	; 0x46a4
    187c:	e3400000 	movt	r0, #0
    1880:	eb0007bc 	bl	3778 <unlink>
    1884:	e3a05078 	mov	r5, #120	; 0x78
    1888:	e1a04008 	mov	r4, r8
    188c:	e1a02348 	asr	r2, r8, #6
    1890:	e208303f 	and	r3, r8, #63	; 0x3f
    1894:	e24b0028 	sub	r0, fp, #40	; 0x28
    1898:	e2822030 	add	r2, r2, #48	; 0x30
    189c:	e2833030 	add	r3, r3, #48	; 0x30
    18a0:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    18a4:	e54b4025 	strb	r4, [fp, #-37]	; 0xffffffdb
    18a8:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    18ac:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    18b0:	eb0007b0 	bl	3778 <unlink>
    18b4:	e3500000 	cmp	r0, #0
    18b8:	1a00000d 	bne	18f4 <bigdir+0x114>
    18bc:	e2888001 	add	r8, r8, #1
    18c0:	e3580f7d 	cmp	r8, #500	; 0x1f4
    18c4:	1afffff0 	bne	188c <bigdir+0xac>
    18c8:	e3a00001 	mov	r0, #1
    18cc:	e30416ec 	movw	r1, #18156	; 0x46ec
    18d0:	e3401000 	movt	r1, #0
    18d4:	eb000871 	bl	3aa0 <printf>
    18d8:	e24bd018 	sub	sp, fp, #24
    18dc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    18e0:	e30416c0 	movw	r1, #18112	; 0x46c0
    18e4:	e3a00001 	mov	r0, #1
    18e8:	e3401000 	movt	r1, #0
    18ec:	eb00086b 	bl	3aa0 <printf>
    18f0:	eb000711 	bl	353c <exit>
    18f4:	e30416d4 	movw	r1, #18132	; 0x46d4
    18f8:	e3a00001 	mov	r0, #1
    18fc:	e3401000 	movt	r1, #0
    1900:	eb000866 	bl	3aa0 <printf>
    1904:	eb00070c 	bl	353c <exit>
    1908:	e30416a8 	movw	r1, #18088	; 0x46a8
    190c:	e3a00001 	mov	r0, #1
    1910:	e3401000 	movt	r1, #0
    1914:	eb000861 	bl	3aa0 <printf>
    1918:	eb000707 	bl	353c <exit>

0000191c <subdir>:
    191c:	e92d4830 	push	{r4, r5, fp, lr}
    1920:	e3a00001 	mov	r0, #1
    1924:	e28db00c 	add	fp, sp, #12
    1928:	e30416f8 	movw	r1, #18168	; 0x46f8
    192c:	e3401000 	movt	r1, #0
    1930:	eb00085a 	bl	3aa0 <printf>
    1934:	e3040800 	movw	r0, #18432	; 0x4800
    1938:	e3400000 	movt	r0, #0
    193c:	eb00078d 	bl	3778 <unlink>
    1940:	e30408ac 	movw	r0, #18604	; 0x48ac
    1944:	e3400000 	movt	r0, #0
    1948:	eb0007b1 	bl	3814 <mkdir>
    194c:	e3500000 	cmp	r0, #0
    1950:	1a000150 	bne	1e98 <subdir+0x57c>
    1954:	e3040720 	movw	r0, #18208	; 0x4720
    1958:	e3001202 	movw	r1, #514	; 0x202
    195c:	e3400000 	movt	r0, #0
    1960:	eb00076a 	bl	3710 <open>
    1964:	e2504000 	subs	r4, r0, #0
    1968:	ba000145 	blt	1e84 <subdir+0x568>
    196c:	e3a02002 	mov	r2, #2
    1970:	e3041800 	movw	r1, #18432	; 0x4800
    1974:	e3401000 	movt	r1, #0
    1978:	eb000730 	bl	3640 <write>
    197c:	e1a00004 	mov	r0, r4
    1980:	eb00073b 	bl	3674 <close>
    1984:	e30408ac 	movw	r0, #18604	; 0x48ac
    1988:	e3400000 	movt	r0, #0
    198c:	eb000779 	bl	3778 <unlink>
    1990:	e3500000 	cmp	r0, #0
    1994:	aa000135 	bge	1e70 <subdir+0x554>
    1998:	e3040768 	movw	r0, #18280	; 0x4768
    199c:	e3400000 	movt	r0, #0
    19a0:	eb00079b 	bl	3814 <mkdir>
    19a4:	e2504000 	subs	r4, r0, #0
    19a8:	1a00012b 	bne	1e5c <subdir+0x540>
    19ac:	e304078c 	movw	r0, #18316	; 0x478c
    19b0:	e3001202 	movw	r1, #514	; 0x202
    19b4:	e3400000 	movt	r0, #0
    19b8:	eb000754 	bl	3710 <open>
    19bc:	e2505000 	subs	r5, r0, #0
    19c0:	ba0000ee 	blt	1d80 <subdir+0x464>
    19c4:	e3a02002 	mov	r2, #2
    19c8:	e30417b0 	movw	r1, #18352	; 0x47b0
    19cc:	e3401000 	movt	r1, #0
    19d0:	eb00071a 	bl	3640 <write>
    19d4:	e1a00005 	mov	r0, r5
    19d8:	eb000725 	bl	3674 <close>
    19dc:	e1a01004 	mov	r1, r4
    19e0:	e30407b4 	movw	r0, #18356	; 0x47b4
    19e4:	e3400000 	movt	r0, #0
    19e8:	eb000748 	bl	3710 <open>
    19ec:	e2505000 	subs	r5, r0, #0
    19f0:	ba0000dd 	blt	1d6c <subdir+0x450>
    19f4:	e3074fcc 	movw	r4, #32716	; 0x7fcc
    19f8:	e3404000 	movt	r4, #0
    19fc:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a00:	e1a01004 	mov	r1, r4
    1a04:	eb000700 	bl	360c <read>
    1a08:	e3500002 	cmp	r0, #2
    1a0c:	1a0000b3 	bne	1ce0 <subdir+0x3c4>
    1a10:	e5d43000 	ldrb	r3, [r4]
    1a14:	e3530066 	cmp	r3, #102	; 0x66
    1a18:	1a0000b0 	bne	1ce0 <subdir+0x3c4>
    1a1c:	e1a00005 	mov	r0, r5
    1a20:	eb000713 	bl	3674 <close>
    1a24:	e30417f8 	movw	r1, #18424	; 0x47f8
    1a28:	e304078c 	movw	r0, #18316	; 0x478c
    1a2c:	e3401000 	movt	r1, #0
    1a30:	e3400000 	movt	r0, #0
    1a34:	eb000769 	bl	37e0 <link>
    1a38:	e3500000 	cmp	r0, #0
    1a3c:	1a0000d9 	bne	1da8 <subdir+0x48c>
    1a40:	e304078c 	movw	r0, #18316	; 0x478c
    1a44:	e3400000 	movt	r0, #0
    1a48:	eb00074a 	bl	3778 <unlink>
    1a4c:	e3500000 	cmp	r0, #0
    1a50:	1a0000ac 	bne	1d08 <subdir+0x3ec>
    1a54:	e304078c 	movw	r0, #18316	; 0x478c
    1a58:	e3a01000 	mov	r1, #0
    1a5c:	e3400000 	movt	r0, #0
    1a60:	eb00072a 	bl	3710 <open>
    1a64:	e3500000 	cmp	r0, #0
    1a68:	aa0000f6 	bge	1e48 <subdir+0x52c>
    1a6c:	e30408ac 	movw	r0, #18604	; 0x48ac
    1a70:	e3400000 	movt	r0, #0
    1a74:	eb000773 	bl	3848 <chdir>
    1a78:	e3500000 	cmp	r0, #0
    1a7c:	1a0000ec 	bne	1e34 <subdir+0x518>
    1a80:	e3040878 	movw	r0, #18552	; 0x4878
    1a84:	e3400000 	movt	r0, #0
    1a88:	eb00076e 	bl	3848 <chdir>
    1a8c:	e3500000 	cmp	r0, #0
    1a90:	1a000097 	bne	1cf4 <subdir+0x3d8>
    1a94:	e30408a0 	movw	r0, #18592	; 0x48a0
    1a98:	e3400000 	movt	r0, #0
    1a9c:	eb000769 	bl	3848 <chdir>
    1aa0:	e3500000 	cmp	r0, #0
    1aa4:	1a000092 	bne	1cf4 <subdir+0x3d8>
    1aa8:	e30408b0 	movw	r0, #18608	; 0x48b0
    1aac:	e3400000 	movt	r0, #0
    1ab0:	eb000764 	bl	3848 <chdir>
    1ab4:	e2504000 	subs	r4, r0, #0
    1ab8:	1a0000b5 	bne	1d94 <subdir+0x478>
    1abc:	e30407f8 	movw	r0, #18424	; 0x47f8
    1ac0:	e1a01004 	mov	r1, r4
    1ac4:	e3400000 	movt	r0, #0
    1ac8:	eb000710 	bl	3710 <open>
    1acc:	e2505000 	subs	r5, r0, #0
    1ad0:	ba00012c 	blt	1f88 <subdir+0x66c>
    1ad4:	e3071fcc 	movw	r1, #32716	; 0x7fcc
    1ad8:	e3a02a02 	mov	r2, #8192	; 0x2000
    1adc:	e3401000 	movt	r1, #0
    1ae0:	eb0006c9 	bl	360c <read>
    1ae4:	e3500002 	cmp	r0, #2
    1ae8:	1a000121 	bne	1f74 <subdir+0x658>
    1aec:	e1a00005 	mov	r0, r5
    1af0:	eb0006df 	bl	3674 <close>
    1af4:	e1a01004 	mov	r1, r4
    1af8:	e304078c 	movw	r0, #18316	; 0x478c
    1afc:	e3400000 	movt	r0, #0
    1b00:	eb000702 	bl	3710 <open>
    1b04:	e3500000 	cmp	r0, #0
    1b08:	aa000088 	bge	1d30 <subdir+0x414>
    1b0c:	e3040928 	movw	r0, #18728	; 0x4928
    1b10:	e3001202 	movw	r1, #514	; 0x202
    1b14:	e3400000 	movt	r0, #0
    1b18:	eb0006fc 	bl	3710 <open>
    1b1c:	e3500000 	cmp	r0, #0
    1b20:	aa00007d 	bge	1d1c <subdir+0x400>
    1b24:	e3040950 	movw	r0, #18768	; 0x4950
    1b28:	e3001202 	movw	r1, #514	; 0x202
    1b2c:	e3400000 	movt	r0, #0
    1b30:	eb0006f6 	bl	3710 <open>
    1b34:	e3500000 	cmp	r0, #0
    1b38:	aa0000b8 	bge	1e20 <subdir+0x504>
    1b3c:	e30408ac 	movw	r0, #18604	; 0x48ac
    1b40:	e3a01c02 	mov	r1, #512	; 0x200
    1b44:	e3400000 	movt	r0, #0
    1b48:	eb0006f0 	bl	3710 <open>
    1b4c:	e3500000 	cmp	r0, #0
    1b50:	aa0000ad 	bge	1e0c <subdir+0x4f0>
    1b54:	e30408ac 	movw	r0, #18604	; 0x48ac
    1b58:	e3a01002 	mov	r1, #2
    1b5c:	e3400000 	movt	r0, #0
    1b60:	eb0006ea 	bl	3710 <open>
    1b64:	e3500000 	cmp	r0, #0
    1b68:	aa0000a2 	bge	1df8 <subdir+0x4dc>
    1b6c:	e30408ac 	movw	r0, #18604	; 0x48ac
    1b70:	e3a01001 	mov	r1, #1
    1b74:	e3400000 	movt	r0, #0
    1b78:	eb0006e4 	bl	3710 <open>
    1b7c:	e3500000 	cmp	r0, #0
    1b80:	aa000097 	bge	1de4 <subdir+0x4c8>
    1b84:	e30419c8 	movw	r1, #18888	; 0x49c8
    1b88:	e3040928 	movw	r0, #18728	; 0x4928
    1b8c:	e3401000 	movt	r1, #0
    1b90:	e3400000 	movt	r0, #0
    1b94:	eb000711 	bl	37e0 <link>
    1b98:	e3500000 	cmp	r0, #0
    1b9c:	0a00008b 	beq	1dd0 <subdir+0x4b4>
    1ba0:	e30419c8 	movw	r1, #18888	; 0x49c8
    1ba4:	e3040950 	movw	r0, #18768	; 0x4950
    1ba8:	e3401000 	movt	r1, #0
    1bac:	e3400000 	movt	r0, #0
    1bb0:	eb00070a 	bl	37e0 <link>
    1bb4:	e3500000 	cmp	r0, #0
    1bb8:	0a00007f 	beq	1dbc <subdir+0x4a0>
    1bbc:	e30417f8 	movw	r1, #18424	; 0x47f8
    1bc0:	e3040720 	movw	r0, #18208	; 0x4720
    1bc4:	e3401000 	movt	r1, #0
    1bc8:	e3400000 	movt	r0, #0
    1bcc:	eb000703 	bl	37e0 <link>
    1bd0:	e3500000 	cmp	r0, #0
    1bd4:	0a00005f 	beq	1d58 <subdir+0x43c>
    1bd8:	e3040928 	movw	r0, #18728	; 0x4928
    1bdc:	e3400000 	movt	r0, #0
    1be0:	eb00070b 	bl	3814 <mkdir>
    1be4:	e3500000 	cmp	r0, #0
    1be8:	0a000055 	beq	1d44 <subdir+0x428>
    1bec:	e3040950 	movw	r0, #18768	; 0x4950
    1bf0:	e3400000 	movt	r0, #0
    1bf4:	eb000706 	bl	3814 <mkdir>
    1bf8:	e3500000 	cmp	r0, #0
    1bfc:	0a0000d7 	beq	1f60 <subdir+0x644>
    1c00:	e30407f8 	movw	r0, #18424	; 0x47f8
    1c04:	e3400000 	movt	r0, #0
    1c08:	eb000701 	bl	3814 <mkdir>
    1c0c:	e3500000 	cmp	r0, #0
    1c10:	0a0000cd 	beq	1f4c <subdir+0x630>
    1c14:	e3040950 	movw	r0, #18768	; 0x4950
    1c18:	e3400000 	movt	r0, #0
    1c1c:	eb0006d5 	bl	3778 <unlink>
    1c20:	e3500000 	cmp	r0, #0
    1c24:	0a0000c3 	beq	1f38 <subdir+0x61c>
    1c28:	e3040928 	movw	r0, #18728	; 0x4928
    1c2c:	e3400000 	movt	r0, #0
    1c30:	eb0006d0 	bl	3778 <unlink>
    1c34:	e3500000 	cmp	r0, #0
    1c38:	0a0000b9 	beq	1f24 <subdir+0x608>
    1c3c:	e3040720 	movw	r0, #18208	; 0x4720
    1c40:	e3400000 	movt	r0, #0
    1c44:	eb0006ff 	bl	3848 <chdir>
    1c48:	e3500000 	cmp	r0, #0
    1c4c:	0a0000af 	beq	1f10 <subdir+0x5f4>
    1c50:	e3040ae8 	movw	r0, #19176	; 0x4ae8
    1c54:	e3400000 	movt	r0, #0
    1c58:	eb0006fa 	bl	3848 <chdir>
    1c5c:	e3500000 	cmp	r0, #0
    1c60:	0a0000a5 	beq	1efc <subdir+0x5e0>
    1c64:	e30407f8 	movw	r0, #18424	; 0x47f8
    1c68:	e3400000 	movt	r0, #0
    1c6c:	eb0006c1 	bl	3778 <unlink>
    1c70:	e3500000 	cmp	r0, #0
    1c74:	1a000023 	bne	1d08 <subdir+0x3ec>
    1c78:	e3040720 	movw	r0, #18208	; 0x4720
    1c7c:	e3400000 	movt	r0, #0
    1c80:	eb0006bc 	bl	3778 <unlink>
    1c84:	e3500000 	cmp	r0, #0
    1c88:	1a000096 	bne	1ee8 <subdir+0x5cc>
    1c8c:	e30408ac 	movw	r0, #18604	; 0x48ac
    1c90:	e3400000 	movt	r0, #0
    1c94:	eb0006b7 	bl	3778 <unlink>
    1c98:	e3500000 	cmp	r0, #0
    1c9c:	0a00008c 	beq	1ed4 <subdir+0x5b8>
    1ca0:	e3040b40 	movw	r0, #19264	; 0x4b40
    1ca4:	e3400000 	movt	r0, #0
    1ca8:	eb0006b2 	bl	3778 <unlink>
    1cac:	e3500000 	cmp	r0, #0
    1cb0:	ba000082 	blt	1ec0 <subdir+0x5a4>
    1cb4:	e30408ac 	movw	r0, #18604	; 0x48ac
    1cb8:	e3400000 	movt	r0, #0
    1cbc:	eb0006ad 	bl	3778 <unlink>
    1cc0:	e3500000 	cmp	r0, #0
    1cc4:	ba000078 	blt	1eac <subdir+0x590>
    1cc8:	e3041b74 	movw	r1, #19316	; 0x4b74
    1ccc:	e3a00001 	mov	r0, #1
    1cd0:	e3401000 	movt	r1, #0
    1cd4:	e24bd00c 	sub	sp, fp, #12
    1cd8:	e8bd4830 	pop	{r4, r5, fp, lr}
    1cdc:	ea00076f 	b	3aa0 <printf>
    1ce0:	e30417dc 	movw	r1, #18396	; 0x47dc
    1ce4:	e3a00001 	mov	r0, #1
    1ce8:	e3401000 	movt	r1, #0
    1cec:	eb00076b 	bl	3aa0 <printf>
    1cf0:	eb000611 	bl	353c <exit>
    1cf4:	e3041884 	movw	r1, #18564	; 0x4884
    1cf8:	e3a00001 	mov	r0, #1
    1cfc:	e3401000 	movt	r1, #0
    1d00:	eb000766 	bl	3aa0 <printf>
    1d04:	eb00060c 	bl	353c <exit>
    1d08:	e3041828 	movw	r1, #18472	; 0x4828
    1d0c:	e3a00001 	mov	r0, #1
    1d10:	e3401000 	movt	r1, #0
    1d14:	eb000761 	bl	3aa0 <printf>
    1d18:	eb000607 	bl	353c <exit>
    1d1c:	e3041934 	movw	r1, #18740	; 0x4934
    1d20:	e3a00001 	mov	r0, #1
    1d24:	e3401000 	movt	r1, #0
    1d28:	eb00075c 	bl	3aa0 <printf>
    1d2c:	eb000602 	bl	353c <exit>
    1d30:	e3041900 	movw	r1, #18688	; 0x4900
    1d34:	e3a00001 	mov	r0, #1
    1d38:	e3401000 	movt	r1, #0
    1d3c:	eb000757 	bl	3aa0 <printf>
    1d40:	eb0005fd 	bl	353c <exit>
    1d44:	e3041a40 	movw	r1, #19008	; 0x4a40
    1d48:	e3a00001 	mov	r0, #1
    1d4c:	e3401000 	movt	r1, #0
    1d50:	eb000752 	bl	3aa0 <printf>
    1d54:	eb0005f8 	bl	353c <exit>
    1d58:	e3041a1c 	movw	r1, #18972	; 0x4a1c
    1d5c:	e3a00001 	mov	r0, #1
    1d60:	e3401000 	movt	r1, #0
    1d64:	eb00074d 	bl	3aa0 <printf>
    1d68:	eb0005f3 	bl	353c <exit>
    1d6c:	e30417c0 	movw	r1, #18368	; 0x47c0
    1d70:	e3a00001 	mov	r0, #1
    1d74:	e3401000 	movt	r1, #0
    1d78:	eb000748 	bl	3aa0 <printf>
    1d7c:	eb0005ee 	bl	353c <exit>
    1d80:	e3041798 	movw	r1, #18328	; 0x4798
    1d84:	e3a00001 	mov	r0, #1
    1d88:	e3401000 	movt	r1, #0
    1d8c:	eb000743 	bl	3aa0 <printf>
    1d90:	eb0005e9 	bl	353c <exit>
    1d94:	e30418b8 	movw	r1, #18616	; 0x48b8
    1d98:	e3a00001 	mov	r0, #1
    1d9c:	e3401000 	movt	r1, #0
    1da0:	eb00073e 	bl	3aa0 <printf>
    1da4:	eb0005e4 	bl	353c <exit>
    1da8:	e3041804 	movw	r1, #18436	; 0x4804
    1dac:	e3a00001 	mov	r0, #1
    1db0:	e3401000 	movt	r1, #0
    1db4:	eb000739 	bl	3aa0 <printf>
    1db8:	eb0005df 	bl	353c <exit>
    1dbc:	e30419f8 	movw	r1, #18936	; 0x49f8
    1dc0:	e3a00001 	mov	r0, #1
    1dc4:	e3401000 	movt	r1, #0
    1dc8:	eb000734 	bl	3aa0 <printf>
    1dcc:	eb0005da 	bl	353c <exit>
    1dd0:	e30419d4 	movw	r1, #18900	; 0x49d4
    1dd4:	e3a00001 	mov	r0, #1
    1dd8:	e3401000 	movt	r1, #0
    1ddc:	eb00072f 	bl	3aa0 <printf>
    1de0:	eb0005d5 	bl	353c <exit>
    1de4:	e30419ac 	movw	r1, #18860	; 0x49ac
    1de8:	e3a00001 	mov	r0, #1
    1dec:	e3401000 	movt	r1, #0
    1df0:	eb00072a 	bl	3aa0 <printf>
    1df4:	eb0005d0 	bl	353c <exit>
    1df8:	e3041990 	movw	r1, #18832	; 0x4990
    1dfc:	e3a00001 	mov	r0, #1
    1e00:	e3401000 	movt	r1, #0
    1e04:	eb000725 	bl	3aa0 <printf>
    1e08:	eb0005cb 	bl	353c <exit>
    1e0c:	e3041978 	movw	r1, #18808	; 0x4978
    1e10:	e3a00001 	mov	r0, #1
    1e14:	e3401000 	movt	r1, #0
    1e18:	eb000720 	bl	3aa0 <printf>
    1e1c:	eb0005c6 	bl	353c <exit>
    1e20:	e304195c 	movw	r1, #18780	; 0x495c
    1e24:	e3a00001 	mov	r0, #1
    1e28:	e3401000 	movt	r1, #0
    1e2c:	eb00071b 	bl	3aa0 <printf>
    1e30:	eb0005c1 	bl	353c <exit>
    1e34:	e3041864 	movw	r1, #18532	; 0x4864
    1e38:	e3a00001 	mov	r0, #1
    1e3c:	e3401000 	movt	r1, #0
    1e40:	eb000716 	bl	3aa0 <printf>
    1e44:	eb0005bc 	bl	353c <exit>
    1e48:	e3041840 	movw	r1, #18496	; 0x4840
    1e4c:	e3a00001 	mov	r0, #1
    1e50:	e3401000 	movt	r1, #0
    1e54:	eb000711 	bl	3aa0 <printf>
    1e58:	eb0005b7 	bl	353c <exit>
    1e5c:	e3041770 	movw	r1, #18288	; 0x4770
    1e60:	e3a00001 	mov	r0, #1
    1e64:	e3401000 	movt	r1, #0
    1e68:	eb00070c 	bl	3aa0 <printf>
    1e6c:	eb0005b2 	bl	353c <exit>
    1e70:	e3041740 	movw	r1, #18240	; 0x4740
    1e74:	e3a00001 	mov	r0, #1
    1e78:	e3401000 	movt	r1, #0
    1e7c:	eb000707 	bl	3aa0 <printf>
    1e80:	eb0005ad 	bl	353c <exit>
    1e84:	e3041728 	movw	r1, #18216	; 0x4728
    1e88:	e3a00001 	mov	r0, #1
    1e8c:	e3401000 	movt	r1, #0
    1e90:	eb000702 	bl	3aa0 <printf>
    1e94:	eb0005a8 	bl	353c <exit>
    1e98:	e3041708 	movw	r1, #18184	; 0x4708
    1e9c:	e3a00001 	mov	r0, #1
    1ea0:	e3401000 	movt	r1, #0
    1ea4:	eb0006fd 	bl	3aa0 <printf>
    1ea8:	eb0005a3 	bl	353c <exit>
    1eac:	e3041b60 	movw	r1, #19296	; 0x4b60
    1eb0:	e3a00001 	mov	r0, #1
    1eb4:	e3401000 	movt	r1, #0
    1eb8:	eb0006f8 	bl	3aa0 <printf>
    1ebc:	eb00059e 	bl	353c <exit>
    1ec0:	e3041b48 	movw	r1, #19272	; 0x4b48
    1ec4:	e3a00001 	mov	r0, #1
    1ec8:	e3401000 	movt	r1, #0
    1ecc:	eb0006f3 	bl	3aa0 <printf>
    1ed0:	eb000599 	bl	353c <exit>
    1ed4:	e3041b20 	movw	r1, #19232	; 0x4b20
    1ed8:	e3a00001 	mov	r0, #1
    1edc:	e3401000 	movt	r1, #0
    1ee0:	eb0006ee 	bl	3aa0 <printf>
    1ee4:	eb000594 	bl	353c <exit>
    1ee8:	e3041b08 	movw	r1, #19208	; 0x4b08
    1eec:	e3a00001 	mov	r0, #1
    1ef0:	e3401000 	movt	r1, #0
    1ef4:	eb0006e9 	bl	3aa0 <printf>
    1ef8:	eb00058f 	bl	353c <exit>
    1efc:	e3041af0 	movw	r1, #19184	; 0x4af0
    1f00:	e3a00001 	mov	r0, #1
    1f04:	e3401000 	movt	r1, #0
    1f08:	eb0006e4 	bl	3aa0 <printf>
    1f0c:	eb00058a 	bl	353c <exit>
    1f10:	e3041ad0 	movw	r1, #19152	; 0x4ad0
    1f14:	e3a00001 	mov	r0, #1
    1f18:	e3401000 	movt	r1, #0
    1f1c:	eb0006df 	bl	3aa0 <printf>
    1f20:	eb000585 	bl	353c <exit>
    1f24:	e3041ab4 	movw	r1, #19124	; 0x4ab4
    1f28:	e3a00001 	mov	r0, #1
    1f2c:	e3401000 	movt	r1, #0
    1f30:	eb0006da 	bl	3aa0 <printf>
    1f34:	eb000580 	bl	353c <exit>
    1f38:	e3041a98 	movw	r1, #19096	; 0x4a98
    1f3c:	e3a00001 	mov	r0, #1
    1f40:	e3401000 	movt	r1, #0
    1f44:	eb0006d5 	bl	3aa0 <printf>
    1f48:	eb00057b 	bl	353c <exit>
    1f4c:	e3041a78 	movw	r1, #19064	; 0x4a78
    1f50:	e3a00001 	mov	r0, #1
    1f54:	e3401000 	movt	r1, #0
    1f58:	eb0006d0 	bl	3aa0 <printf>
    1f5c:	eb000576 	bl	353c <exit>
    1f60:	e3041a5c 	movw	r1, #19036	; 0x4a5c
    1f64:	e3a00001 	mov	r0, #1
    1f68:	e3401000 	movt	r1, #0
    1f6c:	eb0006cb 	bl	3aa0 <printf>
    1f70:	eb000571 	bl	353c <exit>
    1f74:	e30418e4 	movw	r1, #18660	; 0x48e4
    1f78:	e3a00001 	mov	r0, #1
    1f7c:	e3401000 	movt	r1, #0
    1f80:	eb0006c6 	bl	3aa0 <printf>
    1f84:	eb00056c 	bl	353c <exit>
    1f88:	e30418cc 	movw	r1, #18636	; 0x48cc
    1f8c:	e3a00001 	mov	r0, #1
    1f90:	e3401000 	movt	r1, #0
    1f94:	eb0006c1 	bl	3aa0 <printf>
    1f98:	eb000567 	bl	353c <exit>

00001f9c <bigwrite>:
    1f9c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1fa0:	e3a00001 	mov	r0, #1
    1fa4:	e28db014 	add	fp, sp, #20
    1fa8:	e3047b90 	movw	r7, #19344	; 0x4b90
    1fac:	e3041b80 	movw	r1, #19328	; 0x4b80
    1fb0:	e3401000 	movt	r1, #0
    1fb4:	eb0006b9 	bl	3aa0 <printf>
    1fb8:	e1a00007 	mov	r0, r7
    1fbc:	e3400000 	movt	r0, #0
    1fc0:	e3076fcc 	movw	r6, #32716	; 0x7fcc
    1fc4:	e3406000 	movt	r6, #0
    1fc8:	e30041f3 	movw	r4, #499	; 0x1f3
    1fcc:	e1a07000 	mov	r7, r0
    1fd0:	eb0005e8 	bl	3778 <unlink>
    1fd4:	e3001202 	movw	r1, #514	; 0x202
    1fd8:	e1a00007 	mov	r0, r7
    1fdc:	eb0005cb 	bl	3710 <open>
    1fe0:	e2505000 	subs	r5, r0, #0
    1fe4:	ba000020 	blt	206c <bigwrite+0xd0>
    1fe8:	e1a02004 	mov	r2, r4
    1fec:	e1a01006 	mov	r1, r6
    1ff0:	eb000592 	bl	3640 <write>
    1ff4:	e1500004 	cmp	r0, r4
    1ff8:	1a000014 	bne	2050 <bigwrite+0xb4>
    1ffc:	e1a02004 	mov	r2, r4
    2000:	e1a01006 	mov	r1, r6
    2004:	e1a00005 	mov	r0, r5
    2008:	eb00058c 	bl	3640 <write>
    200c:	e1500004 	cmp	r0, r4
    2010:	1a00000e 	bne	2050 <bigwrite+0xb4>
    2014:	e1a00005 	mov	r0, r5
    2018:	e2844f75 	add	r4, r4, #468	; 0x1d4
    201c:	eb000594 	bl	3674 <close>
    2020:	e2844003 	add	r4, r4, #3
    2024:	e1a00007 	mov	r0, r7
    2028:	eb0005d2 	bl	3778 <unlink>
    202c:	e3013807 	movw	r3, #6151	; 0x1807
    2030:	e1540003 	cmp	r4, r3
    2034:	1affffe6 	bne	1fd4 <bigwrite+0x38>
    2038:	e3041bc8 	movw	r1, #19400	; 0x4bc8
    203c:	e3a00001 	mov	r0, #1
    2040:	e3401000 	movt	r1, #0
    2044:	e24bd014 	sub	sp, fp, #20
    2048:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    204c:	ea000693 	b	3aa0 <printf>
    2050:	e1a03000 	mov	r3, r0
    2054:	e1a02004 	mov	r2, r4
    2058:	e3041bb4 	movw	r1, #19380	; 0x4bb4
    205c:	e3a00001 	mov	r0, #1
    2060:	e3401000 	movt	r1, #0
    2064:	eb00068d 	bl	3aa0 <printf>
    2068:	eb000533 	bl	353c <exit>
    206c:	e3041b9c 	movw	r1, #19356	; 0x4b9c
    2070:	e3a00001 	mov	r0, #1
    2074:	e3401000 	movt	r1, #0
    2078:	eb000688 	bl	3aa0 <printf>
    207c:	eb00052e 	bl	353c <exit>

00002080 <bigfile>:
    2080:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    2084:	e3a00001 	mov	r0, #1
    2088:	e28db01c 	add	fp, sp, #28
    208c:	e3041bd8 	movw	r1, #19416	; 0x4bd8
    2090:	e3401000 	movt	r1, #0
    2094:	eb000681 	bl	3aa0 <printf>
    2098:	e3040be8 	movw	r0, #19432	; 0x4be8
    209c:	e3400000 	movt	r0, #0
    20a0:	eb0005b4 	bl	3778 <unlink>
    20a4:	e3040be8 	movw	r0, #19432	; 0x4be8
    20a8:	e3001202 	movw	r1, #514	; 0x202
    20ac:	e3400000 	movt	r0, #0
    20b0:	eb000596 	bl	3710 <open>
    20b4:	e2506000 	subs	r6, r0, #0
    20b8:	a3075fcc 	movwge	r5, #32716	; 0x7fcc
    20bc:	a3a04000 	movge	r4, #0
    20c0:	a3405000 	movtge	r5, #0
    20c4:	ba000052 	blt	2214 <bigfile+0x194>
    20c8:	e3a02f96 	mov	r2, #600	; 0x258
    20cc:	e1a01004 	mov	r1, r4
    20d0:	e1a00005 	mov	r0, r5
    20d4:	eb0004a1 	bl	3360 <memset>
    20d8:	e3a02f96 	mov	r2, #600	; 0x258
    20dc:	e1a01005 	mov	r1, r5
    20e0:	e1a00006 	mov	r0, r6
    20e4:	eb000555 	bl	3640 <write>
    20e8:	e3500f96 	cmp	r0, #600	; 0x258
    20ec:	1a00003e 	bne	21ec <bigfile+0x16c>
    20f0:	e2844001 	add	r4, r4, #1
    20f4:	e3540014 	cmp	r4, #20
    20f8:	1afffff2 	bne	20c8 <bigfile+0x48>
    20fc:	e1a00006 	mov	r0, r6
    2100:	eb00055b 	bl	3674 <close>
    2104:	e3040be8 	movw	r0, #19432	; 0x4be8
    2108:	e3a01000 	mov	r1, #0
    210c:	e3400000 	movt	r0, #0
    2110:	eb00057e 	bl	3710 <open>
    2114:	e2507000 	subs	r7, r0, #0
    2118:	ba000038 	blt	2200 <bigfile+0x180>
    211c:	e3075fcc 	movw	r5, #32716	; 0x7fcc
    2120:	e3405000 	movt	r5, #0
    2124:	e3a06000 	mov	r6, #0
    2128:	e1a08005 	mov	r8, r5
    212c:	e1a04006 	mov	r4, r6
    2130:	ea000009 	b	215c <bigfile+0xdc>
    2134:	e3500f4b 	cmp	r0, #300	; 0x12c
    2138:	1a000021 	bne	21c4 <bigfile+0x144>
    213c:	e5d53000 	ldrb	r3, [r5]
    2140:	e15300c4 	cmp	r3, r4, asr #1
    2144:	1a000019 	bne	21b0 <bigfile+0x130>
    2148:	e5d5212b 	ldrb	r2, [r5, #299]	; 0x12b
    214c:	e1530002 	cmp	r3, r2
    2150:	1a000016 	bne	21b0 <bigfile+0x130>
    2154:	e2866f4b 	add	r6, r6, #300	; 0x12c
    2158:	e2844001 	add	r4, r4, #1
    215c:	e3a02f4b 	mov	r2, #300	; 0x12c
    2160:	e1a01008 	mov	r1, r8
    2164:	e1a00007 	mov	r0, r7
    2168:	eb000527 	bl	360c <read>
    216c:	e3500000 	cmp	r0, #0
    2170:	ba000018 	blt	21d8 <bigfile+0x158>
    2174:	1affffee 	bne	2134 <bigfile+0xb4>
    2178:	e1a00007 	mov	r0, r7
    217c:	eb00053c 	bl	3674 <close>
    2180:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    2184:	e1560003 	cmp	r6, r3
    2188:	1a000026 	bne	2228 <bigfile+0x1a8>
    218c:	e3040be8 	movw	r0, #19432	; 0x4be8
    2190:	e3400000 	movt	r0, #0
    2194:	eb000577 	bl	3778 <unlink>
    2198:	e3041c9c 	movw	r1, #19612	; 0x4c9c
    219c:	e3a00001 	mov	r0, #1
    21a0:	e3401000 	movt	r1, #0
    21a4:	e24bd01c 	sub	sp, fp, #28
    21a8:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
    21ac:	ea00063b 	b	3aa0 <printf>
    21b0:	e3041c64 	movw	r1, #19556	; 0x4c64
    21b4:	e3a00001 	mov	r0, #1
    21b8:	e3401000 	movt	r1, #0
    21bc:	eb000637 	bl	3aa0 <printf>
    21c0:	eb0004dd 	bl	353c <exit>
    21c4:	e3041c50 	movw	r1, #19536	; 0x4c50
    21c8:	e3a00001 	mov	r0, #1
    21cc:	e3401000 	movt	r1, #0
    21d0:	eb000632 	bl	3aa0 <printf>
    21d4:	eb0004d8 	bl	353c <exit>
    21d8:	e3041c38 	movw	r1, #19512	; 0x4c38
    21dc:	e3a00001 	mov	r0, #1
    21e0:	e3401000 	movt	r1, #0
    21e4:	eb00062d 	bl	3aa0 <printf>
    21e8:	eb0004d3 	bl	353c <exit>
    21ec:	e3041c08 	movw	r1, #19464	; 0x4c08
    21f0:	e3a00001 	mov	r0, #1
    21f4:	e3401000 	movt	r1, #0
    21f8:	eb000628 	bl	3aa0 <printf>
    21fc:	eb0004ce 	bl	353c <exit>
    2200:	e3041c20 	movw	r1, #19488	; 0x4c20
    2204:	e3a00001 	mov	r0, #1
    2208:	e3401000 	movt	r1, #0
    220c:	eb000623 	bl	3aa0 <printf>
    2210:	eb0004c9 	bl	353c <exit>
    2214:	e3041bf0 	movw	r1, #19440	; 0x4bf0
    2218:	e3a00001 	mov	r0, #1
    221c:	e3401000 	movt	r1, #0
    2220:	eb00061e 	bl	3aa0 <printf>
    2224:	eb0004c4 	bl	353c <exit>
    2228:	e3041c80 	movw	r1, #19584	; 0x4c80
    222c:	e3a00001 	mov	r0, #1
    2230:	e3401000 	movt	r1, #0
    2234:	eb000619 	bl	3aa0 <printf>
    2238:	eb0004bf 	bl	353c <exit>

0000223c <fourteen>:
    223c:	e92d4830 	push	{r4, r5, fp, lr}
    2240:	e3a00001 	mov	r0, #1
    2244:	e28db00c 	add	fp, sp, #12
    2248:	e3041cb0 	movw	r1, #19632	; 0x4cb0
    224c:	e3401000 	movt	r1, #0
    2250:	eb000612 	bl	3aa0 <printf>
    2254:	e3040e6c 	movw	r0, #20076	; 0x4e6c
    2258:	e3400000 	movt	r0, #0
    225c:	eb00056c 	bl	3814 <mkdir>
    2260:	e3500000 	cmp	r0, #0
    2264:	1a000022 	bne	22f4 <fourteen+0xb8>
    2268:	e3040ce0 	movw	r0, #19680	; 0x4ce0
    226c:	e3400000 	movt	r0, #0
    2270:	eb000567 	bl	3814 <mkdir>
    2274:	e2504000 	subs	r4, r0, #0
    2278:	1a000036 	bne	2358 <fourteen+0x11c>
    227c:	e3040d30 	movw	r0, #19760	; 0x4d30
    2280:	e3a01c02 	mov	r1, #512	; 0x200
    2284:	e3400000 	movt	r0, #0
    2288:	eb000520 	bl	3710 <open>
    228c:	e3500000 	cmp	r0, #0
    2290:	ba00002b 	blt	2344 <fourteen+0x108>
    2294:	eb0004f6 	bl	3674 <close>
    2298:	e1a01004 	mov	r1, r4
    229c:	e3040da0 	movw	r0, #19872	; 0x4da0
    22a0:	e3400000 	movt	r0, #0
    22a4:	eb000519 	bl	3710 <open>
    22a8:	e3500000 	cmp	r0, #0
    22ac:	ba00001f 	blt	2330 <fourteen+0xf4>
    22b0:	eb0004ef 	bl	3674 <close>
    22b4:	e3040e0c 	movw	r0, #19980	; 0x4e0c
    22b8:	e3400000 	movt	r0, #0
    22bc:	eb000554 	bl	3814 <mkdir>
    22c0:	e3500000 	cmp	r0, #0
    22c4:	0a000014 	beq	231c <fourteen+0xe0>
    22c8:	e3040e5c 	movw	r0, #20060	; 0x4e5c
    22cc:	e3400000 	movt	r0, #0
    22d0:	eb00054f 	bl	3814 <mkdir>
    22d4:	e3500000 	cmp	r0, #0
    22d8:	0a00000a 	beq	2308 <fourteen+0xcc>
    22dc:	e3041eb0 	movw	r1, #20144	; 0x4eb0
    22e0:	e3a00001 	mov	r0, #1
    22e4:	e3401000 	movt	r1, #0
    22e8:	e24bd00c 	sub	sp, fp, #12
    22ec:	e8bd4830 	pop	{r4, r5, fp, lr}
    22f0:	ea0005ea 	b	3aa0 <printf>
    22f4:	e3041cc0 	movw	r1, #19648	; 0x4cc0
    22f8:	e3a00001 	mov	r0, #1
    22fc:	e3401000 	movt	r1, #0
    2300:	eb0005e6 	bl	3aa0 <printf>
    2304:	eb00048c 	bl	353c <exit>
    2308:	e3041e7c 	movw	r1, #20092	; 0x4e7c
    230c:	e3a00001 	mov	r0, #1
    2310:	e3401000 	movt	r1, #0
    2314:	eb0005e1 	bl	3aa0 <printf>
    2318:	eb000487 	bl	353c <exit>
    231c:	e3041e2c 	movw	r1, #20012	; 0x4e2c
    2320:	e3a00001 	mov	r0, #1
    2324:	e3401000 	movt	r1, #0
    2328:	eb0005dc 	bl	3aa0 <printf>
    232c:	eb000482 	bl	353c <exit>
    2330:	e3041dd0 	movw	r1, #19920	; 0x4dd0
    2334:	e3a00001 	mov	r0, #1
    2338:	e3401000 	movt	r1, #0
    233c:	eb0005d7 	bl	3aa0 <printf>
    2340:	eb00047d 	bl	353c <exit>
    2344:	e3041d60 	movw	r1, #19808	; 0x4d60
    2348:	e3a00001 	mov	r0, #1
    234c:	e3401000 	movt	r1, #0
    2350:	eb0005d2 	bl	3aa0 <printf>
    2354:	eb000478 	bl	353c <exit>
    2358:	e3041d00 	movw	r1, #19712	; 0x4d00
    235c:	e3a00001 	mov	r0, #1
    2360:	e3401000 	movt	r1, #0
    2364:	eb0005cd 	bl	3aa0 <printf>
    2368:	eb000473 	bl	353c <exit>

0000236c <rmdot>:
    236c:	e92d4800 	push	{fp, lr}
    2370:	e3a00001 	mov	r0, #1
    2374:	e28db004 	add	fp, sp, #4
    2378:	e3041ec0 	movw	r1, #20160	; 0x4ec0
    237c:	e3401000 	movt	r1, #0
    2380:	eb0005c6 	bl	3aa0 <printf>
    2384:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    2388:	e3400000 	movt	r0, #0
    238c:	eb000520 	bl	3814 <mkdir>
    2390:	e3500000 	cmp	r0, #0
    2394:	1a000028 	bne	243c <rmdot+0xd0>
    2398:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    239c:	e3400000 	movt	r0, #0
    23a0:	eb000528 	bl	3848 <chdir>
    23a4:	e3500000 	cmp	r0, #0
    23a8:	1a000046 	bne	24c8 <rmdot+0x15c>
    23ac:	e304058c 	movw	r0, #17804	; 0x458c
    23b0:	e3400000 	movt	r0, #0
    23b4:	eb0004ef 	bl	3778 <unlink>
    23b8:	e3500000 	cmp	r0, #0
    23bc:	0a00003c 	beq	24b4 <rmdot+0x148>
    23c0:	e30400d0 	movw	r0, #16592	; 0x40d0
    23c4:	e3400000 	movt	r0, #0
    23c8:	eb0004ea 	bl	3778 <unlink>
    23cc:	e3500000 	cmp	r0, #0
    23d0:	0a000032 	beq	24a0 <rmdot+0x134>
    23d4:	e3040f1c 	movw	r0, #20252	; 0x4f1c
    23d8:	e3400000 	movt	r0, #0
    23dc:	eb000519 	bl	3848 <chdir>
    23e0:	e3500000 	cmp	r0, #0
    23e4:	1a000028 	bne	248c <rmdot+0x120>
    23e8:	e3040f30 	movw	r0, #20272	; 0x4f30
    23ec:	e3400000 	movt	r0, #0
    23f0:	eb0004e0 	bl	3778 <unlink>
    23f4:	e3500000 	cmp	r0, #0
    23f8:	0a00001e 	beq	2478 <rmdot+0x10c>
    23fc:	e3040f50 	movw	r0, #20304	; 0x4f50
    2400:	e3400000 	movt	r0, #0
    2404:	eb0004db 	bl	3778 <unlink>
    2408:	e3500000 	cmp	r0, #0
    240c:	0a000014 	beq	2464 <rmdot+0xf8>
    2410:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    2414:	e3400000 	movt	r0, #0
    2418:	eb0004d6 	bl	3778 <unlink>
    241c:	e3500000 	cmp	r0, #0
    2420:	1a00000a 	bne	2450 <rmdot+0xe4>
    2424:	e3041f88 	movw	r1, #20360	; 0x4f88
    2428:	e3a00001 	mov	r0, #1
    242c:	e3401000 	movt	r1, #0
    2430:	e24bd004 	sub	sp, fp, #4
    2434:	e8bd4800 	pop	{fp, lr}
    2438:	ea000598 	b	3aa0 <printf>
    243c:	e3041ed4 	movw	r1, #20180	; 0x4ed4
    2440:	e3a00001 	mov	r0, #1
    2444:	e3401000 	movt	r1, #0
    2448:	eb000594 	bl	3aa0 <printf>
    244c:	eb00043a 	bl	353c <exit>
    2450:	e3041f70 	movw	r1, #20336	; 0x4f70
    2454:	e3a00001 	mov	r0, #1
    2458:	e3401000 	movt	r1, #0
    245c:	eb00058f 	bl	3aa0 <printf>
    2460:	eb000435 	bl	353c <exit>
    2464:	e3041f58 	movw	r1, #20312	; 0x4f58
    2468:	e3a00001 	mov	r0, #1
    246c:	e3401000 	movt	r1, #0
    2470:	eb00058a 	bl	3aa0 <printf>
    2474:	eb000430 	bl	353c <exit>
    2478:	e3041f38 	movw	r1, #20280	; 0x4f38
    247c:	e3a00001 	mov	r0, #1
    2480:	e3401000 	movt	r1, #0
    2484:	eb000585 	bl	3aa0 <printf>
    2488:	eb00042b 	bl	353c <exit>
    248c:	e3041f20 	movw	r1, #20256	; 0x4f20
    2490:	e3a00001 	mov	r0, #1
    2494:	e3401000 	movt	r1, #0
    2498:	eb000580 	bl	3aa0 <printf>
    249c:	eb000426 	bl	353c <exit>
    24a0:	e3041f0c 	movw	r1, #20236	; 0x4f0c
    24a4:	e3a00001 	mov	r0, #1
    24a8:	e3401000 	movt	r1, #0
    24ac:	eb00057b 	bl	3aa0 <printf>
    24b0:	eb000421 	bl	353c <exit>
    24b4:	e3041efc 	movw	r1, #20220	; 0x4efc
    24b8:	e3a00001 	mov	r0, #1
    24bc:	e3401000 	movt	r1, #0
    24c0:	eb000576 	bl	3aa0 <printf>
    24c4:	eb00041c 	bl	353c <exit>
    24c8:	e3041ee8 	movw	r1, #20200	; 0x4ee8
    24cc:	e3a00001 	mov	r0, #1
    24d0:	e3401000 	movt	r1, #0
    24d4:	eb000571 	bl	3aa0 <printf>
    24d8:	eb000417 	bl	353c <exit>

000024dc <dirfile>:
    24dc:	e92d4830 	push	{r4, r5, fp, lr}
    24e0:	e3a00001 	mov	r0, #1
    24e4:	e28db00c 	add	fp, sp, #12
    24e8:	e3041f94 	movw	r1, #20372	; 0x4f94
    24ec:	e3401000 	movt	r1, #0
    24f0:	eb00056a 	bl	3aa0 <printf>
    24f4:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    24f8:	e3a01c02 	mov	r1, #512	; 0x200
    24fc:	e3400000 	movt	r0, #0
    2500:	eb000482 	bl	3710 <open>
    2504:	e3500000 	cmp	r0, #0
    2508:	ba00004a 	blt	2638 <dirfile+0x15c>
    250c:	eb000458 	bl	3674 <close>
    2510:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    2514:	e3400000 	movt	r0, #0
    2518:	eb0004ca 	bl	3848 <chdir>
    251c:	e3500000 	cmp	r0, #0
    2520:	0a00003f 	beq	2624 <dirfile+0x148>
    2524:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    2528:	e3a01000 	mov	r1, #0
    252c:	e3400000 	movt	r0, #0
    2530:	eb000476 	bl	3710 <open>
    2534:	e3500000 	cmp	r0, #0
    2538:	aa000034 	bge	2610 <dirfile+0x134>
    253c:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    2540:	e3a01c02 	mov	r1, #512	; 0x200
    2544:	e3400000 	movt	r0, #0
    2548:	eb000470 	bl	3710 <open>
    254c:	e3500000 	cmp	r0, #0
    2550:	aa00002e 	bge	2610 <dirfile+0x134>
    2554:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    2558:	e3400000 	movt	r0, #0
    255c:	eb0004ac 	bl	3814 <mkdir>
    2560:	e3500000 	cmp	r0, #0
    2564:	0a000051 	beq	26b0 <dirfile+0x1d4>
    2568:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    256c:	e3400000 	movt	r0, #0
    2570:	eb000480 	bl	3778 <unlink>
    2574:	e3500000 	cmp	r0, #0
    2578:	0a000047 	beq	269c <dirfile+0x1c0>
    257c:	e3041fe0 	movw	r1, #20448	; 0x4fe0
    2580:	e305004c 	movw	r0, #20556	; 0x504c
    2584:	e3401000 	movt	r1, #0
    2588:	e3400000 	movt	r0, #0
    258c:	eb000493 	bl	37e0 <link>
    2590:	e3500000 	cmp	r0, #0
    2594:	0a00003b 	beq	2688 <dirfile+0x1ac>
    2598:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    259c:	e3400000 	movt	r0, #0
    25a0:	eb000474 	bl	3778 <unlink>
    25a4:	e2504000 	subs	r4, r0, #0
    25a8:	1a000031 	bne	2674 <dirfile+0x198>
    25ac:	e304058c 	movw	r0, #17804	; 0x458c
    25b0:	e3a01002 	mov	r1, #2
    25b4:	e3400000 	movt	r0, #0
    25b8:	eb000454 	bl	3710 <open>
    25bc:	e3500000 	cmp	r0, #0
    25c0:	aa000026 	bge	2660 <dirfile+0x184>
    25c4:	e1a01004 	mov	r1, r4
    25c8:	e304058c 	movw	r0, #17804	; 0x458c
    25cc:	e3400000 	movt	r0, #0
    25d0:	eb00044e 	bl	3710 <open>
    25d4:	e3041aec 	movw	r1, #19180	; 0x4aec
    25d8:	e3a02001 	mov	r2, #1
    25dc:	e3401000 	movt	r1, #0
    25e0:	e1a04000 	mov	r4, r0
    25e4:	eb000415 	bl	3640 <write>
    25e8:	e3500000 	cmp	r0, #0
    25ec:	ca000016 	bgt	264c <dirfile+0x170>
    25f0:	e1a00004 	mov	r0, r4
    25f4:	eb00041e 	bl	3674 <close>
    25f8:	e30510c0 	movw	r1, #20672	; 0x50c0
    25fc:	e3a00001 	mov	r0, #1
    2600:	e3401000 	movt	r1, #0
    2604:	e24bd00c 	sub	sp, fp, #12
    2608:	e8bd4830 	pop	{r4, r5, fp, lr}
    260c:	ea000523 	b	3aa0 <printf>
    2610:	e3041fec 	movw	r1, #20460	; 0x4fec
    2614:	e3a00001 	mov	r0, #1
    2618:	e3401000 	movt	r1, #0
    261c:	eb00051f 	bl	3aa0 <printf>
    2620:	eb0003c5 	bl	353c <exit>
    2624:	e3041fc4 	movw	r1, #20420	; 0x4fc4
    2628:	e3a00001 	mov	r0, #1
    262c:	e3401000 	movt	r1, #0
    2630:	eb00051a 	bl	3aa0 <printf>
    2634:	eb0003c0 	bl	353c <exit>
    2638:	e3041fac 	movw	r1, #20396	; 0x4fac
    263c:	e3a00001 	mov	r0, #1
    2640:	e3401000 	movt	r1, #0
    2644:	eb000515 	bl	3aa0 <printf>
    2648:	eb0003bb 	bl	353c <exit>
    264c:	e30510ac 	movw	r1, #20652	; 0x50ac
    2650:	e3a00001 	mov	r0, #1
    2654:	e3401000 	movt	r1, #0
    2658:	eb000510 	bl	3aa0 <printf>
    265c:	eb0003b6 	bl	353c <exit>
    2660:	e305108c 	movw	r1, #20620	; 0x508c
    2664:	e3a00001 	mov	r0, #1
    2668:	e3401000 	movt	r1, #0
    266c:	eb00050b 	bl	3aa0 <printf>
    2670:	eb0003b1 	bl	353c <exit>
    2674:	e3051074 	movw	r1, #20596	; 0x5074
    2678:	e3a00001 	mov	r0, #1
    267c:	e3401000 	movt	r1, #0
    2680:	eb000506 	bl	3aa0 <printf>
    2684:	eb0003ac 	bl	353c <exit>
    2688:	e3051054 	movw	r1, #20564	; 0x5054
    268c:	e3a00001 	mov	r0, #1
    2690:	e3401000 	movt	r1, #0
    2694:	eb000501 	bl	3aa0 <printf>
    2698:	eb0003a7 	bl	353c <exit>
    269c:	e305102c 	movw	r1, #20524	; 0x502c
    26a0:	e3a00001 	mov	r0, #1
    26a4:	e3401000 	movt	r1, #0
    26a8:	eb0004fc 	bl	3aa0 <printf>
    26ac:	eb0003a2 	bl	353c <exit>
    26b0:	e305100c 	movw	r1, #20492	; 0x500c
    26b4:	e3a00001 	mov	r0, #1
    26b8:	e3401000 	movt	r1, #0
    26bc:	eb0004f7 	bl	3aa0 <printf>
    26c0:	eb00039d 	bl	353c <exit>

000026c4 <iref>:
    26c4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    26c8:	e30510d0 	movw	r1, #20688	; 0x50d0
    26cc:	e28db014 	add	fp, sp, #20
    26d0:	e3a00001 	mov	r0, #1
    26d4:	e3401000 	movt	r1, #0
    26d8:	e30560e4 	movw	r6, #20708	; 0x50e4
    26dc:	eb0004ef 	bl	3aa0 <printf>
    26e0:	e3044eac 	movw	r4, #20140	; 0x4eac
    26e4:	e305704c 	movw	r7, #20556	; 0x504c
    26e8:	e3406000 	movt	r6, #0
    26ec:	e3404000 	movt	r4, #0
    26f0:	e3407000 	movt	r7, #0
    26f4:	e3a05033 	mov	r5, #51	; 0x33
    26f8:	e1a00006 	mov	r0, r6
    26fc:	eb000444 	bl	3814 <mkdir>
    2700:	e3500000 	cmp	r0, #0
    2704:	1a000023 	bne	2798 <iref+0xd4>
    2708:	e1a00006 	mov	r0, r6
    270c:	eb00044d 	bl	3848 <chdir>
    2710:	e3500000 	cmp	r0, #0
    2714:	1a000024 	bne	27ac <iref+0xe8>
    2718:	e1a00004 	mov	r0, r4
    271c:	eb00043c 	bl	3814 <mkdir>
    2720:	e1a01004 	mov	r1, r4
    2724:	e1a00007 	mov	r0, r7
    2728:	eb00042c 	bl	37e0 <link>
    272c:	e3a01c02 	mov	r1, #512	; 0x200
    2730:	e1a00004 	mov	r0, r4
    2734:	eb0003f5 	bl	3710 <open>
    2738:	e3500000 	cmp	r0, #0
    273c:	ba000000 	blt	2744 <iref+0x80>
    2740:	eb0003cb 	bl	3674 <close>
    2744:	e3040fe8 	movw	r0, #20456	; 0x4fe8
    2748:	e3a01c02 	mov	r1, #512	; 0x200
    274c:	e3400000 	movt	r0, #0
    2750:	eb0003ee 	bl	3710 <open>
    2754:	e3500000 	cmp	r0, #0
    2758:	ba000000 	blt	2760 <iref+0x9c>
    275c:	eb0003c4 	bl	3674 <close>
    2760:	e3040fe8 	movw	r0, #20456	; 0x4fe8
    2764:	e3400000 	movt	r0, #0
    2768:	eb000402 	bl	3778 <unlink>
    276c:	e2555001 	subs	r5, r5, #1
    2770:	1affffe0 	bne	26f8 <iref+0x34>
    2774:	e3040f1c 	movw	r0, #20252	; 0x4f1c
    2778:	e3400000 	movt	r0, #0
    277c:	eb000431 	bl	3848 <chdir>
    2780:	e3051114 	movw	r1, #20756	; 0x5114
    2784:	e3a00001 	mov	r0, #1
    2788:	e3401000 	movt	r1, #0
    278c:	e24bd014 	sub	sp, fp, #20
    2790:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    2794:	ea0004c1 	b	3aa0 <printf>
    2798:	e30510ec 	movw	r1, #20716	; 0x50ec
    279c:	e3a00001 	mov	r0, #1
    27a0:	e3401000 	movt	r1, #0
    27a4:	eb0004bd 	bl	3aa0 <printf>
    27a8:	eb000363 	bl	353c <exit>
    27ac:	e3051100 	movw	r1, #20736	; 0x5100
    27b0:	e3a00001 	mov	r0, #1
    27b4:	e3401000 	movt	r1, #0
    27b8:	eb0004b8 	bl	3aa0 <printf>
    27bc:	eb00035e 	bl	353c <exit>

000027c0 <forktest>:
    27c0:	e92d4830 	push	{r4, r5, fp, lr}
    27c4:	e3051128 	movw	r1, #20776	; 0x5128
    27c8:	e28db00c 	add	fp, sp, #12
    27cc:	e3a00001 	mov	r0, #1
    27d0:	e3401000 	movt	r1, #0
    27d4:	e3a04000 	mov	r4, #0
    27d8:	eb0004b0 	bl	3aa0 <printf>
    27dc:	ea000003 	b	27f0 <forktest+0x30>
    27e0:	0a00001e 	beq	2860 <forktest+0xa0>
    27e4:	e2844001 	add	r4, r4, #1
    27e8:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    27ec:	0a000012 	beq	283c <forktest+0x7c>
    27f0:	eb000344 	bl	3508 <fork>
    27f4:	e3500000 	cmp	r0, #0
    27f8:	aafffff8 	bge	27e0 <forktest+0x20>
    27fc:	e3540000 	cmp	r4, #0
    2800:	0a000004 	beq	2818 <forktest+0x58>
    2804:	eb000359 	bl	3570 <wait>
    2808:	e3500000 	cmp	r0, #0
    280c:	ba00000f 	blt	2850 <forktest+0x90>
    2810:	e2544001 	subs	r4, r4, #1
    2814:	1afffffa 	bne	2804 <forktest+0x44>
    2818:	eb000354 	bl	3570 <wait>
    281c:	e3700001 	cmn	r0, #1
    2820:	1a00000f 	bne	2864 <forktest+0xa4>
    2824:	e305115c 	movw	r1, #20828	; 0x515c
    2828:	e3a00001 	mov	r0, #1
    282c:	e3401000 	movt	r1, #0
    2830:	e24bd00c 	sub	sp, fp, #12
    2834:	e8bd4830 	pop	{r4, r5, fp, lr}
    2838:	ea000498 	b	3aa0 <printf>
    283c:	e305116c 	movw	r1, #20844	; 0x516c
    2840:	e3a00001 	mov	r0, #1
    2844:	e3401000 	movt	r1, #0
    2848:	eb000494 	bl	3aa0 <printf>
    284c:	eb00033a 	bl	353c <exit>
    2850:	e3051134 	movw	r1, #20788	; 0x5134
    2854:	e3a00001 	mov	r0, #1
    2858:	e3401000 	movt	r1, #0
    285c:	eb00048f 	bl	3aa0 <printf>
    2860:	eb000335 	bl	353c <exit>
    2864:	e3051148 	movw	r1, #20808	; 0x5148
    2868:	e3a00001 	mov	r0, #1
    286c:	e3401000 	movt	r1, #0
    2870:	eb00048a 	bl	3aa0 <printf>
    2874:	eb000330 	bl	353c <exit>

00002878 <sbrktest>:
    2878:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    287c:	e3057814 	movw	r7, #22548	; 0x5814
    2880:	e3407000 	movt	r7, #0
    2884:	e28db01c 	add	fp, sp, #28
    2888:	e3a05000 	mov	r5, #0
    288c:	e24dd028 	sub	sp, sp, #40	; 0x28
    2890:	e3051190 	movw	r1, #20880	; 0x5190
    2894:	e3401000 	movt	r1, #0
    2898:	e5970000 	ldr	r0, [r7]
    289c:	eb00047f 	bl	3aa0 <printf>
    28a0:	e1a00005 	mov	r0, r5
    28a4:	eb00040e 	bl	38e4 <sbrk>
    28a8:	e305119c 	movw	r1, #20892	; 0x519c
    28ac:	e3401000 	movt	r1, #0
    28b0:	e3a09001 	mov	r9, #1
    28b4:	e3016388 	movw	r6, #5000	; 0x1388
    28b8:	e1a08000 	mov	r8, r0
    28bc:	e5970000 	ldr	r0, [r7]
    28c0:	eb000476 	bl	3aa0 <printf>
    28c4:	e1a00005 	mov	r0, r5
    28c8:	eb000405 	bl	38e4 <sbrk>
    28cc:	e1a04000 	mov	r4, r0
    28d0:	ea000000 	b	28d8 <sbrktest+0x60>
    28d4:	e1a04001 	mov	r4, r1
    28d8:	e3a00001 	mov	r0, #1
    28dc:	eb000400 	bl	38e4 <sbrk>
    28e0:	e1500004 	cmp	r0, r4
    28e4:	1a0000f6 	bne	2cc4 <sbrktest+0x44c>
    28e8:	e2855001 	add	r5, r5, #1
    28ec:	e1a01004 	mov	r1, r4
    28f0:	e1550006 	cmp	r5, r6
    28f4:	e4c19001 	strb	r9, [r1], #1
    28f8:	1afffff5 	bne	28d4 <sbrktest+0x5c>
    28fc:	e5970000 	ldr	r0, [r7]
    2900:	e30511dc 	movw	r1, #20956	; 0x51dc
    2904:	e3401000 	movt	r1, #0
    2908:	eb000464 	bl	3aa0 <printf>
    290c:	e5970000 	ldr	r0, [r7]
    2910:	e30511ec 	movw	r1, #20972	; 0x51ec
    2914:	e3401000 	movt	r1, #0
    2918:	eb000460 	bl	3aa0 <printf>
    291c:	eb0002f9 	bl	3508 <fork>
    2920:	e2505000 	subs	r5, r0, #0
    2924:	ba0000ef 	blt	2ce8 <sbrktest+0x470>
    2928:	e5970000 	ldr	r0, [r7]
    292c:	e3051218 	movw	r1, #21016	; 0x5218
    2930:	e3401000 	movt	r1, #0
    2934:	e2844002 	add	r4, r4, #2
    2938:	eb000458 	bl	3aa0 <printf>
    293c:	e5970000 	ldr	r0, [r7]
    2940:	e3051228 	movw	r1, #21032	; 0x5228
    2944:	e3401000 	movt	r1, #0
    2948:	eb000454 	bl	3aa0 <printf>
    294c:	e3a00001 	mov	r0, #1
    2950:	eb0003e3 	bl	38e4 <sbrk>
    2954:	e3a00001 	mov	r0, #1
    2958:	eb0003e1 	bl	38e4 <sbrk>
    295c:	e1540000 	cmp	r4, r0
    2960:	1a0000e5 	bne	2cfc <sbrktest+0x484>
    2964:	e3550000 	cmp	r5, #0
    2968:	0a0000ec 	beq	2d20 <sbrktest+0x4a8>
    296c:	eb0002ff 	bl	3570 <wait>
    2970:	e5970000 	ldr	r0, [r7]
    2974:	e3051258 	movw	r1, #21080	; 0x5258
    2978:	e3401000 	movt	r1, #0
    297c:	eb000447 	bl	3aa0 <printf>
    2980:	e5970000 	ldr	r0, [r7]
    2984:	e3051268 	movw	r1, #21096	; 0x5268
    2988:	e3401000 	movt	r1, #0
    298c:	eb000443 	bl	3aa0 <printf>
    2990:	e3a00000 	mov	r0, #0
    2994:	eb0003d2 	bl	38e4 <sbrk>
    2998:	e1a04000 	mov	r4, r0
    299c:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    29a0:	eb0003cf 	bl	38e4 <sbrk>
    29a4:	e1540000 	cmp	r4, r0
    29a8:	1a0000d8 	bne	2d10 <sbrktest+0x498>
    29ac:	e30f3fff 	movw	r3, #65535	; 0xffff
    29b0:	e340363f 	movt	r3, #1599	; 0x63f
    29b4:	e3a02063 	mov	r2, #99	; 0x63
    29b8:	e30512d8 	movw	r1, #21208	; 0x52d8
    29bc:	e5c32000 	strb	r2, [r3]
    29c0:	e3401000 	movt	r1, #0
    29c4:	e5970000 	ldr	r0, [r7]
    29c8:	eb000434 	bl	3aa0 <printf>
    29cc:	e5970000 	ldr	r0, [r7]
    29d0:	e30512e8 	movw	r1, #21224	; 0x52e8
    29d4:	e3401000 	movt	r1, #0
    29d8:	eb000430 	bl	3aa0 <printf>
    29dc:	e3a00000 	mov	r0, #0
    29e0:	eb0003bf 	bl	38e4 <sbrk>
    29e4:	e1a04000 	mov	r4, r0
    29e8:	e3a00a0f 	mov	r0, #61440	; 0xf000
    29ec:	e34f0fff 	movt	r0, #65535	; 0xffff
    29f0:	eb0003bb 	bl	38e4 <sbrk>
    29f4:	e3700001 	cmn	r0, #1
    29f8:	0a0000c9 	beq	2d24 <sbrktest+0x4ac>
    29fc:	e3a00000 	mov	r0, #0
    2a00:	eb0003b7 	bl	38e4 <sbrk>
    2a04:	e2442a01 	sub	r2, r4, #4096	; 0x1000
    2a08:	e1500002 	cmp	r0, r2
    2a0c:	e1a03000 	mov	r3, r0
    2a10:	1a0000c8 	bne	2d38 <sbrktest+0x4c0>
    2a14:	e5970000 	ldr	r0, [r7]
    2a18:	e3051354 	movw	r1, #21332	; 0x5354
    2a1c:	e3401000 	movt	r1, #0
    2a20:	eb00041e 	bl	3aa0 <printf>
    2a24:	e5970000 	ldr	r0, [r7]
    2a28:	e3051364 	movw	r1, #21348	; 0x5364
    2a2c:	e3401000 	movt	r1, #0
    2a30:	eb00041a 	bl	3aa0 <printf>
    2a34:	e3a00000 	mov	r0, #0
    2a38:	eb0003a9 	bl	38e4 <sbrk>
    2a3c:	e1a04000 	mov	r4, r0
    2a40:	e3a00a01 	mov	r0, #4096	; 0x1000
    2a44:	eb0003a6 	bl	38e4 <sbrk>
    2a48:	e1540000 	cmp	r4, r0
    2a4c:	e1a05000 	mov	r5, r0
    2a50:	1a0000be 	bne	2d50 <sbrktest+0x4d8>
    2a54:	e3a00000 	mov	r0, #0
    2a58:	eb0003a1 	bl	38e4 <sbrk>
    2a5c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    2a60:	e1530000 	cmp	r3, r0
    2a64:	1a0000b9 	bne	2d50 <sbrktest+0x4d8>
    2a68:	e30f3fff 	movw	r3, #65535	; 0xffff
    2a6c:	e340363f 	movt	r3, #1599	; 0x63f
    2a70:	e5d33000 	ldrb	r3, [r3]
    2a74:	e3530063 	cmp	r3, #99	; 0x63
    2a78:	0a0000bb 	beq	2d6c <sbrktest+0x4f4>
    2a7c:	e5970000 	ldr	r0, [r7]
    2a80:	e30513d8 	movw	r1, #21464	; 0x53d8
    2a84:	e3401000 	movt	r1, #0
    2a88:	eb000404 	bl	3aa0 <printf>
    2a8c:	e5970000 	ldr	r0, [r7]
    2a90:	e30513e8 	movw	r1, #21480	; 0x53e8
    2a94:	e3401000 	movt	r1, #0
    2a98:	eb000400 	bl	3aa0 <printf>
    2a9c:	e3a00000 	mov	r0, #0
    2aa0:	eb00038f 	bl	38e4 <sbrk>
    2aa4:	e1a04000 	mov	r4, r0
    2aa8:	e3a00000 	mov	r0, #0
    2aac:	eb00038c 	bl	38e4 <sbrk>
    2ab0:	e0480000 	sub	r0, r8, r0
    2ab4:	eb00038a 	bl	38e4 <sbrk>
    2ab8:	e1540000 	cmp	r4, r0
    2abc:	e1a03000 	mov	r3, r0
    2ac0:	1a0000ae 	bne	2d80 <sbrktest+0x508>
    2ac4:	e5970000 	ldr	r0, [r7]
    2ac8:	e3051420 	movw	r1, #21536	; 0x5420
    2acc:	e3401000 	movt	r1, #0
    2ad0:	e3085480 	movw	r5, #33920	; 0x8480
    2ad4:	eb0003f1 	bl	3aa0 <printf>
    2ad8:	e3051430 	movw	r1, #21552	; 0x5430
    2adc:	e5970000 	ldr	r0, [r7]
    2ae0:	e3401000 	movt	r1, #0
    2ae4:	eb0003ed 	bl	3aa0 <printf>
    2ae8:	e348501e 	movt	r5, #32798	; 0x801e
    2aec:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
    2af0:	e30c9350 	movw	r9, #50000	; 0xc350
    2af4:	eb00036d 	bl	38b0 <getpid>
    2af8:	e1a06000 	mov	r6, r0
    2afc:	eb000281 	bl	3508 <fork>
    2b00:	e3500000 	cmp	r0, #0
    2b04:	ba0000a3 	blt	2d98 <sbrktest+0x520>
    2b08:	0a0000a7 	beq	2dac <sbrktest+0x534>
    2b0c:	e0844009 	add	r4, r4, r9
    2b10:	eb000296 	bl	3570 <wait>
    2b14:	e1540005 	cmp	r4, r5
    2b18:	1afffff5 	bne	2af4 <sbrktest+0x27c>
    2b1c:	e5970000 	ldr	r0, [r7]
    2b20:	e3051470 	movw	r1, #21616	; 0x5470
    2b24:	e3401000 	movt	r1, #0
    2b28:	eb0003dc 	bl	3aa0 <printf>
    2b2c:	e5970000 	ldr	r0, [r7]
    2b30:	e3051480 	movw	r1, #21632	; 0x5480
    2b34:	e3401000 	movt	r1, #0
    2b38:	eb0003d8 	bl	3aa0 <printf>
    2b3c:	e24b0038 	sub	r0, fp, #56	; 0x38
    2b40:	eb0002a4 	bl	35d8 <pipe>
    2b44:	e2506000 	subs	r6, r0, #0
    2b48:	1a0000a0 	bne	2dd0 <sbrktest+0x558>
    2b4c:	e5970000 	ldr	r0, [r7]
    2b50:	e30514b0 	movw	r1, #21680	; 0x54b0
    2b54:	e3401000 	movt	r1, #0
    2b58:	e24b5030 	sub	r5, fp, #48	; 0x30
    2b5c:	eb0003cf 	bl	3aa0 <printf>
    2b60:	e30514c0 	movw	r1, #21696	; 0x54c0
    2b64:	e5970000 	ldr	r0, [r7]
    2b68:	e3401000 	movt	r1, #0
    2b6c:	eb0003cb 	bl	3aa0 <printf>
    2b70:	e1a09005 	mov	r9, r5
    2b74:	eb000263 	bl	3508 <fork>
    2b78:	e3500000 	cmp	r0, #0
    2b7c:	e1a04000 	mov	r4, r0
    2b80:	e4890004 	str	r0, [r9], #4
    2b84:	0a000038 	beq	2c6c <sbrktest+0x3f4>
    2b88:	e3700001 	cmn	r0, #1
    2b8c:	0a000003 	beq	2ba0 <sbrktest+0x328>
    2b90:	e3a02001 	mov	r2, #1
    2b94:	e24b1039 	sub	r1, fp, #57	; 0x39
    2b98:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    2b9c:	eb00029a 	bl	360c <read>
    2ba0:	e2866001 	add	r6, r6, #1
    2ba4:	e3560005 	cmp	r6, #5
    2ba8:	1afffff1 	bne	2b74 <sbrktest+0x2fc>
    2bac:	e5970000 	ldr	r0, [r7]
    2bb0:	e30514f0 	movw	r1, #21744	; 0x54f0
    2bb4:	e3401000 	movt	r1, #0
    2bb8:	e24b401c 	sub	r4, fp, #28
    2bbc:	eb0003b7 	bl	3aa0 <printf>
    2bc0:	e5970000 	ldr	r0, [r7]
    2bc4:	e3051500 	movw	r1, #21760	; 0x5500
    2bc8:	e3401000 	movt	r1, #0
    2bcc:	eb0003b3 	bl	3aa0 <printf>
    2bd0:	e3a00a01 	mov	r0, #4096	; 0x1000
    2bd4:	eb000342 	bl	38e4 <sbrk>
    2bd8:	e1a06000 	mov	r6, r0
    2bdc:	e4950004 	ldr	r0, [r5], #4
    2be0:	e3700001 	cmn	r0, #1
    2be4:	0a000001 	beq	2bf0 <sbrktest+0x378>
    2be8:	eb0002ae 	bl	36a8 <kill>
    2bec:	eb00025f 	bl	3570 <wait>
    2bf0:	e1540005 	cmp	r4, r5
    2bf4:	1afffff8 	bne	2bdc <sbrktest+0x364>
    2bf8:	e5970000 	ldr	r0, [r7]
    2bfc:	e3051520 	movw	r1, #21792	; 0x5520
    2c00:	e3401000 	movt	r1, #0
    2c04:	eb0003a5 	bl	3aa0 <printf>
    2c08:	e3051530 	movw	r1, #21808	; 0x5530
    2c0c:	e5970000 	ldr	r0, [r7]
    2c10:	e3401000 	movt	r1, #0
    2c14:	eb0003a1 	bl	3aa0 <printf>
    2c18:	e3760001 	cmn	r6, #1
    2c1c:	0a000023 	beq	2cb0 <sbrktest+0x438>
    2c20:	e5970000 	ldr	r0, [r7]
    2c24:	e3051568 	movw	r1, #21864	; 0x5568
    2c28:	e3401000 	movt	r1, #0
    2c2c:	eb00039b 	bl	3aa0 <printf>
    2c30:	e3a00000 	mov	r0, #0
    2c34:	eb00032a 	bl	38e4 <sbrk>
    2c38:	e1580000 	cmp	r8, r0
    2c3c:	3a000005 	bcc	2c58 <sbrktest+0x3e0>
    2c40:	e5970000 	ldr	r0, [r7]
    2c44:	e3051578 	movw	r1, #21880	; 0x5578
    2c48:	e3401000 	movt	r1, #0
    2c4c:	eb000393 	bl	3aa0 <printf>
    2c50:	e24bd01c 	sub	sp, fp, #28
    2c54:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    2c58:	e3a00000 	mov	r0, #0
    2c5c:	eb000320 	bl	38e4 <sbrk>
    2c60:	e0480000 	sub	r0, r8, r0
    2c64:	eb00031e 	bl	38e4 <sbrk>
    2c68:	eafffff4 	b	2c40 <sbrktest+0x3c8>
    2c6c:	e1a02006 	mov	r2, r6
    2c70:	e5970000 	ldr	r0, [r7]
    2c74:	e30514e0 	movw	r1, #21728	; 0x54e0
    2c78:	e3401000 	movt	r1, #0
    2c7c:	eb000387 	bl	3aa0 <printf>
    2c80:	e1a00004 	mov	r0, r4
    2c84:	eb000316 	bl	38e4 <sbrk>
    2c88:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2c8c:	eb000314 	bl	38e4 <sbrk>
    2c90:	e3041aec 	movw	r1, #19180	; 0x4aec
    2c94:	e3a02001 	mov	r2, #1
    2c98:	e3401000 	movt	r1, #0
    2c9c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    2ca0:	eb000266 	bl	3640 <write>
    2ca4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    2ca8:	eb00031a 	bl	3918 <sleep>
    2cac:	eafffffc 	b	2ca4 <sbrktest+0x42c>
    2cb0:	e5970000 	ldr	r0, [r7]
    2cb4:	e305154c 	movw	r1, #21836	; 0x554c
    2cb8:	e3401000 	movt	r1, #0
    2cbc:	eb000377 	bl	3aa0 <printf>
    2cc0:	eb00021d 	bl	353c <exit>
    2cc4:	e597c000 	ldr	ip, [r7]
    2cc8:	e1a03004 	mov	r3, r4
    2ccc:	e58d0000 	str	r0, [sp]
    2cd0:	e1a02005 	mov	r2, r5
    2cd4:	e30511c0 	movw	r1, #20928	; 0x51c0
    2cd8:	e3401000 	movt	r1, #0
    2cdc:	e1a0000c 	mov	r0, ip
    2ce0:	eb00036e 	bl	3aa0 <printf>
    2ce4:	eb000214 	bl	353c <exit>
    2ce8:	e5970000 	ldr	r0, [r7]
    2cec:	e3051200 	movw	r1, #20992	; 0x5200
    2cf0:	e3401000 	movt	r1, #0
    2cf4:	eb000369 	bl	3aa0 <printf>
    2cf8:	eb00020f 	bl	353c <exit>
    2cfc:	e5970000 	ldr	r0, [r7]
    2d00:	e305123c 	movw	r1, #21052	; 0x523c
    2d04:	e3401000 	movt	r1, #0
    2d08:	eb000364 	bl	3aa0 <printf>
    2d0c:	eb00020a 	bl	353c <exit>
    2d10:	e3051298 	movw	r1, #21144	; 0x5298
    2d14:	e5970000 	ldr	r0, [r7]
    2d18:	e3401000 	movt	r1, #0
    2d1c:	eb00035f 	bl	3aa0 <printf>
    2d20:	eb000205 	bl	353c <exit>
    2d24:	e5970000 	ldr	r0, [r7]
    2d28:	e3051300 	movw	r1, #21248	; 0x5300
    2d2c:	e3401000 	movt	r1, #0
    2d30:	eb00035a 	bl	3aa0 <printf>
    2d34:	eb000200 	bl	353c <exit>
    2d38:	e1a02004 	mov	r2, r4
    2d3c:	e5970000 	ldr	r0, [r7]
    2d40:	e305131c 	movw	r1, #21276	; 0x531c
    2d44:	e3401000 	movt	r1, #0
    2d48:	eb000354 	bl	3aa0 <printf>
    2d4c:	eb0001fa 	bl	353c <exit>
    2d50:	e1a03005 	mov	r3, r5
    2d54:	e1a02004 	mov	r2, r4
    2d58:	e5970000 	ldr	r0, [r7]
    2d5c:	e3051380 	movw	r1, #21376	; 0x5380
    2d60:	e3401000 	movt	r1, #0
    2d64:	eb00034d 	bl	3aa0 <printf>
    2d68:	eb0001f3 	bl	353c <exit>
    2d6c:	e5970000 	ldr	r0, [r7]
    2d70:	e30513a8 	movw	r1, #21416	; 0x53a8
    2d74:	e3401000 	movt	r1, #0
    2d78:	eb000348 	bl	3aa0 <printf>
    2d7c:	eb0001ee 	bl	353c <exit>
    2d80:	e1a02004 	mov	r2, r4
    2d84:	e5970000 	ldr	r0, [r7]
    2d88:	e30513fc 	movw	r1, #21500	; 0x53fc
    2d8c:	e3401000 	movt	r1, #0
    2d90:	eb000342 	bl	3aa0 <printf>
    2d94:	eb0001e8 	bl	353c <exit>
    2d98:	e5970000 	ldr	r0, [r7]
    2d9c:	e3051718 	movw	r1, #22296	; 0x5718
    2da0:	e3401000 	movt	r1, #0
    2da4:	eb00033d 	bl	3aa0 <printf>
    2da8:	eb0001e3 	bl	353c <exit>
    2dac:	e5970000 	ldr	r0, [r7]
    2db0:	e1a02004 	mov	r2, r4
    2db4:	e5d43000 	ldrb	r3, [r4]
    2db8:	e3051454 	movw	r1, #21588	; 0x5454
    2dbc:	e3401000 	movt	r1, #0
    2dc0:	eb000336 	bl	3aa0 <printf>
    2dc4:	e1a00006 	mov	r0, r6
    2dc8:	eb000236 	bl	36a8 <kill>
    2dcc:	eb0001da 	bl	353c <exit>
    2dd0:	e304111c 	movw	r1, #16668	; 0x411c
    2dd4:	e3a00001 	mov	r0, #1
    2dd8:	e3401000 	movt	r1, #0
    2ddc:	eb00032f 	bl	3aa0 <printf>
    2de0:	eb0001d5 	bl	353c <exit>

00002de4 <validateint>:
    2de4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2de8:	e28db000 	add	fp, sp, #0
    2dec:	e5900000 	ldr	r0, [r0]
    2df0:	e28bd000 	add	sp, fp, #0
    2df4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    2df8:	ea0002c6 	b	3918 <sleep>

00002dfc <validatetest>:
    2dfc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    2e00:	e3057814 	movw	r7, #22548	; 0x5814
    2e04:	e3407000 	movt	r7, #0
    2e08:	e28db014 	add	fp, sp, #20
    2e0c:	e3051588 	movw	r1, #21896	; 0x5588
    2e10:	e3401000 	movt	r1, #0
    2e14:	e5970000 	ldr	r0, [r7]
    2e18:	e3056598 	movw	r6, #21912	; 0x5598
    2e1c:	eb00031f 	bl	3aa0 <printf>
    2e20:	e3406000 	movt	r6, #0
    2e24:	e3a04000 	mov	r4, #0
    2e28:	eb0001b6 	bl	3508 <fork>
    2e2c:	e2505000 	subs	r5, r0, #0
    2e30:	0a000014 	beq	2e88 <validatetest+0x8c>
    2e34:	e3a00000 	mov	r0, #0
    2e38:	eb0002b6 	bl	3918 <sleep>
    2e3c:	e3a00000 	mov	r0, #0
    2e40:	eb0002b4 	bl	3918 <sleep>
    2e44:	e1a00005 	mov	r0, r5
    2e48:	eb000216 	bl	36a8 <kill>
    2e4c:	eb0001c7 	bl	3570 <wait>
    2e50:	e1a01004 	mov	r1, r4
    2e54:	e1a00006 	mov	r0, r6
    2e58:	eb000260 	bl	37e0 <link>
    2e5c:	e3700001 	cmn	r0, #1
    2e60:	1a00000b 	bne	2e94 <validatetest+0x98>
    2e64:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2e68:	e3540945 	cmp	r4, #1130496	; 0x114000
    2e6c:	1affffed 	bne	2e28 <validatetest+0x2c>
    2e70:	e5970000 	ldr	r0, [r7]
    2e74:	e30515c0 	movw	r1, #21952	; 0x55c0
    2e78:	e3401000 	movt	r1, #0
    2e7c:	e24bd014 	sub	sp, fp, #20
    2e80:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    2e84:	ea000305 	b	3aa0 <printf>
    2e88:	e5940000 	ldr	r0, [r4]
    2e8c:	eb0002a1 	bl	3918 <sleep>
    2e90:	eb0001a9 	bl	353c <exit>
    2e94:	e5970000 	ldr	r0, [r7]
    2e98:	e30515a4 	movw	r1, #21924	; 0x55a4
    2e9c:	e3401000 	movt	r1, #0
    2ea0:	eb0002fe 	bl	3aa0 <printf>
    2ea4:	eb0001a4 	bl	353c <exit>

00002ea8 <bsstest>:
    2ea8:	e92d4830 	push	{r4, r5, fp, lr}
    2eac:	e3054814 	movw	r4, #22548	; 0x5814
    2eb0:	e3404000 	movt	r4, #0
    2eb4:	e28db00c 	add	fp, sp, #12
    2eb8:	e30515d0 	movw	r1, #21968	; 0x55d0
    2ebc:	e3401000 	movt	r1, #0
    2ec0:	e5940000 	ldr	r0, [r4]
    2ec4:	eb0002f5 	bl	3aa0 <printf>
    2ec8:	e30538bc 	movw	r3, #22716	; 0x58bc
    2ecc:	e3403000 	movt	r3, #0
    2ed0:	e5d32000 	ldrb	r2, [r3]
    2ed4:	e3520000 	cmp	r2, #0
    2ed8:	1a00000b 	bne	2f0c <bsstest+0x64>
    2edc:	e59f103c 	ldr	r1, [pc, #60]	; 2f20 <bsstest+0x78>
    2ee0:	e5f32001 	ldrb	r2, [r3, #1]!
    2ee4:	e3520000 	cmp	r2, #0
    2ee8:	1a000007 	bne	2f0c <bsstest+0x64>
    2eec:	e1530001 	cmp	r3, r1
    2ef0:	1afffffa 	bne	2ee0 <bsstest+0x38>
    2ef4:	e5940000 	ldr	r0, [r4]
    2ef8:	e30515f0 	movw	r1, #22000	; 0x55f0
    2efc:	e3401000 	movt	r1, #0
    2f00:	e24bd00c 	sub	sp, fp, #12
    2f04:	e8bd4830 	pop	{r4, r5, fp, lr}
    2f08:	ea0002e4 	b	3aa0 <printf>
    2f0c:	e5940000 	ldr	r0, [r4]
    2f10:	e30515dc 	movw	r1, #21980	; 0x55dc
    2f14:	e3401000 	movt	r1, #0
    2f18:	eb0002e0 	bl	3aa0 <printf>
    2f1c:	eb000186 	bl	353c <exit>
    2f20:	00007fcb 	.word	0x00007fcb

00002f24 <bigargtest>:
    2f24:	e92d4830 	push	{r4, r5, fp, lr}
    2f28:	e3050600 	movw	r0, #22016	; 0x5600
    2f2c:	e28db00c 	add	fp, sp, #12
    2f30:	e3400000 	movt	r0, #0
    2f34:	eb00020f 	bl	3778 <unlink>
    2f38:	eb000172 	bl	3508 <fork>
    2f3c:	e3500000 	cmp	r0, #0
    2f40:	0a00000d 	beq	2f7c <bigargtest+0x58>
    2f44:	ba000032 	blt	3014 <bigargtest+0xf0>
    2f48:	eb000188 	bl	3570 <wait>
    2f4c:	e3050600 	movw	r0, #22016	; 0x5600
    2f50:	e3a01000 	mov	r1, #0
    2f54:	e3400000 	movt	r0, #0
    2f58:	eb0001ec 	bl	3710 <open>
    2f5c:	e3500000 	cmp	r0, #0
    2f60:	ba000024 	blt	2ff8 <bigargtest+0xd4>
    2f64:	eb0001c2 	bl	3674 <close>
    2f68:	e3050600 	movw	r0, #22016	; 0x5600
    2f6c:	e3400000 	movt	r0, #0
    2f70:	e24bd00c 	sub	sp, fp, #12
    2f74:	e8bd4830 	pop	{r4, r5, fp, lr}
    2f78:	ea0001fe 	b	3778 <unlink>
    2f7c:	e59f30ac 	ldr	r3, [pc, #172]	; 3030 <bigargtest+0x10c>
    2f80:	e305260c 	movw	r2, #22028	; 0x560c
    2f84:	e3402000 	movt	r2, #0
    2f88:	e283107c 	add	r1, r3, #124	; 0x7c
    2f8c:	e5a32004 	str	r2, [r3, #4]!
    2f90:	e1530001 	cmp	r3, r1
    2f94:	1afffffc 	bne	2f8c <bigargtest+0x68>
    2f98:	e3054814 	movw	r4, #22548	; 0x5814
    2f9c:	e3404000 	movt	r4, #0
    2fa0:	e3055830 	movw	r5, #22576	; 0x5830
    2fa4:	e3405000 	movt	r5, #0
    2fa8:	e5940000 	ldr	r0, [r4]
    2fac:	e30516ec 	movw	r1, #22252	; 0x56ec
    2fb0:	e3401000 	movt	r1, #0
    2fb4:	e3a03000 	mov	r3, #0
    2fb8:	e585307c 	str	r3, [r5, #124]	; 0x7c
    2fbc:	eb0002b7 	bl	3aa0 <printf>
    2fc0:	e1a01005 	mov	r1, r5
    2fc4:	e3030dc4 	movw	r0, #15812	; 0x3dc4
    2fc8:	e3400000 	movt	r0, #0
    2fcc:	eb0001c2 	bl	36dc <exec>
    2fd0:	e5940000 	ldr	r0, [r4]
    2fd4:	e30516fc 	movw	r1, #22268	; 0x56fc
    2fd8:	e3401000 	movt	r1, #0
    2fdc:	eb0002af 	bl	3aa0 <printf>
    2fe0:	e3a01c02 	mov	r1, #512	; 0x200
    2fe4:	e3050600 	movw	r0, #22016	; 0x5600
    2fe8:	e3400000 	movt	r0, #0
    2fec:	eb0001c7 	bl	3710 <open>
    2ff0:	eb00019f 	bl	3674 <close>
    2ff4:	eb000150 	bl	353c <exit>
    2ff8:	e3053814 	movw	r3, #22548	; 0x5814
    2ffc:	e3403000 	movt	r3, #0
    3000:	e3051728 	movw	r1, #22312	; 0x5728
    3004:	e3401000 	movt	r1, #0
    3008:	e5930000 	ldr	r0, [r3]
    300c:	eb0002a3 	bl	3aa0 <printf>
    3010:	eb000149 	bl	353c <exit>
    3014:	e3053814 	movw	r3, #22548	; 0x5814
    3018:	e3403000 	movt	r3, #0
    301c:	e305170c 	movw	r1, #22284	; 0x570c
    3020:	e3401000 	movt	r1, #0
    3024:	e5930000 	ldr	r0, [r3]
    3028:	eb00029c 	bl	3aa0 <printf>
    302c:	eb000142 	bl	353c <exit>
    3030:	0000582c 	.word	0x0000582c

00003034 <fsfull>:
    3034:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3038:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    303c:	e28db020 	add	fp, sp, #32
    3040:	e308751f 	movw	r7, #34079	; 0x851f
    3044:	e306a667 	movw	sl, #26215	; 0x6667
    3048:	e34571eb 	movt	r7, #20971	; 0x51eb
    304c:	e346a666 	movt	sl, #26214	; 0x6666
    3050:	e24dd054 	sub	sp, sp, #84	; 0x54
    3054:	e1a04003 	mov	r4, r3
    3058:	e3051740 	movw	r1, #22336	; 0x5740
    305c:	e3a00001 	mov	r0, #1
    3060:	e3401000 	movt	r1, #0
    3064:	e3a08000 	mov	r8, #0
    3068:	eb00028c 	bl	3aa0 <printf>
    306c:	e1a03004 	mov	r3, r4
    3070:	e3413062 	movt	r3, #4194	; 0x1062
    3074:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    3078:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
    307c:	e1a09fc8 	asr	r9, r8, #31
    3080:	e0c54798 	smull	r4, r5, r8, r7
    3084:	e3a0c064 	mov	ip, #100	; 0x64
    3088:	e0c10398 	smull	r0, r1, r8, r3
    308c:	e3a03ffa 	mov	r3, #1000	; 0x3e8
    3090:	e3a0e00a 	mov	lr, #10
    3094:	e24b2064 	sub	r2, fp, #100	; 0x64
    3098:	e06942c5 	rsb	r4, r9, r5, asr #5
    309c:	e06c849c 	mls	ip, ip, r4, r8
    30a0:	e0690341 	rsb	r0, r9, r1, asr #6
    30a4:	e3051750 	movw	r1, #22352	; 0x5750
    30a8:	e3401000 	movt	r1, #0
    30ac:	e0638093 	mls	r3, r3, r0, r8
    30b0:	e2800030 	add	r0, r0, #48	; 0x30
    30b4:	e54b0063 	strb	r0, [fp, #-99]	; 0xffffff9d
    30b8:	e3a00001 	mov	r0, #1
    30bc:	e0c54793 	smull	r4, r5, r3, r7
    30c0:	e1a03fc3 	asr	r3, r3, #31
    30c4:	e14b46fc 	strd	r4, [fp, #-108]	; 0xffffff94
    30c8:	e0c54a98 	smull	r4, r5, r8, sl
    30cc:	e0696145 	rsb	r6, r9, r5, asr #2
    30d0:	e0c54a9c 	smull	r4, r5, ip, sl
    30d4:	e1a0cfcc 	asr	ip, ip, #31
    30d8:	e06e869e 	mls	lr, lr, r6, r8
    30dc:	e51b6068 	ldr	r6, [fp, #-104]	; 0xffffff98
    30e0:	e3a04000 	mov	r4, #0
    30e4:	e54b405f 	strb	r4, [fp, #-95]	; 0xffffffa1
    30e8:	e06332c6 	rsb	r3, r3, r6, asr #5
    30ec:	e06cc145 	rsb	ip, ip, r5, asr #2
    30f0:	e28ee030 	add	lr, lr, #48	; 0x30
    30f4:	e28cc030 	add	ip, ip, #48	; 0x30
    30f8:	e2833030 	add	r3, r3, #48	; 0x30
    30fc:	e54be060 	strb	lr, [fp, #-96]	; 0xffffffa0
    3100:	e54b3062 	strb	r3, [fp, #-98]	; 0xffffff9e
    3104:	e3a03066 	mov	r3, #102	; 0x66
    3108:	e54bc061 	strb	ip, [fp, #-97]	; 0xffffff9f
    310c:	e54b3064 	strb	r3, [fp, #-100]	; 0xffffff9c
    3110:	eb000262 	bl	3aa0 <printf>
    3114:	e3001202 	movw	r1, #514	; 0x202
    3118:	e24b0064 	sub	r0, fp, #100	; 0x64
    311c:	eb00017b 	bl	3710 <open>
    3120:	e2506000 	subs	r6, r0, #0
    3124:	ba000014 	blt	317c <fsfull+0x148>
    3128:	e3075fcc 	movw	r5, #32716	; 0x7fcc
    312c:	e3405000 	movt	r5, #0
    3130:	ea000000 	b	3138 <fsfull+0x104>
    3134:	e0844000 	add	r4, r4, r0
    3138:	e3a02c02 	mov	r2, #512	; 0x200
    313c:	e1a01005 	mov	r1, r5
    3140:	e1a00006 	mov	r0, r6
    3144:	eb00013d 	bl	3640 <write>
    3148:	e3500c02 	cmp	r0, #512	; 0x200
    314c:	aafffff8 	bge	3134 <fsfull+0x100>
    3150:	e1a02004 	mov	r2, r4
    3154:	e3a00001 	mov	r0, #1
    3158:	e305176c 	movw	r1, #22380	; 0x576c
    315c:	e3401000 	movt	r1, #0
    3160:	eb00024e 	bl	3aa0 <printf>
    3164:	e1a00006 	mov	r0, r6
    3168:	eb000141 	bl	3674 <close>
    316c:	e3540000 	cmp	r4, #0
    3170:	0a000006 	beq	3190 <fsfull+0x15c>
    3174:	e2888001 	add	r8, r8, #1
    3178:	eaffffbe 	b	3078 <fsfull+0x44>
    317c:	e305175c 	movw	r1, #22364	; 0x575c
    3180:	e24b2064 	sub	r2, fp, #100	; 0x64
    3184:	e3401000 	movt	r1, #0
    3188:	e3a00001 	mov	r0, #1
    318c:	eb000243 	bl	3aa0 <printf>
    3190:	e308a51f 	movw	sl, #34079	; 0x851f
    3194:	e345a1eb 	movt	sl, #20971	; 0x51eb
    3198:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    319c:	e3413062 	movt	r3, #4194	; 0x1062
    31a0:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    31a4:	e3063667 	movw	r3, #26215	; 0x6667
    31a8:	e3463666 	movt	r3, #26214	; 0x6666
    31ac:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    31b0:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    31b4:	e3a0cffa 	mov	ip, #1000	; 0x3e8
    31b8:	e0c54a98 	smull	r4, r5, r8, sl
    31bc:	e3a04000 	mov	r4, #0
    31c0:	e0c76398 	smull	r6, r7, r8, r3
    31c4:	e3a03064 	mov	r3, #100	; 0x64
    31c8:	e54b405f 	strb	r4, [fp, #-95]	; 0xffffffa1
    31cc:	e3a0100a 	mov	r1, #10
    31d0:	e24b0064 	sub	r0, fp, #100	; 0x64
    31d4:	e0692347 	rsb	r2, r9, r7, asr #6
    31d8:	e282e030 	add	lr, r2, #48	; 0x30
    31dc:	e54be063 	strb	lr, [fp, #-99]	; 0xffffff9d
    31e0:	e062829c 	mls	r2, ip, r2, r8
    31e4:	e069c2c5 	rsb	ip, r9, r5, asr #5
    31e8:	e51b5070 	ldr	r5, [fp, #-112]	; 0xffffff90
    31ec:	e3a0e066 	mov	lr, #102	; 0x66
    31f0:	e06c8c93 	mls	ip, r3, ip, r8
    31f4:	e54be064 	strb	lr, [fp, #-100]	; 0xffffff9c
    31f8:	e0c76598 	smull	r6, r7, r8, r5
    31fc:	e1a04005 	mov	r4, r5
    3200:	e1a0efc2 	asr	lr, r2, #31
    3204:	e0c5449c 	smull	r4, r5, ip, r4
    3208:	e1a0cfcc 	asr	ip, ip, #31
    320c:	e0c32a92 	smull	r2, r3, r2, sl
    3210:	e0699147 	rsb	r9, r9, r7, asr #2
    3214:	e0618991 	mls	r1, r1, r9, r8
    3218:	e06cc145 	rsb	ip, ip, r5, asr #2
    321c:	e2488001 	sub	r8, r8, #1
    3220:	e28cc030 	add	ip, ip, #48	; 0x30
    3224:	e06ee2c3 	rsb	lr, lr, r3, asr #5
    3228:	e54bc061 	strb	ip, [fp, #-97]	; 0xffffff9f
    322c:	e28ee030 	add	lr, lr, #48	; 0x30
    3230:	e2811030 	add	r1, r1, #48	; 0x30
    3234:	e54be062 	strb	lr, [fp, #-98]	; 0xffffff9e
    3238:	e1a09fc8 	asr	r9, r8, #31
    323c:	e54b1060 	strb	r1, [fp, #-96]	; 0xffffffa0
    3240:	eb00014c 	bl	3778 <unlink>
    3244:	e3780001 	cmn	r8, #1
    3248:	1affffd8 	bne	31b0 <fsfull+0x17c>
    324c:	e3a00001 	mov	r0, #1
    3250:	e305177c 	movw	r1, #22396	; 0x577c
    3254:	e3401000 	movt	r1, #0
    3258:	eb000210 	bl	3aa0 <printf>
    325c:	e24bd020 	sub	sp, fp, #32
    3260:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00003264 <rand>:
    3264:	e3053814 	movw	r3, #22548	; 0x5814
    3268:	e3403000 	movt	r3, #0
    326c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3270:	e306160d 	movw	r1, #26125	; 0x660d
    3274:	e5930018 	ldr	r0, [r3, #24]
    3278:	e3401019 	movt	r1, #25
    327c:	e30f235f 	movw	r2, #62303	; 0xf35f
    3280:	e3432c6e 	movt	r2, #15470	; 0x3c6e
    3284:	e28db000 	add	fp, sp, #0
    3288:	e0202091 	mla	r0, r1, r0, r2
    328c:	e5830018 	str	r0, [r3, #24]
    3290:	e28bd000 	add	sp, fp, #0
    3294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3298:	e12fff1e 	bx	lr

0000329c <strcpy>:
    329c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32a0:	e2402001 	sub	r2, r0, #1
    32a4:	e28db000 	add	fp, sp, #0
    32a8:	e4d13001 	ldrb	r3, [r1], #1
    32ac:	e3530000 	cmp	r3, #0
    32b0:	e5e23001 	strb	r3, [r2, #1]!
    32b4:	1afffffb 	bne	32a8 <strcpy+0xc>
    32b8:	e28bd000 	add	sp, fp, #0
    32bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32c0:	e12fff1e 	bx	lr

000032c4 <strcmp>:
    32c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32c8:	e28db000 	add	fp, sp, #0
    32cc:	e5d03000 	ldrb	r3, [r0]
    32d0:	e5d12000 	ldrb	r2, [r1]
    32d4:	e3530000 	cmp	r3, #0
    32d8:	1a000004 	bne	32f0 <strcmp+0x2c>
    32dc:	ea000005 	b	32f8 <strcmp+0x34>
    32e0:	e5f03001 	ldrb	r3, [r0, #1]!
    32e4:	e3530000 	cmp	r3, #0
    32e8:	0a000006 	beq	3308 <strcmp+0x44>
    32ec:	e5f12001 	ldrb	r2, [r1, #1]!
    32f0:	e1530002 	cmp	r3, r2
    32f4:	0afffff9 	beq	32e0 <strcmp+0x1c>
    32f8:	e0430002 	sub	r0, r3, r2
    32fc:	e28bd000 	add	sp, fp, #0
    3300:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3304:	e12fff1e 	bx	lr
    3308:	e5d12001 	ldrb	r2, [r1, #1]
    330c:	e0430002 	sub	r0, r3, r2
    3310:	e28bd000 	add	sp, fp, #0
    3314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3318:	e12fff1e 	bx	lr

0000331c <strlen>:
    331c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3320:	e28db000 	add	fp, sp, #0
    3324:	e5d03000 	ldrb	r3, [r0]
    3328:	e3530000 	cmp	r3, #0
    332c:	0a000009 	beq	3358 <strlen+0x3c>
    3330:	e1a02000 	mov	r2, r0
    3334:	e3a03000 	mov	r3, #0
    3338:	e5f21001 	ldrb	r1, [r2, #1]!
    333c:	e2833001 	add	r3, r3, #1
    3340:	e3510000 	cmp	r1, #0
    3344:	e1a00003 	mov	r0, r3
    3348:	1afffffa 	bne	3338 <strlen+0x1c>
    334c:	e28bd000 	add	sp, fp, #0
    3350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3354:	e12fff1e 	bx	lr
    3358:	e1a00003 	mov	r0, r3
    335c:	eafffffa 	b	334c <strlen+0x30>

00003360 <memset>:
    3360:	e3520000 	cmp	r2, #0
    3364:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3368:	e28db000 	add	fp, sp, #0
    336c:	0a000004 	beq	3384 <memset+0x24>
    3370:	e6ef1071 	uxtb	r1, r1
    3374:	e0802002 	add	r2, r0, r2
    3378:	e4c01001 	strb	r1, [r0], #1
    337c:	e1520000 	cmp	r2, r0
    3380:	1afffffc 	bne	3378 <memset+0x18>
    3384:	e28bd000 	add	sp, fp, #0
    3388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    338c:	e12fff1e 	bx	lr

00003390 <strchr>:
    3390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3394:	e28db000 	add	fp, sp, #0
    3398:	e5d02000 	ldrb	r2, [r0]
    339c:	e3520000 	cmp	r2, #0
    33a0:	0a00000b 	beq	33d4 <strchr+0x44>
    33a4:	e1510002 	cmp	r1, r2
    33a8:	1a000002 	bne	33b8 <strchr+0x28>
    33ac:	ea000005 	b	33c8 <strchr+0x38>
    33b0:	e1530001 	cmp	r3, r1
    33b4:	0a000003 	beq	33c8 <strchr+0x38>
    33b8:	e5f03001 	ldrb	r3, [r0, #1]!
    33bc:	e3530000 	cmp	r3, #0
    33c0:	1afffffa 	bne	33b0 <strchr+0x20>
    33c4:	e1a00003 	mov	r0, r3
    33c8:	e28bd000 	add	sp, fp, #0
    33cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33d0:	e12fff1e 	bx	lr
    33d4:	e1a00002 	mov	r0, r2
    33d8:	eafffffa 	b	33c8 <strchr+0x38>

000033dc <gets>:
    33dc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    33e0:	e1a08000 	mov	r8, r0
    33e4:	e28db018 	add	fp, sp, #24
    33e8:	e1a07001 	mov	r7, r1
    33ec:	e24dd00c 	sub	sp, sp, #12
    33f0:	e2406001 	sub	r6, r0, #1
    33f4:	e3a05000 	mov	r5, #0
    33f8:	ea000008 	b	3420 <gets+0x44>
    33fc:	eb000082 	bl	360c <read>
    3400:	e3500000 	cmp	r0, #0
    3404:	da00000b 	ble	3438 <gets+0x5c>
    3408:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    340c:	e1a05004 	mov	r5, r4
    3410:	e353000d 	cmp	r3, #13
    3414:	1353000a 	cmpne	r3, #10
    3418:	e5e63001 	strb	r3, [r6, #1]!
    341c:	0a000005 	beq	3438 <gets+0x5c>
    3420:	e3a02001 	mov	r2, #1
    3424:	e0854002 	add	r4, r5, r2
    3428:	e1540007 	cmp	r4, r7
    342c:	e24b101d 	sub	r1, fp, #29
    3430:	e3a00000 	mov	r0, #0
    3434:	bafffff0 	blt	33fc <gets+0x20>
    3438:	e3a03000 	mov	r3, #0
    343c:	e1a00008 	mov	r0, r8
    3440:	e7c83005 	strb	r3, [r8, r5]
    3444:	e24bd018 	sub	sp, fp, #24
    3448:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000344c <stat>:
    344c:	e92d4830 	push	{r4, r5, fp, lr}
    3450:	e1a04001 	mov	r4, r1
    3454:	e28db00c 	add	fp, sp, #12
    3458:	e3a01000 	mov	r1, #0
    345c:	eb0000ab 	bl	3710 <open>
    3460:	e2505000 	subs	r5, r0, #0
    3464:	ba000006 	blt	3484 <stat+0x38>
    3468:	e1a01004 	mov	r1, r4
    346c:	eb0000ce 	bl	37ac <fstat>
    3470:	e1a04000 	mov	r4, r0
    3474:	e1a00005 	mov	r0, r5
    3478:	eb00007d 	bl	3674 <close>
    347c:	e1a00004 	mov	r0, r4
    3480:	e8bd8830 	pop	{r4, r5, fp, pc}
    3484:	e3e04000 	mvn	r4, #0
    3488:	eafffffb 	b	347c <stat+0x30>

0000348c <atoi>:
    348c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3490:	e28db000 	add	fp, sp, #0
    3494:	e5d02000 	ldrb	r2, [r0]
    3498:	e2423030 	sub	r3, r2, #48	; 0x30
    349c:	e3530009 	cmp	r3, #9
    34a0:	e3a03000 	mov	r3, #0
    34a4:	8a000006 	bhi	34c4 <atoi+0x38>
    34a8:	e3a0c00a 	mov	ip, #10
    34ac:	e023239c 	mla	r3, ip, r3, r2
    34b0:	e5f02001 	ldrb	r2, [r0, #1]!
    34b4:	e2421030 	sub	r1, r2, #48	; 0x30
    34b8:	e3510009 	cmp	r1, #9
    34bc:	e2433030 	sub	r3, r3, #48	; 0x30
    34c0:	9afffff9 	bls	34ac <atoi+0x20>
    34c4:	e1a00003 	mov	r0, r3
    34c8:	e28bd000 	add	sp, fp, #0
    34cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    34d0:	e12fff1e 	bx	lr

000034d4 <memmove>:
    34d4:	e3520000 	cmp	r2, #0
    34d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34dc:	e28db000 	add	fp, sp, #0
    34e0:	da000005 	ble	34fc <memmove+0x28>
    34e4:	e0812002 	add	r2, r1, r2
    34e8:	e2403001 	sub	r3, r0, #1
    34ec:	e4d1c001 	ldrb	ip, [r1], #1
    34f0:	e1510002 	cmp	r1, r2
    34f4:	e5e3c001 	strb	ip, [r3, #1]!
    34f8:	1afffffb 	bne	34ec <memmove+0x18>
    34fc:	e28bd000 	add	sp, fp, #0
    3500:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3504:	e12fff1e 	bx	lr

00003508 <fork>:
    3508:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    350c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3510:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3514:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3518:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    351c:	e3a00001 	mov	r0, #1
    3520:	ef000040 	svc	0x00000040
    3524:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    352c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3530:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3534:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3538:	e12fff1e 	bx	lr

0000353c <exit>:
    353c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3540:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3544:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3548:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    354c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3550:	e3a00002 	mov	r0, #2
    3554:	ef000040 	svc	0x00000040
    3558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    355c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3560:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3564:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3568:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    356c:	e12fff1e 	bx	lr

00003570 <wait>:
    3570:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3574:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3578:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    357c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3580:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3584:	e3a00003 	mov	r0, #3
    3588:	ef000040 	svc	0x00000040
    358c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3594:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3598:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    359c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35a0:	e12fff1e 	bx	lr

000035a4 <lseek>:
    35a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35b8:	e3a00016 	mov	r0, #22
    35bc:	ef000040 	svc	0x00000040
    35c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35d4:	e12fff1e 	bx	lr

000035d8 <pipe>:
    35d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35ec:	e3a00004 	mov	r0, #4
    35f0:	ef000040 	svc	0x00000040
    35f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3600:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3604:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3608:	e12fff1e 	bx	lr

0000360c <read>:
    360c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3610:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3614:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3618:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    361c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3620:	e3a00005 	mov	r0, #5
    3624:	ef000040 	svc	0x00000040
    3628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    362c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3630:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3634:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3638:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    363c:	e12fff1e 	bx	lr

00003640 <write>:
    3640:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3644:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3648:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    364c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3650:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3654:	e3a00010 	mov	r0, #16
    3658:	ef000040 	svc	0x00000040
    365c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3664:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3668:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    366c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3670:	e12fff1e 	bx	lr

00003674 <close>:
    3674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3678:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    367c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3680:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3684:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3688:	e3a00015 	mov	r0, #21
    368c:	ef000040 	svc	0x00000040
    3690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3698:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    369c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36a4:	e12fff1e 	bx	lr

000036a8 <kill>:
    36a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36bc:	e3a00006 	mov	r0, #6
    36c0:	ef000040 	svc	0x00000040
    36c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36d8:	e12fff1e 	bx	lr

000036dc <exec>:
    36dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36f0:	e3a00007 	mov	r0, #7
    36f4:	ef000040 	svc	0x00000040
    36f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3700:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3704:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3708:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    370c:	e12fff1e 	bx	lr

00003710 <open>:
    3710:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3714:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3718:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    371c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3720:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3724:	e3a0000f 	mov	r0, #15
    3728:	ef000040 	svc	0x00000040
    372c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3734:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3738:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    373c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3740:	e12fff1e 	bx	lr

00003744 <mknod>:
    3744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3748:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    374c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3750:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3754:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3758:	e3a00011 	mov	r0, #17
    375c:	ef000040 	svc	0x00000040
    3760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3768:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    376c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3774:	e12fff1e 	bx	lr

00003778 <unlink>:
    3778:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    377c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3780:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3784:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3788:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    378c:	e3a00012 	mov	r0, #18
    3790:	ef000040 	svc	0x00000040
    3794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    379c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37a8:	e12fff1e 	bx	lr

000037ac <fstat>:
    37ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37c0:	e3a00008 	mov	r0, #8
    37c4:	ef000040 	svc	0x00000040
    37c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37dc:	e12fff1e 	bx	lr

000037e0 <link>:
    37e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37f4:	e3a00013 	mov	r0, #19
    37f8:	ef000040 	svc	0x00000040
    37fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3804:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3808:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    380c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3810:	e12fff1e 	bx	lr

00003814 <mkdir>:
    3814:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3818:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    381c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3820:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3824:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3828:	e3a00014 	mov	r0, #20
    382c:	ef000040 	svc	0x00000040
    3830:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3834:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3838:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    383c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3840:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3844:	e12fff1e 	bx	lr

00003848 <chdir>:
    3848:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    384c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3850:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3854:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3858:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    385c:	e3a00009 	mov	r0, #9
    3860:	ef000040 	svc	0x00000040
    3864:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3868:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    386c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3870:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3874:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3878:	e12fff1e 	bx	lr

0000387c <dup>:
    387c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3880:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3884:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3888:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    388c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3890:	e3a0000a 	mov	r0, #10
    3894:	ef000040 	svc	0x00000040
    3898:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    389c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38ac:	e12fff1e 	bx	lr

000038b0 <getpid>:
    38b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38c4:	e3a0000b 	mov	r0, #11
    38c8:	ef000040 	svc	0x00000040
    38cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38e0:	e12fff1e 	bx	lr

000038e4 <sbrk>:
    38e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38f8:	e3a0000c 	mov	r0, #12
    38fc:	ef000040 	svc	0x00000040
    3900:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3904:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3908:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    390c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3910:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3914:	e12fff1e 	bx	lr

00003918 <sleep>:
    3918:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    391c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3920:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3924:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3928:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    392c:	e3a0000d 	mov	r0, #13
    3930:	ef000040 	svc	0x00000040
    3934:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3938:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    393c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3940:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3944:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3948:	e12fff1e 	bx	lr

0000394c <uptime>:
    394c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3950:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3954:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3958:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    395c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3960:	e3a0000e 	mov	r0, #14
    3964:	ef000040 	svc	0x00000040
    3968:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    396c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3970:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3974:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3978:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    397c:	e12fff1e 	bx	lr

00003980 <printint>:
    3980:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    3984:	e1a09fa1 	lsr	r9, r1, #31
    3988:	e3530000 	cmp	r3, #0
    398c:	03a09000 	moveq	r9, #0
    3990:	12099001 	andne	r9, r9, #1
    3994:	e28db01c 	add	fp, sp, #28
    3998:	e3590000 	cmp	r9, #0
    399c:	e30587f8 	movw	r8, #22520	; 0x57f8
    39a0:	1261e000 	rsbne	lr, r1, #0
    39a4:	e3408000 	movt	r8, #0
    39a8:	e24b602d 	sub	r6, fp, #45	; 0x2d
    39ac:	e1a04000 	mov	r4, r0
    39b0:	13a09001 	movne	r9, #1
    39b4:	01a0e001 	moveq	lr, r1
    39b8:	e3a07000 	mov	r7, #0
    39bc:	e3a05001 	mov	r5, #1
    39c0:	e24dd018 	sub	sp, sp, #24
    39c4:	e3a0c000 	mov	ip, #0
    39c8:	e3a0301f 	mov	r3, #31
    39cc:	e1a0100c 	mov	r1, ip
    39d0:	e1a0033e 	lsr	r0, lr, r3
    39d4:	e2000001 	and	r0, r0, #1
    39d8:	e1801081 	orr	r1, r0, r1, lsl #1
    39dc:	e1520001 	cmp	r2, r1
    39e0:	90411002 	subls	r1, r1, r2
    39e4:	918cc315 	orrls	ip, ip, r5, lsl r3
    39e8:	e2533001 	subs	r3, r3, #1
    39ec:	2afffff7 	bcs	39d0 <printint+0x50>
    39f0:	e061e29c 	mls	r1, ip, r2, lr
    39f4:	e35c0000 	cmp	ip, #0
    39f8:	e1a0e00c 	mov	lr, ip
    39fc:	e2873001 	add	r3, r7, #1
    3a00:	e7d81001 	ldrb	r1, [r8, r1]
    3a04:	e5e61001 	strb	r1, [r6, #1]!
    3a08:	11a07003 	movne	r7, r3
    3a0c:	1affffec 	bne	39c4 <printint+0x44>
    3a10:	e3590000 	cmp	r9, #0
    3a14:	124b201c 	subne	r2, fp, #28
    3a18:	10822003 	addne	r2, r2, r3
    3a1c:	13a0102d 	movne	r1, #45	; 0x2d
    3a20:	12873002 	addne	r3, r7, #2
    3a24:	15421010 	strbne	r1, [r2, #-16]
    3a28:	e24b202c 	sub	r2, fp, #44	; 0x2c
    3a2c:	e2435001 	sub	r5, r3, #1
    3a30:	e0826003 	add	r6, r2, r3
    3a34:	e5763001 	ldrb	r3, [r6, #-1]!
    3a38:	e2455001 	sub	r5, r5, #1
    3a3c:	e3a02001 	mov	r2, #1
    3a40:	e24b102d 	sub	r1, fp, #45	; 0x2d
    3a44:	e1a00004 	mov	r0, r4
    3a48:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    3a4c:	ebfffefb 	bl	3640 <write>
    3a50:	e3750001 	cmn	r5, #1
    3a54:	1afffff6 	bne	3a34 <printint+0xb4>
    3a58:	e24bd01c 	sub	sp, fp, #28
    3a5c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00003a60 <div>:
    3a60:	e92d4810 	push	{r4, fp, lr}
    3a64:	e3a02000 	mov	r2, #0
    3a68:	e28db008 	add	fp, sp, #8
    3a6c:	e1a0e000 	mov	lr, r0
    3a70:	e3a0301f 	mov	r3, #31
    3a74:	e1a00002 	mov	r0, r2
    3a78:	e3a04001 	mov	r4, #1
    3a7c:	e1a0c33e 	lsr	ip, lr, r3
    3a80:	e20cc001 	and	ip, ip, #1
    3a84:	e18c2082 	orr	r2, ip, r2, lsl #1
    3a88:	e1520001 	cmp	r2, r1
    3a8c:	20422001 	subcs	r2, r2, r1
    3a90:	21800314 	orrcs	r0, r0, r4, lsl r3
    3a94:	e2533001 	subs	r3, r3, #1
    3a98:	2afffff7 	bcs	3a7c <div+0x1c>
    3a9c:	e8bd8810 	pop	{r4, fp, pc}

00003aa0 <printf>:
    3aa0:	e92d000e 	push	{r1, r2, r3}
    3aa4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    3aa8:	e28db018 	add	fp, sp, #24
    3aac:	e24dd008 	sub	sp, sp, #8
    3ab0:	e59b6004 	ldr	r6, [fp, #4]
    3ab4:	e5d64000 	ldrb	r4, [r6]
    3ab8:	e3540000 	cmp	r4, #0
    3abc:	0a00002b 	beq	3b70 <printf+0xd0>
    3ac0:	e1a07000 	mov	r7, r0
    3ac4:	e28b8008 	add	r8, fp, #8
    3ac8:	e3a05000 	mov	r5, #0
    3acc:	ea00000a 	b	3afc <printf+0x5c>
    3ad0:	e3540025 	cmp	r4, #37	; 0x25
    3ad4:	01a05004 	moveq	r5, r4
    3ad8:	0a000004 	beq	3af0 <printf+0x50>
    3adc:	e24b1018 	sub	r1, fp, #24
    3ae0:	e3a02001 	mov	r2, #1
    3ae4:	e1a00007 	mov	r0, r7
    3ae8:	e5614006 	strb	r4, [r1, #-6]!
    3aec:	ebfffed3 	bl	3640 <write>
    3af0:	e5f64001 	ldrb	r4, [r6, #1]!
    3af4:	e3540000 	cmp	r4, #0
    3af8:	0a00001c 	beq	3b70 <printf+0xd0>
    3afc:	e3550000 	cmp	r5, #0
    3b00:	0afffff2 	beq	3ad0 <printf+0x30>
    3b04:	e3550025 	cmp	r5, #37	; 0x25
    3b08:	1afffff8 	bne	3af0 <printf+0x50>
    3b0c:	e3540064 	cmp	r4, #100	; 0x64
    3b10:	0a000037 	beq	3bf4 <printf+0x154>
    3b14:	e20430f7 	and	r3, r4, #247	; 0xf7
    3b18:	e3530070 	cmp	r3, #112	; 0x70
    3b1c:	0a000017 	beq	3b80 <printf+0xe0>
    3b20:	e3540073 	cmp	r4, #115	; 0x73
    3b24:	0a00001c 	beq	3b9c <printf+0xfc>
    3b28:	e3540063 	cmp	r4, #99	; 0x63
    3b2c:	0a000037 	beq	3c10 <printf+0x170>
    3b30:	e3540025 	cmp	r4, #37	; 0x25
    3b34:	0a000027 	beq	3bd8 <printf+0x138>
    3b38:	e3a02001 	mov	r2, #1
    3b3c:	e24b1019 	sub	r1, fp, #25
    3b40:	e1a00007 	mov	r0, r7
    3b44:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    3b48:	ebfffebc 	bl	3640 <write>
    3b4c:	e3a02001 	mov	r2, #1
    3b50:	e24b101a 	sub	r1, fp, #26
    3b54:	e1a00007 	mov	r0, r7
    3b58:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    3b5c:	ebfffeb7 	bl	3640 <write>
    3b60:	e5f64001 	ldrb	r4, [r6, #1]!
    3b64:	e3a05000 	mov	r5, #0
    3b68:	e3540000 	cmp	r4, #0
    3b6c:	1affffe2 	bne	3afc <printf+0x5c>
    3b70:	e24bd018 	sub	sp, fp, #24
    3b74:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    3b78:	e28dd00c 	add	sp, sp, #12
    3b7c:	e12fff1e 	bx	lr
    3b80:	e3a03000 	mov	r3, #0
    3b84:	e3a02010 	mov	r2, #16
    3b88:	e4981004 	ldr	r1, [r8], #4
    3b8c:	e1a00007 	mov	r0, r7
    3b90:	ebffff7a 	bl	3980 <printint>
    3b94:	e3a05000 	mov	r5, #0
    3b98:	eaffffd4 	b	3af0 <printf+0x50>
    3b9c:	e4984004 	ldr	r4, [r8], #4
    3ba0:	e3540000 	cmp	r4, #0
    3ba4:	0a000021 	beq	3c30 <printf+0x190>
    3ba8:	e5d45000 	ldrb	r5, [r4]
    3bac:	e3550000 	cmp	r5, #0
    3bb0:	0affffce 	beq	3af0 <printf+0x50>
    3bb4:	e3a02001 	mov	r2, #1
    3bb8:	e24b101d 	sub	r1, fp, #29
    3bbc:	e1a00007 	mov	r0, r7
    3bc0:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
    3bc4:	ebfffe9d 	bl	3640 <write>
    3bc8:	e5f45001 	ldrb	r5, [r4, #1]!
    3bcc:	e3550000 	cmp	r5, #0
    3bd0:	1afffff7 	bne	3bb4 <printf+0x114>
    3bd4:	eaffffc5 	b	3af0 <printf+0x50>
    3bd8:	e24b1018 	sub	r1, fp, #24
    3bdc:	e3a02001 	mov	r2, #1
    3be0:	e1a00007 	mov	r0, r7
    3be4:	e5615003 	strb	r5, [r1, #-3]!
    3be8:	e3a05000 	mov	r5, #0
    3bec:	ebfffe93 	bl	3640 <write>
    3bf0:	eaffffbe 	b	3af0 <printf+0x50>
    3bf4:	e3a03001 	mov	r3, #1
    3bf8:	e3a0200a 	mov	r2, #10
    3bfc:	e4981004 	ldr	r1, [r8], #4
    3c00:	e1a00007 	mov	r0, r7
    3c04:	ebffff5d 	bl	3980 <printint>
    3c08:	e3a05000 	mov	r5, #0
    3c0c:	eaffffb7 	b	3af0 <printf+0x50>
    3c10:	e4983004 	ldr	r3, [r8], #4
    3c14:	e24b1018 	sub	r1, fp, #24
    3c18:	e3a02001 	mov	r2, #1
    3c1c:	e1a00007 	mov	r0, r7
    3c20:	e3a05000 	mov	r5, #0
    3c24:	e5613004 	strb	r3, [r1, #-4]!
    3c28:	ebfffe84 	bl	3640 <write>
    3c2c:	eaffffaf 	b	3af0 <printf+0x50>
    3c30:	e305480c 	movw	r4, #22540	; 0x580c
    3c34:	e3a05028 	mov	r5, #40	; 0x28
    3c38:	e3404000 	movt	r4, #0
    3c3c:	eaffffdc 	b	3bb4 <printf+0x114>

00003c40 <free>:
    3c40:	e305c8b0 	movw	ip, #22704	; 0x58b0
    3c44:	e340c000 	movt	ip, #0
    3c48:	e92d4810 	push	{r4, fp, lr}
    3c4c:	e2401008 	sub	r1, r0, #8
    3c50:	e28db008 	add	fp, sp, #8
    3c54:	e59c3000 	ldr	r3, [ip]
    3c58:	ea000004 	b	3c70 <free+0x30>
    3c5c:	e1510002 	cmp	r1, r2
    3c60:	3a000009 	bcc	3c8c <free+0x4c>
    3c64:	e1530002 	cmp	r3, r2
    3c68:	2a000007 	bcs	3c8c <free+0x4c>
    3c6c:	e1a03002 	mov	r3, r2
    3c70:	e1530001 	cmp	r3, r1
    3c74:	e5932000 	ldr	r2, [r3]
    3c78:	3afffff7 	bcc	3c5c <free+0x1c>
    3c7c:	e1530002 	cmp	r3, r2
    3c80:	3afffff9 	bcc	3c6c <free+0x2c>
    3c84:	e1510002 	cmp	r1, r2
    3c88:	2afffff7 	bcs	3c6c <free+0x2c>
    3c8c:	e510e004 	ldr	lr, [r0, #-4]
    3c90:	e58c3000 	str	r3, [ip]
    3c94:	e081418e 	add	r4, r1, lr, lsl #3
    3c98:	e1520004 	cmp	r2, r4
    3c9c:	05922004 	ldreq	r2, [r2, #4]
    3ca0:	0082e00e 	addeq	lr, r2, lr
    3ca4:	0500e004 	streq	lr, [r0, #-4]
    3ca8:	05932000 	ldreq	r2, [r3]
    3cac:	05922000 	ldreq	r2, [r2]
    3cb0:	e5002008 	str	r2, [r0, #-8]
    3cb4:	e5932004 	ldr	r2, [r3, #4]
    3cb8:	e083e182 	add	lr, r3, r2, lsl #3
    3cbc:	e151000e 	cmp	r1, lr
    3cc0:	15831000 	strne	r1, [r3]
    3cc4:	05101004 	ldreq	r1, [r0, #-4]
    3cc8:	00812002 	addeq	r2, r1, r2
    3ccc:	05832004 	streq	r2, [r3, #4]
    3cd0:	05102008 	ldreq	r2, [r0, #-8]
    3cd4:	05832000 	streq	r2, [r3]
    3cd8:	e8bd8810 	pop	{r4, fp, pc}

00003cdc <malloc>:
    3cdc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    3ce0:	e30578b0 	movw	r7, #22704	; 0x58b0
    3ce4:	e3407000 	movt	r7, #0
    3ce8:	e2804007 	add	r4, r0, #7
    3cec:	e28db014 	add	fp, sp, #20
    3cf0:	e5973000 	ldr	r3, [r7]
    3cf4:	e1a041a4 	lsr	r4, r4, #3
    3cf8:	e2844001 	add	r4, r4, #1
    3cfc:	e3530000 	cmp	r3, #0
    3d00:	0a000027 	beq	3da4 <malloc+0xc8>
    3d04:	e5930000 	ldr	r0, [r3]
    3d08:	e5902004 	ldr	r2, [r0, #4]
    3d0c:	e1540002 	cmp	r4, r2
    3d10:	9a000019 	bls	3d7c <malloc+0xa0>
    3d14:	e3540a01 	cmp	r4, #4096	; 0x1000
    3d18:	21a05004 	movcs	r5, r4
    3d1c:	33a05a01 	movcc	r5, #4096	; 0x1000
    3d20:	e1a06185 	lsl	r6, r5, #3
    3d24:	ea000003 	b	3d38 <malloc+0x5c>
    3d28:	e5930000 	ldr	r0, [r3]
    3d2c:	e5902004 	ldr	r2, [r0, #4]
    3d30:	e1540002 	cmp	r4, r2
    3d34:	9a000010 	bls	3d7c <malloc+0xa0>
    3d38:	e5972000 	ldr	r2, [r7]
    3d3c:	e1a03000 	mov	r3, r0
    3d40:	e1520000 	cmp	r2, r0
    3d44:	1afffff7 	bne	3d28 <malloc+0x4c>
    3d48:	e1a00006 	mov	r0, r6
    3d4c:	ebfffee4 	bl	38e4 <sbrk>
    3d50:	e1a03000 	mov	r3, r0
    3d54:	e3730001 	cmn	r3, #1
    3d58:	e2800008 	add	r0, r0, #8
    3d5c:	0a000004 	beq	3d74 <malloc+0x98>
    3d60:	e5835004 	str	r5, [r3, #4]
    3d64:	ebffffb5 	bl	3c40 <free>
    3d68:	e5973000 	ldr	r3, [r7]
    3d6c:	e3530000 	cmp	r3, #0
    3d70:	1affffec 	bne	3d28 <malloc+0x4c>
    3d74:	e3a00000 	mov	r0, #0
    3d78:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    3d7c:	e1540002 	cmp	r4, r2
    3d80:	e5873000 	str	r3, [r7]
    3d84:	10422004 	subne	r2, r2, r4
    3d88:	15802004 	strne	r2, [r0, #4]
    3d8c:	05902000 	ldreq	r2, [r0]
    3d90:	10800182 	addne	r0, r0, r2, lsl #3
    3d94:	e2800008 	add	r0, r0, #8
    3d98:	15004004 	strne	r4, [r0, #-4]
    3d9c:	05832000 	streq	r2, [r3]
    3da0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    3da4:	e2870004 	add	r0, r7, #4
    3da8:	e5873008 	str	r3, [r7, #8]
    3dac:	e5870000 	str	r0, [r7]
    3db0:	e5870004 	str	r0, [r7, #4]
    3db4:	eaffffd6 	b	3d14 <malloc+0x38>
