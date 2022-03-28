
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
       c:	e305180c 	movw	r1, #22540	; 0x580c
      10:	e3401000 	movt	r1, #0
      14:	eb000ebf 	bl	3b18 <printf>

  if(open("usertests.ran", 0) >= 0){
      18:	e3050820 	movw	r0, #22560	; 0x5820
      1c:	e3a01000 	mov	r1, #0
      20:	e3400000 	movt	r0, #0
      24:	eb000ddc 	bl	379c <open>
      28:	e3500000 	cmp	r0, #0
      2c:	ba000004 	blt	44 <main+0x44>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      30:	e3051830 	movw	r1, #22576	; 0x5830
      34:	e3a00001 	mov	r0, #1
      38:	e3401000 	movt	r1, #0
      3c:	eb000eb5 	bl	3b18 <printf>
    exit();
      40:	eb000d53 	bl	3594 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      44:	e3a01c02 	mov	r1, #512	; 0x200
      48:	e3050820 	movw	r0, #22560	; 0x5820
      4c:	e3400000 	movt	r0, #0
      50:	eb000dd1 	bl	379c <open>
      54:	eb000da9 	bl	3700 <close>

  bigargtest();
      58:	eb000bd1 	bl	2fa4 <bigargtest>
  bigwrite();
      5c:	eb0007f1 	bl	2028 <bigwrite>
  bigargtest();
      60:	eb000bcf 	bl	2fa4 <bigargtest>
  bsstest();
      64:	eb000baf 	bl	2f28 <bsstest>
  sbrktest();
      68:	eb000a25 	bl	2904 <sbrktest>
  validatetest();
      6c:	eb000b82 	bl	2e7c <validatetest>

  opentest();
      70:	eb000017 	bl	d4 <opentest>
  writetest();
      74:	eb00003a 	bl	164 <writetest>
  writetest1();
      78:	eb0000a7 	bl	31c <writetest1>
  createtest();
      7c:	eb00010f 	bl	4c0 <createtest>

  mem();
      80:	eb000255 	bl	9dc <mem>
  pipe1();
      84:	eb000182 	bl	694 <pipe1>
  preempt();
      88:	eb0001e7 	bl	82c <preempt>
  exitwait();
      8c:	eb000232 	bl	95c <exitwait>

  rmdot();
      90:	eb0008d8 	bl	23f8 <rmdot>
  fourteen();
      94:	eb00088b 	bl	22c8 <fourteen>
  bigfile();
      98:	eb00081b 	bl	210c <bigfile>
  subdir();
      9c:	eb000641 	bl	19a8 <subdir>
  concreate();
      a0:	eb0004f0 	bl	1468 <concreate>
  linkunlink();
      a4:	eb0005b3 	bl	1778 <linkunlink>
  linktest();
      a8:	eb00046c 	bl	1260 <linktest>
  unlinkread();
      ac:	eb000409 	bl	10d8 <unlinkread>
  createdelete();
      b0:	eb000370 	bl	e78 <createdelete>
  twofiles();
      b4:	eb0002db 	bl	c28 <twofiles>
  sharedfd();
      b8:	eb000274 	bl	a90 <sharedfd>
  dirfile();
      bc:	eb000929 	bl	2568 <dirfile>
  iref();
      c0:	eb0009a2 	bl	2750 <iref>
  forktest();
      c4:	eb0009e0 	bl	284c <forktest>
  bigdir(); // slow
      c8:	eb0005e7 	bl	186c <bigdir>

  exectest();
      cc:	eb00015d 	bl	648 <exectest>

  exit();
      d0:	eb000d2f 	bl	3594 <exit>

000000d4 <opentest>:
{
      d4:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "open test\n");
      d8:	e305488c 	movw	r4, #22668	; 0x588c
      dc:	e3404000 	movt	r4, #0
{
      e0:	e28db00c 	add	fp, sp, #12
  printf(stdout, "open test\n");
      e4:	e3031e30 	movw	r1, #15920	; 0x3e30
      e8:	e3401000 	movt	r1, #0
      ec:	e5940000 	ldr	r0, [r4]
      f0:	eb000e88 	bl	3b18 <printf>
  fd = open("echo", 0);
      f4:	e3030e3c 	movw	r0, #15932	; 0x3e3c
      f8:	e3a01000 	mov	r1, #0
      fc:	e3400000 	movt	r0, #0
     100:	eb000da5 	bl	379c <open>
  if(fd < 0){
     104:	e3500000 	cmp	r0, #0
     108:	ba00000c 	blt	140 <opentest+0x6c>
  close(fd);
     10c:	eb000d7b 	bl	3700 <close>
  fd = open("doesnotexist", 0);
     110:	e3030e58 	movw	r0, #15960	; 0x3e58
     114:	e3a01000 	mov	r1, #0
     118:	e3400000 	movt	r0, #0
     11c:	eb000d9e 	bl	379c <open>
  if(fd >= 0){
     120:	e3500000 	cmp	r0, #0
    printf(stdout, "open doesnotexist succeeded!\n");
     124:	e5940000 	ldr	r0, [r4]
  if(fd >= 0){
     128:	aa000009 	bge	154 <opentest+0x80>
  printf(stdout, "open test ok\n");
     12c:	e3031e88 	movw	r1, #16008	; 0x3e88
     130:	e3401000 	movt	r1, #0
}
     134:	e24bd00c 	sub	sp, fp, #12
     138:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "open test ok\n");
     13c:	ea000e75 	b	3b18 <printf>
    printf(stdout, "open echo failed!\n");
     140:	e5940000 	ldr	r0, [r4]
     144:	e3031e44 	movw	r1, #15940	; 0x3e44
     148:	e3401000 	movt	r1, #0
     14c:	eb000e71 	bl	3b18 <printf>
    exit();
     150:	eb000d0f 	bl	3594 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     154:	e3031e68 	movw	r1, #15976	; 0x3e68
     158:	e3401000 	movt	r1, #0
     15c:	eb000e6d 	bl	3b18 <printf>
    exit();
     160:	eb000d0b 	bl	3594 <exit>

00000164 <writetest>:
{
     164:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test\n");
     168:	e305888c 	movw	r8, #22668	; 0x588c
     16c:	e3408000 	movt	r8, #0
{
     170:	e28db01c 	add	fp, sp, #28
  printf(stdout, "small file test\n");
     174:	e3031e98 	movw	r1, #16024	; 0x3e98
     178:	e3401000 	movt	r1, #0
     17c:	e5980000 	ldr	r0, [r8]
     180:	eb000e64 	bl	3b18 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     184:	e3030eac 	movw	r0, #16044	; 0x3eac
     188:	e3001202 	movw	r1, #514	; 0x202
     18c:	e3400000 	movt	r0, #0
     190:	eb000d81 	bl	379c <open>
  if(fd >= 0){
     194:	e2505000 	subs	r5, r0, #0
     198:	ba00005a 	blt	308 <writetest+0x1a4>
    printf(stdout, "creat small succeeded; ok\n");
     19c:	e3031eb4 	movw	r1, #16052	; 0x3eb4
     1a0:	e5980000 	ldr	r0, [r8]
     1a4:	e3401000 	movt	r1, #0
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1a8:	e3036eec 	movw	r6, #16108	; 0x3eec
    printf(stdout, "creat small succeeded; ok\n");
     1ac:	eb000e59 	bl	3b18 <printf>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1b0:	e3037f1c 	movw	r7, #16156	; 0x3f1c
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
     1cc:	eb000d3e 	bl	36cc <write>
     1d0:	e350000a 	cmp	r0, #10
     1d4:	1a000030 	bne	29c <writetest+0x138>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1d8:	e1a02000 	mov	r2, r0
     1dc:	e1a01007 	mov	r1, r7
     1e0:	e1a00005 	mov	r0, r5
     1e4:	eb000d38 	bl	36cc <write>
     1e8:	e350000a 	cmp	r0, #10
     1ec:	1a000030 	bne	2b4 <writetest+0x150>
  for(i = 0; i < 100; i++){
     1f0:	e2844001 	add	r4, r4, #1
     1f4:	e3540064 	cmp	r4, #100	; 0x64
     1f8:	1afffff0 	bne	1c0 <writetest+0x5c>
  printf(stdout, "writes ok\n");
     1fc:	e5980000 	ldr	r0, [r8]
     200:	e3031f4c 	movw	r1, #16204	; 0x3f4c
     204:	e3401000 	movt	r1, #0
     208:	eb000e42 	bl	3b18 <printf>
  close(fd);
     20c:	e1a00005 	mov	r0, r5
     210:	eb000d3a 	bl	3700 <close>
  fd = open("small", O_RDONLY);
     214:	e3030eac 	movw	r0, #16044	; 0x3eac
     218:	e3a01000 	mov	r1, #0
     21c:	e3400000 	movt	r0, #0
     220:	eb000d5d 	bl	379c <open>
  if(fd >= 0){
     224:	e2504000 	subs	r4, r0, #0
     228:	ba000027 	blt	2cc <writetest+0x168>
    printf(stdout, "open small succeeded ok\n");
     22c:	e5980000 	ldr	r0, [r8]
     230:	e3031f58 	movw	r1, #16216	; 0x3f58
     234:	e3401000 	movt	r1, #0
     238:	eb000e36 	bl	3b18 <printf>
  i = read(fd, buf, 2000);
     23c:	e3081044 	movw	r1, #32836	; 0x8044
     240:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     244:	e3401000 	movt	r1, #0
     248:	e1a00004 	mov	r0, r4
     24c:	eb000d11 	bl	3698 <read>
  if(i == 2000){
     250:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     254:	1a000021 	bne	2e0 <writetest+0x17c>
    printf(stdout, "read succeeded ok\n");
     258:	e5980000 	ldr	r0, [r8]
     25c:	e3031f90 	movw	r1, #16272	; 0x3f90
     260:	e3401000 	movt	r1, #0
     264:	eb000e2b 	bl	3b18 <printf>
  close(fd);
     268:	e1a00004 	mov	r0, r4
     26c:	eb000d23 	bl	3700 <close>
  if(unlink("small") < 0){
     270:	e3030eac 	movw	r0, #16044	; 0x3eac
     274:	e3400000 	movt	r0, #0
     278:	eb000d61 	bl	3804 <unlink>
     27c:	e3500000 	cmp	r0, #0
     280:	ba00001b 	blt	2f4 <writetest+0x190>
  printf(stdout, "small file test ok\n");
     284:	e5980000 	ldr	r0, [r8]
     288:	e3031fcc 	movw	r1, #16332	; 0x3fcc
     28c:	e3401000 	movt	r1, #0
}
     290:	e24bd01c 	sub	sp, fp, #28
     294:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test ok\n");
     298:	ea000e1e 	b	3b18 <printf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     29c:	e1a02004 	mov	r2, r4
     2a0:	e5980000 	ldr	r0, [r8]
     2a4:	e3031ef8 	movw	r1, #16120	; 0x3ef8
     2a8:	e3401000 	movt	r1, #0
     2ac:	eb000e19 	bl	3b18 <printf>
      exit();
     2b0:	eb000cb7 	bl	3594 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     2b4:	e1a02004 	mov	r2, r4
     2b8:	e5980000 	ldr	r0, [r8]
     2bc:	e3031f28 	movw	r1, #16168	; 0x3f28
     2c0:	e3401000 	movt	r1, #0
     2c4:	eb000e13 	bl	3b18 <printf>
      exit();
     2c8:	eb000cb1 	bl	3594 <exit>
    printf(stdout, "error: open small failed!\n");
     2cc:	e5980000 	ldr	r0, [r8]
     2d0:	e3031f74 	movw	r1, #16244	; 0x3f74
     2d4:	e3401000 	movt	r1, #0
     2d8:	eb000e0e 	bl	3b18 <printf>
    exit();
     2dc:	eb000cac 	bl	3594 <exit>
    printf(stdout, "read failed\n");
     2e0:	e5980000 	ldr	r0, [r8]
     2e4:	e3031fa4 	movw	r1, #16292	; 0x3fa4
     2e8:	e3401000 	movt	r1, #0
     2ec:	eb000e09 	bl	3b18 <printf>
    exit();
     2f0:	eb000ca7 	bl	3594 <exit>
    printf(stdout, "unlink small failed\n");
     2f4:	e5980000 	ldr	r0, [r8]
     2f8:	e3031fb4 	movw	r1, #16308	; 0x3fb4
     2fc:	e3401000 	movt	r1, #0
     300:	eb000e04 	bl	3b18 <printf>
    exit();
     304:	eb000ca2 	bl	3594 <exit>
    printf(stdout, "error: creat small failed!\n");
     308:	e5980000 	ldr	r0, [r8]
     30c:	e3031ed0 	movw	r1, #16080	; 0x3ed0
     310:	e3401000 	movt	r1, #0
     314:	eb000dff 	bl	3b18 <printf>
    exit();
     318:	eb000c9d 	bl	3594 <exit>

0000031c <writetest1>:
{
     31c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files test\n");
     320:	e305888c 	movw	r8, #22668	; 0x588c
     324:	e3408000 	movt	r8, #0
{
     328:	e28db01c 	add	fp, sp, #28
  printf(stdout, "big files test\n");
     32c:	e3031fe0 	movw	r1, #16352	; 0x3fe0
     330:	e3401000 	movt	r1, #0
     334:	e5980000 	ldr	r0, [r8]
     338:	eb000df6 	bl	3b18 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     33c:	e3030ff0 	movw	r0, #16368	; 0x3ff0
     340:	e3001202 	movw	r1, #514	; 0x202
     344:	e3400000 	movt	r0, #0
     348:	eb000d13 	bl	379c <open>
  if(fd < 0){
     34c:	e2506000 	subs	r6, r0, #0
     350:	a3085044 	movwge	r5, #32836	; 0x8044
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
     374:	eb000cd4 	bl	36cc <write>
     378:	e3500c02 	cmp	r0, #512	; 0x200
     37c:	1a000029 	bne	428 <writetest1+0x10c>
  for(i = 0; i < MAXFILE; i++){
     380:	e2844001 	add	r4, r4, #1
     384:	e354008c 	cmp	r4, #140	; 0x8c
     388:	1afffff5 	bne	364 <writetest1+0x48>
  close(fd);
     38c:	e1a00006 	mov	r0, r6
     390:	eb000cda 	bl	3700 <close>
  fd = open("big", O_RDONLY);
     394:	e3030ff0 	movw	r0, #16368	; 0x3ff0
     398:	e3a01000 	mov	r1, #0
     39c:	e3400000 	movt	r0, #0
     3a0:	eb000cfd 	bl	379c <open>
  if(fd < 0){
     3a4:	e2507000 	subs	r7, r0, #0
    i = read(fd, buf, 512);
     3a8:	a3086044 	movwge	r6, #32836	; 0x8044
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
     3e0:	eb000cac 	bl	3698 <read>
    if(i == 0){
     3e4:	e3500000 	cmp	r0, #0
     3e8:	1afffff3 	bne	3bc <writetest1+0xa0>
      if(n == MAXFILE - 1){
     3ec:	e354008b 	cmp	r4, #139	; 0x8b
     3f0:	0a00001e 	beq	470 <writetest1+0x154>
  close(fd);
     3f4:	e1a00007 	mov	r0, r7
     3f8:	eb000cc0 	bl	3700 <close>
  if(unlink("big") < 0){
     3fc:	e3030ff0 	movw	r0, #16368	; 0x3ff0
     400:	e3400000 	movt	r0, #0
     404:	eb000cfe 	bl	3804 <unlink>
     408:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink big failed\n");
     40c:	e5980000 	ldr	r0, [r8]
  if(unlink("big") < 0){
     410:	ba000026 	blt	4b0 <writetest1+0x194>
  printf(stdout, "big files ok\n");
     414:	e30410b0 	movw	r1, #16560	; 0x40b0
     418:	e3401000 	movt	r1, #0
}
     41c:	e24bd01c 	sub	sp, fp, #28
     420:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files ok\n");
     424:	ea000dbb 	b	3b18 <printf>
      printf(stdout, "error: write big file failed\n", i);
     428:	e1a02004 	mov	r2, r4
     42c:	e5980000 	ldr	r0, [r8]
     430:	e3041010 	movw	r1, #16400	; 0x4010
     434:	e3401000 	movt	r1, #0
     438:	eb000db6 	bl	3b18 <printf>
      exit();
     43c:	eb000c54 	bl	3594 <exit>
      printf(stdout, "read content of block %d is %d\n",
     440:	e1a02004 	mov	r2, r4
     444:	e5980000 	ldr	r0, [r8]
     448:	e304107c 	movw	r1, #16508	; 0x407c
     44c:	e3401000 	movt	r1, #0
     450:	eb000db0 	bl	3b18 <printf>
      exit();
     454:	eb000c4e 	bl	3594 <exit>
      printf(stdout, "read failed %d\n", i);
     458:	e1a02000 	mov	r2, r0
     45c:	e304106c 	movw	r1, #16492	; 0x406c
     460:	e5980000 	ldr	r0, [r8]
     464:	e3401000 	movt	r1, #0
     468:	eb000daa 	bl	3b18 <printf>
      exit();
     46c:	eb000c48 	bl	3594 <exit>
        printf(stdout, "read only %d blocks from big", n);
     470:	e1a02004 	mov	r2, r4
     474:	e5980000 	ldr	r0, [r8]
     478:	e304104c 	movw	r1, #16460	; 0x404c
     47c:	e3401000 	movt	r1, #0
     480:	eb000da4 	bl	3b18 <printf>
        exit();
     484:	eb000c42 	bl	3594 <exit>
    printf(stdout, "error: open big failed!\n");
     488:	e5980000 	ldr	r0, [r8]
     48c:	e3041030 	movw	r1, #16432	; 0x4030
     490:	e3401000 	movt	r1, #0
     494:	eb000d9f 	bl	3b18 <printf>
    exit();
     498:	eb000c3d 	bl	3594 <exit>
    printf(stdout, "error: creat big failed!\n");
     49c:	e5980000 	ldr	r0, [r8]
     4a0:	e3031ff4 	movw	r1, #16372	; 0x3ff4
     4a4:	e3401000 	movt	r1, #0
     4a8:	eb000d9a 	bl	3b18 <printf>
    exit();
     4ac:	eb000c38 	bl	3594 <exit>
    printf(stdout, "unlink big failed\n");
     4b0:	e304109c 	movw	r1, #16540	; 0x409c
     4b4:	e3401000 	movt	r1, #0
     4b8:	eb000d96 	bl	3b18 <printf>
    exit();
     4bc:	eb000c34 	bl	3594 <exit>

000004c0 <createtest>:
{
     4c0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink test\n");
     4c4:	e305788c 	movw	r7, #22668	; 0x588c
  name[0] = 'a';
     4c8:	e30a5044 	movw	r5, #41028	; 0xa044
  printf(stdout, "many creates, followed by unlink test\n");
     4cc:	e3407000 	movt	r7, #0
  name[0] = 'a';
     4d0:	e3405000 	movt	r5, #0
{
     4d4:	e28db014 	add	fp, sp, #20
  printf(stdout, "many creates, followed by unlink test\n");
     4d8:	e30410c0 	movw	r1, #16576	; 0x40c0
     4dc:	e5970000 	ldr	r0, [r7]
     4e0:	e3401000 	movt	r1, #0
  name[2] = '\0';
     4e4:	e3a04030 	mov	r4, #48	; 0x30
    fd = open(name, O_CREATE|O_RDWR);
     4e8:	e1a06005 	mov	r6, r5
  printf(stdout, "many creates, followed by unlink test\n");
     4ec:	eb000d89 	bl	3b18 <printf>
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
     504:	e2844001 	add	r4, r4, #1
    fd = open(name, O_CREATE|O_RDWR);
     508:	e3001202 	movw	r1, #514	; 0x202
     50c:	e1a00006 	mov	r0, r6
     510:	eb000ca1 	bl	379c <open>
     514:	e6ef4074 	uxtb	r4, r4
    close(fd);
     518:	eb000c78 	bl	3700 <close>
  for(i = 0; i < 52; i++){
     51c:	e3540064 	cmp	r4, #100	; 0x64
     520:	1afffff6 	bne	500 <createtest+0x40>
    unlink(name);
     524:	e30a6044 	movw	r6, #41028	; 0xa044
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
     544:	e2844001 	add	r4, r4, #1
    unlink(name);
     548:	e1a00006 	mov	r0, r6
     54c:	e6ef4074 	uxtb	r4, r4
     550:	eb000cab 	bl	3804 <unlink>
  for(i = 0; i < 52; i++){
     554:	e3540064 	cmp	r4, #100	; 0x64
     558:	1afffff8 	bne	540 <createtest+0x80>
  printf(stdout, "many creates, followed by unlink; ok\n");
     55c:	e5970000 	ldr	r0, [r7]
     560:	e30410e8 	movw	r1, #16616	; 0x40e8
     564:	e3401000 	movt	r1, #0
}
     568:	e24bd014 	sub	sp, fp, #20
     56c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink; ok\n");
     570:	ea000d68 	b	3b18 <printf>

00000574 <dirtest>:
{
     574:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     578:	e305488c 	movw	r4, #22668	; 0x588c
     57c:	e3404000 	movt	r4, #0
{
     580:	e28db00c 	add	fp, sp, #12
  printf(stdout, "mkdir test\n");
     584:	e3041110 	movw	r1, #16656	; 0x4110
     588:	e3401000 	movt	r1, #0
     58c:	e5940000 	ldr	r0, [r4]
     590:	eb000d60 	bl	3b18 <printf>
  if(mkdir("dir0") < 0){
     594:	e304011c 	movw	r0, #16668	; 0x411c
     598:	e3400000 	movt	r0, #0
     59c:	eb000cbf 	bl	38a0 <mkdir>
     5a0:	e3500000 	cmp	r0, #0
     5a4:	ba000014 	blt	5fc <dirtest+0x88>
  if(chdir("dir0") < 0){
     5a8:	e304011c 	movw	r0, #16668	; 0x411c
     5ac:	e3400000 	movt	r0, #0
     5b0:	eb000cc7 	bl	38d4 <chdir>
     5b4:	e3500000 	cmp	r0, #0
     5b8:	ba00001d 	blt	634 <dirtest+0xc0>
  if(chdir("..") < 0){
     5bc:	e3040148 	movw	r0, #16712	; 0x4148
     5c0:	e3400000 	movt	r0, #0
     5c4:	eb000cc2 	bl	38d4 <chdir>
     5c8:	e3500000 	cmp	r0, #0
     5cc:	ba000013 	blt	620 <dirtest+0xac>
  if(unlink("dir0") < 0){
     5d0:	e304011c 	movw	r0, #16668	; 0x411c
     5d4:	e3400000 	movt	r0, #0
     5d8:	eb000c89 	bl	3804 <unlink>
     5dc:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink dir0 failed\n");
     5e0:	e5940000 	ldr	r0, [r4]
  if(unlink("dir0") < 0){
     5e4:	ba000009 	blt	610 <dirtest+0x9c>
  printf(stdout, "mkdir test\n");
     5e8:	e3041110 	movw	r1, #16656	; 0x4110
     5ec:	e3401000 	movt	r1, #0
}
     5f0:	e24bd00c 	sub	sp, fp, #12
     5f4:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     5f8:	ea000d46 	b	3b18 <printf>
    printf(stdout, "mkdir failed\n");
     5fc:	e5940000 	ldr	r0, [r4]
     600:	e3041124 	movw	r1, #16676	; 0x4124
     604:	e3401000 	movt	r1, #0
     608:	eb000d42 	bl	3b18 <printf>
    exit();
     60c:	eb000be0 	bl	3594 <exit>
    printf(stdout, "unlink dir0 failed\n");
     610:	e3041160 	movw	r1, #16736	; 0x4160
     614:	e3401000 	movt	r1, #0
     618:	eb000d3e 	bl	3b18 <printf>
    exit();
     61c:	eb000bdc 	bl	3594 <exit>
    printf(stdout, "chdir .. failed\n");
     620:	e5940000 	ldr	r0, [r4]
     624:	e304114c 	movw	r1, #16716	; 0x414c
     628:	e3401000 	movt	r1, #0
     62c:	eb000d39 	bl	3b18 <printf>
    exit();
     630:	eb000bd7 	bl	3594 <exit>
    printf(stdout, "chdir dir0 failed\n");
     634:	e5940000 	ldr	r0, [r4]
     638:	e3041134 	movw	r1, #16692	; 0x4134
     63c:	e3401000 	movt	r1, #0
     640:	eb000d34 	bl	3b18 <printf>
    exit();
     644:	eb000bd2 	bl	3594 <exit>

00000648 <exectest>:
{
     648:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "exec test\n");
     64c:	e305488c 	movw	r4, #22668	; 0x588c
     650:	e3404000 	movt	r4, #0
{
     654:	e28db00c 	add	fp, sp, #12
  printf(stdout, "exec test\n");
     658:	e3041174 	movw	r1, #16756	; 0x4174
     65c:	e3401000 	movt	r1, #0
     660:	e5940000 	ldr	r0, [r4]
     664:	eb000d2b 	bl	3b18 <printf>
  if(exec("echo", echoargv) < 0){
     668:	e2841004 	add	r1, r4, #4
     66c:	e3030e3c 	movw	r0, #15932	; 0x3e3c
     670:	e3400000 	movt	r0, #0
     674:	eb000c3b 	bl	3768 <exec>
     678:	e3500000 	cmp	r0, #0
     67c:	a8bd8830 	popge	{r4, r5, fp, pc}
    printf(stdout, "exec echo failed\n");
     680:	e5940000 	ldr	r0, [r4]
     684:	e3041180 	movw	r1, #16768	; 0x4180
     688:	e3401000 	movt	r1, #0
     68c:	eb000d21 	bl	3b18 <printf>
    exit();
     690:	eb000bbf 	bl	3594 <exit>

00000694 <pipe1>:
{
     694:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     698:	e28db018 	add	fp, sp, #24
  if(pipe(fds) != 0){
     69c:	e24b0024 	sub	r0, fp, #36	; 0x24
{
     6a0:	e24dd00c 	sub	sp, sp, #12
  if(pipe(fds) != 0){
     6a4:	eb000bee 	bl	3664 <pipe>
     6a8:	e2504000 	subs	r4, r0, #0
     6ac:	1a00004d 	bne	7e8 <pipe1+0x154>
  pid = fork();
     6b0:	eb000baa 	bl	3560 <fork>
  if(pid == 0){
     6b4:	e2505000 	subs	r5, r0, #0
     6b8:	0a000021 	beq	744 <pipe1+0xb0>
  } else if(pid > 0){
     6bc:	da00004e 	ble	7fc <pipe1+0x168>
    close(fds[1]);
     6c0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    while((n = read(fds[0], buf, cc)) > 0){
     6c4:	e3085044 	movw	r5, #32836	; 0x8044
    close(fds[1]);
     6c8:	eb000c0c 	bl	3700 <close>
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
     6e4:	eb000beb 	bl	3698 <read>
     6e8:	e3500000 	cmp	r0, #0
     6ec:	da00002b 	ble	7a0 <pipe1+0x10c>
     6f0:	e3083044 	movw	r3, #32836	; 0x8044
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
     720:	e3570a02 	cmp	r7, #8192	; 0x2000
     724:	a3a07a02 	movge	r7, #8192	; 0x2000
     728:	eaffffea 	b	6d8 <pipe1+0x44>
          printf(1, "pipe1 oops 2\n");
     72c:	e3a00001 	mov	r0, #1
     730:	e30411b4 	movw	r1, #16820	; 0x41b4
     734:	e3401000 	movt	r1, #0
     738:	eb000cf6 	bl	3b18 <printf>
}
     73c:	e24bd018 	sub	sp, fp, #24
     740:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    close(fds[0]);
     744:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
      if(write(fds[1], buf, 1033) != 1033){
     748:	e3087044 	movw	r7, #32836	; 0x8044
    close(fds[0]);
     74c:	eb000beb 	bl	3700 <close>
     750:	e59f40cc 	ldr	r4, [pc, #204]	; 824 <pipe1+0x190>
      if(write(fds[1], buf, 1033) != 1033){
     754:	e3407000 	movt	r7, #0
     758:	e3006409 	movw	r6, #1033	; 0x409
    for(n = 0; n < 5; n++){
     75c:	e301842d 	movw	r8, #5165	; 0x142d
     760:	e59f30c0 	ldr	r3, [pc, #192]	; 828 <pipe1+0x194>
     764:	e1a02005 	mov	r2, r5
        buf[i] = seq++;
     768:	e5e32001 	strb	r2, [r3, #1]!
      for(i = 0; i < 1033; i++)
     76c:	e1530004 	cmp	r3, r4
     770:	e2822001 	add	r2, r2, #1
     774:	1afffffb 	bne	768 <pipe1+0xd4>
      if(write(fds[1], buf, 1033) != 1033){
     778:	e3002409 	movw	r2, #1033	; 0x409
     77c:	e1a01007 	mov	r1, r7
     780:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     784:	e0855006 	add	r5, r5, r6
     788:	eb000bcf 	bl	36cc <write>
     78c:	e1500006 	cmp	r0, r6
     790:	1a00001e 	bne	810 <pipe1+0x17c>
    for(n = 0; n < 5; n++){
     794:	e1550008 	cmp	r5, r8
     798:	1afffff0 	bne	760 <pipe1+0xcc>
      exit();
     79c:	eb000b7c 	bl	3594 <exit>
    if(total != 5 * 1033){
     7a0:	e301342d 	movw	r3, #5165	; 0x142d
     7a4:	e1560003 	cmp	r6, r3
     7a8:	1a000008 	bne	7d0 <pipe1+0x13c>
    close(fds[0]);
     7ac:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     7b0:	eb000bd2 	bl	3700 <close>
    wait();
     7b4:	eb000b83 	bl	35c8 <wait>
  printf(1, "pipe1 ok\n");
     7b8:	e3a00001 	mov	r0, #1
     7bc:	e30411dc 	movw	r1, #16860	; 0x41dc
     7c0:	e3401000 	movt	r1, #0
     7c4:	eb000cd3 	bl	3b18 <printf>
}
     7c8:	e24bd018 	sub	sp, fp, #24
     7cc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "pipe1 oops 3 total %d\n", total);
     7d0:	e1a02006 	mov	r2, r6
     7d4:	e30411c4 	movw	r1, #16836	; 0x41c4
     7d8:	e3a00001 	mov	r0, #1
     7dc:	e3401000 	movt	r1, #0
     7e0:	eb000ccc 	bl	3b18 <printf>
     7e4:	eaffffec 	b	79c <pipe1+0x108>
    printf(1, "pipe() failed\n");
     7e8:	e3041194 	movw	r1, #16788	; 0x4194
     7ec:	e3a00001 	mov	r0, #1
     7f0:	e3401000 	movt	r1, #0
     7f4:	eb000cc7 	bl	3b18 <printf>
    exit();
     7f8:	eb000b65 	bl	3594 <exit>
    printf(1, "fork() failed\n");
     7fc:	e30411e8 	movw	r1, #16872	; 0x41e8
     800:	e3a00001 	mov	r0, #1
     804:	e3401000 	movt	r1, #0
     808:	eb000cc2 	bl	3b18 <printf>
    exit();
     80c:	eb000b60 	bl	3594 <exit>
        printf(1, "pipe1 oops 1\n");
     810:	e30411a4 	movw	r1, #16804	; 0x41a4
     814:	e3a00001 	mov	r0, #1
     818:	e3401000 	movt	r1, #0
     81c:	eb000cbd 	bl	3b18 <printf>
        exit();
     820:	eb000b5b 	bl	3594 <exit>
     824:	0000844c 	.word	0x0000844c
     828:	00008043 	.word	0x00008043

0000082c <preempt>:
{
     82c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "preempt: ");
     830:	e3a00001 	mov	r0, #1
{
     834:	e28db014 	add	fp, sp, #20
  printf(1, "preempt: ");
     838:	e30411f8 	movw	r1, #16888	; 0x41f8
{
     83c:	e24dd008 	sub	sp, sp, #8
  printf(1, "preempt: ");
     840:	e3401000 	movt	r1, #0
     844:	eb000cb3 	bl	3b18 <printf>
  pid1 = fork();
     848:	eb000b44 	bl	3560 <fork>
  if(pid1 == 0)
     84c:	e2507000 	subs	r7, r0, #0
     850:	1a000000 	bne	858 <preempt+0x2c>
     854:	eafffffe 	b	854 <preempt+0x28>
  pid2 = fork();
     858:	eb000b40 	bl	3560 <fork>
  if(pid2 == 0)
     85c:	e2506000 	subs	r6, r0, #0
     860:	1a000000 	bne	868 <preempt+0x3c>
     864:	eafffffe 	b	864 <preempt+0x38>
  pipe(pfds);
     868:	e24b001c 	sub	r0, fp, #28
     86c:	eb000b7c 	bl	3664 <pipe>
  pid3 = fork();
     870:	eb000b3a 	bl	3560 <fork>
  if(pid3 == 0){
     874:	e2505000 	subs	r5, r0, #0
     878:	1a00000f 	bne	8bc <preempt+0x90>
    close(pfds[0]);
     87c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     880:	eb000b9e 	bl	3700 <close>
    if(write(pfds[1], "x", 1) != 1)
     884:	e3041b64 	movw	r1, #19300	; 0x4b64
     888:	e3a02001 	mov	r2, #1
     88c:	e3401000 	movt	r1, #0
     890:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     894:	eb000b8c 	bl	36cc <write>
     898:	e3500001 	cmp	r0, #1
     89c:	0a000003 	beq	8b0 <preempt+0x84>
      printf(1, "preempt write error");
     8a0:	e3041204 	movw	r1, #16900	; 0x4204
     8a4:	e3a00001 	mov	r0, #1
     8a8:	e3401000 	movt	r1, #0
     8ac:	eb000c99 	bl	3b18 <printf>
    close(pfds[1]);
     8b0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8b4:	eb000b91 	bl	3700 <close>
     8b8:	eafffffe 	b	8b8 <preempt+0x8c>
  close(pfds[1]);
     8bc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8c0:	eb000b8e 	bl	3700 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     8c4:	e3081044 	movw	r1, #32836	; 0x8044
     8c8:	e3a02a02 	mov	r2, #8192	; 0x2000
     8cc:	e3401000 	movt	r1, #0
     8d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8d4:	eb000b6f 	bl	3698 <read>
     8d8:	e3500001 	cmp	r0, #1
     8dc:	e1a04000 	mov	r4, r0
     8e0:	0a000005 	beq	8fc <preempt+0xd0>
    printf(1, "preempt read error");
     8e4:	e3041218 	movw	r1, #16920	; 0x4218
     8e8:	e3a00001 	mov	r0, #1
     8ec:	e3401000 	movt	r1, #0
     8f0:	eb000c88 	bl	3b18 <printf>
}
     8f4:	e24bd014 	sub	sp, fp, #20
     8f8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  close(pfds[0]);
     8fc:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     900:	eb000b7e 	bl	3700 <close>
  printf(1, "kill... ");
     904:	e1a00004 	mov	r0, r4
     908:	e304122c 	movw	r1, #16940	; 0x422c
     90c:	e3401000 	movt	r1, #0
     910:	eb000c80 	bl	3b18 <printf>
  kill(pid1);
     914:	e1a00007 	mov	r0, r7
     918:	eb000b85 	bl	3734 <kill>
  kill(pid2);
     91c:	e1a00006 	mov	r0, r6
     920:	eb000b83 	bl	3734 <kill>
  kill(pid3);
     924:	e1a00005 	mov	r0, r5
     928:	eb000b81 	bl	3734 <kill>
  printf(1, "wait... ");
     92c:	e1a00004 	mov	r0, r4
     930:	e3041238 	movw	r1, #16952	; 0x4238
     934:	e3401000 	movt	r1, #0
     938:	eb000c76 	bl	3b18 <printf>
  wait();
     93c:	eb000b21 	bl	35c8 <wait>
  wait();
     940:	eb000b20 	bl	35c8 <wait>
  wait();
     944:	eb000b1f 	bl	35c8 <wait>
  printf(1, "preempt ok\n");
     948:	e1a00004 	mov	r0, r4
     94c:	e3041244 	movw	r1, #16964	; 0x4244
     950:	e3401000 	movt	r1, #0
     954:	eb000c6f 	bl	3b18 <printf>
     958:	eaffffe5 	b	8f4 <preempt+0xc8>

0000095c <exitwait>:
{
     95c:	e92d4830 	push	{r4, r5, fp, lr}
     960:	e3a04064 	mov	r4, #100	; 0x64
     964:	e28db00c 	add	fp, sp, #12
     968:	ea000005 	b	984 <exitwait+0x28>
    if(pid){
     96c:	0a000019 	beq	9d8 <exitwait+0x7c>
      if(wait() != pid){
     970:	eb000b14 	bl	35c8 <wait>
     974:	e1500005 	cmp	r0, r5
     978:	1a00000a 	bne	9a8 <exitwait+0x4c>
  for(i = 0; i < 100; i++){
     97c:	e2544001 	subs	r4, r4, #1
     980:	0a00000e 	beq	9c0 <exitwait+0x64>
    pid = fork();
     984:	eb000af5 	bl	3560 <fork>
    if(pid < 0){
     988:	e2505000 	subs	r5, r0, #0
     98c:	aafffff6 	bge	96c <exitwait+0x10>
      printf(1, "fork failed\n");
     990:	e3051790 	movw	r1, #22416	; 0x5790
     994:	e3a00001 	mov	r0, #1
     998:	e3401000 	movt	r1, #0
}
     99c:	e24bd00c 	sub	sp, fp, #12
     9a0:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9a4:	ea000c5b 	b	3b18 <printf>
        printf(1, "wait wrong pid\n");
     9a8:	e3041250 	movw	r1, #16976	; 0x4250
     9ac:	e3a00001 	mov	r0, #1
     9b0:	e3401000 	movt	r1, #0
}
     9b4:	e24bd00c 	sub	sp, fp, #12
     9b8:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9bc:	ea000c55 	b	3b18 <printf>
     9c0:	e3041260 	movw	r1, #16992	; 0x4260
     9c4:	e3a00001 	mov	r0, #1
     9c8:	e3401000 	movt	r1, #0
}
     9cc:	e24bd00c 	sub	sp, fp, #12
     9d0:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9d4:	ea000c4f 	b	3b18 <printf>
      exit();
     9d8:	eb000aed 	bl	3594 <exit>

000009dc <mem>:
{
     9dc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "mem test\n");
     9e0:	e3a00001 	mov	r0, #1
{
     9e4:	e28db014 	add	fp, sp, #20
  printf(1, "mem test\n");
     9e8:	e3041270 	movw	r1, #17008	; 0x4270
     9ec:	e3401000 	movt	r1, #0
     9f0:	eb000c48 	bl	3b18 <printf>
  ppid = getpid();
     9f4:	eb000bd0 	bl	393c <getpid>
     9f8:	e1a06000 	mov	r6, r0
  if((pid = fork()) == 0){
     9fc:	eb000ad7 	bl	3560 <fork>
     a00:	e2504000 	subs	r4, r0, #0
     a04:	0a000002 	beq	a14 <mem+0x38>
     a08:	ea00001d 	b	a84 <mem+0xa8>
      *(char**)m2 = m1;
     a0c:	e5804000 	str	r4, [r0]
     a10:	e1a04000 	mov	r4, r0
    while((m2 = malloc(10001)) != 0){
     a14:	e3020711 	movw	r0, #10001	; 0x2711
     a18:	eb000ccd 	bl	3d54 <malloc>
     a1c:	e3500000 	cmp	r0, #0
     a20:	1afffff9 	bne	a0c <mem+0x30>
    while(m1){
     a24:	e3540000 	cmp	r4, #0
     a28:	0a000004 	beq	a40 <mem+0x64>
      m2 = *(char**)m1;
     a2c:	e5945000 	ldr	r5, [r4]
      free(m1);
     a30:	e1a00004 	mov	r0, r4
     a34:	eb000c9f 	bl	3cb8 <free>
    while(m1){
     a38:	e2554000 	subs	r4, r5, #0
     a3c:	1afffffa 	bne	a2c <mem+0x50>
    m1 = malloc(1024*20);
     a40:	e3a00a05 	mov	r0, #20480	; 0x5000
     a44:	eb000cc2 	bl	3d54 <malloc>
    if(m1 == 0){
     a48:	e3500000 	cmp	r0, #0
     a4c:	0a000005 	beq	a68 <mem+0x8c>
    free(m1);
     a50:	eb000c98 	bl	3cb8 <free>
    printf(1, "mem ok\n");
     a54:	e3041298 	movw	r1, #17048	; 0x4298
     a58:	e3a00001 	mov	r0, #1
     a5c:	e3401000 	movt	r1, #0
     a60:	eb000c2c 	bl	3b18 <printf>
    exit();
     a64:	eb000aca 	bl	3594 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     a68:	e3a00001 	mov	r0, #1
     a6c:	e304127c 	movw	r1, #17020	; 0x427c
     a70:	e3401000 	movt	r1, #0
     a74:	eb000c27 	bl	3b18 <printf>
      kill(ppid);
     a78:	e1a00006 	mov	r0, r6
     a7c:	eb000b2c 	bl	3734 <kill>
      exit();
     a80:	eb000ac3 	bl	3594 <exit>
}
     a84:	e24bd014 	sub	sp, fp, #20
     a88:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    wait();
     a8c:	ea000acd 	b	35c8 <wait>

00000a90 <sharedfd>:
{
     a90:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "sharedfd test\n");
     a94:	e3a00001 	mov	r0, #1
{
     a98:	e28db014 	add	fp, sp, #20
  printf(1, "sharedfd test\n");
     a9c:	e30412a0 	movw	r1, #17056	; 0x42a0
{
     aa0:	e24dd010 	sub	sp, sp, #16
  printf(1, "sharedfd test\n");
     aa4:	e3401000 	movt	r1, #0
     aa8:	eb000c1a 	bl	3b18 <printf>
  unlink("sharedfd");
     aac:	e30402b0 	movw	r0, #17072	; 0x42b0
     ab0:	e3400000 	movt	r0, #0
     ab4:	eb000b52 	bl	3804 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ab8:	e30402b0 	movw	r0, #17072	; 0x42b0
     abc:	e3001202 	movw	r1, #514	; 0x202
     ac0:	e3400000 	movt	r0, #0
     ac4:	eb000b34 	bl	379c <open>
  if(fd < 0){
     ac8:	e2505000 	subs	r5, r0, #0
     acc:	ba000042 	blt	bdc <sharedfd+0x14c>
  pid = fork();
     ad0:	eb000aa2 	bl	3560 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ad4:	e3a0200a 	mov	r2, #10
     ad8:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     adc:	e3500000 	cmp	r0, #0
     ae0:	e1a06000 	mov	r6, r0
     ae4:	e24b0020 	sub	r0, fp, #32
     ae8:	03a01063 	moveq	r1, #99	; 0x63
     aec:	13a01070 	movne	r1, #112	; 0x70
     af0:	eb000a2d 	bl	33ac <memset>
     af4:	ea000001 	b	b00 <sharedfd+0x70>
  for(i = 0; i < 1000; i++){
     af8:	e2544001 	subs	r4, r4, #1
     afc:	0a000009 	beq	b28 <sharedfd+0x98>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     b00:	e3a0200a 	mov	r2, #10
     b04:	e24b1020 	sub	r1, fp, #32
     b08:	e1a00005 	mov	r0, r5
     b0c:	eb000aee 	bl	36cc <write>
     b10:	e350000a 	cmp	r0, #10
     b14:	0afffff7 	beq	af8 <sharedfd+0x68>
      printf(1, "fstests: write sharedfd failed\n");
     b18:	e30412e8 	movw	r1, #17128	; 0x42e8
     b1c:	e3a00001 	mov	r0, #1
     b20:	e3401000 	movt	r1, #0
     b24:	eb000bfb 	bl	3b18 <printf>
  if(pid == 0)
     b28:	e3560000 	cmp	r6, #0
     b2c:	0a00003c 	beq	c24 <sharedfd+0x194>
    wait();
     b30:	eb000aa4 	bl	35c8 <wait>
  close(fd);
     b34:	e1a00005 	mov	r0, r5
     b38:	eb000af0 	bl	3700 <close>
  fd = open("sharedfd", 0);
     b3c:	e30402b0 	movw	r0, #17072	; 0x42b0
     b40:	e3a01000 	mov	r1, #0
     b44:	e3400000 	movt	r0, #0
     b48:	eb000b13 	bl	379c <open>
  if(fd < 0){
     b4c:	e2507000 	subs	r7, r0, #0
     b50:	a24b4016 	subge	r4, fp, #22
  nc = np = 0;
     b54:	a3a05000 	movge	r5, #0
     b58:	a1a06005 	movge	r6, r5
  if(fd < 0){
     b5c:	ba000024 	blt	bf4 <sharedfd+0x164>
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b60:	e3a0200a 	mov	r2, #10
     b64:	e24b1020 	sub	r1, fp, #32
     b68:	e1a00007 	mov	r0, r7
     b6c:	eb000ac9 	bl	3698 <read>
     b70:	e3500000 	cmp	r0, #0
     b74:	da000009 	ble	ba0 <sharedfd+0x110>
     b78:	e24b2020 	sub	r2, fp, #32
      if(buf[i] == 'c')
     b7c:	e4d21001 	ldrb	r1, [r2], #1
     b80:	e3510063 	cmp	r1, #99	; 0x63
        nc++;
     b84:	02866001 	addeq	r6, r6, #1
      if(buf[i] == 'c')
     b88:	0a000001 	beq	b94 <sharedfd+0x104>
      if(buf[i] == 'p')
     b8c:	e3510070 	cmp	r1, #112	; 0x70
        np++;
     b90:	02855001 	addeq	r5, r5, #1
    for(i = 0; i < sizeof(buf); i++){
     b94:	e1520004 	cmp	r2, r4
     b98:	1afffff7 	bne	b7c <sharedfd+0xec>
     b9c:	eaffffef 	b	b60 <sharedfd+0xd0>
  close(fd);
     ba0:	e1a00007 	mov	r0, r7
     ba4:	eb000ad5 	bl	3700 <close>
  unlink("sharedfd");
     ba8:	e30402b0 	movw	r0, #17072	; 0x42b0
     bac:	e3400000 	movt	r0, #0
     bb0:	eb000b13 	bl	3804 <unlink>
  if(nc == 10000 && np == 10000){
     bb4:	e3023710 	movw	r3, #10000	; 0x2710
     bb8:	e1560003 	cmp	r6, r3
     bbc:	01550003 	cmpeq	r5, r3
     bc0:	1a000011 	bne	c0c <sharedfd+0x17c>
    printf(1, "sharedfd ok\n");
     bc4:	e3a00001 	mov	r0, #1
     bc8:	e3041334 	movw	r1, #17204	; 0x4334
     bcc:	e3401000 	movt	r1, #0
     bd0:	eb000bd0 	bl	3b18 <printf>
}
     bd4:	e24bd014 	sub	sp, fp, #20
     bd8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for writing");
     bdc:	e3a00001 	mov	r0, #1
     be0:	e30412bc 	movw	r1, #17084	; 0x42bc
     be4:	e3401000 	movt	r1, #0
     be8:	eb000bca 	bl	3b18 <printf>
}
     bec:	e24bd014 	sub	sp, fp, #20
     bf0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for reading\n");
     bf4:	e3a00001 	mov	r0, #1
     bf8:	e3041308 	movw	r1, #17160	; 0x4308
     bfc:	e3401000 	movt	r1, #0
     c00:	eb000bc4 	bl	3b18 <printf>
}
     c04:	e24bd014 	sub	sp, fp, #20
     c08:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "sharedfd oops %d %d\n", nc, np);
     c0c:	e3041344 	movw	r1, #17220	; 0x4344
     c10:	e1a03005 	mov	r3, r5
     c14:	e1a02006 	mov	r2, r6
     c18:	e3a00001 	mov	r0, #1
     c1c:	e3401000 	movt	r1, #0
     c20:	eb000bbc 	bl	3b18 <printf>
    exit();
     c24:	eb000a5a 	bl	3594 <exit>

00000c28 <twofiles>:
{
     c28:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "twofiles test\n");
     c2c:	e3a00001 	mov	r0, #1
{
     c30:	e28db014 	add	fp, sp, #20
  printf(1, "twofiles test\n");
     c34:	e304135c 	movw	r1, #17244	; 0x435c
     c38:	e3401000 	movt	r1, #0
     c3c:	eb000bb5 	bl	3b18 <printf>
  unlink("f1");
     c40:	e304036c 	movw	r0, #17260	; 0x436c
     c44:	e3400000 	movt	r0, #0
     c48:	eb000aed 	bl	3804 <unlink>
  unlink("f2");
     c4c:	e3040370 	movw	r0, #17264	; 0x4370
     c50:	e3400000 	movt	r0, #0
     c54:	eb000aea 	bl	3804 <unlink>
  pid = fork();
     c58:	eb000a40 	bl	3560 <fork>
  if(pid < 0){
     c5c:	e2507000 	subs	r7, r0, #0
     c60:	ba00006e 	blt	e20 <twofiles+0x1f8>
  fname = pid ? "f1" : "f2";
     c64:	1a000060 	bne	dec <twofiles+0x1c4>
  fd = open(fname, O_CREATE | O_RDWR);
     c68:	e3001202 	movw	r1, #514	; 0x202
     c6c:	e3040370 	movw	r0, #17264	; 0x4370
     c70:	e3400000 	movt	r0, #0
     c74:	eb000ac8 	bl	379c <open>
  if(fd < 0){
     c78:	e2506000 	subs	r6, r0, #0
  memset(buf, pid?'p':'c', 512);
     c7c:	a3a01063 	movge	r1, #99	; 0x63
  if(fd < 0){
     c80:	ba000071 	blt	e4c <twofiles+0x224>
  memset(buf, pid?'p':'c', 512);
     c84:	e3080044 	movw	r0, #32836	; 0x8044
     c88:	e3a02c02 	mov	r2, #512	; 0x200
     c8c:	e3400000 	movt	r0, #0
    if((n = write(fd, buf, 500)) != 500){
     c90:	e3085044 	movw	r5, #32836	; 0x8044
  memset(buf, pid?'p':'c', 512);
     c94:	eb0009c4 	bl	33ac <memset>
    if((n = write(fd, buf, 500)) != 500){
     c98:	e3405000 	movt	r5, #0
  memset(buf, pid?'p':'c', 512);
     c9c:	e3a0400c 	mov	r4, #12
    if((n = write(fd, buf, 500)) != 500){
     ca0:	e3a02f7d 	mov	r2, #500	; 0x1f4
     ca4:	e1a01005 	mov	r1, r5
     ca8:	e1a00006 	mov	r0, r6
     cac:	eb000a86 	bl	36cc <write>
     cb0:	e3500f7d 	cmp	r0, #500	; 0x1f4
     cb4:	1a000069 	bne	e60 <twofiles+0x238>
  for(i = 0; i < 12; i++){
     cb8:	e2544001 	subs	r4, r4, #1
     cbc:	1afffff7 	bne	ca0 <twofiles+0x78>
  close(fd);
     cc0:	e1a00006 	mov	r0, r6
     cc4:	eb000a8d 	bl	3700 <close>
  if(pid)
     cc8:	e3570000 	cmp	r7, #0
     ccc:	0a000052 	beq	e1c <twofiles+0x1f4>
    wait();
     cd0:	eb000a3c 	bl	35c8 <wait>
    fd = open(i?"f1":"f2", 0);
     cd4:	e1a01004 	mov	r1, r4
     cd8:	e3040370 	movw	r0, #17264	; 0x4370
     cdc:	e3400000 	movt	r0, #0
     ce0:	eb000aad 	bl	379c <open>
     ce4:	e3085044 	movw	r5, #32836	; 0x8044
     ce8:	e3405000 	movt	r5, #0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     cec:	e1a07005 	mov	r7, r5
    fd = open(i?"f1":"f2", 0);
     cf0:	e1a06000 	mov	r6, r0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     cf4:	e3a02a02 	mov	r2, #8192	; 0x2000
     cf8:	e1a01007 	mov	r1, r7
     cfc:	e1a00006 	mov	r0, r6
     d00:	eb000a64 	bl	3698 <read>
     d04:	e3500000 	cmp	r0, #0
     d08:	da000009 	ble	d34 <twofiles+0x10c>
     d0c:	e3083044 	movw	r3, #32836	; 0x8044
     d10:	e0851000 	add	r1, r5, r0
     d14:	e3403000 	movt	r3, #0
        if(buf[j] != (i?'p':'c')){
     d18:	e4d32001 	ldrb	r2, [r3], #1
     d1c:	e3520063 	cmp	r2, #99	; 0x63
     d20:	1a000039 	bne	e0c <twofiles+0x1e4>
      for(j = 0; j < n; j++){
     d24:	e1510003 	cmp	r1, r3
     d28:	1afffffa 	bne	d18 <twofiles+0xf0>
      total += n;
     d2c:	e0844000 	add	r4, r4, r0
     d30:	eaffffef 	b	cf4 <twofiles+0xcc>
    close(fd);
     d34:	e1a00006 	mov	r0, r6
     d38:	eb000a70 	bl	3700 <close>
    if(total != 12*500){
     d3c:	e3013770 	movw	r3, #6000	; 0x1770
     d40:	e1540003 	cmp	r4, r3
     d44:	1a00003a 	bne	e34 <twofiles+0x20c>
    fd = open(i?"f1":"f2", 0);
     d48:	e304036c 	movw	r0, #17260	; 0x436c
     d4c:	e3a01000 	mov	r1, #0
     d50:	e3400000 	movt	r0, #0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d54:	e3086044 	movw	r6, #32836	; 0x8044
    fd = open(i?"f1":"f2", 0);
     d58:	eb000a8f 	bl	379c <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d5c:	e3406000 	movt	r6, #0
    total = 0;
     d60:	e3a04000 	mov	r4, #0
    fd = open(i?"f1":"f2", 0);
     d64:	e1a07000 	mov	r7, r0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d68:	e3a02a02 	mov	r2, #8192	; 0x2000
     d6c:	e1a01006 	mov	r1, r6
     d70:	e1a00007 	mov	r0, r7
     d74:	eb000a47 	bl	3698 <read>
     d78:	e3500000 	cmp	r0, #0
     d7c:	da000009 	ble	da8 <twofiles+0x180>
     d80:	e3083044 	movw	r3, #32836	; 0x8044
     d84:	e0851000 	add	r1, r5, r0
     d88:	e3403000 	movt	r3, #0
        if(buf[j] != (i?'p':'c')){
     d8c:	e4d32001 	ldrb	r2, [r3], #1
     d90:	e3520070 	cmp	r2, #112	; 0x70
     d94:	1a00001c 	bne	e0c <twofiles+0x1e4>
      for(j = 0; j < n; j++){
     d98:	e1510003 	cmp	r1, r3
     d9c:	1afffffa 	bne	d8c <twofiles+0x164>
      total += n;
     da0:	e0844000 	add	r4, r4, r0
     da4:	eaffffef 	b	d68 <twofiles+0x140>
    close(fd);
     da8:	e1a00007 	mov	r0, r7
     dac:	eb000a53 	bl	3700 <close>
    if(total != 12*500){
     db0:	e3013770 	movw	r3, #6000	; 0x1770
     db4:	e1540003 	cmp	r4, r3
     db8:	1a00001d 	bne	e34 <twofiles+0x20c>
  unlink("f1");
     dbc:	e304036c 	movw	r0, #17260	; 0x436c
     dc0:	e3400000 	movt	r0, #0
     dc4:	eb000a8e 	bl	3804 <unlink>
  unlink("f2");
     dc8:	e3040370 	movw	r0, #17264	; 0x4370
     dcc:	e3400000 	movt	r0, #0
     dd0:	eb000a8b 	bl	3804 <unlink>
  printf(1, "twofiles ok\n");
     dd4:	e3041398 	movw	r1, #17304	; 0x4398
     dd8:	e3a00001 	mov	r0, #1
     ddc:	e3401000 	movt	r1, #0
}
     de0:	e24bd014 	sub	sp, fp, #20
     de4:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "twofiles ok\n");
     de8:	ea000b4a 	b	3b18 <printf>
  fd = open(fname, O_CREATE | O_RDWR);
     dec:	e304036c 	movw	r0, #17260	; 0x436c
     df0:	e3001202 	movw	r1, #514	; 0x202
     df4:	e3400000 	movt	r0, #0
     df8:	eb000a67 	bl	379c <open>
  if(fd < 0){
     dfc:	e2506000 	subs	r6, r0, #0
     e00:	ba000011 	blt	e4c <twofiles+0x224>
  memset(buf, pid?'p':'c', 512);
     e04:	e3a01070 	mov	r1, #112	; 0x70
     e08:	eaffff9d 	b	c84 <twofiles+0x5c>
          printf(1, "wrong char\n");
     e0c:	e30413a8 	movw	r1, #17320	; 0x43a8
     e10:	e3a00001 	mov	r0, #1
     e14:	e3401000 	movt	r1, #0
     e18:	eb000b3e 	bl	3b18 <printf>
          exit();
     e1c:	eb0009dc 	bl	3594 <exit>
    printf(1, "fork failed\n");
     e20:	e3051790 	movw	r1, #22416	; 0x5790
     e24:	e3a00001 	mov	r0, #1
     e28:	e3401000 	movt	r1, #0
     e2c:	eb000b39 	bl	3b18 <printf>
    exit();
     e30:	eb0009d7 	bl	3594 <exit>
      printf(1, "wrong length %d\n", total);
     e34:	e1a02004 	mov	r2, r4
     e38:	e30413b4 	movw	r1, #17332	; 0x43b4
     e3c:	e3a00001 	mov	r0, #1
     e40:	e3401000 	movt	r1, #0
     e44:	eb000b33 	bl	3b18 <printf>
      exit();
     e48:	eb0009d1 	bl	3594 <exit>
    printf(1, "create failed\n");
     e4c:	e3041374 	movw	r1, #17268	; 0x4374
     e50:	e3a00001 	mov	r0, #1
     e54:	e3401000 	movt	r1, #0
     e58:	eb000b2e 	bl	3b18 <printf>
    exit();
     e5c:	eb0009cc 	bl	3594 <exit>
      printf(1, "write failed %d\n", n);
     e60:	e1a02000 	mov	r2, r0
     e64:	e3041384 	movw	r1, #17284	; 0x4384
     e68:	e3a00001 	mov	r0, #1
     e6c:	e3401000 	movt	r1, #0
     e70:	eb000b28 	bl	3b18 <printf>
      exit();
     e74:	eb0009c6 	bl	3594 <exit>

00000e78 <createdelete>:
{
     e78:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  printf(1, "createdelete test\n");
     e7c:	e3a00001 	mov	r0, #1
{
     e80:	e28db018 	add	fp, sp, #24
  printf(1, "createdelete test\n");
     e84:	e30413c8 	movw	r1, #17352	; 0x43c8
{
     e88:	e24dd02c 	sub	sp, sp, #44	; 0x2c
  printf(1, "createdelete test\n");
     e8c:	e3401000 	movt	r1, #0
     e90:	eb000b20 	bl	3b18 <printf>
  pid = fork();
     e94:	eb0009b1 	bl	3560 <fork>
  if(pid < 0){
     e98:	e2506000 	subs	r6, r0, #0
     e9c:	ba00007a 	blt	108c <createdelete+0x214>
  name[0] = pid ? 'p' : 'c';
     ea0:	03a03063 	moveq	r3, #99	; 0x63
     ea4:	13a03070 	movne	r3, #112	; 0x70
  name[2] = '\0';
     ea8:	e3a04000 	mov	r4, #0
  name[0] = pid ? 'p' : 'c';
     eac:	e54b303c 	strb	r3, [fp, #-60]	; 0xffffffc4
  name[2] = '\0';
     eb0:	e54b403a 	strb	r4, [fp, #-58]	; 0xffffffc6
     eb4:	e3a05001 	mov	r5, #1
     eb8:	ea000003 	b	ecc <createdelete+0x54>
  for(i = 0; i < N; i++){
     ebc:	e3550014 	cmp	r5, #20
     ec0:	0a000019 	beq	f2c <createdelete+0xb4>
     ec4:	e2844001 	add	r4, r4, #1
     ec8:	e2855001 	add	r5, r5, #1
    fd = open(name, O_CREATE | O_RDWR);
     ecc:	e3001202 	movw	r1, #514	; 0x202
     ed0:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[1] = '0' + i;
     ed4:	e2843030 	add	r3, r4, #48	; 0x30
     ed8:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
    fd = open(name, O_CREATE | O_RDWR);
     edc:	eb000a2e 	bl	379c <open>
    if(fd < 0){
     ee0:	e3500000 	cmp	r0, #0
     ee4:	ba000059 	blt	1050 <createdelete+0x1d8>
    close(fd);
     ee8:	eb000a04 	bl	3700 <close>
    if(i > 0 && (i % 2 ) == 0){
     eec:	e3540000 	cmp	r4, #0
     ef0:	0afffff3 	beq	ec4 <createdelete+0x4c>
     ef4:	e3140001 	tst	r4, #1
     ef8:	1affffef 	bne	ebc <createdelete+0x44>
      name[1] = '0' + (i / 2);
     efc:	e1a030c4 	asr	r3, r4, #1
      if(unlink(name) < 0){
     f00:	e24b003c 	sub	r0, fp, #60	; 0x3c
      name[1] = '0' + (i / 2);
     f04:	e2833030 	add	r3, r3, #48	; 0x30
     f08:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
      if(unlink(name) < 0){
     f0c:	eb000a3c 	bl	3804 <unlink>
     f10:	e3500000 	cmp	r0, #0
     f14:	aaffffe8 	bge	ebc <createdelete+0x44>
        printf(1, "unlink failed\n");
     f18:	e30413dc 	movw	r1, #17372	; 0x43dc
     f1c:	e3a00001 	mov	r0, #1
     f20:	e3401000 	movt	r1, #0
     f24:	eb000afb 	bl	3b18 <printf>
        exit();
     f28:	eb000999 	bl	3594 <exit>
  if(pid==0)
     f2c:	e3560000 	cmp	r6, #0
     f30:	0a000050 	beq	1078 <createdelete+0x200>
    wait();
     f34:	eb0009a3 	bl	35c8 <wait>
     f38:	e3e06000 	mvn	r6, #0
  for(i = 0; i < N; i++){
     f3c:	e3a05000 	mov	r5, #0
    name[0] = 'p';
     f40:	e3a08070 	mov	r8, #112	; 0x70
    name[0] = 'c';
     f44:	e3a07063 	mov	r7, #99	; 0x63
     f48:	ea000010 	b	f90 <createdelete+0x118>
    if((i == 0 || i >= N/2) && fd < 0){
     f4c:	e3500000 	cmp	r0, #0
     f50:	ba000043 	blt	1064 <createdelete+0x1ec>
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f54:	e3560008 	cmp	r6, #8
     f58:	9a000058 	bls	10c0 <createdelete+0x248>
      close(fd);
     f5c:	eb0009e7 	bl	3700 <close>
    fd = open(name, 0);
     f60:	e3a01000 	mov	r1, #0
     f64:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
     f68:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
     f6c:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     f70:	eb000a09 	bl	379c <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f74:	e3500000 	cmp	r0, #0
     f78:	ba000039 	blt	1064 <createdelete+0x1ec>
      close(fd);
     f7c:	eb0009df 	bl	3700 <close>
  for(i = 0; i < N; i++){
     f80:	e2855001 	add	r5, r5, #1
     f84:	e2866001 	add	r6, r6, #1
     f88:	e3550014 	cmp	r5, #20
     f8c:	0a00001b 	beq	1000 <createdelete+0x188>
     f90:	e2854030 	add	r4, r5, #48	; 0x30
    fd = open(name, 0);
     f94:	e3a01000 	mov	r1, #0
     f98:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'p';
     f9c:	e54b803c 	strb	r8, [fp, #-60]	; 0xffffffc4
     fa0:	e6ef4074 	uxtb	r4, r4
    name[1] = '0' + i;
     fa4:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     fa8:	eb0009fb 	bl	379c <open>
    if((i == 0 || i >= N/2) && fd < 0){
     fac:	e3550009 	cmp	r5, #9
     fb0:	d3a01000 	movle	r1, #0
     fb4:	c3a01001 	movgt	r1, #1
     fb8:	e3550000 	cmp	r5, #0
     fbc:	03a01001 	moveq	r1, #1
     fc0:	e3510000 	cmp	r1, #0
     fc4:	1affffe0 	bne	f4c <createdelete+0xd4>
    } else if((i >= 1 && i < N/2) && fd >= 0){
     fc8:	e3560008 	cmp	r6, #8
     fcc:	9a000033 	bls	10a0 <createdelete+0x228>
    if(fd >= 0)
     fd0:	e3500000 	cmp	r0, #0
     fd4:	aa000028 	bge	107c <createdelete+0x204>
    fd = open(name, 0);
     fd8:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
     fdc:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
     fe0:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     fe4:	eb0009ec 	bl	379c <open>
    if(fd >= 0)
     fe8:	e3500000 	cmp	r0, #0
     fec:	aaffffe2 	bge	f7c <createdelete+0x104>
  for(i = 0; i < N; i++){
     ff0:	e2855001 	add	r5, r5, #1
     ff4:	e2866001 	add	r6, r6, #1
     ff8:	e3550014 	cmp	r5, #20
     ffc:	1affffe3 	bne	f90 <createdelete+0x118>
    1000:	e3a04030 	mov	r4, #48	; 0x30
    name[0] = 'p';
    1004:	e3a06070 	mov	r6, #112	; 0x70
    name[0] = 'c';
    1008:	e3a05063 	mov	r5, #99	; 0x63
    name[1] = '0' + i;
    100c:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
    1010:	e2844001 	add	r4, r4, #1
    unlink(name);
    1014:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'p';
    1018:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    101c:	e6ef4074 	uxtb	r4, r4
    unlink(name);
    1020:	eb0009f7 	bl	3804 <unlink>
    unlink(name);
    1024:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
    1028:	e54b503c 	strb	r5, [fp, #-60]	; 0xffffffc4
    unlink(name);
    102c:	eb0009f4 	bl	3804 <unlink>
  for(i = 0; i < N; i++){
    1030:	e3540044 	cmp	r4, #68	; 0x44
    1034:	1afffff4 	bne	100c <createdelete+0x194>
  printf(1, "createdelete ok\n");
    1038:	e3a00001 	mov	r0, #1
    103c:	e3041430 	movw	r1, #17456	; 0x4430
    1040:	e3401000 	movt	r1, #0
    1044:	eb000ab3 	bl	3b18 <printf>
}
    1048:	e24bd018 	sub	sp, fp, #24
    104c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "create failed\n");
    1050:	e3041374 	movw	r1, #17268	; 0x4374
    1054:	e3a00001 	mov	r0, #1
    1058:	e3401000 	movt	r1, #0
    105c:	eb000aad 	bl	3b18 <printf>
      exit();
    1060:	eb00094b 	bl	3594 <exit>
      printf(1, "oops createdelete %s didn't exist\n", name);
    1064:	e30413ec 	movw	r1, #17388	; 0x43ec
    1068:	e24b203c 	sub	r2, fp, #60	; 0x3c
    106c:	e3a00001 	mov	r0, #1
    1070:	e3401000 	movt	r1, #0
    1074:	eb000aa7 	bl	3b18 <printf>
      exit();
    1078:	eb000945 	bl	3594 <exit>
    107c:	e50b1040 	str	r1, [fp, #-64]	; 0xffffffc0
      close(fd);
    1080:	eb00099e 	bl	3700 <close>
    fd = open(name, 0);
    1084:	e51b1040 	ldr	r1, [fp, #-64]	; 0xffffffc0
    1088:	eaffffd2 	b	fd8 <createdelete+0x160>
    printf(1, "fork failed\n");
    108c:	e3051790 	movw	r1, #22416	; 0x5790
    1090:	e3a00001 	mov	r0, #1
    1094:	e3401000 	movt	r1, #0
    1098:	eb000a9e 	bl	3b18 <printf>
    exit();
    109c:	eb00093c 	bl	3594 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    10a0:	e3500000 	cmp	r0, #0
    10a4:	aa000005 	bge	10c0 <createdelete+0x248>
    fd = open(name, 0);
    10a8:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
    10ac:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
    10b0:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
    10b4:	eb0009b8 	bl	379c <open>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    10b8:	e3500000 	cmp	r0, #0
    10bc:	baffffaf 	blt	f80 <createdelete+0x108>
      printf(1, "oops createdelete %s did exist\n", name);
    10c0:	e24b203c 	sub	r2, fp, #60	; 0x3c
    10c4:	e3041410 	movw	r1, #17424	; 0x4410
    10c8:	e3a00001 	mov	r0, #1
    10cc:	e3401000 	movt	r1, #0
    10d0:	eb000a90 	bl	3b18 <printf>
      exit();
    10d4:	eb00092e 	bl	3594 <exit>

000010d8 <unlinkread>:
{
    10d8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread test\n");
    10dc:	e3a00001 	mov	r0, #1
{
    10e0:	e28db014 	add	fp, sp, #20
  printf(1, "unlinkread test\n");
    10e4:	e3041444 	movw	r1, #17476	; 0x4444
    10e8:	e3401000 	movt	r1, #0
    10ec:	eb000a89 	bl	3b18 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    10f0:	e3040458 	movw	r0, #17496	; 0x4458
    10f4:	e3001202 	movw	r1, #514	; 0x202
    10f8:	e3400000 	movt	r0, #0
    10fc:	eb0009a6 	bl	379c <open>
  if(fd < 0){
    1100:	e2504000 	subs	r4, r0, #0
    1104:	ba000037 	blt	11e8 <unlinkread+0x110>
  write(fd, "hello", 5);
    1108:	e3a02005 	mov	r2, #5
    110c:	e3041480 	movw	r1, #17536	; 0x4480
    1110:	e3401000 	movt	r1, #0
    1114:	eb00096c 	bl	36cc <write>
  close(fd);
    1118:	e1a00004 	mov	r0, r4
    111c:	eb000977 	bl	3700 <close>
  fd = open("unlinkread", O_RDWR);
    1120:	e3040458 	movw	r0, #17496	; 0x4458
    1124:	e3a01002 	mov	r1, #2
    1128:	e3400000 	movt	r0, #0
    112c:	eb00099a 	bl	379c <open>
  if(fd < 0){
    1130:	e2505000 	subs	r5, r0, #0
    1134:	ba000044 	blt	124c <unlinkread+0x174>
  if(unlink("unlinkread") != 0){
    1138:	e3040458 	movw	r0, #17496	; 0x4458
    113c:	e3400000 	movt	r0, #0
    1140:	eb0009af 	bl	3804 <unlink>
    1144:	e3500000 	cmp	r0, #0
    1148:	1a00003a 	bne	1238 <unlinkread+0x160>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    114c:	e3001202 	movw	r1, #514	; 0x202
    1150:	e3040458 	movw	r0, #17496	; 0x4458
    1154:	e3400000 	movt	r0, #0
  if(read(fd, buf, sizeof(buf)) != 5){
    1158:	e3084044 	movw	r4, #32836	; 0x8044
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    115c:	eb00098e 	bl	379c <open>
  if(read(fd, buf, sizeof(buf)) != 5){
    1160:	e3404000 	movt	r4, #0
  write(fd1, "yyy", 3);
    1164:	e3a02003 	mov	r2, #3
    1168:	e30414bc 	movw	r1, #17596	; 0x44bc
    116c:	e3401000 	movt	r1, #0
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1170:	e1a06000 	mov	r6, r0
  write(fd1, "yyy", 3);
    1174:	eb000954 	bl	36cc <write>
  close(fd1);
    1178:	e1a00006 	mov	r0, r6
    117c:	eb00095f 	bl	3700 <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1180:	e1a01004 	mov	r1, r4
    1184:	e3a02a02 	mov	r2, #8192	; 0x2000
    1188:	e1a00005 	mov	r0, r5
    118c:	eb000941 	bl	3698 <read>
    1190:	e3500005 	cmp	r0, #5
    1194:	1a000022 	bne	1224 <unlinkread+0x14c>
  if(buf[0] != 'h'){
    1198:	e5d43000 	ldrb	r3, [r4]
    119c:	e3530068 	cmp	r3, #104	; 0x68
    11a0:	1a00001a 	bne	1210 <unlinkread+0x138>
  if(write(fd, buf, 10) != 10){
    11a4:	e1a01004 	mov	r1, r4
    11a8:	e3a0200a 	mov	r2, #10
    11ac:	e1a00005 	mov	r0, r5
    11b0:	eb000945 	bl	36cc <write>
    11b4:	e350000a 	cmp	r0, #10
    11b8:	1a00000f 	bne	11fc <unlinkread+0x124>
  close(fd);
    11bc:	e1a00005 	mov	r0, r5
    11c0:	eb00094e 	bl	3700 <close>
  unlink("unlinkread");
    11c4:	e3040458 	movw	r0, #17496	; 0x4458
    11c8:	e3400000 	movt	r0, #0
    11cc:	eb00098c 	bl	3804 <unlink>
  printf(1, "unlinkread ok\n");
    11d0:	e304150c 	movw	r1, #17676	; 0x450c
    11d4:	e3a00001 	mov	r0, #1
    11d8:	e3401000 	movt	r1, #0
}
    11dc:	e24bd014 	sub	sp, fp, #20
    11e0:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread ok\n");
    11e4:	ea000a4b 	b	3b18 <printf>
    printf(1, "create unlinkread failed\n");
    11e8:	e3041464 	movw	r1, #17508	; 0x4464
    11ec:	e3a00001 	mov	r0, #1
    11f0:	e3401000 	movt	r1, #0
    11f4:	eb000a47 	bl	3b18 <printf>
    exit();
    11f8:	eb0008e5 	bl	3594 <exit>
    printf(1, "unlinkread write failed\n");
    11fc:	e30414f0 	movw	r1, #17648	; 0x44f0
    1200:	e3a00001 	mov	r0, #1
    1204:	e3401000 	movt	r1, #0
    1208:	eb000a42 	bl	3b18 <printf>
    exit();
    120c:	eb0008e0 	bl	3594 <exit>
    printf(1, "unlinkread wrong data\n");
    1210:	e30414d8 	movw	r1, #17624	; 0x44d8
    1214:	e3a00001 	mov	r0, #1
    1218:	e3401000 	movt	r1, #0
    121c:	eb000a3d 	bl	3b18 <printf>
    exit();
    1220:	eb0008db 	bl	3594 <exit>
    printf(1, "unlinkread read failed");
    1224:	e30414c0 	movw	r1, #17600	; 0x44c0
    1228:	e3a00001 	mov	r0, #1
    122c:	e3401000 	movt	r1, #0
    1230:	eb000a38 	bl	3b18 <printf>
    exit();
    1234:	eb0008d6 	bl	3594 <exit>
    printf(1, "unlink unlinkread failed\n");
    1238:	e30414a0 	movw	r1, #17568	; 0x44a0
    123c:	e3a00001 	mov	r0, #1
    1240:	e3401000 	movt	r1, #0
    1244:	eb000a33 	bl	3b18 <printf>
    exit();
    1248:	eb0008d1 	bl	3594 <exit>
    printf(1, "open unlinkread failed\n");
    124c:	e3041488 	movw	r1, #17544	; 0x4488
    1250:	e3a00001 	mov	r0, #1
    1254:	e3401000 	movt	r1, #0
    1258:	eb000a2e 	bl	3b18 <printf>
    exit();
    125c:	eb0008cc 	bl	3594 <exit>

00001260 <linktest>:
{
    1260:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "linktest\n");
    1264:	e3a00001 	mov	r0, #1
{
    1268:	e28db00c 	add	fp, sp, #12
  printf(1, "linktest\n");
    126c:	e304151c 	movw	r1, #17692	; 0x451c
    1270:	e3401000 	movt	r1, #0
    1274:	eb000a27 	bl	3b18 <printf>
  unlink("lf1");
    1278:	e3040528 	movw	r0, #17704	; 0x4528
    127c:	e3400000 	movt	r0, #0
    1280:	eb00095f 	bl	3804 <unlink>
  unlink("lf2");
    1284:	e304052c 	movw	r0, #17708	; 0x452c
    1288:	e3400000 	movt	r0, #0
    128c:	eb00095c 	bl	3804 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1290:	e3040528 	movw	r0, #17704	; 0x4528
    1294:	e3001202 	movw	r1, #514	; 0x202
    1298:	e3400000 	movt	r0, #0
    129c:	eb00093e 	bl	379c <open>
  if(fd < 0){
    12a0:	e2504000 	subs	r4, r0, #0
    12a4:	ba000042 	blt	13b4 <linktest+0x154>
  if(write(fd, "hello", 5) != 5){
    12a8:	e3041480 	movw	r1, #17536	; 0x4480
    12ac:	e3a02005 	mov	r2, #5
    12b0:	e3401000 	movt	r1, #0
    12b4:	eb000904 	bl	36cc <write>
    12b8:	e3500005 	cmp	r0, #5
    12bc:	1a000064 	bne	1454 <linktest+0x1f4>
  close(fd);
    12c0:	e1a00004 	mov	r0, r4
    12c4:	eb00090d 	bl	3700 <close>
  if(link("lf1", "lf2") < 0){
    12c8:	e304152c 	movw	r1, #17708	; 0x452c
    12cc:	e3040528 	movw	r0, #17704	; 0x4528
    12d0:	e3401000 	movt	r1, #0
    12d4:	e3400000 	movt	r0, #0
    12d8:	eb000963 	bl	386c <link>
    12dc:	e3500000 	cmp	r0, #0
    12e0:	ba000056 	blt	1440 <linktest+0x1e0>
  unlink("lf1");
    12e4:	e3040528 	movw	r0, #17704	; 0x4528
    12e8:	e3400000 	movt	r0, #0
    12ec:	eb000944 	bl	3804 <unlink>
  if(open("lf1", 0) >= 0){
    12f0:	e3040528 	movw	r0, #17704	; 0x4528
    12f4:	e3a01000 	mov	r1, #0
    12f8:	e3400000 	movt	r0, #0
    12fc:	eb000926 	bl	379c <open>
    1300:	e3500000 	cmp	r0, #0
    1304:	aa000048 	bge	142c <linktest+0x1cc>
  fd = open("lf2", 0);
    1308:	e304052c 	movw	r0, #17708	; 0x452c
    130c:	e3a01000 	mov	r1, #0
    1310:	e3400000 	movt	r0, #0
    1314:	eb000920 	bl	379c <open>
  if(fd < 0){
    1318:	e2504000 	subs	r4, r0, #0
    131c:	ba00003d 	blt	1418 <linktest+0x1b8>
  if(read(fd, buf, sizeof(buf)) != 5){
    1320:	e3081044 	movw	r1, #32836	; 0x8044
    1324:	e3a02a02 	mov	r2, #8192	; 0x2000
    1328:	e3401000 	movt	r1, #0
    132c:	eb0008d9 	bl	3698 <read>
    1330:	e3500005 	cmp	r0, #5
    1334:	1a000032 	bne	1404 <linktest+0x1a4>
  close(fd);
    1338:	e1a00004 	mov	r0, r4
    133c:	eb0008ef 	bl	3700 <close>
  if(link("lf2", "lf2") >= 0){
    1340:	e304152c 	movw	r1, #17708	; 0x452c
    1344:	e3401000 	movt	r1, #0
    1348:	e1a00001 	mov	r0, r1
    134c:	eb000946 	bl	386c <link>
    1350:	e3500000 	cmp	r0, #0
    1354:	aa000025 	bge	13f0 <linktest+0x190>
  unlink("lf2");
    1358:	e304052c 	movw	r0, #17708	; 0x452c
    135c:	e3400000 	movt	r0, #0
    1360:	eb000927 	bl	3804 <unlink>
  if(link("lf2", "lf1") >= 0){
    1364:	e3041528 	movw	r1, #17704	; 0x4528
    1368:	e304052c 	movw	r0, #17708	; 0x452c
    136c:	e3401000 	movt	r1, #0
    1370:	e3400000 	movt	r0, #0
    1374:	eb00093c 	bl	386c <link>
    1378:	e3500000 	cmp	r0, #0
    137c:	aa000016 	bge	13dc <linktest+0x17c>
  if(link(".", "lf1") >= 0){
    1380:	e3041528 	movw	r1, #17704	; 0x4528
    1384:	e3040604 	movw	r0, #17924	; 0x4604
    1388:	e3401000 	movt	r1, #0
    138c:	e3400000 	movt	r0, #0
    1390:	eb000935 	bl	386c <link>
    1394:	e3500000 	cmp	r0, #0
    1398:	aa00000a 	bge	13c8 <linktest+0x168>
  printf(1, "linktest ok\n");
    139c:	e3041624 	movw	r1, #17956	; 0x4624
    13a0:	e3a00001 	mov	r0, #1
    13a4:	e3401000 	movt	r1, #0
}
    13a8:	e24bd00c 	sub	sp, fp, #12
    13ac:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "linktest ok\n");
    13b0:	ea0009d8 	b	3b18 <printf>
    printf(1, "create lf1 failed\n");
    13b4:	e3041530 	movw	r1, #17712	; 0x4530
    13b8:	e3a00001 	mov	r0, #1
    13bc:	e3401000 	movt	r1, #0
    13c0:	eb0009d4 	bl	3b18 <printf>
    exit();
    13c4:	eb000872 	bl	3594 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    13c8:	e3041608 	movw	r1, #17928	; 0x4608
    13cc:	e3a00001 	mov	r0, #1
    13d0:	e3401000 	movt	r1, #0
    13d4:	eb0009cf 	bl	3b18 <printf>
    exit();
    13d8:	eb00086d 	bl	3594 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    13dc:	e30415e0 	movw	r1, #17888	; 0x45e0
    13e0:	e3a00001 	mov	r0, #1
    13e4:	e3401000 	movt	r1, #0
    13e8:	eb0009ca 	bl	3b18 <printf>
    exit();
    13ec:	eb000868 	bl	3594 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    13f0:	e30415c0 	movw	r1, #17856	; 0x45c0
    13f4:	e3a00001 	mov	r0, #1
    13f8:	e3401000 	movt	r1, #0
    13fc:	eb0009c5 	bl	3b18 <printf>
    exit();
    1400:	eb000863 	bl	3594 <exit>
    printf(1, "read lf2 failed\n");
    1404:	e30415ac 	movw	r1, #17836	; 0x45ac
    1408:	e3a00001 	mov	r0, #1
    140c:	e3401000 	movt	r1, #0
    1410:	eb0009c0 	bl	3b18 <printf>
    exit();
    1414:	eb00085e 	bl	3594 <exit>
    printf(1, "open lf2 failed\n");
    1418:	e3041598 	movw	r1, #17816	; 0x4598
    141c:	e3a00001 	mov	r0, #1
    1420:	e3401000 	movt	r1, #0
    1424:	eb0009bb 	bl	3b18 <printf>
    exit();
    1428:	eb000859 	bl	3594 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    142c:	e3041570 	movw	r1, #17776	; 0x4570
    1430:	e3a00001 	mov	r0, #1
    1434:	e3401000 	movt	r1, #0
    1438:	eb0009b6 	bl	3b18 <printf>
    exit();
    143c:	eb000854 	bl	3594 <exit>
    printf(1, "link lf1 lf2 failed\n");
    1440:	e3041558 	movw	r1, #17752	; 0x4558
    1444:	e3a00001 	mov	r0, #1
    1448:	e3401000 	movt	r1, #0
    144c:	eb0009b1 	bl	3b18 <printf>
    exit();
    1450:	eb00084f 	bl	3594 <exit>
    printf(1, "write lf1 failed\n");
    1454:	e3041544 	movw	r1, #17732	; 0x4544
    1458:	e3a00001 	mov	r0, #1
    145c:	e3401000 	movt	r1, #0
    1460:	eb0009ac 	bl	3b18 <printf>
    exit();
    1464:	eb00084a 	bl	3594 <exit>

00001468 <concreate>:
{
    1468:	e92d4870 	push	{r4, r5, r6, fp, lr}
  printf(1, "concreate test\n");
    146c:	e3041634 	movw	r1, #17972	; 0x4634
{
    1470:	e28db010 	add	fp, sp, #16
  printf(1, "concreate test\n");
    1474:	e3a00001 	mov	r0, #1
{
    1478:	e24dd044 	sub	sp, sp, #68	; 0x44
  printf(1, "concreate test\n");
    147c:	e3401000 	movt	r1, #0
    if(pid && (i % 3) == 1){
    1480:	e30a5aab 	movw	r5, #43691	; 0xaaab
  printf(1, "concreate test\n");
    1484:	eb0009a3 	bl	3b18 <printf>
  file[2] = '\0';
    1488:	e3a03000 	mov	r3, #0
      link("C0", file);
    148c:	e3046644 	movw	r6, #17988	; 0x4644
  for(i = 0; i < 40; i++){
    1490:	e1a04003 	mov	r4, r3
  file[2] = '\0';
    1494:	e54b304e 	strb	r3, [fp, #-78]	; 0xffffffb2
    if(pid && (i % 3) == 1){
    1498:	e34a5aaa 	movt	r5, #43690	; 0xaaaa
  file[0] = 'C';
    149c:	e3a03043 	mov	r3, #67	; 0x43
      link("C0", file);
    14a0:	e3406000 	movt	r6, #0
  file[0] = 'C';
    14a4:	e54b3050 	strb	r3, [fp, #-80]	; 0xffffffb0
    14a8:	ea00000f 	b	14ec <concreate+0x84>
    if(pid && (i % 3) == 1){
    14ac:	e0832594 	umull	r2, r3, r4, r5
    14b0:	e1a030a3 	lsr	r3, r3, #1
    14b4:	e0833083 	add	r3, r3, r3, lsl #1
    14b8:	e0443003 	sub	r3, r4, r3
    14bc:	e3530001 	cmp	r3, #1
    14c0:	0a000028 	beq	1568 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    14c4:	e3001202 	movw	r1, #514	; 0x202
    14c8:	e24b0050 	sub	r0, fp, #80	; 0x50
    14cc:	eb0008b2 	bl	379c <open>
      if(fd < 0){
    14d0:	e3500000 	cmp	r0, #0
    14d4:	ba000018 	blt	153c <concreate+0xd4>
  for(i = 0; i < 40; i++){
    14d8:	e2844001 	add	r4, r4, #1
      close(fd);
    14dc:	eb000887 	bl	3700 <close>
      wait();
    14e0:	eb000838 	bl	35c8 <wait>
  for(i = 0; i < 40; i++){
    14e4:	e3540028 	cmp	r4, #40	; 0x28
    14e8:	0a000025 	beq	1584 <concreate+0x11c>
    unlink(file);
    14ec:	e24b0050 	sub	r0, fp, #80	; 0x50
    file[1] = '0' + i;
    14f0:	e2843030 	add	r3, r4, #48	; 0x30
    14f4:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    unlink(file);
    14f8:	eb0008c1 	bl	3804 <unlink>
    pid = fork();
    14fc:	eb000817 	bl	3560 <fork>
    if(pid && (i % 3) == 1){
    1500:	e3500000 	cmp	r0, #0
    1504:	1affffe8 	bne	14ac <concreate+0x44>
    } else if(pid == 0 && (i % 5) == 1){
    1508:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    150c:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    1510:	e0832294 	umull	r2, r3, r4, r2
    1514:	e1a02123 	lsr	r2, r3, #2
    1518:	e0822102 	add	r2, r2, r2, lsl #2
    151c:	e0444002 	sub	r4, r4, r2
    1520:	e3540001 	cmp	r4, #1
    1524:	0a00000a 	beq	1554 <concreate+0xec>
      fd = open(file, O_CREATE | O_RDWR);
    1528:	e3001202 	movw	r1, #514	; 0x202
    152c:	e24b0050 	sub	r0, fp, #80	; 0x50
    1530:	eb000899 	bl	379c <open>
      if(fd < 0){
    1534:	e3500000 	cmp	r0, #0
    1538:	aa00008c 	bge	1770 <concreate+0x308>
        printf(1, "concreate create %s failed\n", file);
    153c:	e24b2050 	sub	r2, fp, #80	; 0x50
    1540:	e3041648 	movw	r1, #17992	; 0x4648
    1544:	e3a00001 	mov	r0, #1
    1548:	e3401000 	movt	r1, #0
    154c:	eb000971 	bl	3b18 <printf>
        exit();
    1550:	eb00080f 	bl	3594 <exit>
      link("C0", file);
    1554:	e3040644 	movw	r0, #17988	; 0x4644
    1558:	e24b1050 	sub	r1, fp, #80	; 0x50
    155c:	e3400000 	movt	r0, #0
    1560:	eb0008c1 	bl	386c <link>
        exit();
    1564:	eb00080a 	bl	3594 <exit>
      link("C0", file);
    1568:	e24b1050 	sub	r1, fp, #80	; 0x50
    156c:	e1a00006 	mov	r0, r6
  for(i = 0; i < 40; i++){
    1570:	e2844001 	add	r4, r4, #1
      link("C0", file);
    1574:	eb0008bc 	bl	386c <link>
      wait();
    1578:	eb000812 	bl	35c8 <wait>
  for(i = 0; i < 40; i++){
    157c:	e3540028 	cmp	r4, #40	; 0x28
    1580:	1affffd9 	bne	14ec <concreate+0x84>
  memset(fa, 0, sizeof(fa));
    1584:	e3a01000 	mov	r1, #0
    1588:	e1a02004 	mov	r2, r4
  n = 0;
    158c:	e1a05001 	mov	r5, r1
  memset(fa, 0, sizeof(fa));
    1590:	e24b003c 	sub	r0, fp, #60	; 0x3c
    1594:	eb000784 	bl	33ac <memset>
  fd = open(".", 0);
    1598:	e3040604 	movw	r0, #17924	; 0x4604
    159c:	e1a01005 	mov	r1, r5
    15a0:	e3400000 	movt	r0, #0
    15a4:	eb00087c 	bl	379c <open>
      fa[i] = 1;
    15a8:	e3a06001 	mov	r6, #1
  fd = open(".", 0);
    15ac:	e1a04000 	mov	r4, r0
  while(read(fd, &de, sizeof(de)) > 0){
    15b0:	e3a02010 	mov	r2, #16
    15b4:	e24b104c 	sub	r1, fp, #76	; 0x4c
    15b8:	e1a00004 	mov	r0, r4
    15bc:	eb000835 	bl	3698 <read>
    15c0:	e3500000 	cmp	r0, #0
    15c4:	da000014 	ble	161c <concreate+0x1b4>
    if(de.inum == 0)
    15c8:	e15b34bc 	ldrh	r3, [fp, #-76]	; 0xffffffb4
    15cc:	e3530000 	cmp	r3, #0
    15d0:	0afffff6 	beq	15b0 <concreate+0x148>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    15d4:	e55b304a 	ldrb	r3, [fp, #-74]	; 0xffffffb6
    15d8:	e3530043 	cmp	r3, #67	; 0x43
    15dc:	1afffff3 	bne	15b0 <concreate+0x148>
    15e0:	e55b3048 	ldrb	r3, [fp, #-72]	; 0xffffffb8
    15e4:	e3530000 	cmp	r3, #0
    15e8:	1afffff0 	bne	15b0 <concreate+0x148>
      i = de.name[1] - '0';
    15ec:	e55b3049 	ldrb	r3, [fp, #-73]	; 0xffffffb7
    15f0:	e2433030 	sub	r3, r3, #48	; 0x30
      if(i < 0 || i >= sizeof(fa)){
    15f4:	e3530027 	cmp	r3, #39	; 0x27
    15f8:	8a000056 	bhi	1758 <concreate+0x2f0>
      if(fa[i]){
    15fc:	e24b2014 	sub	r2, fp, #20
    1600:	e0823003 	add	r3, r2, r3
    1604:	e5532028 	ldrb	r2, [r3, #-40]	; 0xffffffd8
    1608:	e3520000 	cmp	r2, #0
    160c:	1a00004b 	bne	1740 <concreate+0x2d8>
      n++;
    1610:	e2855001 	add	r5, r5, #1
      fa[i] = 1;
    1614:	e5436028 	strb	r6, [r3, #-40]	; 0xffffffd8
    1618:	eaffffe4 	b	15b0 <concreate+0x148>
  close(fd);
    161c:	e1a00004 	mov	r0, r4
    1620:	eb000836 	bl	3700 <close>
  if(n != 40){
    1624:	e3550028 	cmp	r5, #40	; 0x28
    if(((i % 3) == 0 && pid == 0) ||
    1628:	030a6aab 	movweq	r6, #43691	; 0xaaab
  for(i = 0; i < 40; i++){
    162c:	03a04000 	moveq	r4, #0
    if(((i % 3) == 0 && pid == 0) ||
    1630:	034a6aaa 	movteq	r6, #43690	; 0xaaaa
  if(n != 40){
    1634:	0a000015 	beq	1690 <concreate+0x228>
    1638:	ea00003b 	b	172c <concreate+0x2c4>
    if(((i % 3) == 0 && pid == 0) ||
    163c:	e2433001 	sub	r3, r3, #1
       ((i % 3) == 1 && pid != 0)){
    1640:	e3550000 	cmp	r5, #0
    if(((i % 3) == 0 && pid == 0) ||
    1644:	e16f3f13 	clz	r3, r3
    1648:	e1a032a3 	lsr	r3, r3, #5
       ((i % 3) == 1 && pid != 0)){
    164c:	03a03000 	moveq	r3, #0
    1650:	e3530000 	cmp	r3, #0
    1654:	1a000018 	bne	16bc <concreate+0x254>
      unlink(file);
    1658:	e24b0050 	sub	r0, fp, #80	; 0x50
    165c:	eb000868 	bl	3804 <unlink>
      unlink(file);
    1660:	e24b0050 	sub	r0, fp, #80	; 0x50
    1664:	eb000866 	bl	3804 <unlink>
      unlink(file);
    1668:	e24b0050 	sub	r0, fp, #80	; 0x50
    166c:	eb000864 	bl	3804 <unlink>
      unlink(file);
    1670:	e24b0050 	sub	r0, fp, #80	; 0x50
    1674:	eb000862 	bl	3804 <unlink>
    if(pid == 0)
    1678:	e3550000 	cmp	r5, #0
    167c:	0affffb8 	beq	1564 <concreate+0xfc>
  for(i = 0; i < 40; i++){
    1680:	e2844001 	add	r4, r4, #1
      wait();
    1684:	eb0007cf 	bl	35c8 <wait>
  for(i = 0; i < 40; i++){
    1688:	e3540028 	cmp	r4, #40	; 0x28
    168c:	0a00001b 	beq	1700 <concreate+0x298>
    file[1] = '0' + i;
    1690:	e2843030 	add	r3, r4, #48	; 0x30
    1694:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    pid = fork();
    1698:	eb0007b0 	bl	3560 <fork>
    if(pid < 0){
    169c:	e2505000 	subs	r5, r0, #0
    16a0:	ba00001c 	blt	1718 <concreate+0x2b0>
    if(((i % 3) == 0 && pid == 0) ||
    16a4:	e0832694 	umull	r2, r3, r4, r6
    16a8:	e1a030a3 	lsr	r3, r3, #1
    16ac:	e0833083 	add	r3, r3, r3, lsl #1
    16b0:	e0443003 	sub	r3, r4, r3
    16b4:	e1932005 	orrs	r2, r3, r5
    16b8:	1affffdf 	bne	163c <concreate+0x1d4>
      close(open(file, 0));
    16bc:	e3a01000 	mov	r1, #0
    16c0:	e24b0050 	sub	r0, fp, #80	; 0x50
    16c4:	eb000834 	bl	379c <open>
    16c8:	eb00080c 	bl	3700 <close>
      close(open(file, 0));
    16cc:	e3a01000 	mov	r1, #0
    16d0:	e24b0050 	sub	r0, fp, #80	; 0x50
    16d4:	eb000830 	bl	379c <open>
    16d8:	eb000808 	bl	3700 <close>
      close(open(file, 0));
    16dc:	e3a01000 	mov	r1, #0
    16e0:	e24b0050 	sub	r0, fp, #80	; 0x50
    16e4:	eb00082c 	bl	379c <open>
    16e8:	eb000804 	bl	3700 <close>
      close(open(file, 0));
    16ec:	e3a01000 	mov	r1, #0
    16f0:	e24b0050 	sub	r0, fp, #80	; 0x50
    16f4:	eb000828 	bl	379c <open>
    16f8:	eb000800 	bl	3700 <close>
    16fc:	eaffffdd 	b	1678 <concreate+0x210>
  printf(1, "concreate ok\n");
    1700:	e3a00001 	mov	r0, #1
    1704:	e30416d4 	movw	r1, #18132	; 0x46d4
    1708:	e3401000 	movt	r1, #0
    170c:	eb000901 	bl	3b18 <printf>
}
    1710:	e24bd010 	sub	sp, fp, #16
    1714:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
      printf(1, "fork failed\n");
    1718:	e3051790 	movw	r1, #22416	; 0x5790
    171c:	e3a00001 	mov	r0, #1
    1720:	e3401000 	movt	r1, #0
    1724:	eb0008fb 	bl	3b18 <printf>
      exit();
    1728:	eb000799 	bl	3594 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    172c:	e30416a0 	movw	r1, #18080	; 0x46a0
    1730:	e3a00001 	mov	r0, #1
    1734:	e3401000 	movt	r1, #0
    1738:	eb0008f6 	bl	3b18 <printf>
    exit();
    173c:	eb000794 	bl	3594 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1740:	e3041680 	movw	r1, #18048	; 0x4680
    1744:	e24b204a 	sub	r2, fp, #74	; 0x4a
    1748:	e3401000 	movt	r1, #0
    174c:	e3a00001 	mov	r0, #1
    1750:	eb0008f0 	bl	3b18 <printf>
        exit();
    1754:	eb00078e 	bl	3594 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1758:	e3041664 	movw	r1, #18020	; 0x4664
    175c:	e24b204a 	sub	r2, fp, #74	; 0x4a
    1760:	e3401000 	movt	r1, #0
    1764:	e3a00001 	mov	r0, #1
    1768:	eb0008ea 	bl	3b18 <printf>
    176c:	eaffff7c 	b	1564 <concreate+0xfc>
      close(fd);
    1770:	eb0007e2 	bl	3700 <close>
    1774:	eaffff7a 	b	1564 <concreate+0xfc>

00001778 <linkunlink>:
{
    1778:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink test\n");
    177c:	e3a00001 	mov	r0, #1
{
    1780:	e28db01c 	add	fp, sp, #28
  printf(1, "linkunlink test\n");
    1784:	e30416e4 	movw	r1, #18148	; 0x46e4
    1788:	e3401000 	movt	r1, #0
    178c:	eb0008e1 	bl	3b18 <printf>
  unlink("x");
    1790:	e3040b64 	movw	r0, #19300	; 0x4b64
    1794:	e3400000 	movt	r0, #0
    1798:	eb000819 	bl	3804 <unlink>
  pid = fork();
    179c:	eb00076f 	bl	3560 <fork>
  if(pid < 0){
    17a0:	e2508000 	subs	r8, r0, #0
    17a4:	ba00002a 	blt	1854 <linkunlink+0xdc>
    x = x * 1103515245 + 12345;
    17a8:	e3047e6d 	movw	r7, #20077	; 0x4e6d
    if((x % 3) == 0){
    17ac:	e30a6aab 	movw	r6, #43691	; 0xaaab
      unlink("x");
    17b0:	e3045b64 	movw	r5, #19300	; 0x4b64
  unsigned int x = (pid ? 1 : 97);
    17b4:	13a04001 	movne	r4, #1
    17b8:	03a04061 	moveq	r4, #97	; 0x61
    x = x * 1103515245 + 12345;
    17bc:	e34471c6 	movt	r7, #16838	; 0x41c6
    if((x % 3) == 0){
    17c0:	e34a6aaa 	movt	r6, #43690	; 0xaaaa
      unlink("x");
    17c4:	e3405000 	movt	r5, #0
  unsigned int x = (pid ? 1 : 97);
    17c8:	e3a09064 	mov	r9, #100	; 0x64
    17cc:	ea000005 	b	17e8 <linkunlink+0x70>
    } else if((x % 3) == 1){
    17d0:	e3530001 	cmp	r3, #1
    17d4:	0a000019 	beq	1840 <linkunlink+0xc8>
      unlink("x");
    17d8:	e1a00005 	mov	r0, r5
    17dc:	eb000808 	bl	3804 <unlink>
  for(i = 0; i < 100; i++){
    17e0:	e2599001 	subs	r9, r9, #1
    17e4:	0a00000c 	beq	181c <linkunlink+0xa4>
    x = x * 1103515245 + 12345;
    17e8:	e3033039 	movw	r3, #12345	; 0x3039
    17ec:	e0243497 	mla	r4, r7, r4, r3
    if((x % 3) == 0){
    17f0:	e0832694 	umull	r2, r3, r4, r6
    17f4:	e1a030a3 	lsr	r3, r3, #1
    17f8:	e0833083 	add	r3, r3, r3, lsl #1
    17fc:	e0543003 	subs	r3, r4, r3
    1800:	1afffff2 	bne	17d0 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    1804:	e3001202 	movw	r1, #514	; 0x202
    1808:	e1a00005 	mov	r0, r5
    180c:	eb0007e2 	bl	379c <open>
    1810:	eb0007ba 	bl	3700 <close>
  for(i = 0; i < 100; i++){
    1814:	e2599001 	subs	r9, r9, #1
    1818:	1afffff2 	bne	17e8 <linkunlink+0x70>
  if(pid)
    181c:	e3580000 	cmp	r8, #0
    1820:	0a000010 	beq	1868 <linkunlink+0xf0>
    wait();
    1824:	eb000767 	bl	35c8 <wait>
  printf(1, "linkunlink ok\n");
    1828:	e30416fc 	movw	r1, #18172	; 0x46fc
    182c:	e3a00001 	mov	r0, #1
    1830:	e3401000 	movt	r1, #0
}
    1834:	e24bd01c 	sub	sp, fp, #28
    1838:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink ok\n");
    183c:	ea0008b5 	b	3b18 <printf>
      link("cat", "x");
    1840:	e30406f8 	movw	r0, #18168	; 0x46f8
    1844:	e1a01005 	mov	r1, r5
    1848:	e3400000 	movt	r0, #0
    184c:	eb000806 	bl	386c <link>
    1850:	eaffffe2 	b	17e0 <linkunlink+0x68>
    printf(1, "fork failed\n");
    1854:	e3051790 	movw	r1, #22416	; 0x5790
    1858:	e3a00001 	mov	r0, #1
    185c:	e3401000 	movt	r1, #0
    1860:	eb0008ac 	bl	3b18 <printf>
    exit();
    1864:	eb00074a 	bl	3594 <exit>
    exit();
    1868:	eb000749 	bl	3594 <exit>

0000186c <bigdir>:
{
    186c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  printf(1, "bigdir test\n");
    1870:	e3a00001 	mov	r0, #1
{
    1874:	e28db018 	add	fp, sp, #24
  printf(1, "bigdir test\n");
    1878:	e304170c 	movw	r1, #18188	; 0x470c
{
    187c:	e24dd014 	sub	sp, sp, #20
  printf(1, "bigdir test\n");
    1880:	e3401000 	movt	r1, #0
    1884:	eb0008a3 	bl	3b18 <printf>
  unlink("bd");
    1888:	e304071c 	movw	r0, #18204	; 0x471c
    188c:	e3400000 	movt	r0, #0
    1890:	eb0007db 	bl	3804 <unlink>
  fd = open("bd", O_CREATE);
    1894:	e304071c 	movw	r0, #18204	; 0x471c
    1898:	e3a01c02 	mov	r1, #512	; 0x200
    189c:	e3400000 	movt	r0, #0
    18a0:	eb0007bd 	bl	379c <open>
  if(fd < 0){
    18a4:	e3500000 	cmp	r0, #0
    18a8:	ba000039 	blt	1994 <bigdir+0x128>
  close(fd);
    18ac:	eb000793 	bl	3700 <close>
  for(i = 0; i < 500; i++){
    18b0:	e3a07000 	mov	r7, #0
    if(link("bd", name) != 0){
    18b4:	e304471c 	movw	r4, #18204	; 0x471c
    18b8:	e3404000 	movt	r4, #0
    name[3] = '\0';
    18bc:	e1a06007 	mov	r6, r7
    name[0] = 'x';
    18c0:	e3a05078 	mov	r5, #120	; 0x78
    name[1] = '0' + (i / 64);
    18c4:	e1a02347 	asr	r2, r7, #6
    name[2] = '0' + (i % 64);
    18c8:	e207303f 	and	r3, r7, #63	; 0x3f
    if(link("bd", name) != 0){
    18cc:	e24b1028 	sub	r1, fp, #40	; 0x28
    18d0:	e1a00004 	mov	r0, r4
    name[1] = '0' + (i / 64);
    18d4:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    18d8:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    18dc:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    18e0:	e54b6025 	strb	r6, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    18e4:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    18e8:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(link("bd", name) != 0){
    18ec:	eb0007de 	bl	386c <link>
    18f0:	e2508000 	subs	r8, r0, #0
    18f4:	1a00001c 	bne	196c <bigdir+0x100>
  for(i = 0; i < 500; i++){
    18f8:	e2877001 	add	r7, r7, #1
    18fc:	e3570f7d 	cmp	r7, #500	; 0x1f4
    1900:	1affffef 	bne	18c4 <bigdir+0x58>
  unlink("bd");
    1904:	e304071c 	movw	r0, #18204	; 0x471c
    1908:	e3400000 	movt	r0, #0
    190c:	eb0007bc 	bl	3804 <unlink>
    name[0] = 'x';
    1910:	e3a05078 	mov	r5, #120	; 0x78
    name[3] = '\0';
    1914:	e1a04008 	mov	r4, r8
    name[1] = '0' + (i / 64);
    1918:	e1a02348 	asr	r2, r8, #6
    name[2] = '0' + (i % 64);
    191c:	e208303f 	and	r3, r8, #63	; 0x3f
    if(unlink(name) != 0){
    1920:	e24b0028 	sub	r0, fp, #40	; 0x28
    name[1] = '0' + (i / 64);
    1924:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    1928:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    192c:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    1930:	e54b4025 	strb	r4, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    1934:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    1938:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(unlink(name) != 0){
    193c:	eb0007b0 	bl	3804 <unlink>
    1940:	e3500000 	cmp	r0, #0
    1944:	1a00000d 	bne	1980 <bigdir+0x114>
  for(i = 0; i < 500; i++){
    1948:	e2888001 	add	r8, r8, #1
    194c:	e3580f7d 	cmp	r8, #500	; 0x1f4
    1950:	1afffff0 	bne	1918 <bigdir+0xac>
  printf(1, "bigdir ok\n");
    1954:	e3a00001 	mov	r0, #1
    1958:	e3041764 	movw	r1, #18276	; 0x4764
    195c:	e3401000 	movt	r1, #0
    1960:	eb00086c 	bl	3b18 <printf>
}
    1964:	e24bd018 	sub	sp, fp, #24
    1968:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "bigdir link failed\n");
    196c:	e3041738 	movw	r1, #18232	; 0x4738
    1970:	e3a00001 	mov	r0, #1
    1974:	e3401000 	movt	r1, #0
    1978:	eb000866 	bl	3b18 <printf>
      exit();
    197c:	eb000704 	bl	3594 <exit>
      printf(1, "bigdir unlink failed");
    1980:	e304174c 	movw	r1, #18252	; 0x474c
    1984:	e3a00001 	mov	r0, #1
    1988:	e3401000 	movt	r1, #0
    198c:	eb000861 	bl	3b18 <printf>
      exit();
    1990:	eb0006ff 	bl	3594 <exit>
    printf(1, "bigdir create failed\n");
    1994:	e3041720 	movw	r1, #18208	; 0x4720
    1998:	e3a00001 	mov	r0, #1
    199c:	e3401000 	movt	r1, #0
    19a0:	eb00085c 	bl	3b18 <printf>
    exit();
    19a4:	eb0006fa 	bl	3594 <exit>

000019a8 <subdir>:
{
    19a8:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "subdir test\n");
    19ac:	e3a00001 	mov	r0, #1
{
    19b0:	e28db00c 	add	fp, sp, #12
  printf(1, "subdir test\n");
    19b4:	e3041770 	movw	r1, #18288	; 0x4770
    19b8:	e3401000 	movt	r1, #0
    19bc:	eb000855 	bl	3b18 <printf>
  unlink("ff");
    19c0:	e3040878 	movw	r0, #18552	; 0x4878
    19c4:	e3400000 	movt	r0, #0
    19c8:	eb00078d 	bl	3804 <unlink>
  if(mkdir("dd") != 0){
    19cc:	e3040924 	movw	r0, #18724	; 0x4924
    19d0:	e3400000 	movt	r0, #0
    19d4:	eb0007b1 	bl	38a0 <mkdir>
    19d8:	e3500000 	cmp	r0, #0
    19dc:	1a000150 	bne	1f24 <subdir+0x57c>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    19e0:	e3040798 	movw	r0, #18328	; 0x4798
    19e4:	e3001202 	movw	r1, #514	; 0x202
    19e8:	e3400000 	movt	r0, #0
    19ec:	eb00076a 	bl	379c <open>
  if(fd < 0){
    19f0:	e2504000 	subs	r4, r0, #0
    19f4:	ba000145 	blt	1f10 <subdir+0x568>
  write(fd, "ff", 2);
    19f8:	e3a02002 	mov	r2, #2
    19fc:	e3041878 	movw	r1, #18552	; 0x4878
    1a00:	e3401000 	movt	r1, #0
    1a04:	eb000730 	bl	36cc <write>
  close(fd);
    1a08:	e1a00004 	mov	r0, r4
    1a0c:	eb00073b 	bl	3700 <close>
  if(unlink("dd") >= 0){
    1a10:	e3040924 	movw	r0, #18724	; 0x4924
    1a14:	e3400000 	movt	r0, #0
    1a18:	eb000779 	bl	3804 <unlink>
    1a1c:	e3500000 	cmp	r0, #0
    1a20:	aa000135 	bge	1efc <subdir+0x554>
  if(mkdir("/dd/dd") != 0){
    1a24:	e30407e0 	movw	r0, #18400	; 0x47e0
    1a28:	e3400000 	movt	r0, #0
    1a2c:	eb00079b 	bl	38a0 <mkdir>
    1a30:	e2504000 	subs	r4, r0, #0
    1a34:	1a00012b 	bne	1ee8 <subdir+0x540>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1a38:	e3040804 	movw	r0, #18436	; 0x4804
    1a3c:	e3001202 	movw	r1, #514	; 0x202
    1a40:	e3400000 	movt	r0, #0
    1a44:	eb000754 	bl	379c <open>
  if(fd < 0){
    1a48:	e2505000 	subs	r5, r0, #0
    1a4c:	ba0000ee 	blt	1e0c <subdir+0x464>
  write(fd, "FF", 2);
    1a50:	e3a02002 	mov	r2, #2
    1a54:	e3041828 	movw	r1, #18472	; 0x4828
    1a58:	e3401000 	movt	r1, #0
    1a5c:	eb00071a 	bl	36cc <write>
  close(fd);
    1a60:	e1a00005 	mov	r0, r5
    1a64:	eb000725 	bl	3700 <close>
  fd = open("dd/dd/../ff", 0);
    1a68:	e1a01004 	mov	r1, r4
    1a6c:	e304082c 	movw	r0, #18476	; 0x482c
    1a70:	e3400000 	movt	r0, #0
    1a74:	eb000748 	bl	379c <open>
  if(fd < 0){
    1a78:	e2505000 	subs	r5, r0, #0
    1a7c:	ba0000dd 	blt	1df8 <subdir+0x450>
  cc = read(fd, buf, sizeof(buf));
    1a80:	e3084044 	movw	r4, #32836	; 0x8044
    1a84:	e3404000 	movt	r4, #0
    1a88:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a8c:	e1a01004 	mov	r1, r4
    1a90:	eb000700 	bl	3698 <read>
  if(cc != 2 || buf[0] != 'f'){
    1a94:	e3500002 	cmp	r0, #2
    1a98:	1a0000b3 	bne	1d6c <subdir+0x3c4>
    1a9c:	e5d43000 	ldrb	r3, [r4]
    1aa0:	e3530066 	cmp	r3, #102	; 0x66
    1aa4:	1a0000b0 	bne	1d6c <subdir+0x3c4>
  close(fd);
    1aa8:	e1a00005 	mov	r0, r5
    1aac:	eb000713 	bl	3700 <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1ab0:	e3041870 	movw	r1, #18544	; 0x4870
    1ab4:	e3040804 	movw	r0, #18436	; 0x4804
    1ab8:	e3401000 	movt	r1, #0
    1abc:	e3400000 	movt	r0, #0
    1ac0:	eb000769 	bl	386c <link>
    1ac4:	e3500000 	cmp	r0, #0
    1ac8:	1a0000d9 	bne	1e34 <subdir+0x48c>
  if(unlink("dd/dd/ff") != 0){
    1acc:	e3040804 	movw	r0, #18436	; 0x4804
    1ad0:	e3400000 	movt	r0, #0
    1ad4:	eb00074a 	bl	3804 <unlink>
    1ad8:	e3500000 	cmp	r0, #0
    1adc:	1a0000ac 	bne	1d94 <subdir+0x3ec>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ae0:	e3040804 	movw	r0, #18436	; 0x4804
    1ae4:	e3a01000 	mov	r1, #0
    1ae8:	e3400000 	movt	r0, #0
    1aec:	eb00072a 	bl	379c <open>
    1af0:	e3500000 	cmp	r0, #0
    1af4:	aa0000f6 	bge	1ed4 <subdir+0x52c>
  if(chdir("dd") != 0){
    1af8:	e3040924 	movw	r0, #18724	; 0x4924
    1afc:	e3400000 	movt	r0, #0
    1b00:	eb000773 	bl	38d4 <chdir>
    1b04:	e3500000 	cmp	r0, #0
    1b08:	1a0000ec 	bne	1ec0 <subdir+0x518>
  if(chdir("dd/../../dd") != 0){
    1b0c:	e30408f0 	movw	r0, #18672	; 0x48f0
    1b10:	e3400000 	movt	r0, #0
    1b14:	eb00076e 	bl	38d4 <chdir>
    1b18:	e3500000 	cmp	r0, #0
    1b1c:	1a000097 	bne	1d80 <subdir+0x3d8>
  if(chdir("dd/../../../dd") != 0){
    1b20:	e3040918 	movw	r0, #18712	; 0x4918
    1b24:	e3400000 	movt	r0, #0
    1b28:	eb000769 	bl	38d4 <chdir>
    1b2c:	e3500000 	cmp	r0, #0
    1b30:	1a000092 	bne	1d80 <subdir+0x3d8>
  if(chdir("./..") != 0){
    1b34:	e3040928 	movw	r0, #18728	; 0x4928
    1b38:	e3400000 	movt	r0, #0
    1b3c:	eb000764 	bl	38d4 <chdir>
    1b40:	e2504000 	subs	r4, r0, #0
    1b44:	1a0000b5 	bne	1e20 <subdir+0x478>
  fd = open("dd/dd/ffff", 0);
    1b48:	e3040870 	movw	r0, #18544	; 0x4870
    1b4c:	e1a01004 	mov	r1, r4
    1b50:	e3400000 	movt	r0, #0
    1b54:	eb000710 	bl	379c <open>
  if(fd < 0){
    1b58:	e2505000 	subs	r5, r0, #0
    1b5c:	ba00012c 	blt	2014 <subdir+0x66c>
  if(read(fd, buf, sizeof(buf)) != 2){
    1b60:	e3081044 	movw	r1, #32836	; 0x8044
    1b64:	e3a02a02 	mov	r2, #8192	; 0x2000
    1b68:	e3401000 	movt	r1, #0
    1b6c:	eb0006c9 	bl	3698 <read>
    1b70:	e3500002 	cmp	r0, #2
    1b74:	1a000121 	bne	2000 <subdir+0x658>
  close(fd);
    1b78:	e1a00005 	mov	r0, r5
    1b7c:	eb0006df 	bl	3700 <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1b80:	e1a01004 	mov	r1, r4
    1b84:	e3040804 	movw	r0, #18436	; 0x4804
    1b88:	e3400000 	movt	r0, #0
    1b8c:	eb000702 	bl	379c <open>
    1b90:	e3500000 	cmp	r0, #0
    1b94:	aa000088 	bge	1dbc <subdir+0x414>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1b98:	e30409a0 	movw	r0, #18848	; 0x49a0
    1b9c:	e3001202 	movw	r1, #514	; 0x202
    1ba0:	e3400000 	movt	r0, #0
    1ba4:	eb0006fc 	bl	379c <open>
    1ba8:	e3500000 	cmp	r0, #0
    1bac:	aa00007d 	bge	1da8 <subdir+0x400>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1bb0:	e30409c8 	movw	r0, #18888	; 0x49c8
    1bb4:	e3001202 	movw	r1, #514	; 0x202
    1bb8:	e3400000 	movt	r0, #0
    1bbc:	eb0006f6 	bl	379c <open>
    1bc0:	e3500000 	cmp	r0, #0
    1bc4:	aa0000b8 	bge	1eac <subdir+0x504>
  if(open("dd", O_CREATE) >= 0){
    1bc8:	e3040924 	movw	r0, #18724	; 0x4924
    1bcc:	e3a01c02 	mov	r1, #512	; 0x200
    1bd0:	e3400000 	movt	r0, #0
    1bd4:	eb0006f0 	bl	379c <open>
    1bd8:	e3500000 	cmp	r0, #0
    1bdc:	aa0000ad 	bge	1e98 <subdir+0x4f0>
  if(open("dd", O_RDWR) >= 0){
    1be0:	e3040924 	movw	r0, #18724	; 0x4924
    1be4:	e3a01002 	mov	r1, #2
    1be8:	e3400000 	movt	r0, #0
    1bec:	eb0006ea 	bl	379c <open>
    1bf0:	e3500000 	cmp	r0, #0
    1bf4:	aa0000a2 	bge	1e84 <subdir+0x4dc>
  if(open("dd", O_WRONLY) >= 0){
    1bf8:	e3040924 	movw	r0, #18724	; 0x4924
    1bfc:	e3a01001 	mov	r1, #1
    1c00:	e3400000 	movt	r0, #0
    1c04:	eb0006e4 	bl	379c <open>
    1c08:	e3500000 	cmp	r0, #0
    1c0c:	aa000097 	bge	1e70 <subdir+0x4c8>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1c10:	e3041a40 	movw	r1, #19008	; 0x4a40
    1c14:	e30409a0 	movw	r0, #18848	; 0x49a0
    1c18:	e3401000 	movt	r1, #0
    1c1c:	e3400000 	movt	r0, #0
    1c20:	eb000711 	bl	386c <link>
    1c24:	e3500000 	cmp	r0, #0
    1c28:	0a00008b 	beq	1e5c <subdir+0x4b4>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1c2c:	e3041a40 	movw	r1, #19008	; 0x4a40
    1c30:	e30409c8 	movw	r0, #18888	; 0x49c8
    1c34:	e3401000 	movt	r1, #0
    1c38:	e3400000 	movt	r0, #0
    1c3c:	eb00070a 	bl	386c <link>
    1c40:	e3500000 	cmp	r0, #0
    1c44:	0a00007f 	beq	1e48 <subdir+0x4a0>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1c48:	e3041870 	movw	r1, #18544	; 0x4870
    1c4c:	e3040798 	movw	r0, #18328	; 0x4798
    1c50:	e3401000 	movt	r1, #0
    1c54:	e3400000 	movt	r0, #0
    1c58:	eb000703 	bl	386c <link>
    1c5c:	e3500000 	cmp	r0, #0
    1c60:	0a00005f 	beq	1de4 <subdir+0x43c>
  if(mkdir("dd/ff/ff") == 0){
    1c64:	e30409a0 	movw	r0, #18848	; 0x49a0
    1c68:	e3400000 	movt	r0, #0
    1c6c:	eb00070b 	bl	38a0 <mkdir>
    1c70:	e3500000 	cmp	r0, #0
    1c74:	0a000055 	beq	1dd0 <subdir+0x428>
  if(mkdir("dd/xx/ff") == 0){
    1c78:	e30409c8 	movw	r0, #18888	; 0x49c8
    1c7c:	e3400000 	movt	r0, #0
    1c80:	eb000706 	bl	38a0 <mkdir>
    1c84:	e3500000 	cmp	r0, #0
    1c88:	0a0000d7 	beq	1fec <subdir+0x644>
  if(mkdir("dd/dd/ffff") == 0){
    1c8c:	e3040870 	movw	r0, #18544	; 0x4870
    1c90:	e3400000 	movt	r0, #0
    1c94:	eb000701 	bl	38a0 <mkdir>
    1c98:	e3500000 	cmp	r0, #0
    1c9c:	0a0000cd 	beq	1fd8 <subdir+0x630>
  if(unlink("dd/xx/ff") == 0){
    1ca0:	e30409c8 	movw	r0, #18888	; 0x49c8
    1ca4:	e3400000 	movt	r0, #0
    1ca8:	eb0006d5 	bl	3804 <unlink>
    1cac:	e3500000 	cmp	r0, #0
    1cb0:	0a0000c3 	beq	1fc4 <subdir+0x61c>
  if(unlink("dd/ff/ff") == 0){
    1cb4:	e30409a0 	movw	r0, #18848	; 0x49a0
    1cb8:	e3400000 	movt	r0, #0
    1cbc:	eb0006d0 	bl	3804 <unlink>
    1cc0:	e3500000 	cmp	r0, #0
    1cc4:	0a0000b9 	beq	1fb0 <subdir+0x608>
  if(chdir("dd/ff") == 0){
    1cc8:	e3040798 	movw	r0, #18328	; 0x4798
    1ccc:	e3400000 	movt	r0, #0
    1cd0:	eb0006ff 	bl	38d4 <chdir>
    1cd4:	e3500000 	cmp	r0, #0
    1cd8:	0a0000af 	beq	1f9c <subdir+0x5f4>
  if(chdir("dd/xx") == 0){
    1cdc:	e3040b60 	movw	r0, #19296	; 0x4b60
    1ce0:	e3400000 	movt	r0, #0
    1ce4:	eb0006fa 	bl	38d4 <chdir>
    1ce8:	e3500000 	cmp	r0, #0
    1cec:	0a0000a5 	beq	1f88 <subdir+0x5e0>
  if(unlink("dd/dd/ffff") != 0){
    1cf0:	e3040870 	movw	r0, #18544	; 0x4870
    1cf4:	e3400000 	movt	r0, #0
    1cf8:	eb0006c1 	bl	3804 <unlink>
    1cfc:	e3500000 	cmp	r0, #0
    1d00:	1a000023 	bne	1d94 <subdir+0x3ec>
  if(unlink("dd/ff") != 0){
    1d04:	e3040798 	movw	r0, #18328	; 0x4798
    1d08:	e3400000 	movt	r0, #0
    1d0c:	eb0006bc 	bl	3804 <unlink>
    1d10:	e3500000 	cmp	r0, #0
    1d14:	1a000096 	bne	1f74 <subdir+0x5cc>
  if(unlink("dd") == 0){
    1d18:	e3040924 	movw	r0, #18724	; 0x4924
    1d1c:	e3400000 	movt	r0, #0
    1d20:	eb0006b7 	bl	3804 <unlink>
    1d24:	e3500000 	cmp	r0, #0
    1d28:	0a00008c 	beq	1f60 <subdir+0x5b8>
  if(unlink("dd/dd") < 0){
    1d2c:	e3040bb8 	movw	r0, #19384	; 0x4bb8
    1d30:	e3400000 	movt	r0, #0
    1d34:	eb0006b2 	bl	3804 <unlink>
    1d38:	e3500000 	cmp	r0, #0
    1d3c:	ba000082 	blt	1f4c <subdir+0x5a4>
  if(unlink("dd") < 0){
    1d40:	e3040924 	movw	r0, #18724	; 0x4924
    1d44:	e3400000 	movt	r0, #0
    1d48:	eb0006ad 	bl	3804 <unlink>
    1d4c:	e3500000 	cmp	r0, #0
    1d50:	ba000078 	blt	1f38 <subdir+0x590>
  printf(1, "subdir ok\n");
    1d54:	e3041bec 	movw	r1, #19436	; 0x4bec
    1d58:	e3a00001 	mov	r0, #1
    1d5c:	e3401000 	movt	r1, #0
}
    1d60:	e24bd00c 	sub	sp, fp, #12
    1d64:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "subdir ok\n");
    1d68:	ea00076a 	b	3b18 <printf>
    printf(1, "dd/dd/../ff wrong content\n");
    1d6c:	e3041854 	movw	r1, #18516	; 0x4854
    1d70:	e3a00001 	mov	r0, #1
    1d74:	e3401000 	movt	r1, #0
    1d78:	eb000766 	bl	3b18 <printf>
    exit();
    1d7c:	eb000604 	bl	3594 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    1d80:	e30418fc 	movw	r1, #18684	; 0x48fc
    1d84:	e3a00001 	mov	r0, #1
    1d88:	e3401000 	movt	r1, #0
    1d8c:	eb000761 	bl	3b18 <printf>
    exit();
    1d90:	eb0005ff 	bl	3594 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1d94:	e30418a0 	movw	r1, #18592	; 0x48a0
    1d98:	e3a00001 	mov	r0, #1
    1d9c:	e3401000 	movt	r1, #0
    1da0:	eb00075c 	bl	3b18 <printf>
    exit();
    1da4:	eb0005fa 	bl	3594 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    1da8:	e30419ac 	movw	r1, #18860	; 0x49ac
    1dac:	e3a00001 	mov	r0, #1
    1db0:	e3401000 	movt	r1, #0
    1db4:	eb000757 	bl	3b18 <printf>
    exit();
    1db8:	eb0005f5 	bl	3594 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1dbc:	e3041978 	movw	r1, #18808	; 0x4978
    1dc0:	e3a00001 	mov	r0, #1
    1dc4:	e3401000 	movt	r1, #0
    1dc8:	eb000752 	bl	3b18 <printf>
    exit();
    1dcc:	eb0005f0 	bl	3594 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1dd0:	e3041ab8 	movw	r1, #19128	; 0x4ab8
    1dd4:	e3a00001 	mov	r0, #1
    1dd8:	e3401000 	movt	r1, #0
    1ddc:	eb00074d 	bl	3b18 <printf>
    exit();
    1de0:	eb0005eb 	bl	3594 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1de4:	e3041a94 	movw	r1, #19092	; 0x4a94
    1de8:	e3a00001 	mov	r0, #1
    1dec:	e3401000 	movt	r1, #0
    1df0:	eb000748 	bl	3b18 <printf>
    exit();
    1df4:	eb0005e6 	bl	3594 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1df8:	e3041838 	movw	r1, #18488	; 0x4838
    1dfc:	e3a00001 	mov	r0, #1
    1e00:	e3401000 	movt	r1, #0
    1e04:	eb000743 	bl	3b18 <printf>
    exit();
    1e08:	eb0005e1 	bl	3594 <exit>
    printf(1, "create dd/dd/ff failed\n");
    1e0c:	e3041810 	movw	r1, #18448	; 0x4810
    1e10:	e3a00001 	mov	r0, #1
    1e14:	e3401000 	movt	r1, #0
    1e18:	eb00073e 	bl	3b18 <printf>
    exit();
    1e1c:	eb0005dc 	bl	3594 <exit>
    printf(1, "chdir ./.. failed\n");
    1e20:	e3041930 	movw	r1, #18736	; 0x4930
    1e24:	e3a00001 	mov	r0, #1
    1e28:	e3401000 	movt	r1, #0
    1e2c:	eb000739 	bl	3b18 <printf>
    exit();
    1e30:	eb0005d7 	bl	3594 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1e34:	e304187c 	movw	r1, #18556	; 0x487c
    1e38:	e3a00001 	mov	r0, #1
    1e3c:	e3401000 	movt	r1, #0
    1e40:	eb000734 	bl	3b18 <printf>
    exit();
    1e44:	eb0005d2 	bl	3594 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    1e48:	e3041a70 	movw	r1, #19056	; 0x4a70
    1e4c:	e3a00001 	mov	r0, #1
    1e50:	e3401000 	movt	r1, #0
    1e54:	eb00072f 	bl	3b18 <printf>
    exit();
    1e58:	eb0005cd 	bl	3594 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    1e5c:	e3041a4c 	movw	r1, #19020	; 0x4a4c
    1e60:	e3a00001 	mov	r0, #1
    1e64:	e3401000 	movt	r1, #0
    1e68:	eb00072a 	bl	3b18 <printf>
    exit();
    1e6c:	eb0005c8 	bl	3594 <exit>
    printf(1, "open dd wronly succeeded!\n");
    1e70:	e3041a24 	movw	r1, #18980	; 0x4a24
    1e74:	e3a00001 	mov	r0, #1
    1e78:	e3401000 	movt	r1, #0
    1e7c:	eb000725 	bl	3b18 <printf>
    exit();
    1e80:	eb0005c3 	bl	3594 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    1e84:	e3041a08 	movw	r1, #18952	; 0x4a08
    1e88:	e3a00001 	mov	r0, #1
    1e8c:	e3401000 	movt	r1, #0
    1e90:	eb000720 	bl	3b18 <printf>
    exit();
    1e94:	eb0005be 	bl	3594 <exit>
    printf(1, "create dd succeeded!\n");
    1e98:	e30419f0 	movw	r1, #18928	; 0x49f0
    1e9c:	e3a00001 	mov	r0, #1
    1ea0:	e3401000 	movt	r1, #0
    1ea4:	eb00071b 	bl	3b18 <printf>
    exit();
    1ea8:	eb0005b9 	bl	3594 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    1eac:	e30419d4 	movw	r1, #18900	; 0x49d4
    1eb0:	e3a00001 	mov	r0, #1
    1eb4:	e3401000 	movt	r1, #0
    1eb8:	eb000716 	bl	3b18 <printf>
    exit();
    1ebc:	eb0005b4 	bl	3594 <exit>
    printf(1, "chdir dd failed\n");
    1ec0:	e30418dc 	movw	r1, #18652	; 0x48dc
    1ec4:	e3a00001 	mov	r0, #1
    1ec8:	e3401000 	movt	r1, #0
    1ecc:	eb000711 	bl	3b18 <printf>
    exit();
    1ed0:	eb0005af 	bl	3594 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1ed4:	e30418b8 	movw	r1, #18616	; 0x48b8
    1ed8:	e3a00001 	mov	r0, #1
    1edc:	e3401000 	movt	r1, #0
    1ee0:	eb00070c 	bl	3b18 <printf>
    exit();
    1ee4:	eb0005aa 	bl	3594 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1ee8:	e30417e8 	movw	r1, #18408	; 0x47e8
    1eec:	e3a00001 	mov	r0, #1
    1ef0:	e3401000 	movt	r1, #0
    1ef4:	eb000707 	bl	3b18 <printf>
    exit();
    1ef8:	eb0005a5 	bl	3594 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1efc:	e30417b8 	movw	r1, #18360	; 0x47b8
    1f00:	e3a00001 	mov	r0, #1
    1f04:	e3401000 	movt	r1, #0
    1f08:	eb000702 	bl	3b18 <printf>
    exit();
    1f0c:	eb0005a0 	bl	3594 <exit>
    printf(1, "create dd/ff failed\n");
    1f10:	e30417a0 	movw	r1, #18336	; 0x47a0
    1f14:	e3a00001 	mov	r0, #1
    1f18:	e3401000 	movt	r1, #0
    1f1c:	eb0006fd 	bl	3b18 <printf>
    exit();
    1f20:	eb00059b 	bl	3594 <exit>
    printf(1, "subdir mkdir dd failed\n");
    1f24:	e3041780 	movw	r1, #18304	; 0x4780
    1f28:	e3a00001 	mov	r0, #1
    1f2c:	e3401000 	movt	r1, #0
    1f30:	eb0006f8 	bl	3b18 <printf>
    exit();
    1f34:	eb000596 	bl	3594 <exit>
    printf(1, "unlink dd failed\n");
    1f38:	e3041bd8 	movw	r1, #19416	; 0x4bd8
    1f3c:	e3a00001 	mov	r0, #1
    1f40:	e3401000 	movt	r1, #0
    1f44:	eb0006f3 	bl	3b18 <printf>
    exit();
    1f48:	eb000591 	bl	3594 <exit>
    printf(1, "unlink dd/dd failed\n");
    1f4c:	e3041bc0 	movw	r1, #19392	; 0x4bc0
    1f50:	e3a00001 	mov	r0, #1
    1f54:	e3401000 	movt	r1, #0
    1f58:	eb0006ee 	bl	3b18 <printf>
    exit();
    1f5c:	eb00058c 	bl	3594 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    1f60:	e3041b98 	movw	r1, #19352	; 0x4b98
    1f64:	e3a00001 	mov	r0, #1
    1f68:	e3401000 	movt	r1, #0
    1f6c:	eb0006e9 	bl	3b18 <printf>
    exit();
    1f70:	eb000587 	bl	3594 <exit>
    printf(1, "unlink dd/ff failed\n");
    1f74:	e3041b80 	movw	r1, #19328	; 0x4b80
    1f78:	e3a00001 	mov	r0, #1
    1f7c:	e3401000 	movt	r1, #0
    1f80:	eb0006e4 	bl	3b18 <printf>
    exit();
    1f84:	eb000582 	bl	3594 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    1f88:	e3041b68 	movw	r1, #19304	; 0x4b68
    1f8c:	e3a00001 	mov	r0, #1
    1f90:	e3401000 	movt	r1, #0
    1f94:	eb0006df 	bl	3b18 <printf>
    exit();
    1f98:	eb00057d 	bl	3594 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    1f9c:	e3041b48 	movw	r1, #19272	; 0x4b48
    1fa0:	e3a00001 	mov	r0, #1
    1fa4:	e3401000 	movt	r1, #0
    1fa8:	eb0006da 	bl	3b18 <printf>
    exit();
    1fac:	eb000578 	bl	3594 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    1fb0:	e3041b2c 	movw	r1, #19244	; 0x4b2c
    1fb4:	e3a00001 	mov	r0, #1
    1fb8:	e3401000 	movt	r1, #0
    1fbc:	eb0006d5 	bl	3b18 <printf>
    exit();
    1fc0:	eb000573 	bl	3594 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    1fc4:	e3041b10 	movw	r1, #19216	; 0x4b10
    1fc8:	e3a00001 	mov	r0, #1
    1fcc:	e3401000 	movt	r1, #0
    1fd0:	eb0006d0 	bl	3b18 <printf>
    exit();
    1fd4:	eb00056e 	bl	3594 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    1fd8:	e3041af0 	movw	r1, #19184	; 0x4af0
    1fdc:	e3a00001 	mov	r0, #1
    1fe0:	e3401000 	movt	r1, #0
    1fe4:	eb0006cb 	bl	3b18 <printf>
    exit();
    1fe8:	eb000569 	bl	3594 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    1fec:	e3041ad4 	movw	r1, #19156	; 0x4ad4
    1ff0:	e3a00001 	mov	r0, #1
    1ff4:	e3401000 	movt	r1, #0
    1ff8:	eb0006c6 	bl	3b18 <printf>
    exit();
    1ffc:	eb000564 	bl	3594 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    2000:	e304195c 	movw	r1, #18780	; 0x495c
    2004:	e3a00001 	mov	r0, #1
    2008:	e3401000 	movt	r1, #0
    200c:	eb0006c1 	bl	3b18 <printf>
    exit();
    2010:	eb00055f 	bl	3594 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    2014:	e3041944 	movw	r1, #18756	; 0x4944
    2018:	e3a00001 	mov	r0, #1
    201c:	e3401000 	movt	r1, #0
    2020:	eb0006bc 	bl	3b18 <printf>
    exit();
    2024:	eb00055a 	bl	3594 <exit>

00002028 <bigwrite>:
{
    2028:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite test\n");
    202c:	e3a00001 	mov	r0, #1
{
    2030:	e28db014 	add	fp, sp, #20
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2034:	e3047c08 	movw	r7, #19464	; 0x4c08
  printf(1, "bigwrite test\n");
    2038:	e3041bf8 	movw	r1, #19448	; 0x4bf8
    203c:	e3401000 	movt	r1, #0
    2040:	eb0006b4 	bl	3b18 <printf>
  unlink("bigwrite");
    2044:	e1a00007 	mov	r0, r7
    2048:	e3400000 	movt	r0, #0
      int cc = write(fd, buf, sz);
    204c:	e3086044 	movw	r6, #32836	; 0x8044
    2050:	e3406000 	movt	r6, #0
  for(sz = 499; sz < 12*512; sz += 471){
    2054:	e30041f3 	movw	r4, #499	; 0x1f3
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2058:	e1a07000 	mov	r7, r0
  unlink("bigwrite");
    205c:	eb0005e8 	bl	3804 <unlink>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2060:	e3001202 	movw	r1, #514	; 0x202
    2064:	e1a00007 	mov	r0, r7
    2068:	eb0005cb 	bl	379c <open>
    if(fd < 0){
    206c:	e2505000 	subs	r5, r0, #0
    2070:	ba000020 	blt	20f8 <bigwrite+0xd0>
      int cc = write(fd, buf, sz);
    2074:	e1a02004 	mov	r2, r4
    2078:	e1a01006 	mov	r1, r6
    207c:	eb000592 	bl	36cc <write>
      if(cc != sz){
    2080:	e1500004 	cmp	r0, r4
    2084:	1a000014 	bne	20dc <bigwrite+0xb4>
      int cc = write(fd, buf, sz);
    2088:	e1a02004 	mov	r2, r4
    208c:	e1a01006 	mov	r1, r6
    2090:	e1a00005 	mov	r0, r5
    2094:	eb00058c 	bl	36cc <write>
      if(cc != sz){
    2098:	e1500004 	cmp	r0, r4
    209c:	1a00000e 	bne	20dc <bigwrite+0xb4>
    close(fd);
    20a0:	e1a00005 	mov	r0, r5
  for(sz = 499; sz < 12*512; sz += 471){
    20a4:	e2844f75 	add	r4, r4, #468	; 0x1d4
    close(fd);
    20a8:	eb000594 	bl	3700 <close>
  for(sz = 499; sz < 12*512; sz += 471){
    20ac:	e2844003 	add	r4, r4, #3
    unlink("bigwrite");
    20b0:	e1a00007 	mov	r0, r7
    20b4:	eb0005d2 	bl	3804 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    20b8:	e3013807 	movw	r3, #6151	; 0x1807
    20bc:	e1540003 	cmp	r4, r3
    20c0:	1affffe6 	bne	2060 <bigwrite+0x38>
  printf(1, "bigwrite ok\n");
    20c4:	e3041c40 	movw	r1, #19520	; 0x4c40
    20c8:	e3a00001 	mov	r0, #1
    20cc:	e3401000 	movt	r1, #0
}
    20d0:	e24bd014 	sub	sp, fp, #20
    20d4:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite ok\n");
    20d8:	ea00068e 	b	3b18 <printf>
        printf(1, "write(%d) ret %d\n", sz, cc);
    20dc:	e1a03000 	mov	r3, r0
    20e0:	e1a02004 	mov	r2, r4
    20e4:	e3041c2c 	movw	r1, #19500	; 0x4c2c
    20e8:	e3a00001 	mov	r0, #1
    20ec:	e3401000 	movt	r1, #0
    20f0:	eb000688 	bl	3b18 <printf>
        exit();
    20f4:	eb000526 	bl	3594 <exit>
      printf(1, "cannot create bigwrite\n");
    20f8:	e3041c14 	movw	r1, #19476	; 0x4c14
    20fc:	e3a00001 	mov	r0, #1
    2100:	e3401000 	movt	r1, #0
    2104:	eb000683 	bl	3b18 <printf>
      exit();
    2108:	eb000521 	bl	3594 <exit>

0000210c <bigfile>:
{
    210c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test\n");
    2110:	e3a00001 	mov	r0, #1
{
    2114:	e28db01c 	add	fp, sp, #28
  printf(1, "bigfile test\n");
    2118:	e3041c50 	movw	r1, #19536	; 0x4c50
    211c:	e3401000 	movt	r1, #0
    2120:	eb00067c 	bl	3b18 <printf>
  unlink("bigfile");
    2124:	e3040c60 	movw	r0, #19552	; 0x4c60
    2128:	e3400000 	movt	r0, #0
    212c:	eb0005b4 	bl	3804 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2130:	e3040c60 	movw	r0, #19552	; 0x4c60
    2134:	e3001202 	movw	r1, #514	; 0x202
    2138:	e3400000 	movt	r0, #0
    213c:	eb000596 	bl	379c <open>
  if(fd < 0){
    2140:	e2506000 	subs	r6, r0, #0
    memset(buf, i, 600);
    2144:	a3085044 	movwge	r5, #32836	; 0x8044
  for(i = 0; i < 20; i++){
    2148:	a3a04000 	movge	r4, #0
    memset(buf, i, 600);
    214c:	a3405000 	movtge	r5, #0
  if(fd < 0){
    2150:	ba000052 	blt	22a0 <bigfile+0x194>
    memset(buf, i, 600);
    2154:	e3a02f96 	mov	r2, #600	; 0x258
    2158:	e1a01004 	mov	r1, r4
    215c:	e1a00005 	mov	r0, r5
    2160:	eb000491 	bl	33ac <memset>
    if(write(fd, buf, 600) != 600){
    2164:	e3a02f96 	mov	r2, #600	; 0x258
    2168:	e1a01005 	mov	r1, r5
    216c:	e1a00006 	mov	r0, r6
    2170:	eb000555 	bl	36cc <write>
    2174:	e3500f96 	cmp	r0, #600	; 0x258
    2178:	1a00003e 	bne	2278 <bigfile+0x16c>
  for(i = 0; i < 20; i++){
    217c:	e2844001 	add	r4, r4, #1
    2180:	e3540014 	cmp	r4, #20
    2184:	1afffff2 	bne	2154 <bigfile+0x48>
  close(fd);
    2188:	e1a00006 	mov	r0, r6
    218c:	eb00055b 	bl	3700 <close>
  fd = open("bigfile", 0);
    2190:	e3040c60 	movw	r0, #19552	; 0x4c60
    2194:	e3a01000 	mov	r1, #0
    2198:	e3400000 	movt	r0, #0
    219c:	eb00057e 	bl	379c <open>
  if(fd < 0){
    21a0:	e2507000 	subs	r7, r0, #0
    21a4:	ba000038 	blt	228c <bigfile+0x180>
    21a8:	e3085044 	movw	r5, #32836	; 0x8044
    21ac:	e3405000 	movt	r5, #0
  total = 0;
    21b0:	e3a06000 	mov	r6, #0
    cc = read(fd, buf, 300);
    21b4:	e1a08005 	mov	r8, r5
  for(i = 0; ; i++){
    21b8:	e1a04006 	mov	r4, r6
    21bc:	ea000009 	b	21e8 <bigfile+0xdc>
    if(cc != 300){
    21c0:	e3500f4b 	cmp	r0, #300	; 0x12c
    21c4:	1a000021 	bne	2250 <bigfile+0x144>
    if(buf[0] != i/2 || buf[299] != i/2){
    21c8:	e5d53000 	ldrb	r3, [r5]
    21cc:	e15300c4 	cmp	r3, r4, asr #1
    21d0:	1a000019 	bne	223c <bigfile+0x130>
    21d4:	e5d5212b 	ldrb	r2, [r5, #299]	; 0x12b
    21d8:	e1530002 	cmp	r3, r2
    21dc:	1a000016 	bne	223c <bigfile+0x130>
    total += cc;
    21e0:	e2866f4b 	add	r6, r6, #300	; 0x12c
  for(i = 0; ; i++){
    21e4:	e2844001 	add	r4, r4, #1
    cc = read(fd, buf, 300);
    21e8:	e3a02f4b 	mov	r2, #300	; 0x12c
    21ec:	e1a01008 	mov	r1, r8
    21f0:	e1a00007 	mov	r0, r7
    21f4:	eb000527 	bl	3698 <read>
    if(cc < 0){
    21f8:	e3500000 	cmp	r0, #0
    21fc:	ba000018 	blt	2264 <bigfile+0x158>
    if(cc == 0)
    2200:	1affffee 	bne	21c0 <bigfile+0xb4>
  close(fd);
    2204:	e1a00007 	mov	r0, r7
    2208:	eb00053c 	bl	3700 <close>
  if(total != 20*600){
    220c:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    2210:	e1560003 	cmp	r6, r3
    2214:	1a000026 	bne	22b4 <bigfile+0x1a8>
  unlink("bigfile");
    2218:	e3040c60 	movw	r0, #19552	; 0x4c60
    221c:	e3400000 	movt	r0, #0
    2220:	eb000577 	bl	3804 <unlink>
  printf(1, "bigfile test ok\n");
    2224:	e3041d14 	movw	r1, #19732	; 0x4d14
    2228:	e3a00001 	mov	r0, #1
    222c:	e3401000 	movt	r1, #0
}
    2230:	e24bd01c 	sub	sp, fp, #28
    2234:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test ok\n");
    2238:	ea000636 	b	3b18 <printf>
      printf(1, "read bigfile wrong data\n");
    223c:	e3041cdc 	movw	r1, #19676	; 0x4cdc
    2240:	e3a00001 	mov	r0, #1
    2244:	e3401000 	movt	r1, #0
    2248:	eb000632 	bl	3b18 <printf>
      exit();
    224c:	eb0004d0 	bl	3594 <exit>
      printf(1, "short read bigfile\n");
    2250:	e3041cc8 	movw	r1, #19656	; 0x4cc8
    2254:	e3a00001 	mov	r0, #1
    2258:	e3401000 	movt	r1, #0
    225c:	eb00062d 	bl	3b18 <printf>
      exit();
    2260:	eb0004cb 	bl	3594 <exit>
      printf(1, "read bigfile failed\n");
    2264:	e3041cb0 	movw	r1, #19632	; 0x4cb0
    2268:	e3a00001 	mov	r0, #1
    226c:	e3401000 	movt	r1, #0
    2270:	eb000628 	bl	3b18 <printf>
      exit();
    2274:	eb0004c6 	bl	3594 <exit>
      printf(1, "write bigfile failed\n");
    2278:	e3041c80 	movw	r1, #19584	; 0x4c80
    227c:	e3a00001 	mov	r0, #1
    2280:	e3401000 	movt	r1, #0
    2284:	eb000623 	bl	3b18 <printf>
      exit();
    2288:	eb0004c1 	bl	3594 <exit>
    printf(1, "cannot open bigfile\n");
    228c:	e3041c98 	movw	r1, #19608	; 0x4c98
    2290:	e3a00001 	mov	r0, #1
    2294:	e3401000 	movt	r1, #0
    2298:	eb00061e 	bl	3b18 <printf>
    exit();
    229c:	eb0004bc 	bl	3594 <exit>
    printf(1, "cannot create bigfile");
    22a0:	e3041c68 	movw	r1, #19560	; 0x4c68
    22a4:	e3a00001 	mov	r0, #1
    22a8:	e3401000 	movt	r1, #0
    22ac:	eb000619 	bl	3b18 <printf>
    exit();
    22b0:	eb0004b7 	bl	3594 <exit>
    printf(1, "read bigfile wrong total\n");
    22b4:	e3041cf8 	movw	r1, #19704	; 0x4cf8
    22b8:	e3a00001 	mov	r0, #1
    22bc:	e3401000 	movt	r1, #0
    22c0:	eb000614 	bl	3b18 <printf>
    exit();
    22c4:	eb0004b2 	bl	3594 <exit>

000022c8 <fourteen>:
{
    22c8:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fourteen test\n");
    22cc:	e3a00001 	mov	r0, #1
{
    22d0:	e28db00c 	add	fp, sp, #12
  printf(1, "fourteen test\n");
    22d4:	e3041d28 	movw	r1, #19752	; 0x4d28
    22d8:	e3401000 	movt	r1, #0
    22dc:	eb00060d 	bl	3b18 <printf>
  if(mkdir("12345678901234") != 0){
    22e0:	e3040ee4 	movw	r0, #20196	; 0x4ee4
    22e4:	e3400000 	movt	r0, #0
    22e8:	eb00056c 	bl	38a0 <mkdir>
    22ec:	e3500000 	cmp	r0, #0
    22f0:	1a000022 	bne	2380 <fourteen+0xb8>
  if(mkdir("12345678901234/123456789012345") != 0){
    22f4:	e3040d58 	movw	r0, #19800	; 0x4d58
    22f8:	e3400000 	movt	r0, #0
    22fc:	eb000567 	bl	38a0 <mkdir>
    2300:	e2504000 	subs	r4, r0, #0
    2304:	1a000036 	bne	23e4 <fourteen+0x11c>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2308:	e3040da8 	movw	r0, #19880	; 0x4da8
    230c:	e3a01c02 	mov	r1, #512	; 0x200
    2310:	e3400000 	movt	r0, #0
    2314:	eb000520 	bl	379c <open>
  if(fd < 0){
    2318:	e3500000 	cmp	r0, #0
    231c:	ba00002b 	blt	23d0 <fourteen+0x108>
  close(fd);
    2320:	eb0004f6 	bl	3700 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2324:	e1a01004 	mov	r1, r4
    2328:	e3040e18 	movw	r0, #19992	; 0x4e18
    232c:	e3400000 	movt	r0, #0
    2330:	eb000519 	bl	379c <open>
  if(fd < 0){
    2334:	e3500000 	cmp	r0, #0
    2338:	ba00001f 	blt	23bc <fourteen+0xf4>
  close(fd);
    233c:	eb0004ef 	bl	3700 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2340:	e3040e84 	movw	r0, #20100	; 0x4e84
    2344:	e3400000 	movt	r0, #0
    2348:	eb000554 	bl	38a0 <mkdir>
    234c:	e3500000 	cmp	r0, #0
    2350:	0a000014 	beq	23a8 <fourteen+0xe0>
  if(mkdir("123456789012345/12345678901234") == 0){
    2354:	e3040ed4 	movw	r0, #20180	; 0x4ed4
    2358:	e3400000 	movt	r0, #0
    235c:	eb00054f 	bl	38a0 <mkdir>
    2360:	e3500000 	cmp	r0, #0
    2364:	0a00000a 	beq	2394 <fourteen+0xcc>
  printf(1, "fourteen ok\n");
    2368:	e3041f28 	movw	r1, #20264	; 0x4f28
    236c:	e3a00001 	mov	r0, #1
    2370:	e3401000 	movt	r1, #0
}
    2374:	e24bd00c 	sub	sp, fp, #12
    2378:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fourteen ok\n");
    237c:	ea0005e5 	b	3b18 <printf>
    printf(1, "mkdir 12345678901234 failed\n");
    2380:	e3041d38 	movw	r1, #19768	; 0x4d38
    2384:	e3a00001 	mov	r0, #1
    2388:	e3401000 	movt	r1, #0
    238c:	eb0005e1 	bl	3b18 <printf>
    exit();
    2390:	eb00047f 	bl	3594 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2394:	e3041ef4 	movw	r1, #20212	; 0x4ef4
    2398:	e3a00001 	mov	r0, #1
    239c:	e3401000 	movt	r1, #0
    23a0:	eb0005dc 	bl	3b18 <printf>
    exit();
    23a4:	eb00047a 	bl	3594 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    23a8:	e3041ea4 	movw	r1, #20132	; 0x4ea4
    23ac:	e3a00001 	mov	r0, #1
    23b0:	e3401000 	movt	r1, #0
    23b4:	eb0005d7 	bl	3b18 <printf>
    exit();
    23b8:	eb000475 	bl	3594 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    23bc:	e3041e48 	movw	r1, #20040	; 0x4e48
    23c0:	e3a00001 	mov	r0, #1
    23c4:	e3401000 	movt	r1, #0
    23c8:	eb0005d2 	bl	3b18 <printf>
    exit();
    23cc:	eb000470 	bl	3594 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    23d0:	e3041dd8 	movw	r1, #19928	; 0x4dd8
    23d4:	e3a00001 	mov	r0, #1
    23d8:	e3401000 	movt	r1, #0
    23dc:	eb0005cd 	bl	3b18 <printf>
    exit();
    23e0:	eb00046b 	bl	3594 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    23e4:	e3041d78 	movw	r1, #19832	; 0x4d78
    23e8:	e3a00001 	mov	r0, #1
    23ec:	e3401000 	movt	r1, #0
    23f0:	eb0005c8 	bl	3b18 <printf>
    exit();
    23f4:	eb000466 	bl	3594 <exit>

000023f8 <rmdot>:
{
    23f8:	e92d4800 	push	{fp, lr}
  printf(1, "rmdot test\n");
    23fc:	e3a00001 	mov	r0, #1
{
    2400:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    2404:	e3041f38 	movw	r1, #20280	; 0x4f38
    2408:	e3401000 	movt	r1, #0
    240c:	eb0005c1 	bl	3b18 <printf>
  if(mkdir("dots") != 0){
    2410:	e3040f44 	movw	r0, #20292	; 0x4f44
    2414:	e3400000 	movt	r0, #0
    2418:	eb000520 	bl	38a0 <mkdir>
    241c:	e3500000 	cmp	r0, #0
    2420:	1a000028 	bne	24c8 <rmdot+0xd0>
  if(chdir("dots") != 0){
    2424:	e3040f44 	movw	r0, #20292	; 0x4f44
    2428:	e3400000 	movt	r0, #0
    242c:	eb000528 	bl	38d4 <chdir>
    2430:	e3500000 	cmp	r0, #0
    2434:	1a000046 	bne	2554 <rmdot+0x15c>
  if(unlink(".") == 0){
    2438:	e3040604 	movw	r0, #17924	; 0x4604
    243c:	e3400000 	movt	r0, #0
    2440:	eb0004ef 	bl	3804 <unlink>
    2444:	e3500000 	cmp	r0, #0
    2448:	0a00003c 	beq	2540 <rmdot+0x148>
  if(unlink("..") == 0){
    244c:	e3040148 	movw	r0, #16712	; 0x4148
    2450:	e3400000 	movt	r0, #0
    2454:	eb0004ea 	bl	3804 <unlink>
    2458:	e3500000 	cmp	r0, #0
    245c:	0a000032 	beq	252c <rmdot+0x134>
  if(chdir("/") != 0){
    2460:	e3040f94 	movw	r0, #20372	; 0x4f94
    2464:	e3400000 	movt	r0, #0
    2468:	eb000519 	bl	38d4 <chdir>
    246c:	e3500000 	cmp	r0, #0
    2470:	1a000028 	bne	2518 <rmdot+0x120>
  if(unlink("dots/.") == 0){
    2474:	e3040fa8 	movw	r0, #20392	; 0x4fa8
    2478:	e3400000 	movt	r0, #0
    247c:	eb0004e0 	bl	3804 <unlink>
    2480:	e3500000 	cmp	r0, #0
    2484:	0a00001e 	beq	2504 <rmdot+0x10c>
  if(unlink("dots/..") == 0){
    2488:	e3040fc8 	movw	r0, #20424	; 0x4fc8
    248c:	e3400000 	movt	r0, #0
    2490:	eb0004db 	bl	3804 <unlink>
    2494:	e3500000 	cmp	r0, #0
    2498:	0a000014 	beq	24f0 <rmdot+0xf8>
  if(unlink("dots") != 0){
    249c:	e3040f44 	movw	r0, #20292	; 0x4f44
    24a0:	e3400000 	movt	r0, #0
    24a4:	eb0004d6 	bl	3804 <unlink>
    24a8:	e3500000 	cmp	r0, #0
    24ac:	1a00000a 	bne	24dc <rmdot+0xe4>
  printf(1, "rmdot ok\n");
    24b0:	e3051000 	movw	r1, #20480	; 0x5000
    24b4:	e3a00001 	mov	r0, #1
    24b8:	e3401000 	movt	r1, #0
}
    24bc:	e24bd004 	sub	sp, fp, #4
    24c0:	e8bd4800 	pop	{fp, lr}
  printf(1, "rmdot ok\n");
    24c4:	ea000593 	b	3b18 <printf>
    printf(1, "mkdir dots failed\n");
    24c8:	e3041f4c 	movw	r1, #20300	; 0x4f4c
    24cc:	e3a00001 	mov	r0, #1
    24d0:	e3401000 	movt	r1, #0
    24d4:	eb00058f 	bl	3b18 <printf>
    exit();
    24d8:	eb00042d 	bl	3594 <exit>
    printf(1, "unlink dots failed!\n");
    24dc:	e3041fe8 	movw	r1, #20456	; 0x4fe8
    24e0:	e3a00001 	mov	r0, #1
    24e4:	e3401000 	movt	r1, #0
    24e8:	eb00058a 	bl	3b18 <printf>
    exit();
    24ec:	eb000428 	bl	3594 <exit>
    printf(1, "unlink dots/.. worked!\n");
    24f0:	e3041fd0 	movw	r1, #20432	; 0x4fd0
    24f4:	e3a00001 	mov	r0, #1
    24f8:	e3401000 	movt	r1, #0
    24fc:	eb000585 	bl	3b18 <printf>
    exit();
    2500:	eb000423 	bl	3594 <exit>
    printf(1, "unlink dots/. worked!\n");
    2504:	e3041fb0 	movw	r1, #20400	; 0x4fb0
    2508:	e3a00001 	mov	r0, #1
    250c:	e3401000 	movt	r1, #0
    2510:	eb000580 	bl	3b18 <printf>
    exit();
    2514:	eb00041e 	bl	3594 <exit>
    printf(1, "chdir / failed\n");
    2518:	e3041f98 	movw	r1, #20376	; 0x4f98
    251c:	e3a00001 	mov	r0, #1
    2520:	e3401000 	movt	r1, #0
    2524:	eb00057b 	bl	3b18 <printf>
    exit();
    2528:	eb000419 	bl	3594 <exit>
    printf(1, "rm .. worked!\n");
    252c:	e3041f84 	movw	r1, #20356	; 0x4f84
    2530:	e3a00001 	mov	r0, #1
    2534:	e3401000 	movt	r1, #0
    2538:	eb000576 	bl	3b18 <printf>
    exit();
    253c:	eb000414 	bl	3594 <exit>
    printf(1, "rm . worked!\n");
    2540:	e3041f74 	movw	r1, #20340	; 0x4f74
    2544:	e3a00001 	mov	r0, #1
    2548:	e3401000 	movt	r1, #0
    254c:	eb000571 	bl	3b18 <printf>
    exit();
    2550:	eb00040f 	bl	3594 <exit>
    printf(1, "chdir dots failed\n");
    2554:	e3041f60 	movw	r1, #20320	; 0x4f60
    2558:	e3a00001 	mov	r0, #1
    255c:	e3401000 	movt	r1, #0
    2560:	eb00056c 	bl	3b18 <printf>
    exit();
    2564:	eb00040a 	bl	3594 <exit>

00002568 <dirfile>:
{
    2568:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "dir vs file\n");
    256c:	e3a00001 	mov	r0, #1
{
    2570:	e28db00c 	add	fp, sp, #12
  printf(1, "dir vs file\n");
    2574:	e305100c 	movw	r1, #20492	; 0x500c
    2578:	e3401000 	movt	r1, #0
    257c:	eb000565 	bl	3b18 <printf>
  fd = open("dirfile", O_CREATE);
    2580:	e305001c 	movw	r0, #20508	; 0x501c
    2584:	e3a01c02 	mov	r1, #512	; 0x200
    2588:	e3400000 	movt	r0, #0
    258c:	eb000482 	bl	379c <open>
  if(fd < 0){
    2590:	e3500000 	cmp	r0, #0
    2594:	ba00004a 	blt	26c4 <dirfile+0x15c>
  close(fd);
    2598:	eb000458 	bl	3700 <close>
  if(chdir("dirfile") == 0){
    259c:	e305001c 	movw	r0, #20508	; 0x501c
    25a0:	e3400000 	movt	r0, #0
    25a4:	eb0004ca 	bl	38d4 <chdir>
    25a8:	e3500000 	cmp	r0, #0
    25ac:	0a00003f 	beq	26b0 <dirfile+0x148>
  fd = open("dirfile/xx", 0);
    25b0:	e3050058 	movw	r0, #20568	; 0x5058
    25b4:	e3a01000 	mov	r1, #0
    25b8:	e3400000 	movt	r0, #0
    25bc:	eb000476 	bl	379c <open>
  if(fd >= 0){
    25c0:	e3500000 	cmp	r0, #0
    25c4:	aa000034 	bge	269c <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    25c8:	e3050058 	movw	r0, #20568	; 0x5058
    25cc:	e3a01c02 	mov	r1, #512	; 0x200
    25d0:	e3400000 	movt	r0, #0
    25d4:	eb000470 	bl	379c <open>
  if(fd >= 0){
    25d8:	e3500000 	cmp	r0, #0
    25dc:	aa00002e 	bge	269c <dirfile+0x134>
  if(mkdir("dirfile/xx") == 0){
    25e0:	e3050058 	movw	r0, #20568	; 0x5058
    25e4:	e3400000 	movt	r0, #0
    25e8:	eb0004ac 	bl	38a0 <mkdir>
    25ec:	e3500000 	cmp	r0, #0
    25f0:	0a000051 	beq	273c <dirfile+0x1d4>
  if(unlink("dirfile/xx") == 0){
    25f4:	e3050058 	movw	r0, #20568	; 0x5058
    25f8:	e3400000 	movt	r0, #0
    25fc:	eb000480 	bl	3804 <unlink>
    2600:	e3500000 	cmp	r0, #0
    2604:	0a000047 	beq	2728 <dirfile+0x1c0>
  if(link("README", "dirfile/xx") == 0){
    2608:	e3051058 	movw	r1, #20568	; 0x5058
    260c:	e30500c4 	movw	r0, #20676	; 0x50c4
    2610:	e3401000 	movt	r1, #0
    2614:	e3400000 	movt	r0, #0
    2618:	eb000493 	bl	386c <link>
    261c:	e3500000 	cmp	r0, #0
    2620:	0a00003b 	beq	2714 <dirfile+0x1ac>
  if(unlink("dirfile") != 0){
    2624:	e305001c 	movw	r0, #20508	; 0x501c
    2628:	e3400000 	movt	r0, #0
    262c:	eb000474 	bl	3804 <unlink>
    2630:	e2504000 	subs	r4, r0, #0
    2634:	1a000031 	bne	2700 <dirfile+0x198>
  fd = open(".", O_RDWR);
    2638:	e3040604 	movw	r0, #17924	; 0x4604
    263c:	e3a01002 	mov	r1, #2
    2640:	e3400000 	movt	r0, #0
    2644:	eb000454 	bl	379c <open>
  if(fd >= 0){
    2648:	e3500000 	cmp	r0, #0
    264c:	aa000026 	bge	26ec <dirfile+0x184>
  fd = open(".", 0);
    2650:	e1a01004 	mov	r1, r4
    2654:	e3040604 	movw	r0, #17924	; 0x4604
    2658:	e3400000 	movt	r0, #0
    265c:	eb00044e 	bl	379c <open>
  if(write(fd, "x", 1) > 0){
    2660:	e3041b64 	movw	r1, #19300	; 0x4b64
    2664:	e3a02001 	mov	r2, #1
    2668:	e3401000 	movt	r1, #0
  fd = open(".", 0);
    266c:	e1a04000 	mov	r4, r0
  if(write(fd, "x", 1) > 0){
    2670:	eb000415 	bl	36cc <write>
    2674:	e3500000 	cmp	r0, #0
    2678:	ca000016 	bgt	26d8 <dirfile+0x170>
  close(fd);
    267c:	e1a00004 	mov	r0, r4
    2680:	eb00041e 	bl	3700 <close>
  printf(1, "dir vs file OK\n");
    2684:	e3051138 	movw	r1, #20792	; 0x5138
    2688:	e3a00001 	mov	r0, #1
    268c:	e3401000 	movt	r1, #0
}
    2690:	e24bd00c 	sub	sp, fp, #12
    2694:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "dir vs file OK\n");
    2698:	ea00051e 	b	3b18 <printf>
    printf(1, "create dirfile/xx succeeded!\n");
    269c:	e3051064 	movw	r1, #20580	; 0x5064
    26a0:	e3a00001 	mov	r0, #1
    26a4:	e3401000 	movt	r1, #0
    26a8:	eb00051a 	bl	3b18 <printf>
    exit();
    26ac:	eb0003b8 	bl	3594 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    26b0:	e305103c 	movw	r1, #20540	; 0x503c
    26b4:	e3a00001 	mov	r0, #1
    26b8:	e3401000 	movt	r1, #0
    26bc:	eb000515 	bl	3b18 <printf>
    exit();
    26c0:	eb0003b3 	bl	3594 <exit>
    printf(1, "create dirfile failed\n");
    26c4:	e3051024 	movw	r1, #20516	; 0x5024
    26c8:	e3a00001 	mov	r0, #1
    26cc:	e3401000 	movt	r1, #0
    26d0:	eb000510 	bl	3b18 <printf>
    exit();
    26d4:	eb0003ae 	bl	3594 <exit>
    printf(1, "write . succeeded!\n");
    26d8:	e3051124 	movw	r1, #20772	; 0x5124
    26dc:	e3a00001 	mov	r0, #1
    26e0:	e3401000 	movt	r1, #0
    26e4:	eb00050b 	bl	3b18 <printf>
    exit();
    26e8:	eb0003a9 	bl	3594 <exit>
    printf(1, "open . for writing succeeded!\n");
    26ec:	e3051104 	movw	r1, #20740	; 0x5104
    26f0:	e3a00001 	mov	r0, #1
    26f4:	e3401000 	movt	r1, #0
    26f8:	eb000506 	bl	3b18 <printf>
    exit();
    26fc:	eb0003a4 	bl	3594 <exit>
    printf(1, "unlink dirfile failed!\n");
    2700:	e30510ec 	movw	r1, #20716	; 0x50ec
    2704:	e3a00001 	mov	r0, #1
    2708:	e3401000 	movt	r1, #0
    270c:	eb000501 	bl	3b18 <printf>
    exit();
    2710:	eb00039f 	bl	3594 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2714:	e30510cc 	movw	r1, #20684	; 0x50cc
    2718:	e3a00001 	mov	r0, #1
    271c:	e3401000 	movt	r1, #0
    2720:	eb0004fc 	bl	3b18 <printf>
    exit();
    2724:	eb00039a 	bl	3594 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2728:	e30510a4 	movw	r1, #20644	; 0x50a4
    272c:	e3a00001 	mov	r0, #1
    2730:	e3401000 	movt	r1, #0
    2734:	eb0004f7 	bl	3b18 <printf>
    exit();
    2738:	eb000395 	bl	3594 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    273c:	e3051084 	movw	r1, #20612	; 0x5084
    2740:	e3a00001 	mov	r0, #1
    2744:	e3401000 	movt	r1, #0
    2748:	eb0004f2 	bl	3b18 <printf>
    exit();
    274c:	eb000390 	bl	3594 <exit>

00002750 <iref>:
{
    2750:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name\n");
    2754:	e3051148 	movw	r1, #20808	; 0x5148
{
    2758:	e28db014 	add	fp, sp, #20
  printf(1, "empty file name\n");
    275c:	e3a00001 	mov	r0, #1
    2760:	e3401000 	movt	r1, #0
    if(mkdir("irefd") != 0){
    2764:	e305615c 	movw	r6, #20828	; 0x515c
  printf(1, "empty file name\n");
    2768:	eb0004ea 	bl	3b18 <printf>
    mkdir("");
    276c:	e3044f24 	movw	r4, #20260	; 0x4f24
    link("README", "");
    2770:	e30570c4 	movw	r7, #20676	; 0x50c4
    if(mkdir("irefd") != 0){
    2774:	e3406000 	movt	r6, #0
    mkdir("");
    2778:	e3404000 	movt	r4, #0
    link("README", "");
    277c:	e3407000 	movt	r7, #0
  printf(1, "empty file name\n");
    2780:	e3a05033 	mov	r5, #51	; 0x33
    if(mkdir("irefd") != 0){
    2784:	e1a00006 	mov	r0, r6
    2788:	eb000444 	bl	38a0 <mkdir>
    278c:	e3500000 	cmp	r0, #0
    2790:	1a000023 	bne	2824 <iref+0xd4>
    if(chdir("irefd") != 0){
    2794:	e1a00006 	mov	r0, r6
    2798:	eb00044d 	bl	38d4 <chdir>
    279c:	e3500000 	cmp	r0, #0
    27a0:	1a000024 	bne	2838 <iref+0xe8>
    mkdir("");
    27a4:	e1a00004 	mov	r0, r4
    27a8:	eb00043c 	bl	38a0 <mkdir>
    link("README", "");
    27ac:	e1a01004 	mov	r1, r4
    27b0:	e1a00007 	mov	r0, r7
    27b4:	eb00042c 	bl	386c <link>
    fd = open("", O_CREATE);
    27b8:	e3a01c02 	mov	r1, #512	; 0x200
    27bc:	e1a00004 	mov	r0, r4
    27c0:	eb0003f5 	bl	379c <open>
    if(fd >= 0)
    27c4:	e3500000 	cmp	r0, #0
    27c8:	ba000000 	blt	27d0 <iref+0x80>
      close(fd);
    27cc:	eb0003cb 	bl	3700 <close>
    fd = open("xx", O_CREATE);
    27d0:	e3050060 	movw	r0, #20576	; 0x5060
    27d4:	e3a01c02 	mov	r1, #512	; 0x200
    27d8:	e3400000 	movt	r0, #0
    27dc:	eb0003ee 	bl	379c <open>
    if(fd >= 0)
    27e0:	e3500000 	cmp	r0, #0
    27e4:	ba000000 	blt	27ec <iref+0x9c>
      close(fd);
    27e8:	eb0003c4 	bl	3700 <close>
    unlink("xx");
    27ec:	e3050060 	movw	r0, #20576	; 0x5060
    27f0:	e3400000 	movt	r0, #0
    27f4:	eb000402 	bl	3804 <unlink>
  for(i = 0; i < 50 + 1; i++){
    27f8:	e2555001 	subs	r5, r5, #1
    27fc:	1affffe0 	bne	2784 <iref+0x34>
  chdir("/");
    2800:	e3040f94 	movw	r0, #20372	; 0x4f94
    2804:	e3400000 	movt	r0, #0
    2808:	eb000431 	bl	38d4 <chdir>
  printf(1, "empty file name OK\n");
    280c:	e305118c 	movw	r1, #20876	; 0x518c
    2810:	e3a00001 	mov	r0, #1
    2814:	e3401000 	movt	r1, #0
}
    2818:	e24bd014 	sub	sp, fp, #20
    281c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name OK\n");
    2820:	ea0004bc 	b	3b18 <printf>
      printf(1, "mkdir irefd failed\n");
    2824:	e3051164 	movw	r1, #20836	; 0x5164
    2828:	e3a00001 	mov	r0, #1
    282c:	e3401000 	movt	r1, #0
    2830:	eb0004b8 	bl	3b18 <printf>
      exit();
    2834:	eb000356 	bl	3594 <exit>
      printf(1, "chdir irefd failed\n");
    2838:	e3051178 	movw	r1, #20856	; 0x5178
    283c:	e3a00001 	mov	r0, #1
    2840:	e3401000 	movt	r1, #0
    2844:	eb0004b3 	bl	3b18 <printf>
      exit();
    2848:	eb000351 	bl	3594 <exit>

0000284c <forktest>:
{
    284c:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fork test\n");
    2850:	e30511a0 	movw	r1, #20896	; 0x51a0
{
    2854:	e28db00c 	add	fp, sp, #12
  printf(1, "fork test\n");
    2858:	e3a00001 	mov	r0, #1
    285c:	e3401000 	movt	r1, #0
  for(n=0; n<1000; n++){
    2860:	e3a04000 	mov	r4, #0
  printf(1, "fork test\n");
    2864:	eb0004ab 	bl	3b18 <printf>
    2868:	ea000003 	b	287c <forktest+0x30>
    if(pid == 0)
    286c:	0a00001e 	beq	28ec <forktest+0xa0>
  for(n=0; n<1000; n++){
    2870:	e2844001 	add	r4, r4, #1
    2874:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    2878:	0a000012 	beq	28c8 <forktest+0x7c>
    pid = fork();
    287c:	eb000337 	bl	3560 <fork>
    if(pid < 0)
    2880:	e3500000 	cmp	r0, #0
    2884:	aafffff8 	bge	286c <forktest+0x20>
  for(; n > 0; n--){
    2888:	e3540000 	cmp	r4, #0
    288c:	0a000004 	beq	28a4 <forktest+0x58>
    if(wait() < 0){
    2890:	eb00034c 	bl	35c8 <wait>
    2894:	e3500000 	cmp	r0, #0
    2898:	ba00000f 	blt	28dc <forktest+0x90>
  for(; n > 0; n--){
    289c:	e2544001 	subs	r4, r4, #1
    28a0:	1afffffa 	bne	2890 <forktest+0x44>
  if(wait() != -1){
    28a4:	eb000347 	bl	35c8 <wait>
    28a8:	e3700001 	cmn	r0, #1
    28ac:	1a00000f 	bne	28f0 <forktest+0xa4>
  printf(1, "fork test OK\n");
    28b0:	e30511d4 	movw	r1, #20948	; 0x51d4
    28b4:	e3a00001 	mov	r0, #1
    28b8:	e3401000 	movt	r1, #0
}
    28bc:	e24bd00c 	sub	sp, fp, #12
    28c0:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fork test OK\n");
    28c4:	ea000493 	b	3b18 <printf>
    printf(1, "fork claimed to work 1000 times!\n");
    28c8:	e30511e4 	movw	r1, #20964	; 0x51e4
    28cc:	e3a00001 	mov	r0, #1
    28d0:	e3401000 	movt	r1, #0
    28d4:	eb00048f 	bl	3b18 <printf>
    exit();
    28d8:	eb00032d 	bl	3594 <exit>
      printf(1, "wait stopped early\n");
    28dc:	e30511ac 	movw	r1, #20908	; 0x51ac
    28e0:	e3a00001 	mov	r0, #1
    28e4:	e3401000 	movt	r1, #0
    28e8:	eb00048a 	bl	3b18 <printf>
      exit();
    28ec:	eb000328 	bl	3594 <exit>
    printf(1, "wait got too many\n");
    28f0:	e30511c0 	movw	r1, #20928	; 0x51c0
    28f4:	e3a00001 	mov	r0, #1
    28f8:	e3401000 	movt	r1, #0
    28fc:	eb000485 	bl	3b18 <printf>
    exit();
    2900:	eb000323 	bl	3594 <exit>

00002904 <sbrktest>:
{
    2904:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "sbrk test\n");
    2908:	e305688c 	movw	r6, #22668	; 0x588c
    290c:	e3406000 	movt	r6, #0
{
    2910:	e28db01c 	add	fp, sp, #28
  for(i = 0; i < 5000; i++){ 
    2914:	e3a05000 	mov	r5, #0
{
    2918:	e24dd028 	sub	sp, sp, #40	; 0x28
  printf(stdout, "sbrk test\n");
    291c:	e3051208 	movw	r1, #21000	; 0x5208
    2920:	e3401000 	movt	r1, #0
    2924:	e5960000 	ldr	r0, [r6]
    2928:	eb00047a 	bl	3b18 <printf>
  oldbrk = sbrk(0);
    292c:	e1a00005 	mov	r0, r5
    2930:	eb00040e 	bl	3970 <sbrk>
  printf(stdout, "test #1 sbrk() less than a page?\n");
    2934:	e3051214 	movw	r1, #21012	; 0x5214
    2938:	e3401000 	movt	r1, #0
    b = sbrk(1);
    293c:	e3a09001 	mov	r9, #1
  for(i = 0; i < 5000; i++){ 
    2940:	e3017388 	movw	r7, #5000	; 0x1388
  oldbrk = sbrk(0);
    2944:	e1a08000 	mov	r8, r0
  printf(stdout, "test #1 sbrk() less than a page?\n");
    2948:	e5960000 	ldr	r0, [r6]
    294c:	eb000471 	bl	3b18 <printf>
  a = sbrk(0);
    2950:	e1a00005 	mov	r0, r5
    2954:	eb000405 	bl	3970 <sbrk>
    2958:	e1a04000 	mov	r4, r0
    295c:	ea000000 	b	2964 <sbrktest+0x60>
    a = b + 1;
    2960:	e1a04001 	mov	r4, r1
    b = sbrk(1);
    2964:	e3a00001 	mov	r0, #1
    2968:	eb000400 	bl	3970 <sbrk>
    if(b != a){
    296c:	e1500004 	cmp	r0, r4
    2970:	1a000133 	bne	2e44 <sbrktest+0x540>
  for(i = 0; i < 5000; i++){ 
    2974:	e2855001 	add	r5, r5, #1
    *b = 1;
    2978:	e1a01004 	mov	r1, r4
  for(i = 0; i < 5000; i++){ 
    297c:	e1550007 	cmp	r5, r7
    *b = 1;
    2980:	e4c19001 	strb	r9, [r1], #1
  for(i = 0; i < 5000; i++){ 
    2984:	1afffff5 	bne	2960 <sbrktest+0x5c>
  printf(stdout, "test #1 done.\n");
    2988:	e5960000 	ldr	r0, [r6]
    298c:	e3051254 	movw	r1, #21076	; 0x5254
    2990:	e3401000 	movt	r1, #0
    2994:	eb00045f 	bl	3b18 <printf>
  printf(stdout, "test #2 test fork?\n");
    2998:	e5960000 	ldr	r0, [r6]
    299c:	e3051264 	movw	r1, #21092	; 0x5264
    29a0:	e3401000 	movt	r1, #0
    29a4:	eb00045b 	bl	3b18 <printf>
  pid = fork();
    29a8:	eb0002ec 	bl	3560 <fork>
  if(pid < 0){
    29ac:	e2505000 	subs	r5, r0, #0
    29b0:	ba00011e 	blt	2e30 <sbrktest+0x52c>
  printf(stdout, "test #2 done.\n");
    29b4:	e5960000 	ldr	r0, [r6]
    29b8:	e3051290 	movw	r1, #21136	; 0x5290
    29bc:	e3401000 	movt	r1, #0
  if(c != a + 1){
    29c0:	e2844002 	add	r4, r4, #2
  printf(stdout, "test #2 done.\n");
    29c4:	eb000453 	bl	3b18 <printf>
  printf(stdout, "test #3 post-fork.\n");
    29c8:	e5960000 	ldr	r0, [r6]
    29cc:	e30512a0 	movw	r1, #21152	; 0x52a0
    29d0:	e3401000 	movt	r1, #0
    29d4:	eb00044f 	bl	3b18 <printf>
  c = sbrk(1);
    29d8:	e3a00001 	mov	r0, #1
    29dc:	eb0003e3 	bl	3970 <sbrk>
  c = sbrk(1);
    29e0:	e3a00001 	mov	r0, #1
    29e4:	eb0003e1 	bl	3970 <sbrk>
  if(c != a + 1){
    29e8:	e1540000 	cmp	r4, r0
    29ec:	1a00010a 	bne	2e1c <sbrktest+0x518>
  if(pid == 0)
    29f0:	e3550000 	cmp	r5, #0
    29f4:	0a000107 	beq	2e18 <sbrktest+0x514>
  wait();
    29f8:	eb0002f2 	bl	35c8 <wait>
  printf(stdout, "test #3 done.\n");
    29fc:	e5960000 	ldr	r0, [r6]
    2a00:	e30512d0 	movw	r1, #21200	; 0x52d0
    2a04:	e3401000 	movt	r1, #0
    2a08:	eb000442 	bl	3b18 <printf>
  printf(stdout, "test #4 grow address space to something big.\n");
    2a0c:	e5960000 	ldr	r0, [r6]
    2a10:	e30512e0 	movw	r1, #21216	; 0x52e0
    2a14:	e3401000 	movt	r1, #0
    2a18:	eb00043e 	bl	3b18 <printf>
  a = sbrk(0);
    2a1c:	e3a00000 	mov	r0, #0
    2a20:	eb0003d2 	bl	3970 <sbrk>
    2a24:	e1a04000 	mov	r4, r0
  p = sbrk(amt);
    2a28:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2a2c:	eb0003cf 	bl	3970 <sbrk>
  if (p != a) { 
    2a30:	e1540000 	cmp	r4, r0
    2a34:	1a0000f3 	bne	2e08 <sbrktest+0x504>
  *lastaddr = 99;
    2a38:	e30f3fff 	movw	r3, #65535	; 0xffff
    2a3c:	e340363f 	movt	r3, #1599	; 0x63f
    2a40:	e3a02063 	mov	r2, #99	; 0x63
  printf(stdout, "test #4 done.\n");
    2a44:	e3051350 	movw	r1, #21328	; 0x5350
  *lastaddr = 99;
    2a48:	e5c32000 	strb	r2, [r3]
  printf(stdout, "test #4 done.\n");
    2a4c:	e3401000 	movt	r1, #0
    2a50:	e5960000 	ldr	r0, [r6]
    2a54:	eb00042f 	bl	3b18 <printf>
  printf(stdout, "test #5 de-allocate\n");
    2a58:	e5960000 	ldr	r0, [r6]
    2a5c:	e3051360 	movw	r1, #21344	; 0x5360
    2a60:	e3401000 	movt	r1, #0
    2a64:	eb00042b 	bl	3b18 <printf>
  a = sbrk(0);
    2a68:	e3a00000 	mov	r0, #0
    2a6c:	eb0003bf 	bl	3970 <sbrk>
    2a70:	e1a04000 	mov	r4, r0
  c = sbrk(-4096);
    2a74:	e3a00a0f 	mov	r0, #61440	; 0xf000
    2a78:	e34f0fff 	movt	r0, #65535	; 0xffff
    2a7c:	eb0003bb 	bl	3970 <sbrk>
  if(c == (char*)0xffffffff){
    2a80:	e3700001 	cmn	r0, #1
    2a84:	0a0000da 	beq	2df4 <sbrktest+0x4f0>
  c = sbrk(0);
    2a88:	e3a00000 	mov	r0, #0
    2a8c:	eb0003b7 	bl	3970 <sbrk>
  if(c != a - 4096){
    2a90:	e2442a01 	sub	r2, r4, #4096	; 0x1000
    2a94:	e1500002 	cmp	r0, r2
  c = sbrk(0);
    2a98:	e1a03000 	mov	r3, r0
  if(c != a - 4096){
    2a9c:	1a0000ce 	bne	2ddc <sbrktest+0x4d8>
  printf(stdout, "test #5 done.\n");
    2aa0:	e5960000 	ldr	r0, [r6]
    2aa4:	e30513cc 	movw	r1, #21452	; 0x53cc
    2aa8:	e3401000 	movt	r1, #0
    2aac:	eb000419 	bl	3b18 <printf>
  printf(stdout, "test #6 re-allocate page.\n");
    2ab0:	e5960000 	ldr	r0, [r6]
    2ab4:	e30513dc 	movw	r1, #21468	; 0x53dc
    2ab8:	e3401000 	movt	r1, #0
    2abc:	eb000415 	bl	3b18 <printf>
  a = sbrk(0);
    2ac0:	e3a00000 	mov	r0, #0
    2ac4:	eb0003a9 	bl	3970 <sbrk>
    2ac8:	e1a04000 	mov	r4, r0
  c = sbrk(4096);
    2acc:	e3a00a01 	mov	r0, #4096	; 0x1000
    2ad0:	eb0003a6 	bl	3970 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2ad4:	e1540000 	cmp	r4, r0
  c = sbrk(4096);
    2ad8:	e1a05000 	mov	r5, r0
  if(c != a || sbrk(0) != a + 4096){
    2adc:	1a0000b7 	bne	2dc0 <sbrktest+0x4bc>
    2ae0:	e3a00000 	mov	r0, #0
    2ae4:	eb0003a1 	bl	3970 <sbrk>
    2ae8:	e2843a01 	add	r3, r4, #4096	; 0x1000
    2aec:	e1530000 	cmp	r3, r0
    2af0:	1a0000b2 	bne	2dc0 <sbrktest+0x4bc>
  if(*lastaddr == 99){
    2af4:	e30f3fff 	movw	r3, #65535	; 0xffff
    2af8:	e340363f 	movt	r3, #1599	; 0x63f
    2afc:	e5960000 	ldr	r0, [r6]
    2b00:	e5d33000 	ldrb	r3, [r3]
    2b04:	e3530063 	cmp	r3, #99	; 0x63
    2b08:	0a0000a8 	beq	2db0 <sbrktest+0x4ac>
  printf(stdout, "test #6 done.\n");
    2b0c:	e3051450 	movw	r1, #21584	; 0x5450
    2b10:	e3401000 	movt	r1, #0
    2b14:	eb0003ff 	bl	3b18 <printf>
  printf(stdout, "test #7 downsize.\n");
    2b18:	e5960000 	ldr	r0, [r6]
    2b1c:	e3051460 	movw	r1, #21600	; 0x5460
    2b20:	e3401000 	movt	r1, #0
    2b24:	eb0003fb 	bl	3b18 <printf>
  a = sbrk(0);
    2b28:	e3a00000 	mov	r0, #0
    2b2c:	eb00038f 	bl	3970 <sbrk>
    2b30:	e1a04000 	mov	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2b34:	e3a00000 	mov	r0, #0
    2b38:	eb00038c 	bl	3970 <sbrk>
    2b3c:	e0480000 	sub	r0, r8, r0
    2b40:	eb00038a 	bl	3970 <sbrk>
  if(c != a){
    2b44:	e1540000 	cmp	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2b48:	e1a03000 	mov	r3, r0
  if(c != a){
    2b4c:	1a000091 	bne	2d98 <sbrktest+0x494>
  printf(stdout, "test #7 done.\n");
    2b50:	e5960000 	ldr	r0, [r6]
    2b54:	e3051498 	movw	r1, #21656	; 0x5498
    2b58:	e3401000 	movt	r1, #0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b5c:	e3085480 	movw	r5, #33920	; 0x8480
  printf(stdout, "test #7 done.\n");
    2b60:	eb0003ec 	bl	3b18 <printf>
  printf(stdout, "test #8 read the kernel's memory.\n");
    2b64:	e30514a8 	movw	r1, #21672	; 0x54a8
    2b68:	e5960000 	ldr	r0, [r6]
    2b6c:	e3401000 	movt	r1, #0
    2b70:	eb0003e8 	bl	3b18 <printf>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b74:	e348501e 	movt	r5, #32798	; 0x801e
    2b78:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
    2b7c:	e30c9350 	movw	r9, #50000	; 0xc350
    ppid = getpid();
    2b80:	eb00036d 	bl	393c <getpid>
    2b84:	e1a07000 	mov	r7, r0
    pid = fork();
    2b88:	eb000274 	bl	3560 <fork>
    if(pid < 0){
    2b8c:	e3500000 	cmp	r0, #0
    2b90:	ba00007b 	blt	2d84 <sbrktest+0x480>
    if(pid == 0){
    2b94:	0a000071 	beq	2d60 <sbrktest+0x45c>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b98:	e0844009 	add	r4, r4, r9
    wait();
    2b9c:	eb000289 	bl	35c8 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ba0:	e1540005 	cmp	r4, r5
    2ba4:	1afffff5 	bne	2b80 <sbrktest+0x27c>
  printf(stdout, "test #8 done.\n");
    2ba8:	e5960000 	ldr	r0, [r6]
    2bac:	e30514e8 	movw	r1, #21736	; 0x54e8
    2bb0:	e3401000 	movt	r1, #0
    2bb4:	eb0003d7 	bl	3b18 <printf>
  printf(stdout, "test #9 clean up the last failed allocation\n");
    2bb8:	e5960000 	ldr	r0, [r6]
    2bbc:	e30514f8 	movw	r1, #21752	; 0x54f8
    2bc0:	e3401000 	movt	r1, #0
    2bc4:	eb0003d3 	bl	3b18 <printf>
  if(pipe(fds) != 0){
    2bc8:	e24b0038 	sub	r0, fp, #56	; 0x38
    2bcc:	eb0002a4 	bl	3664 <pipe>
    2bd0:	e2507000 	subs	r7, r0, #0
    2bd4:	1a00005c 	bne	2d4c <sbrktest+0x448>
  printf(stdout, "test #9 done.\n");
    2bd8:	e5960000 	ldr	r0, [r6]
    2bdc:	e3051528 	movw	r1, #21800	; 0x5528
    2be0:	e3401000 	movt	r1, #0
    2be4:	e24b4030 	sub	r4, fp, #48	; 0x30
    2be8:	eb0003ca 	bl	3b18 <printf>
  printf(stdout, "test #10 memory utilization 1.\n");
    2bec:	e3051538 	movw	r1, #21816	; 0x5538
    2bf0:	e5960000 	ldr	r0, [r6]
    2bf4:	e3401000 	movt	r1, #0
    2bf8:	eb0003c6 	bl	3b18 <printf>
    2bfc:	e1a09004 	mov	r9, r4
    if((pids[i] = fork()) == 0){
    2c00:	eb000256 	bl	3560 <fork>
    2c04:	e3500000 	cmp	r0, #0
    2c08:	e1a05000 	mov	r5, r0
    2c0c:	e4890004 	str	r0, [r9], #4
    2c10:	0a000037 	beq	2cf4 <sbrktest+0x3f0>
    if(pids[i] != -1)
    2c14:	e3700001 	cmn	r0, #1
    2c18:	0a000003 	beq	2c2c <sbrktest+0x328>
      read(fds[0], &scratch, 1);
    2c1c:	e3a02001 	mov	r2, #1
    2c20:	e24b1039 	sub	r1, fp, #57	; 0x39
    2c24:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    2c28:	eb00029a 	bl	3698 <read>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2c2c:	e2877001 	add	r7, r7, #1
    2c30:	e3570005 	cmp	r7, #5
    2c34:	1afffff1 	bne	2c00 <sbrktest+0x2fc>
  printf(stdout, "test #10 done.\n");
    2c38:	e5960000 	ldr	r0, [r6]
    2c3c:	e3051568 	movw	r1, #21864	; 0x5568
    2c40:	e3401000 	movt	r1, #0
    2c44:	e2847014 	add	r7, r4, #20
    2c48:	eb0003b2 	bl	3b18 <printf>
  printf(stdout, "test #11 memory utilization 2.\n");
    2c4c:	e5960000 	ldr	r0, [r6]
    2c50:	e3051578 	movw	r1, #21880	; 0x5578
    2c54:	e3401000 	movt	r1, #0
    2c58:	eb0003ae 	bl	3b18 <printf>
  c = sbrk(4096);
    2c5c:	e3a00a01 	mov	r0, #4096	; 0x1000
    2c60:	eb000342 	bl	3970 <sbrk>
    2c64:	e1a05000 	mov	r5, r0
    if(pids[i] == -1)
    2c68:	e4940004 	ldr	r0, [r4], #4
    2c6c:	e3700001 	cmn	r0, #1
    2c70:	0a000001 	beq	2c7c <sbrktest+0x378>
    kill(pids[i]);
    2c74:	eb0002ae 	bl	3734 <kill>
    wait();
    2c78:	eb000252 	bl	35c8 <wait>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2c7c:	e1570004 	cmp	r7, r4
    2c80:	1afffff8 	bne	2c68 <sbrktest+0x364>
  printf(stdout, "test #11 done.\n");
    2c84:	e5960000 	ldr	r0, [r6]
    2c88:	e3051598 	movw	r1, #21912	; 0x5598
    2c8c:	e3401000 	movt	r1, #0
    2c90:	eb0003a0 	bl	3b18 <printf>
  printf(stdout, "test #12 leaked memory.\n");
    2c94:	e30515a8 	movw	r1, #21928	; 0x55a8
    2c98:	e5960000 	ldr	r0, [r6]
    2c9c:	e3401000 	movt	r1, #0
    2ca0:	eb00039c 	bl	3b18 <printf>
  if(c == (char*)0xffffffff){
    2ca4:	e3750001 	cmn	r5, #1
    2ca8:	0a000022 	beq	2d38 <sbrktest+0x434>
  printf(stdout, "test #12 done.\n");
    2cac:	e5960000 	ldr	r0, [r6]
    2cb0:	e30515e0 	movw	r1, #21984	; 0x55e0
    2cb4:	e3401000 	movt	r1, #0
    2cb8:	eb000396 	bl	3b18 <printf>
  if(sbrk(0) > oldbrk)
    2cbc:	e3a00000 	mov	r0, #0
    2cc0:	eb00032a 	bl	3970 <sbrk>
    2cc4:	e1580000 	cmp	r8, r0
    2cc8:	2a000003 	bcs	2cdc <sbrktest+0x3d8>
    sbrk(-(sbrk(0) - oldbrk));
    2ccc:	e3a00000 	mov	r0, #0
    2cd0:	eb000326 	bl	3970 <sbrk>
    2cd4:	e0480000 	sub	r0, r8, r0
    2cd8:	eb000324 	bl	3970 <sbrk>
  printf(stdout, "sbrk test OK\n");
    2cdc:	e5960000 	ldr	r0, [r6]
    2ce0:	e30515f0 	movw	r1, #22000	; 0x55f0
    2ce4:	e3401000 	movt	r1, #0
    2ce8:	eb00038a 	bl	3b18 <printf>
}
    2cec:	e24bd01c 	sub	sp, fp, #28
    2cf0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
      printf(stdout, "create pid:%d.\n",i);
    2cf4:	e1a02007 	mov	r2, r7
    2cf8:	e5960000 	ldr	r0, [r6]
    2cfc:	e3051558 	movw	r1, #21848	; 0x5558
    2d00:	e3401000 	movt	r1, #0
    2d04:	eb000383 	bl	3b18 <printf>
      sbrk(BIG - (uint)sbrk(0));
    2d08:	e1a00005 	mov	r0, r5
    2d0c:	eb000317 	bl	3970 <sbrk>
    2d10:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2d14:	eb000315 	bl	3970 <sbrk>
      write(fds[1], "x", 1);
    2d18:	e3041b64 	movw	r1, #19300	; 0x4b64
    2d1c:	e3a02001 	mov	r2, #1
    2d20:	e3401000 	movt	r1, #0
    2d24:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    2d28:	eb000267 	bl	36cc <write>
      for(;;) sleep(1000);
    2d2c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    2d30:	eb00031b 	bl	39a4 <sleep>
    2d34:	eafffffc 	b	2d2c <sbrktest+0x428>
    printf(stdout, "failed sbrk leaked memory\n");
    2d38:	e5960000 	ldr	r0, [r6]
    2d3c:	e30515c4 	movw	r1, #21956	; 0x55c4
    2d40:	e3401000 	movt	r1, #0
    2d44:	eb000373 	bl	3b18 <printf>
    exit();
    2d48:	eb000211 	bl	3594 <exit>
    printf(1, "pipe() failed\n");
    2d4c:	e3041194 	movw	r1, #16788	; 0x4194
    2d50:	e3a00001 	mov	r0, #1
    2d54:	e3401000 	movt	r1, #0
    2d58:	eb00036e 	bl	3b18 <printf>
    exit();
    2d5c:	eb00020c 	bl	3594 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2d60:	e5960000 	ldr	r0, [r6]
    2d64:	e1a02004 	mov	r2, r4
    2d68:	e5d43000 	ldrb	r3, [r4]
    2d6c:	e30514cc 	movw	r1, #21708	; 0x54cc
    2d70:	e3401000 	movt	r1, #0
    2d74:	eb000367 	bl	3b18 <printf>
      kill(ppid);
    2d78:	e1a00007 	mov	r0, r7
    2d7c:	eb00026c 	bl	3734 <kill>
      exit();
    2d80:	eb000203 	bl	3594 <exit>
      printf(stdout, "fork failed\n");
    2d84:	e5960000 	ldr	r0, [r6]
    2d88:	e3051790 	movw	r1, #22416	; 0x5790
    2d8c:	e3401000 	movt	r1, #0
    2d90:	eb000360 	bl	3b18 <printf>
      exit();
    2d94:	eb0001fe 	bl	3594 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2d98:	e1a02004 	mov	r2, r4
    2d9c:	e5960000 	ldr	r0, [r6]
    2da0:	e3051474 	movw	r1, #21620	; 0x5474
    2da4:	e3401000 	movt	r1, #0
    2da8:	eb00035a 	bl	3b18 <printf>
    exit();
    2dac:	eb0001f8 	bl	3594 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2db0:	e3051420 	movw	r1, #21536	; 0x5420
    2db4:	e3401000 	movt	r1, #0
    2db8:	eb000356 	bl	3b18 <printf>
    exit();
    2dbc:	eb0001f4 	bl	3594 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2dc0:	e1a03005 	mov	r3, r5
    2dc4:	e1a02004 	mov	r2, r4
    2dc8:	e5960000 	ldr	r0, [r6]
    2dcc:	e30513f8 	movw	r1, #21496	; 0x53f8
    2dd0:	e3401000 	movt	r1, #0
    2dd4:	eb00034f 	bl	3b18 <printf>
    exit();
    2dd8:	eb0001ed 	bl	3594 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2ddc:	e1a02004 	mov	r2, r4
    2de0:	e5960000 	ldr	r0, [r6]
    2de4:	e3051394 	movw	r1, #21396	; 0x5394
    2de8:	e3401000 	movt	r1, #0
    2dec:	eb000349 	bl	3b18 <printf>
    exit();
    2df0:	eb0001e7 	bl	3594 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2df4:	e5960000 	ldr	r0, [r6]
    2df8:	e3051378 	movw	r1, #21368	; 0x5378
    2dfc:	e3401000 	movt	r1, #0
    2e00:	eb000344 	bl	3b18 <printf>
    exit();
    2e04:	eb0001e2 	bl	3594 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2e08:	e3051310 	movw	r1, #21264	; 0x5310
    2e0c:	e5960000 	ldr	r0, [r6]
    2e10:	e3401000 	movt	r1, #0
    2e14:	eb00033f 	bl	3b18 <printf>
    exit();
    2e18:	eb0001dd 	bl	3594 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2e1c:	e5960000 	ldr	r0, [r6]
    2e20:	e30512b4 	movw	r1, #21172	; 0x52b4
    2e24:	e3401000 	movt	r1, #0
    2e28:	eb00033a 	bl	3b18 <printf>
    exit();
    2e2c:	eb0001d8 	bl	3594 <exit>
    printf(stdout, "sbrk test fork failed\n");
    2e30:	e5960000 	ldr	r0, [r6]
    2e34:	e3051278 	movw	r1, #21112	; 0x5278
    2e38:	e3401000 	movt	r1, #0
    2e3c:	eb000335 	bl	3b18 <printf>
    exit();
    2e40:	eb0001d3 	bl	3594 <exit>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2e44:	e58d0000 	str	r0, [sp]
    2e48:	e1a03004 	mov	r3, r4
    2e4c:	e1a02005 	mov	r2, r5
    2e50:	e5960000 	ldr	r0, [r6]
    2e54:	e3051238 	movw	r1, #21048	; 0x5238
    2e58:	e3401000 	movt	r1, #0
    2e5c:	eb00032d 	bl	3b18 <printf>
      exit();
    2e60:	eb0001cb 	bl	3594 <exit>

00002e64 <validateint>:
{
    2e64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2e68:	e28db000 	add	fp, sp, #0
    sleep(*p);
    2e6c:	e5900000 	ldr	r0, [r0]
}
    2e70:	e28bd000 	add	sp, fp, #0
    2e74:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    sleep(*p);
    2e78:	ea0002c9 	b	39a4 <sleep>

00002e7c <validatetest>:
{
    2e7c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate test\n");
    2e80:	e305788c 	movw	r7, #22668	; 0x588c
    2e84:	e3407000 	movt	r7, #0
{
    2e88:	e28db014 	add	fp, sp, #20
  printf(stdout, "validate test\n");
    2e8c:	e3051600 	movw	r1, #22016	; 0x5600
    2e90:	e3401000 	movt	r1, #0
    2e94:	e5970000 	ldr	r0, [r7]
    if(link("nosuchfile", (char*)p) != -1){
    2e98:	e3056610 	movw	r6, #22032	; 0x5610
  printf(stdout, "validate test\n");
    2e9c:	eb00031d 	bl	3b18 <printf>
    if(link("nosuchfile", (char*)p) != -1){
    2ea0:	e3406000 	movt	r6, #0
  for(p = 0; p <= (uint)hi; p += 4096){
    2ea4:	e3a04000 	mov	r4, #0
    if((pid = fork()) == 0){
    2ea8:	eb0001ac 	bl	3560 <fork>
    2eac:	e2505000 	subs	r5, r0, #0
    2eb0:	0a000014 	beq	2f08 <validatetest+0x8c>
    sleep(0);
    2eb4:	e3a00000 	mov	r0, #0
    2eb8:	eb0002b9 	bl	39a4 <sleep>
    sleep(0);
    2ebc:	e3a00000 	mov	r0, #0
    2ec0:	eb0002b7 	bl	39a4 <sleep>
    kill(pid);
    2ec4:	e1a00005 	mov	r0, r5
    2ec8:	eb000219 	bl	3734 <kill>
    wait();
    2ecc:	eb0001bd 	bl	35c8 <wait>
    if(link("nosuchfile", (char*)p) != -1){
    2ed0:	e1a01004 	mov	r1, r4
    2ed4:	e1a00006 	mov	r0, r6
    2ed8:	eb000263 	bl	386c <link>
    2edc:	e3700001 	cmn	r0, #1
    2ee0:	1a00000b 	bne	2f14 <validatetest+0x98>
  for(p = 0; p <= (uint)hi; p += 4096){
    2ee4:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2ee8:	e3540945 	cmp	r4, #1130496	; 0x114000
    2eec:	1affffed 	bne	2ea8 <validatetest+0x2c>
  printf(stdout, "validate ok\n");
    2ef0:	e5970000 	ldr	r0, [r7]
    2ef4:	e3051638 	movw	r1, #22072	; 0x5638
    2ef8:	e3401000 	movt	r1, #0
}
    2efc:	e24bd014 	sub	sp, fp, #20
    2f00:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate ok\n");
    2f04:	ea000303 	b	3b18 <printf>
    sleep(*p);
    2f08:	e5940000 	ldr	r0, [r4]
    2f0c:	eb0002a4 	bl	39a4 <sleep>
      exit();
    2f10:	eb00019f 	bl	3594 <exit>
      printf(stdout, "link should not succeed\n");
    2f14:	e5970000 	ldr	r0, [r7]
    2f18:	e305161c 	movw	r1, #22044	; 0x561c
    2f1c:	e3401000 	movt	r1, #0
    2f20:	eb0002fc 	bl	3b18 <printf>
      exit();
    2f24:	eb00019a 	bl	3594 <exit>

00002f28 <bsstest>:
{
    2f28:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "bss test\n");
    2f2c:	e305488c 	movw	r4, #22668	; 0x588c
    2f30:	e3404000 	movt	r4, #0
{
    2f34:	e28db00c 	add	fp, sp, #12
  printf(stdout, "bss test\n");
    2f38:	e3051648 	movw	r1, #22088	; 0x5648
    2f3c:	e3401000 	movt	r1, #0
    2f40:	e5940000 	ldr	r0, [r4]
    2f44:	eb0002f3 	bl	3b18 <printf>
    if(uninit[i] != '\0'){
    2f48:	e3053934 	movw	r3, #22836	; 0x5934
    2f4c:	e3403000 	movt	r3, #0
    2f50:	e5d32000 	ldrb	r2, [r3]
    2f54:	e3520000 	cmp	r2, #0
    2f58:	1a00000b 	bne	2f8c <bsstest+0x64>
    2f5c:	e59f103c 	ldr	r1, [pc, #60]	; 2fa0 <bsstest+0x78>
    2f60:	e5f32001 	ldrb	r2, [r3, #1]!
    2f64:	e3520000 	cmp	r2, #0
    2f68:	1a000007 	bne	2f8c <bsstest+0x64>
  for(i = 0; i < sizeof(uninit); i++){
    2f6c:	e1530001 	cmp	r3, r1
    2f70:	1afffffa 	bne	2f60 <bsstest+0x38>
  printf(stdout, "bss test ok\n");
    2f74:	e5940000 	ldr	r0, [r4]
    2f78:	e3051668 	movw	r1, #22120	; 0x5668
    2f7c:	e3401000 	movt	r1, #0
}
    2f80:	e24bd00c 	sub	sp, fp, #12
    2f84:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "bss test ok\n");
    2f88:	ea0002e2 	b	3b18 <printf>
      printf(stdout, "bss test failed\n");
    2f8c:	e5940000 	ldr	r0, [r4]
    2f90:	e3051654 	movw	r1, #22100	; 0x5654
    2f94:	e3401000 	movt	r1, #0
    2f98:	eb0002de 	bl	3b18 <printf>
      exit();
    2f9c:	eb00017c 	bl	3594 <exit>
    2fa0:	00008043 	.word	0x00008043

00002fa4 <bigargtest>:
{
    2fa4:	e92d4830 	push	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2fa8:	e3050678 	movw	r0, #22136	; 0x5678
{
    2fac:	e28db00c 	add	fp, sp, #12
  unlink("bigarg-ok");
    2fb0:	e3400000 	movt	r0, #0
    2fb4:	eb000212 	bl	3804 <unlink>
  pid = fork();
    2fb8:	eb000168 	bl	3560 <fork>
  if(pid == 0){
    2fbc:	e3500000 	cmp	r0, #0
    2fc0:	0a00000d 	beq	2ffc <bigargtest+0x58>
  } else if(pid < 0){
    2fc4:	ba000032 	blt	3094 <bigargtest+0xf0>
  wait();
    2fc8:	eb00017e 	bl	35c8 <wait>
  fd = open("bigarg-ok", 0);
    2fcc:	e3050678 	movw	r0, #22136	; 0x5678
    2fd0:	e3a01000 	mov	r1, #0
    2fd4:	e3400000 	movt	r0, #0
    2fd8:	eb0001ef 	bl	379c <open>
  if(fd < 0){
    2fdc:	e3500000 	cmp	r0, #0
    2fe0:	ba000024 	blt	3078 <bigargtest+0xd4>
  close(fd);
    2fe4:	eb0001c5 	bl	3700 <close>
  unlink("bigarg-ok");
    2fe8:	e3050678 	movw	r0, #22136	; 0x5678
    2fec:	e3400000 	movt	r0, #0
}
    2ff0:	e24bd00c 	sub	sp, fp, #12
    2ff4:	e8bd4830 	pop	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2ff8:	ea000201 	b	3804 <unlink>
    2ffc:	e59f30ac 	ldr	r3, [pc, #172]	; 30b0 <bigargtest+0x10c>
    3000:	e3052684 	movw	r2, #22148	; 0x5684
    3004:	e3402000 	movt	r2, #0
    3008:	e283107c 	add	r1, r3, #124	; 0x7c
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    300c:	e5a32004 	str	r2, [r3, #4]!
    for(i = 0; i < MAXARG-1; i++)
    3010:	e1530001 	cmp	r3, r1
    3014:	1afffffc 	bne	300c <bigargtest+0x68>
    printf(stdout, "bigarg test\n");
    3018:	e305488c 	movw	r4, #22668	; 0x588c
    301c:	e3404000 	movt	r4, #0
    args[MAXARG-1] = 0;
    3020:	e30558a8 	movw	r5, #22696	; 0x58a8
    3024:	e3405000 	movt	r5, #0
    printf(stdout, "bigarg test\n");
    3028:	e5940000 	ldr	r0, [r4]
    302c:	e3051764 	movw	r1, #22372	; 0x5764
    3030:	e3401000 	movt	r1, #0
    args[MAXARG-1] = 0;
    3034:	e3a03000 	mov	r3, #0
    3038:	e585307c 	str	r3, [r5, #124]	; 0x7c
    printf(stdout, "bigarg test\n");
    303c:	eb0002b5 	bl	3b18 <printf>
    exec("echo", args);
    3040:	e1a01005 	mov	r1, r5
    3044:	e3030e3c 	movw	r0, #15932	; 0x3e3c
    3048:	e3400000 	movt	r0, #0
    304c:	eb0001c5 	bl	3768 <exec>
    printf(stdout, "bigarg test ok\n");
    3050:	e5940000 	ldr	r0, [r4]
    3054:	e3051774 	movw	r1, #22388	; 0x5774
    3058:	e3401000 	movt	r1, #0
    305c:	eb0002ad 	bl	3b18 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3060:	e3a01c02 	mov	r1, #512	; 0x200
    3064:	e3050678 	movw	r0, #22136	; 0x5678
    3068:	e3400000 	movt	r0, #0
    306c:	eb0001ca 	bl	379c <open>
    close(fd);
    3070:	eb0001a2 	bl	3700 <close>
    exit();
    3074:	eb000146 	bl	3594 <exit>
    printf(stdout, "bigarg test failed!\n");
    3078:	e305388c 	movw	r3, #22668	; 0x588c
    307c:	e3403000 	movt	r3, #0
    3080:	e30517a0 	movw	r1, #22432	; 0x57a0
    3084:	e3401000 	movt	r1, #0
    3088:	e5930000 	ldr	r0, [r3]
    308c:	eb0002a1 	bl	3b18 <printf>
    exit();
    3090:	eb00013f 	bl	3594 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3094:	e305388c 	movw	r3, #22668	; 0x588c
    3098:	e3403000 	movt	r3, #0
    309c:	e3051784 	movw	r1, #22404	; 0x5784
    30a0:	e3401000 	movt	r1, #0
    30a4:	e5930000 	ldr	r0, [r3]
    30a8:	eb00029a 	bl	3b18 <printf>
    exit();
    30ac:	eb000138 	bl	3594 <exit>
    30b0:	000058a4 	.word	0x000058a4

000030b4 <fsfull>:
{
    30b4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "fsfull test\n");
    30b8:	e30517b8 	movw	r1, #22456	; 0x57b8
{
    30bc:	e28db020 	add	fp, sp, #32
  printf(1, "fsfull test\n");
    30c0:	e3a00001 	mov	r0, #1
{
    30c4:	e24dd05c 	sub	sp, sp, #92	; 0x5c
  printf(1, "fsfull test\n");
    30c8:	e3401000 	movt	r1, #0
    name[1] = '0' + nfiles / 1000;
    30cc:	e304add3 	movw	sl, #19923	; 0x4dd3
  printf(1, "fsfull test\n");
    30d0:	eb000290 	bl	3b18 <printf>
    name[2] = '0' + (nfiles % 1000) / 100;
    30d4:	e308851f 	movw	r8, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    30d8:	e30c5ccd 	movw	r5, #52429	; 0xcccd
    name[1] = '0' + nfiles / 1000;
    30dc:	e341a062 	movt	sl, #4194	; 0x1062
    name[2] = '0' + (nfiles % 1000) / 100;
    30e0:	e34581eb 	movt	r8, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    30e4:	e34c5ccc 	movt	r5, #52428	; 0xcccc
  for(nfiles = 0; ; nfiles++){
    30e8:	e3a04000 	mov	r4, #0
    name[1] = '0' + nfiles / 1000;
    30ec:	e0832a94 	umull	r2, r3, r4, sl
    name[2] = '0' + (nfiles % 1000) / 100;
    30f0:	e3a0cffa 	mov	ip, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    30f4:	e0876894 	umull	r6, r7, r4, r8
    30f8:	e3a00064 	mov	r0, #100	; 0x64
    name[4] = '0' + (nfiles % 10);
    30fc:	e3a0900a 	mov	r9, #10
    printf(1, "writing %s\n", name);
    3100:	e24b2064 	sub	r2, fp, #100	; 0x64
    name[1] = '0' + nfiles / 1000;
    3104:	e1a0e323 	lsr	lr, r3, #6
    printf(1, "writing %s\n", name);
    3108:	e30517c8 	movw	r1, #22472	; 0x57c8
    310c:	e3401000 	movt	r1, #0
    name[2] = '0' + (nfiles % 1000) / 100;
    3110:	e0634e9c 	mls	r3, ip, lr, r4
    name[3] = '0' + (nfiles % 100) / 10;
    3114:	e1a0c2a7 	lsr	ip, r7, #5
    name[4] = '0' + (nfiles % 10);
    3118:	e0876594 	umull	r6, r7, r4, r5
    name[1] = '0' + nfiles / 1000;
    311c:	e28ee030 	add	lr, lr, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    3120:	e06c4c90 	mls	ip, r0, ip, r4
    printf(1, "writing %s\n", name);
    3124:	e3a00001 	mov	r0, #1
    name[1] = '0' + nfiles / 1000;
    3128:	e54be063 	strb	lr, [fp, #-99]	; 0xffffff9d
    name[4] = '0' + (nfiles % 10);
    312c:	e14b67fc 	strd	r6, [fp, #-124]	; 0xffffff84
    name[2] = '0' + (nfiles % 1000) / 100;
    3130:	e0876893 	umull	r6, r7, r3, r8
    3134:	e14b66fc 	strd	r6, [fp, #-108]	; 0xffffff94
    name[3] = '0' + (nfiles % 100) / 10;
    3138:	e087659c 	umull	r6, r7, ip, r5
    name[0] = 'f';
    313c:	e3a0c066 	mov	ip, #102	; 0x66
    3140:	e54bc064 	strb	ip, [fp, #-100]	; 0xffffff9c
    name[3] = '0' + (nfiles % 100) / 10;
    3144:	e14b67f4 	strd	r6, [fp, #-116]	; 0xffffff8c
    name[4] = '0' + (nfiles % 10);
    3148:	e14b67dc 	ldrd	r6, [fp, #-124]	; 0xffffff84
    name[5] = '\0';
    314c:	e3a06000 	mov	r6, #0
    3150:	e54b605f 	strb	r6, [fp, #-95]	; 0xffffffa1
    name[4] = '0' + (nfiles % 10);
    3154:	e1a031a7 	lsr	r3, r7, #3
    3158:	e0694399 	mls	r9, r9, r3, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    315c:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    3160:	e1a032a3 	lsr	r3, r3, #5
    name[4] = '0' + (nfiles % 10);
    3164:	e2899030 	add	r9, r9, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    3168:	e2833030 	add	r3, r3, #48	; 0x30
    316c:	e54b3062 	strb	r3, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    3170:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
    name[4] = '0' + (nfiles % 10);
    3174:	e54b9060 	strb	r9, [fp, #-96]	; 0xffffffa0
    name[3] = '0' + (nfiles % 100) / 10;
    3178:	e1a031a3 	lsr	r3, r3, #3
    317c:	e2833030 	add	r3, r3, #48	; 0x30
    3180:	e54b3061 	strb	r3, [fp, #-97]	; 0xffffff9f
    printf(1, "writing %s\n", name);
    3184:	eb000263 	bl	3b18 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3188:	e3001202 	movw	r1, #514	; 0x202
    318c:	e24b0064 	sub	r0, fp, #100	; 0x64
    3190:	eb000181 	bl	379c <open>
    if(fd < 0){
    3194:	e2509000 	subs	r9, r0, #0
    3198:	ba000014 	blt	31f0 <fsfull+0x13c>
      int cc = write(fd, buf, 512);
    319c:	e3087044 	movw	r7, #32836	; 0x8044
    31a0:	e3407000 	movt	r7, #0
    31a4:	ea000000 	b	31ac <fsfull+0xf8>
      total += cc;
    31a8:	e0866000 	add	r6, r6, r0
      int cc = write(fd, buf, 512);
    31ac:	e3a02c02 	mov	r2, #512	; 0x200
    31b0:	e1a01007 	mov	r1, r7
    31b4:	e1a00009 	mov	r0, r9
    31b8:	eb000143 	bl	36cc <write>
      if(cc < 512)
    31bc:	e3500c02 	cmp	r0, #512	; 0x200
    31c0:	aafffff8 	bge	31a8 <fsfull+0xf4>
    printf(1, "wrote %d bytes\n", total);
    31c4:	e1a02006 	mov	r2, r6
    31c8:	e3a00001 	mov	r0, #1
    31cc:	e30517e4 	movw	r1, #22500	; 0x57e4
    31d0:	e3401000 	movt	r1, #0
    31d4:	eb00024f 	bl	3b18 <printf>
    close(fd);
    31d8:	e1a00009 	mov	r0, r9
    31dc:	eb000147 	bl	3700 <close>
    if(total == 0)
    31e0:	e3560000 	cmp	r6, #0
    31e4:	0a000006 	beq	3204 <fsfull+0x150>
  for(nfiles = 0; ; nfiles++){
    31e8:	e2844001 	add	r4, r4, #1
    31ec:	eaffffbe 	b	30ec <fsfull+0x38>
      printf(1, "open %s failed\n", name);
    31f0:	e30517d4 	movw	r1, #22484	; 0x57d4
    31f4:	e24b2064 	sub	r2, fp, #100	; 0x64
    31f8:	e3401000 	movt	r1, #0
    31fc:	e3a00001 	mov	r0, #1
    3200:	eb000244 	bl	3b18 <printf>
    name[2] = '0' + (nfiles % 1000) / 100;
    3204:	e308a51f 	movw	sl, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    3208:	e30c5ccd 	movw	r5, #52429	; 0xcccd
    name[2] = '0' + (nfiles % 1000) / 100;
    320c:	e345a1eb 	movt	sl, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    3210:	e34c5ccc 	movt	r5, #52428	; 0xcccc
    name[1] = '0' + nfiles / 1000;
    3214:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    3218:	e3413062 	movt	r3, #4194	; 0x1062
    321c:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    3220:	e51b3074 	ldr	r3, [fp, #-116]	; 0xffffff8c
    name[2] = '0' + (nfiles % 1000) / 100;
    3224:	e3a0effa 	mov	lr, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    3228:	e0898a94 	umull	r8, r9, r4, sl
    322c:	e3a0c064 	mov	ip, #100	; 0x64
    name[1] = '0' + nfiles / 1000;
    3230:	e0832394 	umull	r2, r3, r4, r3
    name[4] = '0' + (nfiles % 10);
    3234:	e3a0100a 	mov	r1, #10
    unlink(name);
    3238:	e24b0064 	sub	r0, fp, #100	; 0x64
    name[3] = '0' + (nfiles % 100) / 10;
    323c:	e1a062a9 	lsr	r6, r9, #5
    name[4] = '0' + (nfiles % 10);
    3240:	e0898594 	umull	r8, r9, r4, r5
    name[1] = '0' + nfiles / 1000;
    3244:	e1a02323 	lsr	r2, r3, #6
    name[0] = 'f';
    3248:	e3a03066 	mov	r3, #102	; 0x66
    324c:	e54b3064 	strb	r3, [fp, #-100]	; 0xffffff9c
    name[1] = '0' + nfiles / 1000;
    3250:	e2823030 	add	r3, r2, #48	; 0x30
    3254:	e54b3063 	strb	r3, [fp, #-99]	; 0xffffff9d
    name[2] = '0' + (nfiles % 1000) / 100;
    3258:	e062429e 	mls	r2, lr, r2, r4
    name[5] = '\0';
    325c:	e3a03000 	mov	r3, #0
    name[3] = '0' + (nfiles % 100) / 10;
    3260:	e066469c 	mls	r6, ip, r6, r4
    name[5] = '\0';
    3264:	e54b305f 	strb	r3, [fp, #-95]	; 0xffffffa1
    name[2] = '0' + (nfiles % 1000) / 100;
    3268:	e0832a92 	umull	r2, r3, r2, sl
    name[3] = '0' + (nfiles % 100) / 10;
    326c:	e0876596 	umull	r6, r7, r6, r5
    name[2] = '0' + (nfiles % 1000) / 100;
    3270:	e14b26fc 	strd	r2, [fp, #-108]	; 0xffffff94
    name[4] = '0' + (nfiles % 10);
    3274:	e1a021a9 	lsr	r2, r9, #3
    name[2] = '0' + (nfiles % 1000) / 100;
    3278:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
    name[4] = '0' + (nfiles % 10);
    327c:	e0614291 	mls	r1, r1, r2, r4
    nfiles--;
    3280:	e2444001 	sub	r4, r4, #1
    name[2] = '0' + (nfiles % 1000) / 100;
    3284:	e1a022a3 	lsr	r2, r3, #5
    name[3] = '0' + (nfiles % 100) / 10;
    3288:	e1a031a7 	lsr	r3, r7, #3
    name[2] = '0' + (nfiles % 1000) / 100;
    328c:	e2822030 	add	r2, r2, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    3290:	e2833030 	add	r3, r3, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    3294:	e2811030 	add	r1, r1, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    3298:	e54b2062 	strb	r2, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    329c:	e54b3061 	strb	r3, [fp, #-97]	; 0xffffff9f
    name[4] = '0' + (nfiles % 10);
    32a0:	e54b1060 	strb	r1, [fp, #-96]	; 0xffffffa0
    unlink(name);
    32a4:	eb000156 	bl	3804 <unlink>
  while(nfiles >= 0){
    32a8:	e3740001 	cmn	r4, #1
    32ac:	1affffdb 	bne	3220 <fsfull+0x16c>
  printf(1, "fsfull test finished\n");
    32b0:	e3a00001 	mov	r0, #1
    32b4:	e30517f4 	movw	r1, #22516	; 0x57f4
    32b8:	e3401000 	movt	r1, #0
    32bc:	eb000215 	bl	3b18 <printf>
}
    32c0:	e24bd020 	sub	sp, fp, #32
    32c4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000032c8 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    32c8:	e305388c 	movw	r3, #22668	; 0x588c
    32cc:	e3403000 	movt	r3, #0
{
    32d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  randstate = randstate * 1664525 + 1013904223;
    32d4:	e306160d 	movw	r1, #26125	; 0x660d
    32d8:	e5930018 	ldr	r0, [r3, #24]
    32dc:	e3401019 	movt	r1, #25
    32e0:	e30f235f 	movw	r2, #62303	; 0xf35f
    32e4:	e3432c6e 	movt	r2, #15470	; 0x3c6e
{
    32e8:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    32ec:	e0202091 	mla	r0, r1, r0, r2
    32f0:	e5830018 	str	r0, [r3, #24]
}
    32f4:	e28bd000 	add	sp, fp, #0
    32f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32fc:	e12fff1e 	bx	lr

00003300 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    3300:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3304:	e2402001 	sub	r2, r0, #1
    3308:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    330c:	e4d13001 	ldrb	r3, [r1], #1
    3310:	e3530000 	cmp	r3, #0
    3314:	e5e23001 	strb	r3, [r2, #1]!
    3318:	1afffffb 	bne	330c <strcpy+0xc>
    ;
  return os;
}
    331c:	e28bd000 	add	sp, fp, #0
    3320:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3324:	e12fff1e 	bx	lr

00003328 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    332c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
    3330:	e5d03000 	ldrb	r3, [r0]
    3334:	e5d12000 	ldrb	r2, [r1]
    3338:	e3530000 	cmp	r3, #0
    333c:	1a000004 	bne	3354 <strcmp+0x2c>
    3340:	ea000005 	b	335c <strcmp+0x34>
    3344:	e5f03001 	ldrb	r3, [r0, #1]!
    3348:	e5f12001 	ldrb	r2, [r1, #1]!
    334c:	e3530000 	cmp	r3, #0
    3350:	0a000001 	beq	335c <strcmp+0x34>
    3354:	e1530002 	cmp	r3, r2
    3358:	0afffff9 	beq	3344 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    335c:	e0430002 	sub	r0, r3, r2
    3360:	e28bd000 	add	sp, fp, #0
    3364:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3368:	e12fff1e 	bx	lr

0000336c <strlen>:

uint
strlen(char *s)
{
    336c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3370:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
    3374:	e5d03000 	ldrb	r3, [r0]
    3378:	e3530000 	cmp	r3, #0
    337c:	01a00003 	moveq	r0, r3
    3380:	0a000006 	beq	33a0 <strlen+0x34>
    3384:	e1a02000 	mov	r2, r0
    3388:	e3a03000 	mov	r3, #0
    338c:	e5f21001 	ldrb	r1, [r2, #1]!
    3390:	e2833001 	add	r3, r3, #1
    3394:	e3510000 	cmp	r1, #0
    3398:	e1a00003 	mov	r0, r3
    339c:	1afffffa 	bne	338c <strlen+0x20>
    ;
  return n;
}
    33a0:	e28bd000 	add	sp, fp, #0
    33a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33a8:	e12fff1e 	bx	lr

000033ac <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    33ac:	e3520000 	cmp	r2, #0
{
    33b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    33b4:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
    33b8:	0a000004 	beq	33d0 <memset+0x24>
    33bc:	e6ef1071 	uxtb	r1, r1
    33c0:	e0802002 	add	r2, r0, r2
    33c4:	e4c01001 	strb	r1, [r0], #1
    33c8:	e1520000 	cmp	r2, r0
    33cc:	1afffffc 	bne	33c4 <memset+0x18>
  return (void *)p;
}
    33d0:	e28bd000 	add	sp, fp, #0
    33d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33d8:	e12fff1e 	bx	lr

000033dc <strchr>:

char*
strchr(const char *s, char c)
{
    33dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    33e0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
    33e4:	e5d02000 	ldrb	r2, [r0]
    33e8:	e3520000 	cmp	r2, #0
    33ec:	0a00000b 	beq	3420 <strchr+0x44>
    if(*s == c)
    33f0:	e1510002 	cmp	r1, r2
    33f4:	1a000002 	bne	3404 <strchr+0x28>
    33f8:	ea000005 	b	3414 <strchr+0x38>
    33fc:	e1530001 	cmp	r3, r1
    3400:	0a000003 	beq	3414 <strchr+0x38>
  for(; *s; s++)
    3404:	e5f03001 	ldrb	r3, [r0, #1]!
    3408:	e3530000 	cmp	r3, #0
    340c:	1afffffa 	bne	33fc <strchr+0x20>
      return (char*)s;
  return 0;
    3410:	e1a00003 	mov	r0, r3
}
    3414:	e28bd000 	add	sp, fp, #0
    3418:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    341c:	e12fff1e 	bx	lr
  return 0;
    3420:	e1a00002 	mov	r0, r2
    3424:	eafffffa 	b	3414 <strchr+0x38>

00003428 <gets>:

char*
gets(char *buf, int max)
{
    3428:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    342c:	e1a03000 	mov	r3, r0
    3430:	e28db014 	add	fp, sp, #20
    3434:	e1a07000 	mov	r7, r0
    3438:	e24dd008 	sub	sp, sp, #8
    343c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3440:	e3a04000 	mov	r4, #0
    3444:	ea000008 	b	346c <gets+0x44>
    cc = read(0, &c, 1);
    3448:	eb000092 	bl	3698 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
    344c:	e1a03005 	mov	r3, r5
    if(cc < 1)
    3450:	e3500000 	cmp	r0, #0
    3454:	da00000b 	ble	3488 <gets+0x60>
    buf[i++] = c;
    3458:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
    345c:	e352000d 	cmp	r2, #13
    3460:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
    3464:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
    3468:	0a00000b 	beq	349c <gets+0x74>
    cc = read(0, &c, 1);
    346c:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
    3470:	e0844002 	add	r4, r4, r2
    3474:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
    3478:	e24b1015 	sub	r1, fp, #21
    347c:	e3a00000 	mov	r0, #0
    3480:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
    3484:	baffffef 	blt	3448 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
    3488:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
    348c:	e3a03000 	mov	r3, #0
    3490:	e5c53000 	strb	r3, [r5]
}
    3494:	e24bd014 	sub	sp, fp, #20
    3498:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    349c:	e0875004 	add	r5, r7, r4
    34a0:	eafffff8 	b	3488 <gets+0x60>

000034a4 <stat>:

int
stat(char *n, struct stat *st)
{
    34a4:	e92d4830 	push	{r4, r5, fp, lr}
    34a8:	e1a04001 	mov	r4, r1
    34ac:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    34b0:	e3a01000 	mov	r1, #0
    34b4:	eb0000b8 	bl	379c <open>
  if(fd < 0)
    34b8:	e2505000 	subs	r5, r0, #0
    34bc:	ba000006 	blt	34dc <stat+0x38>
    return -1;
  r = fstat(fd, st);
    34c0:	e1a01004 	mov	r1, r4
    34c4:	eb0000db 	bl	3838 <fstat>
    34c8:	e1a04000 	mov	r4, r0
  close(fd);
    34cc:	e1a00005 	mov	r0, r5
    34d0:	eb00008a 	bl	3700 <close>
  return r;
}
    34d4:	e1a00004 	mov	r0, r4
    34d8:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
    34dc:	e3e04000 	mvn	r4, #0
    34e0:	eafffffb 	b	34d4 <stat+0x30>

000034e4 <atoi>:

int
atoi(const char *s)
{
    34e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34e8:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    34ec:	e5d02000 	ldrb	r2, [r0]
    34f0:	e2423030 	sub	r3, r2, #48	; 0x30
    34f4:	e3530009 	cmp	r3, #9
  n = 0;
    34f8:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
    34fc:	8a000006 	bhi	351c <atoi+0x38>
    n = n*10 + *s++ - '0';
    3500:	e3a0c00a 	mov	ip, #10
    3504:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
    3508:	e5f02001 	ldrb	r2, [r0, #1]!
    350c:	e2421030 	sub	r1, r2, #48	; 0x30
    3510:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
    3514:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
    3518:	9afffff9 	bls	3504 <atoi+0x20>
  return n;
}
    351c:	e1a00003 	mov	r0, r3
    3520:	e28bd000 	add	sp, fp, #0
    3524:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3528:	e12fff1e 	bx	lr

0000352c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    352c:	e3520000 	cmp	r2, #0
{
    3530:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3534:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
    3538:	da000005 	ble	3554 <memmove+0x28>
    353c:	e0812002 	add	r2, r1, r2
    3540:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
    3544:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
    3548:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
    354c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
    3550:	1afffffb 	bne	3544 <memmove+0x18>
  return vdst;
}
    3554:	e28bd000 	add	sp, fp, #0
    3558:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    355c:	e12fff1e 	bx	lr

00003560 <fork>:
    3560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3564:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3568:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    356c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3570:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3574:	e3a00001 	mov	r0, #1
    3578:	ef000040 	svc	0x00000040
    357c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3584:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3588:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    358c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3590:	e12fff1e 	bx	lr

00003594 <exit>:
    3594:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3598:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    359c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35a8:	e3a00002 	mov	r0, #2
    35ac:	ef000040 	svc	0x00000040
    35b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35c4:	e12fff1e 	bx	lr

000035c8 <wait>:
    35c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35dc:	e3a00003 	mov	r0, #3
    35e0:	ef000040 	svc	0x00000040
    35e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35f8:	e12fff1e 	bx	lr

000035fc <lseek>:
    35fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3600:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3604:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3608:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    360c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3610:	e3a00016 	mov	r0, #22
    3614:	ef000040 	svc	0x00000040
    3618:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    361c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3620:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3624:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3628:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    362c:	e12fff1e 	bx	lr

00003630 <mount>:
    3630:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3634:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3638:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    363c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3640:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3644:	e3a00017 	mov	r0, #23
    3648:	ef000040 	svc	0x00000040
    364c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3654:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3658:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    365c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3660:	e12fff1e 	bx	lr

00003664 <pipe>:
    3664:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3668:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    366c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3670:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3674:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3678:	e3a00004 	mov	r0, #4
    367c:	ef000040 	svc	0x00000040
    3680:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3688:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    368c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3690:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3694:	e12fff1e 	bx	lr

00003698 <read>:
    3698:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    369c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36ac:	e3a00005 	mov	r0, #5
    36b0:	ef000040 	svc	0x00000040
    36b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36c8:	e12fff1e 	bx	lr

000036cc <write>:
    36cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36e0:	e3a00010 	mov	r0, #16
    36e4:	ef000040 	svc	0x00000040
    36e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36fc:	e12fff1e 	bx	lr

00003700 <close>:
    3700:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3704:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3708:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    370c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3710:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3714:	e3a00015 	mov	r0, #21
    3718:	ef000040 	svc	0x00000040
    371c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3724:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3728:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    372c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3730:	e12fff1e 	bx	lr

00003734 <kill>:
    3734:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3738:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    373c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3740:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3744:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3748:	e3a00006 	mov	r0, #6
    374c:	ef000040 	svc	0x00000040
    3750:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3758:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    375c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3760:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3764:	e12fff1e 	bx	lr

00003768 <exec>:
    3768:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    376c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3770:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3774:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3778:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    377c:	e3a00007 	mov	r0, #7
    3780:	ef000040 	svc	0x00000040
    3784:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    378c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3790:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3794:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3798:	e12fff1e 	bx	lr

0000379c <open>:
    379c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37b0:	e3a0000f 	mov	r0, #15
    37b4:	ef000040 	svc	0x00000040
    37b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37cc:	e12fff1e 	bx	lr

000037d0 <mknod>:
    37d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37e4:	e3a00011 	mov	r0, #17
    37e8:	ef000040 	svc	0x00000040
    37ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3800:	e12fff1e 	bx	lr

00003804 <unlink>:
    3804:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3808:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    380c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3810:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3814:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3818:	e3a00012 	mov	r0, #18
    381c:	ef000040 	svc	0x00000040
    3820:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3824:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3828:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    382c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3830:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3834:	e12fff1e 	bx	lr

00003838 <fstat>:
    3838:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    383c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3840:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3844:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3848:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    384c:	e3a00008 	mov	r0, #8
    3850:	ef000040 	svc	0x00000040
    3854:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3858:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    385c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3860:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3864:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3868:	e12fff1e 	bx	lr

0000386c <link>:
    386c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3870:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3874:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3878:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    387c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3880:	e3a00013 	mov	r0, #19
    3884:	ef000040 	svc	0x00000040
    3888:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    388c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3890:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3894:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3898:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    389c:	e12fff1e 	bx	lr

000038a0 <mkdir>:
    38a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38b4:	e3a00014 	mov	r0, #20
    38b8:	ef000040 	svc	0x00000040
    38bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38d0:	e12fff1e 	bx	lr

000038d4 <chdir>:
    38d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38e8:	e3a00009 	mov	r0, #9
    38ec:	ef000040 	svc	0x00000040
    38f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3900:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3904:	e12fff1e 	bx	lr

00003908 <dup>:
    3908:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    390c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3910:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3914:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3918:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    391c:	e3a0000a 	mov	r0, #10
    3920:	ef000040 	svc	0x00000040
    3924:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3928:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    392c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3930:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3934:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3938:	e12fff1e 	bx	lr

0000393c <getpid>:
    393c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3940:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3944:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3948:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    394c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3950:	e3a0000b 	mov	r0, #11
    3954:	ef000040 	svc	0x00000040
    3958:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    395c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3960:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3964:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3968:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    396c:	e12fff1e 	bx	lr

00003970 <sbrk>:
    3970:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3974:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3978:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    397c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3980:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3984:	e3a0000c 	mov	r0, #12
    3988:	ef000040 	svc	0x00000040
    398c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3990:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3994:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3998:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    399c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    39a0:	e12fff1e 	bx	lr

000039a4 <sleep>:
    39a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    39a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    39ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    39b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    39b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    39b8:	e3a0000d 	mov	r0, #13
    39bc:	ef000040 	svc	0x00000040
    39c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    39c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    39c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    39cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    39d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    39d4:	e12fff1e 	bx	lr

000039d8 <uptime>:
    39d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    39dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    39e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    39e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    39e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    39ec:	e3a0000e 	mov	r0, #14
    39f0:	ef000040 	svc	0x00000040
    39f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    39f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    39fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3a00:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3a04:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3a08:	e12fff1e 	bx	lr

00003a0c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3a0c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3a10:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    3a14:	e013afa1 	ands	sl, r3, r1, lsr #31
    3a18:	e24b4034 	sub	r4, fp, #52	; 0x34
    3a1c:	e3059870 	movw	r9, #22640	; 0x5870
    neg = 1;
    x = -xx;
    3a20:	1261e000 	rsbne	lr, r1, #0
    3a24:	e3409000 	movt	r9, #0
{
    3a28:	e1a05000 	mov	r5, r0
    neg = 1;
    3a2c:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
    3a30:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
    3a34:	e3a08000 	mov	r8, #0
  b = base;
    3a38:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
    3a3c:	e3a06001 	mov	r6, #1
{
    3a40:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
    3a44:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
    3a48:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    3a4c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
    3a50:	e1a0033e 	lsr	r0, lr, r3
    3a54:	e2000001 	and	r0, r0, #1
    3a58:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
    3a5c:	e1520001 	cmp	r2, r1
            r = r - d;
    3a60:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
    3a64:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
    3a68:	e2533001 	subs	r3, r3, #1
    3a6c:	2afffff7 	bcs	3a50 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    3a70:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
    3a74:	e35c0000 	cmp	ip, #0
    3a78:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
    3a7c:	e2883001 	add	r3, r8, #1
    3a80:	e7d91001 	ldrb	r1, [r9, r1]
    3a84:	e4c71001 	strb	r1, [r7], #1
    3a88:	11a08003 	movne	r8, r3
    3a8c:	1affffec 	bne	3a44 <printint+0x38>
  if(neg)
    3a90:	e35a0000 	cmp	sl, #0
    3a94:	0a000004 	beq	3aac <printint+0xa0>
    buf[i++] = '-';
    3a98:	e24b2024 	sub	r2, fp, #36	; 0x24
    3a9c:	e3a0102d 	mov	r1, #45	; 0x2d
    3aa0:	e0822003 	add	r2, r2, r3
    3aa4:	e2883002 	add	r3, r8, #2
    3aa8:	e5421010 	strb	r1, [r2, #-16]
    3aac:	e0846003 	add	r6, r4, r3
    3ab0:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
    3ab4:	e3a02001 	mov	r2, #1
    3ab8:	e24b1035 	sub	r1, fp, #53	; 0x35
    3abc:	e1a00005 	mov	r0, r5
    3ac0:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
    3ac4:	ebffff00 	bl	36cc <write>

  while(--i >= 0)
    3ac8:	e1540006 	cmp	r4, r6
    3acc:	1afffff7 	bne	3ab0 <printint+0xa4>
    putc(fd, buf[i]);
}
    3ad0:	e24bd020 	sub	sp, fp, #32
    3ad4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00003ad8 <div>:
{
    3ad8:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    3adc:	e3a02000 	mov	r2, #0
{
    3ae0:	e28db008 	add	fp, sp, #8
    3ae4:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
    3ae8:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    3aec:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
    3af0:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
    3af4:	e1a0c33e 	lsr	ip, lr, r3
    3af8:	e20cc001 	and	ip, ip, #1
    3afc:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    3b00:	e1520001 	cmp	r2, r1
            r = r - d;
    3b04:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
    3b08:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
    3b0c:	e2533001 	subs	r3, r3, #1
    3b10:	38bd8810 	popcc	{r4, fp, pc}
    3b14:	eafffff6 	b	3af4 <div+0x1c>

00003b18 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3b18:	e92d000e 	push	{r1, r2, r3}
    3b1c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    3b20:	e28db018 	add	fp, sp, #24
    3b24:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b28:	e59b5004 	ldr	r5, [fp, #4]
    3b2c:	e5d54000 	ldrb	r4, [r5]
    3b30:	e3540000 	cmp	r4, #0
    3b34:	0a00002b 	beq	3be8 <printf+0xd0>
    3b38:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
    3b3c:	e28b8008 	add	r8, fp, #8
  state = 0;
    3b40:	e3a06000 	mov	r6, #0
    3b44:	ea00000a 	b	3b74 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3b48:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    3b4c:	01a06004 	moveq	r6, r4
      if(c == '%'){
    3b50:	0a000004 	beq	3b68 <printf+0x50>
    3b54:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3b58:	e3a02001 	mov	r2, #1
    3b5c:	e1a00007 	mov	r0, r7
    3b60:	e5614006 	strb	r4, [r1, #-6]!
    3b64:	ebfffed8 	bl	36cc <write>
  for(i = 0; fmt[i]; i++){
    3b68:	e5f54001 	ldrb	r4, [r5, #1]!
    3b6c:	e3540000 	cmp	r4, #0
    3b70:	0a00001c 	beq	3be8 <printf+0xd0>
    if(state == 0){
    3b74:	e3560000 	cmp	r6, #0
    3b78:	0afffff2 	beq	3b48 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3b7c:	e3560025 	cmp	r6, #37	; 0x25
    3b80:	1afffff8 	bne	3b68 <printf+0x50>
      if(c == 'd'){
    3b84:	e3540064 	cmp	r4, #100	; 0x64
    3b88:	0a000030 	beq	3c50 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3b8c:	e20430f7 	and	r3, r4, #247	; 0xf7
    3b90:	e3530070 	cmp	r3, #112	; 0x70
    3b94:	0a000017 	beq	3bf8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3b98:	e3540073 	cmp	r4, #115	; 0x73
    3b9c:	0a00001c 	beq	3c14 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3ba0:	e3540063 	cmp	r4, #99	; 0x63
    3ba4:	0a000037 	beq	3c88 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3ba8:	e3540025 	cmp	r4, #37	; 0x25
    3bac:	0a00002e 	beq	3c6c <printf+0x154>
  write(fd, &c, 1);
    3bb0:	e3a02001 	mov	r2, #1
    3bb4:	e24b1019 	sub	r1, fp, #25
    3bb8:	e1a00007 	mov	r0, r7
    3bbc:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
    3bc0:	ebfffec1 	bl	36cc <write>
    3bc4:	e3a02001 	mov	r2, #1
    3bc8:	e24b101a 	sub	r1, fp, #26
    3bcc:	e1a00007 	mov	r0, r7
    3bd0:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    3bd4:	ebfffebc 	bl	36cc <write>
  for(i = 0; fmt[i]; i++){
    3bd8:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3bdc:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
    3be0:	e3540000 	cmp	r4, #0
    3be4:	1affffe2 	bne	3b74 <printf+0x5c>
    }
  }
}
    3be8:	e24bd018 	sub	sp, fp, #24
    3bec:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    3bf0:	e28dd00c 	add	sp, sp, #12
    3bf4:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
    3bf8:	e3a03000 	mov	r3, #0
    3bfc:	e3a02010 	mov	r2, #16
    3c00:	e4981004 	ldr	r1, [r8], #4
    3c04:	e1a00007 	mov	r0, r7
    3c08:	ebffff7f 	bl	3a0c <printint>
      state = 0;
    3c0c:	e3a06000 	mov	r6, #0
    3c10:	eaffffd4 	b	3b68 <printf+0x50>
        s = (char*)*ap;
    3c14:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
    3c18:	e3540000 	cmp	r4, #0
    3c1c:	0a000021 	beq	3ca8 <printf+0x190>
        while(*s != 0){
    3c20:	e5d46000 	ldrb	r6, [r4]
    3c24:	e3560000 	cmp	r6, #0
    3c28:	0affffce 	beq	3b68 <printf+0x50>
  write(fd, &c, 1);
    3c2c:	e3a02001 	mov	r2, #1
    3c30:	e24b101d 	sub	r1, fp, #29
    3c34:	e1a00007 	mov	r0, r7
    3c38:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
    3c3c:	ebfffea2 	bl	36cc <write>
        while(*s != 0){
    3c40:	e5f46001 	ldrb	r6, [r4, #1]!
    3c44:	e3560000 	cmp	r6, #0
    3c48:	1afffff7 	bne	3c2c <printf+0x114>
    3c4c:	eaffffc5 	b	3b68 <printf+0x50>
        printint(fd, *ap, 10, 1);
    3c50:	e3a03001 	mov	r3, #1
    3c54:	e3a0200a 	mov	r2, #10
    3c58:	e4981004 	ldr	r1, [r8], #4
    3c5c:	e1a00007 	mov	r0, r7
    3c60:	ebffff69 	bl	3a0c <printint>
      state = 0;
    3c64:	e3a06000 	mov	r6, #0
    3c68:	eaffffbe 	b	3b68 <printf+0x50>
    3c6c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3c70:	e3a02001 	mov	r2, #1
    3c74:	e1a00007 	mov	r0, r7
    3c78:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
    3c7c:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
    3c80:	ebfffe91 	bl	36cc <write>
    3c84:	eaffffb7 	b	3b68 <printf+0x50>
        putc(fd, *ap);
    3c88:	e4983004 	ldr	r3, [r8], #4
    3c8c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3c90:	e3a02001 	mov	r2, #1
    3c94:	e1a00007 	mov	r0, r7
      state = 0;
    3c98:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
    3c9c:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
    3ca0:	ebfffe89 	bl	36cc <write>
    3ca4:	eaffffaf 	b	3b68 <printf+0x50>
          s = "(null)";
    3ca8:	e3054884 	movw	r4, #22660	; 0x5884
        while(*s != 0){
    3cac:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
    3cb0:	e3404000 	movt	r4, #0
    3cb4:	eaffffdc 	b	3c2c <printf+0x114>

00003cb8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cb8:	e305c928 	movw	ip, #22824	; 0x5928
    3cbc:	e340c000 	movt	ip, #0
{
    3cc0:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
    3cc4:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cc8:	e59c3000 	ldr	r3, [ip]
{
    3ccc:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cd0:	e1530001 	cmp	r3, r1
    3cd4:	e5932000 	ldr	r2, [r3]
    3cd8:	2a000017 	bcs	3d3c <free+0x84>
    3cdc:	e1510002 	cmp	r1, r2
    3ce0:	3a000001 	bcc	3cec <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3ce4:	e1530002 	cmp	r3, r2
    3ce8:	3a000017 	bcc	3d4c <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3cec:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3cf0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
    3cf4:	e081418e 	add	r4, r1, lr, lsl #3
    3cf8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
    3cfc:	05922004 	ldreq	r2, [r2, #4]
    3d00:	0082e00e 	addeq	lr, r2, lr
    3d04:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    3d08:	05932000 	ldreq	r2, [r3]
    3d0c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
    3d10:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    3d14:	e5932004 	ldr	r2, [r3, #4]
    3d18:	e083e182 	add	lr, r3, r2, lsl #3
    3d1c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
    3d20:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
    3d24:	05101004 	ldreq	r1, [r0, #-4]
    3d28:	00812002 	addeq	r2, r1, r2
    3d2c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    3d30:	05102008 	ldreq	r2, [r0, #-8]
    3d34:	05832000 	streq	r2, [r3]
}
    3d38:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3d3c:	e1530002 	cmp	r3, r2
    3d40:	3a000001 	bcc	3d4c <free+0x94>
    3d44:	e1510002 	cmp	r1, r2
    3d48:	3affffe7 	bcc	3cec <free+0x34>
{
    3d4c:	e1a03002 	mov	r3, r2
    3d50:	eaffffde 	b	3cd0 <free+0x18>

00003d54 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3d54:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    3d58:	e3057928 	movw	r7, #22824	; 0x5928
    3d5c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d60:	e2804007 	add	r4, r0, #7
{
    3d64:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
    3d68:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d6c:	e1a041a4 	lsr	r4, r4, #3
    3d70:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    3d74:	e3530000 	cmp	r3, #0
    3d78:	0a000027 	beq	3e1c <malloc+0xc8>
    3d7c:	e5930000 	ldr	r0, [r3]
    3d80:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3d84:	e1540002 	cmp	r4, r2
    3d88:	9a000019 	bls	3df4 <malloc+0xa0>
    3d8c:	e3540a01 	cmp	r4, #4096	; 0x1000
    3d90:	21a05004 	movcs	r5, r4
    3d94:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
    3d98:	e1a06185 	lsl	r6, r5, #3
    3d9c:	ea000003 	b	3db0 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3da0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    3da4:	e5902004 	ldr	r2, [r0, #4]
    3da8:	e1520004 	cmp	r2, r4
    3dac:	2a000010 	bcs	3df4 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3db0:	e5972000 	ldr	r2, [r7]
    3db4:	e1a03000 	mov	r3, r0
    3db8:	e1520000 	cmp	r2, r0
    3dbc:	1afffff7 	bne	3da0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
    3dc0:	e1a00006 	mov	r0, r6
    3dc4:	ebfffee9 	bl	3970 <sbrk>
    3dc8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    3dcc:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
    3dd0:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
    3dd4:	0a000004 	beq	3dec <malloc+0x98>
  hp->s.size = nu;
    3dd8:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
    3ddc:	ebffffb5 	bl	3cb8 <free>
  return freep;
    3de0:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
    3de4:	e3530000 	cmp	r3, #0
    3de8:	1affffec 	bne	3da0 <malloc+0x4c>
        return 0;
    3dec:	e3a00000 	mov	r0, #0
  }
}
    3df0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
    3df4:	e1540002 	cmp	r4, r2
      freep = prevp;
    3df8:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
    3dfc:	10422004 	subne	r2, r2, r4
    3e00:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
    3e04:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
    3e08:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
    3e0c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
    3e10:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
    3e14:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
    3e18:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
    3e1c:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
    3e20:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
    3e24:	e5870000 	str	r0, [r7]
    3e28:	e5870004 	str	r0, [r7, #4]
    3e2c:	eaffffd6 	b	3d8c <malloc+0x38>
