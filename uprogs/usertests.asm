
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
  printf(1, "usertests starting\n");
       4:	e3a00001 	mov	r0, #1
{
       8:	e28db004 	add	fp, sp, #4
  printf(1, "usertests starting\n");
       c:	e3051794 	movw	r1, #22420	; 0x5794
      10:	e3401000 	movt	r1, #0
      14:	eb000ea2 	bl	3aa4 <printf>

  if(open("usertests.ran", 0) >= 0){
      18:	e30507a8 	movw	r0, #22440	; 0x57a8
      1c:	e3a01000 	mov	r1, #0
      20:	e3400000 	movt	r0, #0
      24:	eb000dba 	bl	3714 <open>
      28:	e3500000 	cmp	r0, #0
      2c:	ba000004 	blt	44 <main+0x44>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      30:	e30517b8 	movw	r1, #22456	; 0x57b8
      34:	e3a00001 	mov	r0, #1
      38:	e3401000 	movt	r1, #0
      3c:	eb000e98 	bl	3aa4 <printf>
    exit();
      40:	eb000d3e 	bl	3540 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      44:	e3a01c02 	mov	r1, #512	; 0x200
      48:	e30507a8 	movw	r0, #22440	; 0x57a8
      4c:	e3400000 	movt	r0, #0
      50:	eb000daf 	bl	3714 <open>
      54:	eb000d87 	bl	3678 <close>

  bigargtest();
      58:	eb000bc0 	bl	2f60 <bigargtest>
  bigwrite();
      5c:	eb0007df 	bl	1fe0 <bigwrite>
  bigargtest();
      60:	eb000bbe 	bl	2f60 <bigargtest>
  bsstest();
      64:	eb000b9e 	bl	2ee4 <bsstest>
  sbrktest();
      68:	eb000a13 	bl	28bc <sbrktest>
  validatetest();
      6c:	eb000b71 	bl	2e38 <validatetest>

  opentest();
      70:	eb000017 	bl	d4 <opentest>
  writetest();
      74:	eb00003a 	bl	164 <writetest>
  writetest1();
      78:	eb0000a7 	bl	31c <writetest1>
  createtest();
      7c:	eb00010f 	bl	4c0 <createtest>

  mem();
      80:	eb00025a 	bl	9f0 <mem>
  pipe1();
      84:	eb000182 	bl	694 <pipe1>
  preempt();
      88:	eb0001eb 	bl	83c <preempt>
  exitwait();
      8c:	eb000237 	bl	970 <exitwait>

  rmdot();
      90:	eb0008c6 	bl	23b0 <rmdot>
  fourteen();
      94:	eb000879 	bl	2280 <fourteen>
  bigfile();
      98:	eb000809 	bl	20c4 <bigfile>
  subdir();
      9c:	eb00062f 	bl	1960 <subdir>
  concreate();
      a0:	eb0004de 	bl	1420 <concreate>
  linkunlink();
      a4:	eb0005a1 	bl	1730 <linkunlink>
  linktest();
      a8:	eb00045a 	bl	1218 <linktest>
  unlinkread();
      ac:	eb0003f7 	bl	1090 <unlinkread>
  createdelete();
      b0:	eb000362 	bl	e40 <createdelete>
  twofiles();
      b4:	eb0002df 	bl	c38 <twofiles>
  sharedfd();
      b8:	eb000279 	bl	aa4 <sharedfd>
  dirfile();
      bc:	eb000917 	bl	2520 <dirfile>
  iref();
      c0:	eb000990 	bl	2708 <iref>
  forktest();
      c4:	eb0009ce 	bl	2804 <forktest>
  bigdir(); // slow
      c8:	eb0005d5 	bl	1824 <bigdir>

  exectest();
      cc:	eb00015d 	bl	648 <exectest>

  exit();
      d0:	eb000d1a 	bl	3540 <exit>

000000d4 <opentest>:
{
      d4:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "open test\n");
      d8:	e3054814 	movw	r4, #22548	; 0x5814
      dc:	e3404000 	movt	r4, #0
{
      e0:	e28db00c 	add	fp, sp, #12
  printf(stdout, "open test\n");
      e4:	e3031db8 	movw	r1, #15800	; 0x3db8
      e8:	e3401000 	movt	r1, #0
      ec:	e5940000 	ldr	r0, [r4]
      f0:	eb000e6b 	bl	3aa4 <printf>
  fd = open("echo", 0);
      f4:	e3030dc4 	movw	r0, #15812	; 0x3dc4
      f8:	e3a01000 	mov	r1, #0
      fc:	e3400000 	movt	r0, #0
     100:	eb000d83 	bl	3714 <open>
  if(fd < 0){
     104:	e3500000 	cmp	r0, #0
     108:	ba00000c 	blt	140 <opentest+0x6c>
  close(fd);
     10c:	eb000d59 	bl	3678 <close>
  fd = open("doesnotexist", 0);
     110:	e3030de0 	movw	r0, #15840	; 0x3de0
     114:	e3a01000 	mov	r1, #0
     118:	e3400000 	movt	r0, #0
     11c:	eb000d7c 	bl	3714 <open>
  if(fd >= 0){
     120:	e3500000 	cmp	r0, #0
    printf(stdout, "open doesnotexist succeeded!\n");
     124:	e5940000 	ldr	r0, [r4]
  if(fd >= 0){
     128:	aa000009 	bge	154 <opentest+0x80>
  printf(stdout, "open test ok\n");
     12c:	e3031e10 	movw	r1, #15888	; 0x3e10
     130:	e3401000 	movt	r1, #0
}
     134:	e24bd00c 	sub	sp, fp, #12
     138:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "open test ok\n");
     13c:	ea000e58 	b	3aa4 <printf>
    printf(stdout, "open echo failed!\n");
     140:	e5940000 	ldr	r0, [r4]
     144:	e3031dcc 	movw	r1, #15820	; 0x3dcc
     148:	e3401000 	movt	r1, #0
     14c:	eb000e54 	bl	3aa4 <printf>
    exit();
     150:	eb000cfa 	bl	3540 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     154:	e3031df0 	movw	r1, #15856	; 0x3df0
     158:	e3401000 	movt	r1, #0
     15c:	eb000e50 	bl	3aa4 <printf>
    exit();
     160:	eb000cf6 	bl	3540 <exit>

00000164 <writetest>:
{
     164:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test\n");
     168:	e3058814 	movw	r8, #22548	; 0x5814
     16c:	e3408000 	movt	r8, #0
{
     170:	e28db01c 	add	fp, sp, #28
  printf(stdout, "small file test\n");
     174:	e3031e20 	movw	r1, #15904	; 0x3e20
     178:	e3401000 	movt	r1, #0
     17c:	e5980000 	ldr	r0, [r8]
     180:	eb000e47 	bl	3aa4 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     184:	e3030e34 	movw	r0, #15924	; 0x3e34
     188:	e3001202 	movw	r1, #514	; 0x202
     18c:	e3400000 	movt	r0, #0
     190:	eb000d5f 	bl	3714 <open>
  if(fd >= 0){
     194:	e2505000 	subs	r5, r0, #0
     198:	ba00005a 	blt	308 <writetest+0x1a4>
    printf(stdout, "creat small succeeded; ok\n");
     19c:	e3031e3c 	movw	r1, #15932	; 0x3e3c
     1a0:	e5980000 	ldr	r0, [r8]
     1a4:	e3401000 	movt	r1, #0
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1a8:	e3036e74 	movw	r6, #15988	; 0x3e74
    printf(stdout, "creat small succeeded; ok\n");
     1ac:	eb000e3c 	bl	3aa4 <printf>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1b0:	e3037ea4 	movw	r7, #16036	; 0x3ea4
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1b4:	e3406000 	movt	r6, #0
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1b8:	e3407000 	movt	r7, #0
  for(i = 0; i < 100; i++){
     1bc:	e3a04000 	mov	r4, #0
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1c0:	e3a0200a 	mov	r2, #10
     1c4:	e1a01006 	mov	r1, r6
     1c8:	e1a00005 	mov	r0, r5
     1cc:	eb000d1c 	bl	3644 <write>
     1d0:	e350000a 	cmp	r0, #10
     1d4:	1a000030 	bne	29c <writetest+0x138>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1d8:	e1a02000 	mov	r2, r0
     1dc:	e1a01007 	mov	r1, r7
     1e0:	e1a00005 	mov	r0, r5
     1e4:	eb000d16 	bl	3644 <write>
     1e8:	e350000a 	cmp	r0, #10
     1ec:	1a000030 	bne	2b4 <writetest+0x150>
  for(i = 0; i < 100; i++){
     1f0:	e2844001 	add	r4, r4, #1
     1f4:	e3540064 	cmp	r4, #100	; 0x64
     1f8:	1afffff0 	bne	1c0 <writetest+0x5c>
  printf(stdout, "writes ok\n");
     1fc:	e5980000 	ldr	r0, [r8]
     200:	e3031ed4 	movw	r1, #16084	; 0x3ed4
     204:	e3401000 	movt	r1, #0
     208:	eb000e25 	bl	3aa4 <printf>
  close(fd);
     20c:	e1a00005 	mov	r0, r5
     210:	eb000d18 	bl	3678 <close>
  fd = open("small", O_RDONLY);
     214:	e3030e34 	movw	r0, #15924	; 0x3e34
     218:	e3a01000 	mov	r1, #0
     21c:	e3400000 	movt	r0, #0
     220:	eb000d3b 	bl	3714 <open>
  if(fd >= 0){
     224:	e2504000 	subs	r4, r0, #0
     228:	ba000027 	blt	2cc <writetest+0x168>
    printf(stdout, "open small succeeded ok\n");
     22c:	e5980000 	ldr	r0, [r8]
     230:	e3031ee0 	movw	r1, #16096	; 0x3ee0
     234:	e3401000 	movt	r1, #0
     238:	eb000e19 	bl	3aa4 <printf>
  i = read(fd, buf, 2000);
     23c:	e3071fcc 	movw	r1, #32716	; 0x7fcc
     240:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     244:	e3401000 	movt	r1, #0
     248:	e1a00004 	mov	r0, r4
     24c:	eb000cef 	bl	3610 <read>
  if(i == 2000){
     250:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     254:	1a000021 	bne	2e0 <writetest+0x17c>
    printf(stdout, "read succeeded ok\n");
     258:	e5980000 	ldr	r0, [r8]
     25c:	e3031f18 	movw	r1, #16152	; 0x3f18
     260:	e3401000 	movt	r1, #0
     264:	eb000e0e 	bl	3aa4 <printf>
  close(fd);
     268:	e1a00004 	mov	r0, r4
     26c:	eb000d01 	bl	3678 <close>
  if(unlink("small") < 0){
     270:	e3030e34 	movw	r0, #15924	; 0x3e34
     274:	e3400000 	movt	r0, #0
     278:	eb000d3f 	bl	377c <unlink>
     27c:	e3500000 	cmp	r0, #0
     280:	ba00001b 	blt	2f4 <writetest+0x190>
  printf(stdout, "small file test ok\n");
     284:	e5980000 	ldr	r0, [r8]
     288:	e3031f54 	movw	r1, #16212	; 0x3f54
     28c:	e3401000 	movt	r1, #0
}
     290:	e24bd01c 	sub	sp, fp, #28
     294:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test ok\n");
     298:	ea000e01 	b	3aa4 <printf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     29c:	e1a02004 	mov	r2, r4
     2a0:	e5980000 	ldr	r0, [r8]
     2a4:	e3031e80 	movw	r1, #16000	; 0x3e80
     2a8:	e3401000 	movt	r1, #0
     2ac:	eb000dfc 	bl	3aa4 <printf>
      exit();
     2b0:	eb000ca2 	bl	3540 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     2b4:	e1a02004 	mov	r2, r4
     2b8:	e5980000 	ldr	r0, [r8]
     2bc:	e3031eb0 	movw	r1, #16048	; 0x3eb0
     2c0:	e3401000 	movt	r1, #0
     2c4:	eb000df6 	bl	3aa4 <printf>
      exit();
     2c8:	eb000c9c 	bl	3540 <exit>
    printf(stdout, "error: open small failed!\n");
     2cc:	e5980000 	ldr	r0, [r8]
     2d0:	e3031efc 	movw	r1, #16124	; 0x3efc
     2d4:	e3401000 	movt	r1, #0
     2d8:	eb000df1 	bl	3aa4 <printf>
    exit();
     2dc:	eb000c97 	bl	3540 <exit>
    printf(stdout, "read failed\n");
     2e0:	e5980000 	ldr	r0, [r8]
     2e4:	e3031f2c 	movw	r1, #16172	; 0x3f2c
     2e8:	e3401000 	movt	r1, #0
     2ec:	eb000dec 	bl	3aa4 <printf>
    exit();
     2f0:	eb000c92 	bl	3540 <exit>
    printf(stdout, "unlink small failed\n");
     2f4:	e5980000 	ldr	r0, [r8]
     2f8:	e3031f3c 	movw	r1, #16188	; 0x3f3c
     2fc:	e3401000 	movt	r1, #0
     300:	eb000de7 	bl	3aa4 <printf>
    exit();
     304:	eb000c8d 	bl	3540 <exit>
    printf(stdout, "error: creat small failed!\n");
     308:	e5980000 	ldr	r0, [r8]
     30c:	e3031e58 	movw	r1, #15960	; 0x3e58
     310:	e3401000 	movt	r1, #0
     314:	eb000de2 	bl	3aa4 <printf>
    exit();
     318:	eb000c88 	bl	3540 <exit>

0000031c <writetest1>:
{
     31c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files test\n");
     320:	e3058814 	movw	r8, #22548	; 0x5814
     324:	e3408000 	movt	r8, #0
{
     328:	e28db01c 	add	fp, sp, #28
  printf(stdout, "big files test\n");
     32c:	e3031f68 	movw	r1, #16232	; 0x3f68
     330:	e3401000 	movt	r1, #0
     334:	e5980000 	ldr	r0, [r8]
     338:	eb000dd9 	bl	3aa4 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     33c:	e3030f78 	movw	r0, #16248	; 0x3f78
     340:	e3001202 	movw	r1, #514	; 0x202
     344:	e3400000 	movt	r0, #0
     348:	eb000cf1 	bl	3714 <open>
  if(fd < 0){
     34c:	e2506000 	subs	r6, r0, #0
     350:	a3075fcc 	movwge	r5, #32716	; 0x7fcc
     354:	a3405000 	movtge	r5, #0
  for(i = 0; i < MAXFILE; i++){
     358:	a3a04000 	movge	r4, #0
    if(write(fd, buf, 512) != 512){
     35c:	a1a07005 	movge	r7, r5
  if(fd < 0){
     360:	ba00004d 	blt	49c <writetest1+0x180>
    if(write(fd, buf, 512) != 512){
     364:	e3a02c02 	mov	r2, #512	; 0x200
     368:	e1a01007 	mov	r1, r7
     36c:	e1a00006 	mov	r0, r6
    ((int*)buf)[0] = i;
     370:	e5854000 	str	r4, [r5]
    if(write(fd, buf, 512) != 512){
     374:	eb000cb2 	bl	3644 <write>
     378:	e3500c02 	cmp	r0, #512	; 0x200
     37c:	1a000029 	bne	428 <writetest1+0x10c>
  for(i = 0; i < MAXFILE; i++){
     380:	e2844001 	add	r4, r4, #1
     384:	e354008c 	cmp	r4, #140	; 0x8c
     388:	1afffff5 	bne	364 <writetest1+0x48>
  close(fd);
     38c:	e1a00006 	mov	r0, r6
     390:	eb000cb8 	bl	3678 <close>
  fd = open("big", O_RDONLY);
     394:	e3030f78 	movw	r0, #16248	; 0x3f78
     398:	e3a01000 	mov	r1, #0
     39c:	e3400000 	movt	r0, #0
     3a0:	eb000cdb 	bl	3714 <open>
  if(fd < 0){
     3a4:	e2507000 	subs	r7, r0, #0
    i = read(fd, buf, 512);
     3a8:	a3076fcc 	movwge	r6, #32716	; 0x7fcc
  n = 0;
     3ac:	a3a04000 	movge	r4, #0
    i = read(fd, buf, 512);
     3b0:	a3406000 	movtge	r6, #0
  if(fd < 0){
     3b4:	aa000006 	bge	3d4 <writetest1+0xb8>
     3b8:	ea000032 	b	488 <writetest1+0x16c>
    } else if(i != 512){
     3bc:	e3500c02 	cmp	r0, #512	; 0x200
     3c0:	1a000024 	bne	458 <writetest1+0x13c>
    if(((int*)buf)[0] != n){
     3c4:	e5953000 	ldr	r3, [r5]
     3c8:	e1530004 	cmp	r3, r4
     3cc:	1a00001b 	bne	440 <writetest1+0x124>
    n++;
     3d0:	e2844001 	add	r4, r4, #1
    i = read(fd, buf, 512);
     3d4:	e3a02c02 	mov	r2, #512	; 0x200
     3d8:	e1a01006 	mov	r1, r6
     3dc:	e1a00007 	mov	r0, r7
     3e0:	eb000c8a 	bl	3610 <read>
    if(i == 0){
     3e4:	e3500000 	cmp	r0, #0
     3e8:	1afffff3 	bne	3bc <writetest1+0xa0>
      if(n == MAXFILE - 1){
     3ec:	e354008b 	cmp	r4, #139	; 0x8b
     3f0:	0a00001e 	beq	470 <writetest1+0x154>
  close(fd);
     3f4:	e1a00007 	mov	r0, r7
     3f8:	eb000c9e 	bl	3678 <close>
  if(unlink("big") < 0){
     3fc:	e3030f78 	movw	r0, #16248	; 0x3f78
     400:	e3400000 	movt	r0, #0
     404:	eb000cdc 	bl	377c <unlink>
     408:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink big failed\n");
     40c:	e5980000 	ldr	r0, [r8]
  if(unlink("big") < 0){
     410:	ba000026 	blt	4b0 <writetest1+0x194>
  printf(stdout, "big files ok\n");
     414:	e3041038 	movw	r1, #16440	; 0x4038
     418:	e3401000 	movt	r1, #0
}
     41c:	e24bd01c 	sub	sp, fp, #28
     420:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files ok\n");
     424:	ea000d9e 	b	3aa4 <printf>
      printf(stdout, "error: write big file failed\n", i);
     428:	e1a02004 	mov	r2, r4
     42c:	e5980000 	ldr	r0, [r8]
     430:	e3031f98 	movw	r1, #16280	; 0x3f98
     434:	e3401000 	movt	r1, #0
     438:	eb000d99 	bl	3aa4 <printf>
      exit();
     43c:	eb000c3f 	bl	3540 <exit>
      printf(stdout, "read content of block %d is %d\n",
     440:	e1a02004 	mov	r2, r4
     444:	e5980000 	ldr	r0, [r8]
     448:	e3041004 	movw	r1, #16388	; 0x4004
     44c:	e3401000 	movt	r1, #0
     450:	eb000d93 	bl	3aa4 <printf>
      exit();
     454:	eb000c39 	bl	3540 <exit>
      printf(stdout, "read failed %d\n", i);
     458:	e1a02000 	mov	r2, r0
     45c:	e3031ff4 	movw	r1, #16372	; 0x3ff4
     460:	e5980000 	ldr	r0, [r8]
     464:	e3401000 	movt	r1, #0
     468:	eb000d8d 	bl	3aa4 <printf>
      exit();
     46c:	eb000c33 	bl	3540 <exit>
        printf(stdout, "read only %d blocks from big", n);
     470:	e1a02004 	mov	r2, r4
     474:	e5980000 	ldr	r0, [r8]
     478:	e3031fd4 	movw	r1, #16340	; 0x3fd4
     47c:	e3401000 	movt	r1, #0
     480:	eb000d87 	bl	3aa4 <printf>
        exit();
     484:	eb000c2d 	bl	3540 <exit>
    printf(stdout, "error: open big failed!\n");
     488:	e5980000 	ldr	r0, [r8]
     48c:	e3031fb8 	movw	r1, #16312	; 0x3fb8
     490:	e3401000 	movt	r1, #0
     494:	eb000d82 	bl	3aa4 <printf>
    exit();
     498:	eb000c28 	bl	3540 <exit>
    printf(stdout, "error: creat big failed!\n");
     49c:	e5980000 	ldr	r0, [r8]
     4a0:	e3031f7c 	movw	r1, #16252	; 0x3f7c
     4a4:	e3401000 	movt	r1, #0
     4a8:	eb000d7d 	bl	3aa4 <printf>
    exit();
     4ac:	eb000c23 	bl	3540 <exit>
    printf(stdout, "unlink big failed\n");
     4b0:	e3041024 	movw	r1, #16420	; 0x4024
     4b4:	e3401000 	movt	r1, #0
     4b8:	eb000d79 	bl	3aa4 <printf>
    exit();
     4bc:	eb000c1f 	bl	3540 <exit>

000004c0 <createtest>:
{
     4c0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink test\n");
     4c4:	e3057814 	movw	r7, #22548	; 0x5814
  name[0] = 'a';
     4c8:	e3095fcc 	movw	r5, #40908	; 0x9fcc
  printf(stdout, "many creates, followed by unlink test\n");
     4cc:	e3407000 	movt	r7, #0
  name[0] = 'a';
     4d0:	e3405000 	movt	r5, #0
{
     4d4:	e28db014 	add	fp, sp, #20
  printf(stdout, "many creates, followed by unlink test\n");
     4d8:	e3041048 	movw	r1, #16456	; 0x4048
     4dc:	e5970000 	ldr	r0, [r7]
     4e0:	e3401000 	movt	r1, #0
  name[2] = '\0';
     4e4:	e3a04030 	mov	r4, #48	; 0x30
    fd = open(name, O_CREATE|O_RDWR);
     4e8:	e1a06005 	mov	r6, r5
  printf(stdout, "many creates, followed by unlink test\n");
     4ec:	eb000d6c 	bl	3aa4 <printf>
  name[0] = 'a';
     4f0:	e3a02061 	mov	r2, #97	; 0x61
  name[2] = '\0';
     4f4:	e3a03000 	mov	r3, #0
  name[0] = 'a';
     4f8:	e5c52000 	strb	r2, [r5]
  name[2] = '\0';
     4fc:	e5c53002 	strb	r3, [r5, #2]
    name[1] = '0' + i;
     500:	e5c54001 	strb	r4, [r5, #1]
    fd = open(name, O_CREATE|O_RDWR);
     504:	e2844001 	add	r4, r4, #1
     508:	e3001202 	movw	r1, #514	; 0x202
     50c:	e1a00006 	mov	r0, r6
     510:	eb000c7f 	bl	3714 <open>
    close(fd);
     514:	e6ef4074 	uxtb	r4, r4
     518:	eb000c56 	bl	3678 <close>
  for(i = 0; i < 52; i++){
     51c:	e3540064 	cmp	r4, #100	; 0x64
     520:	1afffff6 	bne	500 <createtest+0x40>
    unlink(name);
     524:	e3096fcc 	movw	r6, #40908	; 0x9fcc
     528:	e3406000 	movt	r6, #0
  name[2] = '\0';
     52c:	e3a04030 	mov	r4, #48	; 0x30
  name[0] = 'a';
     530:	e3a02061 	mov	r2, #97	; 0x61
  name[2] = '\0';
     534:	e3a03000 	mov	r3, #0
  name[0] = 'a';
     538:	e5c52000 	strb	r2, [r5]
  name[2] = '\0';
     53c:	e5c53002 	strb	r3, [r5, #2]
    name[1] = '0' + i;
     540:	e5c54001 	strb	r4, [r5, #1]
    unlink(name);
     544:	e2844001 	add	r4, r4, #1
     548:	e1a00006 	mov	r0, r6
     54c:	e6ef4074 	uxtb	r4, r4
     550:	eb000c89 	bl	377c <unlink>
  for(i = 0; i < 52; i++){
     554:	e3540064 	cmp	r4, #100	; 0x64
     558:	1afffff8 	bne	540 <createtest+0x80>
  printf(stdout, "many creates, followed by unlink; ok\n");
     55c:	e5970000 	ldr	r0, [r7]
     560:	e3041070 	movw	r1, #16496	; 0x4070
     564:	e3401000 	movt	r1, #0
}
     568:	e24bd014 	sub	sp, fp, #20
     56c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink; ok\n");
     570:	ea000d4b 	b	3aa4 <printf>

00000574 <dirtest>:
{
     574:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     578:	e3054814 	movw	r4, #22548	; 0x5814
     57c:	e3404000 	movt	r4, #0
{
     580:	e28db00c 	add	fp, sp, #12
  printf(stdout, "mkdir test\n");
     584:	e3041098 	movw	r1, #16536	; 0x4098
     588:	e3401000 	movt	r1, #0
     58c:	e5940000 	ldr	r0, [r4]
     590:	eb000d43 	bl	3aa4 <printf>
  if(mkdir("dir0") < 0){
     594:	e30400a4 	movw	r0, #16548	; 0x40a4
     598:	e3400000 	movt	r0, #0
     59c:	eb000c9d 	bl	3818 <mkdir>
     5a0:	e3500000 	cmp	r0, #0
     5a4:	ba000014 	blt	5fc <dirtest+0x88>
  if(chdir("dir0") < 0){
     5a8:	e30400a4 	movw	r0, #16548	; 0x40a4
     5ac:	e3400000 	movt	r0, #0
     5b0:	eb000ca5 	bl	384c <chdir>
     5b4:	e3500000 	cmp	r0, #0
     5b8:	ba00001d 	blt	634 <dirtest+0xc0>
  if(chdir("..") < 0){
     5bc:	e30400d0 	movw	r0, #16592	; 0x40d0
     5c0:	e3400000 	movt	r0, #0
     5c4:	eb000ca0 	bl	384c <chdir>
     5c8:	e3500000 	cmp	r0, #0
     5cc:	ba000013 	blt	620 <dirtest+0xac>
  if(unlink("dir0") < 0){
     5d0:	e30400a4 	movw	r0, #16548	; 0x40a4
     5d4:	e3400000 	movt	r0, #0
     5d8:	eb000c67 	bl	377c <unlink>
     5dc:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink dir0 failed\n");
     5e0:	e5940000 	ldr	r0, [r4]
  if(unlink("dir0") < 0){
     5e4:	ba000009 	blt	610 <dirtest+0x9c>
  printf(stdout, "mkdir test\n");
     5e8:	e3041098 	movw	r1, #16536	; 0x4098
     5ec:	e3401000 	movt	r1, #0
}
     5f0:	e24bd00c 	sub	sp, fp, #12
     5f4:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     5f8:	ea000d29 	b	3aa4 <printf>
    printf(stdout, "mkdir failed\n");
     5fc:	e5940000 	ldr	r0, [r4]
     600:	e30410ac 	movw	r1, #16556	; 0x40ac
     604:	e3401000 	movt	r1, #0
     608:	eb000d25 	bl	3aa4 <printf>
    exit();
     60c:	eb000bcb 	bl	3540 <exit>
    printf(stdout, "unlink dir0 failed\n");
     610:	e30410e8 	movw	r1, #16616	; 0x40e8
     614:	e3401000 	movt	r1, #0
     618:	eb000d21 	bl	3aa4 <printf>
    exit();
     61c:	eb000bc7 	bl	3540 <exit>
    printf(stdout, "chdir .. failed\n");
     620:	e5940000 	ldr	r0, [r4]
     624:	e30410d4 	movw	r1, #16596	; 0x40d4
     628:	e3401000 	movt	r1, #0
     62c:	eb000d1c 	bl	3aa4 <printf>
    exit();
     630:	eb000bc2 	bl	3540 <exit>
    printf(stdout, "chdir dir0 failed\n");
     634:	e5940000 	ldr	r0, [r4]
     638:	e30410bc 	movw	r1, #16572	; 0x40bc
     63c:	e3401000 	movt	r1, #0
     640:	eb000d17 	bl	3aa4 <printf>
    exit();
     644:	eb000bbd 	bl	3540 <exit>

00000648 <exectest>:
{
     648:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "exec test\n");
     64c:	e3054814 	movw	r4, #22548	; 0x5814
     650:	e3404000 	movt	r4, #0
{
     654:	e28db00c 	add	fp, sp, #12
  printf(stdout, "exec test\n");
     658:	e30410fc 	movw	r1, #16636	; 0x40fc
     65c:	e3401000 	movt	r1, #0
     660:	e5940000 	ldr	r0, [r4]
     664:	eb000d0e 	bl	3aa4 <printf>
  if(exec("echo", echoargv) < 0){
     668:	e2841004 	add	r1, r4, #4
     66c:	e3030dc4 	movw	r0, #15812	; 0x3dc4
     670:	e3400000 	movt	r0, #0
     674:	eb000c19 	bl	36e0 <exec>
     678:	e3500000 	cmp	r0, #0
     67c:	a8bd8830 	popge	{r4, r5, fp, pc}
    printf(stdout, "exec echo failed\n");
     680:	e5940000 	ldr	r0, [r4]
     684:	e3041108 	movw	r1, #16648	; 0x4108
     688:	e3401000 	movt	r1, #0
     68c:	eb000d04 	bl	3aa4 <printf>
    exit();
     690:	eb000baa 	bl	3540 <exit>

00000694 <pipe1>:
{
     694:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     698:	e28db018 	add	fp, sp, #24
  if(pipe(fds) != 0){
     69c:	e24b0024 	sub	r0, fp, #36	; 0x24
{
     6a0:	e24dd00c 	sub	sp, sp, #12
  if(pipe(fds) != 0){
     6a4:	eb000bcc 	bl	35dc <pipe>
     6a8:	e2504000 	subs	r4, r0, #0
     6ac:	1a000051 	bne	7f8 <pipe1+0x164>
  pid = fork();
     6b0:	eb000b95 	bl	350c <fork>
  if(pid == 0){
     6b4:	e3500000 	cmp	r0, #0
     6b8:	0a000021 	beq	744 <pipe1+0xb0>
  } else if(pid > 0){
     6bc:	da000052 	ble	80c <pipe1+0x178>
    close(fds[1]);
     6c0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    while((n = read(fds[0], buf, cc)) > 0){
     6c4:	e3075fcc 	movw	r5, #32716	; 0x7fcc
    close(fds[1]);
     6c8:	eb000bea 	bl	3678 <close>
    while((n = read(fds[0], buf, cc)) > 0){
     6cc:	e3405000 	movt	r5, #0
    total = 0;
     6d0:	e1a06004 	mov	r6, r4
    cc = 1;
     6d4:	e3a07001 	mov	r7, #1
    while((n = read(fds[0], buf, cc)) > 0){
     6d8:	e1a02007 	mov	r2, r7
     6dc:	e1a01005 	mov	r1, r5
     6e0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     6e4:	eb000bc9 	bl	3610 <read>
     6e8:	e3500000 	cmp	r0, #0
     6ec:	da000030 	ble	7b4 <pipe1+0x120>
     6f0:	e3073fcc 	movw	r3, #32716	; 0x7fcc
     6f4:	e080c004 	add	ip, r0, r4
     6f8:	e3403000 	movt	r3, #0
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     6fc:	e4d31001 	ldrb	r1, [r3], #1
     700:	e6ef2074 	uxtb	r2, r4
     704:	e2844001 	add	r4, r4, #1
     708:	e1510002 	cmp	r1, r2
     70c:	1a000006 	bne	72c <pipe1+0x98>
      for(i = 0; i < n; i++){
     710:	e154000c 	cmp	r4, ip
     714:	1afffff8 	bne	6fc <pipe1+0x68>
      cc = cc * 2;
     718:	e1a07087 	lsl	r7, r7, #1
      total += n;
     71c:	e0866000 	add	r6, r6, r0
      if(cc > sizeof(buf))
     720:	e3570a02 	cmp	r7, #8192	; 0x2000
     724:	a3a07a02 	movge	r7, #8192	; 0x2000
     728:	eaffffea 	b	6d8 <pipe1+0x44>
          printf(1, "pipe1 oops 2\n");
     72c:	e304113c 	movw	r1, #16700	; 0x413c
     730:	e3a00001 	mov	r0, #1
     734:	e3401000 	movt	r1, #0
     738:	eb000cd9 	bl	3aa4 <printf>
}
     73c:	e24bd018 	sub	sp, fp, #24
     740:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    close(fds[0]);
     744:	e3076fcc 	movw	r6, #32716	; 0x7fcc
     748:	e3406000 	movt	r6, #0
     74c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
      if(write(fds[1], buf, 1033) != 1033){
     750:	e3007409 	movw	r7, #1033	; 0x409
    close(fds[0]);
     754:	eb000bc7 	bl	3678 <close>
    for(n = 0; n < 5; n++){
     758:	e6ef3076 	uxtb	r3, r6
     75c:	e2638000 	rsb	r8, r3, #0
     760:	e263302d 	rsb	r3, r3, #45	; 0x2d
     764:	e59f40c8 	ldr	r4, [pc, #200]	; 834 <pipe1+0x1a0>
     768:	e6ef8078 	uxtb	r8, r8
     76c:	e6ef5073 	uxtb	r5, r3
     770:	e59f30c0 	ldr	r3, [pc, #192]	; 838 <pipe1+0x1a4>
     774:	e2881001 	add	r1, r8, #1
        buf[i] = seq++;
     778:	e0812003 	add	r2, r1, r3
     77c:	e5e32001 	strb	r2, [r3, #1]!
      for(i = 0; i < 1033; i++)
     780:	e1530004 	cmp	r3, r4
     784:	1afffffb 	bne	778 <pipe1+0xe4>
      if(write(fds[1], buf, 1033) != 1033){
     788:	e3002409 	movw	r2, #1033	; 0x409
     78c:	e1a01006 	mov	r1, r6
     790:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     794:	eb000baa 	bl	3644 <write>
     798:	e1500007 	cmp	r0, r7
     79c:	1a00001f 	bne	820 <pipe1+0x18c>
     7a0:	e2888009 	add	r8, r8, #9
     7a4:	e6ef8078 	uxtb	r8, r8
    for(n = 0; n < 5; n++){
     7a8:	e1550008 	cmp	r5, r8
     7ac:	1affffef 	bne	770 <pipe1+0xdc>
      exit();
     7b0:	eb000b62 	bl	3540 <exit>
    if(total != 5 * 1033){
     7b4:	e301342d 	movw	r3, #5165	; 0x142d
     7b8:	e1560003 	cmp	r6, r3
     7bc:	1a000007 	bne	7e0 <pipe1+0x14c>
    close(fds[0]);
     7c0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     7c4:	eb000bab 	bl	3678 <close>
    wait();
     7c8:	eb000b69 	bl	3574 <wait>
  printf(1, "pipe1 ok\n");
     7cc:	e3041164 	movw	r1, #16740	; 0x4164
     7d0:	e3a00001 	mov	r0, #1
     7d4:	e3401000 	movt	r1, #0
     7d8:	eb000cb1 	bl	3aa4 <printf>
     7dc:	eaffffd6 	b	73c <pipe1+0xa8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     7e0:	e1a02006 	mov	r2, r6
     7e4:	e304114c 	movw	r1, #16716	; 0x414c
     7e8:	e3a00001 	mov	r0, #1
     7ec:	e3401000 	movt	r1, #0
     7f0:	eb000cab 	bl	3aa4 <printf>
     7f4:	eaffffed 	b	7b0 <pipe1+0x11c>
    printf(1, "pipe() failed\n");
     7f8:	e304111c 	movw	r1, #16668	; 0x411c
     7fc:	e3a00001 	mov	r0, #1
     800:	e3401000 	movt	r1, #0
     804:	eb000ca6 	bl	3aa4 <printf>
    exit();
     808:	eb000b4c 	bl	3540 <exit>
    printf(1, "fork() failed\n");
     80c:	e3041170 	movw	r1, #16752	; 0x4170
     810:	e3a00001 	mov	r0, #1
     814:	e3401000 	movt	r1, #0
     818:	eb000ca1 	bl	3aa4 <printf>
    exit();
     81c:	eb000b47 	bl	3540 <exit>
        printf(1, "pipe1 oops 1\n");
     820:	e304112c 	movw	r1, #16684	; 0x412c
     824:	e3a00001 	mov	r0, #1
     828:	e3401000 	movt	r1, #0
     82c:	eb000c9c 	bl	3aa4 <printf>
        exit();
     830:	eb000b42 	bl	3540 <exit>
     834:	000083d4 	.word	0x000083d4
     838:	00007fcb 	.word	0x00007fcb

0000083c <preempt>:
{
     83c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "preempt: ");
     840:	e3a00001 	mov	r0, #1
{
     844:	e28db014 	add	fp, sp, #20
  printf(1, "preempt: ");
     848:	e3041180 	movw	r1, #16768	; 0x4180
{
     84c:	e24dd008 	sub	sp, sp, #8
  printf(1, "preempt: ");
     850:	e3401000 	movt	r1, #0
     854:	eb000c92 	bl	3aa4 <printf>
  pid1 = fork();
     858:	eb000b2b 	bl	350c <fork>
  if(pid1 == 0)
     85c:	e2507000 	subs	r7, r0, #0
     860:	1a000000 	bne	868 <preempt+0x2c>
      ;
     864:	eafffffe 	b	864 <preempt+0x28>
  pid2 = fork();
     868:	eb000b27 	bl	350c <fork>
  if(pid2 == 0)
     86c:	e2506000 	subs	r6, r0, #0
     870:	1a000000 	bne	878 <preempt+0x3c>
      ;
     874:	eafffffe 	b	874 <preempt+0x38>
  pipe(pfds);
     878:	e24b001c 	sub	r0, fp, #28
     87c:	eb000b56 	bl	35dc <pipe>
  pid3 = fork();
     880:	eb000b21 	bl	350c <fork>
  if(pid3 == 0){
     884:	e2505000 	subs	r5, r0, #0
     888:	1a00000b 	bne	8bc <preempt+0x80>
    close(pfds[0]);
     88c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     890:	eb000b78 	bl	3678 <close>
    if(write(pfds[1], "x", 1) != 1)
     894:	e3041aec 	movw	r1, #19180	; 0x4aec
     898:	e3a02001 	mov	r2, #1
     89c:	e3401000 	movt	r1, #0
     8a0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8a4:	eb000b66 	bl	3644 <write>
     8a8:	e3500001 	cmp	r0, #1
     8ac:	1a000025 	bne	948 <preempt+0x10c>
    close(pfds[1]);
     8b0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8b4:	eb000b6f 	bl	3678 <close>
      ;
     8b8:	eafffffe 	b	8b8 <preempt+0x7c>
  close(pfds[1]);
     8bc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8c0:	eb000b6c 	bl	3678 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     8c4:	e3071fcc 	movw	r1, #32716	; 0x7fcc
     8c8:	e3a02a02 	mov	r2, #8192	; 0x2000
     8cc:	e3401000 	movt	r1, #0
     8d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8d4:	eb000b4d 	bl	3610 <read>
     8d8:	e3500001 	cmp	r0, #1
     8dc:	e1a04000 	mov	r4, r0
     8e0:	1a00001d 	bne	95c <preempt+0x120>
  close(pfds[0]);
     8e4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8e8:	eb000b62 	bl	3678 <close>
  printf(1, "kill... ");
     8ec:	e1a00004 	mov	r0, r4
     8f0:	e30411b4 	movw	r1, #16820	; 0x41b4
     8f4:	e3401000 	movt	r1, #0
     8f8:	eb000c69 	bl	3aa4 <printf>
  kill(pid1);
     8fc:	e1a00007 	mov	r0, r7
     900:	eb000b69 	bl	36ac <kill>
  kill(pid2);
     904:	e1a00006 	mov	r0, r6
     908:	eb000b67 	bl	36ac <kill>
  kill(pid3);
     90c:	e1a00005 	mov	r0, r5
     910:	eb000b65 	bl	36ac <kill>
  printf(1, "wait... ");
     914:	e1a00004 	mov	r0, r4
     918:	e30411c0 	movw	r1, #16832	; 0x41c0
     91c:	e3401000 	movt	r1, #0
     920:	eb000c5f 	bl	3aa4 <printf>
  wait();
     924:	eb000b12 	bl	3574 <wait>
  wait();
     928:	eb000b11 	bl	3574 <wait>
  wait();
     92c:	eb000b10 	bl	3574 <wait>
  printf(1, "preempt ok\n");
     930:	e30411cc 	movw	r1, #16844	; 0x41cc
     934:	e1a00004 	mov	r0, r4
     938:	e3401000 	movt	r1, #0
     93c:	eb000c58 	bl	3aa4 <printf>
}
     940:	e24bd014 	sub	sp, fp, #20
     944:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      printf(1, "preempt write error");
     948:	e304118c 	movw	r1, #16780	; 0x418c
     94c:	e3a00001 	mov	r0, #1
     950:	e3401000 	movt	r1, #0
     954:	eb000c52 	bl	3aa4 <printf>
     958:	eaffffd4 	b	8b0 <preempt+0x74>
    printf(1, "preempt read error");
     95c:	e30411a0 	movw	r1, #16800	; 0x41a0
     960:	e3a00001 	mov	r0, #1
     964:	e3401000 	movt	r1, #0
     968:	eb000c4d 	bl	3aa4 <printf>
    return;
     96c:	eafffff3 	b	940 <preempt+0x104>

00000970 <exitwait>:
{
     970:	e92d4830 	push	{r4, r5, fp, lr}
     974:	e3a04064 	mov	r4, #100	; 0x64
     978:	e28db00c 	add	fp, sp, #12
     97c:	ea000005 	b	998 <exitwait+0x28>
    if(pid){
     980:	0a000019 	beq	9ec <exitwait+0x7c>
      if(wait() != pid){
     984:	eb000afa 	bl	3574 <wait>
     988:	e1500005 	cmp	r0, r5
     98c:	1a00000a 	bne	9bc <exitwait+0x4c>
  for(i = 0; i < 100; i++){
     990:	e2544001 	subs	r4, r4, #1
     994:	0a00000e 	beq	9d4 <exitwait+0x64>
    pid = fork();
     998:	eb000adb 	bl	350c <fork>
    if(pid < 0){
     99c:	e2505000 	subs	r5, r0, #0
     9a0:	aafffff6 	bge	980 <exitwait+0x10>
      printf(1, "fork failed\n");
     9a4:	e3051718 	movw	r1, #22296	; 0x5718
     9a8:	e3a00001 	mov	r0, #1
     9ac:	e3401000 	movt	r1, #0
}
     9b0:	e24bd00c 	sub	sp, fp, #12
     9b4:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9b8:	ea000c39 	b	3aa4 <printf>
        printf(1, "wait wrong pid\n");
     9bc:	e30411d8 	movw	r1, #16856	; 0x41d8
     9c0:	e3a00001 	mov	r0, #1
     9c4:	e3401000 	movt	r1, #0
}
     9c8:	e24bd00c 	sub	sp, fp, #12
     9cc:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9d0:	ea000c33 	b	3aa4 <printf>
     9d4:	e30411e8 	movw	r1, #16872	; 0x41e8
     9d8:	e3a00001 	mov	r0, #1
     9dc:	e3401000 	movt	r1, #0
}
     9e0:	e24bd00c 	sub	sp, fp, #12
     9e4:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9e8:	ea000c2d 	b	3aa4 <printf>
      exit();
     9ec:	eb000ad3 	bl	3540 <exit>

000009f0 <mem>:
{
     9f0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "mem test\n");
     9f4:	e3a00001 	mov	r0, #1
{
     9f8:	e28db014 	add	fp, sp, #20
  printf(1, "mem test\n");
     9fc:	e30411f8 	movw	r1, #16888	; 0x41f8
     a00:	e3401000 	movt	r1, #0
     a04:	eb000c26 	bl	3aa4 <printf>
  ppid = getpid();
     a08:	eb000ba9 	bl	38b4 <getpid>
     a0c:	e1a06000 	mov	r6, r0
  if((pid = fork()) == 0){
     a10:	eb000abd 	bl	350c <fork>
     a14:	e2504000 	subs	r4, r0, #0
     a18:	0a000002 	beq	a28 <mem+0x38>
     a1c:	ea00001d 	b	a98 <mem+0xa8>
      *(char**)m2 = m1;
     a20:	e5804000 	str	r4, [r0]
     a24:	e1a04000 	mov	r4, r0
    while((m2 = malloc(10001)) != 0){
     a28:	e3020711 	movw	r0, #10001	; 0x2711
     a2c:	eb000ca7 	bl	3cd0 <malloc>
     a30:	e3500000 	cmp	r0, #0
     a34:	1afffff9 	bne	a20 <mem+0x30>
    while(m1){
     a38:	e3540000 	cmp	r4, #0
     a3c:	0a000004 	beq	a54 <mem+0x64>
      m2 = *(char**)m1;
     a40:	e5945000 	ldr	r5, [r4]
      free(m1);
     a44:	e1a00004 	mov	r0, r4
     a48:	eb000c79 	bl	3c34 <free>
    while(m1){
     a4c:	e2554000 	subs	r4, r5, #0
     a50:	1afffffa 	bne	a40 <mem+0x50>
    m1 = malloc(1024*20);
     a54:	e3a00a05 	mov	r0, #20480	; 0x5000
     a58:	eb000c9c 	bl	3cd0 <malloc>
    if(m1 == 0){
     a5c:	e3500000 	cmp	r0, #0
     a60:	0a000005 	beq	a7c <mem+0x8c>
    free(m1);
     a64:	eb000c72 	bl	3c34 <free>
    printf(1, "mem ok\n");
     a68:	e3041220 	movw	r1, #16928	; 0x4220
     a6c:	e3a00001 	mov	r0, #1
     a70:	e3401000 	movt	r1, #0
     a74:	eb000c0a 	bl	3aa4 <printf>
    exit();
     a78:	eb000ab0 	bl	3540 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     a7c:	e3a00001 	mov	r0, #1
     a80:	e3041204 	movw	r1, #16900	; 0x4204
     a84:	e3401000 	movt	r1, #0
     a88:	eb000c05 	bl	3aa4 <printf>
      kill(ppid);
     a8c:	e1a00006 	mov	r0, r6
     a90:	eb000b05 	bl	36ac <kill>
      exit();
     a94:	eb000aa9 	bl	3540 <exit>
}
     a98:	e24bd014 	sub	sp, fp, #20
     a9c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    wait();
     aa0:	ea000ab3 	b	3574 <wait>

00000aa4 <sharedfd>:
{
     aa4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "sharedfd test\n");
     aa8:	e3a00001 	mov	r0, #1
{
     aac:	e28db014 	add	fp, sp, #20
  printf(1, "sharedfd test\n");
     ab0:	e3041228 	movw	r1, #16936	; 0x4228
{
     ab4:	e24dd010 	sub	sp, sp, #16
  printf(1, "sharedfd test\n");
     ab8:	e3401000 	movt	r1, #0
     abc:	eb000bf8 	bl	3aa4 <printf>
  unlink("sharedfd");
     ac0:	e3040238 	movw	r0, #16952	; 0x4238
     ac4:	e3400000 	movt	r0, #0
     ac8:	eb000b2b 	bl	377c <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     acc:	e3040238 	movw	r0, #16952	; 0x4238
     ad0:	e3001202 	movw	r1, #514	; 0x202
     ad4:	e3400000 	movt	r0, #0
     ad8:	eb000b0d 	bl	3714 <open>
  if(fd < 0){
     adc:	e2505000 	subs	r5, r0, #0
     ae0:	ba000041 	blt	bec <sharedfd+0x148>
  pid = fork();
     ae4:	eb000a88 	bl	350c <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ae8:	e3a0200a 	mov	r2, #10
     aec:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     af0:	e2506000 	subs	r6, r0, #0
     af4:	e24b0020 	sub	r0, fp, #32
     af8:	03a01063 	moveq	r1, #99	; 0x63
     afc:	13a01070 	movne	r1, #112	; 0x70
     b00:	eb000a13 	bl	3354 <memset>
  for(i = 0; i < 1000; i++){
     b04:	ea000001 	b	b10 <sharedfd+0x6c>
     b08:	e2544001 	subs	r4, r4, #1
     b0c:	0a000009 	beq	b38 <sharedfd+0x94>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     b10:	e3a0200a 	mov	r2, #10
     b14:	e24b1020 	sub	r1, fp, #32
     b18:	e1a00005 	mov	r0, r5
     b1c:	eb000ac8 	bl	3644 <write>
     b20:	e350000a 	cmp	r0, #10
     b24:	0afffff7 	beq	b08 <sharedfd+0x64>
      printf(1, "fstests: write sharedfd failed\n");
     b28:	e3041270 	movw	r1, #17008	; 0x4270
     b2c:	e3a00001 	mov	r0, #1
     b30:	e3401000 	movt	r1, #0
     b34:	eb000bda 	bl	3aa4 <printf>
  if(pid == 0)
     b38:	e3560000 	cmp	r6, #0
     b3c:	0a00003c 	beq	c34 <sharedfd+0x190>
    wait();
     b40:	eb000a8b 	bl	3574 <wait>
  close(fd);
     b44:	e1a00005 	mov	r0, r5
     b48:	eb000aca 	bl	3678 <close>
  fd = open("sharedfd", 0);
     b4c:	e3040238 	movw	r0, #16952	; 0x4238
     b50:	e3a01000 	mov	r1, #0
     b54:	e3400000 	movt	r0, #0
     b58:	eb000aed 	bl	3714 <open>
  if(fd < 0){
     b5c:	e2507000 	subs	r7, r0, #0
     b60:	a24b4016 	subge	r4, fp, #22
  nc = np = 0;
     b64:	a3a05000 	movge	r5, #0
     b68:	a1a06005 	movge	r6, r5
  if(fd < 0){
     b6c:	ba000024 	blt	c04 <sharedfd+0x160>
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b70:	e3a0200a 	mov	r2, #10
     b74:	e24b1020 	sub	r1, fp, #32
     b78:	e1a00007 	mov	r0, r7
     b7c:	eb000aa3 	bl	3610 <read>
     b80:	e3500000 	cmp	r0, #0
     b84:	da000009 	ble	bb0 <sharedfd+0x10c>
     b88:	e24b2020 	sub	r2, fp, #32
      if(buf[i] == 'c')
     b8c:	e4d21001 	ldrb	r1, [r2], #1
     b90:	e3510063 	cmp	r1, #99	; 0x63
        nc++;
     b94:	02866001 	addeq	r6, r6, #1
      if(buf[i] == 'c')
     b98:	0a000001 	beq	ba4 <sharedfd+0x100>
      if(buf[i] == 'p')
     b9c:	e3510070 	cmp	r1, #112	; 0x70
        np++;
     ba0:	02855001 	addeq	r5, r5, #1
    for(i = 0; i < sizeof(buf); i++){
     ba4:	e1540002 	cmp	r4, r2
     ba8:	1afffff7 	bne	b8c <sharedfd+0xe8>
     bac:	eaffffef 	b	b70 <sharedfd+0xcc>
  close(fd);
     bb0:	e1a00007 	mov	r0, r7
     bb4:	eb000aaf 	bl	3678 <close>
  unlink("sharedfd");
     bb8:	e3040238 	movw	r0, #16952	; 0x4238
     bbc:	e3400000 	movt	r0, #0
     bc0:	eb000aed 	bl	377c <unlink>
  if(nc == 10000 && np == 10000){
     bc4:	e3023710 	movw	r3, #10000	; 0x2710
     bc8:	e1560003 	cmp	r6, r3
     bcc:	01550003 	cmpeq	r5, r3
     bd0:	1a000011 	bne	c1c <sharedfd+0x178>
    printf(1, "sharedfd ok\n");
     bd4:	e3a00001 	mov	r0, #1
     bd8:	e30412bc 	movw	r1, #17084	; 0x42bc
     bdc:	e3401000 	movt	r1, #0
     be0:	eb000baf 	bl	3aa4 <printf>
}
     be4:	e24bd014 	sub	sp, fp, #20
     be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for writing");
     bec:	e3a00001 	mov	r0, #1
     bf0:	e3041244 	movw	r1, #16964	; 0x4244
     bf4:	e3401000 	movt	r1, #0
     bf8:	eb000ba9 	bl	3aa4 <printf>
}
     bfc:	e24bd014 	sub	sp, fp, #20
     c00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for reading\n");
     c04:	e3a00001 	mov	r0, #1
     c08:	e3041290 	movw	r1, #17040	; 0x4290
     c0c:	e3401000 	movt	r1, #0
     c10:	eb000ba3 	bl	3aa4 <printf>
}
     c14:	e24bd014 	sub	sp, fp, #20
     c18:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "sharedfd oops %d %d\n", nc, np);
     c1c:	e30412cc 	movw	r1, #17100	; 0x42cc
     c20:	e1a03005 	mov	r3, r5
     c24:	e1a02006 	mov	r2, r6
     c28:	e3a00001 	mov	r0, #1
     c2c:	e3401000 	movt	r1, #0
     c30:	eb000b9b 	bl	3aa4 <printf>
    exit();
     c34:	eb000a41 	bl	3540 <exit>

00000c38 <twofiles>:
{
     c38:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "twofiles test\n");
     c3c:	e3a00001 	mov	r0, #1
{
     c40:	e28db024 	add	fp, sp, #36	; 0x24
  printf(1, "twofiles test\n");
     c44:	e30412e8 	movw	r1, #17128	; 0x42e8
     c48:	e3401000 	movt	r1, #0
     c4c:	eb000b94 	bl	3aa4 <printf>
  unlink("f1");
     c50:	e30402f8 	movw	r0, #17144	; 0x42f8
     c54:	e3400000 	movt	r0, #0
     c58:	eb000ac7 	bl	377c <unlink>
  unlink("f2");
     c5c:	e30402e4 	movw	r0, #17124	; 0x42e4
     c60:	e3400000 	movt	r0, #0
     c64:	eb000ac4 	bl	377c <unlink>
  pid = fork();
     c68:	eb000a27 	bl	350c <fork>
  if(pid < 0){
     c6c:	e2507000 	subs	r7, r0, #0
     c70:	ba000062 	blt	e00 <twofiles+0x1c8>
  fname = pid ? "f1" : "f2";
     c74:	1a000038 	bne	d5c <twofiles+0x124>
  fd = open(fname, O_CREATE | O_RDWR);
     c78:	e30402e4 	movw	r0, #17124	; 0x42e4
     c7c:	e3001202 	movw	r1, #514	; 0x202
     c80:	e3400000 	movt	r0, #0
     c84:	eb000aa2 	bl	3714 <open>
  if(fd < 0){
     c88:	e2506000 	subs	r6, r0, #0
     c8c:	ba000060 	blt	e14 <twofiles+0x1dc>
  memset(buf, pid?'p':'c', 512);
     c90:	e3a01063 	mov	r1, #99	; 0x63
     c94:	e3070fcc 	movw	r0, #32716	; 0x7fcc
     c98:	e3a02c02 	mov	r2, #512	; 0x200
     c9c:	e3400000 	movt	r0, #0
    if((n = write(fd, buf, 500)) != 500){
     ca0:	e3074fcc 	movw	r4, #32716	; 0x7fcc
  memset(buf, pid?'p':'c', 512);
     ca4:	eb0009aa 	bl	3354 <memset>
    if((n = write(fd, buf, 500)) != 500){
     ca8:	e3404000 	movt	r4, #0
  memset(buf, pid?'p':'c', 512);
     cac:	e3a0500c 	mov	r5, #12
    if((n = write(fd, buf, 500)) != 500){
     cb0:	e3a02f7d 	mov	r2, #500	; 0x1f4
     cb4:	e1a01004 	mov	r1, r4
     cb8:	e1a00006 	mov	r0, r6
     cbc:	eb000a60 	bl	3644 <write>
     cc0:	e3500f7d 	cmp	r0, #500	; 0x1f4
     cc4:	1a000047 	bne	de8 <twofiles+0x1b0>
  for(i = 0; i < 12; i++){
     cc8:	e2555001 	subs	r5, r5, #1
     ccc:	1afffff7 	bne	cb0 <twofiles+0x78>
  close(fd);
     cd0:	e1a00006 	mov	r0, r6
     cd4:	eb000a67 	bl	3678 <close>
  if(pid)
     cd8:	e3570000 	cmp	r7, #0
     cdc:	0a000040 	beq	de4 <twofiles+0x1ac>
    wait();
     ce0:	e3077fcc 	movw	r7, #32716	; 0x7fcc
     ce4:	e3407000 	movt	r7, #0
     ce8:	eb000a21 	bl	3574 <wait>
    fd = open(i?"f1":"f2", 0);
     cec:	e30492f8 	movw	r9, #17144	; 0x42f8
     cf0:	e30402e4 	movw	r0, #17124	; 0x42e4
     cf4:	e3409000 	movt	r9, #0
     cf8:	e3400000 	movt	r0, #0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     cfc:	e1a08007 	mov	r8, r7
    fd = open(i?"f1":"f2", 0);
     d00:	e3a01000 	mov	r1, #0
    total = 0;
     d04:	e3a04000 	mov	r4, #0
    fd = open(i?"f1":"f2", 0);
     d08:	eb000a81 	bl	3714 <open>
     d0c:	e3550000 	cmp	r5, #0
     d10:	13a0a070 	movne	sl, #112	; 0x70
     d14:	03a0a063 	moveq	sl, #99	; 0x63
     d18:	e1a06000 	mov	r6, r0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d1c:	e3a02a02 	mov	r2, #8192	; 0x2000
     d20:	e1a01008 	mov	r1, r8
     d24:	e1a00006 	mov	r0, r6
     d28:	eb000a38 	bl	3610 <read>
     d2c:	e3500000 	cmp	r0, #0
     d30:	da000011 	ble	d7c <twofiles+0x144>
     d34:	e3073fcc 	movw	r3, #32716	; 0x7fcc
     d38:	e0871000 	add	r1, r7, r0
     d3c:	e3403000 	movt	r3, #0
        if(buf[j] != (i?'p':'c')){
     d40:	e4d32001 	ldrb	r2, [r3], #1
     d44:	e152000a 	cmp	r2, sl
     d48:	1a000021 	bne	dd4 <twofiles+0x19c>
      for(j = 0; j < n; j++){
     d4c:	e1530001 	cmp	r3, r1
     d50:	1afffffa 	bne	d40 <twofiles+0x108>
      total += n;
     d54:	e0844000 	add	r4, r4, r0
     d58:	eaffffef 	b	d1c <twofiles+0xe4>
  fd = open(fname, O_CREATE | O_RDWR);
     d5c:	e30402f8 	movw	r0, #17144	; 0x42f8
     d60:	e3001202 	movw	r1, #514	; 0x202
     d64:	e3400000 	movt	r0, #0
     d68:	eb000a69 	bl	3714 <open>
  if(fd < 0){
     d6c:	e2506000 	subs	r6, r0, #0
     d70:	ba000027 	blt	e14 <twofiles+0x1dc>
  memset(buf, pid?'p':'c', 512);
     d74:	e3a01070 	mov	r1, #112	; 0x70
     d78:	eaffffc5 	b	c94 <twofiles+0x5c>
    close(fd);
     d7c:	e1a00006 	mov	r0, r6
     d80:	eb000a3c 	bl	3678 <close>
    if(total != 12*500){
     d84:	e3013770 	movw	r3, #6000	; 0x1770
     d88:	e1540003 	cmp	r4, r3
     d8c:	1a000025 	bne	e28 <twofiles+0x1f0>
  for(i = 0; i < 2; i++){
     d90:	e3550001 	cmp	r5, #1
     d94:	e1a00009 	mov	r0, r9
     d98:	1a00000b 	bne	dcc <twofiles+0x194>
  unlink("f1");
     d9c:	e30402f8 	movw	r0, #17144	; 0x42f8
     da0:	e3400000 	movt	r0, #0
     da4:	eb000a74 	bl	377c <unlink>
  unlink("f2");
     da8:	e30402e4 	movw	r0, #17124	; 0x42e4
     dac:	e3400000 	movt	r0, #0
     db0:	eb000a71 	bl	377c <unlink>
  printf(1, "twofiles ok\n");
     db4:	e1a00005 	mov	r0, r5
     db8:	e3041340 	movw	r1, #17216	; 0x4340
     dbc:	e3401000 	movt	r1, #0
}
     dc0:	e24bd024 	sub	sp, fp, #36	; 0x24
     dc4:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "twofiles ok\n");
     dc8:	ea000b35 	b	3aa4 <printf>
     dcc:	e3a05001 	mov	r5, #1
     dd0:	eaffffca 	b	d00 <twofiles+0xc8>
          printf(1, "wrong char\n");
     dd4:	e3041320 	movw	r1, #17184	; 0x4320
     dd8:	e3a00001 	mov	r0, #1
     ddc:	e3401000 	movt	r1, #0
     de0:	eb000b2f 	bl	3aa4 <printf>
          exit();
     de4:	eb0009d5 	bl	3540 <exit>
      printf(1, "write failed %d\n", n);
     de8:	e1a02000 	mov	r2, r0
     dec:	e304130c 	movw	r1, #17164	; 0x430c
     df0:	e3a00001 	mov	r0, #1
     df4:	e3401000 	movt	r1, #0
     df8:	eb000b29 	bl	3aa4 <printf>
      exit();
     dfc:	eb0009cf 	bl	3540 <exit>
    printf(1, "fork failed\n");
     e00:	e3051718 	movw	r1, #22296	; 0x5718
     e04:	e3a00001 	mov	r0, #1
     e08:	e3401000 	movt	r1, #0
     e0c:	eb000b24 	bl	3aa4 <printf>
    exit();
     e10:	eb0009ca 	bl	3540 <exit>
    printf(1, "create failed\n");
     e14:	e30412fc 	movw	r1, #17148	; 0x42fc
     e18:	e3a00001 	mov	r0, #1
     e1c:	e3401000 	movt	r1, #0
     e20:	eb000b1f 	bl	3aa4 <printf>
    exit();
     e24:	eb0009c5 	bl	3540 <exit>
      printf(1, "wrong length %d\n", total);
     e28:	e1a02004 	mov	r2, r4
     e2c:	e304132c 	movw	r1, #17196	; 0x432c
     e30:	e3a00001 	mov	r0, #1
     e34:	e3401000 	movt	r1, #0
     e38:	eb000b19 	bl	3aa4 <printf>
      exit();
     e3c:	eb0009bf 	bl	3540 <exit>

00000e40 <createdelete>:
{
     e40:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "createdelete test\n");
     e44:	e3a00001 	mov	r0, #1
{
     e48:	e28db014 	add	fp, sp, #20
  printf(1, "createdelete test\n");
     e4c:	e3041350 	movw	r1, #17232	; 0x4350
{
     e50:	e24dd028 	sub	sp, sp, #40	; 0x28
  printf(1, "createdelete test\n");
     e54:	e3401000 	movt	r1, #0
     e58:	eb000b11 	bl	3aa4 <printf>
  pid = fork();
     e5c:	eb0009aa 	bl	350c <fork>
  if(pid < 0){
     e60:	e2505000 	subs	r5, r0, #0
     e64:	ba000084 	blt	107c <createdelete+0x23c>
  name[2] = '\0';
     e68:	e3a03000 	mov	r3, #0
  name[0] = pid ? 'p' : 'c';
     e6c:	03a02063 	moveq	r2, #99	; 0x63
     e70:	13a02070 	movne	r2, #112	; 0x70
  name[2] = '\0';
     e74:	e1a04003 	mov	r4, r3
  name[0] = pid ? 'p' : 'c';
     e78:	e54b2034 	strb	r2, [fp, #-52]	; 0xffffffcc
  name[2] = '\0';
     e7c:	e54b3032 	strb	r3, [fp, #-50]	; 0xffffffce
  for(i = 0; i < N; i++){
     e80:	ea000002 	b	e90 <createdelete+0x50>
     e84:	e3540013 	cmp	r4, #19
     e88:	0a000018 	beq	ef0 <createdelete+0xb0>
     e8c:	e2844001 	add	r4, r4, #1
    fd = open(name, O_CREATE | O_RDWR);
     e90:	e3001202 	movw	r1, #514	; 0x202
     e94:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[1] = '0' + i;
     e98:	e2843030 	add	r3, r4, #48	; 0x30
     e9c:	e54b3033 	strb	r3, [fp, #-51]	; 0xffffffcd
    fd = open(name, O_CREATE | O_RDWR);
     ea0:	eb000a1b 	bl	3714 <open>
    if(fd < 0){
     ea4:	e3500000 	cmp	r0, #0
     ea8:	ba000056 	blt	1008 <createdelete+0x1c8>
    close(fd);
     eac:	eb0009f1 	bl	3678 <close>
    if(i > 0 && (i % 2 ) == 0){
     eb0:	e3540000 	cmp	r4, #0
     eb4:	0afffff4 	beq	e8c <createdelete+0x4c>
     eb8:	e3140001 	tst	r4, #1
     ebc:	1afffff0 	bne	e84 <createdelete+0x44>
      name[1] = '0' + (i / 2);
     ec0:	e1a030c4 	asr	r3, r4, #1
      if(unlink(name) < 0){
     ec4:	e24b0034 	sub	r0, fp, #52	; 0x34
      name[1] = '0' + (i / 2);
     ec8:	e2833030 	add	r3, r3, #48	; 0x30
     ecc:	e54b3033 	strb	r3, [fp, #-51]	; 0xffffffcd
      if(unlink(name) < 0){
     ed0:	eb000a29 	bl	377c <unlink>
     ed4:	e3500000 	cmp	r0, #0
     ed8:	aaffffe9 	bge	e84 <createdelete+0x44>
        printf(1, "unlink failed\n");
     edc:	e3041364 	movw	r1, #17252	; 0x4364
     ee0:	e3a00001 	mov	r0, #1
     ee4:	e3401000 	movt	r1, #0
     ee8:	eb000aed 	bl	3aa4 <printf>
        exit();
     eec:	eb000993 	bl	3540 <exit>
  if(pid==0)
     ef0:	e3550000 	cmp	r5, #0
     ef4:	0a00004d 	beq	1030 <createdelete+0x1f0>
    wait();
     ef8:	eb00099d 	bl	3574 <wait>
     efc:	e3a05000 	mov	r5, #0
    name[0] = 'p';
     f00:	e3a07070 	mov	r7, #112	; 0x70
    name[0] = 'c';
     f04:	e3a06063 	mov	r6, #99	; 0x63
     f08:	ea000010 	b	f50 <createdelete+0x110>
    if((i == 0 || i >= N/2) && fd < 0){
     f0c:	e3500000 	cmp	r0, #0
     f10:	ba000041 	blt	101c <createdelete+0x1dc>
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f14:	e2453001 	sub	r3, r5, #1
     f18:	e3530008 	cmp	r3, #8
     f1c:	9a00004c 	bls	1054 <createdelete+0x214>
      close(fd);
     f20:	eb0009d4 	bl	3678 <close>
    fd = open(name, 0);
     f24:	e3a01000 	mov	r1, #0
     f28:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'c';
     f2c:	e54b6034 	strb	r6, [fp, #-52]	; 0xffffffcc
    name[1] = '0' + i;
     f30:	e54b4033 	strb	r4, [fp, #-51]	; 0xffffffcd
    fd = open(name, 0);
     f34:	eb0009f6 	bl	3714 <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f38:	e3500000 	cmp	r0, #0
     f3c:	ba000036 	blt	101c <createdelete+0x1dc>
      close(fd);
     f40:	eb0009cc 	bl	3678 <close>
  for(i = 0; i < N; i++){
     f44:	e3550013 	cmp	r5, #19
     f48:	0a00001a 	beq	fb8 <createdelete+0x178>
     f4c:	e2855001 	add	r5, r5, #1
    name[1] = '0' + i;
     f50:	e2854030 	add	r4, r5, #48	; 0x30
    fd = open(name, 0);
     f54:	e3a01000 	mov	r1, #0
     f58:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'p';
     f5c:	e54b7034 	strb	r7, [fp, #-52]	; 0xffffffcc
    name[1] = '0' + i;
     f60:	e6ef4074 	uxtb	r4, r4
     f64:	e54b4033 	strb	r4, [fp, #-51]	; 0xffffffcd
    fd = open(name, 0);
     f68:	eb0009e9 	bl	3714 <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f6c:	e3550009 	cmp	r5, #9
     f70:	d3a01000 	movle	r1, #0
     f74:	c3a01001 	movgt	r1, #1
     f78:	e3550000 	cmp	r5, #0
     f7c:	03a01001 	moveq	r1, #1
     f80:	e3510000 	cmp	r1, #0
     f84:	1affffe0 	bne	f0c <createdelete+0xcc>
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f88:	e2452001 	sub	r2, r5, #1
     f8c:	e3520008 	cmp	r2, #8
     f90:	9a000027 	bls	1034 <createdelete+0x1f4>
    if(fd >= 0)
     f94:	e3500000 	cmp	r0, #0
     f98:	aa000033 	bge	106c <createdelete+0x22c>
    fd = open(name, 0);
     f9c:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'c';
     fa0:	e54b6034 	strb	r6, [fp, #-52]	; 0xffffffcc
    name[1] = '0' + i;
     fa4:	e54b4033 	strb	r4, [fp, #-51]	; 0xffffffcd
    fd = open(name, 0);
     fa8:	eb0009d9 	bl	3714 <open>
    if(fd >= 0)
     fac:	e3500000 	cmp	r0, #0
     fb0:	baffffe5 	blt	f4c <createdelete+0x10c>
     fb4:	eaffffe1 	b	f40 <createdelete+0x100>
     fb8:	e3a04030 	mov	r4, #48	; 0x30
    name[0] = 'p';
     fbc:	e3a06070 	mov	r6, #112	; 0x70
    name[0] = 'c';
     fc0:	e3a05063 	mov	r5, #99	; 0x63
    name[1] = '0' + i;
     fc4:	e54b4033 	strb	r4, [fp, #-51]	; 0xffffffcd
     fc8:	e2844001 	add	r4, r4, #1
    unlink(name);
     fcc:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'p';
     fd0:	e54b6034 	strb	r6, [fp, #-52]	; 0xffffffcc
    unlink(name);
     fd4:	e6ef4074 	uxtb	r4, r4
     fd8:	eb0009e7 	bl	377c <unlink>
    unlink(name);
     fdc:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'c';
     fe0:	e54b5034 	strb	r5, [fp, #-52]	; 0xffffffcc
    unlink(name);
     fe4:	eb0009e4 	bl	377c <unlink>
  for(i = 0; i < N; i++){
     fe8:	e3540044 	cmp	r4, #68	; 0x44
     fec:	1afffff4 	bne	fc4 <createdelete+0x184>
  printf(1, "createdelete ok\n");
     ff0:	e3a00001 	mov	r0, #1
     ff4:	e30413b8 	movw	r1, #17336	; 0x43b8
     ff8:	e3401000 	movt	r1, #0
     ffc:	eb000aa8 	bl	3aa4 <printf>
}
    1000:	e24bd014 	sub	sp, fp, #20
    1004:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      printf(1, "create failed\n");
    1008:	e30412fc 	movw	r1, #17148	; 0x42fc
    100c:	e3a00001 	mov	r0, #1
    1010:	e3401000 	movt	r1, #0
    1014:	eb000aa2 	bl	3aa4 <printf>
      exit();
    1018:	eb000948 	bl	3540 <exit>
      printf(1, "oops createdelete %s didn't exist\n", name);
    101c:	e3041374 	movw	r1, #17268	; 0x4374
    1020:	e24b2034 	sub	r2, fp, #52	; 0x34
    1024:	e3a00001 	mov	r0, #1
    1028:	e3401000 	movt	r1, #0
    102c:	eb000a9c 	bl	3aa4 <printf>
      exit();
    1030:	eb000942 	bl	3540 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    1034:	e3500000 	cmp	r0, #0
    1038:	aa000005 	bge	1054 <createdelete+0x214>
    fd = open(name, 0);
    103c:	e24b0034 	sub	r0, fp, #52	; 0x34
    name[0] = 'c';
    1040:	e54b6034 	strb	r6, [fp, #-52]	; 0xffffffcc
    name[1] = '0' + i;
    1044:	e54b4033 	strb	r4, [fp, #-51]	; 0xffffffcd
    fd = open(name, 0);
    1048:	eb0009b1 	bl	3714 <open>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    104c:	e3500000 	cmp	r0, #0
    1050:	baffffbd 	blt	f4c <createdelete+0x10c>
      printf(1, "oops createdelete %s did exist\n", name);
    1054:	e24b2034 	sub	r2, fp, #52	; 0x34
    1058:	e3041398 	movw	r1, #17304	; 0x4398
    105c:	e3a00001 	mov	r0, #1
    1060:	e3401000 	movt	r1, #0
    1064:	eb000a8e 	bl	3aa4 <printf>
      exit();
    1068:	eb000934 	bl	3540 <exit>
    106c:	e50b1038 	str	r1, [fp, #-56]	; 0xffffffc8
      close(fd);
    1070:	eb000980 	bl	3678 <close>
    fd = open(name, 0);
    1074:	e51b1038 	ldr	r1, [fp, #-56]	; 0xffffffc8
    1078:	eaffffc7 	b	f9c <createdelete+0x15c>
    printf(1, "fork failed\n");
    107c:	e3051718 	movw	r1, #22296	; 0x5718
    1080:	e3a00001 	mov	r0, #1
    1084:	e3401000 	movt	r1, #0
    1088:	eb000a85 	bl	3aa4 <printf>
    exit();
    108c:	eb00092b 	bl	3540 <exit>

00001090 <unlinkread>:
{
    1090:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread test\n");
    1094:	e3a00001 	mov	r0, #1
{
    1098:	e28db014 	add	fp, sp, #20
  printf(1, "unlinkread test\n");
    109c:	e30413cc 	movw	r1, #17356	; 0x43cc
    10a0:	e3401000 	movt	r1, #0
    10a4:	eb000a7e 	bl	3aa4 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    10a8:	e30403e0 	movw	r0, #17376	; 0x43e0
    10ac:	e3001202 	movw	r1, #514	; 0x202
    10b0:	e3400000 	movt	r0, #0
    10b4:	eb000996 	bl	3714 <open>
  if(fd < 0){
    10b8:	e2504000 	subs	r4, r0, #0
    10bc:	ba000037 	blt	11a0 <unlinkread+0x110>
  write(fd, "hello", 5);
    10c0:	e3a02005 	mov	r2, #5
    10c4:	e3041408 	movw	r1, #17416	; 0x4408
    10c8:	e3401000 	movt	r1, #0
    10cc:	eb00095c 	bl	3644 <write>
  close(fd);
    10d0:	e1a00004 	mov	r0, r4
    10d4:	eb000967 	bl	3678 <close>
  fd = open("unlinkread", O_RDWR);
    10d8:	e30403e0 	movw	r0, #17376	; 0x43e0
    10dc:	e3a01002 	mov	r1, #2
    10e0:	e3400000 	movt	r0, #0
    10e4:	eb00098a 	bl	3714 <open>
  if(fd < 0){
    10e8:	e2505000 	subs	r5, r0, #0
    10ec:	ba000044 	blt	1204 <unlinkread+0x174>
  if(unlink("unlinkread") != 0){
    10f0:	e30403e0 	movw	r0, #17376	; 0x43e0
    10f4:	e3400000 	movt	r0, #0
    10f8:	eb00099f 	bl	377c <unlink>
    10fc:	e3500000 	cmp	r0, #0
    1100:	1a00003a 	bne	11f0 <unlinkread+0x160>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1104:	e3001202 	movw	r1, #514	; 0x202
    1108:	e30403e0 	movw	r0, #17376	; 0x43e0
    110c:	e3400000 	movt	r0, #0
  if(read(fd, buf, sizeof(buf)) != 5){
    1110:	e3074fcc 	movw	r4, #32716	; 0x7fcc
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1114:	eb00097e 	bl	3714 <open>
  if(read(fd, buf, sizeof(buf)) != 5){
    1118:	e3404000 	movt	r4, #0
  write(fd1, "yyy", 3);
    111c:	e3a02003 	mov	r2, #3
    1120:	e3041444 	movw	r1, #17476	; 0x4444
    1124:	e3401000 	movt	r1, #0
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1128:	e1a06000 	mov	r6, r0
  write(fd1, "yyy", 3);
    112c:	eb000944 	bl	3644 <write>
  close(fd1);
    1130:	e1a00006 	mov	r0, r6
    1134:	eb00094f 	bl	3678 <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1138:	e1a01004 	mov	r1, r4
    113c:	e3a02a02 	mov	r2, #8192	; 0x2000
    1140:	e1a00005 	mov	r0, r5
    1144:	eb000931 	bl	3610 <read>
    1148:	e3500005 	cmp	r0, #5
    114c:	1a000022 	bne	11dc <unlinkread+0x14c>
  if(buf[0] != 'h'){
    1150:	e5d43000 	ldrb	r3, [r4]
    1154:	e3530068 	cmp	r3, #104	; 0x68
    1158:	1a00001a 	bne	11c8 <unlinkread+0x138>
  if(write(fd, buf, 10) != 10){
    115c:	e1a01004 	mov	r1, r4
    1160:	e3a0200a 	mov	r2, #10
    1164:	e1a00005 	mov	r0, r5
    1168:	eb000935 	bl	3644 <write>
    116c:	e350000a 	cmp	r0, #10
    1170:	1a00000f 	bne	11b4 <unlinkread+0x124>
  close(fd);
    1174:	e1a00005 	mov	r0, r5
    1178:	eb00093e 	bl	3678 <close>
  unlink("unlinkread");
    117c:	e30403e0 	movw	r0, #17376	; 0x43e0
    1180:	e3400000 	movt	r0, #0
    1184:	eb00097c 	bl	377c <unlink>
  printf(1, "unlinkread ok\n");
    1188:	e3041494 	movw	r1, #17556	; 0x4494
    118c:	e3a00001 	mov	r0, #1
    1190:	e3401000 	movt	r1, #0
}
    1194:	e24bd014 	sub	sp, fp, #20
    1198:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread ok\n");
    119c:	ea000a40 	b	3aa4 <printf>
    printf(1, "create unlinkread failed\n");
    11a0:	e30413ec 	movw	r1, #17388	; 0x43ec
    11a4:	e3a00001 	mov	r0, #1
    11a8:	e3401000 	movt	r1, #0
    11ac:	eb000a3c 	bl	3aa4 <printf>
    exit();
    11b0:	eb0008e2 	bl	3540 <exit>
    printf(1, "unlinkread write failed\n");
    11b4:	e3041478 	movw	r1, #17528	; 0x4478
    11b8:	e3a00001 	mov	r0, #1
    11bc:	e3401000 	movt	r1, #0
    11c0:	eb000a37 	bl	3aa4 <printf>
    exit();
    11c4:	eb0008dd 	bl	3540 <exit>
    printf(1, "unlinkread wrong data\n");
    11c8:	e3041460 	movw	r1, #17504	; 0x4460
    11cc:	e3a00001 	mov	r0, #1
    11d0:	e3401000 	movt	r1, #0
    11d4:	eb000a32 	bl	3aa4 <printf>
    exit();
    11d8:	eb0008d8 	bl	3540 <exit>
    printf(1, "unlinkread read failed");
    11dc:	e3041448 	movw	r1, #17480	; 0x4448
    11e0:	e3a00001 	mov	r0, #1
    11e4:	e3401000 	movt	r1, #0
    11e8:	eb000a2d 	bl	3aa4 <printf>
    exit();
    11ec:	eb0008d3 	bl	3540 <exit>
    printf(1, "unlink unlinkread failed\n");
    11f0:	e3041428 	movw	r1, #17448	; 0x4428
    11f4:	e3a00001 	mov	r0, #1
    11f8:	e3401000 	movt	r1, #0
    11fc:	eb000a28 	bl	3aa4 <printf>
    exit();
    1200:	eb0008ce 	bl	3540 <exit>
    printf(1, "open unlinkread failed\n");
    1204:	e3041410 	movw	r1, #17424	; 0x4410
    1208:	e3a00001 	mov	r0, #1
    120c:	e3401000 	movt	r1, #0
    1210:	eb000a23 	bl	3aa4 <printf>
    exit();
    1214:	eb0008c9 	bl	3540 <exit>

00001218 <linktest>:
{
    1218:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "linktest\n");
    121c:	e3a00001 	mov	r0, #1
{
    1220:	e28db00c 	add	fp, sp, #12
  printf(1, "linktest\n");
    1224:	e30414a4 	movw	r1, #17572	; 0x44a4
    1228:	e3401000 	movt	r1, #0
    122c:	eb000a1c 	bl	3aa4 <printf>
  unlink("lf1");
    1230:	e30404b0 	movw	r0, #17584	; 0x44b0
    1234:	e3400000 	movt	r0, #0
    1238:	eb00094f 	bl	377c <unlink>
  unlink("lf2");
    123c:	e30404b4 	movw	r0, #17588	; 0x44b4
    1240:	e3400000 	movt	r0, #0
    1244:	eb00094c 	bl	377c <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1248:	e30404b0 	movw	r0, #17584	; 0x44b0
    124c:	e3001202 	movw	r1, #514	; 0x202
    1250:	e3400000 	movt	r0, #0
    1254:	eb00092e 	bl	3714 <open>
  if(fd < 0){
    1258:	e2504000 	subs	r4, r0, #0
    125c:	ba000042 	blt	136c <linktest+0x154>
  if(write(fd, "hello", 5) != 5){
    1260:	e3041408 	movw	r1, #17416	; 0x4408
    1264:	e3a02005 	mov	r2, #5
    1268:	e3401000 	movt	r1, #0
    126c:	eb0008f4 	bl	3644 <write>
    1270:	e3500005 	cmp	r0, #5
    1274:	1a000064 	bne	140c <linktest+0x1f4>
  close(fd);
    1278:	e1a00004 	mov	r0, r4
    127c:	eb0008fd 	bl	3678 <close>
  if(link("lf1", "lf2") < 0){
    1280:	e30414b4 	movw	r1, #17588	; 0x44b4
    1284:	e30404b0 	movw	r0, #17584	; 0x44b0
    1288:	e3401000 	movt	r1, #0
    128c:	e3400000 	movt	r0, #0
    1290:	eb000953 	bl	37e4 <link>
    1294:	e3500000 	cmp	r0, #0
    1298:	ba000056 	blt	13f8 <linktest+0x1e0>
  unlink("lf1");
    129c:	e30404b0 	movw	r0, #17584	; 0x44b0
    12a0:	e3400000 	movt	r0, #0
    12a4:	eb000934 	bl	377c <unlink>
  if(open("lf1", 0) >= 0){
    12a8:	e30404b0 	movw	r0, #17584	; 0x44b0
    12ac:	e3a01000 	mov	r1, #0
    12b0:	e3400000 	movt	r0, #0
    12b4:	eb000916 	bl	3714 <open>
    12b8:	e3500000 	cmp	r0, #0
    12bc:	aa000048 	bge	13e4 <linktest+0x1cc>
  fd = open("lf2", 0);
    12c0:	e30404b4 	movw	r0, #17588	; 0x44b4
    12c4:	e3a01000 	mov	r1, #0
    12c8:	e3400000 	movt	r0, #0
    12cc:	eb000910 	bl	3714 <open>
  if(fd < 0){
    12d0:	e2504000 	subs	r4, r0, #0
    12d4:	ba00003d 	blt	13d0 <linktest+0x1b8>
  if(read(fd, buf, sizeof(buf)) != 5){
    12d8:	e3071fcc 	movw	r1, #32716	; 0x7fcc
    12dc:	e3a02a02 	mov	r2, #8192	; 0x2000
    12e0:	e3401000 	movt	r1, #0
    12e4:	eb0008c9 	bl	3610 <read>
    12e8:	e3500005 	cmp	r0, #5
    12ec:	1a000032 	bne	13bc <linktest+0x1a4>
  close(fd);
    12f0:	e1a00004 	mov	r0, r4
    12f4:	eb0008df 	bl	3678 <close>
  if(link("lf2", "lf2") >= 0){
    12f8:	e30414b4 	movw	r1, #17588	; 0x44b4
    12fc:	e3401000 	movt	r1, #0
    1300:	e1a00001 	mov	r0, r1
    1304:	eb000936 	bl	37e4 <link>
    1308:	e3500000 	cmp	r0, #0
    130c:	aa000025 	bge	13a8 <linktest+0x190>
  unlink("lf2");
    1310:	e30404b4 	movw	r0, #17588	; 0x44b4
    1314:	e3400000 	movt	r0, #0
    1318:	eb000917 	bl	377c <unlink>
  if(link("lf2", "lf1") >= 0){
    131c:	e30414b0 	movw	r1, #17584	; 0x44b0
    1320:	e30404b4 	movw	r0, #17588	; 0x44b4
    1324:	e3401000 	movt	r1, #0
    1328:	e3400000 	movt	r0, #0
    132c:	eb00092c 	bl	37e4 <link>
    1330:	e3500000 	cmp	r0, #0
    1334:	aa000016 	bge	1394 <linktest+0x17c>
  if(link(".", "lf1") >= 0){
    1338:	e30414b0 	movw	r1, #17584	; 0x44b0
    133c:	e304058c 	movw	r0, #17804	; 0x458c
    1340:	e3401000 	movt	r1, #0
    1344:	e3400000 	movt	r0, #0
    1348:	eb000925 	bl	37e4 <link>
    134c:	e3500000 	cmp	r0, #0
    1350:	aa00000a 	bge	1380 <linktest+0x168>
  printf(1, "linktest ok\n");
    1354:	e30415ac 	movw	r1, #17836	; 0x45ac
    1358:	e3a00001 	mov	r0, #1
    135c:	e3401000 	movt	r1, #0
}
    1360:	e24bd00c 	sub	sp, fp, #12
    1364:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "linktest ok\n");
    1368:	ea0009cd 	b	3aa4 <printf>
    printf(1, "create lf1 failed\n");
    136c:	e30414b8 	movw	r1, #17592	; 0x44b8
    1370:	e3a00001 	mov	r0, #1
    1374:	e3401000 	movt	r1, #0
    1378:	eb0009c9 	bl	3aa4 <printf>
    exit();
    137c:	eb00086f 	bl	3540 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1380:	e3041590 	movw	r1, #17808	; 0x4590
    1384:	e3a00001 	mov	r0, #1
    1388:	e3401000 	movt	r1, #0
    138c:	eb0009c4 	bl	3aa4 <printf>
    exit();
    1390:	eb00086a 	bl	3540 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    1394:	e3041568 	movw	r1, #17768	; 0x4568
    1398:	e3a00001 	mov	r0, #1
    139c:	e3401000 	movt	r1, #0
    13a0:	eb0009bf 	bl	3aa4 <printf>
    exit();
    13a4:	eb000865 	bl	3540 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    13a8:	e3041548 	movw	r1, #17736	; 0x4548
    13ac:	e3a00001 	mov	r0, #1
    13b0:	e3401000 	movt	r1, #0
    13b4:	eb0009ba 	bl	3aa4 <printf>
    exit();
    13b8:	eb000860 	bl	3540 <exit>
    printf(1, "read lf2 failed\n");
    13bc:	e3041534 	movw	r1, #17716	; 0x4534
    13c0:	e3a00001 	mov	r0, #1
    13c4:	e3401000 	movt	r1, #0
    13c8:	eb0009b5 	bl	3aa4 <printf>
    exit();
    13cc:	eb00085b 	bl	3540 <exit>
    printf(1, "open lf2 failed\n");
    13d0:	e3041520 	movw	r1, #17696	; 0x4520
    13d4:	e3a00001 	mov	r0, #1
    13d8:	e3401000 	movt	r1, #0
    13dc:	eb0009b0 	bl	3aa4 <printf>
    exit();
    13e0:	eb000856 	bl	3540 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    13e4:	e30414f8 	movw	r1, #17656	; 0x44f8
    13e8:	e3a00001 	mov	r0, #1
    13ec:	e3401000 	movt	r1, #0
    13f0:	eb0009ab 	bl	3aa4 <printf>
    exit();
    13f4:	eb000851 	bl	3540 <exit>
    printf(1, "link lf1 lf2 failed\n");
    13f8:	e30414e0 	movw	r1, #17632	; 0x44e0
    13fc:	e3a00001 	mov	r0, #1
    1400:	e3401000 	movt	r1, #0
    1404:	eb0009a6 	bl	3aa4 <printf>
    exit();
    1408:	eb00084c 	bl	3540 <exit>
    printf(1, "write lf1 failed\n");
    140c:	e30414cc 	movw	r1, #17612	; 0x44cc
    1410:	e3a00001 	mov	r0, #1
    1414:	e3401000 	movt	r1, #0
    1418:	eb0009a1 	bl	3aa4 <printf>
    exit();
    141c:	eb000847 	bl	3540 <exit>

00001420 <concreate>:
{
    1420:	e92d4870 	push	{r4, r5, r6, fp, lr}
  printf(1, "concreate test\n");
    1424:	e30415bc 	movw	r1, #17852	; 0x45bc
{
    1428:	e28db010 	add	fp, sp, #16
  printf(1, "concreate test\n");
    142c:	e3a00001 	mov	r0, #1
{
    1430:	e24dd044 	sub	sp, sp, #68	; 0x44
  printf(1, "concreate test\n");
    1434:	e3401000 	movt	r1, #0
    if(pid && (i % 3) == 1){
    1438:	e30a5aab 	movw	r5, #43691	; 0xaaab
  printf(1, "concreate test\n");
    143c:	eb000998 	bl	3aa4 <printf>
  file[2] = '\0';
    1440:	e3a03000 	mov	r3, #0
      link("C0", file);
    1444:	e30465cc 	movw	r6, #17868	; 0x45cc
  for(i = 0; i < 40; i++){
    1448:	e1a04003 	mov	r4, r3
  file[2] = '\0';
    144c:	e54b304e 	strb	r3, [fp, #-78]	; 0xffffffb2
    if(pid && (i % 3) == 1){
    1450:	e34a5aaa 	movt	r5, #43690	; 0xaaaa
  file[0] = 'C';
    1454:	e3a03043 	mov	r3, #67	; 0x43
      link("C0", file);
    1458:	e3406000 	movt	r6, #0
  file[0] = 'C';
    145c:	e54b3050 	strb	r3, [fp, #-80]	; 0xffffffb0
  for(i = 0; i < 40; i++){
    1460:	ea00000f 	b	14a4 <concreate+0x84>
    if(pid && (i % 3) == 1){
    1464:	e0832495 	umull	r2, r3, r5, r4
    1468:	e1a030a3 	lsr	r3, r3, #1
    146c:	e0833083 	add	r3, r3, r3, lsl #1
    1470:	e0443003 	sub	r3, r4, r3
    1474:	e3530001 	cmp	r3, #1
    1478:	0a000028 	beq	1520 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    147c:	e3001202 	movw	r1, #514	; 0x202
    1480:	e24b0050 	sub	r0, fp, #80	; 0x50
    1484:	eb0008a2 	bl	3714 <open>
      if(fd < 0){
    1488:	e3500000 	cmp	r0, #0
    148c:	ba000018 	blt	14f4 <concreate+0xd4>
  for(i = 0; i < 40; i++){
    1490:	e2844001 	add	r4, r4, #1
      close(fd);
    1494:	eb000877 	bl	3678 <close>
      wait();
    1498:	eb000835 	bl	3574 <wait>
  for(i = 0; i < 40; i++){
    149c:	e3540028 	cmp	r4, #40	; 0x28
    14a0:	0a000025 	beq	153c <concreate+0x11c>
    unlink(file);
    14a4:	e24b0050 	sub	r0, fp, #80	; 0x50
    file[1] = '0' + i;
    14a8:	e2843030 	add	r3, r4, #48	; 0x30
    14ac:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    unlink(file);
    14b0:	eb0008b1 	bl	377c <unlink>
    pid = fork();
    14b4:	eb000814 	bl	350c <fork>
    if(pid && (i % 3) == 1){
    14b8:	e3500000 	cmp	r0, #0
    14bc:	1affffe8 	bne	1464 <concreate+0x44>
    } else if(pid == 0 && (i % 5) == 1){
    14c0:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    14c4:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    14c8:	e0832493 	umull	r2, r3, r3, r4
    14cc:	e1a03123 	lsr	r3, r3, #2
    14d0:	e0833103 	add	r3, r3, r3, lsl #2
    14d4:	e0443003 	sub	r3, r4, r3
    14d8:	e3530001 	cmp	r3, #1
    14dc:	0a00000a 	beq	150c <concreate+0xec>
      fd = open(file, O_CREATE | O_RDWR);
    14e0:	e3001202 	movw	r1, #514	; 0x202
    14e4:	e24b0050 	sub	r0, fp, #80	; 0x50
    14e8:	eb000889 	bl	3714 <open>
      if(fd < 0){
    14ec:	e3500000 	cmp	r0, #0
    14f0:	aa00008c 	bge	1728 <concreate+0x308>
        printf(1, "concreate create %s failed\n", file);
    14f4:	e24b2050 	sub	r2, fp, #80	; 0x50
    14f8:	e30415d0 	movw	r1, #17872	; 0x45d0
    14fc:	e3a00001 	mov	r0, #1
    1500:	e3401000 	movt	r1, #0
    1504:	eb000966 	bl	3aa4 <printf>
        exit();
    1508:	eb00080c 	bl	3540 <exit>
      link("C0", file);
    150c:	e30405cc 	movw	r0, #17868	; 0x45cc
    1510:	e24b1050 	sub	r1, fp, #80	; 0x50
    1514:	e3400000 	movt	r0, #0
    1518:	eb0008b1 	bl	37e4 <link>
        exit();
    151c:	eb000807 	bl	3540 <exit>
      link("C0", file);
    1520:	e24b1050 	sub	r1, fp, #80	; 0x50
    1524:	e1a00006 	mov	r0, r6
  for(i = 0; i < 40; i++){
    1528:	e2844001 	add	r4, r4, #1
      link("C0", file);
    152c:	eb0008ac 	bl	37e4 <link>
      wait();
    1530:	eb00080f 	bl	3574 <wait>
  for(i = 0; i < 40; i++){
    1534:	e3540028 	cmp	r4, #40	; 0x28
    1538:	1affffd9 	bne	14a4 <concreate+0x84>
  memset(fa, 0, sizeof(fa));
    153c:	e3a01000 	mov	r1, #0
    1540:	e1a02004 	mov	r2, r4
  n = 0;
    1544:	e1a05001 	mov	r5, r1
  memset(fa, 0, sizeof(fa));
    1548:	e24b003c 	sub	r0, fp, #60	; 0x3c
    154c:	eb000780 	bl	3354 <memset>
  fd = open(".", 0);
    1550:	e304058c 	movw	r0, #17804	; 0x458c
    1554:	e1a01005 	mov	r1, r5
    1558:	e3400000 	movt	r0, #0
    155c:	eb00086c 	bl	3714 <open>
      fa[i] = 1;
    1560:	e3a06001 	mov	r6, #1
  fd = open(".", 0);
    1564:	e1a04000 	mov	r4, r0
  while(read(fd, &de, sizeof(de)) > 0){
    1568:	e3a02010 	mov	r2, #16
    156c:	e24b104c 	sub	r1, fp, #76	; 0x4c
    1570:	e1a00004 	mov	r0, r4
    1574:	eb000825 	bl	3610 <read>
    1578:	e3500000 	cmp	r0, #0
    157c:	da000014 	ble	15d4 <concreate+0x1b4>
    if(de.inum == 0)
    1580:	e15b34bc 	ldrh	r3, [fp, #-76]	; 0xffffffb4
    1584:	e3530000 	cmp	r3, #0
    1588:	0afffff6 	beq	1568 <concreate+0x148>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    158c:	e55b304a 	ldrb	r3, [fp, #-74]	; 0xffffffb6
    1590:	e3530043 	cmp	r3, #67	; 0x43
    1594:	1afffff3 	bne	1568 <concreate+0x148>
    1598:	e55b3048 	ldrb	r3, [fp, #-72]	; 0xffffffb8
    159c:	e3530000 	cmp	r3, #0
    15a0:	1afffff0 	bne	1568 <concreate+0x148>
      i = de.name[1] - '0';
    15a4:	e55b3049 	ldrb	r3, [fp, #-73]	; 0xffffffb7
    15a8:	e2433030 	sub	r3, r3, #48	; 0x30
      if(i < 0 || i >= sizeof(fa)){
    15ac:	e3530027 	cmp	r3, #39	; 0x27
    15b0:	8a000056 	bhi	1710 <concreate+0x2f0>
      if(fa[i]){
    15b4:	e24b2014 	sub	r2, fp, #20
    15b8:	e0823003 	add	r3, r2, r3
    15bc:	e5532028 	ldrb	r2, [r3, #-40]	; 0xffffffd8
    15c0:	e3520000 	cmp	r2, #0
    15c4:	1a00004b 	bne	16f8 <concreate+0x2d8>
      n++;
    15c8:	e2855001 	add	r5, r5, #1
      fa[i] = 1;
    15cc:	e5436028 	strb	r6, [r3, #-40]	; 0xffffffd8
      n++;
    15d0:	eaffffe4 	b	1568 <concreate+0x148>
  close(fd);
    15d4:	e1a00004 	mov	r0, r4
    15d8:	eb000826 	bl	3678 <close>
  if(n != 40){
    15dc:	e3550028 	cmp	r5, #40	; 0x28
    if(((i % 3) == 0 && pid == 0) ||
    15e0:	030a5aab 	movweq	r5, #43691	; 0xaaab
  for(i = 0; i < 40; i++){
    15e4:	03a04000 	moveq	r4, #0
    if(((i % 3) == 0 && pid == 0) ||
    15e8:	034a5aaa 	movteq	r5, #43690	; 0xaaaa
  if(n != 40){
    15ec:	0a000015 	beq	1648 <concreate+0x228>
    15f0:	ea00003b 	b	16e4 <concreate+0x2c4>
    if(((i % 3) == 0 && pid == 0) ||
    15f4:	e2433001 	sub	r3, r3, #1
       ((i % 3) == 1 && pid != 0)){
    15f8:	e3560000 	cmp	r6, #0
    if(((i % 3) == 0 && pid == 0) ||
    15fc:	e16f3f13 	clz	r3, r3
    1600:	e1a032a3 	lsr	r3, r3, #5
       ((i % 3) == 1 && pid != 0)){
    1604:	03a03000 	moveq	r3, #0
    1608:	e3530000 	cmp	r3, #0
    160c:	1a000018 	bne	1674 <concreate+0x254>
      unlink(file);
    1610:	e24b0050 	sub	r0, fp, #80	; 0x50
    1614:	eb000858 	bl	377c <unlink>
      unlink(file);
    1618:	e24b0050 	sub	r0, fp, #80	; 0x50
    161c:	eb000856 	bl	377c <unlink>
      unlink(file);
    1620:	e24b0050 	sub	r0, fp, #80	; 0x50
    1624:	eb000854 	bl	377c <unlink>
      unlink(file);
    1628:	e24b0050 	sub	r0, fp, #80	; 0x50
    162c:	eb000852 	bl	377c <unlink>
    if(pid == 0)
    1630:	e3560000 	cmp	r6, #0
    1634:	0affffb8 	beq	151c <concreate+0xfc>
  for(i = 0; i < 40; i++){
    1638:	e2844001 	add	r4, r4, #1
      wait();
    163c:	eb0007cc 	bl	3574 <wait>
  for(i = 0; i < 40; i++){
    1640:	e3540028 	cmp	r4, #40	; 0x28
    1644:	0a00001b 	beq	16b8 <concreate+0x298>
    file[1] = '0' + i;
    1648:	e2843030 	add	r3, r4, #48	; 0x30
    164c:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    pid = fork();
    1650:	eb0007ad 	bl	350c <fork>
    if(pid < 0){
    1654:	e2506000 	subs	r6, r0, #0
    1658:	ba00001c 	blt	16d0 <concreate+0x2b0>
    if(((i % 3) == 0 && pid == 0) ||
    165c:	e0832495 	umull	r2, r3, r5, r4
    1660:	e1a030a3 	lsr	r3, r3, #1
    1664:	e0833083 	add	r3, r3, r3, lsl #1
    1668:	e0443003 	sub	r3, r4, r3
    166c:	e1932006 	orrs	r2, r3, r6
    1670:	1affffdf 	bne	15f4 <concreate+0x1d4>
      close(open(file, 0));
    1674:	e3a01000 	mov	r1, #0
    1678:	e24b0050 	sub	r0, fp, #80	; 0x50
    167c:	eb000824 	bl	3714 <open>
    1680:	eb0007fc 	bl	3678 <close>
      close(open(file, 0));
    1684:	e3a01000 	mov	r1, #0
    1688:	e24b0050 	sub	r0, fp, #80	; 0x50
    168c:	eb000820 	bl	3714 <open>
    1690:	eb0007f8 	bl	3678 <close>
      close(open(file, 0));
    1694:	e3a01000 	mov	r1, #0
    1698:	e24b0050 	sub	r0, fp, #80	; 0x50
    169c:	eb00081c 	bl	3714 <open>
    16a0:	eb0007f4 	bl	3678 <close>
      close(open(file, 0));
    16a4:	e3a01000 	mov	r1, #0
    16a8:	e24b0050 	sub	r0, fp, #80	; 0x50
    16ac:	eb000818 	bl	3714 <open>
    16b0:	eb0007f0 	bl	3678 <close>
    16b4:	eaffffdd 	b	1630 <concreate+0x210>
  printf(1, "concreate ok\n");
    16b8:	e3a00001 	mov	r0, #1
    16bc:	e304165c 	movw	r1, #18012	; 0x465c
    16c0:	e3401000 	movt	r1, #0
    16c4:	eb0008f6 	bl	3aa4 <printf>
}
    16c8:	e24bd010 	sub	sp, fp, #16
    16cc:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
      printf(1, "fork failed\n");
    16d0:	e3051718 	movw	r1, #22296	; 0x5718
    16d4:	e3a00001 	mov	r0, #1
    16d8:	e3401000 	movt	r1, #0
    16dc:	eb0008f0 	bl	3aa4 <printf>
      exit();
    16e0:	eb000796 	bl	3540 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    16e4:	e3041628 	movw	r1, #17960	; 0x4628
    16e8:	e3a00001 	mov	r0, #1
    16ec:	e3401000 	movt	r1, #0
    16f0:	eb0008eb 	bl	3aa4 <printf>
    exit();
    16f4:	eb000791 	bl	3540 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    16f8:	e3041608 	movw	r1, #17928	; 0x4608
    16fc:	e24b204a 	sub	r2, fp, #74	; 0x4a
    1700:	e3401000 	movt	r1, #0
    1704:	e3a00001 	mov	r0, #1
    1708:	eb0008e5 	bl	3aa4 <printf>
        exit();
    170c:	eb00078b 	bl	3540 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1710:	e30415ec 	movw	r1, #17900	; 0x45ec
    1714:	e24b204a 	sub	r2, fp, #74	; 0x4a
    1718:	e3401000 	movt	r1, #0
    171c:	e3a00001 	mov	r0, #1
    1720:	eb0008df 	bl	3aa4 <printf>
    1724:	eaffff7c 	b	151c <concreate+0xfc>
      close(fd);
    1728:	eb0007d2 	bl	3678 <close>
    if(pid == 0)
    172c:	eaffff7a 	b	151c <concreate+0xfc>

00001730 <linkunlink>:
{
    1730:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink test\n");
    1734:	e3a00001 	mov	r0, #1
{
    1738:	e28db01c 	add	fp, sp, #28
  printf(1, "linkunlink test\n");
    173c:	e304166c 	movw	r1, #18028	; 0x466c
    1740:	e3401000 	movt	r1, #0
    1744:	eb0008d6 	bl	3aa4 <printf>
  unlink("x");
    1748:	e3040aec 	movw	r0, #19180	; 0x4aec
    174c:	e3400000 	movt	r0, #0
    1750:	eb000809 	bl	377c <unlink>
  pid = fork();
    1754:	eb00076c 	bl	350c <fork>
  if(pid < 0){
    1758:	e2507000 	subs	r7, r0, #0
    175c:	ba00002a 	blt	180c <linkunlink+0xdc>
    x = x * 1103515245 + 12345;
    1760:	e3046e6d 	movw	r6, #20077	; 0x4e6d
    if((x % 3) == 0){
    1764:	e30a5aab 	movw	r5, #43691	; 0xaaab
      unlink("x");
    1768:	e3044aec 	movw	r4, #19180	; 0x4aec
  unsigned int x = (pid ? 1 : 97);
    176c:	03a08061 	moveq	r8, #97	; 0x61
    1770:	13a08001 	movne	r8, #1
    x = x * 1103515245 + 12345;
    1774:	e34461c6 	movt	r6, #16838	; 0x41c6
    if((x % 3) == 0){
    1778:	e34a5aaa 	movt	r5, #43690	; 0xaaaa
      unlink("x");
    177c:	e3404000 	movt	r4, #0
  unsigned int x = (pid ? 1 : 97);
    1780:	e3a09064 	mov	r9, #100	; 0x64
    1784:	ea000005 	b	17a0 <linkunlink+0x70>
    } else if((x % 3) == 1){
    1788:	e3530001 	cmp	r3, #1
    178c:	0a000019 	beq	17f8 <linkunlink+0xc8>
      unlink("x");
    1790:	e1a00004 	mov	r0, r4
    1794:	eb0007f8 	bl	377c <unlink>
  for(i = 0; i < 100; i++){
    1798:	e2599001 	subs	r9, r9, #1
    179c:	0a00000c 	beq	17d4 <linkunlink+0xa4>
    x = x * 1103515245 + 12345;
    17a0:	e3033039 	movw	r3, #12345	; 0x3039
    17a4:	e0283896 	mla	r8, r6, r8, r3
    if((x % 3) == 0){
    17a8:	e0832895 	umull	r2, r3, r5, r8
    17ac:	e1a030a3 	lsr	r3, r3, #1
    17b0:	e0833083 	add	r3, r3, r3, lsl #1
    17b4:	e0583003 	subs	r3, r8, r3
    17b8:	1afffff2 	bne	1788 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    17bc:	e3001202 	movw	r1, #514	; 0x202
    17c0:	e1a00004 	mov	r0, r4
    17c4:	eb0007d2 	bl	3714 <open>
    17c8:	eb0007aa 	bl	3678 <close>
  for(i = 0; i < 100; i++){
    17cc:	e2599001 	subs	r9, r9, #1
    17d0:	1afffff2 	bne	17a0 <linkunlink+0x70>
  if(pid)
    17d4:	e3570000 	cmp	r7, #0
    17d8:	0a000010 	beq	1820 <linkunlink+0xf0>
    wait();
    17dc:	eb000764 	bl	3574 <wait>
  printf(1, "linkunlink ok\n");
    17e0:	e3041684 	movw	r1, #18052	; 0x4684
    17e4:	e3a00001 	mov	r0, #1
    17e8:	e3401000 	movt	r1, #0
}
    17ec:	e24bd01c 	sub	sp, fp, #28
    17f0:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink ok\n");
    17f4:	ea0008aa 	b	3aa4 <printf>
      link("cat", "x");
    17f8:	e3040680 	movw	r0, #18048	; 0x4680
    17fc:	e1a01004 	mov	r1, r4
    1800:	e3400000 	movt	r0, #0
    1804:	eb0007f6 	bl	37e4 <link>
    1808:	eaffffe2 	b	1798 <linkunlink+0x68>
    printf(1, "fork failed\n");
    180c:	e3051718 	movw	r1, #22296	; 0x5718
    1810:	e3a00001 	mov	r0, #1
    1814:	e3401000 	movt	r1, #0
    1818:	eb0008a1 	bl	3aa4 <printf>
    exit();
    181c:	eb000747 	bl	3540 <exit>
    exit();
    1820:	eb000746 	bl	3540 <exit>

00001824 <bigdir>:
{
    1824:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  printf(1, "bigdir test\n");
    1828:	e3a00001 	mov	r0, #1
{
    182c:	e28db018 	add	fp, sp, #24
  printf(1, "bigdir test\n");
    1830:	e3041694 	movw	r1, #18068	; 0x4694
{
    1834:	e24dd014 	sub	sp, sp, #20
  printf(1, "bigdir test\n");
    1838:	e3401000 	movt	r1, #0
    183c:	eb000898 	bl	3aa4 <printf>
  unlink("bd");
    1840:	e30406a4 	movw	r0, #18084	; 0x46a4
    1844:	e3400000 	movt	r0, #0
    1848:	eb0007cb 	bl	377c <unlink>
  fd = open("bd", O_CREATE);
    184c:	e30406a4 	movw	r0, #18084	; 0x46a4
    1850:	e3a01c02 	mov	r1, #512	; 0x200
    1854:	e3400000 	movt	r0, #0
    1858:	eb0007ad 	bl	3714 <open>
  if(fd < 0){
    185c:	e3500000 	cmp	r0, #0
    1860:	ba000039 	blt	194c <bigdir+0x128>
  close(fd);
    1864:	eb000783 	bl	3678 <close>
  for(i = 0; i < 500; i++){
    1868:	e3a07000 	mov	r7, #0
    if(link("bd", name) != 0){
    186c:	e30446a4 	movw	r4, #18084	; 0x46a4
    1870:	e3404000 	movt	r4, #0
    name[3] = '\0';
    1874:	e1a06007 	mov	r6, r7
    name[0] = 'x';
    1878:	e3a05078 	mov	r5, #120	; 0x78
    name[1] = '0' + (i / 64);
    187c:	e1a02347 	asr	r2, r7, #6
    name[2] = '0' + (i % 64);
    1880:	e207303f 	and	r3, r7, #63	; 0x3f
    if(link("bd", name) != 0){
    1884:	e24b1028 	sub	r1, fp, #40	; 0x28
    1888:	e1a00004 	mov	r0, r4
    name[1] = '0' + (i / 64);
    188c:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    1890:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    1894:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    1898:	e54b6025 	strb	r6, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    189c:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    18a0:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(link("bd", name) != 0){
    18a4:	eb0007ce 	bl	37e4 <link>
    18a8:	e2508000 	subs	r8, r0, #0
    18ac:	1a00001c 	bne	1924 <bigdir+0x100>
  for(i = 0; i < 500; i++){
    18b0:	e2877001 	add	r7, r7, #1
    18b4:	e3570f7d 	cmp	r7, #500	; 0x1f4
    18b8:	1affffef 	bne	187c <bigdir+0x58>
  unlink("bd");
    18bc:	e30406a4 	movw	r0, #18084	; 0x46a4
    18c0:	e3400000 	movt	r0, #0
    18c4:	eb0007ac 	bl	377c <unlink>
    name[0] = 'x';
    18c8:	e3a05078 	mov	r5, #120	; 0x78
    name[3] = '\0';
    18cc:	e1a04008 	mov	r4, r8
    name[1] = '0' + (i / 64);
    18d0:	e1a02348 	asr	r2, r8, #6
    name[2] = '0' + (i % 64);
    18d4:	e208303f 	and	r3, r8, #63	; 0x3f
    if(unlink(name) != 0){
    18d8:	e24b0028 	sub	r0, fp, #40	; 0x28
    name[1] = '0' + (i / 64);
    18dc:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    18e0:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    18e4:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    18e8:	e54b4025 	strb	r4, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    18ec:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    18f0:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(unlink(name) != 0){
    18f4:	eb0007a0 	bl	377c <unlink>
    18f8:	e3500000 	cmp	r0, #0
    18fc:	1a00000d 	bne	1938 <bigdir+0x114>
  for(i = 0; i < 500; i++){
    1900:	e2888001 	add	r8, r8, #1
    1904:	e3580f7d 	cmp	r8, #500	; 0x1f4
    1908:	1afffff0 	bne	18d0 <bigdir+0xac>
  printf(1, "bigdir ok\n");
    190c:	e3a00001 	mov	r0, #1
    1910:	e30416ec 	movw	r1, #18156	; 0x46ec
    1914:	e3401000 	movt	r1, #0
    1918:	eb000861 	bl	3aa4 <printf>
}
    191c:	e24bd018 	sub	sp, fp, #24
    1920:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "bigdir link failed\n");
    1924:	e30416c0 	movw	r1, #18112	; 0x46c0
    1928:	e3a00001 	mov	r0, #1
    192c:	e3401000 	movt	r1, #0
    1930:	eb00085b 	bl	3aa4 <printf>
      exit();
    1934:	eb000701 	bl	3540 <exit>
      printf(1, "bigdir unlink failed");
    1938:	e30416d4 	movw	r1, #18132	; 0x46d4
    193c:	e3a00001 	mov	r0, #1
    1940:	e3401000 	movt	r1, #0
    1944:	eb000856 	bl	3aa4 <printf>
      exit();
    1948:	eb0006fc 	bl	3540 <exit>
    printf(1, "bigdir create failed\n");
    194c:	e30416a8 	movw	r1, #18088	; 0x46a8
    1950:	e3a00001 	mov	r0, #1
    1954:	e3401000 	movt	r1, #0
    1958:	eb000851 	bl	3aa4 <printf>
    exit();
    195c:	eb0006f7 	bl	3540 <exit>

00001960 <subdir>:
{
    1960:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "subdir test\n");
    1964:	e3a00001 	mov	r0, #1
{
    1968:	e28db00c 	add	fp, sp, #12
  printf(1, "subdir test\n");
    196c:	e30416f8 	movw	r1, #18168	; 0x46f8
    1970:	e3401000 	movt	r1, #0
    1974:	eb00084a 	bl	3aa4 <printf>
  unlink("ff");
    1978:	e3040800 	movw	r0, #18432	; 0x4800
    197c:	e3400000 	movt	r0, #0
    1980:	eb00077d 	bl	377c <unlink>
  if(mkdir("dd") != 0){
    1984:	e30408ac 	movw	r0, #18604	; 0x48ac
    1988:	e3400000 	movt	r0, #0
    198c:	eb0007a1 	bl	3818 <mkdir>
    1990:	e3500000 	cmp	r0, #0
    1994:	1a000150 	bne	1edc <subdir+0x57c>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1998:	e3040720 	movw	r0, #18208	; 0x4720
    199c:	e3001202 	movw	r1, #514	; 0x202
    19a0:	e3400000 	movt	r0, #0
    19a4:	eb00075a 	bl	3714 <open>
  if(fd < 0){
    19a8:	e2504000 	subs	r4, r0, #0
    19ac:	ba000145 	blt	1ec8 <subdir+0x568>
  write(fd, "ff", 2);
    19b0:	e3a02002 	mov	r2, #2
    19b4:	e3041800 	movw	r1, #18432	; 0x4800
    19b8:	e3401000 	movt	r1, #0
    19bc:	eb000720 	bl	3644 <write>
  close(fd);
    19c0:	e1a00004 	mov	r0, r4
    19c4:	eb00072b 	bl	3678 <close>
  if(unlink("dd") >= 0){
    19c8:	e30408ac 	movw	r0, #18604	; 0x48ac
    19cc:	e3400000 	movt	r0, #0
    19d0:	eb000769 	bl	377c <unlink>
    19d4:	e3500000 	cmp	r0, #0
    19d8:	aa000135 	bge	1eb4 <subdir+0x554>
  if(mkdir("/dd/dd") != 0){
    19dc:	e3040768 	movw	r0, #18280	; 0x4768
    19e0:	e3400000 	movt	r0, #0
    19e4:	eb00078b 	bl	3818 <mkdir>
    19e8:	e2504000 	subs	r4, r0, #0
    19ec:	1a00012b 	bne	1ea0 <subdir+0x540>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    19f0:	e304078c 	movw	r0, #18316	; 0x478c
    19f4:	e3001202 	movw	r1, #514	; 0x202
    19f8:	e3400000 	movt	r0, #0
    19fc:	eb000744 	bl	3714 <open>
  if(fd < 0){
    1a00:	e2505000 	subs	r5, r0, #0
    1a04:	ba0000ee 	blt	1dc4 <subdir+0x464>
  write(fd, "FF", 2);
    1a08:	e3a02002 	mov	r2, #2
    1a0c:	e30417b0 	movw	r1, #18352	; 0x47b0
    1a10:	e3401000 	movt	r1, #0
    1a14:	eb00070a 	bl	3644 <write>
  close(fd);
    1a18:	e1a00005 	mov	r0, r5
    1a1c:	eb000715 	bl	3678 <close>
  fd = open("dd/dd/../ff", 0);
    1a20:	e1a01004 	mov	r1, r4
    1a24:	e30407b4 	movw	r0, #18356	; 0x47b4
    1a28:	e3400000 	movt	r0, #0
    1a2c:	eb000738 	bl	3714 <open>
  if(fd < 0){
    1a30:	e2505000 	subs	r5, r0, #0
    1a34:	ba0000dd 	blt	1db0 <subdir+0x450>
  cc = read(fd, buf, sizeof(buf));
    1a38:	e3074fcc 	movw	r4, #32716	; 0x7fcc
    1a3c:	e3404000 	movt	r4, #0
    1a40:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a44:	e1a01004 	mov	r1, r4
    1a48:	eb0006f0 	bl	3610 <read>
  if(cc != 2 || buf[0] != 'f'){
    1a4c:	e3500002 	cmp	r0, #2
    1a50:	1a0000b3 	bne	1d24 <subdir+0x3c4>
    1a54:	e5d43000 	ldrb	r3, [r4]
    1a58:	e3530066 	cmp	r3, #102	; 0x66
    1a5c:	1a0000b0 	bne	1d24 <subdir+0x3c4>
  close(fd);
    1a60:	e1a00005 	mov	r0, r5
    1a64:	eb000703 	bl	3678 <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1a68:	e30417f8 	movw	r1, #18424	; 0x47f8
    1a6c:	e304078c 	movw	r0, #18316	; 0x478c
    1a70:	e3401000 	movt	r1, #0
    1a74:	e3400000 	movt	r0, #0
    1a78:	eb000759 	bl	37e4 <link>
    1a7c:	e3500000 	cmp	r0, #0
    1a80:	1a0000d9 	bne	1dec <subdir+0x48c>
  if(unlink("dd/dd/ff") != 0){
    1a84:	e304078c 	movw	r0, #18316	; 0x478c
    1a88:	e3400000 	movt	r0, #0
    1a8c:	eb00073a 	bl	377c <unlink>
    1a90:	e3500000 	cmp	r0, #0
    1a94:	1a0000ac 	bne	1d4c <subdir+0x3ec>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1a98:	e304078c 	movw	r0, #18316	; 0x478c
    1a9c:	e3a01000 	mov	r1, #0
    1aa0:	e3400000 	movt	r0, #0
    1aa4:	eb00071a 	bl	3714 <open>
    1aa8:	e3500000 	cmp	r0, #0
    1aac:	aa0000f6 	bge	1e8c <subdir+0x52c>
  if(chdir("dd") != 0){
    1ab0:	e30408ac 	movw	r0, #18604	; 0x48ac
    1ab4:	e3400000 	movt	r0, #0
    1ab8:	eb000763 	bl	384c <chdir>
    1abc:	e3500000 	cmp	r0, #0
    1ac0:	1a0000ec 	bne	1e78 <subdir+0x518>
  if(chdir("dd/../../dd") != 0){
    1ac4:	e3040878 	movw	r0, #18552	; 0x4878
    1ac8:	e3400000 	movt	r0, #0
    1acc:	eb00075e 	bl	384c <chdir>
    1ad0:	e3500000 	cmp	r0, #0
    1ad4:	1a000097 	bne	1d38 <subdir+0x3d8>
  if(chdir("dd/../../../dd") != 0){
    1ad8:	e30408a0 	movw	r0, #18592	; 0x48a0
    1adc:	e3400000 	movt	r0, #0
    1ae0:	eb000759 	bl	384c <chdir>
    1ae4:	e3500000 	cmp	r0, #0
    1ae8:	1a000092 	bne	1d38 <subdir+0x3d8>
  if(chdir("./..") != 0){
    1aec:	e30408b0 	movw	r0, #18608	; 0x48b0
    1af0:	e3400000 	movt	r0, #0
    1af4:	eb000754 	bl	384c <chdir>
    1af8:	e2504000 	subs	r4, r0, #0
    1afc:	1a0000b5 	bne	1dd8 <subdir+0x478>
  fd = open("dd/dd/ffff", 0);
    1b00:	e30407f8 	movw	r0, #18424	; 0x47f8
    1b04:	e1a01004 	mov	r1, r4
    1b08:	e3400000 	movt	r0, #0
    1b0c:	eb000700 	bl	3714 <open>
  if(fd < 0){
    1b10:	e2505000 	subs	r5, r0, #0
    1b14:	ba00012c 	blt	1fcc <subdir+0x66c>
  if(read(fd, buf, sizeof(buf)) != 2){
    1b18:	e3071fcc 	movw	r1, #32716	; 0x7fcc
    1b1c:	e3a02a02 	mov	r2, #8192	; 0x2000
    1b20:	e3401000 	movt	r1, #0
    1b24:	eb0006b9 	bl	3610 <read>
    1b28:	e3500002 	cmp	r0, #2
    1b2c:	1a000121 	bne	1fb8 <subdir+0x658>
  close(fd);
    1b30:	e1a00005 	mov	r0, r5
    1b34:	eb0006cf 	bl	3678 <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1b38:	e1a01004 	mov	r1, r4
    1b3c:	e304078c 	movw	r0, #18316	; 0x478c
    1b40:	e3400000 	movt	r0, #0
    1b44:	eb0006f2 	bl	3714 <open>
    1b48:	e3500000 	cmp	r0, #0
    1b4c:	aa000088 	bge	1d74 <subdir+0x414>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1b50:	e3040928 	movw	r0, #18728	; 0x4928
    1b54:	e3001202 	movw	r1, #514	; 0x202
    1b58:	e3400000 	movt	r0, #0
    1b5c:	eb0006ec 	bl	3714 <open>
    1b60:	e3500000 	cmp	r0, #0
    1b64:	aa00007d 	bge	1d60 <subdir+0x400>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1b68:	e3040950 	movw	r0, #18768	; 0x4950
    1b6c:	e3001202 	movw	r1, #514	; 0x202
    1b70:	e3400000 	movt	r0, #0
    1b74:	eb0006e6 	bl	3714 <open>
    1b78:	e3500000 	cmp	r0, #0
    1b7c:	aa0000b8 	bge	1e64 <subdir+0x504>
  if(open("dd", O_CREATE) >= 0){
    1b80:	e30408ac 	movw	r0, #18604	; 0x48ac
    1b84:	e3a01c02 	mov	r1, #512	; 0x200
    1b88:	e3400000 	movt	r0, #0
    1b8c:	eb0006e0 	bl	3714 <open>
    1b90:	e3500000 	cmp	r0, #0
    1b94:	aa0000ad 	bge	1e50 <subdir+0x4f0>
  if(open("dd", O_RDWR) >= 0){
    1b98:	e30408ac 	movw	r0, #18604	; 0x48ac
    1b9c:	e3a01002 	mov	r1, #2
    1ba0:	e3400000 	movt	r0, #0
    1ba4:	eb0006da 	bl	3714 <open>
    1ba8:	e3500000 	cmp	r0, #0
    1bac:	aa0000a2 	bge	1e3c <subdir+0x4dc>
  if(open("dd", O_WRONLY) >= 0){
    1bb0:	e30408ac 	movw	r0, #18604	; 0x48ac
    1bb4:	e3a01001 	mov	r1, #1
    1bb8:	e3400000 	movt	r0, #0
    1bbc:	eb0006d4 	bl	3714 <open>
    1bc0:	e3500000 	cmp	r0, #0
    1bc4:	aa000097 	bge	1e28 <subdir+0x4c8>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1bc8:	e30419c8 	movw	r1, #18888	; 0x49c8
    1bcc:	e3040928 	movw	r0, #18728	; 0x4928
    1bd0:	e3401000 	movt	r1, #0
    1bd4:	e3400000 	movt	r0, #0
    1bd8:	eb000701 	bl	37e4 <link>
    1bdc:	e3500000 	cmp	r0, #0
    1be0:	0a00008b 	beq	1e14 <subdir+0x4b4>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1be4:	e30419c8 	movw	r1, #18888	; 0x49c8
    1be8:	e3040950 	movw	r0, #18768	; 0x4950
    1bec:	e3401000 	movt	r1, #0
    1bf0:	e3400000 	movt	r0, #0
    1bf4:	eb0006fa 	bl	37e4 <link>
    1bf8:	e3500000 	cmp	r0, #0
    1bfc:	0a00007f 	beq	1e00 <subdir+0x4a0>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1c00:	e30417f8 	movw	r1, #18424	; 0x47f8
    1c04:	e3040720 	movw	r0, #18208	; 0x4720
    1c08:	e3401000 	movt	r1, #0
    1c0c:	e3400000 	movt	r0, #0
    1c10:	eb0006f3 	bl	37e4 <link>
    1c14:	e3500000 	cmp	r0, #0
    1c18:	0a00005f 	beq	1d9c <subdir+0x43c>
  if(mkdir("dd/ff/ff") == 0){
    1c1c:	e3040928 	movw	r0, #18728	; 0x4928
    1c20:	e3400000 	movt	r0, #0
    1c24:	eb0006fb 	bl	3818 <mkdir>
    1c28:	e3500000 	cmp	r0, #0
    1c2c:	0a000055 	beq	1d88 <subdir+0x428>
  if(mkdir("dd/xx/ff") == 0){
    1c30:	e3040950 	movw	r0, #18768	; 0x4950
    1c34:	e3400000 	movt	r0, #0
    1c38:	eb0006f6 	bl	3818 <mkdir>
    1c3c:	e3500000 	cmp	r0, #0
    1c40:	0a0000d7 	beq	1fa4 <subdir+0x644>
  if(mkdir("dd/dd/ffff") == 0){
    1c44:	e30407f8 	movw	r0, #18424	; 0x47f8
    1c48:	e3400000 	movt	r0, #0
    1c4c:	eb0006f1 	bl	3818 <mkdir>
    1c50:	e3500000 	cmp	r0, #0
    1c54:	0a0000cd 	beq	1f90 <subdir+0x630>
  if(unlink("dd/xx/ff") == 0){
    1c58:	e3040950 	movw	r0, #18768	; 0x4950
    1c5c:	e3400000 	movt	r0, #0
    1c60:	eb0006c5 	bl	377c <unlink>
    1c64:	e3500000 	cmp	r0, #0
    1c68:	0a0000c3 	beq	1f7c <subdir+0x61c>
  if(unlink("dd/ff/ff") == 0){
    1c6c:	e3040928 	movw	r0, #18728	; 0x4928
    1c70:	e3400000 	movt	r0, #0
    1c74:	eb0006c0 	bl	377c <unlink>
    1c78:	e3500000 	cmp	r0, #0
    1c7c:	0a0000b9 	beq	1f68 <subdir+0x608>
  if(chdir("dd/ff") == 0){
    1c80:	e3040720 	movw	r0, #18208	; 0x4720
    1c84:	e3400000 	movt	r0, #0
    1c88:	eb0006ef 	bl	384c <chdir>
    1c8c:	e3500000 	cmp	r0, #0
    1c90:	0a0000af 	beq	1f54 <subdir+0x5f4>
  if(chdir("dd/xx") == 0){
    1c94:	e3040ae8 	movw	r0, #19176	; 0x4ae8
    1c98:	e3400000 	movt	r0, #0
    1c9c:	eb0006ea 	bl	384c <chdir>
    1ca0:	e3500000 	cmp	r0, #0
    1ca4:	0a0000a5 	beq	1f40 <subdir+0x5e0>
  if(unlink("dd/dd/ffff") != 0){
    1ca8:	e30407f8 	movw	r0, #18424	; 0x47f8
    1cac:	e3400000 	movt	r0, #0
    1cb0:	eb0006b1 	bl	377c <unlink>
    1cb4:	e3500000 	cmp	r0, #0
    1cb8:	1a000023 	bne	1d4c <subdir+0x3ec>
  if(unlink("dd/ff") != 0){
    1cbc:	e3040720 	movw	r0, #18208	; 0x4720
    1cc0:	e3400000 	movt	r0, #0
    1cc4:	eb0006ac 	bl	377c <unlink>
    1cc8:	e3500000 	cmp	r0, #0
    1ccc:	1a000096 	bne	1f2c <subdir+0x5cc>
  if(unlink("dd") == 0){
    1cd0:	e30408ac 	movw	r0, #18604	; 0x48ac
    1cd4:	e3400000 	movt	r0, #0
    1cd8:	eb0006a7 	bl	377c <unlink>
    1cdc:	e3500000 	cmp	r0, #0
    1ce0:	0a00008c 	beq	1f18 <subdir+0x5b8>
  if(unlink("dd/dd") < 0){
    1ce4:	e3040b40 	movw	r0, #19264	; 0x4b40
    1ce8:	e3400000 	movt	r0, #0
    1cec:	eb0006a2 	bl	377c <unlink>
    1cf0:	e3500000 	cmp	r0, #0
    1cf4:	ba000082 	blt	1f04 <subdir+0x5a4>
  if(unlink("dd") < 0){
    1cf8:	e30408ac 	movw	r0, #18604	; 0x48ac
    1cfc:	e3400000 	movt	r0, #0
    1d00:	eb00069d 	bl	377c <unlink>
    1d04:	e3500000 	cmp	r0, #0
    1d08:	ba000078 	blt	1ef0 <subdir+0x590>
  printf(1, "subdir ok\n");
    1d0c:	e3041b74 	movw	r1, #19316	; 0x4b74
    1d10:	e3a00001 	mov	r0, #1
    1d14:	e3401000 	movt	r1, #0
}
    1d18:	e24bd00c 	sub	sp, fp, #12
    1d1c:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "subdir ok\n");
    1d20:	ea00075f 	b	3aa4 <printf>
    printf(1, "dd/dd/../ff wrong content\n");
    1d24:	e30417dc 	movw	r1, #18396	; 0x47dc
    1d28:	e3a00001 	mov	r0, #1
    1d2c:	e3401000 	movt	r1, #0
    1d30:	eb00075b 	bl	3aa4 <printf>
    exit();
    1d34:	eb000601 	bl	3540 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    1d38:	e3041884 	movw	r1, #18564	; 0x4884
    1d3c:	e3a00001 	mov	r0, #1
    1d40:	e3401000 	movt	r1, #0
    1d44:	eb000756 	bl	3aa4 <printf>
    exit();
    1d48:	eb0005fc 	bl	3540 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1d4c:	e3041828 	movw	r1, #18472	; 0x4828
    1d50:	e3a00001 	mov	r0, #1
    1d54:	e3401000 	movt	r1, #0
    1d58:	eb000751 	bl	3aa4 <printf>
    exit();
    1d5c:	eb0005f7 	bl	3540 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    1d60:	e3041934 	movw	r1, #18740	; 0x4934
    1d64:	e3a00001 	mov	r0, #1
    1d68:	e3401000 	movt	r1, #0
    1d6c:	eb00074c 	bl	3aa4 <printf>
    exit();
    1d70:	eb0005f2 	bl	3540 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1d74:	e3041900 	movw	r1, #18688	; 0x4900
    1d78:	e3a00001 	mov	r0, #1
    1d7c:	e3401000 	movt	r1, #0
    1d80:	eb000747 	bl	3aa4 <printf>
    exit();
    1d84:	eb0005ed 	bl	3540 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1d88:	e3041a40 	movw	r1, #19008	; 0x4a40
    1d8c:	e3a00001 	mov	r0, #1
    1d90:	e3401000 	movt	r1, #0
    1d94:	eb000742 	bl	3aa4 <printf>
    exit();
    1d98:	eb0005e8 	bl	3540 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1d9c:	e3041a1c 	movw	r1, #18972	; 0x4a1c
    1da0:	e3a00001 	mov	r0, #1
    1da4:	e3401000 	movt	r1, #0
    1da8:	eb00073d 	bl	3aa4 <printf>
    exit();
    1dac:	eb0005e3 	bl	3540 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1db0:	e30417c0 	movw	r1, #18368	; 0x47c0
    1db4:	e3a00001 	mov	r0, #1
    1db8:	e3401000 	movt	r1, #0
    1dbc:	eb000738 	bl	3aa4 <printf>
    exit();
    1dc0:	eb0005de 	bl	3540 <exit>
    printf(1, "create dd/dd/ff failed\n");
    1dc4:	e3041798 	movw	r1, #18328	; 0x4798
    1dc8:	e3a00001 	mov	r0, #1
    1dcc:	e3401000 	movt	r1, #0
    1dd0:	eb000733 	bl	3aa4 <printf>
    exit();
    1dd4:	eb0005d9 	bl	3540 <exit>
    printf(1, "chdir ./.. failed\n");
    1dd8:	e30418b8 	movw	r1, #18616	; 0x48b8
    1ddc:	e3a00001 	mov	r0, #1
    1de0:	e3401000 	movt	r1, #0
    1de4:	eb00072e 	bl	3aa4 <printf>
    exit();
    1de8:	eb0005d4 	bl	3540 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1dec:	e3041804 	movw	r1, #18436	; 0x4804
    1df0:	e3a00001 	mov	r0, #1
    1df4:	e3401000 	movt	r1, #0
    1df8:	eb000729 	bl	3aa4 <printf>
    exit();
    1dfc:	eb0005cf 	bl	3540 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    1e00:	e30419f8 	movw	r1, #18936	; 0x49f8
    1e04:	e3a00001 	mov	r0, #1
    1e08:	e3401000 	movt	r1, #0
    1e0c:	eb000724 	bl	3aa4 <printf>
    exit();
    1e10:	eb0005ca 	bl	3540 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    1e14:	e30419d4 	movw	r1, #18900	; 0x49d4
    1e18:	e3a00001 	mov	r0, #1
    1e1c:	e3401000 	movt	r1, #0
    1e20:	eb00071f 	bl	3aa4 <printf>
    exit();
    1e24:	eb0005c5 	bl	3540 <exit>
    printf(1, "open dd wronly succeeded!\n");
    1e28:	e30419ac 	movw	r1, #18860	; 0x49ac
    1e2c:	e3a00001 	mov	r0, #1
    1e30:	e3401000 	movt	r1, #0
    1e34:	eb00071a 	bl	3aa4 <printf>
    exit();
    1e38:	eb0005c0 	bl	3540 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    1e3c:	e3041990 	movw	r1, #18832	; 0x4990
    1e40:	e3a00001 	mov	r0, #1
    1e44:	e3401000 	movt	r1, #0
    1e48:	eb000715 	bl	3aa4 <printf>
    exit();
    1e4c:	eb0005bb 	bl	3540 <exit>
    printf(1, "create dd succeeded!\n");
    1e50:	e3041978 	movw	r1, #18808	; 0x4978
    1e54:	e3a00001 	mov	r0, #1
    1e58:	e3401000 	movt	r1, #0
    1e5c:	eb000710 	bl	3aa4 <printf>
    exit();
    1e60:	eb0005b6 	bl	3540 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    1e64:	e304195c 	movw	r1, #18780	; 0x495c
    1e68:	e3a00001 	mov	r0, #1
    1e6c:	e3401000 	movt	r1, #0
    1e70:	eb00070b 	bl	3aa4 <printf>
    exit();
    1e74:	eb0005b1 	bl	3540 <exit>
    printf(1, "chdir dd failed\n");
    1e78:	e3041864 	movw	r1, #18532	; 0x4864
    1e7c:	e3a00001 	mov	r0, #1
    1e80:	e3401000 	movt	r1, #0
    1e84:	eb000706 	bl	3aa4 <printf>
    exit();
    1e88:	eb0005ac 	bl	3540 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1e8c:	e3041840 	movw	r1, #18496	; 0x4840
    1e90:	e3a00001 	mov	r0, #1
    1e94:	e3401000 	movt	r1, #0
    1e98:	eb000701 	bl	3aa4 <printf>
    exit();
    1e9c:	eb0005a7 	bl	3540 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1ea0:	e3041770 	movw	r1, #18288	; 0x4770
    1ea4:	e3a00001 	mov	r0, #1
    1ea8:	e3401000 	movt	r1, #0
    1eac:	eb0006fc 	bl	3aa4 <printf>
    exit();
    1eb0:	eb0005a2 	bl	3540 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1eb4:	e3041740 	movw	r1, #18240	; 0x4740
    1eb8:	e3a00001 	mov	r0, #1
    1ebc:	e3401000 	movt	r1, #0
    1ec0:	eb0006f7 	bl	3aa4 <printf>
    exit();
    1ec4:	eb00059d 	bl	3540 <exit>
    printf(1, "create dd/ff failed\n");
    1ec8:	e3041728 	movw	r1, #18216	; 0x4728
    1ecc:	e3a00001 	mov	r0, #1
    1ed0:	e3401000 	movt	r1, #0
    1ed4:	eb0006f2 	bl	3aa4 <printf>
    exit();
    1ed8:	eb000598 	bl	3540 <exit>
    printf(1, "subdir mkdir dd failed\n");
    1edc:	e3041708 	movw	r1, #18184	; 0x4708
    1ee0:	e3a00001 	mov	r0, #1
    1ee4:	e3401000 	movt	r1, #0
    1ee8:	eb0006ed 	bl	3aa4 <printf>
    exit();
    1eec:	eb000593 	bl	3540 <exit>
    printf(1, "unlink dd failed\n");
    1ef0:	e3041b60 	movw	r1, #19296	; 0x4b60
    1ef4:	e3a00001 	mov	r0, #1
    1ef8:	e3401000 	movt	r1, #0
    1efc:	eb0006e8 	bl	3aa4 <printf>
    exit();
    1f00:	eb00058e 	bl	3540 <exit>
    printf(1, "unlink dd/dd failed\n");
    1f04:	e3041b48 	movw	r1, #19272	; 0x4b48
    1f08:	e3a00001 	mov	r0, #1
    1f0c:	e3401000 	movt	r1, #0
    1f10:	eb0006e3 	bl	3aa4 <printf>
    exit();
    1f14:	eb000589 	bl	3540 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    1f18:	e3041b20 	movw	r1, #19232	; 0x4b20
    1f1c:	e3a00001 	mov	r0, #1
    1f20:	e3401000 	movt	r1, #0
    1f24:	eb0006de 	bl	3aa4 <printf>
    exit();
    1f28:	eb000584 	bl	3540 <exit>
    printf(1, "unlink dd/ff failed\n");
    1f2c:	e3041b08 	movw	r1, #19208	; 0x4b08
    1f30:	e3a00001 	mov	r0, #1
    1f34:	e3401000 	movt	r1, #0
    1f38:	eb0006d9 	bl	3aa4 <printf>
    exit();
    1f3c:	eb00057f 	bl	3540 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    1f40:	e3041af0 	movw	r1, #19184	; 0x4af0
    1f44:	e3a00001 	mov	r0, #1
    1f48:	e3401000 	movt	r1, #0
    1f4c:	eb0006d4 	bl	3aa4 <printf>
    exit();
    1f50:	eb00057a 	bl	3540 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    1f54:	e3041ad0 	movw	r1, #19152	; 0x4ad0
    1f58:	e3a00001 	mov	r0, #1
    1f5c:	e3401000 	movt	r1, #0
    1f60:	eb0006cf 	bl	3aa4 <printf>
    exit();
    1f64:	eb000575 	bl	3540 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    1f68:	e3041ab4 	movw	r1, #19124	; 0x4ab4
    1f6c:	e3a00001 	mov	r0, #1
    1f70:	e3401000 	movt	r1, #0
    1f74:	eb0006ca 	bl	3aa4 <printf>
    exit();
    1f78:	eb000570 	bl	3540 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    1f7c:	e3041a98 	movw	r1, #19096	; 0x4a98
    1f80:	e3a00001 	mov	r0, #1
    1f84:	e3401000 	movt	r1, #0
    1f88:	eb0006c5 	bl	3aa4 <printf>
    exit();
    1f8c:	eb00056b 	bl	3540 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    1f90:	e3041a78 	movw	r1, #19064	; 0x4a78
    1f94:	e3a00001 	mov	r0, #1
    1f98:	e3401000 	movt	r1, #0
    1f9c:	eb0006c0 	bl	3aa4 <printf>
    exit();
    1fa0:	eb000566 	bl	3540 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    1fa4:	e3041a5c 	movw	r1, #19036	; 0x4a5c
    1fa8:	e3a00001 	mov	r0, #1
    1fac:	e3401000 	movt	r1, #0
    1fb0:	eb0006bb 	bl	3aa4 <printf>
    exit();
    1fb4:	eb000561 	bl	3540 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    1fb8:	e30418e4 	movw	r1, #18660	; 0x48e4
    1fbc:	e3a00001 	mov	r0, #1
    1fc0:	e3401000 	movt	r1, #0
    1fc4:	eb0006b6 	bl	3aa4 <printf>
    exit();
    1fc8:	eb00055c 	bl	3540 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    1fcc:	e30418cc 	movw	r1, #18636	; 0x48cc
    1fd0:	e3a00001 	mov	r0, #1
    1fd4:	e3401000 	movt	r1, #0
    1fd8:	eb0006b1 	bl	3aa4 <printf>
    exit();
    1fdc:	eb000557 	bl	3540 <exit>

00001fe0 <bigwrite>:
{
    1fe0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite test\n");
    1fe4:	e3a00001 	mov	r0, #1
{
    1fe8:	e28db014 	add	fp, sp, #20
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1fec:	e3047b90 	movw	r7, #19344	; 0x4b90
  printf(1, "bigwrite test\n");
    1ff0:	e3041b80 	movw	r1, #19328	; 0x4b80
    1ff4:	e3401000 	movt	r1, #0
    1ff8:	eb0006a9 	bl	3aa4 <printf>
  unlink("bigwrite");
    1ffc:	e1a00007 	mov	r0, r7
    2000:	e3400000 	movt	r0, #0
      int cc = write(fd, buf, sz);
    2004:	e3076fcc 	movw	r6, #32716	; 0x7fcc
    2008:	e3406000 	movt	r6, #0
  for(sz = 499; sz < 12*512; sz += 471){
    200c:	e30041f3 	movw	r4, #499	; 0x1f3
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2010:	e1a07000 	mov	r7, r0
  unlink("bigwrite");
    2014:	eb0005d8 	bl	377c <unlink>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2018:	e3001202 	movw	r1, #514	; 0x202
    201c:	e1a00007 	mov	r0, r7
    2020:	eb0005bb 	bl	3714 <open>
    if(fd < 0){
    2024:	e2505000 	subs	r5, r0, #0
    2028:	ba000020 	blt	20b0 <bigwrite+0xd0>
      int cc = write(fd, buf, sz);
    202c:	e1a02004 	mov	r2, r4
    2030:	e1a01006 	mov	r1, r6
    2034:	eb000582 	bl	3644 <write>
      if(cc != sz){
    2038:	e1500004 	cmp	r0, r4
    203c:	1a000014 	bne	2094 <bigwrite+0xb4>
      int cc = write(fd, buf, sz);
    2040:	e1a02004 	mov	r2, r4
    2044:	e1a01006 	mov	r1, r6
    2048:	e1a00005 	mov	r0, r5
    204c:	eb00057c 	bl	3644 <write>
      if(cc != sz){
    2050:	e1500004 	cmp	r0, r4
    2054:	1a00000e 	bne	2094 <bigwrite+0xb4>
    close(fd);
    2058:	e1a00005 	mov	r0, r5
  for(sz = 499; sz < 12*512; sz += 471){
    205c:	e2844f75 	add	r4, r4, #468	; 0x1d4
    close(fd);
    2060:	eb000584 	bl	3678 <close>
  for(sz = 499; sz < 12*512; sz += 471){
    2064:	e2844003 	add	r4, r4, #3
    unlink("bigwrite");
    2068:	e1a00007 	mov	r0, r7
    206c:	eb0005c2 	bl	377c <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2070:	e3013807 	movw	r3, #6151	; 0x1807
    2074:	e1540003 	cmp	r4, r3
    2078:	1affffe6 	bne	2018 <bigwrite+0x38>
  printf(1, "bigwrite ok\n");
    207c:	e3041bc8 	movw	r1, #19400	; 0x4bc8
    2080:	e3a00001 	mov	r0, #1
    2084:	e3401000 	movt	r1, #0
}
    2088:	e24bd014 	sub	sp, fp, #20
    208c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite ok\n");
    2090:	ea000683 	b	3aa4 <printf>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2094:	e1a03000 	mov	r3, r0
    2098:	e1a02004 	mov	r2, r4
    209c:	e3041bb4 	movw	r1, #19380	; 0x4bb4
    20a0:	e3a00001 	mov	r0, #1
    20a4:	e3401000 	movt	r1, #0
    20a8:	eb00067d 	bl	3aa4 <printf>
        exit();
    20ac:	eb000523 	bl	3540 <exit>
      printf(1, "cannot create bigwrite\n");
    20b0:	e3041b9c 	movw	r1, #19356	; 0x4b9c
    20b4:	e3a00001 	mov	r0, #1
    20b8:	e3401000 	movt	r1, #0
    20bc:	eb000678 	bl	3aa4 <printf>
      exit();
    20c0:	eb00051e 	bl	3540 <exit>

000020c4 <bigfile>:
{
    20c4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test\n");
    20c8:	e3a00001 	mov	r0, #1
{
    20cc:	e28db01c 	add	fp, sp, #28
  printf(1, "bigfile test\n");
    20d0:	e3041bd8 	movw	r1, #19416	; 0x4bd8
    20d4:	e3401000 	movt	r1, #0
    20d8:	eb000671 	bl	3aa4 <printf>
  unlink("bigfile");
    20dc:	e3040be8 	movw	r0, #19432	; 0x4be8
    20e0:	e3400000 	movt	r0, #0
    20e4:	eb0005a4 	bl	377c <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    20e8:	e3040be8 	movw	r0, #19432	; 0x4be8
    20ec:	e3001202 	movw	r1, #514	; 0x202
    20f0:	e3400000 	movt	r0, #0
    20f4:	eb000586 	bl	3714 <open>
  if(fd < 0){
    20f8:	e2506000 	subs	r6, r0, #0
    memset(buf, i, 600);
    20fc:	a3075fcc 	movwge	r5, #32716	; 0x7fcc
  for(i = 0; i < 20; i++){
    2100:	a3a04000 	movge	r4, #0
    memset(buf, i, 600);
    2104:	a3405000 	movtge	r5, #0
  if(fd < 0){
    2108:	ba000052 	blt	2258 <bigfile+0x194>
    memset(buf, i, 600);
    210c:	e3a02f96 	mov	r2, #600	; 0x258
    2110:	e1a01004 	mov	r1, r4
    2114:	e1a00005 	mov	r0, r5
    2118:	eb00048d 	bl	3354 <memset>
    if(write(fd, buf, 600) != 600){
    211c:	e3a02f96 	mov	r2, #600	; 0x258
    2120:	e1a01005 	mov	r1, r5
    2124:	e1a00006 	mov	r0, r6
    2128:	eb000545 	bl	3644 <write>
    212c:	e3500f96 	cmp	r0, #600	; 0x258
    2130:	1a00003e 	bne	2230 <bigfile+0x16c>
  for(i = 0; i < 20; i++){
    2134:	e2844001 	add	r4, r4, #1
    2138:	e3540014 	cmp	r4, #20
    213c:	1afffff2 	bne	210c <bigfile+0x48>
  close(fd);
    2140:	e1a00006 	mov	r0, r6
    2144:	eb00054b 	bl	3678 <close>
  fd = open("bigfile", 0);
    2148:	e3040be8 	movw	r0, #19432	; 0x4be8
    214c:	e3a01000 	mov	r1, #0
    2150:	e3400000 	movt	r0, #0
    2154:	eb00056e 	bl	3714 <open>
  if(fd < 0){
    2158:	e2507000 	subs	r7, r0, #0
    215c:	ba000038 	blt	2244 <bigfile+0x180>
    2160:	e3075fcc 	movw	r5, #32716	; 0x7fcc
    2164:	e3405000 	movt	r5, #0
  total = 0;
    2168:	e3a06000 	mov	r6, #0
    cc = read(fd, buf, 300);
    216c:	e1a08005 	mov	r8, r5
  for(i = 0; ; i++){
    2170:	e1a04006 	mov	r4, r6
    2174:	ea000009 	b	21a0 <bigfile+0xdc>
    if(cc != 300){
    2178:	e3500f4b 	cmp	r0, #300	; 0x12c
    217c:	1a000021 	bne	2208 <bigfile+0x144>
    if(buf[0] != i/2 || buf[299] != i/2){
    2180:	e5d53000 	ldrb	r3, [r5]
    2184:	e15300c4 	cmp	r3, r4, asr #1
    2188:	1a000019 	bne	21f4 <bigfile+0x130>
    218c:	e5d5212b 	ldrb	r2, [r5, #299]	; 0x12b
    2190:	e1530002 	cmp	r3, r2
    2194:	1a000016 	bne	21f4 <bigfile+0x130>
    total += cc;
    2198:	e2866f4b 	add	r6, r6, #300	; 0x12c
  for(i = 0; ; i++){
    219c:	e2844001 	add	r4, r4, #1
    cc = read(fd, buf, 300);
    21a0:	e3a02f4b 	mov	r2, #300	; 0x12c
    21a4:	e1a01008 	mov	r1, r8
    21a8:	e1a00007 	mov	r0, r7
    21ac:	eb000517 	bl	3610 <read>
    if(cc < 0){
    21b0:	e3500000 	cmp	r0, #0
    21b4:	ba000018 	blt	221c <bigfile+0x158>
    if(cc == 0)
    21b8:	1affffee 	bne	2178 <bigfile+0xb4>
  close(fd);
    21bc:	e1a00007 	mov	r0, r7
    21c0:	eb00052c 	bl	3678 <close>
  if(total != 20*600){
    21c4:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    21c8:	e1560003 	cmp	r6, r3
    21cc:	1a000026 	bne	226c <bigfile+0x1a8>
  unlink("bigfile");
    21d0:	e3040be8 	movw	r0, #19432	; 0x4be8
    21d4:	e3400000 	movt	r0, #0
    21d8:	eb000567 	bl	377c <unlink>
  printf(1, "bigfile test ok\n");
    21dc:	e3041c9c 	movw	r1, #19612	; 0x4c9c
    21e0:	e3a00001 	mov	r0, #1
    21e4:	e3401000 	movt	r1, #0
}
    21e8:	e24bd01c 	sub	sp, fp, #28
    21ec:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test ok\n");
    21f0:	ea00062b 	b	3aa4 <printf>
      printf(1, "read bigfile wrong data\n");
    21f4:	e3041c64 	movw	r1, #19556	; 0x4c64
    21f8:	e3a00001 	mov	r0, #1
    21fc:	e3401000 	movt	r1, #0
    2200:	eb000627 	bl	3aa4 <printf>
      exit();
    2204:	eb0004cd 	bl	3540 <exit>
      printf(1, "short read bigfile\n");
    2208:	e3041c50 	movw	r1, #19536	; 0x4c50
    220c:	e3a00001 	mov	r0, #1
    2210:	e3401000 	movt	r1, #0
    2214:	eb000622 	bl	3aa4 <printf>
      exit();
    2218:	eb0004c8 	bl	3540 <exit>
      printf(1, "read bigfile failed\n");
    221c:	e3041c38 	movw	r1, #19512	; 0x4c38
    2220:	e3a00001 	mov	r0, #1
    2224:	e3401000 	movt	r1, #0
    2228:	eb00061d 	bl	3aa4 <printf>
      exit();
    222c:	eb0004c3 	bl	3540 <exit>
      printf(1, "write bigfile failed\n");
    2230:	e3041c08 	movw	r1, #19464	; 0x4c08
    2234:	e3a00001 	mov	r0, #1
    2238:	e3401000 	movt	r1, #0
    223c:	eb000618 	bl	3aa4 <printf>
      exit();
    2240:	eb0004be 	bl	3540 <exit>
    printf(1, "cannot open bigfile\n");
    2244:	e3041c20 	movw	r1, #19488	; 0x4c20
    2248:	e3a00001 	mov	r0, #1
    224c:	e3401000 	movt	r1, #0
    2250:	eb000613 	bl	3aa4 <printf>
    exit();
    2254:	eb0004b9 	bl	3540 <exit>
    printf(1, "cannot create bigfile");
    2258:	e3041bf0 	movw	r1, #19440	; 0x4bf0
    225c:	e3a00001 	mov	r0, #1
    2260:	e3401000 	movt	r1, #0
    2264:	eb00060e 	bl	3aa4 <printf>
    exit();
    2268:	eb0004b4 	bl	3540 <exit>
    printf(1, "read bigfile wrong total\n");
    226c:	e3041c80 	movw	r1, #19584	; 0x4c80
    2270:	e3a00001 	mov	r0, #1
    2274:	e3401000 	movt	r1, #0
    2278:	eb000609 	bl	3aa4 <printf>
    exit();
    227c:	eb0004af 	bl	3540 <exit>

00002280 <fourteen>:
{
    2280:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fourteen test\n");
    2284:	e3a00001 	mov	r0, #1
{
    2288:	e28db00c 	add	fp, sp, #12
  printf(1, "fourteen test\n");
    228c:	e3041cb0 	movw	r1, #19632	; 0x4cb0
    2290:	e3401000 	movt	r1, #0
    2294:	eb000602 	bl	3aa4 <printf>
  if(mkdir("12345678901234") != 0){
    2298:	e3040e6c 	movw	r0, #20076	; 0x4e6c
    229c:	e3400000 	movt	r0, #0
    22a0:	eb00055c 	bl	3818 <mkdir>
    22a4:	e3500000 	cmp	r0, #0
    22a8:	1a000022 	bne	2338 <fourteen+0xb8>
  if(mkdir("12345678901234/123456789012345") != 0){
    22ac:	e3040ce0 	movw	r0, #19680	; 0x4ce0
    22b0:	e3400000 	movt	r0, #0
    22b4:	eb000557 	bl	3818 <mkdir>
    22b8:	e2504000 	subs	r4, r0, #0
    22bc:	1a000036 	bne	239c <fourteen+0x11c>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    22c0:	e3040d30 	movw	r0, #19760	; 0x4d30
    22c4:	e3a01c02 	mov	r1, #512	; 0x200
    22c8:	e3400000 	movt	r0, #0
    22cc:	eb000510 	bl	3714 <open>
  if(fd < 0){
    22d0:	e3500000 	cmp	r0, #0
    22d4:	ba00002b 	blt	2388 <fourteen+0x108>
  close(fd);
    22d8:	eb0004e6 	bl	3678 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    22dc:	e1a01004 	mov	r1, r4
    22e0:	e3040da0 	movw	r0, #19872	; 0x4da0
    22e4:	e3400000 	movt	r0, #0
    22e8:	eb000509 	bl	3714 <open>
  if(fd < 0){
    22ec:	e3500000 	cmp	r0, #0
    22f0:	ba00001f 	blt	2374 <fourteen+0xf4>
  close(fd);
    22f4:	eb0004df 	bl	3678 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    22f8:	e3040e0c 	movw	r0, #19980	; 0x4e0c
    22fc:	e3400000 	movt	r0, #0
    2300:	eb000544 	bl	3818 <mkdir>
    2304:	e3500000 	cmp	r0, #0
    2308:	0a000014 	beq	2360 <fourteen+0xe0>
  if(mkdir("123456789012345/12345678901234") == 0){
    230c:	e3040e5c 	movw	r0, #20060	; 0x4e5c
    2310:	e3400000 	movt	r0, #0
    2314:	eb00053f 	bl	3818 <mkdir>
    2318:	e3500000 	cmp	r0, #0
    231c:	0a00000a 	beq	234c <fourteen+0xcc>
  printf(1, "fourteen ok\n");
    2320:	e3041eb0 	movw	r1, #20144	; 0x4eb0
    2324:	e3a00001 	mov	r0, #1
    2328:	e3401000 	movt	r1, #0
}
    232c:	e24bd00c 	sub	sp, fp, #12
    2330:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fourteen ok\n");
    2334:	ea0005da 	b	3aa4 <printf>
    printf(1, "mkdir 12345678901234 failed\n");
    2338:	e3041cc0 	movw	r1, #19648	; 0x4cc0
    233c:	e3a00001 	mov	r0, #1
    2340:	e3401000 	movt	r1, #0
    2344:	eb0005d6 	bl	3aa4 <printf>
    exit();
    2348:	eb00047c 	bl	3540 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    234c:	e3041e7c 	movw	r1, #20092	; 0x4e7c
    2350:	e3a00001 	mov	r0, #1
    2354:	e3401000 	movt	r1, #0
    2358:	eb0005d1 	bl	3aa4 <printf>
    exit();
    235c:	eb000477 	bl	3540 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2360:	e3041e2c 	movw	r1, #20012	; 0x4e2c
    2364:	e3a00001 	mov	r0, #1
    2368:	e3401000 	movt	r1, #0
    236c:	eb0005cc 	bl	3aa4 <printf>
    exit();
    2370:	eb000472 	bl	3540 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2374:	e3041dd0 	movw	r1, #19920	; 0x4dd0
    2378:	e3a00001 	mov	r0, #1
    237c:	e3401000 	movt	r1, #0
    2380:	eb0005c7 	bl	3aa4 <printf>
    exit();
    2384:	eb00046d 	bl	3540 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2388:	e3041d60 	movw	r1, #19808	; 0x4d60
    238c:	e3a00001 	mov	r0, #1
    2390:	e3401000 	movt	r1, #0
    2394:	eb0005c2 	bl	3aa4 <printf>
    exit();
    2398:	eb000468 	bl	3540 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    239c:	e3041d00 	movw	r1, #19712	; 0x4d00
    23a0:	e3a00001 	mov	r0, #1
    23a4:	e3401000 	movt	r1, #0
    23a8:	eb0005bd 	bl	3aa4 <printf>
    exit();
    23ac:	eb000463 	bl	3540 <exit>

000023b0 <rmdot>:
{
    23b0:	e92d4800 	push	{fp, lr}
  printf(1, "rmdot test\n");
    23b4:	e3a00001 	mov	r0, #1
{
    23b8:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    23bc:	e3041ec0 	movw	r1, #20160	; 0x4ec0
    23c0:	e3401000 	movt	r1, #0
    23c4:	eb0005b6 	bl	3aa4 <printf>
  if(mkdir("dots") != 0){
    23c8:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    23cc:	e3400000 	movt	r0, #0
    23d0:	eb000510 	bl	3818 <mkdir>
    23d4:	e3500000 	cmp	r0, #0
    23d8:	1a000028 	bne	2480 <rmdot+0xd0>
  if(chdir("dots") != 0){
    23dc:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    23e0:	e3400000 	movt	r0, #0
    23e4:	eb000518 	bl	384c <chdir>
    23e8:	e3500000 	cmp	r0, #0
    23ec:	1a000046 	bne	250c <rmdot+0x15c>
  if(unlink(".") == 0){
    23f0:	e304058c 	movw	r0, #17804	; 0x458c
    23f4:	e3400000 	movt	r0, #0
    23f8:	eb0004df 	bl	377c <unlink>
    23fc:	e3500000 	cmp	r0, #0
    2400:	0a00003c 	beq	24f8 <rmdot+0x148>
  if(unlink("..") == 0){
    2404:	e30400d0 	movw	r0, #16592	; 0x40d0
    2408:	e3400000 	movt	r0, #0
    240c:	eb0004da 	bl	377c <unlink>
    2410:	e3500000 	cmp	r0, #0
    2414:	0a000032 	beq	24e4 <rmdot+0x134>
  if(chdir("/") != 0){
    2418:	e3040f1c 	movw	r0, #20252	; 0x4f1c
    241c:	e3400000 	movt	r0, #0
    2420:	eb000509 	bl	384c <chdir>
    2424:	e3500000 	cmp	r0, #0
    2428:	1a000028 	bne	24d0 <rmdot+0x120>
  if(unlink("dots/.") == 0){
    242c:	e3040f30 	movw	r0, #20272	; 0x4f30
    2430:	e3400000 	movt	r0, #0
    2434:	eb0004d0 	bl	377c <unlink>
    2438:	e3500000 	cmp	r0, #0
    243c:	0a00001e 	beq	24bc <rmdot+0x10c>
  if(unlink("dots/..") == 0){
    2440:	e3040f50 	movw	r0, #20304	; 0x4f50
    2444:	e3400000 	movt	r0, #0
    2448:	eb0004cb 	bl	377c <unlink>
    244c:	e3500000 	cmp	r0, #0
    2450:	0a000014 	beq	24a8 <rmdot+0xf8>
  if(unlink("dots") != 0){
    2454:	e3040ecc 	movw	r0, #20172	; 0x4ecc
    2458:	e3400000 	movt	r0, #0
    245c:	eb0004c6 	bl	377c <unlink>
    2460:	e3500000 	cmp	r0, #0
    2464:	1a00000a 	bne	2494 <rmdot+0xe4>
  printf(1, "rmdot ok\n");
    2468:	e3041f88 	movw	r1, #20360	; 0x4f88
    246c:	e3a00001 	mov	r0, #1
    2470:	e3401000 	movt	r1, #0
}
    2474:	e24bd004 	sub	sp, fp, #4
    2478:	e8bd4800 	pop	{fp, lr}
  printf(1, "rmdot ok\n");
    247c:	ea000588 	b	3aa4 <printf>
    printf(1, "mkdir dots failed\n");
    2480:	e3041ed4 	movw	r1, #20180	; 0x4ed4
    2484:	e3a00001 	mov	r0, #1
    2488:	e3401000 	movt	r1, #0
    248c:	eb000584 	bl	3aa4 <printf>
    exit();
    2490:	eb00042a 	bl	3540 <exit>
    printf(1, "unlink dots failed!\n");
    2494:	e3041f70 	movw	r1, #20336	; 0x4f70
    2498:	e3a00001 	mov	r0, #1
    249c:	e3401000 	movt	r1, #0
    24a0:	eb00057f 	bl	3aa4 <printf>
    exit();
    24a4:	eb000425 	bl	3540 <exit>
    printf(1, "unlink dots/.. worked!\n");
    24a8:	e3041f58 	movw	r1, #20312	; 0x4f58
    24ac:	e3a00001 	mov	r0, #1
    24b0:	e3401000 	movt	r1, #0
    24b4:	eb00057a 	bl	3aa4 <printf>
    exit();
    24b8:	eb000420 	bl	3540 <exit>
    printf(1, "unlink dots/. worked!\n");
    24bc:	e3041f38 	movw	r1, #20280	; 0x4f38
    24c0:	e3a00001 	mov	r0, #1
    24c4:	e3401000 	movt	r1, #0
    24c8:	eb000575 	bl	3aa4 <printf>
    exit();
    24cc:	eb00041b 	bl	3540 <exit>
    printf(1, "chdir / failed\n");
    24d0:	e3041f20 	movw	r1, #20256	; 0x4f20
    24d4:	e3a00001 	mov	r0, #1
    24d8:	e3401000 	movt	r1, #0
    24dc:	eb000570 	bl	3aa4 <printf>
    exit();
    24e0:	eb000416 	bl	3540 <exit>
    printf(1, "rm .. worked!\n");
    24e4:	e3041f0c 	movw	r1, #20236	; 0x4f0c
    24e8:	e3a00001 	mov	r0, #1
    24ec:	e3401000 	movt	r1, #0
    24f0:	eb00056b 	bl	3aa4 <printf>
    exit();
    24f4:	eb000411 	bl	3540 <exit>
    printf(1, "rm . worked!\n");
    24f8:	e3041efc 	movw	r1, #20220	; 0x4efc
    24fc:	e3a00001 	mov	r0, #1
    2500:	e3401000 	movt	r1, #0
    2504:	eb000566 	bl	3aa4 <printf>
    exit();
    2508:	eb00040c 	bl	3540 <exit>
    printf(1, "chdir dots failed\n");
    250c:	e3041ee8 	movw	r1, #20200	; 0x4ee8
    2510:	e3a00001 	mov	r0, #1
    2514:	e3401000 	movt	r1, #0
    2518:	eb000561 	bl	3aa4 <printf>
    exit();
    251c:	eb000407 	bl	3540 <exit>

00002520 <dirfile>:
{
    2520:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "dir vs file\n");
    2524:	e3a00001 	mov	r0, #1
{
    2528:	e28db00c 	add	fp, sp, #12
  printf(1, "dir vs file\n");
    252c:	e3041f94 	movw	r1, #20372	; 0x4f94
    2530:	e3401000 	movt	r1, #0
    2534:	eb00055a 	bl	3aa4 <printf>
  fd = open("dirfile", O_CREATE);
    2538:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    253c:	e3a01c02 	mov	r1, #512	; 0x200
    2540:	e3400000 	movt	r0, #0
    2544:	eb000472 	bl	3714 <open>
  if(fd < 0){
    2548:	e3500000 	cmp	r0, #0
    254c:	ba00004a 	blt	267c <dirfile+0x15c>
  close(fd);
    2550:	eb000448 	bl	3678 <close>
  if(chdir("dirfile") == 0){
    2554:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    2558:	e3400000 	movt	r0, #0
    255c:	eb0004ba 	bl	384c <chdir>
    2560:	e3500000 	cmp	r0, #0
    2564:	0a00003f 	beq	2668 <dirfile+0x148>
  fd = open("dirfile/xx", 0);
    2568:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    256c:	e3a01000 	mov	r1, #0
    2570:	e3400000 	movt	r0, #0
    2574:	eb000466 	bl	3714 <open>
  if(fd >= 0){
    2578:	e3500000 	cmp	r0, #0
    257c:	aa000034 	bge	2654 <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    2580:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    2584:	e3a01c02 	mov	r1, #512	; 0x200
    2588:	e3400000 	movt	r0, #0
    258c:	eb000460 	bl	3714 <open>
  if(fd >= 0){
    2590:	e3500000 	cmp	r0, #0
    2594:	aa00002e 	bge	2654 <dirfile+0x134>
  if(mkdir("dirfile/xx") == 0){
    2598:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    259c:	e3400000 	movt	r0, #0
    25a0:	eb00049c 	bl	3818 <mkdir>
    25a4:	e3500000 	cmp	r0, #0
    25a8:	0a000051 	beq	26f4 <dirfile+0x1d4>
  if(unlink("dirfile/xx") == 0){
    25ac:	e3040fe0 	movw	r0, #20448	; 0x4fe0
    25b0:	e3400000 	movt	r0, #0
    25b4:	eb000470 	bl	377c <unlink>
    25b8:	e3500000 	cmp	r0, #0
    25bc:	0a000047 	beq	26e0 <dirfile+0x1c0>
  if(link("README", "dirfile/xx") == 0){
    25c0:	e3041fe0 	movw	r1, #20448	; 0x4fe0
    25c4:	e305004c 	movw	r0, #20556	; 0x504c
    25c8:	e3401000 	movt	r1, #0
    25cc:	e3400000 	movt	r0, #0
    25d0:	eb000483 	bl	37e4 <link>
    25d4:	e3500000 	cmp	r0, #0
    25d8:	0a00003b 	beq	26cc <dirfile+0x1ac>
  if(unlink("dirfile") != 0){
    25dc:	e3040fa4 	movw	r0, #20388	; 0x4fa4
    25e0:	e3400000 	movt	r0, #0
    25e4:	eb000464 	bl	377c <unlink>
    25e8:	e2504000 	subs	r4, r0, #0
    25ec:	1a000031 	bne	26b8 <dirfile+0x198>
  fd = open(".", O_RDWR);
    25f0:	e304058c 	movw	r0, #17804	; 0x458c
    25f4:	e3a01002 	mov	r1, #2
    25f8:	e3400000 	movt	r0, #0
    25fc:	eb000444 	bl	3714 <open>
  if(fd >= 0){
    2600:	e3500000 	cmp	r0, #0
    2604:	aa000026 	bge	26a4 <dirfile+0x184>
  fd = open(".", 0);
    2608:	e1a01004 	mov	r1, r4
    260c:	e304058c 	movw	r0, #17804	; 0x458c
    2610:	e3400000 	movt	r0, #0
    2614:	eb00043e 	bl	3714 <open>
  if(write(fd, "x", 1) > 0){
    2618:	e3041aec 	movw	r1, #19180	; 0x4aec
    261c:	e3a02001 	mov	r2, #1
    2620:	e3401000 	movt	r1, #0
  fd = open(".", 0);
    2624:	e1a04000 	mov	r4, r0
  if(write(fd, "x", 1) > 0){
    2628:	eb000405 	bl	3644 <write>
    262c:	e3500000 	cmp	r0, #0
    2630:	ca000016 	bgt	2690 <dirfile+0x170>
  close(fd);
    2634:	e1a00004 	mov	r0, r4
    2638:	eb00040e 	bl	3678 <close>
  printf(1, "dir vs file OK\n");
    263c:	e30510c0 	movw	r1, #20672	; 0x50c0
    2640:	e3a00001 	mov	r0, #1
    2644:	e3401000 	movt	r1, #0
}
    2648:	e24bd00c 	sub	sp, fp, #12
    264c:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "dir vs file OK\n");
    2650:	ea000513 	b	3aa4 <printf>
    printf(1, "create dirfile/xx succeeded!\n");
    2654:	e3041fec 	movw	r1, #20460	; 0x4fec
    2658:	e3a00001 	mov	r0, #1
    265c:	e3401000 	movt	r1, #0
    2660:	eb00050f 	bl	3aa4 <printf>
    exit();
    2664:	eb0003b5 	bl	3540 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2668:	e3041fc4 	movw	r1, #20420	; 0x4fc4
    266c:	e3a00001 	mov	r0, #1
    2670:	e3401000 	movt	r1, #0
    2674:	eb00050a 	bl	3aa4 <printf>
    exit();
    2678:	eb0003b0 	bl	3540 <exit>
    printf(1, "create dirfile failed\n");
    267c:	e3041fac 	movw	r1, #20396	; 0x4fac
    2680:	e3a00001 	mov	r0, #1
    2684:	e3401000 	movt	r1, #0
    2688:	eb000505 	bl	3aa4 <printf>
    exit();
    268c:	eb0003ab 	bl	3540 <exit>
    printf(1, "write . succeeded!\n");
    2690:	e30510ac 	movw	r1, #20652	; 0x50ac
    2694:	e3a00001 	mov	r0, #1
    2698:	e3401000 	movt	r1, #0
    269c:	eb000500 	bl	3aa4 <printf>
    exit();
    26a0:	eb0003a6 	bl	3540 <exit>
    printf(1, "open . for writing succeeded!\n");
    26a4:	e305108c 	movw	r1, #20620	; 0x508c
    26a8:	e3a00001 	mov	r0, #1
    26ac:	e3401000 	movt	r1, #0
    26b0:	eb0004fb 	bl	3aa4 <printf>
    exit();
    26b4:	eb0003a1 	bl	3540 <exit>
    printf(1, "unlink dirfile failed!\n");
    26b8:	e3051074 	movw	r1, #20596	; 0x5074
    26bc:	e3a00001 	mov	r0, #1
    26c0:	e3401000 	movt	r1, #0
    26c4:	eb0004f6 	bl	3aa4 <printf>
    exit();
    26c8:	eb00039c 	bl	3540 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    26cc:	e3051054 	movw	r1, #20564	; 0x5054
    26d0:	e3a00001 	mov	r0, #1
    26d4:	e3401000 	movt	r1, #0
    26d8:	eb0004f1 	bl	3aa4 <printf>
    exit();
    26dc:	eb000397 	bl	3540 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    26e0:	e305102c 	movw	r1, #20524	; 0x502c
    26e4:	e3a00001 	mov	r0, #1
    26e8:	e3401000 	movt	r1, #0
    26ec:	eb0004ec 	bl	3aa4 <printf>
    exit();
    26f0:	eb000392 	bl	3540 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    26f4:	e305100c 	movw	r1, #20492	; 0x500c
    26f8:	e3a00001 	mov	r0, #1
    26fc:	e3401000 	movt	r1, #0
    2700:	eb0004e7 	bl	3aa4 <printf>
    exit();
    2704:	eb00038d 	bl	3540 <exit>

00002708 <iref>:
{
    2708:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name\n");
    270c:	e30510d0 	movw	r1, #20688	; 0x50d0
{
    2710:	e28db014 	add	fp, sp, #20
  printf(1, "empty file name\n");
    2714:	e3a00001 	mov	r0, #1
    2718:	e3401000 	movt	r1, #0
    if(mkdir("irefd") != 0){
    271c:	e30560e4 	movw	r6, #20708	; 0x50e4
  printf(1, "empty file name\n");
    2720:	eb0004df 	bl	3aa4 <printf>
    mkdir("");
    2724:	e3044eac 	movw	r4, #20140	; 0x4eac
    link("README", "");
    2728:	e305704c 	movw	r7, #20556	; 0x504c
    if(mkdir("irefd") != 0){
    272c:	e3406000 	movt	r6, #0
    mkdir("");
    2730:	e3404000 	movt	r4, #0
    link("README", "");
    2734:	e3407000 	movt	r7, #0
  printf(1, "empty file name\n");
    2738:	e3a05033 	mov	r5, #51	; 0x33
    if(mkdir("irefd") != 0){
    273c:	e1a00006 	mov	r0, r6
    2740:	eb000434 	bl	3818 <mkdir>
    2744:	e3500000 	cmp	r0, #0
    2748:	1a000023 	bne	27dc <iref+0xd4>
    if(chdir("irefd") != 0){
    274c:	e1a00006 	mov	r0, r6
    2750:	eb00043d 	bl	384c <chdir>
    2754:	e3500000 	cmp	r0, #0
    2758:	1a000024 	bne	27f0 <iref+0xe8>
    mkdir("");
    275c:	e1a00004 	mov	r0, r4
    2760:	eb00042c 	bl	3818 <mkdir>
    link("README", "");
    2764:	e1a01004 	mov	r1, r4
    2768:	e1a00007 	mov	r0, r7
    276c:	eb00041c 	bl	37e4 <link>
    fd = open("", O_CREATE);
    2770:	e3a01c02 	mov	r1, #512	; 0x200
    2774:	e1a00004 	mov	r0, r4
    2778:	eb0003e5 	bl	3714 <open>
    if(fd >= 0)
    277c:	e3500000 	cmp	r0, #0
    2780:	ba000000 	blt	2788 <iref+0x80>
      close(fd);
    2784:	eb0003bb 	bl	3678 <close>
    fd = open("xx", O_CREATE);
    2788:	e3040fe8 	movw	r0, #20456	; 0x4fe8
    278c:	e3a01c02 	mov	r1, #512	; 0x200
    2790:	e3400000 	movt	r0, #0
    2794:	eb0003de 	bl	3714 <open>
    if(fd >= 0)
    2798:	e3500000 	cmp	r0, #0
    279c:	ba000000 	blt	27a4 <iref+0x9c>
      close(fd);
    27a0:	eb0003b4 	bl	3678 <close>
    unlink("xx");
    27a4:	e3040fe8 	movw	r0, #20456	; 0x4fe8
    27a8:	e3400000 	movt	r0, #0
    27ac:	eb0003f2 	bl	377c <unlink>
  for(i = 0; i < 50 + 1; i++){
    27b0:	e2555001 	subs	r5, r5, #1
    27b4:	1affffe0 	bne	273c <iref+0x34>
  chdir("/");
    27b8:	e3040f1c 	movw	r0, #20252	; 0x4f1c
    27bc:	e3400000 	movt	r0, #0
    27c0:	eb000421 	bl	384c <chdir>
  printf(1, "empty file name OK\n");
    27c4:	e3051114 	movw	r1, #20756	; 0x5114
    27c8:	e3a00001 	mov	r0, #1
    27cc:	e3401000 	movt	r1, #0
}
    27d0:	e24bd014 	sub	sp, fp, #20
    27d4:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name OK\n");
    27d8:	ea0004b1 	b	3aa4 <printf>
      printf(1, "mkdir irefd failed\n");
    27dc:	e30510ec 	movw	r1, #20716	; 0x50ec
    27e0:	e3a00001 	mov	r0, #1
    27e4:	e3401000 	movt	r1, #0
    27e8:	eb0004ad 	bl	3aa4 <printf>
      exit();
    27ec:	eb000353 	bl	3540 <exit>
      printf(1, "chdir irefd failed\n");
    27f0:	e3051100 	movw	r1, #20736	; 0x5100
    27f4:	e3a00001 	mov	r0, #1
    27f8:	e3401000 	movt	r1, #0
    27fc:	eb0004a8 	bl	3aa4 <printf>
      exit();
    2800:	eb00034e 	bl	3540 <exit>

00002804 <forktest>:
{
    2804:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fork test\n");
    2808:	e3051128 	movw	r1, #20776	; 0x5128
{
    280c:	e28db00c 	add	fp, sp, #12
  printf(1, "fork test\n");
    2810:	e3a00001 	mov	r0, #1
    2814:	e3401000 	movt	r1, #0
  for(n=0; n<1000; n++){
    2818:	e3a04000 	mov	r4, #0
  printf(1, "fork test\n");
    281c:	eb0004a0 	bl	3aa4 <printf>
  for(n=0; n<1000; n++){
    2820:	ea000003 	b	2834 <forktest+0x30>
    if(pid == 0)
    2824:	0a000019 	beq	2890 <forktest+0x8c>
  for(n=0; n<1000; n++){
    2828:	e2844001 	add	r4, r4, #1
    282c:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    2830:	0a00001c 	beq	28a8 <forktest+0xa4>
    pid = fork();
    2834:	eb000334 	bl	350c <fork>
    if(pid < 0)
    2838:	e3500000 	cmp	r0, #0
    283c:	aafffff8 	bge	2824 <forktest+0x20>
  for(; n > 0; n--){
    2840:	e3540000 	cmp	r4, #0
    2844:	0a000004 	beq	285c <forktest+0x58>
    if(wait() < 0){
    2848:	eb000349 	bl	3574 <wait>
    284c:	e3500000 	cmp	r0, #0
    2850:	ba00000a 	blt	2880 <forktest+0x7c>
  for(; n > 0; n--){
    2854:	e2544001 	subs	r4, r4, #1
    2858:	1afffffa 	bne	2848 <forktest+0x44>
  if(wait() != -1){
    285c:	eb000344 	bl	3574 <wait>
    2860:	e3700001 	cmn	r0, #1
    2864:	1a00000a 	bne	2894 <forktest+0x90>
  printf(1, "fork test OK\n");
    2868:	e305115c 	movw	r1, #20828	; 0x515c
    286c:	e3a00001 	mov	r0, #1
    2870:	e3401000 	movt	r1, #0
}
    2874:	e24bd00c 	sub	sp, fp, #12
    2878:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fork test OK\n");
    287c:	ea000488 	b	3aa4 <printf>
      printf(1, "wait stopped early\n");
    2880:	e3051134 	movw	r1, #20788	; 0x5134
    2884:	e3a00001 	mov	r0, #1
    2888:	e3401000 	movt	r1, #0
    288c:	eb000484 	bl	3aa4 <printf>
      exit();
    2890:	eb00032a 	bl	3540 <exit>
    printf(1, "wait got too many\n");
    2894:	e3051148 	movw	r1, #20808	; 0x5148
    2898:	e3a00001 	mov	r0, #1
    289c:	e3401000 	movt	r1, #0
    28a0:	eb00047f 	bl	3aa4 <printf>
    exit();
    28a4:	eb000325 	bl	3540 <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    28a8:	e305116c 	movw	r1, #20844	; 0x516c
    28ac:	e3a00001 	mov	r0, #1
    28b0:	e3401000 	movt	r1, #0
    28b4:	eb00047a 	bl	3aa4 <printf>
    exit();
    28b8:	eb000320 	bl	3540 <exit>

000028bc <sbrktest>:
{
    28bc:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "sbrk test\n");
    28c0:	e3057814 	movw	r7, #22548	; 0x5814
    28c4:	e3407000 	movt	r7, #0
{
    28c8:	e28db01c 	add	fp, sp, #28
  for(i = 0; i < 5000; i++){ 
    28cc:	e3a05000 	mov	r5, #0
{
    28d0:	e24dd028 	sub	sp, sp, #40	; 0x28
  printf(stdout, "sbrk test\n");
    28d4:	e3051190 	movw	r1, #20880	; 0x5190
    28d8:	e3401000 	movt	r1, #0
    28dc:	e5970000 	ldr	r0, [r7]
    28e0:	eb00046f 	bl	3aa4 <printf>
  oldbrk = sbrk(0);
    28e4:	e1a00005 	mov	r0, r5
    28e8:	eb0003fe 	bl	38e8 <sbrk>
  printf(stdout, "test #1 sbrk() less than a page?\n");
    28ec:	e305119c 	movw	r1, #20892	; 0x519c
    28f0:	e3401000 	movt	r1, #0
    b = sbrk(1);
    28f4:	e3a09001 	mov	r9, #1
  for(i = 0; i < 5000; i++){ 
    28f8:	e3016388 	movw	r6, #5000	; 0x1388
  oldbrk = sbrk(0);
    28fc:	e1a08000 	mov	r8, r0
  printf(stdout, "test #1 sbrk() less than a page?\n");
    2900:	e5970000 	ldr	r0, [r7]
    2904:	eb000466 	bl	3aa4 <printf>
  a = sbrk(0);
    2908:	e1a00005 	mov	r0, r5
    290c:	eb0003f5 	bl	38e8 <sbrk>
    2910:	e1a04000 	mov	r4, r0
  for(i = 0; i < 5000; i++){ 
    2914:	ea000000 	b	291c <sbrktest+0x60>
    a = b + 1;
    2918:	e1a04001 	mov	r4, r1
    b = sbrk(1);
    291c:	e3a00001 	mov	r0, #1
    2920:	eb0003f0 	bl	38e8 <sbrk>
    if(b != a){
    2924:	e1500004 	cmp	r0, r4
    2928:	1a000134 	bne	2e00 <sbrktest+0x544>
  for(i = 0; i < 5000; i++){ 
    292c:	e2855001 	add	r5, r5, #1
    *b = 1;
    2930:	e1a01004 	mov	r1, r4
  for(i = 0; i < 5000; i++){ 
    2934:	e1550006 	cmp	r5, r6
    *b = 1;
    2938:	e4c19001 	strb	r9, [r1], #1
  for(i = 0; i < 5000; i++){ 
    293c:	1afffff5 	bne	2918 <sbrktest+0x5c>
  printf(stdout, "test #1 done.\n");
    2940:	e5970000 	ldr	r0, [r7]
    2944:	e30511dc 	movw	r1, #20956	; 0x51dc
    2948:	e3401000 	movt	r1, #0
    294c:	eb000454 	bl	3aa4 <printf>
  printf(stdout, "test #2 test fork?\n");
    2950:	e5970000 	ldr	r0, [r7]
    2954:	e30511ec 	movw	r1, #20972	; 0x51ec
    2958:	e3401000 	movt	r1, #0
    295c:	eb000450 	bl	3aa4 <printf>
  pid = fork();
    2960:	eb0002e9 	bl	350c <fork>
  if(pid < 0){
    2964:	e2505000 	subs	r5, r0, #0
    2968:	ba00011f 	blt	2dec <sbrktest+0x530>
  printf(stdout, "test #2 done.\n");
    296c:	e5970000 	ldr	r0, [r7]
    2970:	e3051218 	movw	r1, #21016	; 0x5218
    2974:	e3401000 	movt	r1, #0
  if(c != a + 1){
    2978:	e2844002 	add	r4, r4, #2
  printf(stdout, "test #2 done.\n");
    297c:	eb000448 	bl	3aa4 <printf>
  printf(stdout, "test #3 post-fork.\n");
    2980:	e5970000 	ldr	r0, [r7]
    2984:	e3051228 	movw	r1, #21032	; 0x5228
    2988:	e3401000 	movt	r1, #0
    298c:	eb000444 	bl	3aa4 <printf>
  c = sbrk(1);
    2990:	e3a00001 	mov	r0, #1
    2994:	eb0003d3 	bl	38e8 <sbrk>
  c = sbrk(1);
    2998:	e3a00001 	mov	r0, #1
    299c:	eb0003d1 	bl	38e8 <sbrk>
  if(c != a + 1){
    29a0:	e1540000 	cmp	r4, r0
    29a4:	1a00010b 	bne	2dd8 <sbrktest+0x51c>
  if(pid == 0)
    29a8:	e3550000 	cmp	r5, #0
    29ac:	0a000108 	beq	2dd4 <sbrktest+0x518>
  wait();
    29b0:	eb0002ef 	bl	3574 <wait>
  printf(stdout, "test #3 done.\n");
    29b4:	e5970000 	ldr	r0, [r7]
    29b8:	e3051258 	movw	r1, #21080	; 0x5258
    29bc:	e3401000 	movt	r1, #0
    29c0:	eb000437 	bl	3aa4 <printf>
  printf(stdout, "test #4 grow address space to something big.\n");
    29c4:	e5970000 	ldr	r0, [r7]
    29c8:	e3051268 	movw	r1, #21096	; 0x5268
    29cc:	e3401000 	movt	r1, #0
    29d0:	eb000433 	bl	3aa4 <printf>
  a = sbrk(0);
    29d4:	e3a00000 	mov	r0, #0
    29d8:	eb0003c2 	bl	38e8 <sbrk>
    29dc:	e1a04000 	mov	r4, r0
  p = sbrk(amt);
    29e0:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    29e4:	eb0003bf 	bl	38e8 <sbrk>
  if (p != a) { 
    29e8:	e1540000 	cmp	r4, r0
    29ec:	1a0000f4 	bne	2dc4 <sbrktest+0x508>
  *lastaddr = 99;
    29f0:	e30f3fff 	movw	r3, #65535	; 0xffff
    29f4:	e340363f 	movt	r3, #1599	; 0x63f
    29f8:	e3a02063 	mov	r2, #99	; 0x63
  printf(stdout, "test #4 done.\n");
    29fc:	e30512d8 	movw	r1, #21208	; 0x52d8
  *lastaddr = 99;
    2a00:	e5c32000 	strb	r2, [r3]
  printf(stdout, "test #4 done.\n");
    2a04:	e3401000 	movt	r1, #0
    2a08:	e5970000 	ldr	r0, [r7]
    2a0c:	eb000424 	bl	3aa4 <printf>
  printf(stdout, "test #5 de-allocate\n");
    2a10:	e5970000 	ldr	r0, [r7]
    2a14:	e30512e8 	movw	r1, #21224	; 0x52e8
    2a18:	e3401000 	movt	r1, #0
    2a1c:	eb000420 	bl	3aa4 <printf>
  a = sbrk(0);
    2a20:	e3a00000 	mov	r0, #0
    2a24:	eb0003af 	bl	38e8 <sbrk>
    2a28:	e1a04000 	mov	r4, r0
  c = sbrk(-4096);
    2a2c:	e3a00a0f 	mov	r0, #61440	; 0xf000
    2a30:	e34f0fff 	movt	r0, #65535	; 0xffff
    2a34:	eb0003ab 	bl	38e8 <sbrk>
  if(c == (char*)0xffffffff){
    2a38:	e3700001 	cmn	r0, #1
    2a3c:	0a0000db 	beq	2db0 <sbrktest+0x4f4>
  c = sbrk(0);
    2a40:	e3a00000 	mov	r0, #0
    2a44:	eb0003a7 	bl	38e8 <sbrk>
  if(c != a - 4096){
    2a48:	e2442a01 	sub	r2, r4, #4096	; 0x1000
    2a4c:	e1500002 	cmp	r0, r2
  c = sbrk(0);
    2a50:	e1a03000 	mov	r3, r0
  if(c != a - 4096){
    2a54:	1a0000cf 	bne	2d98 <sbrktest+0x4dc>
  printf(stdout, "test #5 done.\n");
    2a58:	e5970000 	ldr	r0, [r7]
    2a5c:	e3051354 	movw	r1, #21332	; 0x5354
    2a60:	e3401000 	movt	r1, #0
    2a64:	eb00040e 	bl	3aa4 <printf>
  printf(stdout, "test #6 re-allocate page.\n");
    2a68:	e5970000 	ldr	r0, [r7]
    2a6c:	e3051364 	movw	r1, #21348	; 0x5364
    2a70:	e3401000 	movt	r1, #0
    2a74:	eb00040a 	bl	3aa4 <printf>
  a = sbrk(0);
    2a78:	e3a00000 	mov	r0, #0
    2a7c:	eb000399 	bl	38e8 <sbrk>
    2a80:	e1a04000 	mov	r4, r0
  c = sbrk(4096);
    2a84:	e3a00a01 	mov	r0, #4096	; 0x1000
    2a88:	eb000396 	bl	38e8 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2a8c:	e1540000 	cmp	r4, r0
  c = sbrk(4096);
    2a90:	e1a05000 	mov	r5, r0
  if(c != a || sbrk(0) != a + 4096){
    2a94:	1a0000b8 	bne	2d7c <sbrktest+0x4c0>
    2a98:	e3a00000 	mov	r0, #0
    2a9c:	eb000391 	bl	38e8 <sbrk>
    2aa0:	e2843a01 	add	r3, r4, #4096	; 0x1000
    2aa4:	e1530000 	cmp	r3, r0
    2aa8:	1a0000b3 	bne	2d7c <sbrktest+0x4c0>
  if(*lastaddr == 99){
    2aac:	e30f3fff 	movw	r3, #65535	; 0xffff
    2ab0:	e340363f 	movt	r3, #1599	; 0x63f
    2ab4:	e5970000 	ldr	r0, [r7]
    2ab8:	e5d33000 	ldrb	r3, [r3]
    2abc:	e3530063 	cmp	r3, #99	; 0x63
    2ac0:	0a0000a9 	beq	2d6c <sbrktest+0x4b0>
  printf(stdout, "test #6 done.\n");
    2ac4:	e30513d8 	movw	r1, #21464	; 0x53d8
    2ac8:	e3401000 	movt	r1, #0
    2acc:	eb0003f4 	bl	3aa4 <printf>
  printf(stdout, "test #7 downsize.\n");
    2ad0:	e5970000 	ldr	r0, [r7]
    2ad4:	e30513e8 	movw	r1, #21480	; 0x53e8
    2ad8:	e3401000 	movt	r1, #0
    2adc:	eb0003f0 	bl	3aa4 <printf>
  a = sbrk(0);
    2ae0:	e3a00000 	mov	r0, #0
    2ae4:	eb00037f 	bl	38e8 <sbrk>
    2ae8:	e1a04000 	mov	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2aec:	e3a00000 	mov	r0, #0
    2af0:	eb00037c 	bl	38e8 <sbrk>
    2af4:	e0480000 	sub	r0, r8, r0
    2af8:	eb00037a 	bl	38e8 <sbrk>
  if(c != a){
    2afc:	e1540000 	cmp	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2b00:	e1a03000 	mov	r3, r0
  if(c != a){
    2b04:	1a000092 	bne	2d54 <sbrktest+0x498>
  printf(stdout, "test #7 done.\n");
    2b08:	e5970000 	ldr	r0, [r7]
    2b0c:	e3051420 	movw	r1, #21536	; 0x5420
    2b10:	e3401000 	movt	r1, #0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b14:	e3085480 	movw	r5, #33920	; 0x8480
  printf(stdout, "test #7 done.\n");
    2b18:	eb0003e1 	bl	3aa4 <printf>
  printf(stdout, "test #8 read the kernel's memory.\n");
    2b1c:	e3051430 	movw	r1, #21552	; 0x5430
    2b20:	e5970000 	ldr	r0, [r7]
    2b24:	e3401000 	movt	r1, #0
    2b28:	eb0003dd 	bl	3aa4 <printf>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b2c:	e348501e 	movt	r5, #32798	; 0x801e
    2b30:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
    2b34:	e30c9350 	movw	r9, #50000	; 0xc350
    ppid = getpid();
    2b38:	eb00035d 	bl	38b4 <getpid>
    2b3c:	e1a06000 	mov	r6, r0
    pid = fork();
    2b40:	eb000271 	bl	350c <fork>
    if(pid < 0){
    2b44:	e3500000 	cmp	r0, #0
    2b48:	ba00007c 	blt	2d40 <sbrktest+0x484>
    if(pid == 0){
    2b4c:	0a000072 	beq	2d1c <sbrktest+0x460>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b50:	e0844009 	add	r4, r4, r9
    wait();
    2b54:	eb000286 	bl	3574 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b58:	e1540005 	cmp	r4, r5
    2b5c:	1afffff5 	bne	2b38 <sbrktest+0x27c>
  printf(stdout, "test #8 done.\n");
    2b60:	e5970000 	ldr	r0, [r7]
    2b64:	e3051470 	movw	r1, #21616	; 0x5470
    2b68:	e3401000 	movt	r1, #0
    2b6c:	eb0003cc 	bl	3aa4 <printf>
  printf(stdout, "test #9 clean up the last failed allocation\n");
    2b70:	e5970000 	ldr	r0, [r7]
    2b74:	e3051480 	movw	r1, #21632	; 0x5480
    2b78:	e3401000 	movt	r1, #0
    2b7c:	eb0003c8 	bl	3aa4 <printf>
  if(pipe(fds) != 0){
    2b80:	e24b0038 	sub	r0, fp, #56	; 0x38
    2b84:	eb000294 	bl	35dc <pipe>
    2b88:	e2506000 	subs	r6, r0, #0
    2b8c:	1a00005d 	bne	2d08 <sbrktest+0x44c>
  printf(stdout, "test #9 done.\n");
    2b90:	e5970000 	ldr	r0, [r7]
    2b94:	e30514b0 	movw	r1, #21680	; 0x54b0
    2b98:	e3401000 	movt	r1, #0
    2b9c:	e24b4030 	sub	r4, fp, #48	; 0x30
    2ba0:	eb0003bf 	bl	3aa4 <printf>
  printf(stdout, "test #10 memory utilization 1.\n");
    2ba4:	e30514c0 	movw	r1, #21696	; 0x54c0
    2ba8:	e5970000 	ldr	r0, [r7]
    2bac:	e3401000 	movt	r1, #0
    2bb0:	eb0003bb 	bl	3aa4 <printf>
    2bb4:	e1a09004 	mov	r9, r4
    if((pids[i] = fork()) == 0){
    2bb8:	eb000253 	bl	350c <fork>
    2bbc:	e3500000 	cmp	r0, #0
    2bc0:	e1a05000 	mov	r5, r0
    2bc4:	e4890004 	str	r0, [r9], #4
    2bc8:	0a000038 	beq	2cb0 <sbrktest+0x3f4>
    if(pids[i] != -1)
    2bcc:	e3700001 	cmn	r0, #1
    2bd0:	0a000003 	beq	2be4 <sbrktest+0x328>
      read(fds[0], &scratch, 1);
    2bd4:	e3a02001 	mov	r2, #1
    2bd8:	e24b1039 	sub	r1, fp, #57	; 0x39
    2bdc:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    2be0:	eb00028a 	bl	3610 <read>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2be4:	e2866001 	add	r6, r6, #1
    2be8:	e3560005 	cmp	r6, #5
    2bec:	1afffff1 	bne	2bb8 <sbrktest+0x2fc>
  printf(stdout, "test #10 done.\n");
    2bf0:	e5970000 	ldr	r0, [r7]
    2bf4:	e30514f0 	movw	r1, #21744	; 0x54f0
    2bf8:	e3401000 	movt	r1, #0
    2bfc:	e2846014 	add	r6, r4, #20
    2c00:	eb0003a7 	bl	3aa4 <printf>
  printf(stdout, "test #11 memory utilization 2.\n");
    2c04:	e5970000 	ldr	r0, [r7]
    2c08:	e3051500 	movw	r1, #21760	; 0x5500
    2c0c:	e3401000 	movt	r1, #0
    2c10:	eb0003a3 	bl	3aa4 <printf>
  c = sbrk(4096);
    2c14:	e3a00a01 	mov	r0, #4096	; 0x1000
    2c18:	eb000332 	bl	38e8 <sbrk>
    2c1c:	e1a05000 	mov	r5, r0
    if(pids[i] == -1)
    2c20:	e4940004 	ldr	r0, [r4], #4
    2c24:	e3700001 	cmn	r0, #1
    2c28:	0a000001 	beq	2c34 <sbrktest+0x378>
    kill(pids[i]);
    2c2c:	eb00029e 	bl	36ac <kill>
    wait();
    2c30:	eb00024f 	bl	3574 <wait>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2c34:	e1540006 	cmp	r4, r6
    2c38:	1afffff8 	bne	2c20 <sbrktest+0x364>
  printf(stdout, "test #11 done.\n");
    2c3c:	e5970000 	ldr	r0, [r7]
    2c40:	e3051520 	movw	r1, #21792	; 0x5520
    2c44:	e3401000 	movt	r1, #0
    2c48:	eb000395 	bl	3aa4 <printf>
  printf(stdout, "test #12 leaked memory.\n");
    2c4c:	e3051530 	movw	r1, #21808	; 0x5530
    2c50:	e5970000 	ldr	r0, [r7]
    2c54:	e3401000 	movt	r1, #0
    2c58:	eb000391 	bl	3aa4 <printf>
  if(c == (char*)0xffffffff){
    2c5c:	e3750001 	cmn	r5, #1
    2c60:	0a000023 	beq	2cf4 <sbrktest+0x438>
  printf(stdout, "test #12 done.\n");
    2c64:	e5970000 	ldr	r0, [r7]
    2c68:	e3051568 	movw	r1, #21864	; 0x5568
    2c6c:	e3401000 	movt	r1, #0
    2c70:	eb00038b 	bl	3aa4 <printf>
  if(sbrk(0) > oldbrk)
    2c74:	e3a00000 	mov	r0, #0
    2c78:	eb00031a 	bl	38e8 <sbrk>
    2c7c:	e1580000 	cmp	r8, r0
    2c80:	3a000005 	bcc	2c9c <sbrktest+0x3e0>
  printf(stdout, "sbrk test OK\n");
    2c84:	e5970000 	ldr	r0, [r7]
    2c88:	e3051578 	movw	r1, #21880	; 0x5578
    2c8c:	e3401000 	movt	r1, #0
    2c90:	eb000383 	bl	3aa4 <printf>
}
    2c94:	e24bd01c 	sub	sp, fp, #28
    2c98:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    sbrk(-(sbrk(0) - oldbrk));
    2c9c:	e3a00000 	mov	r0, #0
    2ca0:	eb000310 	bl	38e8 <sbrk>
    2ca4:	e0480000 	sub	r0, r8, r0
    2ca8:	eb00030e 	bl	38e8 <sbrk>
    2cac:	eafffff4 	b	2c84 <sbrktest+0x3c8>
      printf(stdout, "create pid:%d.\n",i);
    2cb0:	e1a02006 	mov	r2, r6
    2cb4:	e5970000 	ldr	r0, [r7]
    2cb8:	e30514e0 	movw	r1, #21728	; 0x54e0
    2cbc:	e3401000 	movt	r1, #0
    2cc0:	eb000377 	bl	3aa4 <printf>
      sbrk(BIG - (uint)sbrk(0));
    2cc4:	e1a00005 	mov	r0, r5
    2cc8:	eb000306 	bl	38e8 <sbrk>
    2ccc:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2cd0:	eb000304 	bl	38e8 <sbrk>
      write(fds[1], "x", 1);
    2cd4:	e3041aec 	movw	r1, #19180	; 0x4aec
    2cd8:	e3a02001 	mov	r2, #1
    2cdc:	e3401000 	movt	r1, #0
    2ce0:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    2ce4:	eb000256 	bl	3644 <write>
      for(;;) sleep(1000);
    2ce8:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    2cec:	eb00030a 	bl	391c <sleep>
    2cf0:	eafffffc 	b	2ce8 <sbrktest+0x42c>
    printf(stdout, "failed sbrk leaked memory\n");
    2cf4:	e5970000 	ldr	r0, [r7]
    2cf8:	e305154c 	movw	r1, #21836	; 0x554c
    2cfc:	e3401000 	movt	r1, #0
    2d00:	eb000367 	bl	3aa4 <printf>
    exit();
    2d04:	eb00020d 	bl	3540 <exit>
    printf(1, "pipe() failed\n");
    2d08:	e304111c 	movw	r1, #16668	; 0x411c
    2d0c:	e3a00001 	mov	r0, #1
    2d10:	e3401000 	movt	r1, #0
    2d14:	eb000362 	bl	3aa4 <printf>
    exit();
    2d18:	eb000208 	bl	3540 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2d1c:	e5970000 	ldr	r0, [r7]
    2d20:	e1a02004 	mov	r2, r4
    2d24:	e5d43000 	ldrb	r3, [r4]
    2d28:	e3051454 	movw	r1, #21588	; 0x5454
    2d2c:	e3401000 	movt	r1, #0
    2d30:	eb00035b 	bl	3aa4 <printf>
      kill(ppid);
    2d34:	e1a00006 	mov	r0, r6
    2d38:	eb00025b 	bl	36ac <kill>
      exit();
    2d3c:	eb0001ff 	bl	3540 <exit>
      printf(stdout, "fork failed\n");
    2d40:	e5970000 	ldr	r0, [r7]
    2d44:	e3051718 	movw	r1, #22296	; 0x5718
    2d48:	e3401000 	movt	r1, #0
    2d4c:	eb000354 	bl	3aa4 <printf>
      exit();
    2d50:	eb0001fa 	bl	3540 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2d54:	e1a02004 	mov	r2, r4
    2d58:	e5970000 	ldr	r0, [r7]
    2d5c:	e30513fc 	movw	r1, #21500	; 0x53fc
    2d60:	e3401000 	movt	r1, #0
    2d64:	eb00034e 	bl	3aa4 <printf>
    exit();
    2d68:	eb0001f4 	bl	3540 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2d6c:	e30513a8 	movw	r1, #21416	; 0x53a8
    2d70:	e3401000 	movt	r1, #0
    2d74:	eb00034a 	bl	3aa4 <printf>
    exit();
    2d78:	eb0001f0 	bl	3540 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2d7c:	e1a03005 	mov	r3, r5
    2d80:	e1a02004 	mov	r2, r4
    2d84:	e5970000 	ldr	r0, [r7]
    2d88:	e3051380 	movw	r1, #21376	; 0x5380
    2d8c:	e3401000 	movt	r1, #0
    2d90:	eb000343 	bl	3aa4 <printf>
    exit();
    2d94:	eb0001e9 	bl	3540 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2d98:	e1a02004 	mov	r2, r4
    2d9c:	e5970000 	ldr	r0, [r7]
    2da0:	e305131c 	movw	r1, #21276	; 0x531c
    2da4:	e3401000 	movt	r1, #0
    2da8:	eb00033d 	bl	3aa4 <printf>
    exit();
    2dac:	eb0001e3 	bl	3540 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2db0:	e5970000 	ldr	r0, [r7]
    2db4:	e3051300 	movw	r1, #21248	; 0x5300
    2db8:	e3401000 	movt	r1, #0
    2dbc:	eb000338 	bl	3aa4 <printf>
    exit();
    2dc0:	eb0001de 	bl	3540 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2dc4:	e3051298 	movw	r1, #21144	; 0x5298
    2dc8:	e5970000 	ldr	r0, [r7]
    2dcc:	e3401000 	movt	r1, #0
    2dd0:	eb000333 	bl	3aa4 <printf>
    exit();
    2dd4:	eb0001d9 	bl	3540 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2dd8:	e5970000 	ldr	r0, [r7]
    2ddc:	e305123c 	movw	r1, #21052	; 0x523c
    2de0:	e3401000 	movt	r1, #0
    2de4:	eb00032e 	bl	3aa4 <printf>
    exit();
    2de8:	eb0001d4 	bl	3540 <exit>
    printf(stdout, "sbrk test fork failed\n");
    2dec:	e5970000 	ldr	r0, [r7]
    2df0:	e3051200 	movw	r1, #20992	; 0x5200
    2df4:	e3401000 	movt	r1, #0
    2df8:	eb000329 	bl	3aa4 <printf>
    exit();
    2dfc:	eb0001cf 	bl	3540 <exit>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2e00:	e58d0000 	str	r0, [sp]
    2e04:	e1a03004 	mov	r3, r4
    2e08:	e1a02005 	mov	r2, r5
    2e0c:	e5970000 	ldr	r0, [r7]
    2e10:	e30511c0 	movw	r1, #20928	; 0x51c0
    2e14:	e3401000 	movt	r1, #0
    2e18:	eb000321 	bl	3aa4 <printf>
      exit();
    2e1c:	eb0001c7 	bl	3540 <exit>

00002e20 <validateint>:
{
    2e20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2e24:	e28db000 	add	fp, sp, #0
    sleep(*p);
    2e28:	e5900000 	ldr	r0, [r0]
}
    2e2c:	e28bd000 	add	sp, fp, #0
    2e30:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    sleep(*p);
    2e34:	ea0002b8 	b	391c <sleep>

00002e38 <validatetest>:
{
    2e38:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate test\n");
    2e3c:	e3057814 	movw	r7, #22548	; 0x5814
    2e40:	e3407000 	movt	r7, #0
{
    2e44:	e28db014 	add	fp, sp, #20
  printf(stdout, "validate test\n");
    2e48:	e3051588 	movw	r1, #21896	; 0x5588
    2e4c:	e3401000 	movt	r1, #0
    2e50:	e5970000 	ldr	r0, [r7]
    if(link("nosuchfile", (char*)p) != -1){
    2e54:	e3056598 	movw	r6, #21912	; 0x5598
  printf(stdout, "validate test\n");
    2e58:	eb000311 	bl	3aa4 <printf>
    if(link("nosuchfile", (char*)p) != -1){
    2e5c:	e3406000 	movt	r6, #0
  for(p = 0; p <= (uint)hi; p += 4096){
    2e60:	e3a04000 	mov	r4, #0
    if((pid = fork()) == 0){
    2e64:	eb0001a8 	bl	350c <fork>
    2e68:	e2505000 	subs	r5, r0, #0
    2e6c:	0a000014 	beq	2ec4 <validatetest+0x8c>
    sleep(0);
    2e70:	e3a00000 	mov	r0, #0
    2e74:	eb0002a8 	bl	391c <sleep>
    sleep(0);
    2e78:	e3a00000 	mov	r0, #0
    2e7c:	eb0002a6 	bl	391c <sleep>
    kill(pid);
    2e80:	e1a00005 	mov	r0, r5
    2e84:	eb000208 	bl	36ac <kill>
    wait();
    2e88:	eb0001b9 	bl	3574 <wait>
    if(link("nosuchfile", (char*)p) != -1){
    2e8c:	e1a01004 	mov	r1, r4
    2e90:	e1a00006 	mov	r0, r6
    2e94:	eb000252 	bl	37e4 <link>
    2e98:	e3700001 	cmn	r0, #1
    2e9c:	1a00000b 	bne	2ed0 <validatetest+0x98>
  for(p = 0; p <= (uint)hi; p += 4096){
    2ea0:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2ea4:	e3540945 	cmp	r4, #1130496	; 0x114000
    2ea8:	1affffed 	bne	2e64 <validatetest+0x2c>
  printf(stdout, "validate ok\n");
    2eac:	e5970000 	ldr	r0, [r7]
    2eb0:	e30515c0 	movw	r1, #21952	; 0x55c0
    2eb4:	e3401000 	movt	r1, #0
}
    2eb8:	e24bd014 	sub	sp, fp, #20
    2ebc:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate ok\n");
    2ec0:	ea0002f7 	b	3aa4 <printf>
    sleep(*p);
    2ec4:	e5940000 	ldr	r0, [r4]
    2ec8:	eb000293 	bl	391c <sleep>
      exit();
    2ecc:	eb00019b 	bl	3540 <exit>
      printf(stdout, "link should not succeed\n");
    2ed0:	e5970000 	ldr	r0, [r7]
    2ed4:	e30515a4 	movw	r1, #21924	; 0x55a4
    2ed8:	e3401000 	movt	r1, #0
    2edc:	eb0002f0 	bl	3aa4 <printf>
      exit();
    2ee0:	eb000196 	bl	3540 <exit>

00002ee4 <bsstest>:
{
    2ee4:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "bss test\n");
    2ee8:	e3054814 	movw	r4, #22548	; 0x5814
    2eec:	e3404000 	movt	r4, #0
{
    2ef0:	e28db00c 	add	fp, sp, #12
  printf(stdout, "bss test\n");
    2ef4:	e30515d0 	movw	r1, #21968	; 0x55d0
    2ef8:	e3401000 	movt	r1, #0
    2efc:	e5940000 	ldr	r0, [r4]
    2f00:	eb0002e7 	bl	3aa4 <printf>
    if(uninit[i] != '\0'){
    2f04:	e30538bc 	movw	r3, #22716	; 0x58bc
    2f08:	e3403000 	movt	r3, #0
    2f0c:	e5d32000 	ldrb	r2, [r3]
    2f10:	e3520000 	cmp	r2, #0
    2f14:	1a00000b 	bne	2f48 <bsstest+0x64>
    2f18:	e59f103c 	ldr	r1, [pc, #60]	; 2f5c <bsstest+0x78>
    2f1c:	e5f32001 	ldrb	r2, [r3, #1]!
    2f20:	e3520000 	cmp	r2, #0
    2f24:	1a000007 	bne	2f48 <bsstest+0x64>
  for(i = 0; i < sizeof(uninit); i++){
    2f28:	e1530001 	cmp	r3, r1
    2f2c:	1afffffa 	bne	2f1c <bsstest+0x38>
  printf(stdout, "bss test ok\n");
    2f30:	e5940000 	ldr	r0, [r4]
    2f34:	e30515f0 	movw	r1, #22000	; 0x55f0
    2f38:	e3401000 	movt	r1, #0
}
    2f3c:	e24bd00c 	sub	sp, fp, #12
    2f40:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "bss test ok\n");
    2f44:	ea0002d6 	b	3aa4 <printf>
      printf(stdout, "bss test failed\n");
    2f48:	e5940000 	ldr	r0, [r4]
    2f4c:	e30515dc 	movw	r1, #21980	; 0x55dc
    2f50:	e3401000 	movt	r1, #0
    2f54:	eb0002d2 	bl	3aa4 <printf>
      exit();
    2f58:	eb000178 	bl	3540 <exit>
    2f5c:	00007fcb 	.word	0x00007fcb

00002f60 <bigargtest>:
{
    2f60:	e92d4830 	push	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2f64:	e3050600 	movw	r0, #22016	; 0x5600
{
    2f68:	e28db00c 	add	fp, sp, #12
  unlink("bigarg-ok");
    2f6c:	e3400000 	movt	r0, #0
    2f70:	eb000201 	bl	377c <unlink>
  pid = fork();
    2f74:	eb000164 	bl	350c <fork>
  if(pid == 0){
    2f78:	e3500000 	cmp	r0, #0
    2f7c:	0a00000d 	beq	2fb8 <bigargtest+0x58>
  } else if(pid < 0){
    2f80:	ba000032 	blt	3050 <bigargtest+0xf0>
  wait();
    2f84:	eb00017a 	bl	3574 <wait>
  fd = open("bigarg-ok", 0);
    2f88:	e3050600 	movw	r0, #22016	; 0x5600
    2f8c:	e3a01000 	mov	r1, #0
    2f90:	e3400000 	movt	r0, #0
    2f94:	eb0001de 	bl	3714 <open>
  if(fd < 0){
    2f98:	e3500000 	cmp	r0, #0
    2f9c:	ba000024 	blt	3034 <bigargtest+0xd4>
  close(fd);
    2fa0:	eb0001b4 	bl	3678 <close>
  unlink("bigarg-ok");
    2fa4:	e3050600 	movw	r0, #22016	; 0x5600
    2fa8:	e3400000 	movt	r0, #0
}
    2fac:	e24bd00c 	sub	sp, fp, #12
    2fb0:	e8bd4830 	pop	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2fb4:	ea0001f0 	b	377c <unlink>
    2fb8:	e59f30ac 	ldr	r3, [pc, #172]	; 306c <bigargtest+0x10c>
    2fbc:	e305260c 	movw	r2, #22028	; 0x560c
    2fc0:	e3402000 	movt	r2, #0
    2fc4:	e283107c 	add	r1, r3, #124	; 0x7c
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    2fc8:	e5a32004 	str	r2, [r3, #4]!
    for(i = 0; i < MAXARG-1; i++)
    2fcc:	e1530001 	cmp	r3, r1
    2fd0:	1afffffc 	bne	2fc8 <bigargtest+0x68>
    printf(stdout, "bigarg test\n");
    2fd4:	e3054814 	movw	r4, #22548	; 0x5814
    2fd8:	e3404000 	movt	r4, #0
    args[MAXARG-1] = 0;
    2fdc:	e3055830 	movw	r5, #22576	; 0x5830
    2fe0:	e3405000 	movt	r5, #0
    printf(stdout, "bigarg test\n");
    2fe4:	e5940000 	ldr	r0, [r4]
    2fe8:	e30516ec 	movw	r1, #22252	; 0x56ec
    2fec:	e3401000 	movt	r1, #0
    args[MAXARG-1] = 0;
    2ff0:	e3a03000 	mov	r3, #0
    2ff4:	e585307c 	str	r3, [r5, #124]	; 0x7c
    printf(stdout, "bigarg test\n");
    2ff8:	eb0002a9 	bl	3aa4 <printf>
    exec("echo", args);
    2ffc:	e1a01005 	mov	r1, r5
    3000:	e3030dc4 	movw	r0, #15812	; 0x3dc4
    3004:	e3400000 	movt	r0, #0
    3008:	eb0001b4 	bl	36e0 <exec>
    printf(stdout, "bigarg test ok\n");
    300c:	e5940000 	ldr	r0, [r4]
    3010:	e30516fc 	movw	r1, #22268	; 0x56fc
    3014:	e3401000 	movt	r1, #0
    3018:	eb0002a1 	bl	3aa4 <printf>
    fd = open("bigarg-ok", O_CREATE);
    301c:	e3a01c02 	mov	r1, #512	; 0x200
    3020:	e3050600 	movw	r0, #22016	; 0x5600
    3024:	e3400000 	movt	r0, #0
    3028:	eb0001b9 	bl	3714 <open>
    close(fd);
    302c:	eb000191 	bl	3678 <close>
    exit();
    3030:	eb000142 	bl	3540 <exit>
    printf(stdout, "bigarg test failed!\n");
    3034:	e3053814 	movw	r3, #22548	; 0x5814
    3038:	e3403000 	movt	r3, #0
    303c:	e3051728 	movw	r1, #22312	; 0x5728
    3040:	e3401000 	movt	r1, #0
    3044:	e5930000 	ldr	r0, [r3]
    3048:	eb000295 	bl	3aa4 <printf>
    exit();
    304c:	eb00013b 	bl	3540 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3050:	e3053814 	movw	r3, #22548	; 0x5814
    3054:	e3403000 	movt	r3, #0
    3058:	e305170c 	movw	r1, #22284	; 0x570c
    305c:	e3401000 	movt	r1, #0
    3060:	e5930000 	ldr	r0, [r3]
    3064:	eb00028e 	bl	3aa4 <printf>
    exit();
    3068:	eb000134 	bl	3540 <exit>
    306c:	0000582c 	.word	0x0000582c

00003070 <fsfull>:
{
    3070:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "fsfull test\n");
    3074:	e3051740 	movw	r1, #22336	; 0x5740
{
    3078:	e28db020 	add	fp, sp, #32
  printf(1, "fsfull test\n");
    307c:	e3a00001 	mov	r0, #1
{
    3080:	e24dd044 	sub	sp, sp, #68	; 0x44
  printf(1, "fsfull test\n");
    3084:	e3401000 	movt	r1, #0
    name[1] = '0' + nfiles / 1000;
    3088:	e304add3 	movw	sl, #19923	; 0x4dd3
  printf(1, "fsfull test\n");
    308c:	eb000284 	bl	3aa4 <printf>
    name[2] = '0' + (nfiles % 1000) / 100;
    3090:	e308951f 	movw	r9, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    3094:	e30c8ccd 	movw	r8, #52429	; 0xcccd
    name[1] = '0' + nfiles / 1000;
    3098:	e341a062 	movt	sl, #4194	; 0x1062
    name[2] = '0' + (nfiles % 1000) / 100;
    309c:	e34591eb 	movt	r9, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    30a0:	e34c8ccc 	movt	r8, #52428	; 0xcccc
  for(nfiles = 0; ; nfiles++){
    30a4:	e3a04000 	mov	r4, #0
    name[1] = '0' + nfiles / 1000;
    30a8:	e085349a 	umull	r3, r5, sl, r4
    name[3] = '0' + (nfiles % 100) / 10;
    30ac:	e3a00064 	mov	r0, #100	; 0x64
    30b0:	e0832499 	umull	r2, r3, r9, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    30b4:	e3a0cffa 	mov	ip, #1000	; 0x3e8
    name[4] = '0' + (nfiles % 10);
    30b8:	e08e2498 	umull	r2, lr, r8, r4
    name[1] = '0' + nfiles / 1000;
    30bc:	e1a05325 	lsr	r5, r5, #6
    name[4] = '0' + (nfiles % 10);
    30c0:	e3a0600a 	mov	r6, #10
    printf(1, "writing %s\n", name);
    30c4:	e24b2064 	sub	r2, fp, #100	; 0x64
    name[3] = '0' + (nfiles % 100) / 10;
    30c8:	e1a032a3 	lsr	r3, r3, #5
    printf(1, "writing %s\n", name);
    30cc:	e3051750 	movw	r1, #22352	; 0x5750
    name[2] = '0' + (nfiles % 1000) / 100;
    30d0:	e06c459c 	mls	ip, ip, r5, r4
    name[1] = '0' + nfiles / 1000;
    30d4:	e2855030 	add	r5, r5, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    30d8:	e0634390 	mls	r3, r0, r3, r4
    name[1] = '0' + nfiles / 1000;
    30dc:	e54b5063 	strb	r5, [fp, #-99]	; 0xffffff9d
    name[4] = '0' + (nfiles % 10);
    30e0:	e1a0e1ae 	lsr	lr, lr, #3
    printf(1, "writing %s\n", name);
    30e4:	e3401000 	movt	r1, #0
    30e8:	e3a00001 	mov	r0, #1
    name[2] = '0' + (nfiles % 1000) / 100;
    30ec:	e08c5c99 	umull	r5, ip, r9, ip
    name[3] = '0' + (nfiles % 100) / 10;
    30f0:	e0835398 	umull	r5, r3, r8, r3
    name[5] = '\0';
    30f4:	e3a05000 	mov	r5, #0
    name[4] = '0' + (nfiles % 10);
    30f8:	e06e4e96 	mls	lr, r6, lr, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    30fc:	e1a0c2ac 	lsr	ip, ip, #5
    3100:	e28cc030 	add	ip, ip, #48	; 0x30
    name[5] = '\0';
    3104:	e54b505f 	strb	r5, [fp, #-95]	; 0xffffffa1
    name[2] = '0' + (nfiles % 1000) / 100;
    3108:	e54bc062 	strb	ip, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    310c:	e1a031a3 	lsr	r3, r3, #3
    name[4] = '0' + (nfiles % 10);
    3110:	e28ee030 	add	lr, lr, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    3114:	e2833030 	add	r3, r3, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    3118:	e54be060 	strb	lr, [fp, #-96]	; 0xffffffa0
    name[3] = '0' + (nfiles % 100) / 10;
    311c:	e54b3061 	strb	r3, [fp, #-97]	; 0xffffff9f
    name[0] = 'f';
    3120:	e3a0e066 	mov	lr, #102	; 0x66
    3124:	e54be064 	strb	lr, [fp, #-100]	; 0xffffff9c
    printf(1, "writing %s\n", name);
    3128:	eb00025d 	bl	3aa4 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    312c:	e3001202 	movw	r1, #514	; 0x202
    3130:	e24b0064 	sub	r0, fp, #100	; 0x64
    3134:	eb000176 	bl	3714 <open>
    if(fd < 0){
    3138:	e2507000 	subs	r7, r0, #0
    313c:	ba000014 	blt	3194 <fsfull+0x124>
      int cc = write(fd, buf, 512);
    3140:	e3076fcc 	movw	r6, #32716	; 0x7fcc
    3144:	e3406000 	movt	r6, #0
    3148:	ea000000 	b	3150 <fsfull+0xe0>
      total += cc;
    314c:	e0855000 	add	r5, r5, r0
      int cc = write(fd, buf, 512);
    3150:	e3a02c02 	mov	r2, #512	; 0x200
    3154:	e1a01006 	mov	r1, r6
    3158:	e1a00007 	mov	r0, r7
    315c:	eb000138 	bl	3644 <write>
      if(cc < 512)
    3160:	e3500c02 	cmp	r0, #512	; 0x200
    3164:	aafffff8 	bge	314c <fsfull+0xdc>
    printf(1, "wrote %d bytes\n", total);
    3168:	e1a02005 	mov	r2, r5
    316c:	e3a00001 	mov	r0, #1
    3170:	e305176c 	movw	r1, #22380	; 0x576c
    3174:	e3401000 	movt	r1, #0
    3178:	eb000249 	bl	3aa4 <printf>
    close(fd);
    317c:	e1a00007 	mov	r0, r7
    3180:	eb00013c 	bl	3678 <close>
    if(total == 0)
    3184:	e3550000 	cmp	r5, #0
    3188:	0a000006 	beq	31a8 <fsfull+0x138>
  for(nfiles = 0; ; nfiles++){
    318c:	e2844001 	add	r4, r4, #1
    3190:	eaffffc4 	b	30a8 <fsfull+0x38>
      printf(1, "open %s failed\n", name);
    3194:	e305175c 	movw	r1, #22364	; 0x575c
    3198:	e24b2064 	sub	r2, fp, #100	; 0x64
    319c:	e3401000 	movt	r1, #0
    31a0:	e3a00001 	mov	r0, #1
    31a4:	eb00023e 	bl	3aa4 <printf>
    name[1] = '0' + nfiles / 1000;
    31a8:	e3047dd3 	movw	r7, #19923	; 0x4dd3
    name[2] = '0' + (nfiles % 1000) / 100;
    31ac:	e308951f 	movw	r9, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    31b0:	e30c6ccd 	movw	r6, #52429	; 0xcccd
    name[4] = '0' + (nfiles % 10);
    31b4:	e3065667 	movw	r5, #26215	; 0x6667
    name[1] = '0' + nfiles / 1000;
    31b8:	e3417062 	movt	r7, #4194	; 0x1062
    name[2] = '0' + (nfiles % 1000) / 100;
    31bc:	e34591eb 	movt	r9, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    31c0:	e34c6ccc 	movt	r6, #52428	; 0xcccc
    name[4] = '0' + (nfiles % 10);
    31c4:	e3465666 	movt	r5, #26214	; 0x6666
    name[0] = 'f';
    31c8:	e3a08066 	mov	r8, #102	; 0x66
    name[1] = '0' + nfiles / 1000;
    31cc:	e0c23497 	smull	r3, r2, r7, r4
    31d0:	e1a03fc4 	asr	r3, r4, #31
    name[3] = '0' + (nfiles % 100) / 10;
    31d4:	e0ce1499 	smull	r1, lr, r9, r4
    31d8:	e3a0a064 	mov	sl, #100	; 0x64
    name[2] = '0' + (nfiles % 1000) / 100;
    31dc:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    unlink(name);
    31e0:	e24b0064 	sub	r0, fp, #100	; 0x64
    name[1] = '0' + nfiles / 1000;
    31e4:	e0632342 	rsb	r2, r3, r2, asr #6
    name[0] = 'f';
    31e8:	e54b8064 	strb	r8, [fp, #-100]	; 0xffffff9c
    name[2] = '0' + (nfiles % 1000) / 100;
    31ec:	e0614291 	mls	r1, r1, r2, r4
    name[3] = '0' + (nfiles % 100) / 10;
    31f0:	e063e2ce 	rsb	lr, r3, lr, asr #5
    name[1] = '0' + nfiles / 1000;
    31f4:	e2822030 	add	r2, r2, #48	; 0x30
    31f8:	e54b2063 	strb	r2, [fp, #-99]	; 0xffffff9d
    name[3] = '0' + (nfiles % 100) / 10;
    31fc:	e0624e9a 	mls	r2, sl, lr, r4
    name[5] = '\0';
    3200:	e3a0e000 	mov	lr, #0
    name[4] = '0' + (nfiles % 10);
    3204:	e0cac495 	smull	ip, sl, r5, r4
    name[5] = '\0';
    3208:	e54be05f 	strb	lr, [fp, #-95]	; 0xffffffa1
    name[2] = '0' + (nfiles % 1000) / 100;
    320c:	e081c199 	umull	ip, r1, r9, r1
    name[3] = '0' + (nfiles % 100) / 10;
    3210:	e082c296 	umull	ip, r2, r6, r2
    name[4] = '0' + (nfiles % 10);
    3214:	e063314a 	rsb	r3, r3, sl, asr #2
    3218:	e3a0c00a 	mov	ip, #10
    321c:	e063439c 	mls	r3, ip, r3, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    3220:	e1a012a1 	lsr	r1, r1, #5
    nfiles--;
    3224:	e2444001 	sub	r4, r4, #1
    name[2] = '0' + (nfiles % 1000) / 100;
    3228:	e2811030 	add	r1, r1, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    322c:	e1a021a2 	lsr	r2, r2, #3
    name[2] = '0' + (nfiles % 1000) / 100;
    3230:	e54b1062 	strb	r1, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    3234:	e2822030 	add	r2, r2, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    3238:	e2833030 	add	r3, r3, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    323c:	e54b2061 	strb	r2, [fp, #-97]	; 0xffffff9f
    name[4] = '0' + (nfiles % 10);
    3240:	e54b3060 	strb	r3, [fp, #-96]	; 0xffffffa0
    unlink(name);
    3244:	eb00014c 	bl	377c <unlink>
  while(nfiles >= 0){
    3248:	e3740001 	cmn	r4, #1
    324c:	1affffde 	bne	31cc <fsfull+0x15c>
  printf(1, "fsfull test finished\n");
    3250:	e3a00001 	mov	r0, #1
    3254:	e305177c 	movw	r1, #22396	; 0x577c
    3258:	e3401000 	movt	r1, #0
    325c:	eb000210 	bl	3aa4 <printf>
}
    3260:	e24bd020 	sub	sp, fp, #32
    3264:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00003268 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3268:	e3053814 	movw	r3, #22548	; 0x5814
    326c:	e3403000 	movt	r3, #0
{
    3270:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  randstate = randstate * 1664525 + 1013904223;
    3274:	e306160d 	movw	r1, #26125	; 0x660d
    3278:	e5930018 	ldr	r0, [r3, #24]
    327c:	e3401019 	movt	r1, #25
    3280:	e30f235f 	movw	r2, #62303	; 0xf35f
    3284:	e3432c6e 	movt	r2, #15470	; 0x3c6e
{
    3288:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    328c:	e0202091 	mla	r0, r1, r0, r2
    3290:	e5830018 	str	r0, [r3, #24]
}
    3294:	e28bd000 	add	sp, fp, #0
    3298:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    329c:	e12fff1e 	bx	lr

000032a0 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    32a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32a4:	e2402001 	sub	r2, r0, #1
    32a8:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    32ac:	e4d13001 	ldrb	r3, [r1], #1
    32b0:	e3530000 	cmp	r3, #0
    32b4:	e5e23001 	strb	r3, [r2, #1]!
    32b8:	1afffffb 	bne	32ac <strcpy+0xc>
    ;
  return os;
}
    32bc:	e28bd000 	add	sp, fp, #0
    32c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32c4:	e12fff1e 	bx	lr

000032c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    32c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32cc:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
    32d0:	e5d03000 	ldrb	r3, [r0]
    32d4:	e5d12000 	ldrb	r2, [r1]
    32d8:	e3530000 	cmp	r3, #0
    32dc:	1a000004 	bne	32f4 <strcmp+0x2c>
    32e0:	ea000005 	b	32fc <strcmp+0x34>
    32e4:	e5f03001 	ldrb	r3, [r0, #1]!
    32e8:	e5f12001 	ldrb	r2, [r1, #1]!
    32ec:	e3530000 	cmp	r3, #0
    32f0:	0a000001 	beq	32fc <strcmp+0x34>
    32f4:	e1530002 	cmp	r3, r2
    32f8:	0afffff9 	beq	32e4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    32fc:	e0430002 	sub	r0, r3, r2
    3300:	e28bd000 	add	sp, fp, #0
    3304:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3308:	e12fff1e 	bx	lr

0000330c <strlen>:

uint
strlen(char *s)
{
    330c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3310:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
    3314:	e5d03000 	ldrb	r3, [r0]
    3318:	e3530000 	cmp	r3, #0
    331c:	0a000008 	beq	3344 <strlen+0x38>
    3320:	e2601001 	rsb	r1, r0, #1
    3324:	e1a03000 	mov	r3, r0
    ;
    3328:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
    332c:	e5f32001 	ldrb	r2, [r3, #1]!
    3330:	e3520000 	cmp	r2, #0
    3334:	1afffffb 	bne	3328 <strlen+0x1c>
  return n;
}
    3338:	e28bd000 	add	sp, fp, #0
    333c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3340:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
    3344:	e1a00003 	mov	r0, r3
}
    3348:	e28bd000 	add	sp, fp, #0
    334c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3350:	e12fff1e 	bx	lr

00003354 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3354:	e3520000 	cmp	r2, #0
{
    3358:	e1a03000 	mov	r3, r0
    335c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3360:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
    3364:	0a000004 	beq	337c <memset+0x28>
    3368:	e6ef1071 	uxtb	r1, r1
    336c:	e0800002 	add	r0, r0, r2
    3370:	e4c31001 	strb	r1, [r3], #1
    3374:	e1500003 	cmp	r0, r3
    3378:	1afffffc 	bne	3370 <memset+0x1c>
  return (void *)p;
}
    337c:	e28bd000 	add	sp, fp, #0
    3380:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3384:	e12fff1e 	bx	lr

00003388 <strchr>:

char*
strchr(const char *s, char c)
{
    3388:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    338c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
    3390:	e5d02000 	ldrb	r2, [r0]
    3394:	e3520000 	cmp	r2, #0
    3398:	0a00000b 	beq	33cc <strchr+0x44>
    if(*s == c)
    339c:	e1520001 	cmp	r2, r1
    33a0:	1a000002 	bne	33b0 <strchr+0x28>
    33a4:	ea000005 	b	33c0 <strchr+0x38>
    33a8:	e1530001 	cmp	r3, r1
    33ac:	0a000003 	beq	33c0 <strchr+0x38>
  for(; *s; s++)
    33b0:	e5f03001 	ldrb	r3, [r0, #1]!
    33b4:	e3530000 	cmp	r3, #0
    33b8:	1afffffa 	bne	33a8 <strchr+0x20>
      return (char*)s;
  return 0;
    33bc:	e1a00003 	mov	r0, r3
}
    33c0:	e28bd000 	add	sp, fp, #0
    33c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33c8:	e12fff1e 	bx	lr
  return 0;
    33cc:	e1a00002 	mov	r0, r2
    33d0:	eafffffa 	b	33c0 <strchr+0x38>

000033d4 <gets>:

char*
gets(char *buf, int max)
{
    33d4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    33d8:	e1a03000 	mov	r3, r0
    33dc:	e28db014 	add	fp, sp, #20
    33e0:	e1a07000 	mov	r7, r0
    33e4:	e24dd008 	sub	sp, sp, #8
    33e8:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    33ec:	e3a04000 	mov	r4, #0
    33f0:	ea000008 	b	3418 <gets+0x44>
    cc = read(0, &c, 1);
    33f4:	eb000085 	bl	3610 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
    33f8:	e1a03005 	mov	r3, r5
    if(cc < 1)
    33fc:	e3500000 	cmp	r0, #0
    3400:	da00000b 	ble	3434 <gets+0x60>
    buf[i++] = c;
    3404:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
    3408:	e352000d 	cmp	r2, #13
    340c:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
    3410:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
    3414:	0a00000b 	beq	3448 <gets+0x74>
    cc = read(0, &c, 1);
    3418:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
    341c:	e0844002 	add	r4, r4, r2
    3420:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
    3424:	e24b1015 	sub	r1, fp, #21
    3428:	e3a00000 	mov	r0, #0
    342c:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
    3430:	baffffef 	blt	33f4 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
    3434:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
    3438:	e3a03000 	mov	r3, #0
    343c:	e5c53000 	strb	r3, [r5]
}
    3440:	e24bd014 	sub	sp, fp, #20
    3444:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    3448:	e0875004 	add	r5, r7, r4
    344c:	eafffff8 	b	3434 <gets+0x60>

00003450 <stat>:

int
stat(char *n, struct stat *st)
{
    3450:	e92d4830 	push	{r4, r5, fp, lr}
    3454:	e1a04001 	mov	r4, r1
    3458:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    345c:	e3a01000 	mov	r1, #0
    3460:	eb0000ab 	bl	3714 <open>
  if(fd < 0)
    3464:	e2505000 	subs	r5, r0, #0
    3468:	ba000006 	blt	3488 <stat+0x38>
    return -1;
  r = fstat(fd, st);
    346c:	e1a01004 	mov	r1, r4
    3470:	eb0000ce 	bl	37b0 <fstat>
    3474:	e1a04000 	mov	r4, r0
  close(fd);
    3478:	e1a00005 	mov	r0, r5
    347c:	eb00007d 	bl	3678 <close>
  return r;
}
    3480:	e1a00004 	mov	r0, r4
    3484:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
    3488:	e3e04000 	mvn	r4, #0
    348c:	eafffffb 	b	3480 <stat+0x30>

00003490 <atoi>:

int
atoi(const char *s)
{
    3490:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3494:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3498:	e5d02000 	ldrb	r2, [r0]
    349c:	e2423030 	sub	r3, r2, #48	; 0x30
    34a0:	e3530009 	cmp	r3, #9
  n = 0;
    34a4:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
    34a8:	8a000006 	bhi	34c8 <atoi+0x38>
    n = n*10 + *s++ - '0';
    34ac:	e3a0c00a 	mov	ip, #10
    34b0:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
    34b4:	e5f02001 	ldrb	r2, [r0, #1]!
    34b8:	e2421030 	sub	r1, r2, #48	; 0x30
    34bc:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
    34c0:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
    34c4:	9afffff9 	bls	34b0 <atoi+0x20>
  return n;
}
    34c8:	e1a00003 	mov	r0, r3
    34cc:	e28bd000 	add	sp, fp, #0
    34d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    34d4:	e12fff1e 	bx	lr

000034d8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    34d8:	e3520000 	cmp	r2, #0
{
    34dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34e0:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
    34e4:	da000005 	ble	3500 <memmove+0x28>
    34e8:	e0812002 	add	r2, r1, r2
    34ec:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
    34f0:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
    34f4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
    34f8:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
    34fc:	1afffffb 	bne	34f0 <memmove+0x18>
  return vdst;
}
    3500:	e28bd000 	add	sp, fp, #0
    3504:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3508:	e12fff1e 	bx	lr

0000350c <fork>:
    350c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    351c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3520:	e3a00001 	mov	r0, #1
    3524:	ef000040 	svc	0x00000040
    3528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    352c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    353c:	e12fff1e 	bx	lr

00003540 <exit>:
    3540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    354c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3554:	e3a00002 	mov	r0, #2
    3558:	ef000040 	svc	0x00000040
    355c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    356c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3570:	e12fff1e 	bx	lr

00003574 <wait>:
    3574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    357c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3588:	e3a00003 	mov	r0, #3
    358c:	ef000040 	svc	0x00000040
    3590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    359c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35a4:	e12fff1e 	bx	lr

000035a8 <lseek>:
    35a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35bc:	e3a00016 	mov	r0, #22
    35c0:	ef000040 	svc	0x00000040
    35c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35d8:	e12fff1e 	bx	lr

000035dc <pipe>:
    35dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35f0:	e3a00004 	mov	r0, #4
    35f4:	ef000040 	svc	0x00000040
    35f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    360c:	e12fff1e 	bx	lr

00003610 <read>:
    3610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    361c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3624:	e3a00005 	mov	r0, #5
    3628:	ef000040 	svc	0x00000040
    362c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    363c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3640:	e12fff1e 	bx	lr

00003644 <write>:
    3644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    364c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3658:	e3a00010 	mov	r0, #16
    365c:	ef000040 	svc	0x00000040
    3660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    366c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3674:	e12fff1e 	bx	lr

00003678 <close>:
    3678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    367c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    368c:	e3a00015 	mov	r0, #21
    3690:	ef000040 	svc	0x00000040
    3694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    369c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36a8:	e12fff1e 	bx	lr

000036ac <kill>:
    36ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36c0:	e3a00006 	mov	r0, #6
    36c4:	ef000040 	svc	0x00000040
    36c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36dc:	e12fff1e 	bx	lr

000036e0 <exec>:
    36e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36f4:	e3a00007 	mov	r0, #7
    36f8:	ef000040 	svc	0x00000040
    36fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    370c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3710:	e12fff1e 	bx	lr

00003714 <open>:
    3714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    371c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3728:	e3a0000f 	mov	r0, #15
    372c:	ef000040 	svc	0x00000040
    3730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    373c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3744:	e12fff1e 	bx	lr

00003748 <mknod>:
    3748:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    374c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3750:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3754:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3758:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    375c:	e3a00011 	mov	r0, #17
    3760:	ef000040 	svc	0x00000040
    3764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    376c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3770:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3774:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3778:	e12fff1e 	bx	lr

0000377c <unlink>:
    377c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3780:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3784:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3788:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    378c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3790:	e3a00012 	mov	r0, #18
    3794:	ef000040 	svc	0x00000040
    3798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    379c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37ac:	e12fff1e 	bx	lr

000037b0 <fstat>:
    37b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37c4:	e3a00008 	mov	r0, #8
    37c8:	ef000040 	svc	0x00000040
    37cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37e0:	e12fff1e 	bx	lr

000037e4 <link>:
    37e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37f8:	e3a00013 	mov	r0, #19
    37fc:	ef000040 	svc	0x00000040
    3800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3808:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    380c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3810:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3814:	e12fff1e 	bx	lr

00003818 <mkdir>:
    3818:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    381c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3820:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3824:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3828:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    382c:	e3a00014 	mov	r0, #20
    3830:	ef000040 	svc	0x00000040
    3834:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3838:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    383c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3840:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3844:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3848:	e12fff1e 	bx	lr

0000384c <chdir>:
    384c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3850:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3854:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3858:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    385c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3860:	e3a00009 	mov	r0, #9
    3864:	ef000040 	svc	0x00000040
    3868:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    386c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3870:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3874:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3878:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    387c:	e12fff1e 	bx	lr

00003880 <dup>:
    3880:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3884:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3888:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    388c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3890:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3894:	e3a0000a 	mov	r0, #10
    3898:	ef000040 	svc	0x00000040
    389c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38b0:	e12fff1e 	bx	lr

000038b4 <getpid>:
    38b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38c8:	e3a0000b 	mov	r0, #11
    38cc:	ef000040 	svc	0x00000040
    38d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38e4:	e12fff1e 	bx	lr

000038e8 <sbrk>:
    38e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38fc:	e3a0000c 	mov	r0, #12
    3900:	ef000040 	svc	0x00000040
    3904:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3908:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    390c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3910:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3914:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3918:	e12fff1e 	bx	lr

0000391c <sleep>:
    391c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3920:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3924:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3928:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    392c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3930:	e3a0000d 	mov	r0, #13
    3934:	ef000040 	svc	0x00000040
    3938:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    393c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3940:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3944:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3948:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    394c:	e12fff1e 	bx	lr

00003950 <uptime>:
    3950:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3954:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3958:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    395c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3960:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3964:	e3a0000e 	mov	r0, #14
    3968:	ef000040 	svc	0x00000040
    396c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3970:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3974:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3978:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    397c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3980:	e12fff1e 	bx	lr

00003984 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3984:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3988:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    398c:	e0133fa1 	ands	r3, r3, r1, lsr #31
    3990:	e24b4034 	sub	r4, fp, #52	; 0x34
    3994:	e30597f8 	movw	r9, #22520	; 0x57f8
    neg = 1;
    x = -xx;
    3998:	1261e000 	rsbne	lr, r1, #0
    399c:	e3409000 	movt	r9, #0
{
    39a0:	e1a05000 	mov	r5, r0
    neg = 1;
    39a4:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
    39a8:	01a0e001 	moveq	lr, r1
  neg = 0;
    39ac:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
    39b0:	e3a07000 	mov	r7, #0
  b = base;
    39b4:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
    39b8:	e3a06001 	mov	r6, #1
{
    39bc:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
    39c0:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
    39c4:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    39c8:	e3a0c000 	mov	ip, #0
    39cc:	ea000002 	b	39dc <printint+0x58>
        if(r >= d) {
    39d0:	e1520000 	cmp	r2, r0
            r = r - d;
    39d4:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
    39d8:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
    39dc:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
    39e0:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
    39e4:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
    39e8:	e2011001 	and	r1, r1, #1
    39ec:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
    39f0:	1afffff6 	bne	39d0 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    39f4:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
    39f8:	e35c0000 	cmp	ip, #0
    39fc:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
    3a00:	e2871001 	add	r1, r7, #1
    3a04:	e7d93003 	ldrb	r3, [r9, r3]
    3a08:	e4c83001 	strb	r3, [r8], #1
    3a0c:	11a07001 	movne	r7, r1
    3a10:	1affffea 	bne	39c0 <printint+0x3c>
  if(neg)
    3a14:	e35a0000 	cmp	sl, #0
    3a18:	0a000005 	beq	3a34 <printint+0xb0>
    buf[i++] = '-';
    3a1c:	e24b3024 	sub	r3, fp, #36	; 0x24
    3a20:	e3a0202d 	mov	r2, #45	; 0x2d
    3a24:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
    3a28:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
    3a2c:	e1a03002 	mov	r3, r2
    3a30:	e5402010 	strb	r2, [r0, #-16]
    3a34:	e0847007 	add	r7, r4, r7
    3a38:	ea000000 	b	3a40 <printint+0xbc>
    3a3c:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
    3a40:	e3a02001 	mov	r2, #1
    3a44:	e24b1035 	sub	r1, fp, #53	; 0x35
    3a48:	e1a00005 	mov	r0, r5
    3a4c:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
    3a50:	ebfffefb 	bl	3644 <write>

  while(--i >= 0)
    3a54:	e1570004 	cmp	r7, r4
    3a58:	1afffff7 	bne	3a3c <printint+0xb8>
    putc(fd, buf[i]);
}
    3a5c:	e24bd020 	sub	sp, fp, #32
    3a60:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00003a64 <div>:
{
    3a64:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    3a68:	e3a02000 	mov	r2, #0
{
    3a6c:	e28db008 	add	fp, sp, #8
    3a70:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
    3a74:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    3a78:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
    3a7c:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
    3a80:	e1a0c33e 	lsr	ip, lr, r3
    3a84:	e20cc001 	and	ip, ip, #1
    3a88:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    3a8c:	e1520001 	cmp	r2, r1
            r = r - d;
    3a90:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
    3a94:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
    3a98:	e2533001 	subs	r3, r3, #1
    3a9c:	38bd8810 	popcc	{r4, fp, pc}
    3aa0:	eafffff6 	b	3a80 <div+0x1c>

00003aa4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3aa4:	e92d000e 	push	{r1, r2, r3}
    3aa8:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    3aac:	e28db018 	add	fp, sp, #24
    3ab0:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ab4:	e59b6004 	ldr	r6, [fp, #4]
    3ab8:	e5d64000 	ldrb	r4, [r6]
    3abc:	e3540000 	cmp	r4, #0
    3ac0:	0a00002b 	beq	3b74 <printf+0xd0>
    3ac4:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
    3ac8:	e28b8008 	add	r8, fp, #8
  state = 0;
    3acc:	e3a05000 	mov	r5, #0
    3ad0:	ea00000a 	b	3b00 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ad4:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    3ad8:	01a05004 	moveq	r5, r4
      if(c == '%'){
    3adc:	0a000004 	beq	3af4 <printf+0x50>
  write(fd, &c, 1);
    3ae0:	e3a02001 	mov	r2, #1
    3ae4:	e24b1019 	sub	r1, fp, #25
    3ae8:	e1a00007 	mov	r0, r7
    3aec:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
    3af0:	ebfffed3 	bl	3644 <write>
  for(i = 0; fmt[i]; i++){
    3af4:	e5f64001 	ldrb	r4, [r6, #1]!
    3af8:	e3540000 	cmp	r4, #0
    3afc:	0a00001c 	beq	3b74 <printf+0xd0>
    if(state == 0){
    3b00:	e3550000 	cmp	r5, #0
    3b04:	0afffff2 	beq	3ad4 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3b08:	e3550025 	cmp	r5, #37	; 0x25
    3b0c:	1afffff8 	bne	3af4 <printf+0x50>
      if(c == 'd'){
    3b10:	e3540064 	cmp	r4, #100	; 0x64
    3b14:	0a000021 	beq	3ba0 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3b18:	e20430f7 	and	r3, r4, #247	; 0xf7
    3b1c:	e3530070 	cmp	r3, #112	; 0x70
    3b20:	0a000017 	beq	3b84 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3b24:	e3540073 	cmp	r4, #115	; 0x73
    3b28:	0a00002e 	beq	3be8 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3b2c:	e3540063 	cmp	r4, #99	; 0x63
    3b30:	0a000021 	beq	3bbc <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3b34:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
    3b38:	e3a02001 	mov	r2, #1
    3b3c:	e24b1019 	sub	r1, fp, #25
    3b40:	e1a00007 	mov	r0, r7
    3b44:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
    3b48:	0a000023 	beq	3bdc <printf+0x138>
  write(fd, &c, 1);
    3b4c:	ebfffebc 	bl	3644 <write>
    3b50:	e3a02001 	mov	r2, #1
    3b54:	e24b1019 	sub	r1, fp, #25
    3b58:	e1a00007 	mov	r0, r7
    3b5c:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
    3b60:	ebfffeb7 	bl	3644 <write>
  for(i = 0; fmt[i]; i++){
    3b64:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b68:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
    3b6c:	e3540000 	cmp	r4, #0
    3b70:	1affffe2 	bne	3b00 <printf+0x5c>
    }
  }
}
    3b74:	e24bd018 	sub	sp, fp, #24
    3b78:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    3b7c:	e28dd00c 	add	sp, sp, #12
    3b80:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
    3b84:	e3a03000 	mov	r3, #0
    3b88:	e3a02010 	mov	r2, #16
    3b8c:	e4981004 	ldr	r1, [r8], #4
    3b90:	e1a00007 	mov	r0, r7
    3b94:	ebffff7a 	bl	3984 <printint>
      state = 0;
    3b98:	e3a05000 	mov	r5, #0
    3b9c:	eaffffd4 	b	3af4 <printf+0x50>
        printint(fd, *ap, 10, 1);
    3ba0:	e3a03001 	mov	r3, #1
    3ba4:	e3a0200a 	mov	r2, #10
    3ba8:	e4981004 	ldr	r1, [r8], #4
    3bac:	e1a00007 	mov	r0, r7
    3bb0:	ebffff73 	bl	3984 <printint>
      state = 0;
    3bb4:	e3a05000 	mov	r5, #0
    3bb8:	eaffffcd 	b	3af4 <printf+0x50>
        putc(fd, *ap);
    3bbc:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
    3bc0:	e3a02001 	mov	r2, #1
    3bc4:	e24b1019 	sub	r1, fp, #25
    3bc8:	e1a00007 	mov	r0, r7
      state = 0;
    3bcc:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
    3bd0:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
    3bd4:	ebfffe9a 	bl	3644 <write>
        ap++;
    3bd8:	eaffffc5 	b	3af4 <printf+0x50>
  write(fd, &c, 1);
    3bdc:	ebfffe98 	bl	3644 <write>
      state = 0;
    3be0:	e3a05000 	mov	r5, #0
    3be4:	eaffffc2 	b	3af4 <printf+0x50>
        s = (char*)*ap;
    3be8:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
    3bec:	e3540000 	cmp	r4, #0
    3bf0:	0a00000b 	beq	3c24 <printf+0x180>
        while(*s != 0){
    3bf4:	e5d45000 	ldrb	r5, [r4]
    3bf8:	e3550000 	cmp	r5, #0
    3bfc:	0affffbc 	beq	3af4 <printf+0x50>
  write(fd, &c, 1);
    3c00:	e3a02001 	mov	r2, #1
    3c04:	e24b1019 	sub	r1, fp, #25
    3c08:	e1a00007 	mov	r0, r7
    3c0c:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    3c10:	ebfffe8b 	bl	3644 <write>
        while(*s != 0){
    3c14:	e5f45001 	ldrb	r5, [r4, #1]!
    3c18:	e3550000 	cmp	r5, #0
    3c1c:	1afffff7 	bne	3c00 <printf+0x15c>
    3c20:	eaffffb3 	b	3af4 <printf+0x50>
          s = "(null)";
    3c24:	e305480c 	movw	r4, #22540	; 0x580c
        while(*s != 0){
    3c28:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
    3c2c:	e3404000 	movt	r4, #0
    3c30:	eafffff2 	b	3c00 <printf+0x15c>

00003c34 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c34:	e305c8b0 	movw	ip, #22704	; 0x58b0
    3c38:	e340c000 	movt	ip, #0
{
    3c3c:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
    3c40:	e2401008 	sub	r1, r0, #8
{
    3c44:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c48:	e59c3000 	ldr	r3, [ip]
    3c4c:	ea000004 	b	3c64 <free+0x30>
    3c50:	e1510002 	cmp	r1, r2
    3c54:	3a000009 	bcc	3c80 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c58:	e1530002 	cmp	r3, r2
    3c5c:	2a000007 	bcs	3c80 <free+0x4c>
{
    3c60:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c64:	e1530001 	cmp	r3, r1
    3c68:	e5932000 	ldr	r2, [r3]
    3c6c:	3afffff7 	bcc	3c50 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c70:	e1530002 	cmp	r3, r2
    3c74:	3afffff9 	bcc	3c60 <free+0x2c>
    3c78:	e1510002 	cmp	r1, r2
    3c7c:	2afffff7 	bcs	3c60 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c80:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c84:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
    3c88:	e081418e 	add	r4, r1, lr, lsl #3
    3c8c:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
    3c90:	05922004 	ldreq	r2, [r2, #4]
    3c94:	0082e00e 	addeq	lr, r2, lr
    3c98:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    3c9c:	05932000 	ldreq	r2, [r3]
    3ca0:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
    3ca4:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    3ca8:	e5932004 	ldr	r2, [r3, #4]
    3cac:	e083e182 	add	lr, r3, r2, lsl #3
    3cb0:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
    3cb4:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
    3cb8:	05101004 	ldreq	r1, [r0, #-4]
    3cbc:	00812002 	addeq	r2, r1, r2
    3cc0:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    3cc4:	05102008 	ldreq	r2, [r0, #-8]
    3cc8:	05832000 	streq	r2, [r3]
}
    3ccc:	e8bd8810 	pop	{r4, fp, pc}

00003cd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3cd0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    3cd4:	e30578b0 	movw	r7, #22704	; 0x58b0
    3cd8:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cdc:	e2804007 	add	r4, r0, #7
{
    3ce0:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
    3ce4:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3ce8:	e1a041a4 	lsr	r4, r4, #3
    3cec:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    3cf0:	e3510000 	cmp	r1, #0
    3cf4:	0a000029 	beq	3da0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cf8:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
    3cfc:	e5932004 	ldr	r2, [r3, #4]
    3d00:	e1520004 	cmp	r2, r4
    3d04:	2a000019 	bcs	3d70 <malloc+0xa0>
    3d08:	e3540a01 	cmp	r4, #4096	; 0x1000
    3d0c:	21a05004 	movcs	r5, r4
    3d10:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
    3d14:	e1a06185 	lsl	r6, r5, #3
    3d18:	ea000005 	b	3d34 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d1c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    3d20:	e5902004 	ldr	r2, [r0, #4]
    3d24:	e1520004 	cmp	r2, r4
    3d28:	2a000012 	bcs	3d78 <malloc+0xa8>
    3d2c:	e5971000 	ldr	r1, [r7]
    3d30:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d34:	e1510003 	cmp	r1, r3
    3d38:	1afffff7 	bne	3d1c <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
    3d3c:	e1a00006 	mov	r0, r6
    3d40:	ebfffee8 	bl	38e8 <sbrk>
    3d44:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    3d48:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
    3d4c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
    3d50:	0a000004 	beq	3d68 <malloc+0x98>
  hp->s.size = nu;
    3d54:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
    3d58:	ebffffb5 	bl	3c34 <free>
  return freep;
    3d5c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
    3d60:	e3530000 	cmp	r3, #0
    3d64:	1affffec 	bne	3d1c <malloc+0x4c>
        return 0;
    3d68:	e3a00000 	mov	r0, #0
  }
}
    3d6c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
    3d70:	e1a00003 	mov	r0, r3
    3d74:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
    3d78:	e1540002 	cmp	r4, r2
      freep = prevp;
    3d7c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
    3d80:	10422004 	subne	r2, r2, r4
    3d84:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
    3d88:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
    3d8c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
    3d90:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
    3d94:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
    3d98:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
    3d9c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
    3da0:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
    3da4:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
    3da8:	e5873000 	str	r3, [r7]
    base.s.size = 0;
    3dac:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
    3db0:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
    3db4:	eaffffd3 	b	3d08 <malloc+0x38>
