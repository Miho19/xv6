
_usb_mkfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  struct dinode din;


  _static_assert(sizeof(int) == 4, "Integers must be 4 bytes!");

  if(argc < 2){
       0:	e3500001 	cmp	r0, #1
{
       4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
       8:	e28db020 	add	fp, sp, #32
       c:	e24ddf9b 	sub	sp, sp, #620	; 0x26c
  if(argc < 2){
      10:	da000068 	ble	1b8 <main+0x1b8>

  assert(512 % sizeof(struct dinode) == 0);
  assert(512 % sizeof(struct dirent) == 0);

  /** Create the dev */
  mknod(argv[1], 15, 15);
      14:	e3a0200f 	mov	r2, #15
      18:	e1a06001 	mov	r6, r1
      1c:	e1a09000 	mov	r9, r0
      20:	e5910004 	ldr	r0, [r1, #4]
      24:	e1a01002 	mov	r1, r2
      28:	eb0003ae 	bl	ee8 <mknod>
  fsfd = open(argv[1], O_RDWR);
      2c:	e3a01002 	mov	r1, #2
      30:	e5960004 	ldr	r0, [r6, #4]
      34:	eb00039e 	bl	eb4 <open>
      38:	e30136e4 	movw	r3, #5860	; 0x16e4
      3c:	e3403000 	movt	r3, #0

  if(fsfd < 0){
      40:	e3500000 	cmp	r0, #0
  fsfd = open(argv[1], O_RDWR);
      44:	e5830000 	str	r0, [r3]
  if(fsfd < 0){
      48:	ba000054 	blt	1a0 <main+0x1a0>
    printf(1, "%s\n", argv[1]);
    exit();
  }

  sb.size = xint(size);
      4c:	e30146a8 	movw	r4, #5800	; 0x16a8
      50:	e3404000 	movt	r4, #0
      54:	e30106d0 	movw	r0, #5840	; 0x16d0
      58:	e3400000 	movt	r0, #0
      5c:	e5943008 	ldr	r3, [r4, #8]
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
  sb.ninodes = xint(ninodes);
  sb.nlog = xint(nlog);

  bitblocks = size/(512*8) + 1;
      60:	e30156e0 	movw	r5, #5856	; 0x16e0
  sb.ninodes = xint(ninodes);
      64:	e594c004 	ldr	ip, [r4, #4]
  bitblocks = size/(512*8) + 1;
      68:	e3405000 	movt	r5, #0
      6c:	e2831eff 	add	r1, r3, #4080	; 0xff0
      70:	e3530000 	cmp	r3, #0
      74:	e281100f 	add	r1, r1, #15
  sb.size = xint(size);
      78:	e5803000 	str	r3, [r0]
  sb.nlog = xint(nlog);
      7c:	e594e010 	ldr	lr, [r4, #16]
  usedblocks = ninodes / IPB + 3 + bitblocks;
      80:	e30176cc 	movw	r7, #5836	; 0x16cc
  bitblocks = size/(512*8) + 1;
      84:	b1a03001 	movlt	r3, r1
  usedblocks = ninodes / IPB + 3 + bitblocks;
      88:	e1a011ac 	lsr	r1, ip, #3
  bitblocks = size/(512*8) + 1;
      8c:	e1a03643 	asr	r3, r3, #12
  sb.ninodes = xint(ninodes);
      90:	e580c008 	str	ip, [r0, #8]
  bitblocks = size/(512*8) + 1;
      94:	e2833001 	add	r3, r3, #1
  usedblocks = ninodes / IPB + 3 + bitblocks;
      98:	e281c003 	add	ip, r1, #3
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
      9c:	e594200c 	ldr	r2, [r4, #12]
  usedblocks = ninodes / IPB + 3 + bitblocks;
      a0:	e08cc003 	add	ip, ip, r3
  freeblock = usedblocks;

  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      a4:	e2811001 	add	r1, r1, #1
      a8:	e88d1002 	stm	sp, {r1, ip}
  freeblock = usedblocks;
      ac:	e30116c8 	movw	r1, #5832	; 0x16c8
      b0:	e3401000 	movt	r1, #0
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      b4:	e58de008 	str	lr, [sp, #8]
  usedblocks = ninodes / IPB + 3 + bitblocks;
      b8:	e3407000 	movt	r7, #0
  freeblock = usedblocks;
      bc:	e581c000 	str	ip, [r1]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      c0:	e08e1002 	add	r1, lr, r2
  bitblocks = size/(512*8) + 1;
      c4:	e5853000 	str	r3, [r5]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      c8:	e081100c 	add	r1, r1, ip
      cc:	e58d100c 	str	r1, [sp, #12]
      d0:	e301162c 	movw	r1, #5676	; 0x162c
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
      d4:	e5802004 	str	r2, [r0, #4]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      d8:	e3401000 	movt	r1, #0
      dc:	e1a0200c 	mov	r2, ip
  sb.nlog = xint(nlog);
      e0:	e580e00c 	str	lr, [r0, #12]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      e4:	e3a00001 	mov	r0, #1
  a[0] = x;
      e8:	e50be224 	str	lr, [fp, #-548]	; 0xfffffddc
  usedblocks = ninodes / IPB + 3 + bitblocks;
      ec:	e587c000 	str	ip, [r7]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      f0:	eb000453 	bl	1244 <printf>
         bitblocks, ninodes/IPB + 1, freeblock, nlog, nblocks+usedblocks+nlog);

  assert(nblocks + usedblocks + nlog == size);
      f4:	e5942010 	ldr	r2, [r4, #16]
      f8:	e594300c 	ldr	r3, [r4, #12]
      fc:	e5971000 	ldr	r1, [r7]
     100:	e0833002 	add	r3, r3, r2
     104:	e5942008 	ldr	r2, [r4, #8]
     108:	e0833001 	add	r3, r3, r1
     10c:	e1530002 	cmp	r3, r2
     110:	1a00002d 	bne	1cc <main+0x1cc>

  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     114:	e3530000 	cmp	r3, #0
    wsect(i, zeroes);
     118:	130156e8 	movwne	r5, #5864	; 0x16e8
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     11c:	13a08000 	movne	r8, #0
    wsect(i, zeroes);
     120:	13405000 	movtne	r5, #0
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     124:	0a00000a 	beq	154 <main+0x154>
    wsect(i, zeroes);
     128:	e1a01005 	mov	r1, r5
     12c:	e1a00008 	mov	r0, r8
     130:	eb0000fa 	bl	520 <wsect>
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     134:	e594300c 	ldr	r3, [r4, #12]
     138:	e5941010 	ldr	r1, [r4, #16]
     13c:	e2888001 	add	r8, r8, #1
     140:	e5972000 	ldr	r2, [r7]
     144:	e0833001 	add	r3, r3, r1
     148:	e0833002 	add	r3, r3, r2
     14c:	e1530008 	cmp	r3, r8
     150:	8afffff4 	bhi	128 <main+0x128>

  memset(buf, 0, sizeof(buf));
     154:	e3a02c02 	mov	r2, #512	; 0x200
     158:	e3a01000 	mov	r1, #0
     15c:	e24b0f89 	sub	r0, fp, #548	; 0x224
     160:	eb000267 	bl	b04 <memset>
  memmove(buf, &sb, sizeof(sb));
     164:	e3a02010 	mov	r2, #16
     168:	e24b0f89 	sub	r0, fp, #548	; 0x224
     16c:	e30116d0 	movw	r1, #5840	; 0x16d0
     170:	e3401000 	movt	r1, #0
     174:	eb0002bf 	bl	c78 <memmove>
  wsect(1, buf);
     178:	e24b1f89 	sub	r1, fp, #548	; 0x224
     17c:	e3a00001 	mov	r0, #1
     180:	eb0000e6 	bl	520 <wsect>

  rootino = ialloc(T_DIR);
     184:	e3a00001 	mov	r0, #1
     188:	eb000157 	bl	6ec <ialloc>
  assert(rootino == ROOTINO);
     18c:	e3500001 	cmp	r0, #1
  rootino = ialloc(T_DIR);
     190:	e1a04000 	mov	r4, r0
  assert(rootino == ROOTINO);
     194:	0a00000e 	beq	1d4 <main+0x1d4>
     198:	e3a000a7 	mov	r0, #167	; 0xa7
     19c:	eb00009a 	bl	40c <failure>
    printf(1, "%s\n", argv[1]);
     1a0:	e5962004 	ldr	r2, [r6, #4]
     1a4:	e3011628 	movw	r1, #5672	; 0x1628
     1a8:	e3a00001 	mov	r0, #1
     1ac:	e3401000 	movt	r1, #0
     1b0:	eb000423 	bl	1244 <printf>
    exit();
     1b4:	eb0002c9 	bl	ce0 <exit>
    printf(1, "Usage: mkfs fs.img files...\n");
     1b8:	e3011608 	movw	r1, #5640	; 0x1608
     1bc:	e3a00001 	mov	r0, #1
     1c0:	e3401000 	movt	r1, #0
     1c4:	eb00041e 	bl	1244 <printf>
    exit();
     1c8:	eb0002c4 	bl	ce0 <exit>
  assert(nblocks + usedblocks + nlog == size);
     1cc:	e3a0009d 	mov	r0, #157	; 0x9d
     1d0:	eb00008d 	bl	40c <failure>

  
  memset(&de, 0, sizeof(de));
     1d4:	e24b8f9d 	sub	r8, fp, #628	; 0x274
     1d8:	e3a02010 	mov	r2, #16
     1dc:	e3a01000 	mov	r1, #0
     1e0:	e2866008 	add	r6, r6, #8
     1e4:	e1a00008 	mov	r0, r8
  de.inum = xshort(rootino);
     1e8:	e1a05008 	mov	r5, r8
  memset(&de, 0, sizeof(de));
     1ec:	eb000244 	bl	b04 <memset>
  a[0] = x;
     1f0:	e24b3f99 	sub	r3, fp, #612	; 0x264
  de.inum = xshort(rootino);
     1f4:	e0c540b2 	strh	r4, [r5], #2
  strcpy(de.name, ".");
     1f8:	e3011670 	movw	r1, #5744	; 0x1670
  a[0] = x;
     1fc:	e1c340b0 	strh	r4, [r3]
  strcpy(de.name, ".");
     200:	e3401000 	movt	r1, #0
     204:	e1a00005 	mov	r0, r5
  strcpy(de.name, "..");
  iappend(rootino, &de, sizeof(de));


	/** Adds files to file system */
  for(i = 2; i < argc; i++){
     208:	e3a0a002 	mov	sl, #2
  strcpy(de.name, ".");
     20c:	eb00020b 	bl	a40 <strcpy>
  iappend(rootino, &de, sizeof(de));
     210:	e1a01008 	mov	r1, r8
     214:	e3a02010 	mov	r2, #16
     218:	e1a00004 	mov	r0, r4
     21c:	eb000179 	bl	808 <iappend>
  memset(&de, 0, sizeof(de));
     220:	e3a02010 	mov	r2, #16
     224:	e3a01000 	mov	r1, #0
     228:	e1a00008 	mov	r0, r8
     22c:	eb000234 	bl	b04 <memset>
  a[0] = x;
     230:	e24b3f99 	sub	r3, fp, #612	; 0x264
  strcpy(de.name, "..");
     234:	e1a00005 	mov	r0, r5
     238:	e3011674 	movw	r1, #5748	; 0x1674
  a[0] = x;
     23c:	e1c340b0 	strh	r4, [r3]
  strcpy(de.name, "..");
     240:	e3401000 	movt	r1, #0
  de.inum = xshort(rootino);
     244:	e1c840b0 	strh	r4, [r8]
  strcpy(de.name, "..");
     248:	eb0001fc 	bl	a40 <strcpy>
  iappend(rootino, &de, sizeof(de));
     24c:	e1a00004 	mov	r0, r4
     250:	e1a01008 	mov	r1, r8
     254:	e3a02010 	mov	r2, #16
     258:	eb00016a 	bl	808 <iappend>
  for(i = 2; i < argc; i++){
     25c:	e15a0009 	cmp	sl, r9
     260:	0a00004a 	beq	390 <main+0x390>
    assert(index(argv[i], '/') == 0);
     264:	e5964000 	ldr	r4, [r6]
  if(!src || !*src)
     268:	e3540000 	cmp	r4, #0
     26c:	0a00000d 	beq	2a8 <main+0x2a8>
     270:	e5d43000 	ldrb	r3, [r4]
     274:	e3530000 	cmp	r3, #0
     278:	0a00000a 	beq	2a8 <main+0x2a8>
  length = strlen(src);
     27c:	e1a00004 	mov	r0, r4
     280:	eb00020e 	bl	ac0 <strlen>
  while(*src && length--){
     284:	e5d43000 	ldrb	r3, [r4]
     288:	ea000004 	b	2a0 <main+0x2a0>
     28c:	e3500000 	cmp	r0, #0
     290:	0a000004 	beq	2a8 <main+0x2a8>
    if(*src == c)
     294:	e353002f 	cmp	r3, #47	; 0x2f
     298:	e2400001 	sub	r0, r0, #1
     29c:	0a000058 	beq	404 <main+0x404>
  while(*src && length--){
     2a0:	e3530000 	cmp	r3, #0
     2a4:	1afffff8 	bne	28c <main+0x28c>

    if((fd = open(argv[i], 0)) < 0){
     2a8:	e3a01000 	mov	r1, #0
     2ac:	e5960000 	ldr	r0, [r6]
     2b0:	eb0002ff 	bl	eb4 <open>
     2b4:	e2504000 	subs	r4, r0, #0
     2b8:	ba00004b 	blt	3ec <main+0x3ec>
    
    // Skip leading _ in name when writing to file system.
    // The binaries are named _rm, _cat, etc. to keep the
    // build operating system from trying to execute them
    // in place of system binaries like rm and cat.
    if(argv[i][0] == '_')
     2bc:	e5963000 	ldr	r3, [r6]
      ++argv[i];

    inum = ialloc(T_FILE);
     2c0:	e3a00002 	mov	r0, #2
    if(argv[i][0] == '_')
     2c4:	e5d32000 	ldrb	r2, [r3]
     2c8:	e352005f 	cmp	r2, #95	; 0x5f
      ++argv[i];
     2cc:	02833001 	addeq	r3, r3, #1
     2d0:	05863000 	streq	r3, [r6]
    inum = ialloc(T_FILE);
     2d4:	eb000104 	bl	6ec <ialloc>

    memset(&de, 0, sizeof(de));
     2d8:	e3a02010 	mov	r2, #16
     2dc:	e3a01000 	mov	r1, #0
    inum = ialloc(T_FILE);
     2e0:	e1a05000 	mov	r5, r0
    memset(&de, 0, sizeof(de));
     2e4:	e1a00008 	mov	r0, r8
     2e8:	eb000205 	bl	b04 <memset>
    de.inum = xshort(inum);
    strncpy(de.name, argv[i], DIRSIZ);
     2ec:	e496c004 	ldr	ip, [r6], #4
  a[0] = x;
     2f0:	e24b3f99 	sub	r3, fp, #612	; 0x264
    de.inum = xshort(inum);
     2f4:	e1c850b0 	strh	r5, [r8]
  if(!src || !dst)
     2f8:	e35c0000 	cmp	ip, #0
  a[0] = x;
     2fc:	e1c350b0 	strh	r5, [r3]
  if(!src || !dst)
     300:	0a000010 	beq	348 <main+0x348>
  while(*src && n) {
     304:	e5dc2000 	ldrb	r2, [ip]
     308:	e2880002 	add	r0, r8, #2
     30c:	e3520000 	cmp	r2, #0
     310:	0a00000a 	beq	340 <main+0x340>
     314:	e1a0100c 	mov	r1, ip
    *dst = *src;
     318:	e4c02001 	strb	r2, [r0], #1
  while(*src && n) {
     31c:	e5f12001 	ldrb	r2, [r1, #1]!
     320:	e261300e 	rsb	r3, r1, #14
     324:	e17c0003 	cmn	ip, r3
     328:	13a03001 	movne	r3, #1
     32c:	03a03000 	moveq	r3, #0
     330:	e3520000 	cmp	r2, #0
     334:	03a03000 	moveq	r3, #0
     338:	e3530000 	cmp	r3, #0
     33c:	1afffff5 	bne	318 <main+0x318>
  *dst = '\0';
     340:	e3a03000 	mov	r3, #0
     344:	e5c03000 	strb	r3, [r0]
    iappend(rootino, &de, sizeof(de));
     348:	e3a02010 	mov	r2, #16
     34c:	e1a01008 	mov	r1, r8
     350:	e3a00001 	mov	r0, #1
     354:	eb00012b 	bl	808 <iappend>

    while((cc = read(fd, buf, sizeof(buf))) > 0)
     358:	ea000002 	b	368 <main+0x368>
      iappend(inum, buf, cc);
     35c:	e24b1f89 	sub	r1, fp, #548	; 0x224
     360:	e1a00005 	mov	r0, r5
     364:	eb000127 	bl	808 <iappend>
    while((cc = read(fd, buf, sizeof(buf))) > 0)
     368:	e3a02c02 	mov	r2, #512	; 0x200
     36c:	e24b1f89 	sub	r1, fp, #548	; 0x224
     370:	e1a00004 	mov	r0, r4
     374:	eb00028d 	bl	db0 <read>
     378:	e2502000 	subs	r2, r0, #0
     37c:	cafffff6 	bgt	35c <main+0x35c>

    close(fd);
     380:	e1a00004 	mov	r0, r4
  for(i = 2; i < argc; i++){
     384:	e28aa001 	add	sl, sl, #1
    close(fd);
     388:	eb0002a2 	bl	e18 <close>
     38c:	eaffffb2 	b	25c <main+0x25c>
  }

  // fix size of root inode dir
  rinode(rootino, &din);
     390:	e24b1f99 	sub	r1, fp, #612	; 0x264
     394:	e3a00001 	mov	r0, #1
     398:	eb0000bb 	bl	68c <rinode>
  a[0] = x;
     39c:	e51b325c 	ldr	r3, [fp, #-604]	; 0xfffffda4
     3a0:	e3a02000 	mov	r2, #0
     3a4:	e54b2278 	strb	r2, [fp, #-632]	; 0xfffffd88
  off = xint(din.size);
  off = ((off/BSIZE) + 1) * BSIZE;
     3a8:	e3c33f7f 	bic	r3, r3, #508	; 0x1fc
  din.size = xint(off);
  winode(rootino, &din);
     3ac:	e24b1f99 	sub	r1, fp, #612	; 0x264
  off = ((off/BSIZE) + 1) * BSIZE;
     3b0:	e3c33003 	bic	r3, r3, #3
  winode(rootino, &din);
     3b4:	e3a00001 	mov	r0, #1
  off = ((off/BSIZE) + 1) * BSIZE;
     3b8:	e2833c02 	add	r3, r3, #512	; 0x200
  a[1] = x >> 8;
     3bc:	e1a0c423 	lsr	ip, r3, #8
  a[2] = x >> 16;
     3c0:	e1a02823 	lsr	r2, r3, #16
  a[1] = x >> 8;
     3c4:	e54bc277 	strb	ip, [fp, #-631]	; 0xfffffd89
  a[3] = x >> 24;
     3c8:	e1a03c23 	lsr	r3, r3, #24
  a[2] = x >> 16;
     3cc:	e54b2276 	strb	r2, [fp, #-630]	; 0xfffffd8a
  a[3] = x >> 24;
     3d0:	e54b3275 	strb	r3, [fp, #-629]	; 0xfffffd8b
  return y;
     3d4:	e51b3278 	ldr	r3, [fp, #-632]	; 0xfffffd88
  din.size = xint(off);
     3d8:	e50b325c 	str	r3, [fp, #-604]	; 0xfffffda4
  winode(rootino, &din);
     3dc:	eb00008e 	bl	61c <winode>

  balloc(usedblocks);
     3e0:	e5970000 	ldr	r0, [r7]
     3e4:	eb0000d9 	bl	750 <balloc>

  exit();
     3e8:	eb00023c 	bl	ce0 <exit>
      printf(1, "open failure: %s\n", argv[i]);
     3ec:	e5962000 	ldr	r2, [r6]
     3f0:	e3011678 	movw	r1, #5752	; 0x1678
     3f4:	e3a00001 	mov	r0, #1
     3f8:	e3401000 	movt	r1, #0
     3fc:	eb000390 	bl	1244 <printf>
      exit();
     400:	eb000236 	bl	ce0 <exit>
    assert(index(argv[i], '/') == 0);
     404:	e3a000b7 	mov	r0, #183	; 0xb7
     408:	ebffffff 	bl	40c <failure>

0000040c <failure>:
void failure(int line){
     40c:	e92d4800 	push	{fp, lr}
  printf(1, "assert failure at line: %d\n", line);
     410:	e1a02000 	mov	r2, r0
void failure(int line){
     414:	e28db004 	add	fp, sp, #4
  printf(1, "assert failure at line: %d\n", line);
     418:	e301155c 	movw	r1, #5468	; 0x155c
     41c:	e3a00001 	mov	r0, #1
     420:	e3401000 	movt	r1, #0
     424:	eb000386 	bl	1244 <printf>
  exit();
     428:	eb00022c 	bl	ce0 <exit>

0000042c <strncpy>:
  if(!src || !dst)
     42c:	e3500000 	cmp	r0, #0
     430:	13510000 	cmpne	r1, #0
char* strncpy(char* dst, const char* src, uint n) {
     434:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    return 0;
     438:	03a00000 	moveq	r0, #0
char* strncpy(char* dst, const char* src, uint n) {
     43c:	e28db000 	add	fp, sp, #0
  if(!src || !dst)
     440:	0a00000c 	beq	478 <strncpy+0x4c>
  while(*src && n) {
     444:	e5d13000 	ldrb	r3, [r1]
     448:	e3520000 	cmp	r2, #0
     44c:	13530000 	cmpne	r3, #0
     450:	0a00000b 	beq	484 <strncpy+0x58>
     454:	e0802002 	add	r2, r0, r2
     458:	e1a0c000 	mov	ip, r0
    *dst = *src;
     45c:	e4cc3001 	strb	r3, [ip], #1
  while(*src && n) {
     460:	e5f13001 	ldrb	r3, [r1, #1]!
     464:	e15c0002 	cmp	ip, r2
     468:	13530000 	cmpne	r3, #0
     46c:	1afffffa 	bne	45c <strncpy+0x30>
  *dst = '\0';
     470:	e3a03000 	mov	r3, #0
     474:	e5cc3000 	strb	r3, [ip]
}
     478:	e28bd000 	add	sp, fp, #0
     47c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     480:	e12fff1e 	bx	lr
  while(*src && n) {
     484:	e1a0c000 	mov	ip, r0
     488:	eafffff8 	b	470 <strncpy+0x44>

0000048c <index>:
  if(!src || !*src)
     48c:	e2503000 	subs	r3, r0, #0
     490:	0a000012 	beq	4e0 <index+0x54>
     494:	e5d32000 	ldrb	r2, [r3]
     498:	e3520000 	cmp	r2, #0
     49c:	0a00000f 	beq	4e0 <index+0x54>
char* index(char* src, char c) {
     4a0:	e92d4830 	push	{r4, r5, fp, lr}
     4a4:	e1a05003 	mov	r5, r3
     4a8:	e28db00c 	add	fp, sp, #12
     4ac:	e1a04001 	mov	r4, r1
  length = strlen(src);
     4b0:	eb000182 	bl	ac0 <strlen>
  while(*src && length--){
     4b4:	e5d53000 	ldrb	r3, [r5]
     4b8:	ea000004 	b	4d0 <index+0x44>
     4bc:	e3500000 	cmp	r0, #0
     4c0:	e2400001 	sub	r0, r0, #1
     4c4:	0a000003 	beq	4d8 <index+0x4c>
    if(*src == c)
     4c8:	e1540003 	cmp	r4, r3
     4cc:	0a000005 	beq	4e8 <index+0x5c>
  while(*src && length--){
     4d0:	e3530000 	cmp	r3, #0
     4d4:	1afffff8 	bne	4bc <index+0x30>
    return 0;
     4d8:	e3a00000 	mov	r0, #0
     4dc:	e8bd8830 	pop	{r4, r5, fp, pc}
     4e0:	e3a00000 	mov	r0, #0
}
     4e4:	e12fff1e 	bx	lr
    if(*src == c)
     4e8:	e1a00005 	mov	r0, r5
}
     4ec:	e8bd8830 	pop	{r4, r5, fp, pc}

000004f0 <xshort>:
{
     4f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     4f4:	e28db000 	add	fp, sp, #0
     4f8:	e24dd00c 	sub	sp, sp, #12
}
     4fc:	e28bd000 	add	sp, fp, #0
     500:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     504:	e12fff1e 	bx	lr

00000508 <xint>:
{
     508:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     50c:	e28db000 	add	fp, sp, #0
     510:	e24dd00c 	sub	sp, sp, #12
}
     514:	e28bd000 	add	sp, fp, #0
     518:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     51c:	e12fff1e 	bx	lr

00000520 <wsect>:
}

void
wsect(uint sec, void *buf)
{
     520:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     524:	e1a05480 	lsl	r5, r0, #9
     528:	e30146e4 	movw	r4, #5860	; 0x16e4
     52c:	e3404000 	movt	r4, #0
{
     530:	e28db014 	add	fp, sp, #20
     534:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     538:	e3a02000 	mov	r2, #0
     53c:	e1a01005 	mov	r1, r5
     540:	e5940000 	ldr	r0, [r4]
     544:	eb0001ff 	bl	d48 <lseek>
     548:	e1550000 	cmp	r5, r0
     54c:	1a00000a 	bne	57c <wsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(write(fsfd, buf, 512) != 512){
     550:	e1a01006 	mov	r1, r6
     554:	e5940000 	ldr	r0, [r4]
     558:	e3a02c02 	mov	r2, #512	; 0x200
     55c:	eb000220 	bl	de4 <write>
     560:	e3500c02 	cmp	r0, #512	; 0x200
     564:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "write");
     568:	e3011580 	movw	r1, #5504	; 0x1580
     56c:	e3a00001 	mov	r0, #1
     570:	e3401000 	movt	r1, #0
     574:	eb000332 	bl	1244 <printf>
    exit();
     578:	eb0001d8 	bl	ce0 <exit>
    printf(1, "lseek");
     57c:	e3011578 	movw	r1, #5496	; 0x1578
     580:	e3a00001 	mov	r0, #1
     584:	e3401000 	movt	r1, #0
     588:	eb00032d 	bl	1244 <printf>
    exit();
     58c:	eb0001d3 	bl	ce0 <exit>

00000590 <i2b>:
}

uint
i2b(uint inum)
{
  return (inum / IPB) + 2;
     590:	e1a001a0 	lsr	r0, r0, #3
{
     594:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
}
     598:	e2800002 	add	r0, r0, #2
{
     59c:	e28db000 	add	fp, sp, #0
}
     5a0:	e28bd000 	add	sp, fp, #0
     5a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     5a8:	e12fff1e 	bx	lr

000005ac <rsect>:
  *ip = *dip;
}

void
rsect(uint sec, void *buf)
{
     5ac:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     5b0:	e1a05480 	lsl	r5, r0, #9
     5b4:	e30146e4 	movw	r4, #5860	; 0x16e4
     5b8:	e3404000 	movt	r4, #0
{
     5bc:	e28db014 	add	fp, sp, #20
     5c0:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     5c4:	e3a02000 	mov	r2, #0
     5c8:	e1a01005 	mov	r1, r5
     5cc:	e5940000 	ldr	r0, [r4]
     5d0:	eb0001dc 	bl	d48 <lseek>
     5d4:	e1550000 	cmp	r5, r0
     5d8:	1a00000a 	bne	608 <rsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(read(fsfd, buf, 512) != 512){
     5dc:	e1a01006 	mov	r1, r6
     5e0:	e5940000 	ldr	r0, [r4]
     5e4:	e3a02c02 	mov	r2, #512	; 0x200
     5e8:	eb0001f0 	bl	db0 <read>
     5ec:	e3500c02 	cmp	r0, #512	; 0x200
     5f0:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "read");
     5f4:	e3011588 	movw	r1, #5512	; 0x1588
     5f8:	e3a00001 	mov	r0, #1
     5fc:	e3401000 	movt	r1, #0
     600:	eb00030f 	bl	1244 <printf>
    exit();
     604:	eb0001b5 	bl	ce0 <exit>
    printf(1, "lseek");
     608:	e3011578 	movw	r1, #5496	; 0x1578
     60c:	e3a00001 	mov	r0, #1
     610:	e3401000 	movt	r1, #0
     614:	eb00030a 	bl	1244 <printf>
    exit();
     618:	eb0001b0 	bl	ce0 <exit>

0000061c <winode>:
{
     61c:	e92d4870 	push	{r4, r5, r6, fp, lr}
  return (inum / IPB) + 2;
     620:	e1a061a0 	lsr	r6, r0, #3
     624:	e2866002 	add	r6, r6, #2
{
     628:	e28db010 	add	fp, sp, #16
     62c:	e1a04000 	mov	r4, r0
     630:	e24ddf81 	sub	sp, sp, #516	; 0x204
     634:	e1a05001 	mov	r5, r1
  rsect(bn, buf);
     638:	e24b1f85 	sub	r1, fp, #532	; 0x214
     63c:	e1a00006 	mov	r0, r6
     640:	ebffffd9 	bl	5ac <rsect>
  *dip = *ip;
     644:	e1a0e005 	mov	lr, r5
     648:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
  dip = ((struct dinode*)buf) + (inum % IPB);
     64c:	e204c007 	and	ip, r4, #7
  *dip = *ip;
     650:	e24b4014 	sub	r4, fp, #20
     654:	e084c30c 	add	ip, r4, ip, lsl #6
     658:	e24ccc02 	sub	ip, ip, #512	; 0x200
     65c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     660:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
     664:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     668:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
     66c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     670:	e89e000f 	ldm	lr, {r0, r1, r2, r3}
     674:	e88c000f 	stm	ip, {r0, r1, r2, r3}
  wsect(bn, buf);
     678:	e1a00006 	mov	r0, r6
     67c:	e24b1f85 	sub	r1, fp, #532	; 0x214
     680:	ebffffa6 	bl	520 <wsect>
}
     684:	e24bd010 	sub	sp, fp, #16
     688:	e8bd8870 	pop	{r4, r5, r6, fp, pc}

0000068c <rinode>:
{
     68c:	e92d4830 	push	{r4, r5, fp, lr}
     690:	e1a04000 	mov	r4, r0
     694:	e28db00c 	add	fp, sp, #12
  return (inum / IPB) + 2;
     698:	e1a001a0 	lsr	r0, r0, #3
{
     69c:	e24ddc02 	sub	sp, sp, #512	; 0x200
     6a0:	e1a05001 	mov	r5, r1
  rsect(bn, buf);
     6a4:	e24b1f83 	sub	r1, fp, #524	; 0x20c
     6a8:	e2800002 	add	r0, r0, #2
     6ac:	ebffffbe 	bl	5ac <rsect>
  dip = ((struct dinode*)buf) + (inum % IPB);
     6b0:	e204c007 	and	ip, r4, #7
  *ip = *dip;
     6b4:	e24b300c 	sub	r3, fp, #12
     6b8:	e1a0e005 	mov	lr, r5
     6bc:	e083c30c 	add	ip, r3, ip, lsl #6
     6c0:	e24ccc02 	sub	ip, ip, #512	; 0x200
     6c4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     6c8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     6cc:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     6d0:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     6d4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     6d8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     6dc:	e89c000f 	ldm	ip, {r0, r1, r2, r3}
     6e0:	e88e000f 	stm	lr, {r0, r1, r2, r3}
}
     6e4:	e24bd00c 	sub	sp, fp, #12
     6e8:	e8bd8830 	pop	{r4, r5, fp, pc}

000006ec <ialloc>:
}

uint
ialloc(ushort type)
{
  uint inum = freeinode++;
     6ec:	e30136a8 	movw	r3, #5800	; 0x16a8
     6f0:	e3403000 	movt	r3, #0
{
     6f4:	e92d4830 	push	{r4, r5, fp, lr}
     6f8:	e28db00c 	add	fp, sp, #12
     6fc:	e24dd048 	sub	sp, sp, #72	; 0x48
  uint inum = freeinode++;
     700:	e5934000 	ldr	r4, [r3]
{
     704:	e1a05000 	mov	r5, r0
  struct dinode din;

  memset(&din, 0, sizeof(din));
     708:	e3a02040 	mov	r2, #64	; 0x40
     70c:	e24b004c 	sub	r0, fp, #76	; 0x4c
     710:	e3a01000 	mov	r1, #0
  uint inum = freeinode++;
     714:	e284c001 	add	ip, r4, #1
     718:	e583c000 	str	ip, [r3]
  memset(&din, 0, sizeof(din));
     71c:	eb0000f8 	bl	b04 <memset>
  din.type = xshort(type);
  din.nlink = xshort(1);
  din.size = xint(0);
  winode(inum, &din);
     720:	e1a00004 	mov	r0, r4
     724:	e24b104c 	sub	r1, fp, #76	; 0x4c
  a[0] = x;
     728:	e3a03000 	mov	r3, #0
  a[0] = x;
     72c:	e3a02001 	mov	r2, #1
  din.type = xshort(type);
     730:	e14b54bc 	strh	r5, [fp, #-76]	; 0xffffffb4
  din.nlink = xshort(1);
     734:	e14b24b6 	strh	r2, [fp, #-70]	; 0xffffffba
  a[0] = x;
     738:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
  din.size = xint(0);
     73c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
  winode(inum, &din);
     740:	ebffffb5 	bl	61c <winode>
  return inum;
}
     744:	e1a00004 	mov	r0, r4
     748:	e24bd00c 	sub	sp, fp, #12
     74c:	e8bd8830 	pop	{r4, r5, fp, pc}

00000750 <balloc>:

void
balloc(int used)
{
     750:	e92d4810 	push	{r4, fp, lr}
  uchar buf[512];
  int i;

  printf(1, "balloc: first %d blocks have been allocated\n", used);
     754:	e1a02000 	mov	r2, r0
{
     758:	e28db008 	add	fp, sp, #8
     75c:	e1a04000 	mov	r4, r0
     760:	e24ddf81 	sub	sp, sp, #516	; 0x204
  printf(1, "balloc: first %d blocks have been allocated\n", used);
     764:	e3011590 	movw	r1, #5520	; 0x1590
     768:	e3401000 	movt	r1, #0
     76c:	e3a00001 	mov	r0, #1
     770:	eb0002b3 	bl	1244 <printf>
  assert(used < 512*8);
     774:	e3540a01 	cmp	r4, #4096	; 0x1000
     778:	aa000020 	bge	800 <balloc+0xb0>
  memset(buf, 0, 512);
     77c:	e3a02c02 	mov	r2, #512	; 0x200
     780:	e3a01000 	mov	r1, #0
     784:	e24b0f83 	sub	r0, fp, #524	; 0x20c
     788:	eb0000dd 	bl	b04 <memset>
  for(i = 0; i < used; i++){
     78c:	e3540000 	cmp	r4, #0
     790:	da00000a 	ble	7c0 <balloc+0x70>
     794:	e3a03000 	mov	r3, #0
    buf[i/8] = buf[i/8] | (0x1 << (i%8));
     798:	e3a0c001 	mov	ip, #1
     79c:	e24b200c 	sub	r2, fp, #12
     7a0:	e2030007 	and	r0, r3, #7
     7a4:	e08211c3 	add	r1, r2, r3, asr #3
  for(i = 0; i < used; i++){
     7a8:	e2833001 	add	r3, r3, #1
     7ac:	e1540003 	cmp	r4, r3
    buf[i/8] = buf[i/8] | (0x1 << (i%8));
     7b0:	e5512200 	ldrb	r2, [r1, #-512]	; 0xfffffe00
     7b4:	e182201c 	orr	r2, r2, ip, lsl r0
     7b8:	e5412200 	strb	r2, [r1, #-512]	; 0xfffffe00
  for(i = 0; i < used; i++){
     7bc:	1afffff6 	bne	79c <balloc+0x4c>
  }
  printf(1, "balloc: write bitmap block at sector %d\n", ninodes/IPB + 3);
     7c0:	e30146a8 	movw	r4, #5800	; 0x16a8
     7c4:	e3404000 	movt	r4, #0
     7c8:	e3a00001 	mov	r0, #1
     7cc:	e30115c0 	movw	r1, #5568	; 0x15c0
     7d0:	e5942004 	ldr	r2, [r4, #4]
     7d4:	e3401000 	movt	r1, #0
     7d8:	e1a021a2 	lsr	r2, r2, #3
     7dc:	e2822003 	add	r2, r2, #3
     7e0:	eb000297 	bl	1244 <printf>
  wsect(ninodes / IPB + 3, buf);
     7e4:	e5940004 	ldr	r0, [r4, #4]
     7e8:	e24b1f83 	sub	r1, fp, #524	; 0x20c
     7ec:	e1a001a0 	lsr	r0, r0, #3
     7f0:	e2800003 	add	r0, r0, #3
     7f4:	ebffff49 	bl	520 <wsect>
}
     7f8:	e24bd008 	sub	sp, fp, #8
     7fc:	e8bd8810 	pop	{r4, fp, pc}
  assert(used < 512*8);
     800:	e300012e 	movw	r0, #302	; 0x12e
     804:	ebffff00 	bl	40c <failure>

00000808 <iappend>:

#define min(a, b) ((a) < (b) ? (a) : (b))

void
iappend(uint inum, void *xp, int n)
{
     808:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     80c:	e28db020 	add	fp, sp, #32
     810:	e1a07001 	mov	r7, r1
     814:	e24dde45 	sub	sp, sp, #1104	; 0x450
  struct dinode din;
  char buf[512];
  uint indirect[NINDIRECT];
  uint x;

  rinode(inum, &din);
     818:	e24b1e46 	sub	r1, fp, #1120	; 0x460
{
     81c:	e24dd004 	sub	sp, sp, #4
  rinode(inum, &din);
     820:	e2411004 	sub	r1, r1, #4
{
     824:	e1a06002 	mov	r6, r2
     828:	e50b0470 	str	r0, [fp, #-1136]	; 0xfffffb90
  rinode(inum, &din);
     82c:	ebffff96 	bl	68c <rinode>
  a[0] = x;
     830:	e51b545c 	ldr	r5, [fp, #-1116]	; 0xfffffba4

  off = xint(din.size);
  while(n > 0){
     834:	e3560000 	cmp	r6, #0
  a[0] = x;
     838:	e50b5224 	str	r5, [fp, #-548]	; 0xfffffddc
  while(n > 0){
     83c:	da000075 	ble	a18 <iappend+0x210>
    fbn = off / 512;
    assert(fbn < MAXFILE);
     840:	e3550b46 	cmp	r5, #71680	; 0x11800
    fbn = off / 512;
     844:	e1a044a5 	lsr	r4, r5, #9
    assert(fbn < MAXFILE);
     848:	2a00007a 	bcs	a38 <iappend+0x230>
     84c:	e30196c8 	movw	r9, #5832	; 0x16c8
      }
      // printf("read indirect block\n");
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
      if(indirect[fbn - NDIRECT] == 0){
        indirect[fbn - NDIRECT] = xint(freeblock++);
        usedblocks++;
     850:	e30186cc 	movw	r8, #5836	; 0x16cc
    }
    n1 = min(n, (fbn + 1) * 512 - off);
    rsect(x, buf);
    memmove(p, buf + off - (fbn * 512), n1);
    wsect(x, buf);
	printf(1, "inum: %d data sector %d \n",inum,  x);
     854:	e30135ec 	movw	r3, #5612	; 0x15ec
     858:	e3409000 	movt	r9, #0
     85c:	e3403000 	movt	r3, #0
        usedblocks++;
     860:	e3408000 	movt	r8, #0
	printf(1, "inum: %d data sector %d \n",inum,  x);
     864:	e50b3474 	str	r3, [fp, #-1140]	; 0xfffffb8c
     868:	ea000039 	b	954 <iappend+0x14c>
      if(xint(din.addrs[fbn]) == 0){
     86c:	e2842002 	add	r2, r4, #2
     870:	e24b3024 	sub	r3, fp, #36	; 0x24
     874:	e0832102 	add	r2, r3, r2, lsl #2
     878:	e512343c 	ldr	r3, [r2, #-1084]	; 0xfffffbc4
     87c:	e3530000 	cmp	r3, #0
  a[1] = x >> 8;
     880:	e7e70453 	ubfx	r0, r3, #8, #8
  a[0] = x;
     884:	e6efc073 	uxtb	ip, r3
  a[2] = x >> 16;
     888:	e7e71853 	ubfx	r1, r3, #16, #8
  a[3] = x >> 24;
     88c:	e1a03c23 	lsr	r3, r3, #24
      if(xint(din.addrs[fbn]) == 0){
     890:	1a00000a 	bne	8c0 <iappend+0xb8>
        din.addrs[fbn] = xint(freeblock++);
     894:	e5993000 	ldr	r3, [r9]
        usedblocks++;
     898:	e598e000 	ldr	lr, [r8]
     89c:	e7e70453 	ubfx	r0, r3, #8, #8
     8a0:	e7e71853 	ubfx	r1, r3, #16, #8
        din.addrs[fbn] = xint(freeblock++);
     8a4:	e502343c 	str	r3, [r2, #-1084]	; 0xfffffbc4
     8a8:	e6efc073 	uxtb	ip, r3
     8ac:	e2832001 	add	r2, r3, #1
     8b0:	e1a03c23 	lsr	r3, r3, #24
        usedblocks++;
     8b4:	e28ee001 	add	lr, lr, #1
        din.addrs[fbn] = xint(freeblock++);
     8b8:	e5892000 	str	r2, [r9]
        usedblocks++;
     8bc:	e588e000 	str	lr, [r8]
  a[0] = x;
     8c0:	e54bc468 	strb	ip, [fp, #-1128]	; 0xfffffb98
  a[1] = x >> 8;
     8c4:	e54b0467 	strb	r0, [fp, #-1127]	; 0xfffffb99
  a[2] = x >> 16;
     8c8:	e54b1466 	strb	r1, [fp, #-1126]	; 0xfffffb9a
  a[3] = x >> 24;
     8cc:	e54b3465 	strb	r3, [fp, #-1125]	; 0xfffffb9b
  return y;
     8d0:	e51ba468 	ldr	sl, [fp, #-1128]	; 0xfffffb98
    n1 = min(n, (fbn + 1) * 512 - off);
     8d4:	e2844001 	add	r4, r4, #1
    rsect(x, buf);
     8d8:	e24b1e42 	sub	r1, fp, #1056	; 0x420
     8dc:	e2411004 	sub	r1, r1, #4
     8e0:	e1a0000a 	mov	r0, sl
    n1 = min(n, (fbn + 1) * 512 - off);
     8e4:	e0654484 	rsb	r4, r5, r4, lsl #9
     8e8:	e1540006 	cmp	r4, r6
     8ec:	21a04006 	movcs	r4, r6
    rsect(x, buf);
     8f0:	ebffff2d 	bl	5ac <rsect>
    memmove(p, buf + off - (fbn * 512), n1);
     8f4:	e24b3e42 	sub	r3, fp, #1056	; 0x420
     8f8:	e7e81055 	ubfx	r1, r5, #0, #9
     8fc:	e2433004 	sub	r3, r3, #4
     900:	e1a02004 	mov	r2, r4
     904:	e0831001 	add	r1, r3, r1
     908:	e1a00007 	mov	r0, r7
     90c:	eb0000d9 	bl	c78 <memmove>
    wsect(x, buf);
     910:	e24b1e42 	sub	r1, fp, #1056	; 0x420
     914:	e2411004 	sub	r1, r1, #4
     918:	e1a0000a 	mov	r0, sl
     91c:	ebfffeff 	bl	520 <wsect>
    n -= n1;
     920:	e0466004 	sub	r6, r6, r4
	printf(1, "inum: %d data sector %d \n",inum,  x);
     924:	e1a0300a 	mov	r3, sl
     928:	e51b2470 	ldr	r2, [fp, #-1136]	; 0xfffffb90
     92c:	e51b1474 	ldr	r1, [fp, #-1140]	; 0xfffffb8c
     930:	e3a00001 	mov	r0, #1
     934:	eb000242 	bl	1244 <printf>
  while(n > 0){
     938:	e3560000 	cmp	r6, #0
    off += n1;
     93c:	e0855004 	add	r5, r5, r4
    p += n1;
     940:	e0877004 	add	r7, r7, r4
  while(n > 0){
     944:	da000033 	ble	a18 <iappend+0x210>
    assert(fbn < MAXFILE);
     948:	e3550b46 	cmp	r5, #71680	; 0x11800
    fbn = off / 512;
     94c:	e1a044a5 	lsr	r4, r5, #9
    assert(fbn < MAXFILE);
     950:	2a000038 	bcs	a38 <iappend+0x230>
    if(fbn < NDIRECT){
     954:	e3550b06 	cmp	r5, #6144	; 0x1800
     958:	3affffc3 	bcc	86c <iappend+0x64>
      if(xint(din.addrs[NDIRECT]) == 0){
     95c:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
     960:	e3530000 	cmp	r3, #0
  a[1] = x >> 8;
     964:	e7e71453 	ubfx	r1, r3, #8, #8
  a[0] = x;
     968:	e6ef0073 	uxtb	r0, r3
  a[2] = x >> 16;
     96c:	e7e72853 	ubfx	r2, r3, #16, #8
  a[3] = x >> 24;
     970:	e1a03c23 	lsr	r3, r3, #24
      if(xint(din.addrs[NDIRECT]) == 0){
     974:	1a00000a 	bne	9a4 <iappend+0x19c>
        din.addrs[NDIRECT] = xint(freeblock++);
     978:	e5993000 	ldr	r3, [r9]
        usedblocks++;
     97c:	e598e000 	ldr	lr, [r8]
        din.addrs[NDIRECT] = xint(freeblock++);
     980:	e283c001 	add	ip, r3, #1
     984:	e7e71453 	ubfx	r1, r3, #8, #8
     988:	e7e72853 	ubfx	r2, r3, #16, #8
     98c:	e6ef0073 	uxtb	r0, r3
     990:	e50b3428 	str	r3, [fp, #-1064]	; 0xfffffbd8
     994:	e1a03c23 	lsr	r3, r3, #24
        usedblocks++;
     998:	e28ee001 	add	lr, lr, #1
        din.addrs[NDIRECT] = xint(freeblock++);
     99c:	e589c000 	str	ip, [r9]
        usedblocks++;
     9a0:	e588e000 	str	lr, [r8]
  a[1] = x >> 8;
     9a4:	e54b1467 	strb	r1, [fp, #-1127]	; 0xfffffb99
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9a8:	e24b1f89 	sub	r1, fp, #548	; 0x224
  a[2] = x >> 16;
     9ac:	e54b2466 	strb	r2, [fp, #-1126]	; 0xfffffb9a
  a[3] = x >> 24;
     9b0:	e54b3465 	strb	r3, [fp, #-1125]	; 0xfffffb9b
  a[0] = x;
     9b4:	e54b0468 	strb	r0, [fp, #-1128]	; 0xfffffb98
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9b8:	e51b0468 	ldr	r0, [fp, #-1128]	; 0xfffffb98
     9bc:	ebfffefa 	bl	5ac <rsect>
      if(indirect[fbn - NDIRECT] == 0){
     9c0:	e244300c 	sub	r3, r4, #12
     9c4:	e24b2024 	sub	r2, fp, #36	; 0x24
     9c8:	e082a103 	add	sl, r2, r3, lsl #2
     9cc:	e51a2200 	ldr	r2, [sl, #-512]	; 0xfffffe00
     9d0:	e3520000 	cmp	r2, #0
     9d4:	0a000002 	beq	9e4 <iappend+0x1dc>
  return y;
     9d8:	e1a0a002 	mov	sl, r2
  a[0] = x;
     9dc:	e50b2468 	str	r2, [fp, #-1128]	; 0xfffffb98
  return y;
     9e0:	eaffffbb 	b	8d4 <iappend+0xcc>
        indirect[fbn - NDIRECT] = xint(freeblock++);
     9e4:	e5992000 	ldr	r2, [r9]
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9e8:	e24b1f89 	sub	r1, fp, #548	; 0x224
  a[0] = x;
     9ec:	e51b0428 	ldr	r0, [fp, #-1064]	; 0xfffffbd8
        usedblocks++;
     9f0:	e598c000 	ldr	ip, [r8]
        indirect[fbn - NDIRECT] = xint(freeblock++);
     9f4:	e50a2200 	str	r2, [sl, #-512]	; 0xfffffe00
     9f8:	e2822001 	add	r2, r2, #1
        usedblocks++;
     9fc:	e28cc001 	add	ip, ip, #1
        indirect[fbn - NDIRECT] = xint(freeblock++);
     a00:	e5892000 	str	r2, [r9]
  a[0] = x;
     a04:	e50b0468 	str	r0, [fp, #-1128]	; 0xfffffb98
        usedblocks++;
     a08:	e588c000 	str	ip, [r8]
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     a0c:	ebfffec3 	bl	520 <wsect>
     a10:	e51a2200 	ldr	r2, [sl, #-512]	; 0xfffffe00
     a14:	eaffffef 	b	9d8 <iappend+0x1d0>
  }
  din.size = xint(off);
  winode(inum, &din);
     a18:	e24b1e46 	sub	r1, fp, #1120	; 0x460
     a1c:	e51b0470 	ldr	r0, [fp, #-1136]	; 0xfffffb90
     a20:	e2411004 	sub	r1, r1, #4
  a[0] = x;
     a24:	e50b5468 	str	r5, [fp, #-1128]	; 0xfffffb98
  din.size = xint(off);
     a28:	e50b545c 	str	r5, [fp, #-1116]	; 0xfffffba4
  winode(inum, &din);
     a2c:	ebfffefa 	bl	61c <winode>
}
     a30:	e24bd020 	sub	sp, fp, #32
     a34:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    assert(fbn < MAXFILE);
     a38:	e3a00f52 	mov	r0, #328	; 0x148
     a3c:	ebfffe72 	bl	40c <failure>

00000a40 <strcpy>:
     a40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a44:	e2402001 	sub	r2, r0, #1
     a48:	e28db000 	add	fp, sp, #0
     a4c:	e4d13001 	ldrb	r3, [r1], #1
     a50:	e3530000 	cmp	r3, #0
     a54:	e5e23001 	strb	r3, [r2, #1]!
     a58:	1afffffb 	bne	a4c <strcpy+0xc>
     a5c:	e28bd000 	add	sp, fp, #0
     a60:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a64:	e12fff1e 	bx	lr

00000a68 <strcmp>:
     a68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a6c:	e28db000 	add	fp, sp, #0
     a70:	e5d03000 	ldrb	r3, [r0]
     a74:	e5d12000 	ldrb	r2, [r1]
     a78:	e3530000 	cmp	r3, #0
     a7c:	1a000004 	bne	a94 <strcmp+0x2c>
     a80:	ea000005 	b	a9c <strcmp+0x34>
     a84:	e5f03001 	ldrb	r3, [r0, #1]!
     a88:	e3530000 	cmp	r3, #0
     a8c:	0a000006 	beq	aac <strcmp+0x44>
     a90:	e5f12001 	ldrb	r2, [r1, #1]!
     a94:	e1530002 	cmp	r3, r2
     a98:	0afffff9 	beq	a84 <strcmp+0x1c>
     a9c:	e0430002 	sub	r0, r3, r2
     aa0:	e28bd000 	add	sp, fp, #0
     aa4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     aa8:	e12fff1e 	bx	lr
     aac:	e5d12001 	ldrb	r2, [r1, #1]
     ab0:	e0430002 	sub	r0, r3, r2
     ab4:	e28bd000 	add	sp, fp, #0
     ab8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     abc:	e12fff1e 	bx	lr

00000ac0 <strlen>:
     ac0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ac4:	e28db000 	add	fp, sp, #0
     ac8:	e5d03000 	ldrb	r3, [r0]
     acc:	e3530000 	cmp	r3, #0
     ad0:	0a000009 	beq	afc <strlen+0x3c>
     ad4:	e1a02000 	mov	r2, r0
     ad8:	e3a03000 	mov	r3, #0
     adc:	e5f21001 	ldrb	r1, [r2, #1]!
     ae0:	e2833001 	add	r3, r3, #1
     ae4:	e3510000 	cmp	r1, #0
     ae8:	e1a00003 	mov	r0, r3
     aec:	1afffffa 	bne	adc <strlen+0x1c>
     af0:	e28bd000 	add	sp, fp, #0
     af4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     af8:	e12fff1e 	bx	lr
     afc:	e1a00003 	mov	r0, r3
     b00:	eafffffa 	b	af0 <strlen+0x30>

00000b04 <memset>:
     b04:	e3520000 	cmp	r2, #0
     b08:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b0c:	e28db000 	add	fp, sp, #0
     b10:	0a000004 	beq	b28 <memset+0x24>
     b14:	e6ef1071 	uxtb	r1, r1
     b18:	e0802002 	add	r2, r0, r2
     b1c:	e4c01001 	strb	r1, [r0], #1
     b20:	e1520000 	cmp	r2, r0
     b24:	1afffffc 	bne	b1c <memset+0x18>
     b28:	e28bd000 	add	sp, fp, #0
     b2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b30:	e12fff1e 	bx	lr

00000b34 <strchr>:
     b34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b38:	e28db000 	add	fp, sp, #0
     b3c:	e5d02000 	ldrb	r2, [r0]
     b40:	e3520000 	cmp	r2, #0
     b44:	0a00000b 	beq	b78 <strchr+0x44>
     b48:	e1510002 	cmp	r1, r2
     b4c:	1a000002 	bne	b5c <strchr+0x28>
     b50:	ea000005 	b	b6c <strchr+0x38>
     b54:	e1530001 	cmp	r3, r1
     b58:	0a000003 	beq	b6c <strchr+0x38>
     b5c:	e5f03001 	ldrb	r3, [r0, #1]!
     b60:	e3530000 	cmp	r3, #0
     b64:	1afffffa 	bne	b54 <strchr+0x20>
     b68:	e1a00003 	mov	r0, r3
     b6c:	e28bd000 	add	sp, fp, #0
     b70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b74:	e12fff1e 	bx	lr
     b78:	e1a00002 	mov	r0, r2
     b7c:	eafffffa 	b	b6c <strchr+0x38>

00000b80 <gets>:
     b80:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     b84:	e1a08000 	mov	r8, r0
     b88:	e28db018 	add	fp, sp, #24
     b8c:	e1a07001 	mov	r7, r1
     b90:	e24dd00c 	sub	sp, sp, #12
     b94:	e2406001 	sub	r6, r0, #1
     b98:	e3a05000 	mov	r5, #0
     b9c:	ea000008 	b	bc4 <gets+0x44>
     ba0:	eb000082 	bl	db0 <read>
     ba4:	e3500000 	cmp	r0, #0
     ba8:	da00000b 	ble	bdc <gets+0x5c>
     bac:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
     bb0:	e1a05004 	mov	r5, r4
     bb4:	e353000d 	cmp	r3, #13
     bb8:	1353000a 	cmpne	r3, #10
     bbc:	e5e63001 	strb	r3, [r6, #1]!
     bc0:	0a000005 	beq	bdc <gets+0x5c>
     bc4:	e3a02001 	mov	r2, #1
     bc8:	e0854002 	add	r4, r5, r2
     bcc:	e1540007 	cmp	r4, r7
     bd0:	e24b101d 	sub	r1, fp, #29
     bd4:	e3a00000 	mov	r0, #0
     bd8:	bafffff0 	blt	ba0 <gets+0x20>
     bdc:	e3a03000 	mov	r3, #0
     be0:	e1a00008 	mov	r0, r8
     be4:	e7c83005 	strb	r3, [r8, r5]
     be8:	e24bd018 	sub	sp, fp, #24
     bec:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000bf0 <stat>:
     bf0:	e92d4830 	push	{r4, r5, fp, lr}
     bf4:	e1a04001 	mov	r4, r1
     bf8:	e28db00c 	add	fp, sp, #12
     bfc:	e3a01000 	mov	r1, #0
     c00:	eb0000ab 	bl	eb4 <open>
     c04:	e2505000 	subs	r5, r0, #0
     c08:	ba000006 	blt	c28 <stat+0x38>
     c0c:	e1a01004 	mov	r1, r4
     c10:	eb0000ce 	bl	f50 <fstat>
     c14:	e1a04000 	mov	r4, r0
     c18:	e1a00005 	mov	r0, r5
     c1c:	eb00007d 	bl	e18 <close>
     c20:	e1a00004 	mov	r0, r4
     c24:	e8bd8830 	pop	{r4, r5, fp, pc}
     c28:	e3e04000 	mvn	r4, #0
     c2c:	eafffffb 	b	c20 <stat+0x30>

00000c30 <atoi>:
     c30:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c34:	e28db000 	add	fp, sp, #0
     c38:	e5d02000 	ldrb	r2, [r0]
     c3c:	e2423030 	sub	r3, r2, #48	; 0x30
     c40:	e3530009 	cmp	r3, #9
     c44:	e3a03000 	mov	r3, #0
     c48:	8a000006 	bhi	c68 <atoi+0x38>
     c4c:	e3a0c00a 	mov	ip, #10
     c50:	e023239c 	mla	r3, ip, r3, r2
     c54:	e5f02001 	ldrb	r2, [r0, #1]!
     c58:	e2421030 	sub	r1, r2, #48	; 0x30
     c5c:	e3510009 	cmp	r1, #9
     c60:	e2433030 	sub	r3, r3, #48	; 0x30
     c64:	9afffff9 	bls	c50 <atoi+0x20>
     c68:	e1a00003 	mov	r0, r3
     c6c:	e28bd000 	add	sp, fp, #0
     c70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c74:	e12fff1e 	bx	lr

00000c78 <memmove>:
     c78:	e3520000 	cmp	r2, #0
     c7c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c80:	e28db000 	add	fp, sp, #0
     c84:	da000005 	ble	ca0 <memmove+0x28>
     c88:	e0812002 	add	r2, r1, r2
     c8c:	e2403001 	sub	r3, r0, #1
     c90:	e4d1c001 	ldrb	ip, [r1], #1
     c94:	e1510002 	cmp	r1, r2
     c98:	e5e3c001 	strb	ip, [r3, #1]!
     c9c:	1afffffb 	bne	c90 <memmove+0x18>
     ca0:	e28bd000 	add	sp, fp, #0
     ca4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     ca8:	e12fff1e 	bx	lr

00000cac <fork>:
     cac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     cb0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     cb4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     cb8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     cbc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     cc0:	e3a00001 	mov	r0, #1
     cc4:	ef000040 	svc	0x00000040
     cc8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ccc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cd0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     cd4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     cd8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     cdc:	e12fff1e 	bx	lr

00000ce0 <exit>:
     ce0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ce4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ce8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     cec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     cf0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     cf4:	e3a00002 	mov	r0, #2
     cf8:	ef000040 	svc	0x00000040
     cfc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d00:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d04:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d08:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d0c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d10:	e12fff1e 	bx	lr

00000d14 <wait>:
     d14:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d18:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d1c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d20:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d24:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d28:	e3a00003 	mov	r0, #3
     d2c:	ef000040 	svc	0x00000040
     d30:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d34:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d38:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d3c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d40:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d44:	e12fff1e 	bx	lr

00000d48 <lseek>:
     d48:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d4c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d50:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d54:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d58:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d5c:	e3a00016 	mov	r0, #22
     d60:	ef000040 	svc	0x00000040
     d64:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d68:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d6c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d70:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d74:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d78:	e12fff1e 	bx	lr

00000d7c <pipe>:
     d7c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d80:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d84:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d88:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d8c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d90:	e3a00004 	mov	r0, #4
     d94:	ef000040 	svc	0x00000040
     d98:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d9c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     da0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     da4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     da8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     dac:	e12fff1e 	bx	lr

00000db0 <read>:
     db0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     db4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     db8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     dbc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     dc0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     dc4:	e3a00005 	mov	r0, #5
     dc8:	ef000040 	svc	0x00000040
     dcc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dd0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dd4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     dd8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ddc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     de0:	e12fff1e 	bx	lr

00000de4 <write>:
     de4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     de8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     dec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     df0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     df4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     df8:	e3a00010 	mov	r0, #16
     dfc:	ef000040 	svc	0x00000040
     e00:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e04:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e08:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e0c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e10:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e14:	e12fff1e 	bx	lr

00000e18 <close>:
     e18:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e1c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e20:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e24:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e28:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e2c:	e3a00015 	mov	r0, #21
     e30:	ef000040 	svc	0x00000040
     e34:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e38:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e3c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e40:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e44:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e48:	e12fff1e 	bx	lr

00000e4c <kill>:
     e4c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e50:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e54:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e58:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e5c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e60:	e3a00006 	mov	r0, #6
     e64:	ef000040 	svc	0x00000040
     e68:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e6c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e70:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e74:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e78:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e7c:	e12fff1e 	bx	lr

00000e80 <exec>:
     e80:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e84:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e88:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e8c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e90:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e94:	e3a00007 	mov	r0, #7
     e98:	ef000040 	svc	0x00000040
     e9c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ea0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ea4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ea8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     eac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     eb0:	e12fff1e 	bx	lr

00000eb4 <open>:
     eb4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     eb8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ebc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ec0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ec4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ec8:	e3a0000f 	mov	r0, #15
     ecc:	ef000040 	svc	0x00000040
     ed0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ed4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ed8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     edc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ee0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ee4:	e12fff1e 	bx	lr

00000ee8 <mknod>:
     ee8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     eec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ef0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ef4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ef8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     efc:	e3a00011 	mov	r0, #17
     f00:	ef000040 	svc	0x00000040
     f04:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f08:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f0c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f10:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f14:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f18:	e12fff1e 	bx	lr

00000f1c <unlink>:
     f1c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f20:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f24:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f28:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f2c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f30:	e3a00012 	mov	r0, #18
     f34:	ef000040 	svc	0x00000040
     f38:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f3c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f40:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f44:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f4c:	e12fff1e 	bx	lr

00000f50 <fstat>:
     f50:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f54:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f58:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f5c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f60:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f64:	e3a00008 	mov	r0, #8
     f68:	ef000040 	svc	0x00000040
     f6c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f70:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f74:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f78:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f80:	e12fff1e 	bx	lr

00000f84 <link>:
     f84:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f88:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f8c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f90:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f94:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f98:	e3a00013 	mov	r0, #19
     f9c:	ef000040 	svc	0x00000040
     fa0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fa4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fa8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fb4:	e12fff1e 	bx	lr

00000fb8 <mkdir>:
     fb8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fbc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fc0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fc4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fc8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fcc:	e3a00014 	mov	r0, #20
     fd0:	ef000040 	svc	0x00000040
     fd4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fd8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fdc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fe0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fe4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fe8:	e12fff1e 	bx	lr

00000fec <chdir>:
     fec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ff0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ff4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ff8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ffc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1000:	e3a00009 	mov	r0, #9
    1004:	ef000040 	svc	0x00000040
    1008:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    100c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1010:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1014:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1018:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    101c:	e12fff1e 	bx	lr

00001020 <dup>:
    1020:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1024:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1028:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    102c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1030:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1034:	e3a0000a 	mov	r0, #10
    1038:	ef000040 	svc	0x00000040
    103c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1040:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1044:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1048:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    104c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1050:	e12fff1e 	bx	lr

00001054 <getpid>:
    1054:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1058:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    105c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1060:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1064:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1068:	e3a0000b 	mov	r0, #11
    106c:	ef000040 	svc	0x00000040
    1070:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1074:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1078:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    107c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1080:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1084:	e12fff1e 	bx	lr

00001088 <sbrk>:
    1088:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    108c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1090:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1094:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1098:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    109c:	e3a0000c 	mov	r0, #12
    10a0:	ef000040 	svc	0x00000040
    10a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10b8:	e12fff1e 	bx	lr

000010bc <sleep>:
    10bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10d0:	e3a0000d 	mov	r0, #13
    10d4:	ef000040 	svc	0x00000040
    10d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10ec:	e12fff1e 	bx	lr

000010f0 <uptime>:
    10f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1100:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1104:	e3a0000e 	mov	r0, #14
    1108:	ef000040 	svc	0x00000040
    110c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1110:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1114:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1118:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    111c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1120:	e12fff1e 	bx	lr

00001124 <printint>:
    1124:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    1128:	e1a09fa1 	lsr	r9, r1, #31
    112c:	e3530000 	cmp	r3, #0
    1130:	03a09000 	moveq	r9, #0
    1134:	12099001 	andne	r9, r9, #1
    1138:	e28db01c 	add	fp, sp, #28
    113c:	e3590000 	cmp	r9, #0
    1140:	e301868c 	movw	r8, #5772	; 0x168c
    1144:	1261e000 	rsbne	lr, r1, #0
    1148:	e3408000 	movt	r8, #0
    114c:	e24b602d 	sub	r6, fp, #45	; 0x2d
    1150:	e1a04000 	mov	r4, r0
    1154:	13a09001 	movne	r9, #1
    1158:	01a0e001 	moveq	lr, r1
    115c:	e3a07000 	mov	r7, #0
    1160:	e3a05001 	mov	r5, #1
    1164:	e24dd018 	sub	sp, sp, #24
    1168:	e3a0c000 	mov	ip, #0
    116c:	e3a0301f 	mov	r3, #31
    1170:	e1a0100c 	mov	r1, ip
    1174:	e1a0033e 	lsr	r0, lr, r3
    1178:	e2000001 	and	r0, r0, #1
    117c:	e1801081 	orr	r1, r0, r1, lsl #1
    1180:	e1520001 	cmp	r2, r1
    1184:	90411002 	subls	r1, r1, r2
    1188:	918cc315 	orrls	ip, ip, r5, lsl r3
    118c:	e2533001 	subs	r3, r3, #1
    1190:	2afffff7 	bcs	1174 <printint+0x50>
    1194:	e061e29c 	mls	r1, ip, r2, lr
    1198:	e35c0000 	cmp	ip, #0
    119c:	e1a0e00c 	mov	lr, ip
    11a0:	e2873001 	add	r3, r7, #1
    11a4:	e7d81001 	ldrb	r1, [r8, r1]
    11a8:	e5e61001 	strb	r1, [r6, #1]!
    11ac:	11a07003 	movne	r7, r3
    11b0:	1affffec 	bne	1168 <printint+0x44>
    11b4:	e3590000 	cmp	r9, #0
    11b8:	124b201c 	subne	r2, fp, #28
    11bc:	10822003 	addne	r2, r2, r3
    11c0:	13a0102d 	movne	r1, #45	; 0x2d
    11c4:	12873002 	addne	r3, r7, #2
    11c8:	15421010 	strbne	r1, [r2, #-16]
    11cc:	e24b202c 	sub	r2, fp, #44	; 0x2c
    11d0:	e2435001 	sub	r5, r3, #1
    11d4:	e0826003 	add	r6, r2, r3
    11d8:	e5763001 	ldrb	r3, [r6, #-1]!
    11dc:	e2455001 	sub	r5, r5, #1
    11e0:	e3a02001 	mov	r2, #1
    11e4:	e24b102d 	sub	r1, fp, #45	; 0x2d
    11e8:	e1a00004 	mov	r0, r4
    11ec:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    11f0:	ebfffefb 	bl	de4 <write>
    11f4:	e3750001 	cmn	r5, #1
    11f8:	1afffff6 	bne	11d8 <printint+0xb4>
    11fc:	e24bd01c 	sub	sp, fp, #28
    1200:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00001204 <div>:
    1204:	e92d4810 	push	{r4, fp, lr}
    1208:	e3a02000 	mov	r2, #0
    120c:	e28db008 	add	fp, sp, #8
    1210:	e1a0e000 	mov	lr, r0
    1214:	e3a0301f 	mov	r3, #31
    1218:	e1a00002 	mov	r0, r2
    121c:	e3a04001 	mov	r4, #1
    1220:	e1a0c33e 	lsr	ip, lr, r3
    1224:	e20cc001 	and	ip, ip, #1
    1228:	e18c2082 	orr	r2, ip, r2, lsl #1
    122c:	e1520001 	cmp	r2, r1
    1230:	20422001 	subcs	r2, r2, r1
    1234:	21800314 	orrcs	r0, r0, r4, lsl r3
    1238:	e2533001 	subs	r3, r3, #1
    123c:	2afffff7 	bcs	1220 <div+0x1c>
    1240:	e8bd8810 	pop	{r4, fp, pc}

00001244 <printf>:
    1244:	e92d000e 	push	{r1, r2, r3}
    1248:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    124c:	e28db018 	add	fp, sp, #24
    1250:	e24dd008 	sub	sp, sp, #8
    1254:	e59b6004 	ldr	r6, [fp, #4]
    1258:	e5d64000 	ldrb	r4, [r6]
    125c:	e3540000 	cmp	r4, #0
    1260:	0a00002b 	beq	1314 <printf+0xd0>
    1264:	e1a07000 	mov	r7, r0
    1268:	e28b8008 	add	r8, fp, #8
    126c:	e3a05000 	mov	r5, #0
    1270:	ea00000a 	b	12a0 <printf+0x5c>
    1274:	e3540025 	cmp	r4, #37	; 0x25
    1278:	01a05004 	moveq	r5, r4
    127c:	0a000004 	beq	1294 <printf+0x50>
    1280:	e24b1018 	sub	r1, fp, #24
    1284:	e3a02001 	mov	r2, #1
    1288:	e1a00007 	mov	r0, r7
    128c:	e5614006 	strb	r4, [r1, #-6]!
    1290:	ebfffed3 	bl	de4 <write>
    1294:	e5f64001 	ldrb	r4, [r6, #1]!
    1298:	e3540000 	cmp	r4, #0
    129c:	0a00001c 	beq	1314 <printf+0xd0>
    12a0:	e3550000 	cmp	r5, #0
    12a4:	0afffff2 	beq	1274 <printf+0x30>
    12a8:	e3550025 	cmp	r5, #37	; 0x25
    12ac:	1afffff8 	bne	1294 <printf+0x50>
    12b0:	e3540064 	cmp	r4, #100	; 0x64
    12b4:	0a000037 	beq	1398 <printf+0x154>
    12b8:	e20430f7 	and	r3, r4, #247	; 0xf7
    12bc:	e3530070 	cmp	r3, #112	; 0x70
    12c0:	0a000017 	beq	1324 <printf+0xe0>
    12c4:	e3540073 	cmp	r4, #115	; 0x73
    12c8:	0a00001c 	beq	1340 <printf+0xfc>
    12cc:	e3540063 	cmp	r4, #99	; 0x63
    12d0:	0a000037 	beq	13b4 <printf+0x170>
    12d4:	e3540025 	cmp	r4, #37	; 0x25
    12d8:	0a000027 	beq	137c <printf+0x138>
    12dc:	e3a02001 	mov	r2, #1
    12e0:	e24b1019 	sub	r1, fp, #25
    12e4:	e1a00007 	mov	r0, r7
    12e8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    12ec:	ebfffebc 	bl	de4 <write>
    12f0:	e3a02001 	mov	r2, #1
    12f4:	e24b101a 	sub	r1, fp, #26
    12f8:	e1a00007 	mov	r0, r7
    12fc:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    1300:	ebfffeb7 	bl	de4 <write>
    1304:	e5f64001 	ldrb	r4, [r6, #1]!
    1308:	e3a05000 	mov	r5, #0
    130c:	e3540000 	cmp	r4, #0
    1310:	1affffe2 	bne	12a0 <printf+0x5c>
    1314:	e24bd018 	sub	sp, fp, #24
    1318:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    131c:	e28dd00c 	add	sp, sp, #12
    1320:	e12fff1e 	bx	lr
    1324:	e3a03000 	mov	r3, #0
    1328:	e3a02010 	mov	r2, #16
    132c:	e4981004 	ldr	r1, [r8], #4
    1330:	e1a00007 	mov	r0, r7
    1334:	ebffff7a 	bl	1124 <printint>
    1338:	e3a05000 	mov	r5, #0
    133c:	eaffffd4 	b	1294 <printf+0x50>
    1340:	e4984004 	ldr	r4, [r8], #4
    1344:	e3540000 	cmp	r4, #0
    1348:	0a000021 	beq	13d4 <printf+0x190>
    134c:	e5d45000 	ldrb	r5, [r4]
    1350:	e3550000 	cmp	r5, #0
    1354:	0affffce 	beq	1294 <printf+0x50>
    1358:	e3a02001 	mov	r2, #1
    135c:	e24b101d 	sub	r1, fp, #29
    1360:	e1a00007 	mov	r0, r7
    1364:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
    1368:	ebfffe9d 	bl	de4 <write>
    136c:	e5f45001 	ldrb	r5, [r4, #1]!
    1370:	e3550000 	cmp	r5, #0
    1374:	1afffff7 	bne	1358 <printf+0x114>
    1378:	eaffffc5 	b	1294 <printf+0x50>
    137c:	e24b1018 	sub	r1, fp, #24
    1380:	e3a02001 	mov	r2, #1
    1384:	e1a00007 	mov	r0, r7
    1388:	e5615003 	strb	r5, [r1, #-3]!
    138c:	e3a05000 	mov	r5, #0
    1390:	ebfffe93 	bl	de4 <write>
    1394:	eaffffbe 	b	1294 <printf+0x50>
    1398:	e3a03001 	mov	r3, #1
    139c:	e3a0200a 	mov	r2, #10
    13a0:	e4981004 	ldr	r1, [r8], #4
    13a4:	e1a00007 	mov	r0, r7
    13a8:	ebffff5d 	bl	1124 <printint>
    13ac:	e3a05000 	mov	r5, #0
    13b0:	eaffffb7 	b	1294 <printf+0x50>
    13b4:	e4983004 	ldr	r3, [r8], #4
    13b8:	e24b1018 	sub	r1, fp, #24
    13bc:	e3a02001 	mov	r2, #1
    13c0:	e1a00007 	mov	r0, r7
    13c4:	e3a05000 	mov	r5, #0
    13c8:	e5613004 	strb	r3, [r1, #-4]!
    13cc:	ebfffe84 	bl	de4 <write>
    13d0:	eaffffaf 	b	1294 <printf+0x50>
    13d4:	e30146a0 	movw	r4, #5792	; 0x16a0
    13d8:	e3a05028 	mov	r5, #40	; 0x28
    13dc:	e3404000 	movt	r4, #0
    13e0:	eaffffdc 	b	1358 <printf+0x114>

000013e4 <free>:
    13e4:	e301c6bc 	movw	ip, #5820	; 0x16bc
    13e8:	e340c000 	movt	ip, #0
    13ec:	e92d4810 	push	{r4, fp, lr}
    13f0:	e2401008 	sub	r1, r0, #8
    13f4:	e28db008 	add	fp, sp, #8
    13f8:	e59c3000 	ldr	r3, [ip]
    13fc:	ea000004 	b	1414 <free+0x30>
    1400:	e1510002 	cmp	r1, r2
    1404:	3a000009 	bcc	1430 <free+0x4c>
    1408:	e1530002 	cmp	r3, r2
    140c:	2a000007 	bcs	1430 <free+0x4c>
    1410:	e1a03002 	mov	r3, r2
    1414:	e1530001 	cmp	r3, r1
    1418:	e5932000 	ldr	r2, [r3]
    141c:	3afffff7 	bcc	1400 <free+0x1c>
    1420:	e1530002 	cmp	r3, r2
    1424:	3afffff9 	bcc	1410 <free+0x2c>
    1428:	e1510002 	cmp	r1, r2
    142c:	2afffff7 	bcs	1410 <free+0x2c>
    1430:	e510e004 	ldr	lr, [r0, #-4]
    1434:	e58c3000 	str	r3, [ip]
    1438:	e081418e 	add	r4, r1, lr, lsl #3
    143c:	e1520004 	cmp	r2, r4
    1440:	05922004 	ldreq	r2, [r2, #4]
    1444:	0082e00e 	addeq	lr, r2, lr
    1448:	0500e004 	streq	lr, [r0, #-4]
    144c:	05932000 	ldreq	r2, [r3]
    1450:	05922000 	ldreq	r2, [r2]
    1454:	e5002008 	str	r2, [r0, #-8]
    1458:	e5932004 	ldr	r2, [r3, #4]
    145c:	e083e182 	add	lr, r3, r2, lsl #3
    1460:	e151000e 	cmp	r1, lr
    1464:	15831000 	strne	r1, [r3]
    1468:	05101004 	ldreq	r1, [r0, #-4]
    146c:	00812002 	addeq	r2, r1, r2
    1470:	05832004 	streq	r2, [r3, #4]
    1474:	05102008 	ldreq	r2, [r0, #-8]
    1478:	05832000 	streq	r2, [r3]
    147c:	e8bd8810 	pop	{r4, fp, pc}

00001480 <malloc>:
    1480:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1484:	e30176bc 	movw	r7, #5820	; 0x16bc
    1488:	e3407000 	movt	r7, #0
    148c:	e2804007 	add	r4, r0, #7
    1490:	e28db014 	add	fp, sp, #20
    1494:	e5973000 	ldr	r3, [r7]
    1498:	e1a041a4 	lsr	r4, r4, #3
    149c:	e2844001 	add	r4, r4, #1
    14a0:	e3530000 	cmp	r3, #0
    14a4:	0a000027 	beq	1548 <malloc+0xc8>
    14a8:	e5930000 	ldr	r0, [r3]
    14ac:	e5902004 	ldr	r2, [r0, #4]
    14b0:	e1540002 	cmp	r4, r2
    14b4:	9a000019 	bls	1520 <malloc+0xa0>
    14b8:	e3540a01 	cmp	r4, #4096	; 0x1000
    14bc:	21a05004 	movcs	r5, r4
    14c0:	33a05a01 	movcc	r5, #4096	; 0x1000
    14c4:	e1a06185 	lsl	r6, r5, #3
    14c8:	ea000003 	b	14dc <malloc+0x5c>
    14cc:	e5930000 	ldr	r0, [r3]
    14d0:	e5902004 	ldr	r2, [r0, #4]
    14d4:	e1540002 	cmp	r4, r2
    14d8:	9a000010 	bls	1520 <malloc+0xa0>
    14dc:	e5972000 	ldr	r2, [r7]
    14e0:	e1a03000 	mov	r3, r0
    14e4:	e1520000 	cmp	r2, r0
    14e8:	1afffff7 	bne	14cc <malloc+0x4c>
    14ec:	e1a00006 	mov	r0, r6
    14f0:	ebfffee4 	bl	1088 <sbrk>
    14f4:	e1a03000 	mov	r3, r0
    14f8:	e3730001 	cmn	r3, #1
    14fc:	e2800008 	add	r0, r0, #8
    1500:	0a000004 	beq	1518 <malloc+0x98>
    1504:	e5835004 	str	r5, [r3, #4]
    1508:	ebffffb5 	bl	13e4 <free>
    150c:	e5973000 	ldr	r3, [r7]
    1510:	e3530000 	cmp	r3, #0
    1514:	1affffec 	bne	14cc <malloc+0x4c>
    1518:	e3a00000 	mov	r0, #0
    151c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    1520:	e1540002 	cmp	r4, r2
    1524:	e5873000 	str	r3, [r7]
    1528:	10422004 	subne	r2, r2, r4
    152c:	15802004 	strne	r2, [r0, #4]
    1530:	05902000 	ldreq	r2, [r0]
    1534:	10800182 	addne	r0, r0, r2, lsl #3
    1538:	e2800008 	add	r0, r0, #8
    153c:	15004004 	strne	r4, [r0, #-4]
    1540:	05832000 	streq	r2, [r3]
    1544:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    1548:	e2870004 	add	r0, r7, #4
    154c:	e5873008 	str	r3, [r7, #8]
    1550:	e5870000 	str	r0, [r7]
    1554:	e5870004 	str	r0, [r7, #4]
    1558:	eaffffd6 	b	14b8 <malloc+0x38>
