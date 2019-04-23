
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
       c:	e3051760 	movw	r1, #22368	; 0x5760
      10:	e3401000 	movt	r1, #0
      14:	eb000e94 	bl	3a6c <printf>

  if(open("usertests.ran", 0) >= 0){
      18:	e3050774 	movw	r0, #22388	; 0x5774
      1c:	e3a01000 	mov	r1, #0
      20:	e3400000 	movt	r0, #0
      24:	eb000dac 	bl	36dc <open>
      28:	e3500000 	cmp	r0, #0
      2c:	ba000004 	blt	44 <main+0x44>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      30:	e3051784 	movw	r1, #22404	; 0x5784
      34:	e3a00001 	mov	r0, #1
      38:	e3401000 	movt	r1, #0
      3c:	eb000e8a 	bl	3a6c <printf>
    exit();
      40:	eb000d3d 	bl	353c <exit>
  }
  close(open("usertests.ran", O_CREATE));
      44:	e3a01c02 	mov	r1, #512	; 0x200
      48:	e3050774 	movw	r0, #22388	; 0x5774
      4c:	e3400000 	movt	r0, #0
      50:	eb000da1 	bl	36dc <open>
      54:	eb000d79 	bl	3640 <close>

  bigargtest();
      58:	eb000bb1 	bl	2f24 <bigargtest>
  bigwrite();
      5c:	eb0007ce 	bl	1f9c <bigwrite>
  bigargtest();
      60:	eb000baf 	bl	2f24 <bigargtest>
  bsstest();
      64:	eb000b8f 	bl	2ea8 <bsstest>
  sbrktest();
      68:	eb000a02 	bl	2878 <sbrktest>
  validatetest();
      6c:	eb000b62 	bl	2dfc <validatetest>

  opentest();
      70:	eb000017 	bl	d4 <opentest>
  writetest();
      74:	eb00003a 	bl	164 <writetest>
  writetest1();
      78:	eb0000a7 	bl	31c <writetest1>
  createtest();
      7c:	eb00010f 	bl	4c0 <createtest>

  mem();
      80:	eb000253 	bl	9d4 <mem>
  pipe1();
      84:	eb000182 	bl	694 <pipe1>
  preempt();
      88:	eb0001e5 	bl	824 <preempt>
  exitwait();
      8c:	eb000230 	bl	954 <exitwait>

  rmdot();
      90:	eb0008b5 	bl	236c <rmdot>
  fourteen();
      94:	eb000868 	bl	223c <fourteen>
  bigfile();
      98:	eb0007f8 	bl	2080 <bigfile>
  subdir();
      9c:	eb00061e 	bl	191c <subdir>
  concreate();
      a0:	eb0004cd 	bl	13dc <concreate>
  linkunlink();
      a4:	eb000590 	bl	16ec <linkunlink>
  linktest();
      a8:	eb000449 	bl	11d4 <linktest>
  unlinkread();
      ac:	eb0003e6 	bl	104c <unlinkread>
  createdelete();
      b0:	eb00035c 	bl	e28 <createdelete>
  twofiles();
      b4:	eb0002d9 	bl	c20 <twofiles>
  sharedfd();
      b8:	eb000272 	bl	a88 <sharedfd>
  dirfile();
      bc:	eb000906 	bl	24dc <dirfile>
  iref();
      c0:	eb00097f 	bl	26c4 <iref>
  forktest();
      c4:	eb0009bd 	bl	27c0 <forktest>
  bigdir(); // slow
      c8:	eb0005c4 	bl	17e0 <bigdir>

  exectest();
      cc:	eb00015d 	bl	648 <exectest>

  exit();
      d0:	eb000d19 	bl	353c <exit>

000000d4 <opentest>:
{
      d4:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "open test\n");
      d8:	e30547e0 	movw	r4, #22496	; 0x57e0
      dc:	e3404000 	movt	r4, #0
{
      e0:	e28db00c 	add	fp, sp, #12
  printf(stdout, "open test\n");
      e4:	e3031d84 	movw	r1, #15748	; 0x3d84
      e8:	e3401000 	movt	r1, #0
      ec:	e5940000 	ldr	r0, [r4]
      f0:	eb000e5d 	bl	3a6c <printf>
  fd = open("echo", 0);
      f4:	e3030d90 	movw	r0, #15760	; 0x3d90
      f8:	e3a01000 	mov	r1, #0
      fc:	e3400000 	movt	r0, #0
     100:	eb000d75 	bl	36dc <open>
  if(fd < 0){
     104:	e3500000 	cmp	r0, #0
     108:	ba00000c 	blt	140 <opentest+0x6c>
  close(fd);
     10c:	eb000d4b 	bl	3640 <close>
  fd = open("doesnotexist", 0);
     110:	e3030dac 	movw	r0, #15788	; 0x3dac
     114:	e3a01000 	mov	r1, #0
     118:	e3400000 	movt	r0, #0
     11c:	eb000d6e 	bl	36dc <open>
  if(fd >= 0){
     120:	e3500000 	cmp	r0, #0
    printf(stdout, "open doesnotexist succeeded!\n");
     124:	e5940000 	ldr	r0, [r4]
  if(fd >= 0){
     128:	aa000009 	bge	154 <opentest+0x80>
  printf(stdout, "open test ok\n");
     12c:	e3031ddc 	movw	r1, #15836	; 0x3ddc
     130:	e3401000 	movt	r1, #0
}
     134:	e24bd00c 	sub	sp, fp, #12
     138:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "open test ok\n");
     13c:	ea000e4a 	b	3a6c <printf>
    printf(stdout, "open echo failed!\n");
     140:	e5940000 	ldr	r0, [r4]
     144:	e3031d98 	movw	r1, #15768	; 0x3d98
     148:	e3401000 	movt	r1, #0
     14c:	eb000e46 	bl	3a6c <printf>
    exit();
     150:	eb000cf9 	bl	353c <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     154:	e3031dbc 	movw	r1, #15804	; 0x3dbc
     158:	e3401000 	movt	r1, #0
     15c:	eb000e42 	bl	3a6c <printf>
    exit();
     160:	eb000cf5 	bl	353c <exit>

00000164 <writetest>:
{
     164:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test\n");
     168:	e30587e0 	movw	r8, #22496	; 0x57e0
     16c:	e3408000 	movt	r8, #0
{
     170:	e28db01c 	add	fp, sp, #28
  printf(stdout, "small file test\n");
     174:	e3031dec 	movw	r1, #15852	; 0x3dec
     178:	e3401000 	movt	r1, #0
     17c:	e5980000 	ldr	r0, [r8]
     180:	eb000e39 	bl	3a6c <printf>
  fd = open("small", O_CREATE|O_RDWR);
     184:	e3030e00 	movw	r0, #15872	; 0x3e00
     188:	e3001202 	movw	r1, #514	; 0x202
     18c:	e3400000 	movt	r0, #0
     190:	eb000d51 	bl	36dc <open>
  if(fd >= 0){
     194:	e2505000 	subs	r5, r0, #0
     198:	ba00005a 	blt	308 <writetest+0x1a4>
    printf(stdout, "creat small succeeded; ok\n");
     19c:	e3031e08 	movw	r1, #15880	; 0x3e08
     1a0:	e5980000 	ldr	r0, [r8]
     1a4:	e3401000 	movt	r1, #0
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1a8:	e3036e40 	movw	r6, #15936	; 0x3e40
    printf(stdout, "creat small succeeded; ok\n");
     1ac:	eb000e2e 	bl	3a6c <printf>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1b0:	e3037e70 	movw	r7, #15984	; 0x3e70
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
     1cc:	eb000d0e 	bl	360c <write>
     1d0:	e350000a 	cmp	r0, #10
     1d4:	1a000030 	bne	29c <writetest+0x138>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1d8:	e1a02000 	mov	r2, r0
     1dc:	e1a01007 	mov	r1, r7
     1e0:	e1a00005 	mov	r0, r5
     1e4:	eb000d08 	bl	360c <write>
     1e8:	e350000a 	cmp	r0, #10
     1ec:	1a000030 	bne	2b4 <writetest+0x150>
  for(i = 0; i < 100; i++){
     1f0:	e2844001 	add	r4, r4, #1
     1f4:	e3540064 	cmp	r4, #100	; 0x64
     1f8:	1afffff0 	bne	1c0 <writetest+0x5c>
  printf(stdout, "writes ok\n");
     1fc:	e5980000 	ldr	r0, [r8]
     200:	e3031ea0 	movw	r1, #16032	; 0x3ea0
     204:	e3401000 	movt	r1, #0
     208:	eb000e17 	bl	3a6c <printf>
  close(fd);
     20c:	e1a00005 	mov	r0, r5
     210:	eb000d0a 	bl	3640 <close>
  fd = open("small", O_RDONLY);
     214:	e3030e00 	movw	r0, #15872	; 0x3e00
     218:	e3a01000 	mov	r1, #0
     21c:	e3400000 	movt	r0, #0
     220:	eb000d2d 	bl	36dc <open>
  if(fd >= 0){
     224:	e2504000 	subs	r4, r0, #0
     228:	ba000027 	blt	2cc <writetest+0x168>
    printf(stdout, "open small succeeded ok\n");
     22c:	e5980000 	ldr	r0, [r8]
     230:	e3031eac 	movw	r1, #16044	; 0x3eac
     234:	e3401000 	movt	r1, #0
     238:	eb000e0b 	bl	3a6c <printf>
  i = read(fd, buf, 2000);
     23c:	e3071f98 	movw	r1, #32664	; 0x7f98
     240:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     244:	e3401000 	movt	r1, #0
     248:	e1a00004 	mov	r0, r4
     24c:	eb000ce1 	bl	35d8 <read>
  if(i == 2000){
     250:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     254:	1a000021 	bne	2e0 <writetest+0x17c>
    printf(stdout, "read succeeded ok\n");
     258:	e5980000 	ldr	r0, [r8]
     25c:	e3031ee4 	movw	r1, #16100	; 0x3ee4
     260:	e3401000 	movt	r1, #0
     264:	eb000e00 	bl	3a6c <printf>
  close(fd);
     268:	e1a00004 	mov	r0, r4
     26c:	eb000cf3 	bl	3640 <close>
  if(unlink("small") < 0){
     270:	e3030e00 	movw	r0, #15872	; 0x3e00
     274:	e3400000 	movt	r0, #0
     278:	eb000d31 	bl	3744 <unlink>
     27c:	e3500000 	cmp	r0, #0
     280:	ba00001b 	blt	2f4 <writetest+0x190>
  printf(stdout, "small file test ok\n");
     284:	e5980000 	ldr	r0, [r8]
     288:	e3031f20 	movw	r1, #16160	; 0x3f20
     28c:	e3401000 	movt	r1, #0
}
     290:	e24bd01c 	sub	sp, fp, #28
     294:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "small file test ok\n");
     298:	ea000df3 	b	3a6c <printf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     29c:	e1a02004 	mov	r2, r4
     2a0:	e5980000 	ldr	r0, [r8]
     2a4:	e3031e4c 	movw	r1, #15948	; 0x3e4c
     2a8:	e3401000 	movt	r1, #0
     2ac:	eb000dee 	bl	3a6c <printf>
      exit();
     2b0:	eb000ca1 	bl	353c <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     2b4:	e1a02004 	mov	r2, r4
     2b8:	e5980000 	ldr	r0, [r8]
     2bc:	e3031e7c 	movw	r1, #15996	; 0x3e7c
     2c0:	e3401000 	movt	r1, #0
     2c4:	eb000de8 	bl	3a6c <printf>
      exit();
     2c8:	eb000c9b 	bl	353c <exit>
    printf(stdout, "error: open small failed!\n");
     2cc:	e5980000 	ldr	r0, [r8]
     2d0:	e3031ec8 	movw	r1, #16072	; 0x3ec8
     2d4:	e3401000 	movt	r1, #0
     2d8:	eb000de3 	bl	3a6c <printf>
    exit();
     2dc:	eb000c96 	bl	353c <exit>
    printf(stdout, "read failed\n");
     2e0:	e5980000 	ldr	r0, [r8]
     2e4:	e3031ef8 	movw	r1, #16120	; 0x3ef8
     2e8:	e3401000 	movt	r1, #0
     2ec:	eb000dde 	bl	3a6c <printf>
    exit();
     2f0:	eb000c91 	bl	353c <exit>
    printf(stdout, "unlink small failed\n");
     2f4:	e5980000 	ldr	r0, [r8]
     2f8:	e3031f08 	movw	r1, #16136	; 0x3f08
     2fc:	e3401000 	movt	r1, #0
     300:	eb000dd9 	bl	3a6c <printf>
    exit();
     304:	eb000c8c 	bl	353c <exit>
    printf(stdout, "error: creat small failed!\n");
     308:	e5980000 	ldr	r0, [r8]
     30c:	e3031e24 	movw	r1, #15908	; 0x3e24
     310:	e3401000 	movt	r1, #0
     314:	eb000dd4 	bl	3a6c <printf>
    exit();
     318:	eb000c87 	bl	353c <exit>

0000031c <writetest1>:
{
     31c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files test\n");
     320:	e30587e0 	movw	r8, #22496	; 0x57e0
     324:	e3408000 	movt	r8, #0
{
     328:	e28db01c 	add	fp, sp, #28
  printf(stdout, "big files test\n");
     32c:	e3031f34 	movw	r1, #16180	; 0x3f34
     330:	e3401000 	movt	r1, #0
     334:	e5980000 	ldr	r0, [r8]
     338:	eb000dcb 	bl	3a6c <printf>
  fd = open("big", O_CREATE|O_RDWR);
     33c:	e3030f44 	movw	r0, #16196	; 0x3f44
     340:	e3001202 	movw	r1, #514	; 0x202
     344:	e3400000 	movt	r0, #0
     348:	eb000ce3 	bl	36dc <open>
  if(fd < 0){
     34c:	e2506000 	subs	r6, r0, #0
     350:	a3075f98 	movwge	r5, #32664	; 0x7f98
     354:	a3405000 	movtge	r5, #0
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
     374:	eb000ca4 	bl	360c <write>
     378:	e3500c02 	cmp	r0, #512	; 0x200
     37c:	1a000029 	bne	428 <writetest1+0x10c>
  for(i = 0; i < MAXFILE; i++){
     380:	e2844001 	add	r4, r4, #1
     384:	e354008c 	cmp	r4, #140	; 0x8c
     388:	1afffff5 	bne	364 <writetest1+0x48>
  close(fd);
     38c:	e1a00006 	mov	r0, r6
     390:	eb000caa 	bl	3640 <close>
  fd = open("big", O_RDONLY);
     394:	e3030f44 	movw	r0, #16196	; 0x3f44
     398:	e3a01000 	mov	r1, #0
     39c:	e3400000 	movt	r0, #0
     3a0:	eb000ccd 	bl	36dc <open>
  if(fd < 0){
     3a4:	e2507000 	subs	r7, r0, #0
     3a8:	ba000036 	blt	488 <writetest1+0x16c>
    i = read(fd, buf, 512);
     3ac:	e3076f98 	movw	r6, #32664	; 0x7f98
     3b0:	e3a04000 	mov	r4, #0
     3b4:	e3406000 	movt	r6, #0
     3b8:	ea000005 	b	3d4 <writetest1+0xb8>
    } else if(i != 512){
     3bc:	e3500c02 	cmp	r0, #512	; 0x200
     3c0:	1a000024 	bne	458 <writetest1+0x13c>
    if(((int*)buf)[0] != n){
     3c4:	e5953000 	ldr	r3, [r5]
     3c8:	e1540003 	cmp	r4, r3
     3cc:	1a00001b 	bne	440 <writetest1+0x124>
    n++;
     3d0:	e2844001 	add	r4, r4, #1
    i = read(fd, buf, 512);
     3d4:	e3a02c02 	mov	r2, #512	; 0x200
     3d8:	e1a01006 	mov	r1, r6
     3dc:	e1a00007 	mov	r0, r7
     3e0:	eb000c7c 	bl	35d8 <read>
    if(i == 0){
     3e4:	e3500000 	cmp	r0, #0
     3e8:	1afffff3 	bne	3bc <writetest1+0xa0>
      if(n == MAXFILE - 1){
     3ec:	e354008b 	cmp	r4, #139	; 0x8b
     3f0:	0a00001e 	beq	470 <writetest1+0x154>
  close(fd);
     3f4:	e1a00007 	mov	r0, r7
     3f8:	eb000c90 	bl	3640 <close>
  if(unlink("big") < 0){
     3fc:	e3030f44 	movw	r0, #16196	; 0x3f44
     400:	e3400000 	movt	r0, #0
     404:	eb000cce 	bl	3744 <unlink>
     408:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink big failed\n");
     40c:	e5980000 	ldr	r0, [r8]
  if(unlink("big") < 0){
     410:	ba000026 	blt	4b0 <writetest1+0x194>
  printf(stdout, "big files ok\n");
     414:	e3041004 	movw	r1, #16388	; 0x4004
     418:	e3401000 	movt	r1, #0
}
     41c:	e24bd01c 	sub	sp, fp, #28
     420:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "big files ok\n");
     424:	ea000d90 	b	3a6c <printf>
      printf(stdout, "error: write big file failed\n", i);
     428:	e1a02004 	mov	r2, r4
     42c:	e5980000 	ldr	r0, [r8]
     430:	e3031f64 	movw	r1, #16228	; 0x3f64
     434:	e3401000 	movt	r1, #0
     438:	eb000d8b 	bl	3a6c <printf>
      exit();
     43c:	eb000c3e 	bl	353c <exit>
      printf(stdout, "read content of block %d is %d\n",
     440:	e1a02004 	mov	r2, r4
     444:	e5980000 	ldr	r0, [r8]
     448:	e3031fd0 	movw	r1, #16336	; 0x3fd0
     44c:	e3401000 	movt	r1, #0
     450:	eb000d85 	bl	3a6c <printf>
      exit();
     454:	eb000c38 	bl	353c <exit>
      printf(stdout, "read failed %d\n", i);
     458:	e1a02000 	mov	r2, r0
     45c:	e3031fc0 	movw	r1, #16320	; 0x3fc0
     460:	e5980000 	ldr	r0, [r8]
     464:	e3401000 	movt	r1, #0
     468:	eb000d7f 	bl	3a6c <printf>
      exit();
     46c:	eb000c32 	bl	353c <exit>
        printf(stdout, "read only %d blocks from big", n);
     470:	e1a02004 	mov	r2, r4
     474:	e5980000 	ldr	r0, [r8]
     478:	e3031fa0 	movw	r1, #16288	; 0x3fa0
     47c:	e3401000 	movt	r1, #0
     480:	eb000d79 	bl	3a6c <printf>
        exit();
     484:	eb000c2c 	bl	353c <exit>
    printf(stdout, "error: open big failed!\n");
     488:	e5980000 	ldr	r0, [r8]
     48c:	e3031f84 	movw	r1, #16260	; 0x3f84
     490:	e3401000 	movt	r1, #0
     494:	eb000d74 	bl	3a6c <printf>
    exit();
     498:	eb000c27 	bl	353c <exit>
    printf(stdout, "error: creat big failed!\n");
     49c:	e5980000 	ldr	r0, [r8]
     4a0:	e3031f48 	movw	r1, #16200	; 0x3f48
     4a4:	e3401000 	movt	r1, #0
     4a8:	eb000d6f 	bl	3a6c <printf>
    exit();
     4ac:	eb000c22 	bl	353c <exit>
    printf(stdout, "unlink big failed\n");
     4b0:	e3031ff0 	movw	r1, #16368	; 0x3ff0
     4b4:	e3401000 	movt	r1, #0
     4b8:	eb000d6b 	bl	3a6c <printf>
    exit();
     4bc:	eb000c1e 	bl	353c <exit>

000004c0 <createtest>:
{
     4c0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink test\n");
     4c4:	e30577e0 	movw	r7, #22496	; 0x57e0
  name[0] = 'a';
     4c8:	e3095f98 	movw	r5, #40856	; 0x9f98
  printf(stdout, "many creates, followed by unlink test\n");
     4cc:	e3407000 	movt	r7, #0
  name[0] = 'a';
     4d0:	e3405000 	movt	r5, #0
{
     4d4:	e28db014 	add	fp, sp, #20
  printf(stdout, "many creates, followed by unlink test\n");
     4d8:	e3041014 	movw	r1, #16404	; 0x4014
     4dc:	e5970000 	ldr	r0, [r7]
     4e0:	e3401000 	movt	r1, #0
  name[2] = '\0';
     4e4:	e3a04030 	mov	r4, #48	; 0x30
    fd = open(name, O_CREATE|O_RDWR);
     4e8:	e1a06005 	mov	r6, r5
  printf(stdout, "many creates, followed by unlink test\n");
     4ec:	eb000d5e 	bl	3a6c <printf>
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
     510:	eb000c71 	bl	36dc <open>
     514:	e6ef4074 	uxtb	r4, r4
    close(fd);
     518:	eb000c48 	bl	3640 <close>
  for(i = 0; i < 52; i++){
     51c:	e3540064 	cmp	r4, #100	; 0x64
     520:	1afffff6 	bne	500 <createtest+0x40>
    unlink(name);
     524:	e3096f98 	movw	r6, #40856	; 0x9f98
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
     550:	eb000c7b 	bl	3744 <unlink>
  for(i = 0; i < 52; i++){
     554:	e3540064 	cmp	r4, #100	; 0x64
     558:	1afffff8 	bne	540 <createtest+0x80>
  printf(stdout, "many creates, followed by unlink; ok\n");
     55c:	e5970000 	ldr	r0, [r7]
     560:	e304103c 	movw	r1, #16444	; 0x403c
     564:	e3401000 	movt	r1, #0
}
     568:	e24bd014 	sub	sp, fp, #20
     56c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "many creates, followed by unlink; ok\n");
     570:	ea000d3d 	b	3a6c <printf>

00000574 <dirtest>:
{
     574:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     578:	e30547e0 	movw	r4, #22496	; 0x57e0
     57c:	e3404000 	movt	r4, #0
{
     580:	e28db00c 	add	fp, sp, #12
  printf(stdout, "mkdir test\n");
     584:	e3041064 	movw	r1, #16484	; 0x4064
     588:	e3401000 	movt	r1, #0
     58c:	e5940000 	ldr	r0, [r4]
     590:	eb000d35 	bl	3a6c <printf>
  if(mkdir("dir0") < 0){
     594:	e3040070 	movw	r0, #16496	; 0x4070
     598:	e3400000 	movt	r0, #0
     59c:	eb000c8f 	bl	37e0 <mkdir>
     5a0:	e3500000 	cmp	r0, #0
     5a4:	ba000014 	blt	5fc <dirtest+0x88>
  if(chdir("dir0") < 0){
     5a8:	e3040070 	movw	r0, #16496	; 0x4070
     5ac:	e3400000 	movt	r0, #0
     5b0:	eb000c97 	bl	3814 <chdir>
     5b4:	e3500000 	cmp	r0, #0
     5b8:	ba00001d 	blt	634 <dirtest+0xc0>
  if(chdir("..") < 0){
     5bc:	e304009c 	movw	r0, #16540	; 0x409c
     5c0:	e3400000 	movt	r0, #0
     5c4:	eb000c92 	bl	3814 <chdir>
     5c8:	e3500000 	cmp	r0, #0
     5cc:	ba000013 	blt	620 <dirtest+0xac>
  if(unlink("dir0") < 0){
     5d0:	e3040070 	movw	r0, #16496	; 0x4070
     5d4:	e3400000 	movt	r0, #0
     5d8:	eb000c59 	bl	3744 <unlink>
     5dc:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink dir0 failed\n");
     5e0:	e5940000 	ldr	r0, [r4]
  if(unlink("dir0") < 0){
     5e4:	ba000009 	blt	610 <dirtest+0x9c>
  printf(stdout, "mkdir test\n");
     5e8:	e3041064 	movw	r1, #16484	; 0x4064
     5ec:	e3401000 	movt	r1, #0
}
     5f0:	e24bd00c 	sub	sp, fp, #12
     5f4:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     5f8:	ea000d1b 	b	3a6c <printf>
    printf(stdout, "mkdir failed\n");
     5fc:	e5940000 	ldr	r0, [r4]
     600:	e3041078 	movw	r1, #16504	; 0x4078
     604:	e3401000 	movt	r1, #0
     608:	eb000d17 	bl	3a6c <printf>
    exit();
     60c:	eb000bca 	bl	353c <exit>
    printf(stdout, "unlink dir0 failed\n");
     610:	e30410b4 	movw	r1, #16564	; 0x40b4
     614:	e3401000 	movt	r1, #0
     618:	eb000d13 	bl	3a6c <printf>
    exit();
     61c:	eb000bc6 	bl	353c <exit>
    printf(stdout, "chdir .. failed\n");
     620:	e5940000 	ldr	r0, [r4]
     624:	e30410a0 	movw	r1, #16544	; 0x40a0
     628:	e3401000 	movt	r1, #0
     62c:	eb000d0e 	bl	3a6c <printf>
    exit();
     630:	eb000bc1 	bl	353c <exit>
    printf(stdout, "chdir dir0 failed\n");
     634:	e5940000 	ldr	r0, [r4]
     638:	e3041088 	movw	r1, #16520	; 0x4088
     63c:	e3401000 	movt	r1, #0
     640:	eb000d09 	bl	3a6c <printf>
    exit();
     644:	eb000bbc 	bl	353c <exit>

00000648 <exectest>:
{
     648:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "exec test\n");
     64c:	e30547e0 	movw	r4, #22496	; 0x57e0
     650:	e3404000 	movt	r4, #0
{
     654:	e28db00c 	add	fp, sp, #12
  printf(stdout, "exec test\n");
     658:	e30410c8 	movw	r1, #16584	; 0x40c8
     65c:	e3401000 	movt	r1, #0
     660:	e5940000 	ldr	r0, [r4]
     664:	eb000d00 	bl	3a6c <printf>
  if(exec("echo", echoargv) < 0){
     668:	e2841004 	add	r1, r4, #4
     66c:	e3030d90 	movw	r0, #15760	; 0x3d90
     670:	e3400000 	movt	r0, #0
     674:	eb000c0b 	bl	36a8 <exec>
     678:	e3500000 	cmp	r0, #0
     67c:	a8bd8830 	popge	{r4, r5, fp, pc}
    printf(stdout, "exec echo failed\n");
     680:	e5940000 	ldr	r0, [r4]
     684:	e30410d4 	movw	r1, #16596	; 0x40d4
     688:	e3401000 	movt	r1, #0
     68c:	eb000cf6 	bl	3a6c <printf>
    exit();
     690:	eb000ba9 	bl	353c <exit>

00000694 <pipe1>:
{
     694:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     698:	e28db018 	add	fp, sp, #24
  if(pipe(fds) != 0){
     69c:	e24b0024 	sub	r0, fp, #36	; 0x24
{
     6a0:	e24dd00c 	sub	sp, sp, #12
  if(pipe(fds) != 0){
     6a4:	eb000bbe 	bl	35a4 <pipe>
     6a8:	e2504000 	subs	r4, r0, #0
     6ac:	1a00004b 	bne	7e0 <pipe1+0x14c>
  pid = fork();
     6b0:	eb000b94 	bl	3508 <fork>
  if(pid == 0){
     6b4:	e2505000 	subs	r5, r0, #0
     6b8:	0a000020 	beq	740 <pipe1+0xac>
  } else if(pid > 0){
     6bc:	da00004c 	ble	7f4 <pipe1+0x160>
    close(fds[1]);
     6c0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    while((n = read(fds[0], buf, cc)) > 0){
     6c4:	e3075f98 	movw	r5, #32664	; 0x7f98
    close(fds[1]);
     6c8:	eb000bdc 	bl	3640 <close>
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
     6e4:	eb000bbb 	bl	35d8 <read>
     6e8:	e3500000 	cmp	r0, #0
     6ec:	da00002a 	ble	79c <pipe1+0x108>
     6f0:	e59f3124 	ldr	r3, [pc, #292]	; 81c <pipe1+0x188>
     6f4:	e080c004 	add	ip, r0, r4
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     6f8:	e5f31001 	ldrb	r1, [r3, #1]!
     6fc:	e6ef2074 	uxtb	r2, r4
     700:	e2844001 	add	r4, r4, #1
     704:	e1510002 	cmp	r1, r2
     708:	1a000006 	bne	728 <pipe1+0x94>
      for(i = 0; i < n; i++){
     70c:	e154000c 	cmp	r4, ip
     710:	1afffff8 	bne	6f8 <pipe1+0x64>
      cc = cc * 2;
     714:	e1a07087 	lsl	r7, r7, #1
      total += n;
     718:	e0866000 	add	r6, r6, r0
     71c:	e3570a02 	cmp	r7, #8192	; 0x2000
     720:	a3a07a02 	movge	r7, #8192	; 0x2000
     724:	eaffffeb 	b	6d8 <pipe1+0x44>
          printf(1, "pipe1 oops 2\n");
     728:	e3041108 	movw	r1, #16648	; 0x4108
     72c:	e3a00001 	mov	r0, #1
     730:	e3401000 	movt	r1, #0
     734:	eb000ccc 	bl	3a6c <printf>
}
     738:	e24bd018 	sub	sp, fp, #24
     73c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    close(fds[0]);
     740:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
      if(write(fds[1], buf, 1033) != 1033){
     744:	e3077f98 	movw	r7, #32664	; 0x7f98
    close(fds[0]);
     748:	eb000bbc 	bl	3640 <close>
     74c:	e59f40cc 	ldr	r4, [pc, #204]	; 820 <pipe1+0x18c>
      if(write(fds[1], buf, 1033) != 1033){
     750:	e3407000 	movt	r7, #0
     754:	e3006409 	movw	r6, #1033	; 0x409
    for(n = 0; n < 5; n++){
     758:	e301842d 	movw	r8, #5165	; 0x142d
     75c:	e59f30b8 	ldr	r3, [pc, #184]	; 81c <pipe1+0x188>
     760:	e1a02005 	mov	r2, r5
        buf[i] = seq++;
     764:	e5e32001 	strb	r2, [r3, #1]!
      for(i = 0; i < 1033; i++)
     768:	e1530004 	cmp	r3, r4
     76c:	e2822001 	add	r2, r2, #1
     770:	1afffffb 	bne	764 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     774:	e3002409 	movw	r2, #1033	; 0x409
     778:	e1a01007 	mov	r1, r7
     77c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
     780:	e0855006 	add	r5, r5, r6
     784:	eb000ba0 	bl	360c <write>
     788:	e1500006 	cmp	r0, r6
     78c:	1a00001d 	bne	808 <pipe1+0x174>
    for(n = 0; n < 5; n++){
     790:	e1550008 	cmp	r5, r8
     794:	1afffff0 	bne	75c <pipe1+0xc8>
      exit();
     798:	eb000b67 	bl	353c <exit>
    if(total != 5 * 1033){
     79c:	e301342d 	movw	r3, #5165	; 0x142d
     7a0:	e1560003 	cmp	r6, r3
     7a4:	1a000007 	bne	7c8 <pipe1+0x134>
    close(fds[0]);
     7a8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
     7ac:	eb000ba3 	bl	3640 <close>
    wait();
     7b0:	eb000b6e 	bl	3570 <wait>
  printf(1, "pipe1 ok\n");
     7b4:	e3041130 	movw	r1, #16688	; 0x4130
     7b8:	e3a00001 	mov	r0, #1
     7bc:	e3401000 	movt	r1, #0
     7c0:	eb000ca9 	bl	3a6c <printf>
     7c4:	eaffffdb 	b	738 <pipe1+0xa4>
      printf(1, "pipe1 oops 3 total %d\n", total);
     7c8:	e1a02006 	mov	r2, r6
     7cc:	e3041118 	movw	r1, #16664	; 0x4118
     7d0:	e3a00001 	mov	r0, #1
     7d4:	e3401000 	movt	r1, #0
     7d8:	eb000ca3 	bl	3a6c <printf>
     7dc:	eaffffed 	b	798 <pipe1+0x104>
    printf(1, "pipe() failed\n");
     7e0:	e30410e8 	movw	r1, #16616	; 0x40e8
     7e4:	e3a00001 	mov	r0, #1
     7e8:	e3401000 	movt	r1, #0
     7ec:	eb000c9e 	bl	3a6c <printf>
    exit();
     7f0:	eb000b51 	bl	353c <exit>
    printf(1, "fork() failed\n");
     7f4:	e304113c 	movw	r1, #16700	; 0x413c
     7f8:	e3a00001 	mov	r0, #1
     7fc:	e3401000 	movt	r1, #0
     800:	eb000c99 	bl	3a6c <printf>
    exit();
     804:	eb000b4c 	bl	353c <exit>
        printf(1, "pipe1 oops 1\n");
     808:	e30410f8 	movw	r1, #16632	; 0x40f8
     80c:	e3a00001 	mov	r0, #1
     810:	e3401000 	movt	r1, #0
     814:	eb000c94 	bl	3a6c <printf>
        exit();
     818:	eb000b47 	bl	353c <exit>
     81c:	00007f97 	.word	0x00007f97
     820:	000083a0 	.word	0x000083a0

00000824 <preempt>:
{
     824:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "preempt: ");
     828:	e3a00001 	mov	r0, #1
{
     82c:	e28db014 	add	fp, sp, #20
  printf(1, "preempt: ");
     830:	e304114c 	movw	r1, #16716	; 0x414c
{
     834:	e24dd008 	sub	sp, sp, #8
  printf(1, "preempt: ");
     838:	e3401000 	movt	r1, #0
     83c:	eb000c8a 	bl	3a6c <printf>
  pid1 = fork();
     840:	eb000b30 	bl	3508 <fork>
  if(pid1 == 0)
     844:	e2507000 	subs	r7, r0, #0
     848:	1a000000 	bne	850 <preempt+0x2c>
     84c:	eafffffe 	b	84c <preempt+0x28>
  pid2 = fork();
     850:	eb000b2c 	bl	3508 <fork>
  if(pid2 == 0)
     854:	e2506000 	subs	r6, r0, #0
     858:	1a000000 	bne	860 <preempt+0x3c>
     85c:	eafffffe 	b	85c <preempt+0x38>
  pipe(pfds);
     860:	e24b001c 	sub	r0, fp, #28
     864:	eb000b4e 	bl	35a4 <pipe>
  pid3 = fork();
     868:	eb000b26 	bl	3508 <fork>
  if(pid3 == 0){
     86c:	e2505000 	subs	r5, r0, #0
     870:	1a00000f 	bne	8b4 <preempt+0x90>
    close(pfds[0]);
     874:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     878:	eb000b70 	bl	3640 <close>
    if(write(pfds[1], "x", 1) != 1)
     87c:	e3041ab8 	movw	r1, #19128	; 0x4ab8
     880:	e3a02001 	mov	r2, #1
     884:	e3401000 	movt	r1, #0
     888:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     88c:	eb000b5e 	bl	360c <write>
     890:	e3500001 	cmp	r0, #1
     894:	0a000003 	beq	8a8 <preempt+0x84>
      printf(1, "preempt write error");
     898:	e3041158 	movw	r1, #16728	; 0x4158
     89c:	e3a00001 	mov	r0, #1
     8a0:	e3401000 	movt	r1, #0
     8a4:	eb000c70 	bl	3a6c <printf>
    close(pfds[1]);
     8a8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8ac:	eb000b63 	bl	3640 <close>
     8b0:	eafffffe 	b	8b0 <preempt+0x8c>
  close(pfds[1]);
     8b4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8b8:	eb000b60 	bl	3640 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     8bc:	e3071f98 	movw	r1, #32664	; 0x7f98
     8c0:	e3a02a02 	mov	r2, #8192	; 0x2000
     8c4:	e3401000 	movt	r1, #0
     8c8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8cc:	eb000b41 	bl	35d8 <read>
     8d0:	e3500001 	cmp	r0, #1
     8d4:	e1a04000 	mov	r4, r0
     8d8:	0a000005 	beq	8f4 <preempt+0xd0>
    printf(1, "preempt read error");
     8dc:	e304116c 	movw	r1, #16748	; 0x416c
     8e0:	e3a00001 	mov	r0, #1
     8e4:	e3401000 	movt	r1, #0
     8e8:	eb000c5f 	bl	3a6c <printf>
}
     8ec:	e24bd014 	sub	sp, fp, #20
     8f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  close(pfds[0]);
     8f4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8f8:	eb000b50 	bl	3640 <close>
  printf(1, "kill... ");
     8fc:	e1a00004 	mov	r0, r4
     900:	e3041180 	movw	r1, #16768	; 0x4180
     904:	e3401000 	movt	r1, #0
     908:	eb000c57 	bl	3a6c <printf>
  kill(pid1);
     90c:	e1a00007 	mov	r0, r7
     910:	eb000b57 	bl	3674 <kill>
  kill(pid2);
     914:	e1a00006 	mov	r0, r6
     918:	eb000b55 	bl	3674 <kill>
  kill(pid3);
     91c:	e1a00005 	mov	r0, r5
     920:	eb000b53 	bl	3674 <kill>
  printf(1, "wait... ");
     924:	e1a00004 	mov	r0, r4
     928:	e304118c 	movw	r1, #16780	; 0x418c
     92c:	e3401000 	movt	r1, #0
     930:	eb000c4d 	bl	3a6c <printf>
  wait();
     934:	eb000b0d 	bl	3570 <wait>
  wait();
     938:	eb000b0c 	bl	3570 <wait>
  wait();
     93c:	eb000b0b 	bl	3570 <wait>
  printf(1, "preempt ok\n");
     940:	e1a00004 	mov	r0, r4
     944:	e3041198 	movw	r1, #16792	; 0x4198
     948:	e3401000 	movt	r1, #0
     94c:	eb000c46 	bl	3a6c <printf>
     950:	eaffffe5 	b	8ec <preempt+0xc8>

00000954 <exitwait>:
{
     954:	e92d4830 	push	{r4, r5, fp, lr}
     958:	e3a04064 	mov	r4, #100	; 0x64
     95c:	e28db00c 	add	fp, sp, #12
     960:	ea000005 	b	97c <exitwait+0x28>
    if(pid){
     964:	0a000019 	beq	9d0 <exitwait+0x7c>
      if(wait() != pid){
     968:	eb000b00 	bl	3570 <wait>
     96c:	e1550000 	cmp	r5, r0
     970:	1a00000a 	bne	9a0 <exitwait+0x4c>
  for(i = 0; i < 100; i++){
     974:	e2544001 	subs	r4, r4, #1
     978:	0a00000e 	beq	9b8 <exitwait+0x64>
    pid = fork();
     97c:	eb000ae1 	bl	3508 <fork>
    if(pid < 0){
     980:	e2505000 	subs	r5, r0, #0
     984:	aafffff6 	bge	964 <exitwait+0x10>
      printf(1, "fork failed\n");
     988:	e30516e4 	movw	r1, #22244	; 0x56e4
     98c:	e3a00001 	mov	r0, #1
     990:	e3401000 	movt	r1, #0
}
     994:	e24bd00c 	sub	sp, fp, #12
     998:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     99c:	ea000c32 	b	3a6c <printf>
        printf(1, "wait wrong pid\n");
     9a0:	e30411a4 	movw	r1, #16804	; 0x41a4
     9a4:	e3a00001 	mov	r0, #1
     9a8:	e3401000 	movt	r1, #0
}
     9ac:	e24bd00c 	sub	sp, fp, #12
     9b0:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9b4:	ea000c2c 	b	3a6c <printf>
     9b8:	e30411b4 	movw	r1, #16820	; 0x41b4
     9bc:	e3a00001 	mov	r0, #1
     9c0:	e3401000 	movt	r1, #0
}
     9c4:	e24bd00c 	sub	sp, fp, #12
     9c8:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "exitwait ok\n");
     9cc:	ea000c26 	b	3a6c <printf>
      exit();
     9d0:	eb000ad9 	bl	353c <exit>

000009d4 <mem>:
{
     9d4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "mem test\n");
     9d8:	e3a00001 	mov	r0, #1
{
     9dc:	e28db014 	add	fp, sp, #20
  printf(1, "mem test\n");
     9e0:	e30411c4 	movw	r1, #16836	; 0x41c4
     9e4:	e3401000 	movt	r1, #0
     9e8:	eb000c1f 	bl	3a6c <printf>
  ppid = getpid();
     9ec:	eb000ba2 	bl	387c <getpid>
     9f0:	e1a06000 	mov	r6, r0
  if((pid = fork()) == 0){
     9f4:	eb000ac3 	bl	3508 <fork>
     9f8:	e2504000 	subs	r4, r0, #0
     9fc:	0a000002 	beq	a0c <mem+0x38>
     a00:	ea000016 	b	a60 <mem+0x8c>
      *(char**)m2 = m1;
     a04:	e5804000 	str	r4, [r0]
     a08:	e1a04000 	mov	r4, r0
    while((m2 = malloc(10001)) != 0){
     a0c:	e3020711 	movw	r0, #10001	; 0x2711
     a10:	eb000ca4 	bl	3ca8 <malloc>
     a14:	e3500000 	cmp	r0, #0
     a18:	1afffff9 	bne	a04 <mem+0x30>
    while(m1){
     a1c:	e3540000 	cmp	r4, #0
     a20:	0a000004 	beq	a38 <mem+0x64>
      m2 = *(char**)m1;
     a24:	e5945000 	ldr	r5, [r4]
      free(m1);
     a28:	e1a00004 	mov	r0, r4
     a2c:	eb000c76 	bl	3c0c <free>
    while(m1){
     a30:	e2554000 	subs	r4, r5, #0
     a34:	1afffffa 	bne	a24 <mem+0x50>
    m1 = malloc(1024*20);
     a38:	e3a00a05 	mov	r0, #20480	; 0x5000
     a3c:	eb000c99 	bl	3ca8 <malloc>
    if(m1 == 0){
     a40:	e3500000 	cmp	r0, #0
     a44:	0a000008 	beq	a6c <mem+0x98>
    free(m1);
     a48:	eb000c6f 	bl	3c0c <free>
    printf(1, "mem ok\n");
     a4c:	e30411ec 	movw	r1, #16876	; 0x41ec
     a50:	e3a00001 	mov	r0, #1
     a54:	e3401000 	movt	r1, #0
     a58:	eb000c03 	bl	3a6c <printf>
    exit();
     a5c:	eb000ab6 	bl	353c <exit>
}
     a60:	e24bd014 	sub	sp, fp, #20
     a64:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    wait();
     a68:	ea000ac0 	b	3570 <wait>
      printf(1, "couldn't allocate mem?!!\n");
     a6c:	e3a00001 	mov	r0, #1
     a70:	e30411d0 	movw	r1, #16848	; 0x41d0
     a74:	e3401000 	movt	r1, #0
     a78:	eb000bfb 	bl	3a6c <printf>
      kill(ppid);
     a7c:	e1a00006 	mov	r0, r6
     a80:	eb000afb 	bl	3674 <kill>
      exit();
     a84:	eb000aac 	bl	353c <exit>

00000a88 <sharedfd>:
{
     a88:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "sharedfd test\n");
     a8c:	e3a00001 	mov	r0, #1
{
     a90:	e28db014 	add	fp, sp, #20
  printf(1, "sharedfd test\n");
     a94:	e30411f4 	movw	r1, #16884	; 0x41f4
{
     a98:	e24dd010 	sub	sp, sp, #16
  printf(1, "sharedfd test\n");
     a9c:	e3401000 	movt	r1, #0
     aa0:	eb000bf1 	bl	3a6c <printf>
  unlink("sharedfd");
     aa4:	e3040204 	movw	r0, #16900	; 0x4204
     aa8:	e3400000 	movt	r0, #0
     aac:	eb000b24 	bl	3744 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ab0:	e3040204 	movw	r0, #16900	; 0x4204
     ab4:	e3001202 	movw	r1, #514	; 0x202
     ab8:	e3400000 	movt	r0, #0
     abc:	eb000b06 	bl	36dc <open>
  if(fd < 0){
     ac0:	e2505000 	subs	r5, r0, #0
     ac4:	ba000042 	blt	bd4 <sharedfd+0x14c>
  pid = fork();
     ac8:	eb000a8e 	bl	3508 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     acc:	e3a0200a 	mov	r2, #10
     ad0:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     ad4:	e3500000 	cmp	r0, #0
     ad8:	e1a06000 	mov	r6, r0
     adc:	e24b0020 	sub	r0, fp, #32
     ae0:	03a01063 	moveq	r1, #99	; 0x63
     ae4:	13a01070 	movne	r1, #112	; 0x70
     ae8:	eb000a1c 	bl	3360 <memset>
     aec:	ea000001 	b	af8 <sharedfd+0x70>
  for(i = 0; i < 1000; i++){
     af0:	e2544001 	subs	r4, r4, #1
     af4:	0a000009 	beq	b20 <sharedfd+0x98>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     af8:	e3a0200a 	mov	r2, #10
     afc:	e24b1020 	sub	r1, fp, #32
     b00:	e1a00005 	mov	r0, r5
     b04:	eb000ac0 	bl	360c <write>
     b08:	e350000a 	cmp	r0, #10
     b0c:	0afffff7 	beq	af0 <sharedfd+0x68>
      printf(1, "fstests: write sharedfd failed\n");
     b10:	e304123c 	movw	r1, #16956	; 0x423c
     b14:	e3a00001 	mov	r0, #1
     b18:	e3401000 	movt	r1, #0
     b1c:	eb000bd2 	bl	3a6c <printf>
  if(pid == 0)
     b20:	e3560000 	cmp	r6, #0
     b24:	0a00003c 	beq	c1c <sharedfd+0x194>
    wait();
     b28:	eb000a90 	bl	3570 <wait>
  close(fd);
     b2c:	e1a00005 	mov	r0, r5
     b30:	eb000ac2 	bl	3640 <close>
  fd = open("sharedfd", 0);
     b34:	e3040204 	movw	r0, #16900	; 0x4204
     b38:	e3a01000 	mov	r1, #0
     b3c:	e3400000 	movt	r0, #0
     b40:	eb000ae5 	bl	36dc <open>
  if(fd < 0){
     b44:	e2507000 	subs	r7, r0, #0
     b48:	a24b4016 	subge	r4, fp, #22
     b4c:	a3a05000 	movge	r5, #0
     b50:	a1a06005 	movge	r6, r5
     b54:	ba000024 	blt	bec <sharedfd+0x164>
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b58:	e3a0200a 	mov	r2, #10
     b5c:	e24b1020 	sub	r1, fp, #32
     b60:	e1a00007 	mov	r0, r7
     b64:	eb000a9b 	bl	35d8 <read>
     b68:	e3500000 	cmp	r0, #0
     b6c:	da000009 	ble	b98 <sharedfd+0x110>
     b70:	e24b2020 	sub	r2, fp, #32
      if(buf[i] == 'c')
     b74:	e4d21001 	ldrb	r1, [r2], #1
     b78:	e3510063 	cmp	r1, #99	; 0x63
        nc++;
     b7c:	02866001 	addeq	r6, r6, #1
      if(buf[i] == 'c')
     b80:	0a000001 	beq	b8c <sharedfd+0x104>
      if(buf[i] == 'p')
     b84:	e3510070 	cmp	r1, #112	; 0x70
        np++;
     b88:	02855001 	addeq	r5, r5, #1
    for(i = 0; i < sizeof(buf); i++){
     b8c:	e1540002 	cmp	r4, r2
     b90:	1afffff7 	bne	b74 <sharedfd+0xec>
     b94:	eaffffef 	b	b58 <sharedfd+0xd0>
  close(fd);
     b98:	e1a00007 	mov	r0, r7
     b9c:	eb000aa7 	bl	3640 <close>
  unlink("sharedfd");
     ba0:	e3040204 	movw	r0, #16900	; 0x4204
     ba4:	e3400000 	movt	r0, #0
     ba8:	eb000ae5 	bl	3744 <unlink>
  if(nc == 10000 && np == 10000){
     bac:	e3023710 	movw	r3, #10000	; 0x2710
     bb0:	e1560003 	cmp	r6, r3
     bb4:	01550003 	cmpeq	r5, r3
     bb8:	1a000011 	bne	c04 <sharedfd+0x17c>
    printf(1, "sharedfd ok\n");
     bbc:	e3a00001 	mov	r0, #1
     bc0:	e3041288 	movw	r1, #17032	; 0x4288
     bc4:	e3401000 	movt	r1, #0
     bc8:	eb000ba7 	bl	3a6c <printf>
}
     bcc:	e24bd014 	sub	sp, fp, #20
     bd0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for writing");
     bd4:	e3a00001 	mov	r0, #1
     bd8:	e3041210 	movw	r1, #16912	; 0x4210
     bdc:	e3401000 	movt	r1, #0
     be0:	eb000ba1 	bl	3a6c <printf>
}
     be4:	e24bd014 	sub	sp, fp, #20
     be8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "fstests: cannot open sharedfd for reading\n");
     bec:	e3a00001 	mov	r0, #1
     bf0:	e304125c 	movw	r1, #16988	; 0x425c
     bf4:	e3401000 	movt	r1, #0
     bf8:	eb000b9b 	bl	3a6c <printf>
}
     bfc:	e24bd014 	sub	sp, fp, #20
     c00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    printf(1, "sharedfd oops %d %d\n", nc, np);
     c04:	e3041298 	movw	r1, #17048	; 0x4298
     c08:	e1a03005 	mov	r3, r5
     c0c:	e1a02006 	mov	r2, r6
     c10:	e3a00001 	mov	r0, #1
     c14:	e3401000 	movt	r1, #0
     c18:	eb000b93 	bl	3a6c <printf>
    exit();
     c1c:	eb000a46 	bl	353c <exit>

00000c20 <twofiles>:
{
     c20:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "twofiles test\n");
     c24:	e3a00001 	mov	r0, #1
{
     c28:	e28db024 	add	fp, sp, #36	; 0x24
  printf(1, "twofiles test\n");
     c2c:	e30412b4 	movw	r1, #17076	; 0x42b4
     c30:	e3401000 	movt	r1, #0
     c34:	eb000b8c 	bl	3a6c <printf>
  unlink("f1");
     c38:	e30402c4 	movw	r0, #17092	; 0x42c4
     c3c:	e3400000 	movt	r0, #0
     c40:	eb000abf 	bl	3744 <unlink>
  unlink("f2");
     c44:	e30402b0 	movw	r0, #17072	; 0x42b0
     c48:	e3400000 	movt	r0, #0
     c4c:	eb000abc 	bl	3744 <unlink>
  pid = fork();
     c50:	eb000a2c 	bl	3508 <fork>
  if(pid < 0){
     c54:	e2507000 	subs	r7, r0, #0
     c58:	ba000061 	blt	de4 <twofiles+0x1c4>
  fname = pid ? "f1" : "f2";
     c5c:	0a00004d 	beq	d98 <twofiles+0x178>
  fd = open(fname, O_CREATE | O_RDWR);
     c60:	e30402c4 	movw	r0, #17092	; 0x42c4
     c64:	e3001202 	movw	r1, #514	; 0x202
     c68:	e3400000 	movt	r0, #0
     c6c:	eb000a9a 	bl	36dc <open>
  if(fd < 0){
     c70:	e2504000 	subs	r4, r0, #0
     c74:	ba00005f 	blt	df8 <twofiles+0x1d8>
  memset(buf, pid?'p':'c', 512);
     c78:	e3a01070 	mov	r1, #112	; 0x70
     c7c:	e3070f98 	movw	r0, #32664	; 0x7f98
     c80:	e3a02c02 	mov	r2, #512	; 0x200
     c84:	e3400000 	movt	r0, #0
    if((n = write(fd, buf, 500)) != 500){
     c88:	e3076f98 	movw	r6, #32664	; 0x7f98
  memset(buf, pid?'p':'c', 512);
     c8c:	eb0009b3 	bl	3360 <memset>
    if((n = write(fd, buf, 500)) != 500){
     c90:	e3406000 	movt	r6, #0
  memset(buf, pid?'p':'c', 512);
     c94:	e3a0500c 	mov	r5, #12
    if((n = write(fd, buf, 500)) != 500){
     c98:	e3a02f7d 	mov	r2, #500	; 0x1f4
     c9c:	e1a01006 	mov	r1, r6
     ca0:	e1a00004 	mov	r0, r4
     ca4:	eb000a58 	bl	360c <write>
     ca8:	e3500f7d 	cmp	r0, #500	; 0x1f4
     cac:	1a000046 	bne	dcc <twofiles+0x1ac>
  for(i = 0; i < 12; i++){
     cb0:	e2555001 	subs	r5, r5, #1
     cb4:	1afffff7 	bne	c98 <twofiles+0x78>
  close(fd);
     cb8:	e1a00004 	mov	r0, r4
     cbc:	eb000a5f 	bl	3640 <close>
  if(pid)
     cc0:	e3570000 	cmp	r7, #0
     cc4:	0a00003f 	beq	dc8 <twofiles+0x1a8>
     cc8:	e3077f98 	movw	r7, #32664	; 0x7f98
     ccc:	e3407000 	movt	r7, #0
    wait();
     cd0:	eb000a26 	bl	3570 <wait>
     cd4:	e30492c4 	movw	r9, #17092	; 0x42c4
    fd = open(i?"f1":"f2", 0);
     cd8:	e30402b0 	movw	r0, #17072	; 0x42b0
     cdc:	e3409000 	movt	r9, #0
     ce0:	e3400000 	movt	r0, #0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ce4:	e1a08007 	mov	r8, r7
    fd = open(i?"f1":"f2", 0);
     ce8:	e3a01000 	mov	r1, #0
    total = 0;
     cec:	e3a04000 	mov	r4, #0
    fd = open(i?"f1":"f2", 0);
     cf0:	eb000a79 	bl	36dc <open>
     cf4:	e3550000 	cmp	r5, #0
     cf8:	13a0a070 	movne	sl, #112	; 0x70
     cfc:	03a0a063 	moveq	sl, #99	; 0x63
     d00:	e1a06000 	mov	r6, r0
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d04:	e3a02a02 	mov	r2, #8192	; 0x2000
     d08:	e1a01008 	mov	r1, r8
     d0c:	e1a00006 	mov	r0, r6
     d10:	eb000a30 	bl	35d8 <read>
     d14:	e3500000 	cmp	r0, #0
     d18:	da000009 	ble	d44 <twofiles+0x124>
     d1c:	e2401001 	sub	r1, r0, #1
     d20:	e59f30fc 	ldr	r3, [pc, #252]	; e24 <twofiles+0x204>
     d24:	e0871001 	add	r1, r7, r1
        if(buf[j] != (i?'p':'c')){
     d28:	e5f32001 	ldrb	r2, [r3, #1]!
     d2c:	e15a0002 	cmp	sl, r2
     d30:	1a000020 	bne	db8 <twofiles+0x198>
      for(j = 0; j < n; j++){
     d34:	e1530001 	cmp	r3, r1
     d38:	1afffffa 	bne	d28 <twofiles+0x108>
      total += n;
     d3c:	e0844000 	add	r4, r4, r0
     d40:	eaffffef 	b	d04 <twofiles+0xe4>
    close(fd);
     d44:	e1a00006 	mov	r0, r6
     d48:	eb000a3c 	bl	3640 <close>
    if(total != 12*500){
     d4c:	e3013770 	movw	r3, #6000	; 0x1770
     d50:	e1540003 	cmp	r4, r3
     d54:	1a00002c 	bne	e0c <twofiles+0x1ec>
  for(i = 0; i < 2; i++){
     d58:	e2855001 	add	r5, r5, #1
     d5c:	e1a00009 	mov	r0, r9
     d60:	e3550002 	cmp	r5, #2
     d64:	1affffdf 	bne	ce8 <twofiles+0xc8>
  unlink("f1");
     d68:	e30402c4 	movw	r0, #17092	; 0x42c4
     d6c:	e3400000 	movt	r0, #0
     d70:	eb000a73 	bl	3744 <unlink>
  unlink("f2");
     d74:	e30402b0 	movw	r0, #17072	; 0x42b0
     d78:	e3400000 	movt	r0, #0
     d7c:	eb000a70 	bl	3744 <unlink>
  printf(1, "twofiles ok\n");
     d80:	e304130c 	movw	r1, #17164	; 0x430c
     d84:	e3a00001 	mov	r0, #1
     d88:	e3401000 	movt	r1, #0
}
     d8c:	e24bd024 	sub	sp, fp, #36	; 0x24
     d90:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
  printf(1, "twofiles ok\n");
     d94:	ea000b34 	b	3a6c <printf>
  fd = open(fname, O_CREATE | O_RDWR);
     d98:	e30402b0 	movw	r0, #17072	; 0x42b0
     d9c:	e3001202 	movw	r1, #514	; 0x202
     da0:	e3400000 	movt	r0, #0
     da4:	eb000a4c 	bl	36dc <open>
  if(fd < 0){
     da8:	e2504000 	subs	r4, r0, #0
     dac:	ba000011 	blt	df8 <twofiles+0x1d8>
  memset(buf, pid?'p':'c', 512);
     db0:	e3a01063 	mov	r1, #99	; 0x63
     db4:	eaffffb0 	b	c7c <twofiles+0x5c>
          printf(1, "wrong char\n");
     db8:	e30412ec 	movw	r1, #17132	; 0x42ec
     dbc:	e3a00001 	mov	r0, #1
     dc0:	e3401000 	movt	r1, #0
     dc4:	eb000b28 	bl	3a6c <printf>
          exit();
     dc8:	eb0009db 	bl	353c <exit>
      printf(1, "write failed %d\n", n);
     dcc:	e1a02000 	mov	r2, r0
     dd0:	e30412d8 	movw	r1, #17112	; 0x42d8
     dd4:	e3a00001 	mov	r0, #1
     dd8:	e3401000 	movt	r1, #0
     ddc:	eb000b22 	bl	3a6c <printf>
      exit();
     de0:	eb0009d5 	bl	353c <exit>
    printf(1, "fork failed\n");
     de4:	e30516e4 	movw	r1, #22244	; 0x56e4
     de8:	e3a00001 	mov	r0, #1
     dec:	e3401000 	movt	r1, #0
     df0:	eb000b1d 	bl	3a6c <printf>
    exit();
     df4:	eb0009d0 	bl	353c <exit>
    printf(1, "create failed\n");
     df8:	e30412c8 	movw	r1, #17096	; 0x42c8
     dfc:	e3a00001 	mov	r0, #1
     e00:	e3401000 	movt	r1, #0
     e04:	eb000b18 	bl	3a6c <printf>
    exit();
     e08:	eb0009cb 	bl	353c <exit>
      printf(1, "wrong length %d\n", total);
     e0c:	e1a02004 	mov	r2, r4
     e10:	e30412f8 	movw	r1, #17144	; 0x42f8
     e14:	e3a00001 	mov	r0, #1
     e18:	e3401000 	movt	r1, #0
     e1c:	eb000b12 	bl	3a6c <printf>
      exit();
     e20:	eb0009c5 	bl	353c <exit>
     e24:	00007f97 	.word	0x00007f97

00000e28 <createdelete>:
{
     e28:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  printf(1, "createdelete test\n");
     e2c:	e3a00001 	mov	r0, #1
{
     e30:	e28db018 	add	fp, sp, #24
  printf(1, "createdelete test\n");
     e34:	e304131c 	movw	r1, #17180	; 0x431c
{
     e38:	e24dd024 	sub	sp, sp, #36	; 0x24
  printf(1, "createdelete test\n");
     e3c:	e3401000 	movt	r1, #0
     e40:	eb000b09 	bl	3a6c <printf>
  pid = fork();
     e44:	eb0009af 	bl	3508 <fork>
  if(pid < 0){
     e48:	e2506000 	subs	r6, r0, #0
     e4c:	ba000069 	blt	ff8 <createdelete+0x1d0>
  name[0] = pid ? 'p' : 'c';
     e50:	03a03063 	moveq	r3, #99	; 0x63
     e54:	13a03070 	movne	r3, #112	; 0x70
  name[2] = '\0';
     e58:	e3a04000 	mov	r4, #0
  name[0] = pid ? 'p' : 'c';
     e5c:	e54b303c 	strb	r3, [fp, #-60]	; 0xffffffc4
  name[2] = '\0';
     e60:	e54b403a 	strb	r4, [fp, #-58]	; 0xffffffc6
     e64:	e3a05001 	mov	r5, #1
     e68:	ea000003 	b	e7c <createdelete+0x54>
  for(i = 0; i < N; i++){
     e6c:	e3550014 	cmp	r5, #20
     e70:	0a000019 	beq	edc <createdelete+0xb4>
     e74:	e2844001 	add	r4, r4, #1
     e78:	e2855001 	add	r5, r5, #1
    fd = open(name, O_CREATE | O_RDWR);
     e7c:	e3001202 	movw	r1, #514	; 0x202
     e80:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[1] = '0' + i;
     e84:	e2843030 	add	r3, r4, #48	; 0x30
     e88:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
    fd = open(name, O_CREATE | O_RDWR);
     e8c:	eb000a12 	bl	36dc <open>
    if(fd < 0){
     e90:	e3500000 	cmp	r0, #0
     e94:	ba00004c 	blt	fcc <createdelete+0x1a4>
    close(fd);
     e98:	eb0009e8 	bl	3640 <close>
    if(i > 0 && (i % 2 ) == 0){
     e9c:	e3540000 	cmp	r4, #0
     ea0:	0afffff3 	beq	e74 <createdelete+0x4c>
     ea4:	e3140001 	tst	r4, #1
     ea8:	1affffef 	bne	e6c <createdelete+0x44>
      name[1] = '0' + (i / 2);
     eac:	e1a030c4 	asr	r3, r4, #1
      if(unlink(name) < 0){
     eb0:	e24b003c 	sub	r0, fp, #60	; 0x3c
      name[1] = '0' + (i / 2);
     eb4:	e2833030 	add	r3, r3, #48	; 0x30
     eb8:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
      if(unlink(name) < 0){
     ebc:	eb000a20 	bl	3744 <unlink>
     ec0:	e3500000 	cmp	r0, #0
     ec4:	aaffffe8 	bge	e6c <createdelete+0x44>
        printf(1, "unlink failed\n");
     ec8:	e3041330 	movw	r1, #17200	; 0x4330
     ecc:	e3a00001 	mov	r0, #1
     ed0:	e3401000 	movt	r1, #0
     ed4:	eb000ae4 	bl	3a6c <printf>
        exit();
     ed8:	eb000997 	bl	353c <exit>
  if(pid==0)
     edc:	e3560000 	cmp	r6, #0
     ee0:	0a000043 	beq	ff4 <createdelete+0x1cc>
    wait();
     ee4:	eb0009a1 	bl	3570 <wait>
  for(i = 0; i < N; i++){
     ee8:	e3a04000 	mov	r4, #0
    name[0] = 'p';
     eec:	e3a07070 	mov	r7, #112	; 0x70
    name[0] = 'c';
     ef0:	e3a06063 	mov	r6, #99	; 0x63
     ef4:	e2845030 	add	r5, r4, #48	; 0x30
    fd = open(name, 0);
     ef8:	e3a01000 	mov	r1, #0
     efc:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'p';
     f00:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
     f04:	e6ef5075 	uxtb	r5, r5
    name[1] = '0' + i;
     f08:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     f0c:	eb0009f2 	bl	36dc <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f10:	e3540009 	cmp	r4, #9
     f14:	d3a08000 	movle	r8, #0
     f18:	c3a08001 	movgt	r8, #1
     f1c:	e3540000 	cmp	r4, #0
     f20:	03888001 	orreq	r8, r8, #1
     f24:	e0181fa0 	ands	r1, r8, r0, lsr #31
     f28:	1a00002c 	bne	fe0 <createdelete+0x1b8>
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f2c:	e2442001 	sub	r2, r4, #1
     f30:	e3520008 	cmp	r2, #8
     f34:	9a000034 	bls	100c <createdelete+0x1e4>
    if(fd >= 0)
     f38:	e3500000 	cmp	r0, #0
     f3c:	ba000000 	blt	f44 <createdelete+0x11c>
      close(fd);
     f40:	eb0009be 	bl	3640 <close>
    fd = open(name, 0);
     f44:	e3a01000 	mov	r1, #0
     f48:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
     f4c:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
     f50:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     f54:	eb0009e0 	bl	36dc <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f58:	e0182fa0 	ands	r2, r8, r0, lsr #31
    fd = open(name, 0);
     f5c:	e1a03000 	mov	r3, r0
    if((i == 0 || i >= N/2) && fd < 0){
     f60:	1a00001e 	bne	fe0 <createdelete+0x1b8>
    if(fd >= 0)
     f64:	e3530000 	cmp	r3, #0
     f68:	ba000000 	blt	f70 <createdelete+0x148>
      close(fd);
     f6c:	eb0009b3 	bl	3640 <close>
  for(i = 0; i < N; i++){
     f70:	e2844001 	add	r4, r4, #1
     f74:	e3540014 	cmp	r4, #20
     f78:	1affffdd 	bne	ef4 <createdelete+0xcc>
     f7c:	e3a04030 	mov	r4, #48	; 0x30
    name[0] = 'p';
     f80:	e3a06070 	mov	r6, #112	; 0x70
    name[0] = 'c';
     f84:	e3a05063 	mov	r5, #99	; 0x63
    name[1] = '0' + i;
     f88:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
     f8c:	e2844001 	add	r4, r4, #1
    unlink(name);
     f90:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'p';
     f94:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
     f98:	e6ef4074 	uxtb	r4, r4
    unlink(name);
     f9c:	eb0009e8 	bl	3744 <unlink>
    unlink(name);
     fa0:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
     fa4:	e54b503c 	strb	r5, [fp, #-60]	; 0xffffffc4
    unlink(name);
     fa8:	eb0009e5 	bl	3744 <unlink>
  for(i = 0; i < N; i++){
     fac:	e3540044 	cmp	r4, #68	; 0x44
     fb0:	1afffff4 	bne	f88 <createdelete+0x160>
  printf(1, "createdelete ok\n");
     fb4:	e3a00001 	mov	r0, #1
     fb8:	e3041384 	movw	r1, #17284	; 0x4384
     fbc:	e3401000 	movt	r1, #0
     fc0:	eb000aa9 	bl	3a6c <printf>
}
     fc4:	e24bd018 	sub	sp, fp, #24
     fc8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "create failed\n");
     fcc:	e30412c8 	movw	r1, #17096	; 0x42c8
     fd0:	e3a00001 	mov	r0, #1
     fd4:	e3401000 	movt	r1, #0
     fd8:	eb000aa3 	bl	3a6c <printf>
      exit();
     fdc:	eb000956 	bl	353c <exit>
      printf(1, "oops createdelete %s didn't exist\n", name);
     fe0:	e3041340 	movw	r1, #17216	; 0x4340
     fe4:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fe8:	e3a00001 	mov	r0, #1
     fec:	e3401000 	movt	r1, #0
     ff0:	eb000a9d 	bl	3a6c <printf>
      exit();
     ff4:	eb000950 	bl	353c <exit>
    printf(1, "fork failed\n");
     ff8:	e30516e4 	movw	r1, #22244	; 0x56e4
     ffc:	e3a00001 	mov	r0, #1
    1000:	e3401000 	movt	r1, #0
    1004:	eb000a98 	bl	3a6c <printf>
    exit();
    1008:	eb00094b 	bl	353c <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    100c:	e3500000 	cmp	r0, #0
    1010:	aa000007 	bge	1034 <createdelete+0x20c>
    fd = open(name, 0);
    1014:	e24b003c 	sub	r0, fp, #60	; 0x3c
    name[0] = 'c';
    1018:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
    101c:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
    1020:	eb0009ad 	bl	36dc <open>
    if((i == 0 || i >= N/2) && fd < 0){
    1024:	e0183fa0 	ands	r3, r8, r0, lsr #31
    1028:	1affffec 	bne	fe0 <createdelete+0x1b8>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    102c:	e3500000 	cmp	r0, #0
    1030:	baffffce 	blt	f70 <createdelete+0x148>
      printf(1, "oops createdelete %s did exist\n", name);
    1034:	e24b203c 	sub	r2, fp, #60	; 0x3c
    1038:	e3041364 	movw	r1, #17252	; 0x4364
    103c:	e3a00001 	mov	r0, #1
    1040:	e3401000 	movt	r1, #0
    1044:	eb000a88 	bl	3a6c <printf>
      exit();
    1048:	eb00093b 	bl	353c <exit>

0000104c <unlinkread>:
{
    104c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread test\n");
    1050:	e3a00001 	mov	r0, #1
{
    1054:	e28db014 	add	fp, sp, #20
  printf(1, "unlinkread test\n");
    1058:	e3041398 	movw	r1, #17304	; 0x4398
    105c:	e3401000 	movt	r1, #0
    1060:	eb000a81 	bl	3a6c <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1064:	e30403ac 	movw	r0, #17324	; 0x43ac
    1068:	e3001202 	movw	r1, #514	; 0x202
    106c:	e3400000 	movt	r0, #0
    1070:	eb000999 	bl	36dc <open>
  if(fd < 0){
    1074:	e2504000 	subs	r4, r0, #0
    1078:	ba000037 	blt	115c <unlinkread+0x110>
  write(fd, "hello", 5);
    107c:	e3a02005 	mov	r2, #5
    1080:	e30413d4 	movw	r1, #17364	; 0x43d4
    1084:	e3401000 	movt	r1, #0
    1088:	eb00095f 	bl	360c <write>
  close(fd);
    108c:	e1a00004 	mov	r0, r4
    1090:	eb00096a 	bl	3640 <close>
  fd = open("unlinkread", O_RDWR);
    1094:	e30403ac 	movw	r0, #17324	; 0x43ac
    1098:	e3a01002 	mov	r1, #2
    109c:	e3400000 	movt	r0, #0
    10a0:	eb00098d 	bl	36dc <open>
  if(fd < 0){
    10a4:	e2505000 	subs	r5, r0, #0
    10a8:	ba000044 	blt	11c0 <unlinkread+0x174>
  if(unlink("unlinkread") != 0){
    10ac:	e30403ac 	movw	r0, #17324	; 0x43ac
    10b0:	e3400000 	movt	r0, #0
    10b4:	eb0009a2 	bl	3744 <unlink>
    10b8:	e3500000 	cmp	r0, #0
    10bc:	1a00003a 	bne	11ac <unlinkread+0x160>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10c0:	e3001202 	movw	r1, #514	; 0x202
    10c4:	e30403ac 	movw	r0, #17324	; 0x43ac
    10c8:	e3400000 	movt	r0, #0
  if(read(fd, buf, sizeof(buf)) != 5){
    10cc:	e3074f98 	movw	r4, #32664	; 0x7f98
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10d0:	eb000981 	bl	36dc <open>
  if(read(fd, buf, sizeof(buf)) != 5){
    10d4:	e3404000 	movt	r4, #0
  write(fd1, "yyy", 3);
    10d8:	e3a02003 	mov	r2, #3
    10dc:	e3041410 	movw	r1, #17424	; 0x4410
    10e0:	e3401000 	movt	r1, #0
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10e4:	e1a06000 	mov	r6, r0
  write(fd1, "yyy", 3);
    10e8:	eb000947 	bl	360c <write>
  close(fd1);
    10ec:	e1a00006 	mov	r0, r6
    10f0:	eb000952 	bl	3640 <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    10f4:	e1a01004 	mov	r1, r4
    10f8:	e3a02a02 	mov	r2, #8192	; 0x2000
    10fc:	e1a00005 	mov	r0, r5
    1100:	eb000934 	bl	35d8 <read>
    1104:	e3500005 	cmp	r0, #5
    1108:	1a000022 	bne	1198 <unlinkread+0x14c>
  if(buf[0] != 'h'){
    110c:	e5d43000 	ldrb	r3, [r4]
    1110:	e3530068 	cmp	r3, #104	; 0x68
    1114:	1a00001a 	bne	1184 <unlinkread+0x138>
  if(write(fd, buf, 10) != 10){
    1118:	e1a01004 	mov	r1, r4
    111c:	e3a0200a 	mov	r2, #10
    1120:	e1a00005 	mov	r0, r5
    1124:	eb000938 	bl	360c <write>
    1128:	e350000a 	cmp	r0, #10
    112c:	1a00000f 	bne	1170 <unlinkread+0x124>
  close(fd);
    1130:	e1a00005 	mov	r0, r5
    1134:	eb000941 	bl	3640 <close>
  unlink("unlinkread");
    1138:	e30403ac 	movw	r0, #17324	; 0x43ac
    113c:	e3400000 	movt	r0, #0
    1140:	eb00097f 	bl	3744 <unlink>
  printf(1, "unlinkread ok\n");
    1144:	e3041460 	movw	r1, #17504	; 0x4460
    1148:	e3a00001 	mov	r0, #1
    114c:	e3401000 	movt	r1, #0
}
    1150:	e24bd014 	sub	sp, fp, #20
    1154:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "unlinkread ok\n");
    1158:	ea000a43 	b	3a6c <printf>
    printf(1, "create unlinkread failed\n");
    115c:	e30413b8 	movw	r1, #17336	; 0x43b8
    1160:	e3a00001 	mov	r0, #1
    1164:	e3401000 	movt	r1, #0
    1168:	eb000a3f 	bl	3a6c <printf>
    exit();
    116c:	eb0008f2 	bl	353c <exit>
    printf(1, "unlinkread write failed\n");
    1170:	e3041444 	movw	r1, #17476	; 0x4444
    1174:	e3a00001 	mov	r0, #1
    1178:	e3401000 	movt	r1, #0
    117c:	eb000a3a 	bl	3a6c <printf>
    exit();
    1180:	eb0008ed 	bl	353c <exit>
    printf(1, "unlinkread wrong data\n");
    1184:	e304142c 	movw	r1, #17452	; 0x442c
    1188:	e3a00001 	mov	r0, #1
    118c:	e3401000 	movt	r1, #0
    1190:	eb000a35 	bl	3a6c <printf>
    exit();
    1194:	eb0008e8 	bl	353c <exit>
    printf(1, "unlinkread read failed");
    1198:	e3041414 	movw	r1, #17428	; 0x4414
    119c:	e3a00001 	mov	r0, #1
    11a0:	e3401000 	movt	r1, #0
    11a4:	eb000a30 	bl	3a6c <printf>
    exit();
    11a8:	eb0008e3 	bl	353c <exit>
    printf(1, "unlink unlinkread failed\n");
    11ac:	e30413f4 	movw	r1, #17396	; 0x43f4
    11b0:	e3a00001 	mov	r0, #1
    11b4:	e3401000 	movt	r1, #0
    11b8:	eb000a2b 	bl	3a6c <printf>
    exit();
    11bc:	eb0008de 	bl	353c <exit>
    printf(1, "open unlinkread failed\n");
    11c0:	e30413dc 	movw	r1, #17372	; 0x43dc
    11c4:	e3a00001 	mov	r0, #1
    11c8:	e3401000 	movt	r1, #0
    11cc:	eb000a26 	bl	3a6c <printf>
    exit();
    11d0:	eb0008d9 	bl	353c <exit>

000011d4 <linktest>:
{
    11d4:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "linktest\n");
    11d8:	e3a00001 	mov	r0, #1
{
    11dc:	e28db00c 	add	fp, sp, #12
  printf(1, "linktest\n");
    11e0:	e3041470 	movw	r1, #17520	; 0x4470
    11e4:	e3401000 	movt	r1, #0
    11e8:	eb000a1f 	bl	3a6c <printf>
  unlink("lf1");
    11ec:	e304047c 	movw	r0, #17532	; 0x447c
    11f0:	e3400000 	movt	r0, #0
    11f4:	eb000952 	bl	3744 <unlink>
  unlink("lf2");
    11f8:	e3040480 	movw	r0, #17536	; 0x4480
    11fc:	e3400000 	movt	r0, #0
    1200:	eb00094f 	bl	3744 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1204:	e304047c 	movw	r0, #17532	; 0x447c
    1208:	e3001202 	movw	r1, #514	; 0x202
    120c:	e3400000 	movt	r0, #0
    1210:	eb000931 	bl	36dc <open>
  if(fd < 0){
    1214:	e2504000 	subs	r4, r0, #0
    1218:	ba000042 	blt	1328 <linktest+0x154>
  if(write(fd, "hello", 5) != 5){
    121c:	e30413d4 	movw	r1, #17364	; 0x43d4
    1220:	e3a02005 	mov	r2, #5
    1224:	e3401000 	movt	r1, #0
    1228:	eb0008f7 	bl	360c <write>
    122c:	e3500005 	cmp	r0, #5
    1230:	1a000064 	bne	13c8 <linktest+0x1f4>
  close(fd);
    1234:	e1a00004 	mov	r0, r4
    1238:	eb000900 	bl	3640 <close>
  if(link("lf1", "lf2") < 0){
    123c:	e3041480 	movw	r1, #17536	; 0x4480
    1240:	e304047c 	movw	r0, #17532	; 0x447c
    1244:	e3401000 	movt	r1, #0
    1248:	e3400000 	movt	r0, #0
    124c:	eb000956 	bl	37ac <link>
    1250:	e3500000 	cmp	r0, #0
    1254:	ba000056 	blt	13b4 <linktest+0x1e0>
  unlink("lf1");
    1258:	e304047c 	movw	r0, #17532	; 0x447c
    125c:	e3400000 	movt	r0, #0
    1260:	eb000937 	bl	3744 <unlink>
  if(open("lf1", 0) >= 0){
    1264:	e304047c 	movw	r0, #17532	; 0x447c
    1268:	e3a01000 	mov	r1, #0
    126c:	e3400000 	movt	r0, #0
    1270:	eb000919 	bl	36dc <open>
    1274:	e3500000 	cmp	r0, #0
    1278:	aa000048 	bge	13a0 <linktest+0x1cc>
  fd = open("lf2", 0);
    127c:	e3040480 	movw	r0, #17536	; 0x4480
    1280:	e3a01000 	mov	r1, #0
    1284:	e3400000 	movt	r0, #0
    1288:	eb000913 	bl	36dc <open>
  if(fd < 0){
    128c:	e2504000 	subs	r4, r0, #0
    1290:	ba00003d 	blt	138c <linktest+0x1b8>
  if(read(fd, buf, sizeof(buf)) != 5){
    1294:	e3071f98 	movw	r1, #32664	; 0x7f98
    1298:	e3a02a02 	mov	r2, #8192	; 0x2000
    129c:	e3401000 	movt	r1, #0
    12a0:	eb0008cc 	bl	35d8 <read>
    12a4:	e3500005 	cmp	r0, #5
    12a8:	1a000032 	bne	1378 <linktest+0x1a4>
  close(fd);
    12ac:	e1a00004 	mov	r0, r4
    12b0:	eb0008e2 	bl	3640 <close>
  if(link("lf2", "lf2") >= 0){
    12b4:	e3041480 	movw	r1, #17536	; 0x4480
    12b8:	e3401000 	movt	r1, #0
    12bc:	e1a00001 	mov	r0, r1
    12c0:	eb000939 	bl	37ac <link>
    12c4:	e3500000 	cmp	r0, #0
    12c8:	aa000025 	bge	1364 <linktest+0x190>
  unlink("lf2");
    12cc:	e3040480 	movw	r0, #17536	; 0x4480
    12d0:	e3400000 	movt	r0, #0
    12d4:	eb00091a 	bl	3744 <unlink>
  if(link("lf2", "lf1") >= 0){
    12d8:	e304147c 	movw	r1, #17532	; 0x447c
    12dc:	e3040480 	movw	r0, #17536	; 0x4480
    12e0:	e3401000 	movt	r1, #0
    12e4:	e3400000 	movt	r0, #0
    12e8:	eb00092f 	bl	37ac <link>
    12ec:	e3500000 	cmp	r0, #0
    12f0:	aa000016 	bge	1350 <linktest+0x17c>
  if(link(".", "lf1") >= 0){
    12f4:	e304147c 	movw	r1, #17532	; 0x447c
    12f8:	e3040558 	movw	r0, #17752	; 0x4558
    12fc:	e3401000 	movt	r1, #0
    1300:	e3400000 	movt	r0, #0
    1304:	eb000928 	bl	37ac <link>
    1308:	e3500000 	cmp	r0, #0
    130c:	aa00000a 	bge	133c <linktest+0x168>
  printf(1, "linktest ok\n");
    1310:	e3041578 	movw	r1, #17784	; 0x4578
    1314:	e3a00001 	mov	r0, #1
    1318:	e3401000 	movt	r1, #0
}
    131c:	e24bd00c 	sub	sp, fp, #12
    1320:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "linktest ok\n");
    1324:	ea0009d0 	b	3a6c <printf>
    printf(1, "create lf1 failed\n");
    1328:	e3041484 	movw	r1, #17540	; 0x4484
    132c:	e3a00001 	mov	r0, #1
    1330:	e3401000 	movt	r1, #0
    1334:	eb0009cc 	bl	3a6c <printf>
    exit();
    1338:	eb00087f 	bl	353c <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    133c:	e304155c 	movw	r1, #17756	; 0x455c
    1340:	e3a00001 	mov	r0, #1
    1344:	e3401000 	movt	r1, #0
    1348:	eb0009c7 	bl	3a6c <printf>
    exit();
    134c:	eb00087a 	bl	353c <exit>
    printf(1, "link non-existant succeeded! oops\n");
    1350:	e3041534 	movw	r1, #17716	; 0x4534
    1354:	e3a00001 	mov	r0, #1
    1358:	e3401000 	movt	r1, #0
    135c:	eb0009c2 	bl	3a6c <printf>
    exit();
    1360:	eb000875 	bl	353c <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1364:	e3041514 	movw	r1, #17684	; 0x4514
    1368:	e3a00001 	mov	r0, #1
    136c:	e3401000 	movt	r1, #0
    1370:	eb0009bd 	bl	3a6c <printf>
    exit();
    1374:	eb000870 	bl	353c <exit>
    printf(1, "read lf2 failed\n");
    1378:	e3041500 	movw	r1, #17664	; 0x4500
    137c:	e3a00001 	mov	r0, #1
    1380:	e3401000 	movt	r1, #0
    1384:	eb0009b8 	bl	3a6c <printf>
    exit();
    1388:	eb00086b 	bl	353c <exit>
    printf(1, "open lf2 failed\n");
    138c:	e30414ec 	movw	r1, #17644	; 0x44ec
    1390:	e3a00001 	mov	r0, #1
    1394:	e3401000 	movt	r1, #0
    1398:	eb0009b3 	bl	3a6c <printf>
    exit();
    139c:	eb000866 	bl	353c <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    13a0:	e30414c4 	movw	r1, #17604	; 0x44c4
    13a4:	e3a00001 	mov	r0, #1
    13a8:	e3401000 	movt	r1, #0
    13ac:	eb0009ae 	bl	3a6c <printf>
    exit();
    13b0:	eb000861 	bl	353c <exit>
    printf(1, "link lf1 lf2 failed\n");
    13b4:	e30414ac 	movw	r1, #17580	; 0x44ac
    13b8:	e3a00001 	mov	r0, #1
    13bc:	e3401000 	movt	r1, #0
    13c0:	eb0009a9 	bl	3a6c <printf>
    exit();
    13c4:	eb00085c 	bl	353c <exit>
    printf(1, "write lf1 failed\n");
    13c8:	e3041498 	movw	r1, #17560	; 0x4498
    13cc:	e3a00001 	mov	r0, #1
    13d0:	e3401000 	movt	r1, #0
    13d4:	eb0009a4 	bl	3a6c <printf>
    exit();
    13d8:	eb000857 	bl	353c <exit>

000013dc <concreate>:
{
    13dc:	e92d4870 	push	{r4, r5, r6, fp, lr}
  printf(1, "concreate test\n");
    13e0:	e3041588 	movw	r1, #17800	; 0x4588
{
    13e4:	e28db010 	add	fp, sp, #16
  printf(1, "concreate test\n");
    13e8:	e3a00001 	mov	r0, #1
{
    13ec:	e24dd044 	sub	sp, sp, #68	; 0x44
  printf(1, "concreate test\n");
    13f0:	e3401000 	movt	r1, #0
    if(pid && (i % 3) == 1){
    13f4:	e3055556 	movw	r5, #21846	; 0x5556
  printf(1, "concreate test\n");
    13f8:	eb00099b 	bl	3a6c <printf>
  file[2] = '\0';
    13fc:	e3a03000 	mov	r3, #0
      link("C0", file);
    1400:	e3046598 	movw	r6, #17816	; 0x4598
  for(i = 0; i < 40; i++){
    1404:	e1a04003 	mov	r4, r3
  file[2] = '\0';
    1408:	e54b304e 	strb	r3, [fp, #-78]	; 0xffffffb2
    if(pid && (i % 3) == 1){
    140c:	e3455555 	movt	r5, #21845	; 0x5555
  file[0] = 'C';
    1410:	e3a03043 	mov	r3, #67	; 0x43
      link("C0", file);
    1414:	e3406000 	movt	r6, #0
  file[0] = 'C';
    1418:	e54b3050 	strb	r3, [fp, #-80]	; 0xffffffb0
    141c:	ea00000f 	b	1460 <concreate+0x84>
    if(pid && (i % 3) == 1){
    1420:	e0c32594 	smull	r2, r3, r4, r5
    1424:	e0433fc4 	sub	r3, r3, r4, asr #31
    1428:	e0833083 	add	r3, r3, r3, lsl #1
    142c:	e0443003 	sub	r3, r4, r3
    1430:	e3530001 	cmp	r3, #1
    1434:	0a000029 	beq	14e0 <concreate+0x104>
      fd = open(file, O_CREATE | O_RDWR);
    1438:	e3001202 	movw	r1, #514	; 0x202
    143c:	e24b0050 	sub	r0, fp, #80	; 0x50
    1440:	eb0008a5 	bl	36dc <open>
      if(fd < 0){
    1444:	e3500000 	cmp	r0, #0
    1448:	ba000019 	blt	14b4 <concreate+0xd8>
  for(i = 0; i < 40; i++){
    144c:	e2844001 	add	r4, r4, #1
      close(fd);
    1450:	eb00087a 	bl	3640 <close>
      wait();
    1454:	eb000845 	bl	3570 <wait>
  for(i = 0; i < 40; i++){
    1458:	e3540028 	cmp	r4, #40	; 0x28
    145c:	0a000026 	beq	14fc <concreate+0x120>
    unlink(file);
    1460:	e24b0050 	sub	r0, fp, #80	; 0x50
    file[1] = '0' + i;
    1464:	e2843030 	add	r3, r4, #48	; 0x30
    1468:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    unlink(file);
    146c:	eb0008b4 	bl	3744 <unlink>
    pid = fork();
    1470:	eb000824 	bl	3508 <fork>
    if(pid && (i % 3) == 1){
    1474:	e3500000 	cmp	r0, #0
    1478:	1affffe8 	bne	1420 <concreate+0x44>
    } else if(pid == 0 && (i % 5) == 1){
    147c:	e3060667 	movw	r0, #26215	; 0x6667
    1480:	e3460666 	movt	r0, #26214	; 0x6666
    1484:	e1a02fc4 	asr	r2, r4, #31
    1488:	e0c10094 	smull	r0, r1, r4, r0
    148c:	e06220c1 	rsb	r2, r2, r1, asr #1
    1490:	e0822102 	add	r2, r2, r2, lsl #2
    1494:	e0444002 	sub	r4, r4, r2
    1498:	e3540001 	cmp	r4, #1
    149c:	0a00000a 	beq	14cc <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    14a0:	e3001202 	movw	r1, #514	; 0x202
    14a4:	e24b0050 	sub	r0, fp, #80	; 0x50
    14a8:	eb00088b 	bl	36dc <open>
      if(fd < 0){
    14ac:	e3500000 	cmp	r0, #0
    14b0:	aa00008b 	bge	16e4 <concreate+0x308>
        printf(1, "concreate create %s failed\n", file);
    14b4:	e24b2050 	sub	r2, fp, #80	; 0x50
    14b8:	e304159c 	movw	r1, #17820	; 0x459c
    14bc:	e3a00001 	mov	r0, #1
    14c0:	e3401000 	movt	r1, #0
    14c4:	eb000968 	bl	3a6c <printf>
        exit();
    14c8:	eb00081b 	bl	353c <exit>
      link("C0", file);
    14cc:	e3040598 	movw	r0, #17816	; 0x4598
    14d0:	e24b1050 	sub	r1, fp, #80	; 0x50
    14d4:	e3400000 	movt	r0, #0
    14d8:	eb0008b3 	bl	37ac <link>
        exit();
    14dc:	eb000816 	bl	353c <exit>
      link("C0", file);
    14e0:	e24b1050 	sub	r1, fp, #80	; 0x50
    14e4:	e1a00006 	mov	r0, r6
  for(i = 0; i < 40; i++){
    14e8:	e2844001 	add	r4, r4, #1
      link("C0", file);
    14ec:	eb0008ae 	bl	37ac <link>
      wait();
    14f0:	eb00081e 	bl	3570 <wait>
  for(i = 0; i < 40; i++){
    14f4:	e3540028 	cmp	r4, #40	; 0x28
    14f8:	1affffd8 	bne	1460 <concreate+0x84>
  memset(fa, 0, sizeof(fa));
    14fc:	e3a01000 	mov	r1, #0
    1500:	e1a02004 	mov	r2, r4
  n = 0;
    1504:	e1a05001 	mov	r5, r1
  memset(fa, 0, sizeof(fa));
    1508:	e24b003c 	sub	r0, fp, #60	; 0x3c
    150c:	eb000793 	bl	3360 <memset>
  fd = open(".", 0);
    1510:	e3040558 	movw	r0, #17752	; 0x4558
    1514:	e1a01005 	mov	r1, r5
    1518:	e3400000 	movt	r0, #0
    151c:	eb00086e 	bl	36dc <open>
      fa[i] = 1;
    1520:	e3a06001 	mov	r6, #1
  fd = open(".", 0);
    1524:	e1a04000 	mov	r4, r0
  while(read(fd, &de, sizeof(de)) > 0){
    1528:	e3a02010 	mov	r2, #16
    152c:	e24b104c 	sub	r1, fp, #76	; 0x4c
    1530:	e1a00004 	mov	r0, r4
    1534:	eb000827 	bl	35d8 <read>
    1538:	e3500000 	cmp	r0, #0
    153c:	da000014 	ble	1594 <concreate+0x1b8>
    if(de.inum == 0)
    1540:	e15b34bc 	ldrh	r3, [fp, #-76]	; 0xffffffb4
    1544:	e3530000 	cmp	r3, #0
    1548:	0afffff6 	beq	1528 <concreate+0x14c>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    154c:	e55b304a 	ldrb	r3, [fp, #-74]	; 0xffffffb6
    1550:	e3530043 	cmp	r3, #67	; 0x43
    1554:	1afffff3 	bne	1528 <concreate+0x14c>
    1558:	e55b3048 	ldrb	r3, [fp, #-72]	; 0xffffffb8
    155c:	e3530000 	cmp	r3, #0
    1560:	1afffff0 	bne	1528 <concreate+0x14c>
      i = de.name[1] - '0';
    1564:	e55b3049 	ldrb	r3, [fp, #-73]	; 0xffffffb7
    1568:	e2433030 	sub	r3, r3, #48	; 0x30
      if(i < 0 || i >= sizeof(fa)){
    156c:	e3530027 	cmp	r3, #39	; 0x27
    1570:	8a000055 	bhi	16cc <concreate+0x2f0>
      if(fa[i]){
    1574:	e24b2014 	sub	r2, fp, #20
    1578:	e0823003 	add	r3, r2, r3
    157c:	e5532028 	ldrb	r2, [r3, #-40]	; 0xffffffd8
    1580:	e3520000 	cmp	r2, #0
    1584:	1a00004a 	bne	16b4 <concreate+0x2d8>
      n++;
    1588:	e2855001 	add	r5, r5, #1
      fa[i] = 1;
    158c:	e5436028 	strb	r6, [r3, #-40]	; 0xffffffd8
    1590:	eaffffe4 	b	1528 <concreate+0x14c>
  close(fd);
    1594:	e1a00004 	mov	r0, r4
    1598:	eb000828 	bl	3640 <close>
  if(n != 40){
    159c:	e3550028 	cmp	r5, #40	; 0x28
    if(((i % 3) == 0 && pid == 0) ||
    15a0:	03056556 	movweq	r6, #21846	; 0x5556
    15a4:	03a04000 	moveq	r4, #0
    15a8:	03456555 	movteq	r6, #21845	; 0x5555
  if(n != 40){
    15ac:	0a000016 	beq	160c <concreate+0x230>
    15b0:	ea00003a 	b	16a0 <concreate+0x2c4>
      close(open(file, 0));
    15b4:	e3a01000 	mov	r1, #0
    15b8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15bc:	eb000846 	bl	36dc <open>
    15c0:	eb00081e 	bl	3640 <close>
      close(open(file, 0));
    15c4:	e3a01000 	mov	r1, #0
    15c8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15cc:	eb000842 	bl	36dc <open>
    15d0:	eb00081a 	bl	3640 <close>
      close(open(file, 0));
    15d4:	e3a01000 	mov	r1, #0
    15d8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15dc:	eb00083e 	bl	36dc <open>
    15e0:	eb000816 	bl	3640 <close>
      close(open(file, 0));
    15e4:	e3a01000 	mov	r1, #0
    15e8:	e24b0050 	sub	r0, fp, #80	; 0x50
    15ec:	eb00083a 	bl	36dc <open>
    15f0:	eb000812 	bl	3640 <close>
    if(pid == 0)
    15f4:	e3550000 	cmp	r5, #0
    15f8:	0affffb7 	beq	14dc <concreate+0x100>
  for(i = 0; i < 40; i++){
    15fc:	e2844001 	add	r4, r4, #1
      wait();
    1600:	eb0007da 	bl	3570 <wait>
  for(i = 0; i < 40; i++){
    1604:	e3540028 	cmp	r4, #40	; 0x28
    1608:	0a000019 	beq	1674 <concreate+0x298>
    file[1] = '0' + i;
    160c:	e2843030 	add	r3, r4, #48	; 0x30
    1610:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    pid = fork();
    1614:	eb0007bb 	bl	3508 <fork>
    if(pid < 0){
    1618:	e2505000 	subs	r5, r0, #0
    161c:	ba00001a 	blt	168c <concreate+0x2b0>
    if(((i % 3) == 0 && pid == 0) ||
    1620:	e0c32694 	smull	r2, r3, r4, r6
    1624:	e0433fc4 	sub	r3, r3, r4, asr #31
    1628:	e0833083 	add	r3, r3, r3, lsl #1
    162c:	e0443003 	sub	r3, r4, r3
    1630:	e1952003 	orrs	r2, r5, r3
    1634:	0affffde 	beq	15b4 <concreate+0x1d8>
       ((i % 3) == 1 && pid != 0)){
    1638:	e2952000 	adds	r2, r5, #0
    163c:	13a02001 	movne	r2, #1
    1640:	e3530001 	cmp	r3, #1
    1644:	13a02000 	movne	r2, #0
    1648:	e3520000 	cmp	r2, #0
    164c:	1affffd8 	bne	15b4 <concreate+0x1d8>
      unlink(file);
    1650:	e24b0050 	sub	r0, fp, #80	; 0x50
    1654:	eb00083a 	bl	3744 <unlink>
      unlink(file);
    1658:	e24b0050 	sub	r0, fp, #80	; 0x50
    165c:	eb000838 	bl	3744 <unlink>
      unlink(file);
    1660:	e24b0050 	sub	r0, fp, #80	; 0x50
    1664:	eb000836 	bl	3744 <unlink>
      unlink(file);
    1668:	e24b0050 	sub	r0, fp, #80	; 0x50
    166c:	eb000834 	bl	3744 <unlink>
    1670:	eaffffdf 	b	15f4 <concreate+0x218>
  printf(1, "concreate ok\n");
    1674:	e3a00001 	mov	r0, #1
    1678:	e3041628 	movw	r1, #17960	; 0x4628
    167c:	e3401000 	movt	r1, #0
    1680:	eb0008f9 	bl	3a6c <printf>
}
    1684:	e24bd010 	sub	sp, fp, #16
    1688:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
      printf(1, "fork failed\n");
    168c:	e30516e4 	movw	r1, #22244	; 0x56e4
    1690:	e3a00001 	mov	r0, #1
    1694:	e3401000 	movt	r1, #0
    1698:	eb0008f3 	bl	3a6c <printf>
      exit();
    169c:	eb0007a6 	bl	353c <exit>
    printf(1, "concreate not enough files in directory listing\n");
    16a0:	e30415f4 	movw	r1, #17908	; 0x45f4
    16a4:	e3a00001 	mov	r0, #1
    16a8:	e3401000 	movt	r1, #0
    16ac:	eb0008ee 	bl	3a6c <printf>
    exit();
    16b0:	eb0007a1 	bl	353c <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    16b4:	e30415d4 	movw	r1, #17876	; 0x45d4
    16b8:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16bc:	e3401000 	movt	r1, #0
    16c0:	e3a00001 	mov	r0, #1
    16c4:	eb0008e8 	bl	3a6c <printf>
        exit();
    16c8:	eb00079b 	bl	353c <exit>
        printf(1, "concreate weird file %s\n", de.name);
    16cc:	e30415b8 	movw	r1, #17848	; 0x45b8
    16d0:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16d4:	e3401000 	movt	r1, #0
    16d8:	e3a00001 	mov	r0, #1
    16dc:	eb0008e2 	bl	3a6c <printf>
    16e0:	eaffff7d 	b	14dc <concreate+0x100>
      close(fd);
    16e4:	eb0007d5 	bl	3640 <close>
    16e8:	eaffff7b 	b	14dc <concreate+0x100>

000016ec <linkunlink>:
{
    16ec:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink test\n");
    16f0:	e3a00001 	mov	r0, #1
{
    16f4:	e28db01c 	add	fp, sp, #28
  printf(1, "linkunlink test\n");
    16f8:	e3041638 	movw	r1, #17976	; 0x4638
    16fc:	e3401000 	movt	r1, #0
    1700:	eb0008d9 	bl	3a6c <printf>
  unlink("x");
    1704:	e3040ab8 	movw	r0, #19128	; 0x4ab8
    1708:	e3400000 	movt	r0, #0
    170c:	eb00080c 	bl	3744 <unlink>
  pid = fork();
    1710:	eb00077c 	bl	3508 <fork>
  if(pid < 0){
    1714:	e2508000 	subs	r8, r0, #0
    1718:	ba00002a 	blt	17c8 <linkunlink+0xdc>
    x = x * 1103515245 + 12345;
    171c:	e3047e6d 	movw	r7, #20077	; 0x4e6d
    if((x % 3) == 0){
    1720:	e30a6aab 	movw	r6, #43691	; 0xaaab
      unlink("x");
    1724:	e3045ab8 	movw	r5, #19128	; 0x4ab8
  unsigned int x = (pid ? 1 : 97);
    1728:	13a04001 	movne	r4, #1
    172c:	03a04061 	moveq	r4, #97	; 0x61
    x = x * 1103515245 + 12345;
    1730:	e34471c6 	movt	r7, #16838	; 0x41c6
    if((x % 3) == 0){
    1734:	e34a6aaa 	movt	r6, #43690	; 0xaaaa
      unlink("x");
    1738:	e3405000 	movt	r5, #0
  unsigned int x = (pid ? 1 : 97);
    173c:	e3a09064 	mov	r9, #100	; 0x64
    1740:	ea000005 	b	175c <linkunlink+0x70>
    } else if((x % 3) == 1){
    1744:	e3530001 	cmp	r3, #1
    1748:	0a000019 	beq	17b4 <linkunlink+0xc8>
      unlink("x");
    174c:	e1a00005 	mov	r0, r5
    1750:	eb0007fb 	bl	3744 <unlink>
  for(i = 0; i < 100; i++){
    1754:	e2599001 	subs	r9, r9, #1
    1758:	0a00000c 	beq	1790 <linkunlink+0xa4>
    x = x * 1103515245 + 12345;
    175c:	e3033039 	movw	r3, #12345	; 0x3039
    1760:	e0243497 	mla	r4, r7, r4, r3
    if((x % 3) == 0){
    1764:	e0832694 	umull	r2, r3, r4, r6
    1768:	e1a030a3 	lsr	r3, r3, #1
    176c:	e0833083 	add	r3, r3, r3, lsl #1
    1770:	e0543003 	subs	r3, r4, r3
    1774:	1afffff2 	bne	1744 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    1778:	e3001202 	movw	r1, #514	; 0x202
    177c:	e1a00005 	mov	r0, r5
    1780:	eb0007d5 	bl	36dc <open>
    1784:	eb0007ad 	bl	3640 <close>
  for(i = 0; i < 100; i++){
    1788:	e2599001 	subs	r9, r9, #1
    178c:	1afffff2 	bne	175c <linkunlink+0x70>
  if(pid)
    1790:	e3580000 	cmp	r8, #0
    1794:	0a000010 	beq	17dc <linkunlink+0xf0>
    wait();
    1798:	eb000774 	bl	3570 <wait>
  printf(1, "linkunlink ok\n");
    179c:	e3041650 	movw	r1, #18000	; 0x4650
    17a0:	e3a00001 	mov	r0, #1
    17a4:	e3401000 	movt	r1, #0
}
    17a8:	e24bd01c 	sub	sp, fp, #28
    17ac:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "linkunlink ok\n");
    17b0:	ea0008ad 	b	3a6c <printf>
      link("cat", "x");
    17b4:	e304064c 	movw	r0, #17996	; 0x464c
    17b8:	e1a01005 	mov	r1, r5
    17bc:	e3400000 	movt	r0, #0
    17c0:	eb0007f9 	bl	37ac <link>
    17c4:	eaffffe2 	b	1754 <linkunlink+0x68>
    printf(1, "fork failed\n");
    17c8:	e30516e4 	movw	r1, #22244	; 0x56e4
    17cc:	e3a00001 	mov	r0, #1
    17d0:	e3401000 	movt	r1, #0
    17d4:	eb0008a4 	bl	3a6c <printf>
    exit();
    17d8:	eb000757 	bl	353c <exit>
    exit();
    17dc:	eb000756 	bl	353c <exit>

000017e0 <bigdir>:
{
    17e0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  printf(1, "bigdir test\n");
    17e4:	e3a00001 	mov	r0, #1
{
    17e8:	e28db018 	add	fp, sp, #24
  printf(1, "bigdir test\n");
    17ec:	e3041660 	movw	r1, #18016	; 0x4660
{
    17f0:	e24dd014 	sub	sp, sp, #20
  printf(1, "bigdir test\n");
    17f4:	e3401000 	movt	r1, #0
    17f8:	eb00089b 	bl	3a6c <printf>
  unlink("bd");
    17fc:	e3040670 	movw	r0, #18032	; 0x4670
    1800:	e3400000 	movt	r0, #0
    1804:	eb0007ce 	bl	3744 <unlink>
  fd = open("bd", O_CREATE);
    1808:	e3040670 	movw	r0, #18032	; 0x4670
    180c:	e3a01c02 	mov	r1, #512	; 0x200
    1810:	e3400000 	movt	r0, #0
    1814:	eb0007b0 	bl	36dc <open>
  if(fd < 0){
    1818:	e3500000 	cmp	r0, #0
    181c:	ba000039 	blt	1908 <bigdir+0x128>
  close(fd);
    1820:	eb000786 	bl	3640 <close>
  for(i = 0; i < 500; i++){
    1824:	e3a07000 	mov	r7, #0
    if(link("bd", name) != 0){
    1828:	e3044670 	movw	r4, #18032	; 0x4670
    182c:	e3404000 	movt	r4, #0
    name[3] = '\0';
    1830:	e1a06007 	mov	r6, r7
    name[0] = 'x';
    1834:	e3a05078 	mov	r5, #120	; 0x78
    name[1] = '0' + (i / 64);
    1838:	e1a02347 	asr	r2, r7, #6
    name[2] = '0' + (i % 64);
    183c:	e207303f 	and	r3, r7, #63	; 0x3f
    if(link("bd", name) != 0){
    1840:	e24b1028 	sub	r1, fp, #40	; 0x28
    1844:	e1a00004 	mov	r0, r4
    name[1] = '0' + (i / 64);
    1848:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    184c:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    1850:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    1854:	e54b6025 	strb	r6, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    1858:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    185c:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(link("bd", name) != 0){
    1860:	eb0007d1 	bl	37ac <link>
    1864:	e2508000 	subs	r8, r0, #0
    1868:	1a00001c 	bne	18e0 <bigdir+0x100>
  for(i = 0; i < 500; i++){
    186c:	e2877001 	add	r7, r7, #1
    1870:	e3570f7d 	cmp	r7, #500	; 0x1f4
    1874:	1affffef 	bne	1838 <bigdir+0x58>
  unlink("bd");
    1878:	e3040670 	movw	r0, #18032	; 0x4670
    187c:	e3400000 	movt	r0, #0
    1880:	eb0007af 	bl	3744 <unlink>
    name[0] = 'x';
    1884:	e3a05078 	mov	r5, #120	; 0x78
    name[3] = '\0';
    1888:	e1a04008 	mov	r4, r8
    name[1] = '0' + (i / 64);
    188c:	e1a02348 	asr	r2, r8, #6
    name[2] = '0' + (i % 64);
    1890:	e208303f 	and	r3, r8, #63	; 0x3f
    if(unlink(name) != 0){
    1894:	e24b0028 	sub	r0, fp, #40	; 0x28
    name[1] = '0' + (i / 64);
    1898:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    189c:	e2833030 	add	r3, r3, #48	; 0x30
    name[0] = 'x';
    18a0:	e54b5028 	strb	r5, [fp, #-40]	; 0xffffffd8
    name[3] = '\0';
    18a4:	e54b4025 	strb	r4, [fp, #-37]	; 0xffffffdb
    name[1] = '0' + (i / 64);
    18a8:	e54b2027 	strb	r2, [fp, #-39]	; 0xffffffd9
    name[2] = '0' + (i % 64);
    18ac:	e54b3026 	strb	r3, [fp, #-38]	; 0xffffffda
    if(unlink(name) != 0){
    18b0:	eb0007a3 	bl	3744 <unlink>
    18b4:	e3500000 	cmp	r0, #0
    18b8:	1a00000d 	bne	18f4 <bigdir+0x114>
  for(i = 0; i < 500; i++){
    18bc:	e2888001 	add	r8, r8, #1
    18c0:	e3580f7d 	cmp	r8, #500	; 0x1f4
    18c4:	1afffff0 	bne	188c <bigdir+0xac>
  printf(1, "bigdir ok\n");
    18c8:	e3a00001 	mov	r0, #1
    18cc:	e30416b8 	movw	r1, #18104	; 0x46b8
    18d0:	e3401000 	movt	r1, #0
    18d4:	eb000864 	bl	3a6c <printf>
}
    18d8:	e24bd018 	sub	sp, fp, #24
    18dc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      printf(1, "bigdir link failed\n");
    18e0:	e304168c 	movw	r1, #18060	; 0x468c
    18e4:	e3a00001 	mov	r0, #1
    18e8:	e3401000 	movt	r1, #0
    18ec:	eb00085e 	bl	3a6c <printf>
      exit();
    18f0:	eb000711 	bl	353c <exit>
      printf(1, "bigdir unlink failed");
    18f4:	e30416a0 	movw	r1, #18080	; 0x46a0
    18f8:	e3a00001 	mov	r0, #1
    18fc:	e3401000 	movt	r1, #0
    1900:	eb000859 	bl	3a6c <printf>
      exit();
    1904:	eb00070c 	bl	353c <exit>
    printf(1, "bigdir create failed\n");
    1908:	e3041674 	movw	r1, #18036	; 0x4674
    190c:	e3a00001 	mov	r0, #1
    1910:	e3401000 	movt	r1, #0
    1914:	eb000854 	bl	3a6c <printf>
    exit();
    1918:	eb000707 	bl	353c <exit>

0000191c <subdir>:
{
    191c:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "subdir test\n");
    1920:	e3a00001 	mov	r0, #1
{
    1924:	e28db00c 	add	fp, sp, #12
  printf(1, "subdir test\n");
    1928:	e30416c4 	movw	r1, #18116	; 0x46c4
    192c:	e3401000 	movt	r1, #0
    1930:	eb00084d 	bl	3a6c <printf>
  unlink("ff");
    1934:	e30407cc 	movw	r0, #18380	; 0x47cc
    1938:	e3400000 	movt	r0, #0
    193c:	eb000780 	bl	3744 <unlink>
  if(mkdir("dd") != 0){
    1940:	e3040878 	movw	r0, #18552	; 0x4878
    1944:	e3400000 	movt	r0, #0
    1948:	eb0007a4 	bl	37e0 <mkdir>
    194c:	e3500000 	cmp	r0, #0
    1950:	1a000150 	bne	1e98 <subdir+0x57c>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1954:	e30406ec 	movw	r0, #18156	; 0x46ec
    1958:	e3001202 	movw	r1, #514	; 0x202
    195c:	e3400000 	movt	r0, #0
    1960:	eb00075d 	bl	36dc <open>
  if(fd < 0){
    1964:	e2504000 	subs	r4, r0, #0
    1968:	ba000145 	blt	1e84 <subdir+0x568>
  write(fd, "ff", 2);
    196c:	e3a02002 	mov	r2, #2
    1970:	e30417cc 	movw	r1, #18380	; 0x47cc
    1974:	e3401000 	movt	r1, #0
    1978:	eb000723 	bl	360c <write>
  close(fd);
    197c:	e1a00004 	mov	r0, r4
    1980:	eb00072e 	bl	3640 <close>
  if(unlink("dd") >= 0){
    1984:	e3040878 	movw	r0, #18552	; 0x4878
    1988:	e3400000 	movt	r0, #0
    198c:	eb00076c 	bl	3744 <unlink>
    1990:	e3500000 	cmp	r0, #0
    1994:	aa000135 	bge	1e70 <subdir+0x554>
  if(mkdir("/dd/dd") != 0){
    1998:	e3040734 	movw	r0, #18228	; 0x4734
    199c:	e3400000 	movt	r0, #0
    19a0:	eb00078e 	bl	37e0 <mkdir>
    19a4:	e2504000 	subs	r4, r0, #0
    19a8:	1a00012b 	bne	1e5c <subdir+0x540>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    19ac:	e3040758 	movw	r0, #18264	; 0x4758
    19b0:	e3001202 	movw	r1, #514	; 0x202
    19b4:	e3400000 	movt	r0, #0
    19b8:	eb000747 	bl	36dc <open>
  if(fd < 0){
    19bc:	e2505000 	subs	r5, r0, #0
    19c0:	ba0000ee 	blt	1d80 <subdir+0x464>
  write(fd, "FF", 2);
    19c4:	e3a02002 	mov	r2, #2
    19c8:	e304177c 	movw	r1, #18300	; 0x477c
    19cc:	e3401000 	movt	r1, #0
    19d0:	eb00070d 	bl	360c <write>
  close(fd);
    19d4:	e1a00005 	mov	r0, r5
    19d8:	eb000718 	bl	3640 <close>
  fd = open("dd/dd/../ff", 0);
    19dc:	e1a01004 	mov	r1, r4
    19e0:	e3040780 	movw	r0, #18304	; 0x4780
    19e4:	e3400000 	movt	r0, #0
    19e8:	eb00073b 	bl	36dc <open>
  if(fd < 0){
    19ec:	e2505000 	subs	r5, r0, #0
    19f0:	ba0000dd 	blt	1d6c <subdir+0x450>
  cc = read(fd, buf, sizeof(buf));
    19f4:	e3074f98 	movw	r4, #32664	; 0x7f98
    19f8:	e3404000 	movt	r4, #0
    19fc:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a00:	e1a01004 	mov	r1, r4
    1a04:	eb0006f3 	bl	35d8 <read>
  if(cc != 2 || buf[0] != 'f'){
    1a08:	e3500002 	cmp	r0, #2
    1a0c:	1a0000b3 	bne	1ce0 <subdir+0x3c4>
    1a10:	e5d43000 	ldrb	r3, [r4]
    1a14:	e3530066 	cmp	r3, #102	; 0x66
    1a18:	1a0000b0 	bne	1ce0 <subdir+0x3c4>
  close(fd);
    1a1c:	e1a00005 	mov	r0, r5
    1a20:	eb000706 	bl	3640 <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1a24:	e30417c4 	movw	r1, #18372	; 0x47c4
    1a28:	e3040758 	movw	r0, #18264	; 0x4758
    1a2c:	e3401000 	movt	r1, #0
    1a30:	e3400000 	movt	r0, #0
    1a34:	eb00075c 	bl	37ac <link>
    1a38:	e3500000 	cmp	r0, #0
    1a3c:	1a0000d9 	bne	1da8 <subdir+0x48c>
  if(unlink("dd/dd/ff") != 0){
    1a40:	e3040758 	movw	r0, #18264	; 0x4758
    1a44:	e3400000 	movt	r0, #0
    1a48:	eb00073d 	bl	3744 <unlink>
    1a4c:	e3500000 	cmp	r0, #0
    1a50:	1a0000ac 	bne	1d08 <subdir+0x3ec>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1a54:	e3040758 	movw	r0, #18264	; 0x4758
    1a58:	e3a01000 	mov	r1, #0
    1a5c:	e3400000 	movt	r0, #0
    1a60:	eb00071d 	bl	36dc <open>
    1a64:	e3500000 	cmp	r0, #0
    1a68:	aa0000f6 	bge	1e48 <subdir+0x52c>
  if(chdir("dd") != 0){
    1a6c:	e3040878 	movw	r0, #18552	; 0x4878
    1a70:	e3400000 	movt	r0, #0
    1a74:	eb000766 	bl	3814 <chdir>
    1a78:	e3500000 	cmp	r0, #0
    1a7c:	1a0000ec 	bne	1e34 <subdir+0x518>
  if(chdir("dd/../../dd") != 0){
    1a80:	e3040844 	movw	r0, #18500	; 0x4844
    1a84:	e3400000 	movt	r0, #0
    1a88:	eb000761 	bl	3814 <chdir>
    1a8c:	e3500000 	cmp	r0, #0
    1a90:	1a000097 	bne	1cf4 <subdir+0x3d8>
  if(chdir("dd/../../../dd") != 0){
    1a94:	e304086c 	movw	r0, #18540	; 0x486c
    1a98:	e3400000 	movt	r0, #0
    1a9c:	eb00075c 	bl	3814 <chdir>
    1aa0:	e3500000 	cmp	r0, #0
    1aa4:	1a000092 	bne	1cf4 <subdir+0x3d8>
  if(chdir("./..") != 0){
    1aa8:	e304087c 	movw	r0, #18556	; 0x487c
    1aac:	e3400000 	movt	r0, #0
    1ab0:	eb000757 	bl	3814 <chdir>
    1ab4:	e2504000 	subs	r4, r0, #0
    1ab8:	1a0000b5 	bne	1d94 <subdir+0x478>
  fd = open("dd/dd/ffff", 0);
    1abc:	e30407c4 	movw	r0, #18372	; 0x47c4
    1ac0:	e1a01004 	mov	r1, r4
    1ac4:	e3400000 	movt	r0, #0
    1ac8:	eb000703 	bl	36dc <open>
  if(fd < 0){
    1acc:	e2505000 	subs	r5, r0, #0
    1ad0:	ba00012c 	blt	1f88 <subdir+0x66c>
  if(read(fd, buf, sizeof(buf)) != 2){
    1ad4:	e3071f98 	movw	r1, #32664	; 0x7f98
    1ad8:	e3a02a02 	mov	r2, #8192	; 0x2000
    1adc:	e3401000 	movt	r1, #0
    1ae0:	eb0006bc 	bl	35d8 <read>
    1ae4:	e3500002 	cmp	r0, #2
    1ae8:	1a000121 	bne	1f74 <subdir+0x658>
  close(fd);
    1aec:	e1a00005 	mov	r0, r5
    1af0:	eb0006d2 	bl	3640 <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1af4:	e1a01004 	mov	r1, r4
    1af8:	e3040758 	movw	r0, #18264	; 0x4758
    1afc:	e3400000 	movt	r0, #0
    1b00:	eb0006f5 	bl	36dc <open>
    1b04:	e3500000 	cmp	r0, #0
    1b08:	aa000088 	bge	1d30 <subdir+0x414>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1b0c:	e30408f4 	movw	r0, #18676	; 0x48f4
    1b10:	e3001202 	movw	r1, #514	; 0x202
    1b14:	e3400000 	movt	r0, #0
    1b18:	eb0006ef 	bl	36dc <open>
    1b1c:	e3500000 	cmp	r0, #0
    1b20:	aa00007d 	bge	1d1c <subdir+0x400>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1b24:	e304091c 	movw	r0, #18716	; 0x491c
    1b28:	e3001202 	movw	r1, #514	; 0x202
    1b2c:	e3400000 	movt	r0, #0
    1b30:	eb0006e9 	bl	36dc <open>
    1b34:	e3500000 	cmp	r0, #0
    1b38:	aa0000b8 	bge	1e20 <subdir+0x504>
  if(open("dd", O_CREATE) >= 0){
    1b3c:	e3040878 	movw	r0, #18552	; 0x4878
    1b40:	e3a01c02 	mov	r1, #512	; 0x200
    1b44:	e3400000 	movt	r0, #0
    1b48:	eb0006e3 	bl	36dc <open>
    1b4c:	e3500000 	cmp	r0, #0
    1b50:	aa0000ad 	bge	1e0c <subdir+0x4f0>
  if(open("dd", O_RDWR) >= 0){
    1b54:	e3040878 	movw	r0, #18552	; 0x4878
    1b58:	e3a01002 	mov	r1, #2
    1b5c:	e3400000 	movt	r0, #0
    1b60:	eb0006dd 	bl	36dc <open>
    1b64:	e3500000 	cmp	r0, #0
    1b68:	aa0000a2 	bge	1df8 <subdir+0x4dc>
  if(open("dd", O_WRONLY) >= 0){
    1b6c:	e3040878 	movw	r0, #18552	; 0x4878
    1b70:	e3a01001 	mov	r1, #1
    1b74:	e3400000 	movt	r0, #0
    1b78:	eb0006d7 	bl	36dc <open>
    1b7c:	e3500000 	cmp	r0, #0
    1b80:	aa000097 	bge	1de4 <subdir+0x4c8>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1b84:	e3041994 	movw	r1, #18836	; 0x4994
    1b88:	e30408f4 	movw	r0, #18676	; 0x48f4
    1b8c:	e3401000 	movt	r1, #0
    1b90:	e3400000 	movt	r0, #0
    1b94:	eb000704 	bl	37ac <link>
    1b98:	e3500000 	cmp	r0, #0
    1b9c:	0a00008b 	beq	1dd0 <subdir+0x4b4>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1ba0:	e3041994 	movw	r1, #18836	; 0x4994
    1ba4:	e304091c 	movw	r0, #18716	; 0x491c
    1ba8:	e3401000 	movt	r1, #0
    1bac:	e3400000 	movt	r0, #0
    1bb0:	eb0006fd 	bl	37ac <link>
    1bb4:	e3500000 	cmp	r0, #0
    1bb8:	0a00007f 	beq	1dbc <subdir+0x4a0>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1bbc:	e30417c4 	movw	r1, #18372	; 0x47c4
    1bc0:	e30406ec 	movw	r0, #18156	; 0x46ec
    1bc4:	e3401000 	movt	r1, #0
    1bc8:	e3400000 	movt	r0, #0
    1bcc:	eb0006f6 	bl	37ac <link>
    1bd0:	e3500000 	cmp	r0, #0
    1bd4:	0a00005f 	beq	1d58 <subdir+0x43c>
  if(mkdir("dd/ff/ff") == 0){
    1bd8:	e30408f4 	movw	r0, #18676	; 0x48f4
    1bdc:	e3400000 	movt	r0, #0
    1be0:	eb0006fe 	bl	37e0 <mkdir>
    1be4:	e3500000 	cmp	r0, #0
    1be8:	0a000055 	beq	1d44 <subdir+0x428>
  if(mkdir("dd/xx/ff") == 0){
    1bec:	e304091c 	movw	r0, #18716	; 0x491c
    1bf0:	e3400000 	movt	r0, #0
    1bf4:	eb0006f9 	bl	37e0 <mkdir>
    1bf8:	e3500000 	cmp	r0, #0
    1bfc:	0a0000d7 	beq	1f60 <subdir+0x644>
  if(mkdir("dd/dd/ffff") == 0){
    1c00:	e30407c4 	movw	r0, #18372	; 0x47c4
    1c04:	e3400000 	movt	r0, #0
    1c08:	eb0006f4 	bl	37e0 <mkdir>
    1c0c:	e3500000 	cmp	r0, #0
    1c10:	0a0000cd 	beq	1f4c <subdir+0x630>
  if(unlink("dd/xx/ff") == 0){
    1c14:	e304091c 	movw	r0, #18716	; 0x491c
    1c18:	e3400000 	movt	r0, #0
    1c1c:	eb0006c8 	bl	3744 <unlink>
    1c20:	e3500000 	cmp	r0, #0
    1c24:	0a0000c3 	beq	1f38 <subdir+0x61c>
  if(unlink("dd/ff/ff") == 0){
    1c28:	e30408f4 	movw	r0, #18676	; 0x48f4
    1c2c:	e3400000 	movt	r0, #0
    1c30:	eb0006c3 	bl	3744 <unlink>
    1c34:	e3500000 	cmp	r0, #0
    1c38:	0a0000b9 	beq	1f24 <subdir+0x608>
  if(chdir("dd/ff") == 0){
    1c3c:	e30406ec 	movw	r0, #18156	; 0x46ec
    1c40:	e3400000 	movt	r0, #0
    1c44:	eb0006f2 	bl	3814 <chdir>
    1c48:	e3500000 	cmp	r0, #0
    1c4c:	0a0000af 	beq	1f10 <subdir+0x5f4>
  if(chdir("dd/xx") == 0){
    1c50:	e3040ab4 	movw	r0, #19124	; 0x4ab4
    1c54:	e3400000 	movt	r0, #0
    1c58:	eb0006ed 	bl	3814 <chdir>
    1c5c:	e3500000 	cmp	r0, #0
    1c60:	0a0000a5 	beq	1efc <subdir+0x5e0>
  if(unlink("dd/dd/ffff") != 0){
    1c64:	e30407c4 	movw	r0, #18372	; 0x47c4
    1c68:	e3400000 	movt	r0, #0
    1c6c:	eb0006b4 	bl	3744 <unlink>
    1c70:	e3500000 	cmp	r0, #0
    1c74:	1a000023 	bne	1d08 <subdir+0x3ec>
  if(unlink("dd/ff") != 0){
    1c78:	e30406ec 	movw	r0, #18156	; 0x46ec
    1c7c:	e3400000 	movt	r0, #0
    1c80:	eb0006af 	bl	3744 <unlink>
    1c84:	e3500000 	cmp	r0, #0
    1c88:	1a000096 	bne	1ee8 <subdir+0x5cc>
  if(unlink("dd") == 0){
    1c8c:	e3040878 	movw	r0, #18552	; 0x4878
    1c90:	e3400000 	movt	r0, #0
    1c94:	eb0006aa 	bl	3744 <unlink>
    1c98:	e3500000 	cmp	r0, #0
    1c9c:	0a00008c 	beq	1ed4 <subdir+0x5b8>
  if(unlink("dd/dd") < 0){
    1ca0:	e3040b0c 	movw	r0, #19212	; 0x4b0c
    1ca4:	e3400000 	movt	r0, #0
    1ca8:	eb0006a5 	bl	3744 <unlink>
    1cac:	e3500000 	cmp	r0, #0
    1cb0:	ba000082 	blt	1ec0 <subdir+0x5a4>
  if(unlink("dd") < 0){
    1cb4:	e3040878 	movw	r0, #18552	; 0x4878
    1cb8:	e3400000 	movt	r0, #0
    1cbc:	eb0006a0 	bl	3744 <unlink>
    1cc0:	e3500000 	cmp	r0, #0
    1cc4:	ba000078 	blt	1eac <subdir+0x590>
  printf(1, "subdir ok\n");
    1cc8:	e3041b40 	movw	r1, #19264	; 0x4b40
    1ccc:	e3a00001 	mov	r0, #1
    1cd0:	e3401000 	movt	r1, #0
}
    1cd4:	e24bd00c 	sub	sp, fp, #12
    1cd8:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "subdir ok\n");
    1cdc:	ea000762 	b	3a6c <printf>
    printf(1, "dd/dd/../ff wrong content\n");
    1ce0:	e30417a8 	movw	r1, #18344	; 0x47a8
    1ce4:	e3a00001 	mov	r0, #1
    1ce8:	e3401000 	movt	r1, #0
    1cec:	eb00075e 	bl	3a6c <printf>
    exit();
    1cf0:	eb000611 	bl	353c <exit>
    printf(1, "chdir dd/../../dd failed\n");
    1cf4:	e3041850 	movw	r1, #18512	; 0x4850
    1cf8:	e3a00001 	mov	r0, #1
    1cfc:	e3401000 	movt	r1, #0
    1d00:	eb000759 	bl	3a6c <printf>
    exit();
    1d04:	eb00060c 	bl	353c <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1d08:	e30417f4 	movw	r1, #18420	; 0x47f4
    1d0c:	e3a00001 	mov	r0, #1
    1d10:	e3401000 	movt	r1, #0
    1d14:	eb000754 	bl	3a6c <printf>
    exit();
    1d18:	eb000607 	bl	353c <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    1d1c:	e3041900 	movw	r1, #18688	; 0x4900
    1d20:	e3a00001 	mov	r0, #1
    1d24:	e3401000 	movt	r1, #0
    1d28:	eb00074f 	bl	3a6c <printf>
    exit();
    1d2c:	eb000602 	bl	353c <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1d30:	e30418cc 	movw	r1, #18636	; 0x48cc
    1d34:	e3a00001 	mov	r0, #1
    1d38:	e3401000 	movt	r1, #0
    1d3c:	eb00074a 	bl	3a6c <printf>
    exit();
    1d40:	eb0005fd 	bl	353c <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1d44:	e3041a0c 	movw	r1, #18956	; 0x4a0c
    1d48:	e3a00001 	mov	r0, #1
    1d4c:	e3401000 	movt	r1, #0
    1d50:	eb000745 	bl	3a6c <printf>
    exit();
    1d54:	eb0005f8 	bl	353c <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1d58:	e30419e8 	movw	r1, #18920	; 0x49e8
    1d5c:	e3a00001 	mov	r0, #1
    1d60:	e3401000 	movt	r1, #0
    1d64:	eb000740 	bl	3a6c <printf>
    exit();
    1d68:	eb0005f3 	bl	353c <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1d6c:	e304178c 	movw	r1, #18316	; 0x478c
    1d70:	e3a00001 	mov	r0, #1
    1d74:	e3401000 	movt	r1, #0
    1d78:	eb00073b 	bl	3a6c <printf>
    exit();
    1d7c:	eb0005ee 	bl	353c <exit>
    printf(1, "create dd/dd/ff failed\n");
    1d80:	e3041764 	movw	r1, #18276	; 0x4764
    1d84:	e3a00001 	mov	r0, #1
    1d88:	e3401000 	movt	r1, #0
    1d8c:	eb000736 	bl	3a6c <printf>
    exit();
    1d90:	eb0005e9 	bl	353c <exit>
    printf(1, "chdir ./.. failed\n");
    1d94:	e3041884 	movw	r1, #18564	; 0x4884
    1d98:	e3a00001 	mov	r0, #1
    1d9c:	e3401000 	movt	r1, #0
    1da0:	eb000731 	bl	3a6c <printf>
    exit();
    1da4:	eb0005e4 	bl	353c <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1da8:	e30417d0 	movw	r1, #18384	; 0x47d0
    1dac:	e3a00001 	mov	r0, #1
    1db0:	e3401000 	movt	r1, #0
    1db4:	eb00072c 	bl	3a6c <printf>
    exit();
    1db8:	eb0005df 	bl	353c <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    1dbc:	e30419c4 	movw	r1, #18884	; 0x49c4
    1dc0:	e3a00001 	mov	r0, #1
    1dc4:	e3401000 	movt	r1, #0
    1dc8:	eb000727 	bl	3a6c <printf>
    exit();
    1dcc:	eb0005da 	bl	353c <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    1dd0:	e30419a0 	movw	r1, #18848	; 0x49a0
    1dd4:	e3a00001 	mov	r0, #1
    1dd8:	e3401000 	movt	r1, #0
    1ddc:	eb000722 	bl	3a6c <printf>
    exit();
    1de0:	eb0005d5 	bl	353c <exit>
    printf(1, "open dd wronly succeeded!\n");
    1de4:	e3041978 	movw	r1, #18808	; 0x4978
    1de8:	e3a00001 	mov	r0, #1
    1dec:	e3401000 	movt	r1, #0
    1df0:	eb00071d 	bl	3a6c <printf>
    exit();
    1df4:	eb0005d0 	bl	353c <exit>
    printf(1, "open dd rdwr succeeded!\n");
    1df8:	e304195c 	movw	r1, #18780	; 0x495c
    1dfc:	e3a00001 	mov	r0, #1
    1e00:	e3401000 	movt	r1, #0
    1e04:	eb000718 	bl	3a6c <printf>
    exit();
    1e08:	eb0005cb 	bl	353c <exit>
    printf(1, "create dd succeeded!\n");
    1e0c:	e3041944 	movw	r1, #18756	; 0x4944
    1e10:	e3a00001 	mov	r0, #1
    1e14:	e3401000 	movt	r1, #0
    1e18:	eb000713 	bl	3a6c <printf>
    exit();
    1e1c:	eb0005c6 	bl	353c <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    1e20:	e3041928 	movw	r1, #18728	; 0x4928
    1e24:	e3a00001 	mov	r0, #1
    1e28:	e3401000 	movt	r1, #0
    1e2c:	eb00070e 	bl	3a6c <printf>
    exit();
    1e30:	eb0005c1 	bl	353c <exit>
    printf(1, "chdir dd failed\n");
    1e34:	e3041830 	movw	r1, #18480	; 0x4830
    1e38:	e3a00001 	mov	r0, #1
    1e3c:	e3401000 	movt	r1, #0
    1e40:	eb000709 	bl	3a6c <printf>
    exit();
    1e44:	eb0005bc 	bl	353c <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1e48:	e304180c 	movw	r1, #18444	; 0x480c
    1e4c:	e3a00001 	mov	r0, #1
    1e50:	e3401000 	movt	r1, #0
    1e54:	eb000704 	bl	3a6c <printf>
    exit();
    1e58:	eb0005b7 	bl	353c <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1e5c:	e304173c 	movw	r1, #18236	; 0x473c
    1e60:	e3a00001 	mov	r0, #1
    1e64:	e3401000 	movt	r1, #0
    1e68:	eb0006ff 	bl	3a6c <printf>
    exit();
    1e6c:	eb0005b2 	bl	353c <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1e70:	e304170c 	movw	r1, #18188	; 0x470c
    1e74:	e3a00001 	mov	r0, #1
    1e78:	e3401000 	movt	r1, #0
    1e7c:	eb0006fa 	bl	3a6c <printf>
    exit();
    1e80:	eb0005ad 	bl	353c <exit>
    printf(1, "create dd/ff failed\n");
    1e84:	e30416f4 	movw	r1, #18164	; 0x46f4
    1e88:	e3a00001 	mov	r0, #1
    1e8c:	e3401000 	movt	r1, #0
    1e90:	eb0006f5 	bl	3a6c <printf>
    exit();
    1e94:	eb0005a8 	bl	353c <exit>
    printf(1, "subdir mkdir dd failed\n");
    1e98:	e30416d4 	movw	r1, #18132	; 0x46d4
    1e9c:	e3a00001 	mov	r0, #1
    1ea0:	e3401000 	movt	r1, #0
    1ea4:	eb0006f0 	bl	3a6c <printf>
    exit();
    1ea8:	eb0005a3 	bl	353c <exit>
    printf(1, "unlink dd failed\n");
    1eac:	e3041b2c 	movw	r1, #19244	; 0x4b2c
    1eb0:	e3a00001 	mov	r0, #1
    1eb4:	e3401000 	movt	r1, #0
    1eb8:	eb0006eb 	bl	3a6c <printf>
    exit();
    1ebc:	eb00059e 	bl	353c <exit>
    printf(1, "unlink dd/dd failed\n");
    1ec0:	e3041b14 	movw	r1, #19220	; 0x4b14
    1ec4:	e3a00001 	mov	r0, #1
    1ec8:	e3401000 	movt	r1, #0
    1ecc:	eb0006e6 	bl	3a6c <printf>
    exit();
    1ed0:	eb000599 	bl	353c <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    1ed4:	e3041aec 	movw	r1, #19180	; 0x4aec
    1ed8:	e3a00001 	mov	r0, #1
    1edc:	e3401000 	movt	r1, #0
    1ee0:	eb0006e1 	bl	3a6c <printf>
    exit();
    1ee4:	eb000594 	bl	353c <exit>
    printf(1, "unlink dd/ff failed\n");
    1ee8:	e3041ad4 	movw	r1, #19156	; 0x4ad4
    1eec:	e3a00001 	mov	r0, #1
    1ef0:	e3401000 	movt	r1, #0
    1ef4:	eb0006dc 	bl	3a6c <printf>
    exit();
    1ef8:	eb00058f 	bl	353c <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    1efc:	e3041abc 	movw	r1, #19132	; 0x4abc
    1f00:	e3a00001 	mov	r0, #1
    1f04:	e3401000 	movt	r1, #0
    1f08:	eb0006d7 	bl	3a6c <printf>
    exit();
    1f0c:	eb00058a 	bl	353c <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    1f10:	e3041a9c 	movw	r1, #19100	; 0x4a9c
    1f14:	e3a00001 	mov	r0, #1
    1f18:	e3401000 	movt	r1, #0
    1f1c:	eb0006d2 	bl	3a6c <printf>
    exit();
    1f20:	eb000585 	bl	353c <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    1f24:	e3041a80 	movw	r1, #19072	; 0x4a80
    1f28:	e3a00001 	mov	r0, #1
    1f2c:	e3401000 	movt	r1, #0
    1f30:	eb0006cd 	bl	3a6c <printf>
    exit();
    1f34:	eb000580 	bl	353c <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    1f38:	e3041a64 	movw	r1, #19044	; 0x4a64
    1f3c:	e3a00001 	mov	r0, #1
    1f40:	e3401000 	movt	r1, #0
    1f44:	eb0006c8 	bl	3a6c <printf>
    exit();
    1f48:	eb00057b 	bl	353c <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    1f4c:	e3041a44 	movw	r1, #19012	; 0x4a44
    1f50:	e3a00001 	mov	r0, #1
    1f54:	e3401000 	movt	r1, #0
    1f58:	eb0006c3 	bl	3a6c <printf>
    exit();
    1f5c:	eb000576 	bl	353c <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    1f60:	e3041a28 	movw	r1, #18984	; 0x4a28
    1f64:	e3a00001 	mov	r0, #1
    1f68:	e3401000 	movt	r1, #0
    1f6c:	eb0006be 	bl	3a6c <printf>
    exit();
    1f70:	eb000571 	bl	353c <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    1f74:	e30418b0 	movw	r1, #18608	; 0x48b0
    1f78:	e3a00001 	mov	r0, #1
    1f7c:	e3401000 	movt	r1, #0
    1f80:	eb0006b9 	bl	3a6c <printf>
    exit();
    1f84:	eb00056c 	bl	353c <exit>
    printf(1, "open dd/dd/ffff failed\n");
    1f88:	e3041898 	movw	r1, #18584	; 0x4898
    1f8c:	e3a00001 	mov	r0, #1
    1f90:	e3401000 	movt	r1, #0
    1f94:	eb0006b4 	bl	3a6c <printf>
    exit();
    1f98:	eb000567 	bl	353c <exit>

00001f9c <bigwrite>:
{
    1f9c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite test\n");
    1fa0:	e3a00001 	mov	r0, #1
{
    1fa4:	e28db014 	add	fp, sp, #20
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1fa8:	e3047b5c 	movw	r7, #19292	; 0x4b5c
  printf(1, "bigwrite test\n");
    1fac:	e3041b4c 	movw	r1, #19276	; 0x4b4c
    1fb0:	e3401000 	movt	r1, #0
    1fb4:	eb0006ac 	bl	3a6c <printf>
  unlink("bigwrite");
    1fb8:	e1a00007 	mov	r0, r7
    1fbc:	e3400000 	movt	r0, #0
      int cc = write(fd, buf, sz);
    1fc0:	e3076f98 	movw	r6, #32664	; 0x7f98
    1fc4:	e3406000 	movt	r6, #0
  for(sz = 499; sz < 12*512; sz += 471){
    1fc8:	e30041f3 	movw	r4, #499	; 0x1f3
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1fcc:	e1a07000 	mov	r7, r0
  unlink("bigwrite");
    1fd0:	eb0005db 	bl	3744 <unlink>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1fd4:	e3001202 	movw	r1, #514	; 0x202
    1fd8:	e1a00007 	mov	r0, r7
    1fdc:	eb0005be 	bl	36dc <open>
    if(fd < 0){
    1fe0:	e2505000 	subs	r5, r0, #0
    1fe4:	ba000020 	blt	206c <bigwrite+0xd0>
      int cc = write(fd, buf, sz);
    1fe8:	e1a02004 	mov	r2, r4
    1fec:	e1a01006 	mov	r1, r6
    1ff0:	eb000585 	bl	360c <write>
      if(cc != sz){
    1ff4:	e1500004 	cmp	r0, r4
    1ff8:	1a000014 	bne	2050 <bigwrite+0xb4>
      int cc = write(fd, buf, sz);
    1ffc:	e1a02004 	mov	r2, r4
    2000:	e1a01006 	mov	r1, r6
    2004:	e1a00005 	mov	r0, r5
    2008:	eb00057f 	bl	360c <write>
      if(cc != sz){
    200c:	e1500004 	cmp	r0, r4
    2010:	1a00000e 	bne	2050 <bigwrite+0xb4>
    close(fd);
    2014:	e1a00005 	mov	r0, r5
  for(sz = 499; sz < 12*512; sz += 471){
    2018:	e2844f75 	add	r4, r4, #468	; 0x1d4
    close(fd);
    201c:	eb000587 	bl	3640 <close>
  for(sz = 499; sz < 12*512; sz += 471){
    2020:	e2844003 	add	r4, r4, #3
    unlink("bigwrite");
    2024:	e1a00007 	mov	r0, r7
    2028:	eb0005c5 	bl	3744 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    202c:	e3013807 	movw	r3, #6151	; 0x1807
    2030:	e1540003 	cmp	r4, r3
    2034:	1affffe6 	bne	1fd4 <bigwrite+0x38>
  printf(1, "bigwrite ok\n");
    2038:	e3041b94 	movw	r1, #19348	; 0x4b94
    203c:	e3a00001 	mov	r0, #1
    2040:	e3401000 	movt	r1, #0
}
    2044:	e24bd014 	sub	sp, fp, #20
    2048:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "bigwrite ok\n");
    204c:	ea000686 	b	3a6c <printf>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2050:	e1a03000 	mov	r3, r0
    2054:	e1a02004 	mov	r2, r4
    2058:	e3041b80 	movw	r1, #19328	; 0x4b80
    205c:	e3a00001 	mov	r0, #1
    2060:	e3401000 	movt	r1, #0
    2064:	eb000680 	bl	3a6c <printf>
        exit();
    2068:	eb000533 	bl	353c <exit>
      printf(1, "cannot create bigwrite\n");
    206c:	e3041b68 	movw	r1, #19304	; 0x4b68
    2070:	e3a00001 	mov	r0, #1
    2074:	e3401000 	movt	r1, #0
    2078:	eb00067b 	bl	3a6c <printf>
      exit();
    207c:	eb00052e 	bl	353c <exit>

00002080 <bigfile>:
{
    2080:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test\n");
    2084:	e3a00001 	mov	r0, #1
{
    2088:	e28db01c 	add	fp, sp, #28
  printf(1, "bigfile test\n");
    208c:	e3041ba4 	movw	r1, #19364	; 0x4ba4
    2090:	e3401000 	movt	r1, #0
    2094:	eb000674 	bl	3a6c <printf>
  unlink("bigfile");
    2098:	e3040bb4 	movw	r0, #19380	; 0x4bb4
    209c:	e3400000 	movt	r0, #0
    20a0:	eb0005a7 	bl	3744 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    20a4:	e3040bb4 	movw	r0, #19380	; 0x4bb4
    20a8:	e3001202 	movw	r1, #514	; 0x202
    20ac:	e3400000 	movt	r0, #0
    20b0:	eb000589 	bl	36dc <open>
  if(fd < 0){
    20b4:	e2506000 	subs	r6, r0, #0
    memset(buf, i, 600);
    20b8:	a3075f98 	movwge	r5, #32664	; 0x7f98
    20bc:	a3a04000 	movge	r4, #0
    20c0:	a3405000 	movtge	r5, #0
  if(fd < 0){
    20c4:	ba000052 	blt	2214 <bigfile+0x194>
    memset(buf, i, 600);
    20c8:	e3a02f96 	mov	r2, #600	; 0x258
    20cc:	e1a01004 	mov	r1, r4
    20d0:	e1a00005 	mov	r0, r5
    20d4:	eb0004a1 	bl	3360 <memset>
    if(write(fd, buf, 600) != 600){
    20d8:	e3a02f96 	mov	r2, #600	; 0x258
    20dc:	e1a01005 	mov	r1, r5
    20e0:	e1a00006 	mov	r0, r6
    20e4:	eb000548 	bl	360c <write>
    20e8:	e3500f96 	cmp	r0, #600	; 0x258
    20ec:	1a00003e 	bne	21ec <bigfile+0x16c>
  for(i = 0; i < 20; i++){
    20f0:	e2844001 	add	r4, r4, #1
    20f4:	e3540014 	cmp	r4, #20
    20f8:	1afffff2 	bne	20c8 <bigfile+0x48>
  close(fd);
    20fc:	e1a00006 	mov	r0, r6
    2100:	eb00054e 	bl	3640 <close>
  fd = open("bigfile", 0);
    2104:	e3040bb4 	movw	r0, #19380	; 0x4bb4
    2108:	e3a01000 	mov	r1, #0
    210c:	e3400000 	movt	r0, #0
    2110:	eb000571 	bl	36dc <open>
  if(fd < 0){
    2114:	e2507000 	subs	r7, r0, #0
    2118:	ba000038 	blt	2200 <bigfile+0x180>
    211c:	e3075f98 	movw	r5, #32664	; 0x7f98
    2120:	e3405000 	movt	r5, #0
    2124:	e3a06000 	mov	r6, #0
    cc = read(fd, buf, 300);
    2128:	e1a08005 	mov	r8, r5
    212c:	e1a04006 	mov	r4, r6
    2130:	ea000009 	b	215c <bigfile+0xdc>
    if(cc != 300){
    2134:	e3500f4b 	cmp	r0, #300	; 0x12c
    2138:	1a000021 	bne	21c4 <bigfile+0x144>
    if(buf[0] != i/2 || buf[299] != i/2){
    213c:	e5d53000 	ldrb	r3, [r5]
    2140:	e15300c4 	cmp	r3, r4, asr #1
    2144:	1a000019 	bne	21b0 <bigfile+0x130>
    2148:	e5d5212b 	ldrb	r2, [r5, #299]	; 0x12b
    214c:	e1530002 	cmp	r3, r2
    2150:	1a000016 	bne	21b0 <bigfile+0x130>
    total += cc;
    2154:	e2866f4b 	add	r6, r6, #300	; 0x12c
  for(i = 0; ; i++){
    2158:	e2844001 	add	r4, r4, #1
    cc = read(fd, buf, 300);
    215c:	e3a02f4b 	mov	r2, #300	; 0x12c
    2160:	e1a01008 	mov	r1, r8
    2164:	e1a00007 	mov	r0, r7
    2168:	eb00051a 	bl	35d8 <read>
    if(cc < 0){
    216c:	e3500000 	cmp	r0, #0
    2170:	ba000018 	blt	21d8 <bigfile+0x158>
    if(cc == 0)
    2174:	1affffee 	bne	2134 <bigfile+0xb4>
  close(fd);
    2178:	e1a00007 	mov	r0, r7
    217c:	eb00052f 	bl	3640 <close>
  if(total != 20*600){
    2180:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    2184:	e1560003 	cmp	r6, r3
    2188:	1a000026 	bne	2228 <bigfile+0x1a8>
  unlink("bigfile");
    218c:	e3040bb4 	movw	r0, #19380	; 0x4bb4
    2190:	e3400000 	movt	r0, #0
    2194:	eb00056a 	bl	3744 <unlink>
  printf(1, "bigfile test ok\n");
    2198:	e3041c68 	movw	r1, #19560	; 0x4c68
    219c:	e3a00001 	mov	r0, #1
    21a0:	e3401000 	movt	r1, #0
}
    21a4:	e24bd01c 	sub	sp, fp, #28
    21a8:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(1, "bigfile test ok\n");
    21ac:	ea00062e 	b	3a6c <printf>
      printf(1, "read bigfile wrong data\n");
    21b0:	e3041c30 	movw	r1, #19504	; 0x4c30
    21b4:	e3a00001 	mov	r0, #1
    21b8:	e3401000 	movt	r1, #0
    21bc:	eb00062a 	bl	3a6c <printf>
      exit();
    21c0:	eb0004dd 	bl	353c <exit>
      printf(1, "short read bigfile\n");
    21c4:	e3041c1c 	movw	r1, #19484	; 0x4c1c
    21c8:	e3a00001 	mov	r0, #1
    21cc:	e3401000 	movt	r1, #0
    21d0:	eb000625 	bl	3a6c <printf>
      exit();
    21d4:	eb0004d8 	bl	353c <exit>
      printf(1, "read bigfile failed\n");
    21d8:	e3041c04 	movw	r1, #19460	; 0x4c04
    21dc:	e3a00001 	mov	r0, #1
    21e0:	e3401000 	movt	r1, #0
    21e4:	eb000620 	bl	3a6c <printf>
      exit();
    21e8:	eb0004d3 	bl	353c <exit>
      printf(1, "write bigfile failed\n");
    21ec:	e3041bd4 	movw	r1, #19412	; 0x4bd4
    21f0:	e3a00001 	mov	r0, #1
    21f4:	e3401000 	movt	r1, #0
    21f8:	eb00061b 	bl	3a6c <printf>
      exit();
    21fc:	eb0004ce 	bl	353c <exit>
    printf(1, "cannot open bigfile\n");
    2200:	e3041bec 	movw	r1, #19436	; 0x4bec
    2204:	e3a00001 	mov	r0, #1
    2208:	e3401000 	movt	r1, #0
    220c:	eb000616 	bl	3a6c <printf>
    exit();
    2210:	eb0004c9 	bl	353c <exit>
    printf(1, "cannot create bigfile");
    2214:	e3041bbc 	movw	r1, #19388	; 0x4bbc
    2218:	e3a00001 	mov	r0, #1
    221c:	e3401000 	movt	r1, #0
    2220:	eb000611 	bl	3a6c <printf>
    exit();
    2224:	eb0004c4 	bl	353c <exit>
    printf(1, "read bigfile wrong total\n");
    2228:	e3041c4c 	movw	r1, #19532	; 0x4c4c
    222c:	e3a00001 	mov	r0, #1
    2230:	e3401000 	movt	r1, #0
    2234:	eb00060c 	bl	3a6c <printf>
    exit();
    2238:	eb0004bf 	bl	353c <exit>

0000223c <fourteen>:
{
    223c:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fourteen test\n");
    2240:	e3a00001 	mov	r0, #1
{
    2244:	e28db00c 	add	fp, sp, #12
  printf(1, "fourteen test\n");
    2248:	e3041c7c 	movw	r1, #19580	; 0x4c7c
    224c:	e3401000 	movt	r1, #0
    2250:	eb000605 	bl	3a6c <printf>
  if(mkdir("12345678901234") != 0){
    2254:	e3040e38 	movw	r0, #20024	; 0x4e38
    2258:	e3400000 	movt	r0, #0
    225c:	eb00055f 	bl	37e0 <mkdir>
    2260:	e3500000 	cmp	r0, #0
    2264:	1a000022 	bne	22f4 <fourteen+0xb8>
  if(mkdir("12345678901234/123456789012345") != 0){
    2268:	e3040cac 	movw	r0, #19628	; 0x4cac
    226c:	e3400000 	movt	r0, #0
    2270:	eb00055a 	bl	37e0 <mkdir>
    2274:	e2504000 	subs	r4, r0, #0
    2278:	1a000036 	bne	2358 <fourteen+0x11c>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    227c:	e3040cfc 	movw	r0, #19708	; 0x4cfc
    2280:	e3a01c02 	mov	r1, #512	; 0x200
    2284:	e3400000 	movt	r0, #0
    2288:	eb000513 	bl	36dc <open>
  if(fd < 0){
    228c:	e3500000 	cmp	r0, #0
    2290:	ba00002b 	blt	2344 <fourteen+0x108>
  close(fd);
    2294:	eb0004e9 	bl	3640 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2298:	e1a01004 	mov	r1, r4
    229c:	e3040d6c 	movw	r0, #19820	; 0x4d6c
    22a0:	e3400000 	movt	r0, #0
    22a4:	eb00050c 	bl	36dc <open>
  if(fd < 0){
    22a8:	e3500000 	cmp	r0, #0
    22ac:	ba00001f 	blt	2330 <fourteen+0xf4>
  close(fd);
    22b0:	eb0004e2 	bl	3640 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    22b4:	e3040dd8 	movw	r0, #19928	; 0x4dd8
    22b8:	e3400000 	movt	r0, #0
    22bc:	eb000547 	bl	37e0 <mkdir>
    22c0:	e3500000 	cmp	r0, #0
    22c4:	0a000014 	beq	231c <fourteen+0xe0>
  if(mkdir("123456789012345/12345678901234") == 0){
    22c8:	e3040e28 	movw	r0, #20008	; 0x4e28
    22cc:	e3400000 	movt	r0, #0
    22d0:	eb000542 	bl	37e0 <mkdir>
    22d4:	e3500000 	cmp	r0, #0
    22d8:	0a00000a 	beq	2308 <fourteen+0xcc>
  printf(1, "fourteen ok\n");
    22dc:	e3041e7c 	movw	r1, #20092	; 0x4e7c
    22e0:	e3a00001 	mov	r0, #1
    22e4:	e3401000 	movt	r1, #0
}
    22e8:	e24bd00c 	sub	sp, fp, #12
    22ec:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fourteen ok\n");
    22f0:	ea0005dd 	b	3a6c <printf>
    printf(1, "mkdir 12345678901234 failed\n");
    22f4:	e3041c8c 	movw	r1, #19596	; 0x4c8c
    22f8:	e3a00001 	mov	r0, #1
    22fc:	e3401000 	movt	r1, #0
    2300:	eb0005d9 	bl	3a6c <printf>
    exit();
    2304:	eb00048c 	bl	353c <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2308:	e3041e48 	movw	r1, #20040	; 0x4e48
    230c:	e3a00001 	mov	r0, #1
    2310:	e3401000 	movt	r1, #0
    2314:	eb0005d4 	bl	3a6c <printf>
    exit();
    2318:	eb000487 	bl	353c <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    231c:	e3041df8 	movw	r1, #19960	; 0x4df8
    2320:	e3a00001 	mov	r0, #1
    2324:	e3401000 	movt	r1, #0
    2328:	eb0005cf 	bl	3a6c <printf>
    exit();
    232c:	eb000482 	bl	353c <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2330:	e3041d9c 	movw	r1, #19868	; 0x4d9c
    2334:	e3a00001 	mov	r0, #1
    2338:	e3401000 	movt	r1, #0
    233c:	eb0005ca 	bl	3a6c <printf>
    exit();
    2340:	eb00047d 	bl	353c <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2344:	e3041d2c 	movw	r1, #19756	; 0x4d2c
    2348:	e3a00001 	mov	r0, #1
    234c:	e3401000 	movt	r1, #0
    2350:	eb0005c5 	bl	3a6c <printf>
    exit();
    2354:	eb000478 	bl	353c <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2358:	e3041ccc 	movw	r1, #19660	; 0x4ccc
    235c:	e3a00001 	mov	r0, #1
    2360:	e3401000 	movt	r1, #0
    2364:	eb0005c0 	bl	3a6c <printf>
    exit();
    2368:	eb000473 	bl	353c <exit>

0000236c <rmdot>:
{
    236c:	e92d4800 	push	{fp, lr}
  printf(1, "rmdot test\n");
    2370:	e3a00001 	mov	r0, #1
{
    2374:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    2378:	e3041e8c 	movw	r1, #20108	; 0x4e8c
    237c:	e3401000 	movt	r1, #0
    2380:	eb0005b9 	bl	3a6c <printf>
  if(mkdir("dots") != 0){
    2384:	e3040e98 	movw	r0, #20120	; 0x4e98
    2388:	e3400000 	movt	r0, #0
    238c:	eb000513 	bl	37e0 <mkdir>
    2390:	e3500000 	cmp	r0, #0
    2394:	1a000028 	bne	243c <rmdot+0xd0>
  if(chdir("dots") != 0){
    2398:	e3040e98 	movw	r0, #20120	; 0x4e98
    239c:	e3400000 	movt	r0, #0
    23a0:	eb00051b 	bl	3814 <chdir>
    23a4:	e3500000 	cmp	r0, #0
    23a8:	1a000046 	bne	24c8 <rmdot+0x15c>
  if(unlink(".") == 0){
    23ac:	e3040558 	movw	r0, #17752	; 0x4558
    23b0:	e3400000 	movt	r0, #0
    23b4:	eb0004e2 	bl	3744 <unlink>
    23b8:	e3500000 	cmp	r0, #0
    23bc:	0a00003c 	beq	24b4 <rmdot+0x148>
  if(unlink("..") == 0){
    23c0:	e304009c 	movw	r0, #16540	; 0x409c
    23c4:	e3400000 	movt	r0, #0
    23c8:	eb0004dd 	bl	3744 <unlink>
    23cc:	e3500000 	cmp	r0, #0
    23d0:	0a000032 	beq	24a0 <rmdot+0x134>
  if(chdir("/") != 0){
    23d4:	e3040ee8 	movw	r0, #20200	; 0x4ee8
    23d8:	e3400000 	movt	r0, #0
    23dc:	eb00050c 	bl	3814 <chdir>
    23e0:	e3500000 	cmp	r0, #0
    23e4:	1a000028 	bne	248c <rmdot+0x120>
  if(unlink("dots/.") == 0){
    23e8:	e3040efc 	movw	r0, #20220	; 0x4efc
    23ec:	e3400000 	movt	r0, #0
    23f0:	eb0004d3 	bl	3744 <unlink>
    23f4:	e3500000 	cmp	r0, #0
    23f8:	0a00001e 	beq	2478 <rmdot+0x10c>
  if(unlink("dots/..") == 0){
    23fc:	e3040f1c 	movw	r0, #20252	; 0x4f1c
    2400:	e3400000 	movt	r0, #0
    2404:	eb0004ce 	bl	3744 <unlink>
    2408:	e3500000 	cmp	r0, #0
    240c:	0a000014 	beq	2464 <rmdot+0xf8>
  if(unlink("dots") != 0){
    2410:	e3040e98 	movw	r0, #20120	; 0x4e98
    2414:	e3400000 	movt	r0, #0
    2418:	eb0004c9 	bl	3744 <unlink>
    241c:	e3500000 	cmp	r0, #0
    2420:	1a00000a 	bne	2450 <rmdot+0xe4>
  printf(1, "rmdot ok\n");
    2424:	e3041f54 	movw	r1, #20308	; 0x4f54
    2428:	e3a00001 	mov	r0, #1
    242c:	e3401000 	movt	r1, #0
}
    2430:	e24bd004 	sub	sp, fp, #4
    2434:	e8bd4800 	pop	{fp, lr}
  printf(1, "rmdot ok\n");
    2438:	ea00058b 	b	3a6c <printf>
    printf(1, "mkdir dots failed\n");
    243c:	e3041ea0 	movw	r1, #20128	; 0x4ea0
    2440:	e3a00001 	mov	r0, #1
    2444:	e3401000 	movt	r1, #0
    2448:	eb000587 	bl	3a6c <printf>
    exit();
    244c:	eb00043a 	bl	353c <exit>
    printf(1, "unlink dots failed!\n");
    2450:	e3041f3c 	movw	r1, #20284	; 0x4f3c
    2454:	e3a00001 	mov	r0, #1
    2458:	e3401000 	movt	r1, #0
    245c:	eb000582 	bl	3a6c <printf>
    exit();
    2460:	eb000435 	bl	353c <exit>
    printf(1, "unlink dots/.. worked!\n");
    2464:	e3041f24 	movw	r1, #20260	; 0x4f24
    2468:	e3a00001 	mov	r0, #1
    246c:	e3401000 	movt	r1, #0
    2470:	eb00057d 	bl	3a6c <printf>
    exit();
    2474:	eb000430 	bl	353c <exit>
    printf(1, "unlink dots/. worked!\n");
    2478:	e3041f04 	movw	r1, #20228	; 0x4f04
    247c:	e3a00001 	mov	r0, #1
    2480:	e3401000 	movt	r1, #0
    2484:	eb000578 	bl	3a6c <printf>
    exit();
    2488:	eb00042b 	bl	353c <exit>
    printf(1, "chdir / failed\n");
    248c:	e3041eec 	movw	r1, #20204	; 0x4eec
    2490:	e3a00001 	mov	r0, #1
    2494:	e3401000 	movt	r1, #0
    2498:	eb000573 	bl	3a6c <printf>
    exit();
    249c:	eb000426 	bl	353c <exit>
    printf(1, "rm .. worked!\n");
    24a0:	e3041ed8 	movw	r1, #20184	; 0x4ed8
    24a4:	e3a00001 	mov	r0, #1
    24a8:	e3401000 	movt	r1, #0
    24ac:	eb00056e 	bl	3a6c <printf>
    exit();
    24b0:	eb000421 	bl	353c <exit>
    printf(1, "rm . worked!\n");
    24b4:	e3041ec8 	movw	r1, #20168	; 0x4ec8
    24b8:	e3a00001 	mov	r0, #1
    24bc:	e3401000 	movt	r1, #0
    24c0:	eb000569 	bl	3a6c <printf>
    exit();
    24c4:	eb00041c 	bl	353c <exit>
    printf(1, "chdir dots failed\n");
    24c8:	e3041eb4 	movw	r1, #20148	; 0x4eb4
    24cc:	e3a00001 	mov	r0, #1
    24d0:	e3401000 	movt	r1, #0
    24d4:	eb000564 	bl	3a6c <printf>
    exit();
    24d8:	eb000417 	bl	353c <exit>

000024dc <dirfile>:
{
    24dc:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "dir vs file\n");
    24e0:	e3a00001 	mov	r0, #1
{
    24e4:	e28db00c 	add	fp, sp, #12
  printf(1, "dir vs file\n");
    24e8:	e3041f60 	movw	r1, #20320	; 0x4f60
    24ec:	e3401000 	movt	r1, #0
    24f0:	eb00055d 	bl	3a6c <printf>
  fd = open("dirfile", O_CREATE);
    24f4:	e3040f70 	movw	r0, #20336	; 0x4f70
    24f8:	e3a01c02 	mov	r1, #512	; 0x200
    24fc:	e3400000 	movt	r0, #0
    2500:	eb000475 	bl	36dc <open>
  if(fd < 0){
    2504:	e3500000 	cmp	r0, #0
    2508:	ba00004a 	blt	2638 <dirfile+0x15c>
  close(fd);
    250c:	eb00044b 	bl	3640 <close>
  if(chdir("dirfile") == 0){
    2510:	e3040f70 	movw	r0, #20336	; 0x4f70
    2514:	e3400000 	movt	r0, #0
    2518:	eb0004bd 	bl	3814 <chdir>
    251c:	e3500000 	cmp	r0, #0
    2520:	0a00003f 	beq	2624 <dirfile+0x148>
  fd = open("dirfile/xx", 0);
    2524:	e3040fac 	movw	r0, #20396	; 0x4fac
    2528:	e3a01000 	mov	r1, #0
    252c:	e3400000 	movt	r0, #0
    2530:	eb000469 	bl	36dc <open>
  if(fd >= 0){
    2534:	e3500000 	cmp	r0, #0
    2538:	aa000034 	bge	2610 <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    253c:	e3040fac 	movw	r0, #20396	; 0x4fac
    2540:	e3a01c02 	mov	r1, #512	; 0x200
    2544:	e3400000 	movt	r0, #0
    2548:	eb000463 	bl	36dc <open>
  if(fd >= 0){
    254c:	e3500000 	cmp	r0, #0
    2550:	aa00002e 	bge	2610 <dirfile+0x134>
  if(mkdir("dirfile/xx") == 0){
    2554:	e3040fac 	movw	r0, #20396	; 0x4fac
    2558:	e3400000 	movt	r0, #0
    255c:	eb00049f 	bl	37e0 <mkdir>
    2560:	e3500000 	cmp	r0, #0
    2564:	0a000051 	beq	26b0 <dirfile+0x1d4>
  if(unlink("dirfile/xx") == 0){
    2568:	e3040fac 	movw	r0, #20396	; 0x4fac
    256c:	e3400000 	movt	r0, #0
    2570:	eb000473 	bl	3744 <unlink>
    2574:	e3500000 	cmp	r0, #0
    2578:	0a000047 	beq	269c <dirfile+0x1c0>
  if(link("README", "dirfile/xx") == 0){
    257c:	e3041fac 	movw	r1, #20396	; 0x4fac
    2580:	e3050018 	movw	r0, #20504	; 0x5018
    2584:	e3401000 	movt	r1, #0
    2588:	e3400000 	movt	r0, #0
    258c:	eb000486 	bl	37ac <link>
    2590:	e3500000 	cmp	r0, #0
    2594:	0a00003b 	beq	2688 <dirfile+0x1ac>
  if(unlink("dirfile") != 0){
    2598:	e3040f70 	movw	r0, #20336	; 0x4f70
    259c:	e3400000 	movt	r0, #0
    25a0:	eb000467 	bl	3744 <unlink>
    25a4:	e2504000 	subs	r4, r0, #0
    25a8:	1a000031 	bne	2674 <dirfile+0x198>
  fd = open(".", O_RDWR);
    25ac:	e3040558 	movw	r0, #17752	; 0x4558
    25b0:	e3a01002 	mov	r1, #2
    25b4:	e3400000 	movt	r0, #0
    25b8:	eb000447 	bl	36dc <open>
  if(fd >= 0){
    25bc:	e3500000 	cmp	r0, #0
    25c0:	aa000026 	bge	2660 <dirfile+0x184>
  fd = open(".", 0);
    25c4:	e1a01004 	mov	r1, r4
    25c8:	e3040558 	movw	r0, #17752	; 0x4558
    25cc:	e3400000 	movt	r0, #0
    25d0:	eb000441 	bl	36dc <open>
  if(write(fd, "x", 1) > 0){
    25d4:	e3041ab8 	movw	r1, #19128	; 0x4ab8
    25d8:	e3a02001 	mov	r2, #1
    25dc:	e3401000 	movt	r1, #0
  fd = open(".", 0);
    25e0:	e1a04000 	mov	r4, r0
  if(write(fd, "x", 1) > 0){
    25e4:	eb000408 	bl	360c <write>
    25e8:	e3500000 	cmp	r0, #0
    25ec:	ca000016 	bgt	264c <dirfile+0x170>
  close(fd);
    25f0:	e1a00004 	mov	r0, r4
    25f4:	eb000411 	bl	3640 <close>
  printf(1, "dir vs file OK\n");
    25f8:	e305108c 	movw	r1, #20620	; 0x508c
    25fc:	e3a00001 	mov	r0, #1
    2600:	e3401000 	movt	r1, #0
}
    2604:	e24bd00c 	sub	sp, fp, #12
    2608:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "dir vs file OK\n");
    260c:	ea000516 	b	3a6c <printf>
    printf(1, "create dirfile/xx succeeded!\n");
    2610:	e3041fb8 	movw	r1, #20408	; 0x4fb8
    2614:	e3a00001 	mov	r0, #1
    2618:	e3401000 	movt	r1, #0
    261c:	eb000512 	bl	3a6c <printf>
    exit();
    2620:	eb0003c5 	bl	353c <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2624:	e3041f90 	movw	r1, #20368	; 0x4f90
    2628:	e3a00001 	mov	r0, #1
    262c:	e3401000 	movt	r1, #0
    2630:	eb00050d 	bl	3a6c <printf>
    exit();
    2634:	eb0003c0 	bl	353c <exit>
    printf(1, "create dirfile failed\n");
    2638:	e3041f78 	movw	r1, #20344	; 0x4f78
    263c:	e3a00001 	mov	r0, #1
    2640:	e3401000 	movt	r1, #0
    2644:	eb000508 	bl	3a6c <printf>
    exit();
    2648:	eb0003bb 	bl	353c <exit>
    printf(1, "write . succeeded!\n");
    264c:	e3051078 	movw	r1, #20600	; 0x5078
    2650:	e3a00001 	mov	r0, #1
    2654:	e3401000 	movt	r1, #0
    2658:	eb000503 	bl	3a6c <printf>
    exit();
    265c:	eb0003b6 	bl	353c <exit>
    printf(1, "open . for writing succeeded!\n");
    2660:	e3051058 	movw	r1, #20568	; 0x5058
    2664:	e3a00001 	mov	r0, #1
    2668:	e3401000 	movt	r1, #0
    266c:	eb0004fe 	bl	3a6c <printf>
    exit();
    2670:	eb0003b1 	bl	353c <exit>
    printf(1, "unlink dirfile failed!\n");
    2674:	e3051040 	movw	r1, #20544	; 0x5040
    2678:	e3a00001 	mov	r0, #1
    267c:	e3401000 	movt	r1, #0
    2680:	eb0004f9 	bl	3a6c <printf>
    exit();
    2684:	eb0003ac 	bl	353c <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2688:	e3051020 	movw	r1, #20512	; 0x5020
    268c:	e3a00001 	mov	r0, #1
    2690:	e3401000 	movt	r1, #0
    2694:	eb0004f4 	bl	3a6c <printf>
    exit();
    2698:	eb0003a7 	bl	353c <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    269c:	e3041ff8 	movw	r1, #20472	; 0x4ff8
    26a0:	e3a00001 	mov	r0, #1
    26a4:	e3401000 	movt	r1, #0
    26a8:	eb0004ef 	bl	3a6c <printf>
    exit();
    26ac:	eb0003a2 	bl	353c <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    26b0:	e3041fd8 	movw	r1, #20440	; 0x4fd8
    26b4:	e3a00001 	mov	r0, #1
    26b8:	e3401000 	movt	r1, #0
    26bc:	eb0004ea 	bl	3a6c <printf>
    exit();
    26c0:	eb00039d 	bl	353c <exit>

000026c4 <iref>:
{
    26c4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name\n");
    26c8:	e305109c 	movw	r1, #20636	; 0x509c
{
    26cc:	e28db014 	add	fp, sp, #20
  printf(1, "empty file name\n");
    26d0:	e3a00001 	mov	r0, #1
    26d4:	e3401000 	movt	r1, #0
    if(mkdir("irefd") != 0){
    26d8:	e30560b0 	movw	r6, #20656	; 0x50b0
  printf(1, "empty file name\n");
    26dc:	eb0004e2 	bl	3a6c <printf>
    mkdir("");
    26e0:	e3044e78 	movw	r4, #20088	; 0x4e78
    link("README", "");
    26e4:	e3057018 	movw	r7, #20504	; 0x5018
    if(mkdir("irefd") != 0){
    26e8:	e3406000 	movt	r6, #0
    mkdir("");
    26ec:	e3404000 	movt	r4, #0
    link("README", "");
    26f0:	e3407000 	movt	r7, #0
  printf(1, "empty file name\n");
    26f4:	e3a05033 	mov	r5, #51	; 0x33
    if(mkdir("irefd") != 0){
    26f8:	e1a00006 	mov	r0, r6
    26fc:	eb000437 	bl	37e0 <mkdir>
    2700:	e3500000 	cmp	r0, #0
    2704:	1a000023 	bne	2798 <iref+0xd4>
    if(chdir("irefd") != 0){
    2708:	e1a00006 	mov	r0, r6
    270c:	eb000440 	bl	3814 <chdir>
    2710:	e3500000 	cmp	r0, #0
    2714:	1a000024 	bne	27ac <iref+0xe8>
    mkdir("");
    2718:	e1a00004 	mov	r0, r4
    271c:	eb00042f 	bl	37e0 <mkdir>
    link("README", "");
    2720:	e1a01004 	mov	r1, r4
    2724:	e1a00007 	mov	r0, r7
    2728:	eb00041f 	bl	37ac <link>
    fd = open("", O_CREATE);
    272c:	e3a01c02 	mov	r1, #512	; 0x200
    2730:	e1a00004 	mov	r0, r4
    2734:	eb0003e8 	bl	36dc <open>
    if(fd >= 0)
    2738:	e3500000 	cmp	r0, #0
    273c:	ba000000 	blt	2744 <iref+0x80>
      close(fd);
    2740:	eb0003be 	bl	3640 <close>
    fd = open("xx", O_CREATE);
    2744:	e3040fb4 	movw	r0, #20404	; 0x4fb4
    2748:	e3a01c02 	mov	r1, #512	; 0x200
    274c:	e3400000 	movt	r0, #0
    2750:	eb0003e1 	bl	36dc <open>
    if(fd >= 0)
    2754:	e3500000 	cmp	r0, #0
    2758:	ba000000 	blt	2760 <iref+0x9c>
      close(fd);
    275c:	eb0003b7 	bl	3640 <close>
    unlink("xx");
    2760:	e3040fb4 	movw	r0, #20404	; 0x4fb4
    2764:	e3400000 	movt	r0, #0
    2768:	eb0003f5 	bl	3744 <unlink>
  for(i = 0; i < 50 + 1; i++){
    276c:	e2555001 	subs	r5, r5, #1
    2770:	1affffe0 	bne	26f8 <iref+0x34>
  chdir("/");
    2774:	e3040ee8 	movw	r0, #20200	; 0x4ee8
    2778:	e3400000 	movt	r0, #0
    277c:	eb000424 	bl	3814 <chdir>
  printf(1, "empty file name OK\n");
    2780:	e30510e0 	movw	r1, #20704	; 0x50e0
    2784:	e3a00001 	mov	r0, #1
    2788:	e3401000 	movt	r1, #0
}
    278c:	e24bd014 	sub	sp, fp, #20
    2790:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(1, "empty file name OK\n");
    2794:	ea0004b4 	b	3a6c <printf>
      printf(1, "mkdir irefd failed\n");
    2798:	e30510b8 	movw	r1, #20664	; 0x50b8
    279c:	e3a00001 	mov	r0, #1
    27a0:	e3401000 	movt	r1, #0
    27a4:	eb0004b0 	bl	3a6c <printf>
      exit();
    27a8:	eb000363 	bl	353c <exit>
      printf(1, "chdir irefd failed\n");
    27ac:	e30510cc 	movw	r1, #20684	; 0x50cc
    27b0:	e3a00001 	mov	r0, #1
    27b4:	e3401000 	movt	r1, #0
    27b8:	eb0004ab 	bl	3a6c <printf>
      exit();
    27bc:	eb00035e 	bl	353c <exit>

000027c0 <forktest>:
{
    27c0:	e92d4830 	push	{r4, r5, fp, lr}
  printf(1, "fork test\n");
    27c4:	e30510f4 	movw	r1, #20724	; 0x50f4
{
    27c8:	e28db00c 	add	fp, sp, #12
  printf(1, "fork test\n");
    27cc:	e3a00001 	mov	r0, #1
    27d0:	e3401000 	movt	r1, #0
  for(n=0; n<1000; n++){
    27d4:	e3a04000 	mov	r4, #0
  printf(1, "fork test\n");
    27d8:	eb0004a3 	bl	3a6c <printf>
    27dc:	ea000003 	b	27f0 <forktest+0x30>
    if(pid == 0)
    27e0:	0a00001e 	beq	2860 <forktest+0xa0>
  for(n=0; n<1000; n++){
    27e4:	e2844001 	add	r4, r4, #1
    27e8:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    27ec:	0a000012 	beq	283c <forktest+0x7c>
    pid = fork();
    27f0:	eb000344 	bl	3508 <fork>
    if(pid < 0)
    27f4:	e3500000 	cmp	r0, #0
    27f8:	aafffff8 	bge	27e0 <forktest+0x20>
  for(; n > 0; n--){
    27fc:	e3540000 	cmp	r4, #0
    2800:	0a000004 	beq	2818 <forktest+0x58>
    if(wait() < 0){
    2804:	eb000359 	bl	3570 <wait>
    2808:	e3500000 	cmp	r0, #0
    280c:	ba00000f 	blt	2850 <forktest+0x90>
  for(; n > 0; n--){
    2810:	e2544001 	subs	r4, r4, #1
    2814:	1afffffa 	bne	2804 <forktest+0x44>
  if(wait() != -1){
    2818:	eb000354 	bl	3570 <wait>
    281c:	e3700001 	cmn	r0, #1
    2820:	1a00000f 	bne	2864 <forktest+0xa4>
  printf(1, "fork test OK\n");
    2824:	e3051128 	movw	r1, #20776	; 0x5128
    2828:	e3a00001 	mov	r0, #1
    282c:	e3401000 	movt	r1, #0
}
    2830:	e24bd00c 	sub	sp, fp, #12
    2834:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(1, "fork test OK\n");
    2838:	ea00048b 	b	3a6c <printf>
    printf(1, "fork claimed to work 1000 times!\n");
    283c:	e3051138 	movw	r1, #20792	; 0x5138
    2840:	e3a00001 	mov	r0, #1
    2844:	e3401000 	movt	r1, #0
    2848:	eb000487 	bl	3a6c <printf>
    exit();
    284c:	eb00033a 	bl	353c <exit>
      printf(1, "wait stopped early\n");
    2850:	e3051100 	movw	r1, #20736	; 0x5100
    2854:	e3a00001 	mov	r0, #1
    2858:	e3401000 	movt	r1, #0
    285c:	eb000482 	bl	3a6c <printf>
      exit();
    2860:	eb000335 	bl	353c <exit>
    printf(1, "wait got too many\n");
    2864:	e3051114 	movw	r1, #20756	; 0x5114
    2868:	e3a00001 	mov	r0, #1
    286c:	e3401000 	movt	r1, #0
    2870:	eb00047d 	bl	3a6c <printf>
    exit();
    2874:	eb000330 	bl	353c <exit>

00002878 <sbrktest>:
{
    2878:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  printf(stdout, "sbrk test\n");
    287c:	e30577e0 	movw	r7, #22496	; 0x57e0
    2880:	e3407000 	movt	r7, #0
{
    2884:	e28db01c 	add	fp, sp, #28
  for(i = 0; i < 5000; i++){ 
    2888:	e3a05000 	mov	r5, #0
{
    288c:	e24dd028 	sub	sp, sp, #40	; 0x28
  printf(stdout, "sbrk test\n");
    2890:	e305115c 	movw	r1, #20828	; 0x515c
    2894:	e3401000 	movt	r1, #0
    2898:	e5970000 	ldr	r0, [r7]
    289c:	eb000472 	bl	3a6c <printf>
  oldbrk = sbrk(0);
    28a0:	e1a00005 	mov	r0, r5
    28a4:	eb000401 	bl	38b0 <sbrk>
  printf(stdout, "test #1 sbrk() less than a page?\n");
    28a8:	e3051168 	movw	r1, #20840	; 0x5168
    28ac:	e3401000 	movt	r1, #0
    b = sbrk(1);
    28b0:	e3a09001 	mov	r9, #1
  for(i = 0; i < 5000; i++){ 
    28b4:	e3016388 	movw	r6, #5000	; 0x1388
  oldbrk = sbrk(0);
    28b8:	e1a08000 	mov	r8, r0
  printf(stdout, "test #1 sbrk() less than a page?\n");
    28bc:	e5970000 	ldr	r0, [r7]
    28c0:	eb000469 	bl	3a6c <printf>
  a = sbrk(0);
    28c4:	e1a00005 	mov	r0, r5
    28c8:	eb0003f8 	bl	38b0 <sbrk>
    28cc:	e1a04000 	mov	r4, r0
    28d0:	ea000000 	b	28d8 <sbrktest+0x60>
    a = b + 1;
    28d4:	e1a04001 	mov	r4, r1
    b = sbrk(1);
    28d8:	e3a00001 	mov	r0, #1
    28dc:	eb0003f3 	bl	38b0 <sbrk>
    if(b != a){
    28e0:	e1500004 	cmp	r0, r4
    28e4:	1a0000f6 	bne	2cc4 <sbrktest+0x44c>
  for(i = 0; i < 5000; i++){ 
    28e8:	e2855001 	add	r5, r5, #1
    *b = 1;
    28ec:	e1a01004 	mov	r1, r4
  for(i = 0; i < 5000; i++){ 
    28f0:	e1550006 	cmp	r5, r6
    *b = 1;
    28f4:	e4c19001 	strb	r9, [r1], #1
  for(i = 0; i < 5000; i++){ 
    28f8:	1afffff5 	bne	28d4 <sbrktest+0x5c>
  printf(stdout, "test #1 done.\n");
    28fc:	e5970000 	ldr	r0, [r7]
    2900:	e30511a8 	movw	r1, #20904	; 0x51a8
    2904:	e3401000 	movt	r1, #0
    2908:	eb000457 	bl	3a6c <printf>
  printf(stdout, "test #2 test fork?\n");
    290c:	e5970000 	ldr	r0, [r7]
    2910:	e30511b8 	movw	r1, #20920	; 0x51b8
    2914:	e3401000 	movt	r1, #0
    2918:	eb000453 	bl	3a6c <printf>
  pid = fork();
    291c:	eb0002f9 	bl	3508 <fork>
  if(pid < 0){
    2920:	e2505000 	subs	r5, r0, #0
    2924:	ba0000ef 	blt	2ce8 <sbrktest+0x470>
  printf(stdout, "test #2 done.\n");
    2928:	e5970000 	ldr	r0, [r7]
    292c:	e30511e4 	movw	r1, #20964	; 0x51e4
    2930:	e3401000 	movt	r1, #0
  if(c != a + 1){
    2934:	e2844002 	add	r4, r4, #2
  printf(stdout, "test #2 done.\n");
    2938:	eb00044b 	bl	3a6c <printf>
  printf(stdout, "test #3 post-fork.\n");
    293c:	e5970000 	ldr	r0, [r7]
    2940:	e30511f4 	movw	r1, #20980	; 0x51f4
    2944:	e3401000 	movt	r1, #0
    2948:	eb000447 	bl	3a6c <printf>
  c = sbrk(1);
    294c:	e3a00001 	mov	r0, #1
    2950:	eb0003d6 	bl	38b0 <sbrk>
  c = sbrk(1);
    2954:	e3a00001 	mov	r0, #1
    2958:	eb0003d4 	bl	38b0 <sbrk>
  if(c != a + 1){
    295c:	e1540000 	cmp	r4, r0
    2960:	1a0000e5 	bne	2cfc <sbrktest+0x484>
  if(pid == 0)
    2964:	e3550000 	cmp	r5, #0
    2968:	0a0000ec 	beq	2d20 <sbrktest+0x4a8>
  wait();
    296c:	eb0002ff 	bl	3570 <wait>
  printf(stdout, "test #3 done.\n");
    2970:	e5970000 	ldr	r0, [r7]
    2974:	e3051224 	movw	r1, #21028	; 0x5224
    2978:	e3401000 	movt	r1, #0
    297c:	eb00043a 	bl	3a6c <printf>
  printf(stdout, "test #4 grow address space to something big.\n");
    2980:	e5970000 	ldr	r0, [r7]
    2984:	e3051234 	movw	r1, #21044	; 0x5234
    2988:	e3401000 	movt	r1, #0
    298c:	eb000436 	bl	3a6c <printf>
  a = sbrk(0);
    2990:	e3a00000 	mov	r0, #0
    2994:	eb0003c5 	bl	38b0 <sbrk>
    2998:	e1a04000 	mov	r4, r0
  p = sbrk(amt);
    299c:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    29a0:	eb0003c2 	bl	38b0 <sbrk>
  if (p != a) { 
    29a4:	e1540000 	cmp	r4, r0
    29a8:	1a0000d8 	bne	2d10 <sbrktest+0x498>
  *lastaddr = 99;
    29ac:	e30f3fff 	movw	r3, #65535	; 0xffff
    29b0:	e340363f 	movt	r3, #1599	; 0x63f
    29b4:	e3a02063 	mov	r2, #99	; 0x63
  printf(stdout, "test #4 done.\n");
    29b8:	e30512a4 	movw	r1, #21156	; 0x52a4
  *lastaddr = 99;
    29bc:	e5c32000 	strb	r2, [r3]
  printf(stdout, "test #4 done.\n");
    29c0:	e3401000 	movt	r1, #0
    29c4:	e5970000 	ldr	r0, [r7]
    29c8:	eb000427 	bl	3a6c <printf>
  printf(stdout, "test #5 de-allocate\n");
    29cc:	e5970000 	ldr	r0, [r7]
    29d0:	e30512b4 	movw	r1, #21172	; 0x52b4
    29d4:	e3401000 	movt	r1, #0
    29d8:	eb000423 	bl	3a6c <printf>
  a = sbrk(0);
    29dc:	e3a00000 	mov	r0, #0
    29e0:	eb0003b2 	bl	38b0 <sbrk>
    29e4:	e1a04000 	mov	r4, r0
  c = sbrk(-4096);
    29e8:	e3a00a0f 	mov	r0, #61440	; 0xf000
    29ec:	e34f0fff 	movt	r0, #65535	; 0xffff
    29f0:	eb0003ae 	bl	38b0 <sbrk>
  if(c == (char*)0xffffffff){
    29f4:	e3700001 	cmn	r0, #1
    29f8:	0a0000c9 	beq	2d24 <sbrktest+0x4ac>
  c = sbrk(0);
    29fc:	e3a00000 	mov	r0, #0
    2a00:	eb0003aa 	bl	38b0 <sbrk>
  if(c != a - 4096){
    2a04:	e2442a01 	sub	r2, r4, #4096	; 0x1000
    2a08:	e1500002 	cmp	r0, r2
  c = sbrk(0);
    2a0c:	e1a03000 	mov	r3, r0
  if(c != a - 4096){
    2a10:	1a0000c8 	bne	2d38 <sbrktest+0x4c0>
  printf(stdout, "test #5 done.\n");
    2a14:	e5970000 	ldr	r0, [r7]
    2a18:	e3051320 	movw	r1, #21280	; 0x5320
    2a1c:	e3401000 	movt	r1, #0
    2a20:	eb000411 	bl	3a6c <printf>
  printf(stdout, "test #6 re-allocate page.\n");
    2a24:	e5970000 	ldr	r0, [r7]
    2a28:	e3051330 	movw	r1, #21296	; 0x5330
    2a2c:	e3401000 	movt	r1, #0
    2a30:	eb00040d 	bl	3a6c <printf>
  a = sbrk(0);
    2a34:	e3a00000 	mov	r0, #0
    2a38:	eb00039c 	bl	38b0 <sbrk>
    2a3c:	e1a04000 	mov	r4, r0
  c = sbrk(4096);
    2a40:	e3a00a01 	mov	r0, #4096	; 0x1000
    2a44:	eb000399 	bl	38b0 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2a48:	e1540000 	cmp	r4, r0
  c = sbrk(4096);
    2a4c:	e1a05000 	mov	r5, r0
  if(c != a || sbrk(0) != a + 4096){
    2a50:	1a0000be 	bne	2d50 <sbrktest+0x4d8>
    2a54:	e3a00000 	mov	r0, #0
    2a58:	eb000394 	bl	38b0 <sbrk>
    2a5c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    2a60:	e1530000 	cmp	r3, r0
    2a64:	1a0000b9 	bne	2d50 <sbrktest+0x4d8>
  if(*lastaddr == 99){
    2a68:	e30f3fff 	movw	r3, #65535	; 0xffff
    2a6c:	e340363f 	movt	r3, #1599	; 0x63f
    2a70:	e5d33000 	ldrb	r3, [r3]
    2a74:	e3530063 	cmp	r3, #99	; 0x63
    2a78:	0a0000bb 	beq	2d6c <sbrktest+0x4f4>
  printf(stdout, "test #6 done.\n");
    2a7c:	e5970000 	ldr	r0, [r7]
    2a80:	e30513a4 	movw	r1, #21412	; 0x53a4
    2a84:	e3401000 	movt	r1, #0
    2a88:	eb0003f7 	bl	3a6c <printf>
  printf(stdout, "test #7 downsize.\n");
    2a8c:	e5970000 	ldr	r0, [r7]
    2a90:	e30513b4 	movw	r1, #21428	; 0x53b4
    2a94:	e3401000 	movt	r1, #0
    2a98:	eb0003f3 	bl	3a6c <printf>
  a = sbrk(0);
    2a9c:	e3a00000 	mov	r0, #0
    2aa0:	eb000382 	bl	38b0 <sbrk>
    2aa4:	e1a04000 	mov	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2aa8:	e3a00000 	mov	r0, #0
    2aac:	eb00037f 	bl	38b0 <sbrk>
    2ab0:	e0480000 	sub	r0, r8, r0
    2ab4:	eb00037d 	bl	38b0 <sbrk>
  if(c != a){
    2ab8:	e1540000 	cmp	r4, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2abc:	e1a03000 	mov	r3, r0
  if(c != a){
    2ac0:	1a0000ae 	bne	2d80 <sbrktest+0x508>
  printf(stdout, "test #7 done.\n");
    2ac4:	e5970000 	ldr	r0, [r7]
    2ac8:	e30513ec 	movw	r1, #21484	; 0x53ec
    2acc:	e3401000 	movt	r1, #0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ad0:	e3085480 	movw	r5, #33920	; 0x8480
  printf(stdout, "test #7 done.\n");
    2ad4:	eb0003e4 	bl	3a6c <printf>
  printf(stdout, "test #8 read the kernel's memory.\n");
    2ad8:	e30513fc 	movw	r1, #21500	; 0x53fc
    2adc:	e5970000 	ldr	r0, [r7]
    2ae0:	e3401000 	movt	r1, #0
    2ae4:	eb0003e0 	bl	3a6c <printf>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ae8:	e348501e 	movt	r5, #32798	; 0x801e
    2aec:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
    2af0:	e30c9350 	movw	r9, #50000	; 0xc350
    ppid = getpid();
    2af4:	eb000360 	bl	387c <getpid>
    2af8:	e1a06000 	mov	r6, r0
    pid = fork();
    2afc:	eb000281 	bl	3508 <fork>
    if(pid < 0){
    2b00:	e3500000 	cmp	r0, #0
    2b04:	ba0000a3 	blt	2d98 <sbrktest+0x520>
    if(pid == 0){
    2b08:	0a0000a7 	beq	2dac <sbrktest+0x534>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b0c:	e0844009 	add	r4, r4, r9
    wait();
    2b10:	eb000296 	bl	3570 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b14:	e1540005 	cmp	r4, r5
    2b18:	1afffff5 	bne	2af4 <sbrktest+0x27c>
  printf(stdout, "test #8 done.\n");
    2b1c:	e5970000 	ldr	r0, [r7]
    2b20:	e305143c 	movw	r1, #21564	; 0x543c
    2b24:	e3401000 	movt	r1, #0
    2b28:	eb0003cf 	bl	3a6c <printf>
  printf(stdout, "test #9 clean up the last failed allocation\n");
    2b2c:	e5970000 	ldr	r0, [r7]
    2b30:	e305144c 	movw	r1, #21580	; 0x544c
    2b34:	e3401000 	movt	r1, #0
    2b38:	eb0003cb 	bl	3a6c <printf>
  if(pipe(fds) != 0){
    2b3c:	e24b0038 	sub	r0, fp, #56	; 0x38
    2b40:	eb000297 	bl	35a4 <pipe>
    2b44:	e2506000 	subs	r6, r0, #0
    2b48:	1a0000a0 	bne	2dd0 <sbrktest+0x558>
  printf(stdout, "test #9 done.\n");
    2b4c:	e5970000 	ldr	r0, [r7]
    2b50:	e305147c 	movw	r1, #21628	; 0x547c
    2b54:	e3401000 	movt	r1, #0
    2b58:	e24b5030 	sub	r5, fp, #48	; 0x30
    2b5c:	eb0003c2 	bl	3a6c <printf>
  printf(stdout, "test #10 memory utilization 1.\n");
    2b60:	e305148c 	movw	r1, #21644	; 0x548c
    2b64:	e5970000 	ldr	r0, [r7]
    2b68:	e3401000 	movt	r1, #0
    2b6c:	eb0003be 	bl	3a6c <printf>
    2b70:	e1a09005 	mov	r9, r5
    if((pids[i] = fork()) == 0){
    2b74:	eb000263 	bl	3508 <fork>
    2b78:	e3500000 	cmp	r0, #0
    2b7c:	e1a04000 	mov	r4, r0
    2b80:	e4890004 	str	r0, [r9], #4
    2b84:	0a000038 	beq	2c6c <sbrktest+0x3f4>
    if(pids[i] != -1)
    2b88:	e3700001 	cmn	r0, #1
    2b8c:	0a000003 	beq	2ba0 <sbrktest+0x328>
      read(fds[0], &scratch, 1);
    2b90:	e3a02001 	mov	r2, #1
    2b94:	e24b1039 	sub	r1, fp, #57	; 0x39
    2b98:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    2b9c:	eb00028d 	bl	35d8 <read>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2ba0:	e2866001 	add	r6, r6, #1
    2ba4:	e3560005 	cmp	r6, #5
    2ba8:	1afffff1 	bne	2b74 <sbrktest+0x2fc>
  printf(stdout, "test #10 done.\n");
    2bac:	e5970000 	ldr	r0, [r7]
    2bb0:	e30514bc 	movw	r1, #21692	; 0x54bc
    2bb4:	e3401000 	movt	r1, #0
    2bb8:	e24b401c 	sub	r4, fp, #28
    2bbc:	eb0003aa 	bl	3a6c <printf>
  printf(stdout, "test #11 memory utilization 2.\n");
    2bc0:	e5970000 	ldr	r0, [r7]
    2bc4:	e30514cc 	movw	r1, #21708	; 0x54cc
    2bc8:	e3401000 	movt	r1, #0
    2bcc:	eb0003a6 	bl	3a6c <printf>
  c = sbrk(4096);
    2bd0:	e3a00a01 	mov	r0, #4096	; 0x1000
    2bd4:	eb000335 	bl	38b0 <sbrk>
    2bd8:	e1a06000 	mov	r6, r0
    if(pids[i] == -1)
    2bdc:	e4950004 	ldr	r0, [r5], #4
    2be0:	e3700001 	cmn	r0, #1
    2be4:	0a000001 	beq	2bf0 <sbrktest+0x378>
    kill(pids[i]);
    2be8:	eb0002a1 	bl	3674 <kill>
    wait();
    2bec:	eb00025f 	bl	3570 <wait>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2bf0:	e1540005 	cmp	r4, r5
    2bf4:	1afffff8 	bne	2bdc <sbrktest+0x364>
  printf(stdout, "test #11 done.\n");
    2bf8:	e5970000 	ldr	r0, [r7]
    2bfc:	e30514ec 	movw	r1, #21740	; 0x54ec
    2c00:	e3401000 	movt	r1, #0
    2c04:	eb000398 	bl	3a6c <printf>
  printf(stdout, "test #12 leaked memory.\n");
    2c08:	e30514fc 	movw	r1, #21756	; 0x54fc
    2c0c:	e5970000 	ldr	r0, [r7]
    2c10:	e3401000 	movt	r1, #0
    2c14:	eb000394 	bl	3a6c <printf>
  if(c == (char*)0xffffffff){
    2c18:	e3760001 	cmn	r6, #1
    2c1c:	0a000023 	beq	2cb0 <sbrktest+0x438>
  printf(stdout, "test #12 done.\n");
    2c20:	e5970000 	ldr	r0, [r7]
    2c24:	e3051534 	movw	r1, #21812	; 0x5534
    2c28:	e3401000 	movt	r1, #0
    2c2c:	eb00038e 	bl	3a6c <printf>
  if(sbrk(0) > oldbrk)
    2c30:	e3a00000 	mov	r0, #0
    2c34:	eb00031d 	bl	38b0 <sbrk>
    2c38:	e1580000 	cmp	r8, r0
    2c3c:	3a000005 	bcc	2c58 <sbrktest+0x3e0>
  printf(stdout, "sbrk test OK\n");
    2c40:	e5970000 	ldr	r0, [r7]
    2c44:	e3051544 	movw	r1, #21828	; 0x5544
    2c48:	e3401000 	movt	r1, #0
    2c4c:	eb000386 	bl	3a6c <printf>
}
    2c50:	e24bd01c 	sub	sp, fp, #28
    2c54:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    sbrk(-(sbrk(0) - oldbrk));
    2c58:	e3a00000 	mov	r0, #0
    2c5c:	eb000313 	bl	38b0 <sbrk>
    2c60:	e0480000 	sub	r0, r8, r0
    2c64:	eb000311 	bl	38b0 <sbrk>
    2c68:	eafffff4 	b	2c40 <sbrktest+0x3c8>
      printf(stdout, "create pid:%d.\n",i);
    2c6c:	e1a02006 	mov	r2, r6
    2c70:	e5970000 	ldr	r0, [r7]
    2c74:	e30514ac 	movw	r1, #21676	; 0x54ac
    2c78:	e3401000 	movt	r1, #0
    2c7c:	eb00037a 	bl	3a6c <printf>
      sbrk(BIG - (uint)sbrk(0));
    2c80:	e1a00004 	mov	r0, r4
    2c84:	eb000309 	bl	38b0 <sbrk>
    2c88:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2c8c:	eb000307 	bl	38b0 <sbrk>
      write(fds[1], "x", 1);
    2c90:	e3041ab8 	movw	r1, #19128	; 0x4ab8
    2c94:	e3a02001 	mov	r2, #1
    2c98:	e3401000 	movt	r1, #0
    2c9c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    2ca0:	eb000259 	bl	360c <write>
      for(;;) sleep(1000);
    2ca4:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    2ca8:	eb00030d 	bl	38e4 <sleep>
    2cac:	eafffffc 	b	2ca4 <sbrktest+0x42c>
    printf(stdout, "failed sbrk leaked memory\n");
    2cb0:	e5970000 	ldr	r0, [r7]
    2cb4:	e3051518 	movw	r1, #21784	; 0x5518
    2cb8:	e3401000 	movt	r1, #0
    2cbc:	eb00036a 	bl	3a6c <printf>
    exit();
    2cc0:	eb00021d 	bl	353c <exit>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2cc4:	e597c000 	ldr	ip, [r7]
    2cc8:	e1a03004 	mov	r3, r4
    2ccc:	e58d0000 	str	r0, [sp]
    2cd0:	e1a02005 	mov	r2, r5
    2cd4:	e305118c 	movw	r1, #20876	; 0x518c
    2cd8:	e3401000 	movt	r1, #0
    2cdc:	e1a0000c 	mov	r0, ip
    2ce0:	eb000361 	bl	3a6c <printf>
      exit();
    2ce4:	eb000214 	bl	353c <exit>
    printf(stdout, "sbrk test fork failed\n");
    2ce8:	e5970000 	ldr	r0, [r7]
    2cec:	e30511cc 	movw	r1, #20940	; 0x51cc
    2cf0:	e3401000 	movt	r1, #0
    2cf4:	eb00035c 	bl	3a6c <printf>
    exit();
    2cf8:	eb00020f 	bl	353c <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2cfc:	e5970000 	ldr	r0, [r7]
    2d00:	e3051208 	movw	r1, #21000	; 0x5208
    2d04:	e3401000 	movt	r1, #0
    2d08:	eb000357 	bl	3a6c <printf>
    exit();
    2d0c:	eb00020a 	bl	353c <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2d10:	e3051264 	movw	r1, #21092	; 0x5264
    2d14:	e5970000 	ldr	r0, [r7]
    2d18:	e3401000 	movt	r1, #0
    2d1c:	eb000352 	bl	3a6c <printf>
    exit();
    2d20:	eb000205 	bl	353c <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2d24:	e5970000 	ldr	r0, [r7]
    2d28:	e30512cc 	movw	r1, #21196	; 0x52cc
    2d2c:	e3401000 	movt	r1, #0
    2d30:	eb00034d 	bl	3a6c <printf>
    exit();
    2d34:	eb000200 	bl	353c <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2d38:	e1a02004 	mov	r2, r4
    2d3c:	e5970000 	ldr	r0, [r7]
    2d40:	e30512e8 	movw	r1, #21224	; 0x52e8
    2d44:	e3401000 	movt	r1, #0
    2d48:	eb000347 	bl	3a6c <printf>
    exit();
    2d4c:	eb0001fa 	bl	353c <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2d50:	e1a03005 	mov	r3, r5
    2d54:	e1a02004 	mov	r2, r4
    2d58:	e5970000 	ldr	r0, [r7]
    2d5c:	e305134c 	movw	r1, #21324	; 0x534c
    2d60:	e3401000 	movt	r1, #0
    2d64:	eb000340 	bl	3a6c <printf>
    exit();
    2d68:	eb0001f3 	bl	353c <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2d6c:	e5970000 	ldr	r0, [r7]
    2d70:	e3051374 	movw	r1, #21364	; 0x5374
    2d74:	e3401000 	movt	r1, #0
    2d78:	eb00033b 	bl	3a6c <printf>
    exit();
    2d7c:	eb0001ee 	bl	353c <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2d80:	e1a02004 	mov	r2, r4
    2d84:	e5970000 	ldr	r0, [r7]
    2d88:	e30513c8 	movw	r1, #21448	; 0x53c8
    2d8c:	e3401000 	movt	r1, #0
    2d90:	eb000335 	bl	3a6c <printf>
    exit();
    2d94:	eb0001e8 	bl	353c <exit>
      printf(stdout, "fork failed\n");
    2d98:	e5970000 	ldr	r0, [r7]
    2d9c:	e30516e4 	movw	r1, #22244	; 0x56e4
    2da0:	e3401000 	movt	r1, #0
    2da4:	eb000330 	bl	3a6c <printf>
      exit();
    2da8:	eb0001e3 	bl	353c <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2dac:	e5970000 	ldr	r0, [r7]
    2db0:	e1a02004 	mov	r2, r4
    2db4:	e5d43000 	ldrb	r3, [r4]
    2db8:	e3051420 	movw	r1, #21536	; 0x5420
    2dbc:	e3401000 	movt	r1, #0
    2dc0:	eb000329 	bl	3a6c <printf>
      kill(ppid);
    2dc4:	e1a00006 	mov	r0, r6
    2dc8:	eb000229 	bl	3674 <kill>
      exit();
    2dcc:	eb0001da 	bl	353c <exit>
    printf(1, "pipe() failed\n");
    2dd0:	e30410e8 	movw	r1, #16616	; 0x40e8
    2dd4:	e3a00001 	mov	r0, #1
    2dd8:	e3401000 	movt	r1, #0
    2ddc:	eb000322 	bl	3a6c <printf>
    exit();
    2de0:	eb0001d5 	bl	353c <exit>

00002de4 <validateint>:
{
    2de4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2de8:	e28db000 	add	fp, sp, #0
    sleep(*p);
    2dec:	e5900000 	ldr	r0, [r0]
}
    2df0:	e28bd000 	add	sp, fp, #0
    2df4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    sleep(*p);
    2df8:	ea0002b9 	b	38e4 <sleep>

00002dfc <validatetest>:
{
    2dfc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate test\n");
    2e00:	e30577e0 	movw	r7, #22496	; 0x57e0
    2e04:	e3407000 	movt	r7, #0
{
    2e08:	e28db014 	add	fp, sp, #20
  printf(stdout, "validate test\n");
    2e0c:	e3051554 	movw	r1, #21844	; 0x5554
    2e10:	e3401000 	movt	r1, #0
    2e14:	e5970000 	ldr	r0, [r7]
    if(link("nosuchfile", (char*)p) != -1){
    2e18:	e3056564 	movw	r6, #21860	; 0x5564
  printf(stdout, "validate test\n");
    2e1c:	eb000312 	bl	3a6c <printf>
    if(link("nosuchfile", (char*)p) != -1){
    2e20:	e3406000 	movt	r6, #0
  for(p = 0; p <= (uint)hi; p += 4096){
    2e24:	e3a04000 	mov	r4, #0
    if((pid = fork()) == 0){
    2e28:	eb0001b6 	bl	3508 <fork>
    2e2c:	e2505000 	subs	r5, r0, #0
    2e30:	0a000014 	beq	2e88 <validatetest+0x8c>
    sleep(0);
    2e34:	e3a00000 	mov	r0, #0
    2e38:	eb0002a9 	bl	38e4 <sleep>
    sleep(0);
    2e3c:	e3a00000 	mov	r0, #0
    2e40:	eb0002a7 	bl	38e4 <sleep>
    kill(pid);
    2e44:	e1a00005 	mov	r0, r5
    2e48:	eb000209 	bl	3674 <kill>
    wait();
    2e4c:	eb0001c7 	bl	3570 <wait>
    if(link("nosuchfile", (char*)p) != -1){
    2e50:	e1a01004 	mov	r1, r4
    2e54:	e1a00006 	mov	r0, r6
    2e58:	eb000253 	bl	37ac <link>
    2e5c:	e3700001 	cmn	r0, #1
    2e60:	1a00000b 	bne	2e94 <validatetest+0x98>
  for(p = 0; p <= (uint)hi; p += 4096){
    2e64:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2e68:	e3540945 	cmp	r4, #1130496	; 0x114000
    2e6c:	1affffed 	bne	2e28 <validatetest+0x2c>
  printf(stdout, "validate ok\n");
    2e70:	e5970000 	ldr	r0, [r7]
    2e74:	e305158c 	movw	r1, #21900	; 0x558c
    2e78:	e3401000 	movt	r1, #0
}
    2e7c:	e24bd014 	sub	sp, fp, #20
    2e80:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  printf(stdout, "validate ok\n");
    2e84:	ea0002f8 	b	3a6c <printf>
    sleep(*p);
    2e88:	e5940000 	ldr	r0, [r4]
    2e8c:	eb000294 	bl	38e4 <sleep>
      exit();
    2e90:	eb0001a9 	bl	353c <exit>
      printf(stdout, "link should not succeed\n");
    2e94:	e5970000 	ldr	r0, [r7]
    2e98:	e3051570 	movw	r1, #21872	; 0x5570
    2e9c:	e3401000 	movt	r1, #0
    2ea0:	eb0002f1 	bl	3a6c <printf>
      exit();
    2ea4:	eb0001a4 	bl	353c <exit>

00002ea8 <bsstest>:
{
    2ea8:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "bss test\n");
    2eac:	e30547e0 	movw	r4, #22496	; 0x57e0
    2eb0:	e3404000 	movt	r4, #0
{
    2eb4:	e28db00c 	add	fp, sp, #12
  printf(stdout, "bss test\n");
    2eb8:	e305159c 	movw	r1, #21916	; 0x559c
    2ebc:	e3401000 	movt	r1, #0
    2ec0:	e5940000 	ldr	r0, [r4]
    2ec4:	eb0002e8 	bl	3a6c <printf>
    if(uninit[i] != '\0'){
    2ec8:	e3053888 	movw	r3, #22664	; 0x5888
    2ecc:	e3403000 	movt	r3, #0
    2ed0:	e5d32000 	ldrb	r2, [r3]
    2ed4:	e3520000 	cmp	r2, #0
    2ed8:	1a00000b 	bne	2f0c <bsstest+0x64>
    2edc:	e59f103c 	ldr	r1, [pc, #60]	; 2f20 <bsstest+0x78>
    2ee0:	e5f32001 	ldrb	r2, [r3, #1]!
    2ee4:	e3520000 	cmp	r2, #0
    2ee8:	1a000007 	bne	2f0c <bsstest+0x64>
  for(i = 0; i < sizeof(uninit); i++){
    2eec:	e1530001 	cmp	r3, r1
    2ef0:	1afffffa 	bne	2ee0 <bsstest+0x38>
  printf(stdout, "bss test ok\n");
    2ef4:	e5940000 	ldr	r0, [r4]
    2ef8:	e30515bc 	movw	r1, #21948	; 0x55bc
    2efc:	e3401000 	movt	r1, #0
}
    2f00:	e24bd00c 	sub	sp, fp, #12
    2f04:	e8bd4830 	pop	{r4, r5, fp, lr}
  printf(stdout, "bss test ok\n");
    2f08:	ea0002d7 	b	3a6c <printf>
      printf(stdout, "bss test failed\n");
    2f0c:	e5940000 	ldr	r0, [r4]
    2f10:	e30515a8 	movw	r1, #21928	; 0x55a8
    2f14:	e3401000 	movt	r1, #0
    2f18:	eb0002d3 	bl	3a6c <printf>
      exit();
    2f1c:	eb000186 	bl	353c <exit>
    2f20:	00007f97 	.word	0x00007f97

00002f24 <bigargtest>:
{
    2f24:	e92d4830 	push	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2f28:	e30505cc 	movw	r0, #21964	; 0x55cc
{
    2f2c:	e28db00c 	add	fp, sp, #12
  unlink("bigarg-ok");
    2f30:	e3400000 	movt	r0, #0
    2f34:	eb000202 	bl	3744 <unlink>
  pid = fork();
    2f38:	eb000172 	bl	3508 <fork>
  if(pid == 0){
    2f3c:	e3500000 	cmp	r0, #0
    2f40:	0a00000d 	beq	2f7c <bigargtest+0x58>
  } else if(pid < 0){
    2f44:	ba000032 	blt	3014 <bigargtest+0xf0>
  wait();
    2f48:	eb000188 	bl	3570 <wait>
  fd = open("bigarg-ok", 0);
    2f4c:	e30505cc 	movw	r0, #21964	; 0x55cc
    2f50:	e3a01000 	mov	r1, #0
    2f54:	e3400000 	movt	r0, #0
    2f58:	eb0001df 	bl	36dc <open>
  if(fd < 0){
    2f5c:	e3500000 	cmp	r0, #0
    2f60:	ba000024 	blt	2ff8 <bigargtest+0xd4>
  close(fd);
    2f64:	eb0001b5 	bl	3640 <close>
  unlink("bigarg-ok");
    2f68:	e30505cc 	movw	r0, #21964	; 0x55cc
    2f6c:	e3400000 	movt	r0, #0
}
    2f70:	e24bd00c 	sub	sp, fp, #12
    2f74:	e8bd4830 	pop	{r4, r5, fp, lr}
  unlink("bigarg-ok");
    2f78:	ea0001f1 	b	3744 <unlink>
    2f7c:	e59f30ac 	ldr	r3, [pc, #172]	; 3030 <bigargtest+0x10c>
    2f80:	e30525d8 	movw	r2, #21976	; 0x55d8
    2f84:	e3402000 	movt	r2, #0
    2f88:	e283107c 	add	r1, r3, #124	; 0x7c
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    2f8c:	e5a32004 	str	r2, [r3, #4]!
    for(i = 0; i < MAXARG-1; i++)
    2f90:	e1530001 	cmp	r3, r1
    2f94:	1afffffc 	bne	2f8c <bigargtest+0x68>
    printf(stdout, "bigarg test\n");
    2f98:	e30547e0 	movw	r4, #22496	; 0x57e0
    2f9c:	e3404000 	movt	r4, #0
    args[MAXARG-1] = 0;
    2fa0:	e30557fc 	movw	r5, #22524	; 0x57fc
    2fa4:	e3405000 	movt	r5, #0
    printf(stdout, "bigarg test\n");
    2fa8:	e5940000 	ldr	r0, [r4]
    2fac:	e30516b8 	movw	r1, #22200	; 0x56b8
    2fb0:	e3401000 	movt	r1, #0
    args[MAXARG-1] = 0;
    2fb4:	e3a03000 	mov	r3, #0
    2fb8:	e585307c 	str	r3, [r5, #124]	; 0x7c
    printf(stdout, "bigarg test\n");
    2fbc:	eb0002aa 	bl	3a6c <printf>
    exec("echo", args);
    2fc0:	e1a01005 	mov	r1, r5
    2fc4:	e3030d90 	movw	r0, #15760	; 0x3d90
    2fc8:	e3400000 	movt	r0, #0
    2fcc:	eb0001b5 	bl	36a8 <exec>
    printf(stdout, "bigarg test ok\n");
    2fd0:	e5940000 	ldr	r0, [r4]
    2fd4:	e30516c8 	movw	r1, #22216	; 0x56c8
    2fd8:	e3401000 	movt	r1, #0
    2fdc:	eb0002a2 	bl	3a6c <printf>
    fd = open("bigarg-ok", O_CREATE);
    2fe0:	e3a01c02 	mov	r1, #512	; 0x200
    2fe4:	e30505cc 	movw	r0, #21964	; 0x55cc
    2fe8:	e3400000 	movt	r0, #0
    2fec:	eb0001ba 	bl	36dc <open>
    close(fd);
    2ff0:	eb000192 	bl	3640 <close>
    exit();
    2ff4:	eb000150 	bl	353c <exit>
    printf(stdout, "bigarg test failed!\n");
    2ff8:	e30537e0 	movw	r3, #22496	; 0x57e0
    2ffc:	e3403000 	movt	r3, #0
    3000:	e30516f4 	movw	r1, #22260	; 0x56f4
    3004:	e3401000 	movt	r1, #0
    3008:	e5930000 	ldr	r0, [r3]
    300c:	eb000296 	bl	3a6c <printf>
    exit();
    3010:	eb000149 	bl	353c <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3014:	e30537e0 	movw	r3, #22496	; 0x57e0
    3018:	e3403000 	movt	r3, #0
    301c:	e30516d8 	movw	r1, #22232	; 0x56d8
    3020:	e3401000 	movt	r1, #0
    3024:	e5930000 	ldr	r0, [r3]
    3028:	eb00028f 	bl	3a6c <printf>
    exit();
    302c:	eb000142 	bl	353c <exit>
    3030:	000057f8 	.word	0x000057f8

00003034 <fsfull>:
{
    3034:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    name[1] = '0' + nfiles / 1000;
    3038:	e3043dd3 	movw	r3, #19923	; 0x4dd3
{
    303c:	e28db020 	add	fp, sp, #32
    name[2] = '0' + (nfiles % 1000) / 100;
    3040:	e308751f 	movw	r7, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    3044:	e306a667 	movw	sl, #26215	; 0x6667
    name[2] = '0' + (nfiles % 1000) / 100;
    3048:	e34571eb 	movt	r7, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    304c:	e346a666 	movt	sl, #26214	; 0x6666
{
    3050:	e24dd054 	sub	sp, sp, #84	; 0x54
    name[1] = '0' + nfiles / 1000;
    3054:	e1a04003 	mov	r4, r3
  printf(1, "fsfull test\n");
    3058:	e305170c 	movw	r1, #22284	; 0x570c
    305c:	e3a00001 	mov	r0, #1
    3060:	e3401000 	movt	r1, #0
  for(nfiles = 0; ; nfiles++){
    3064:	e3a08000 	mov	r8, #0
  printf(1, "fsfull test\n");
    3068:	eb00027f 	bl	3a6c <printf>
    name[1] = '0' + nfiles / 1000;
    306c:	e1a03004 	mov	r3, r4
    3070:	e3413062 	movt	r3, #4194	; 0x1062
    3074:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    3078:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
    307c:	e1a09fc8 	asr	r9, r8, #31
    name[3] = '0' + (nfiles % 100) / 10;
    3080:	e0c54798 	smull	r4, r5, r8, r7
    3084:	e3a0c064 	mov	ip, #100	; 0x64
    name[1] = '0' + nfiles / 1000;
    3088:	e0c10398 	smull	r0, r1, r8, r3
    name[2] = '0' + (nfiles % 1000) / 100;
    308c:	e3a03ffa 	mov	r3, #1000	; 0x3e8
    name[4] = '0' + (nfiles % 10);
    3090:	e3a0e00a 	mov	lr, #10
    printf(1, "writing %s\n", name);
    3094:	e24b2064 	sub	r2, fp, #100	; 0x64
    name[3] = '0' + (nfiles % 100) / 10;
    3098:	e06942c5 	rsb	r4, r9, r5, asr #5
    309c:	e06c849c 	mls	ip, ip, r4, r8
    name[1] = '0' + nfiles / 1000;
    30a0:	e0690341 	rsb	r0, r9, r1, asr #6
    printf(1, "writing %s\n", name);
    30a4:	e305171c 	movw	r1, #22300	; 0x571c
    30a8:	e3401000 	movt	r1, #0
    name[2] = '0' + (nfiles % 1000) / 100;
    30ac:	e0638093 	mls	r3, r3, r0, r8
    name[1] = '0' + nfiles / 1000;
    30b0:	e2800030 	add	r0, r0, #48	; 0x30
    30b4:	e54b0063 	strb	r0, [fp, #-99]	; 0xffffff9d
    printf(1, "writing %s\n", name);
    30b8:	e3a00001 	mov	r0, #1
    name[2] = '0' + (nfiles % 1000) / 100;
    30bc:	e0c54793 	smull	r4, r5, r3, r7
    30c0:	e1a03fc3 	asr	r3, r3, #31
    30c4:	e14b46fc 	strd	r4, [fp, #-108]	; 0xffffff94
    name[4] = '0' + (nfiles % 10);
    30c8:	e0c54a98 	smull	r4, r5, r8, sl
    30cc:	e0696145 	rsb	r6, r9, r5, asr #2
    name[3] = '0' + (nfiles % 100) / 10;
    30d0:	e0c54a9c 	smull	r4, r5, ip, sl
    30d4:	e1a0cfcc 	asr	ip, ip, #31
    name[4] = '0' + (nfiles % 10);
    30d8:	e06e869e 	mls	lr, lr, r6, r8
    name[2] = '0' + (nfiles % 1000) / 100;
    30dc:	e51b6068 	ldr	r6, [fp, #-104]	; 0xffffff98
    name[5] = '\0';
    30e0:	e3a04000 	mov	r4, #0
    30e4:	e54b405f 	strb	r4, [fp, #-95]	; 0xffffffa1
    name[2] = '0' + (nfiles % 1000) / 100;
    30e8:	e06332c6 	rsb	r3, r3, r6, asr #5
    name[3] = '0' + (nfiles % 100) / 10;
    30ec:	e06cc145 	rsb	ip, ip, r5, asr #2
    name[4] = '0' + (nfiles % 10);
    30f0:	e28ee030 	add	lr, lr, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    30f4:	e28cc030 	add	ip, ip, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    30f8:	e2833030 	add	r3, r3, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    30fc:	e54be060 	strb	lr, [fp, #-96]	; 0xffffffa0
    name[2] = '0' + (nfiles % 1000) / 100;
    3100:	e54b3062 	strb	r3, [fp, #-98]	; 0xffffff9e
    name[0] = 'f';
    3104:	e3a03066 	mov	r3, #102	; 0x66
    name[3] = '0' + (nfiles % 100) / 10;
    3108:	e54bc061 	strb	ip, [fp, #-97]	; 0xffffff9f
    name[0] = 'f';
    310c:	e54b3064 	strb	r3, [fp, #-100]	; 0xffffff9c
    printf(1, "writing %s\n", name);
    3110:	eb000255 	bl	3a6c <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3114:	e3001202 	movw	r1, #514	; 0x202
    3118:	e24b0064 	sub	r0, fp, #100	; 0x64
    311c:	eb00016e 	bl	36dc <open>
    if(fd < 0){
    3120:	e2506000 	subs	r6, r0, #0
    3124:	ba000014 	blt	317c <fsfull+0x148>
      int cc = write(fd, buf, 512);
    3128:	e3075f98 	movw	r5, #32664	; 0x7f98
    312c:	e3405000 	movt	r5, #0
    3130:	ea000000 	b	3138 <fsfull+0x104>
      total += cc;
    3134:	e0844000 	add	r4, r4, r0
      int cc = write(fd, buf, 512);
    3138:	e3a02c02 	mov	r2, #512	; 0x200
    313c:	e1a01005 	mov	r1, r5
    3140:	e1a00006 	mov	r0, r6
    3144:	eb000130 	bl	360c <write>
      if(cc < 512)
    3148:	e3500c02 	cmp	r0, #512	; 0x200
    314c:	aafffff8 	bge	3134 <fsfull+0x100>
    printf(1, "wrote %d bytes\n", total);
    3150:	e1a02004 	mov	r2, r4
    3154:	e3a00001 	mov	r0, #1
    3158:	e3051738 	movw	r1, #22328	; 0x5738
    315c:	e3401000 	movt	r1, #0
    3160:	eb000241 	bl	3a6c <printf>
    close(fd);
    3164:	e1a00006 	mov	r0, r6
    3168:	eb000134 	bl	3640 <close>
    if(total == 0)
    316c:	e3540000 	cmp	r4, #0
    3170:	0a000006 	beq	3190 <fsfull+0x15c>
  for(nfiles = 0; ; nfiles++){
    3174:	e2888001 	add	r8, r8, #1
    3178:	eaffffbe 	b	3078 <fsfull+0x44>
      printf(1, "open %s failed\n", name);
    317c:	e3051728 	movw	r1, #22312	; 0x5728
    3180:	e24b2064 	sub	r2, fp, #100	; 0x64
    3184:	e3401000 	movt	r1, #0
    3188:	e3a00001 	mov	r0, #1
    318c:	eb000236 	bl	3a6c <printf>
    name[2] = '0' + (nfiles % 1000) / 100;
    3190:	e308a51f 	movw	sl, #34079	; 0x851f
    3194:	e345a1eb 	movt	sl, #20971	; 0x51eb
    name[1] = '0' + nfiles / 1000;
    3198:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    319c:	e3413062 	movt	r3, #4194	; 0x1062
    31a0:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    name[3] = '0' + (nfiles % 100) / 10;
    31a4:	e3063667 	movw	r3, #26215	; 0x6667
    31a8:	e3463666 	movt	r3, #26214	; 0x6666
    31ac:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    name[1] = '0' + nfiles / 1000;
    31b0:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
    name[2] = '0' + (nfiles % 1000) / 100;
    31b4:	e3a0cffa 	mov	ip, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    31b8:	e0c54a98 	smull	r4, r5, r8, sl
    name[5] = '\0';
    31bc:	e3a04000 	mov	r4, #0
    name[1] = '0' + nfiles / 1000;
    31c0:	e0c76398 	smull	r6, r7, r8, r3
    name[3] = '0' + (nfiles % 100) / 10;
    31c4:	e3a03064 	mov	r3, #100	; 0x64
    name[5] = '\0';
    31c8:	e54b405f 	strb	r4, [fp, #-95]	; 0xffffffa1
    name[4] = '0' + (nfiles % 10);
    31cc:	e3a0100a 	mov	r1, #10
    unlink(name);
    31d0:	e24b0064 	sub	r0, fp, #100	; 0x64
    name[1] = '0' + nfiles / 1000;
    31d4:	e0692347 	rsb	r2, r9, r7, asr #6
    31d8:	e282e030 	add	lr, r2, #48	; 0x30
    31dc:	e54be063 	strb	lr, [fp, #-99]	; 0xffffff9d
    name[2] = '0' + (nfiles % 1000) / 100;
    31e0:	e062829c 	mls	r2, ip, r2, r8
    name[3] = '0' + (nfiles % 100) / 10;
    31e4:	e069c2c5 	rsb	ip, r9, r5, asr #5
    name[4] = '0' + (nfiles % 10);
    31e8:	e51b5070 	ldr	r5, [fp, #-112]	; 0xffffff90
    name[0] = 'f';
    31ec:	e3a0e066 	mov	lr, #102	; 0x66
    name[3] = '0' + (nfiles % 100) / 10;
    31f0:	e06c8c93 	mls	ip, r3, ip, r8
    name[0] = 'f';
    31f4:	e54be064 	strb	lr, [fp, #-100]	; 0xffffff9c
    name[4] = '0' + (nfiles % 10);
    31f8:	e0c76598 	smull	r6, r7, r8, r5
    name[3] = '0' + (nfiles % 100) / 10;
    31fc:	e1a04005 	mov	r4, r5
    name[2] = '0' + (nfiles % 1000) / 100;
    3200:	e1a0efc2 	asr	lr, r2, #31
    name[3] = '0' + (nfiles % 100) / 10;
    3204:	e0c5449c 	smull	r4, r5, ip, r4
    3208:	e1a0cfcc 	asr	ip, ip, #31
    name[2] = '0' + (nfiles % 1000) / 100;
    320c:	e0c32a92 	smull	r2, r3, r2, sl
    name[4] = '0' + (nfiles % 10);
    3210:	e0699147 	rsb	r9, r9, r7, asr #2
    3214:	e0618991 	mls	r1, r1, r9, r8
    name[3] = '0' + (nfiles % 100) / 10;
    3218:	e06cc145 	rsb	ip, ip, r5, asr #2
    nfiles--;
    321c:	e2488001 	sub	r8, r8, #1
    name[3] = '0' + (nfiles % 100) / 10;
    3220:	e28cc030 	add	ip, ip, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    3224:	e06ee2c3 	rsb	lr, lr, r3, asr #5
    name[3] = '0' + (nfiles % 100) / 10;
    3228:	e54bc061 	strb	ip, [fp, #-97]	; 0xffffff9f
    name[2] = '0' + (nfiles % 1000) / 100;
    322c:	e28ee030 	add	lr, lr, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    3230:	e2811030 	add	r1, r1, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    3234:	e54be062 	strb	lr, [fp, #-98]	; 0xffffff9e
    3238:	e1a09fc8 	asr	r9, r8, #31
    name[4] = '0' + (nfiles % 10);
    323c:	e54b1060 	strb	r1, [fp, #-96]	; 0xffffffa0
    unlink(name);
    3240:	eb00013f 	bl	3744 <unlink>
  while(nfiles >= 0){
    3244:	e3780001 	cmn	r8, #1
    3248:	1affffd8 	bne	31b0 <fsfull+0x17c>
  printf(1, "fsfull test finished\n");
    324c:	e3a00001 	mov	r0, #1
    3250:	e3051748 	movw	r1, #22344	; 0x5748
    3254:	e3401000 	movt	r1, #0
    3258:	eb000203 	bl	3a6c <printf>
}
    325c:	e24bd020 	sub	sp, fp, #32
    3260:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00003264 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3264:	e30537e0 	movw	r3, #22496	; 0x57e0
    3268:	e3403000 	movt	r3, #0
{
    326c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  randstate = randstate * 1664525 + 1013904223;
    3270:	e306160d 	movw	r1, #26125	; 0x660d
    3274:	e5930018 	ldr	r0, [r3, #24]
    3278:	e3401019 	movt	r1, #25
    327c:	e30f235f 	movw	r2, #62303	; 0xf35f
    3280:	e3432c6e 	movt	r2, #15470	; 0x3c6e
{
    3284:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    3288:	e0202091 	mla	r0, r1, r0, r2
    328c:	e5830018 	str	r0, [r3, #24]
}
    3290:	e28bd000 	add	sp, fp, #0
    3294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3298:	e12fff1e 	bx	lr

0000329c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    329c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32a0:	e2402001 	sub	r2, r0, #1
    32a4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    32a8:	e4d13001 	ldrb	r3, [r1], #1
    32ac:	e3530000 	cmp	r3, #0
    32b0:	e5e23001 	strb	r3, [r2, #1]!
    32b4:	1afffffb 	bne	32a8 <strcpy+0xc>
    ;
  return os;
}
    32b8:	e28bd000 	add	sp, fp, #0
    32bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32c0:	e12fff1e 	bx	lr

000032c4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    32c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32c8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
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
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
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

uint
strlen(char *s)
{
    331c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3320:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
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
    ;
  return n;
}
    334c:	e28bd000 	add	sp, fp, #0
    3350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3354:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
    3358:	e1a00003 	mov	r0, r3
    335c:	eafffffa 	b	334c <strlen+0x30>

00003360 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3360:	e3520000 	cmp	r2, #0
{
    3364:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3368:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
    336c:	0a000004 	beq	3384 <memset+0x24>
    3370:	e6ef1071 	uxtb	r1, r1
    3374:	e0802002 	add	r2, r0, r2
    3378:	e4c01001 	strb	r1, [r0], #1
    337c:	e1520000 	cmp	r2, r0
    3380:	1afffffc 	bne	3378 <memset+0x18>
  return (void *)p;
}
    3384:	e28bd000 	add	sp, fp, #0
    3388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    338c:	e12fff1e 	bx	lr

00003390 <strchr>:

char*
strchr(const char *s, char c)
{
    3390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3394:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
    3398:	e5d02000 	ldrb	r2, [r0]
    339c:	e3520000 	cmp	r2, #0
    33a0:	0a00000b 	beq	33d4 <strchr+0x44>
    if(*s == c)
    33a4:	e1510002 	cmp	r1, r2
    33a8:	1a000002 	bne	33b8 <strchr+0x28>
    33ac:	ea000005 	b	33c8 <strchr+0x38>
    33b0:	e1530001 	cmp	r3, r1
    33b4:	0a000003 	beq	33c8 <strchr+0x38>
  for(; *s; s++)
    33b8:	e5f03001 	ldrb	r3, [r0, #1]!
    33bc:	e3530000 	cmp	r3, #0
    33c0:	1afffffa 	bne	33b0 <strchr+0x20>
      return (char*)s;
  return 0;
    33c4:	e1a00003 	mov	r0, r3
}
    33c8:	e28bd000 	add	sp, fp, #0
    33cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33d0:	e12fff1e 	bx	lr
  return 0;
    33d4:	e1a00002 	mov	r0, r2
    33d8:	eafffffa 	b	33c8 <strchr+0x38>

000033dc <gets>:

char*
gets(char *buf, int max)
{
    33dc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    33e0:	e1a08000 	mov	r8, r0
    33e4:	e28db018 	add	fp, sp, #24
    33e8:	e1a07001 	mov	r7, r1
    33ec:	e24dd00c 	sub	sp, sp, #12
    33f0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    33f4:	e3a05000 	mov	r5, #0
    33f8:	ea000008 	b	3420 <gets+0x44>
    cc = read(0, &c, 1);
    33fc:	eb000075 	bl	35d8 <read>
    if(cc < 1)
    3400:	e3500000 	cmp	r0, #0
    3404:	da00000b 	ble	3438 <gets+0x5c>
      break;
    buf[i++] = c;
    3408:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    340c:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
    3410:	e353000d 	cmp	r3, #13
    3414:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
    3418:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
    341c:	0a000005 	beq	3438 <gets+0x5c>
    cc = read(0, &c, 1);
    3420:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
    3424:	e0854002 	add	r4, r5, r2
    3428:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
    342c:	e24b101d 	sub	r1, fp, #29
    3430:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
    3434:	bafffff0 	blt	33fc <gets+0x20>
      break;
  }
  buf[i] = '\0';
    3438:	e3a03000 	mov	r3, #0
  return buf;
}
    343c:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
    3440:	e7c83005 	strb	r3, [r8, r5]
}
    3444:	e24bd018 	sub	sp, fp, #24
    3448:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000344c <stat>:

int
stat(char *n, struct stat *st)
{
    344c:	e92d4830 	push	{r4, r5, fp, lr}
    3450:	e1a04001 	mov	r4, r1
    3454:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3458:	e3a01000 	mov	r1, #0
    345c:	eb00009e 	bl	36dc <open>
  if(fd < 0)
    3460:	e2505000 	subs	r5, r0, #0
    3464:	ba000006 	blt	3484 <stat+0x38>
    return -1;
  r = fstat(fd, st);
    3468:	e1a01004 	mov	r1, r4
    346c:	eb0000c1 	bl	3778 <fstat>
    3470:	e1a04000 	mov	r4, r0
  close(fd);
    3474:	e1a00005 	mov	r0, r5
    3478:	eb000070 	bl	3640 <close>
  return r;
}
    347c:	e1a00004 	mov	r0, r4
    3480:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
    3484:	e3e04000 	mvn	r4, #0
    3488:	eafffffb 	b	347c <stat+0x30>

0000348c <atoi>:

int
atoi(const char *s)
{
    348c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3490:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3494:	e5d02000 	ldrb	r2, [r0]
    3498:	e2423030 	sub	r3, r2, #48	; 0x30
    349c:	e3530009 	cmp	r3, #9
    34a0:	e3a03000 	mov	r3, #0
    34a4:	8a000006 	bhi	34c4 <atoi+0x38>
    n = n*10 + *s++ - '0';
    34a8:	e3a0c00a 	mov	ip, #10
    34ac:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
    34b0:	e5f02001 	ldrb	r2, [r0, #1]!
    34b4:	e2421030 	sub	r1, r2, #48	; 0x30
    34b8:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
    34bc:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
    34c0:	9afffff9 	bls	34ac <atoi+0x20>
  return n;
}
    34c4:	e1a00003 	mov	r0, r3
    34c8:	e28bd000 	add	sp, fp, #0
    34cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    34d0:	e12fff1e 	bx	lr

000034d4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    34d4:	e3520000 	cmp	r2, #0
{
    34d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34dc:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
    34e0:	da000005 	ble	34fc <memmove+0x28>
    34e4:	e0812002 	add	r2, r1, r2
    34e8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
    34ec:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
    34f0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
    34f4:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
    34f8:	1afffffb 	bne	34ec <memmove+0x18>
  return vdst;
}
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

000035a4 <pipe>:
    35a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35b8:	e3a00004 	mov	r0, #4
    35bc:	ef000040 	svc	0x00000040
    35c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35d4:	e12fff1e 	bx	lr

000035d8 <read>:
    35d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35ec:	e3a00005 	mov	r0, #5
    35f0:	ef000040 	svc	0x00000040
    35f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3600:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3604:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3608:	e12fff1e 	bx	lr

0000360c <write>:
    360c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3610:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3614:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3618:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    361c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3620:	e3a00010 	mov	r0, #16
    3624:	ef000040 	svc	0x00000040
    3628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    362c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3630:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3634:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3638:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    363c:	e12fff1e 	bx	lr

00003640 <close>:
    3640:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3644:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3648:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    364c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3650:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3654:	e3a00015 	mov	r0, #21
    3658:	ef000040 	svc	0x00000040
    365c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3664:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3668:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    366c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3670:	e12fff1e 	bx	lr

00003674 <kill>:
    3674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3678:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    367c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3680:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3684:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3688:	e3a00006 	mov	r0, #6
    368c:	ef000040 	svc	0x00000040
    3690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3698:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    369c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36a4:	e12fff1e 	bx	lr

000036a8 <exec>:
    36a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36bc:	e3a00007 	mov	r0, #7
    36c0:	ef000040 	svc	0x00000040
    36c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36d8:	e12fff1e 	bx	lr

000036dc <open>:
    36dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36f0:	e3a0000f 	mov	r0, #15
    36f4:	ef000040 	svc	0x00000040
    36f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3700:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3704:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3708:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    370c:	e12fff1e 	bx	lr

00003710 <mknod>:
    3710:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3714:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3718:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    371c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3720:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3724:	e3a00011 	mov	r0, #17
    3728:	ef000040 	svc	0x00000040
    372c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3734:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3738:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    373c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3740:	e12fff1e 	bx	lr

00003744 <unlink>:
    3744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3748:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    374c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3750:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3754:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3758:	e3a00012 	mov	r0, #18
    375c:	ef000040 	svc	0x00000040
    3760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3768:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    376c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3774:	e12fff1e 	bx	lr

00003778 <fstat>:
    3778:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    377c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3780:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3784:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3788:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    378c:	e3a00008 	mov	r0, #8
    3790:	ef000040 	svc	0x00000040
    3794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    379c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37a8:	e12fff1e 	bx	lr

000037ac <link>:
    37ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37c0:	e3a00013 	mov	r0, #19
    37c4:	ef000040 	svc	0x00000040
    37c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37dc:	e12fff1e 	bx	lr

000037e0 <mkdir>:
    37e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37f4:	e3a00014 	mov	r0, #20
    37f8:	ef000040 	svc	0x00000040
    37fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3804:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3808:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    380c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3810:	e12fff1e 	bx	lr

00003814 <chdir>:
    3814:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3818:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    381c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3820:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3824:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3828:	e3a00009 	mov	r0, #9
    382c:	ef000040 	svc	0x00000040
    3830:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3834:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3838:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    383c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3840:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3844:	e12fff1e 	bx	lr

00003848 <dup>:
    3848:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    384c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3850:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3854:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3858:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    385c:	e3a0000a 	mov	r0, #10
    3860:	ef000040 	svc	0x00000040
    3864:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3868:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    386c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3870:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3874:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3878:	e12fff1e 	bx	lr

0000387c <getpid>:
    387c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3880:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3884:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3888:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    388c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3890:	e3a0000b 	mov	r0, #11
    3894:	ef000040 	svc	0x00000040
    3898:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    389c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38ac:	e12fff1e 	bx	lr

000038b0 <sbrk>:
    38b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38c4:	e3a0000c 	mov	r0, #12
    38c8:	ef000040 	svc	0x00000040
    38cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38e0:	e12fff1e 	bx	lr

000038e4 <sleep>:
    38e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38f8:	e3a0000d 	mov	r0, #13
    38fc:	ef000040 	svc	0x00000040
    3900:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3904:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3908:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    390c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3910:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3914:	e12fff1e 	bx	lr

00003918 <uptime>:
    3918:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    391c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3920:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3924:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3928:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    392c:	e3a0000e 	mov	r0, #14
    3930:	ef000040 	svc	0x00000040
    3934:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3938:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    393c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3940:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3944:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3948:	e12fff1e 	bx	lr

0000394c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    394c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    3950:	e1a09fa1 	lsr	r9, r1, #31
    3954:	e3530000 	cmp	r3, #0
    3958:	03a09000 	moveq	r9, #0
    395c:	12099001 	andne	r9, r9, #1
{
    3960:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
    3964:	e3590000 	cmp	r9, #0
    3968:	e30587c4 	movw	r8, #22468	; 0x57c4
    neg = 1;
    x = -xx;
    396c:	1261e000 	rsbne	lr, r1, #0
    3970:	e3408000 	movt	r8, #0
    3974:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
    3978:	e1a04000 	mov	r4, r0
    neg = 1;
    397c:	13a09001 	movne	r9, #1
  } else {
    x = xx;
    3980:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
    3984:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
    3988:	e3a05001 	mov	r5, #1
{
    398c:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
    3990:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
    3994:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    3998:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
    399c:	e1a0033e 	lsr	r0, lr, r3
    39a0:	e2000001 	and	r0, r0, #1
    39a4:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
    39a8:	e1520001 	cmp	r2, r1
            r = r - d;
    39ac:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
    39b0:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
    39b4:	e2533001 	subs	r3, r3, #1
    39b8:	2afffff7 	bcs	399c <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    39bc:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
    39c0:	e35c0000 	cmp	ip, #0
    39c4:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
    39c8:	e2873001 	add	r3, r7, #1
    39cc:	e7d81001 	ldrb	r1, [r8, r1]
    39d0:	e5e61001 	strb	r1, [r6, #1]!
    39d4:	11a07003 	movne	r7, r3
    39d8:	1affffec 	bne	3990 <printint+0x44>
  if(neg)
    39dc:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
    39e0:	124b201c 	subne	r2, fp, #28
    39e4:	10822003 	addne	r2, r2, r3
    39e8:	13a0102d 	movne	r1, #45	; 0x2d
    39ec:	12873002 	addne	r3, r7, #2
    39f0:	15421010 	strbne	r1, [r2, #-16]
    39f4:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
    39f8:	e2435001 	sub	r5, r3, #1
    39fc:	e0826003 	add	r6, r2, r3
    3a00:	e5763001 	ldrb	r3, [r6, #-1]!
    3a04:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
    3a08:	e3a02001 	mov	r2, #1
    3a0c:	e24b102d 	sub	r1, fp, #45	; 0x2d
    3a10:	e1a00004 	mov	r0, r4
    3a14:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    3a18:	ebfffefb 	bl	360c <write>
  while(--i >= 0)
    3a1c:	e3750001 	cmn	r5, #1
    3a20:	1afffff6 	bne	3a00 <printint+0xb4>
    putc(fd, buf[i]);
}
    3a24:	e24bd01c 	sub	sp, fp, #28
    3a28:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00003a2c <div>:
{
    3a2c:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    3a30:	e3a02000 	mov	r2, #0
{
    3a34:	e28db008 	add	fp, sp, #8
    3a38:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
    3a3c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    3a40:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
    3a44:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
    3a48:	e1a0c33e 	lsr	ip, lr, r3
    3a4c:	e20cc001 	and	ip, ip, #1
    3a50:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    3a54:	e1520001 	cmp	r2, r1
            r = r - d;
    3a58:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
    3a5c:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
    3a60:	e2533001 	subs	r3, r3, #1
    3a64:	2afffff7 	bcs	3a48 <div+0x1c>
}
    3a68:	e8bd8810 	pop	{r4, fp, pc}

00003a6c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a6c:	e92d000e 	push	{r1, r2, r3}
    3a70:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    3a74:	e28db018 	add	fp, sp, #24
    3a78:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a7c:	e59b6004 	ldr	r6, [fp, #4]
    3a80:	e5d64000 	ldrb	r4, [r6]
    3a84:	e3540000 	cmp	r4, #0
    3a88:	0a00002b 	beq	3b3c <printf+0xd0>
    3a8c:	e1a07000 	mov	r7, r0
    3a90:	e28b8008 	add	r8, fp, #8
    3a94:	e3a05000 	mov	r5, #0
    3a98:	ea00000a 	b	3ac8 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a9c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    3aa0:	01a05004 	moveq	r5, r4
      if(c == '%'){
    3aa4:	0a000004 	beq	3abc <printf+0x50>
    3aa8:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3aac:	e3a02001 	mov	r2, #1
    3ab0:	e1a00007 	mov	r0, r7
    3ab4:	e5614006 	strb	r4, [r1, #-6]!
    3ab8:	ebfffed3 	bl	360c <write>
  for(i = 0; fmt[i]; i++){
    3abc:	e5f64001 	ldrb	r4, [r6, #1]!
    3ac0:	e3540000 	cmp	r4, #0
    3ac4:	0a00001c 	beq	3b3c <printf+0xd0>
    if(state == 0){
    3ac8:	e3550000 	cmp	r5, #0
    3acc:	0afffff2 	beq	3a9c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3ad0:	e3550025 	cmp	r5, #37	; 0x25
    3ad4:	1afffff8 	bne	3abc <printf+0x50>
      if(c == 'd'){
    3ad8:	e3540064 	cmp	r4, #100	; 0x64
    3adc:	0a000037 	beq	3bc0 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3ae0:	e20430f7 	and	r3, r4, #247	; 0xf7
    3ae4:	e3530070 	cmp	r3, #112	; 0x70
    3ae8:	0a000017 	beq	3b4c <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3aec:	e3540073 	cmp	r4, #115	; 0x73
    3af0:	0a00001c 	beq	3b68 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3af4:	e3540063 	cmp	r4, #99	; 0x63
    3af8:	0a000037 	beq	3bdc <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3afc:	e3540025 	cmp	r4, #37	; 0x25
    3b00:	0a000027 	beq	3ba4 <printf+0x138>
  write(fd, &c, 1);
    3b04:	e3a02001 	mov	r2, #1
    3b08:	e24b1019 	sub	r1, fp, #25
    3b0c:	e1a00007 	mov	r0, r7
    3b10:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    3b14:	ebfffebc 	bl	360c <write>
    3b18:	e3a02001 	mov	r2, #1
    3b1c:	e24b101a 	sub	r1, fp, #26
    3b20:	e1a00007 	mov	r0, r7
    3b24:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    3b28:	ebfffeb7 	bl	360c <write>
  for(i = 0; fmt[i]; i++){
    3b2c:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b30:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
    3b34:	e3540000 	cmp	r4, #0
    3b38:	1affffe2 	bne	3ac8 <printf+0x5c>
    }
  }
}
    3b3c:	e24bd018 	sub	sp, fp, #24
    3b40:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    3b44:	e28dd00c 	add	sp, sp, #12
    3b48:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
    3b4c:	e3a03000 	mov	r3, #0
    3b50:	e3a02010 	mov	r2, #16
    3b54:	e4981004 	ldr	r1, [r8], #4
    3b58:	e1a00007 	mov	r0, r7
    3b5c:	ebffff7a 	bl	394c <printint>
      state = 0;
    3b60:	e3a05000 	mov	r5, #0
    3b64:	eaffffd4 	b	3abc <printf+0x50>
        s = (char*)*ap;
    3b68:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
    3b6c:	e3540000 	cmp	r4, #0
    3b70:	0a000021 	beq	3bfc <printf+0x190>
        while(*s != 0){
    3b74:	e5d45000 	ldrb	r5, [r4]
    3b78:	e3550000 	cmp	r5, #0
    3b7c:	0affffce 	beq	3abc <printf+0x50>
  write(fd, &c, 1);
    3b80:	e3a02001 	mov	r2, #1
    3b84:	e24b101d 	sub	r1, fp, #29
    3b88:	e1a00007 	mov	r0, r7
    3b8c:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
    3b90:	ebfffe9d 	bl	360c <write>
        while(*s != 0){
    3b94:	e5f45001 	ldrb	r5, [r4, #1]!
    3b98:	e3550000 	cmp	r5, #0
    3b9c:	1afffff7 	bne	3b80 <printf+0x114>
    3ba0:	eaffffc5 	b	3abc <printf+0x50>
    3ba4:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3ba8:	e3a02001 	mov	r2, #1
    3bac:	e1a00007 	mov	r0, r7
    3bb0:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
    3bb4:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
    3bb8:	ebfffe93 	bl	360c <write>
    3bbc:	eaffffbe 	b	3abc <printf+0x50>
        printint(fd, *ap, 10, 1);
    3bc0:	e3a03001 	mov	r3, #1
    3bc4:	e3a0200a 	mov	r2, #10
    3bc8:	e4981004 	ldr	r1, [r8], #4
    3bcc:	e1a00007 	mov	r0, r7
    3bd0:	ebffff5d 	bl	394c <printint>
      state = 0;
    3bd4:	e3a05000 	mov	r5, #0
    3bd8:	eaffffb7 	b	3abc <printf+0x50>
        putc(fd, *ap);
    3bdc:	e4983004 	ldr	r3, [r8], #4
    3be0:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    3be4:	e3a02001 	mov	r2, #1
    3be8:	e1a00007 	mov	r0, r7
      state = 0;
    3bec:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
    3bf0:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
    3bf4:	ebfffe84 	bl	360c <write>
    3bf8:	eaffffaf 	b	3abc <printf+0x50>
          s = "(null)";
    3bfc:	e30547d8 	movw	r4, #22488	; 0x57d8
        while(*s != 0){
    3c00:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
    3c04:	e3404000 	movt	r4, #0
    3c08:	eaffffdc 	b	3b80 <printf+0x114>

00003c0c <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c0c:	e305c87c 	movw	ip, #22652	; 0x587c
    3c10:	e340c000 	movt	ip, #0
{
    3c14:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
    3c18:	e2401008 	sub	r1, r0, #8
{
    3c1c:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c20:	e59c3000 	ldr	r3, [ip]
    3c24:	ea000004 	b	3c3c <free+0x30>
    3c28:	e1510002 	cmp	r1, r2
    3c2c:	3a000009 	bcc	3c58 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c30:	e1530002 	cmp	r3, r2
    3c34:	2a000007 	bcs	3c58 <free+0x4c>
{
    3c38:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c3c:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c40:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c44:	3afffff7 	bcc	3c28 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c48:	e1530002 	cmp	r3, r2
    3c4c:	3afffff9 	bcc	3c38 <free+0x2c>
    3c50:	e1510002 	cmp	r1, r2
    3c54:	2afffff7 	bcs	3c38 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c58:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c5c:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
    3c60:	e081418e 	add	r4, r1, lr, lsl #3
    3c64:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
    3c68:	05922004 	ldreq	r2, [r2, #4]
    3c6c:	0082e00e 	addeq	lr, r2, lr
    3c70:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    3c74:	05932000 	ldreq	r2, [r3]
    3c78:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
    3c7c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    3c80:	e5932004 	ldr	r2, [r3, #4]
    3c84:	e083e182 	add	lr, r3, r2, lsl #3
    3c88:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
    3c8c:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
    3c90:	05101004 	ldreq	r1, [r0, #-4]
    3c94:	00812002 	addeq	r2, r1, r2
    3c98:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    3c9c:	05102008 	ldreq	r2, [r0, #-8]
    3ca0:	05832000 	streq	r2, [r3]
}
    3ca4:	e8bd8810 	pop	{r4, fp, pc}

00003ca8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3ca8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    3cac:	e305787c 	movw	r7, #22652	; 0x587c
    3cb0:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cb4:	e2804007 	add	r4, r0, #7
{
    3cb8:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
    3cbc:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cc0:	e1a041a4 	lsr	r4, r4, #3
    3cc4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    3cc8:	e3530000 	cmp	r3, #0
    3ccc:	0a000027 	beq	3d70 <malloc+0xc8>
    3cd0:	e5930000 	ldr	r0, [r3]
    3cd4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3cd8:	e1540002 	cmp	r4, r2
    3cdc:	9a000019 	bls	3d48 <malloc+0xa0>
    3ce0:	e3540a01 	cmp	r4, #4096	; 0x1000
    3ce4:	21a05004 	movcs	r5, r4
    3ce8:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
    3cec:	e1a06185 	lsl	r6, r5, #3
    3cf0:	ea000003 	b	3d04 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cf4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    3cf8:	e5902004 	ldr	r2, [r0, #4]
    3cfc:	e1540002 	cmp	r4, r2
    3d00:	9a000010 	bls	3d48 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d04:	e5972000 	ldr	r2, [r7]
    3d08:	e1a03000 	mov	r3, r0
    3d0c:	e1520000 	cmp	r2, r0
    3d10:	1afffff7 	bne	3cf4 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
    3d14:	e1a00006 	mov	r0, r6
    3d18:	ebfffee4 	bl	38b0 <sbrk>
    3d1c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    3d20:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
    3d24:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
    3d28:	0a000004 	beq	3d40 <malloc+0x98>
  hp->s.size = nu;
    3d2c:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
    3d30:	ebffffb5 	bl	3c0c <free>
  return freep;
    3d34:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
    3d38:	e3530000 	cmp	r3, #0
    3d3c:	1affffec 	bne	3cf4 <malloc+0x4c>
        return 0;
    3d40:	e3a00000 	mov	r0, #0
  }
}
    3d44:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
    3d48:	e1540002 	cmp	r4, r2
      freep = prevp;
    3d4c:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
    3d50:	10422004 	subne	r2, r2, r4
    3d54:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
    3d58:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
    3d5c:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
    3d60:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
    3d64:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
    3d68:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
    3d6c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
    3d70:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
    3d74:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
    3d78:	e5870000 	str	r0, [r7]
    3d7c:	e5870004 	str	r0, [r7, #4]
    3d80:	eaffffd6 	b	3ce0 <malloc+0x38>
