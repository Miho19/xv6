
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
      28:	eb0003aa 	bl	ed8 <mknod>
  fsfd = open(argv[1], O_RDWR);
      2c:	e3a01002 	mov	r1, #2
      30:	e5960004 	ldr	r0, [r6, #4]
      34:	eb00039a 	bl	ea4 <open>
      38:	e301369c 	movw	r3, #5788	; 0x169c
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
      4c:	e3014660 	movw	r4, #5728	; 0x1660
      50:	e3404000 	movt	r4, #0
      54:	e3010688 	movw	r0, #5768	; 0x1688
      58:	e3400000 	movt	r0, #0
      5c:	e5943008 	ldr	r3, [r4, #8]
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
  sb.ninodes = xint(ninodes);
  sb.nlog = xint(nlog);

  bitblocks = size/(512*8) + 1;
      60:	e3015698 	movw	r5, #5784	; 0x1698
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
      80:	e3017684 	movw	r7, #5764	; 0x1684
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

  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      a4:	e2811001 	add	r1, r1, #1
      a8:	e88d1002 	stm	sp, {r1, ip}
  freeblock = usedblocks;
      ac:	e3011680 	movw	r1, #5760	; 0x1680
      b0:	e3401000 	movt	r1, #0
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      b4:	e58de008 	str	lr, [sp, #8]
  usedblocks = ninodes / IPB + 3 + bitblocks;
      b8:	e3407000 	movt	r7, #0
  freeblock = usedblocks;
      bc:	e581c000 	str	ip, [r1]
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      c0:	e08e1002 	add	r1, lr, r2
  bitblocks = size/(512*8) + 1;
      c4:	e5853000 	str	r3, [r5]
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      c8:	e081100c 	add	r1, r1, ip
      cc:	e58d100c 	str	r1, [sp, #12]
      d0:	e3011600 	movw	r1, #5632	; 0x1600
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
      d4:	e5802004 	str	r2, [r0, #4]
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      d8:	e3401000 	movt	r1, #0
      dc:	e1a0200c 	mov	r2, ip
  sb.nlog = xint(nlog);
      e0:	e580e00c 	str	lr, [r0, #12]
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      e4:	e3a00001 	mov	r0, #1
  a[0] = x;
      e8:	e50be224 	str	lr, [fp, #-548]	; 0xfffffddc
  usedblocks = ninodes / IPB + 3 + bitblocks;
      ec:	e587c000 	str	ip, [r7]
  printf(1, "used %d (bit %d ninode %zu) free %u log %u total %d\n", usedblocks,
      f0:	eb00044f 	bl	1234 <printf>
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
     118:	130156a0 	movwne	r5, #5792	; 0x16a0
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
     160:	eb000263 	bl	af4 <memset>
  memmove(buf, &sb, sizeof(sb));
     164:	e3a02010 	mov	r2, #16
     168:	e24b0f89 	sub	r0, fp, #548	; 0x224
     16c:	e3011688 	movw	r1, #5768	; 0x1688
     170:	e3401000 	movt	r1, #0
     174:	eb0002bb 	bl	c68 <memmove>
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
     1a4:	e30115fc 	movw	r1, #5628	; 0x15fc
     1a8:	e3a00001 	mov	r0, #1
     1ac:	e3401000 	movt	r1, #0
     1b0:	eb00041f 	bl	1234 <printf>
    exit();
     1b4:	eb0002c5 	bl	cd0 <exit>
    printf(1, "Usage: mkfs fs.img files...\n");
     1b8:	e30115dc 	movw	r1, #5596	; 0x15dc
     1bc:	e3a00001 	mov	r0, #1
     1c0:	e3401000 	movt	r1, #0
     1c4:	eb00041a 	bl	1234 <printf>
    exit();
     1c8:	eb0002c0 	bl	cd0 <exit>
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
     1ec:	eb000240 	bl	af4 <memset>
  a[0] = x;
     1f0:	e24b3f99 	sub	r3, fp, #612	; 0x264
  de.inum = xshort(rootino);
     1f4:	e0c540b2 	strh	r4, [r5], #2
  strcpy(de.name, ".");
     1f8:	e3011638 	movw	r1, #5688	; 0x1638
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
     20c:	eb000207 	bl	a30 <strcpy>
  iappend(rootino, &de, sizeof(de));
     210:	e1a01008 	mov	r1, r8
     214:	e3a02010 	mov	r2, #16
     218:	e1a00004 	mov	r0, r4
     21c:	eb000179 	bl	808 <iappend>
  memset(&de, 0, sizeof(de));
     220:	e3a02010 	mov	r2, #16
     224:	e3a01000 	mov	r1, #0
     228:	e1a00008 	mov	r0, r8
     22c:	eb000230 	bl	af4 <memset>
  a[0] = x;
     230:	e24b3f99 	sub	r3, fp, #612	; 0x264
  strcpy(de.name, "..");
     234:	e1a00005 	mov	r0, r5
     238:	e301163c 	movw	r1, #5692	; 0x163c
  a[0] = x;
     23c:	e1c340b0 	strh	r4, [r3]
  strcpy(de.name, "..");
     240:	e3401000 	movt	r1, #0
  de.inum = xshort(rootino);
     244:	e1c840b0 	strh	r4, [r8]
  strcpy(de.name, "..");
     248:	eb0001f8 	bl	a30 <strcpy>
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
     280:	eb00020a 	bl	ab0 <strlen>
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
     2b0:	eb0002fb 	bl	ea4 <open>
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
     2e8:	eb000201 	bl	af4 <memset>
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
     374:	eb000289 	bl	da0 <read>
     378:	e2502000 	subs	r2, r0, #0
     37c:	cafffff6 	bgt	35c <main+0x35c>

    close(fd);
     380:	e1a00004 	mov	r0, r4
  for(i = 2; i < argc; i++){
     384:	e28aa001 	add	sl, sl, #1
    close(fd);
     388:	eb00029e 	bl	e08 <close>
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
     3e8:	eb000238 	bl	cd0 <exit>
      printf(1, "%s", argv[i]);
     3ec:	e5962000 	ldr	r2, [r6]
     3f0:	e3011640 	movw	r1, #5696	; 0x1640
     3f4:	e3a00001 	mov	r0, #1
     3f8:	e3401000 	movt	r1, #0
     3fc:	eb00038c 	bl	1234 <printf>
      exit();
     400:	eb000232 	bl	cd0 <exit>
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
     418:	e301154c 	movw	r1, #5452	; 0x154c
     41c:	e3a00001 	mov	r0, #1
     420:	e3401000 	movt	r1, #0
     424:	eb000382 	bl	1234 <printf>
  exit();
     428:	eb000228 	bl	cd0 <exit>

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
     4b0:	eb00017e 	bl	ab0 <strlen>
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
     528:	e301469c 	movw	r4, #5788	; 0x169c
     52c:	e3404000 	movt	r4, #0
{
     530:	e28db014 	add	fp, sp, #20
     534:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     538:	e3a02000 	mov	r2, #0
     53c:	e1a01005 	mov	r1, r5
     540:	e5940000 	ldr	r0, [r4]
     544:	eb0001fb 	bl	d38 <lseek>
     548:	e1550000 	cmp	r5, r0
     54c:	1a00000a 	bne	57c <wsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(write(fsfd, buf, 512) != 512){
     550:	e1a01006 	mov	r1, r6
     554:	e5940000 	ldr	r0, [r4]
     558:	e3a02c02 	mov	r2, #512	; 0x200
     55c:	eb00021c 	bl	dd4 <write>
     560:	e3500c02 	cmp	r0, #512	; 0x200
     564:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "write");
     568:	e3011570 	movw	r1, #5488	; 0x1570
     56c:	e3a00001 	mov	r0, #1
     570:	e3401000 	movt	r1, #0
     574:	eb00032e 	bl	1234 <printf>
    exit();
     578:	eb0001d4 	bl	cd0 <exit>
    printf(1, "lseek");
     57c:	e3011568 	movw	r1, #5480	; 0x1568
     580:	e3a00001 	mov	r0, #1
     584:	e3401000 	movt	r1, #0
     588:	eb000329 	bl	1234 <printf>
    exit();
     58c:	eb0001cf 	bl	cd0 <exit>

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
     5b4:	e301469c 	movw	r4, #5788	; 0x169c
     5b8:	e3404000 	movt	r4, #0
{
     5bc:	e28db014 	add	fp, sp, #20
     5c0:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     5c4:	e3a02000 	mov	r2, #0
     5c8:	e1a01005 	mov	r1, r5
     5cc:	e5940000 	ldr	r0, [r4]
     5d0:	eb0001d8 	bl	d38 <lseek>
     5d4:	e1550000 	cmp	r5, r0
     5d8:	1a00000a 	bne	608 <rsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(read(fsfd, buf, 512) != 512){
     5dc:	e1a01006 	mov	r1, r6
     5e0:	e5940000 	ldr	r0, [r4]
     5e4:	e3a02c02 	mov	r2, #512	; 0x200
     5e8:	eb0001ec 	bl	da0 <read>
     5ec:	e3500c02 	cmp	r0, #512	; 0x200
     5f0:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "read");
     5f4:	e3011578 	movw	r1, #5496	; 0x1578
     5f8:	e3a00001 	mov	r0, #1
     5fc:	e3401000 	movt	r1, #0
     600:	eb00030b 	bl	1234 <printf>
    exit();
     604:	eb0001b1 	bl	cd0 <exit>
    printf(1, "lseek");
     608:	e3011568 	movw	r1, #5480	; 0x1568
     60c:	e3a00001 	mov	r0, #1
     610:	e3401000 	movt	r1, #0
     614:	eb000306 	bl	1234 <printf>
    exit();
     618:	eb0001ac 	bl	cd0 <exit>

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
     6ec:	e3013660 	movw	r3, #5728	; 0x1660
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
     71c:	eb0000f4 	bl	af4 <memset>
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
     764:	e3011580 	movw	r1, #5504	; 0x1580
     768:	e3401000 	movt	r1, #0
     76c:	e3a00001 	mov	r0, #1
     770:	eb0002af 	bl	1234 <printf>
  assert(used < 512*8);
     774:	e3540a01 	cmp	r4, #4096	; 0x1000
     778:	aa000020 	bge	800 <balloc+0xb0>
  memset(buf, 0, 512);
     77c:	e3a02c02 	mov	r2, #512	; 0x200
     780:	e3a01000 	mov	r1, #0
     784:	e24b0f83 	sub	r0, fp, #524	; 0x20c
     788:	eb0000d9 	bl	af4 <memset>
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
  printf(1, "balloc: write bitmap block at sector %zu\n", ninodes/IPB + 3);
     7c0:	e3014660 	movw	r4, #5728	; 0x1660
     7c4:	e3404000 	movt	r4, #0
     7c8:	e3a00001 	mov	r0, #1
     7cc:	e30115b0 	movw	r1, #5552	; 0x15b0
     7d0:	e5942004 	ldr	r2, [r4, #4]
     7d4:	e3401000 	movt	r1, #0
     7d8:	e1a021a2 	lsr	r2, r2, #3
     7dc:	e2822003 	add	r2, r2, #3
     7e0:	eb000293 	bl	1234 <printf>
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
     828:	e50b0474 	str	r0, [fp, #-1140]	; 0xfffffb8c
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
     83c:	da000071 	ble	a08 <iappend+0x200>
    fbn = off / 512;
    assert(fbn < MAXFILE);
     840:	e301a7ff 	movw	sl, #6143	; 0x17ff
     844:	e340a001 	movt	sl, #1
     848:	e155000a 	cmp	r5, sl
    fbn = off / 512;
     84c:	e1a044a5 	lsr	r4, r5, #9
    assert(fbn < MAXFILE);
     850:	8a000074 	bhi	a28 <iappend+0x220>
     854:	e3019680 	movw	r9, #5760	; 0x1680
      }
      // printf("read indirect block\n");
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
      if(indirect[fbn - NDIRECT] == 0){
        indirect[fbn - NDIRECT] = xint(freeblock++);
        usedblocks++;
     858:	e3018684 	movw	r8, #5764	; 0x1684
    assert(fbn < MAXFILE);
     85c:	e50ba470 	str	sl, [fp, #-1136]	; 0xfffffb90
     860:	e3409000 	movt	r9, #0
        usedblocks++;
     864:	e3408000 	movt	r8, #0
     868:	ea000035 	b	944 <iappend+0x13c>
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
     8b4:	e5892000 	str	r2, [r9]
        usedblocks++;
     8b8:	e28e2001 	add	r2, lr, #1
     8bc:	e5882000 	str	r2, [r8]
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
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
      }
      x = xint(indirect[fbn-NDIRECT]);
    }
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
     900:	e1a00007 	mov	r0, r7
     904:	e0831001 	add	r1, r3, r1
     908:	e1a02004 	mov	r2, r4
     90c:	eb0000d5 	bl	c68 <memmove>
    wsect(x, buf);
     910:	e24b1e42 	sub	r1, fp, #1056	; 0x420
    n -= n1;
     914:	e0466004 	sub	r6, r6, r4
    wsect(x, buf);
     918:	e2411004 	sub	r1, r1, #4
     91c:	e1a0000a 	mov	r0, sl
    off += n1;
     920:	e0855004 	add	r5, r5, r4
    wsect(x, buf);
     924:	ebfffefd 	bl	520 <wsect>
  while(n > 0){
     928:	e3560000 	cmp	r6, #0
    p += n1;
     92c:	e0877004 	add	r7, r7, r4
  while(n > 0){
     930:	da000034 	ble	a08 <iappend+0x200>
    assert(fbn < MAXFILE);
     934:	e51b3470 	ldr	r3, [fp, #-1136]	; 0xfffffb90
    fbn = off / 512;
     938:	e1a044a5 	lsr	r4, r5, #9
    assert(fbn < MAXFILE);
     93c:	e1550003 	cmp	r5, r3
     940:	8a000038 	bhi	a28 <iappend+0x220>
    if(fbn < NDIRECT){
     944:	e3550b06 	cmp	r5, #6144	; 0x1800
     948:	3affffc7 	bcc	86c <iappend+0x64>
      if(xint(din.addrs[NDIRECT]) == 0){
     94c:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
     950:	e3530000 	cmp	r3, #0
  a[1] = x >> 8;
     954:	e7e71453 	ubfx	r1, r3, #8, #8
  a[0] = x;
     958:	e6ef0073 	uxtb	r0, r3
  a[2] = x >> 16;
     95c:	e7e72853 	ubfx	r2, r3, #16, #8
  a[3] = x >> 24;
     960:	e1a03c23 	lsr	r3, r3, #24
      if(xint(din.addrs[NDIRECT]) == 0){
     964:	1a00000a 	bne	994 <iappend+0x18c>
        din.addrs[NDIRECT] = xint(freeblock++);
     968:	e5993000 	ldr	r3, [r9]
        usedblocks++;
     96c:	e598c000 	ldr	ip, [r8]
        din.addrs[NDIRECT] = xint(freeblock++);
     970:	e283e001 	add	lr, r3, #1
     974:	e7e71453 	ubfx	r1, r3, #8, #8
     978:	e7e72853 	ubfx	r2, r3, #16, #8
     97c:	e6ef0073 	uxtb	r0, r3
     980:	e50b3428 	str	r3, [fp, #-1064]	; 0xfffffbd8
     984:	e1a03c23 	lsr	r3, r3, #24
        usedblocks++;
     988:	e28cc001 	add	ip, ip, #1
        din.addrs[NDIRECT] = xint(freeblock++);
     98c:	e589e000 	str	lr, [r9]
        usedblocks++;
     990:	e588c000 	str	ip, [r8]
  a[1] = x >> 8;
     994:	e54b1467 	strb	r1, [fp, #-1127]	; 0xfffffb99
      if(indirect[fbn - NDIRECT] == 0){
     998:	e244a00c 	sub	sl, r4, #12
  a[3] = x >> 24;
     99c:	e54b3465 	strb	r3, [fp, #-1125]	; 0xfffffb9b
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9a0:	e24b1f89 	sub	r1, fp, #548	; 0x224
  a[0] = x;
     9a4:	e54b0468 	strb	r0, [fp, #-1128]	; 0xfffffb98
  a[2] = x >> 16;
     9a8:	e54b2466 	strb	r2, [fp, #-1126]	; 0xfffffb9a
      rsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9ac:	e51b0468 	ldr	r0, [fp, #-1128]	; 0xfffffb98
     9b0:	ebfffefd 	bl	5ac <rsect>
      if(indirect[fbn - NDIRECT] == 0){
     9b4:	e24b3024 	sub	r3, fp, #36	; 0x24
     9b8:	e083a10a 	add	sl, r3, sl, lsl #2
     9bc:	e51a3200 	ldr	r3, [sl, #-512]	; 0xfffffe00
     9c0:	e3530000 	cmp	r3, #0
     9c4:	0a000002 	beq	9d4 <iappend+0x1cc>
  return y;
     9c8:	e1a0a003 	mov	sl, r3
  a[0] = x;
     9cc:	e50b3468 	str	r3, [fp, #-1128]	; 0xfffffb98
  return y;
     9d0:	eaffffbf 	b	8d4 <iappend+0xcc>
        indirect[fbn - NDIRECT] = xint(freeblock++);
     9d4:	e5993000 	ldr	r3, [r9]
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9d8:	e24b1f89 	sub	r1, fp, #548	; 0x224
  a[0] = x;
     9dc:	e51b0428 	ldr	r0, [fp, #-1064]	; 0xfffffbd8
        usedblocks++;
     9e0:	e5982000 	ldr	r2, [r8]
        indirect[fbn - NDIRECT] = xint(freeblock++);
     9e4:	e50a3200 	str	r3, [sl, #-512]	; 0xfffffe00
     9e8:	e2833001 	add	r3, r3, #1
        usedblocks++;
     9ec:	e2822001 	add	r2, r2, #1
        indirect[fbn - NDIRECT] = xint(freeblock++);
     9f0:	e5893000 	str	r3, [r9]
  a[0] = x;
     9f4:	e50b0468 	str	r0, [fp, #-1128]	; 0xfffffb98
        usedblocks++;
     9f8:	e5882000 	str	r2, [r8]
        wsect(xint(din.addrs[NDIRECT]), (char*)indirect);
     9fc:	ebfffec7 	bl	520 <wsect>
     a00:	e51a3200 	ldr	r3, [sl, #-512]	; 0xfffffe00
     a04:	eaffffef 	b	9c8 <iappend+0x1c0>
  }
  din.size = xint(off);
  winode(inum, &din);
     a08:	e24b1e46 	sub	r1, fp, #1120	; 0x460
     a0c:	e51b0474 	ldr	r0, [fp, #-1140]	; 0xfffffb8c
     a10:	e2411004 	sub	r1, r1, #4
  a[0] = x;
     a14:	e50b5468 	str	r5, [fp, #-1128]	; 0xfffffb98
  din.size = xint(off);
     a18:	e50b545c 	str	r5, [fp, #-1116]	; 0xfffffba4
  winode(inum, &din);
     a1c:	ebfffefe 	bl	61c <winode>
}
     a20:	e24bd020 	sub	sp, fp, #32
     a24:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    assert(fbn < MAXFILE);
     a28:	e3a00f52 	mov	r0, #328	; 0x148
     a2c:	ebfffe76 	bl	40c <failure>

00000a30 <strcpy>:
     a30:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a34:	e2402001 	sub	r2, r0, #1
     a38:	e28db000 	add	fp, sp, #0
     a3c:	e4d13001 	ldrb	r3, [r1], #1
     a40:	e3530000 	cmp	r3, #0
     a44:	e5e23001 	strb	r3, [r2, #1]!
     a48:	1afffffb 	bne	a3c <strcpy+0xc>
     a4c:	e28bd000 	add	sp, fp, #0
     a50:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a54:	e12fff1e 	bx	lr

00000a58 <strcmp>:
     a58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a5c:	e28db000 	add	fp, sp, #0
     a60:	e5d03000 	ldrb	r3, [r0]
     a64:	e5d12000 	ldrb	r2, [r1]
     a68:	e3530000 	cmp	r3, #0
     a6c:	1a000004 	bne	a84 <strcmp+0x2c>
     a70:	ea000005 	b	a8c <strcmp+0x34>
     a74:	e5f03001 	ldrb	r3, [r0, #1]!
     a78:	e3530000 	cmp	r3, #0
     a7c:	0a000006 	beq	a9c <strcmp+0x44>
     a80:	e5f12001 	ldrb	r2, [r1, #1]!
     a84:	e1530002 	cmp	r3, r2
     a88:	0afffff9 	beq	a74 <strcmp+0x1c>
     a8c:	e0430002 	sub	r0, r3, r2
     a90:	e28bd000 	add	sp, fp, #0
     a94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a98:	e12fff1e 	bx	lr
     a9c:	e5d12001 	ldrb	r2, [r1, #1]
     aa0:	e0430002 	sub	r0, r3, r2
     aa4:	e28bd000 	add	sp, fp, #0
     aa8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     aac:	e12fff1e 	bx	lr

00000ab0 <strlen>:
     ab0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ab4:	e28db000 	add	fp, sp, #0
     ab8:	e5d03000 	ldrb	r3, [r0]
     abc:	e3530000 	cmp	r3, #0
     ac0:	0a000009 	beq	aec <strlen+0x3c>
     ac4:	e1a02000 	mov	r2, r0
     ac8:	e3a03000 	mov	r3, #0
     acc:	e5f21001 	ldrb	r1, [r2, #1]!
     ad0:	e2833001 	add	r3, r3, #1
     ad4:	e3510000 	cmp	r1, #0
     ad8:	e1a00003 	mov	r0, r3
     adc:	1afffffa 	bne	acc <strlen+0x1c>
     ae0:	e28bd000 	add	sp, fp, #0
     ae4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     ae8:	e12fff1e 	bx	lr
     aec:	e1a00003 	mov	r0, r3
     af0:	eafffffa 	b	ae0 <strlen+0x30>

00000af4 <memset>:
     af4:	e3520000 	cmp	r2, #0
     af8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     afc:	e28db000 	add	fp, sp, #0
     b00:	0a000004 	beq	b18 <memset+0x24>
     b04:	e6ef1071 	uxtb	r1, r1
     b08:	e0802002 	add	r2, r0, r2
     b0c:	e4c01001 	strb	r1, [r0], #1
     b10:	e1520000 	cmp	r2, r0
     b14:	1afffffc 	bne	b0c <memset+0x18>
     b18:	e28bd000 	add	sp, fp, #0
     b1c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b20:	e12fff1e 	bx	lr

00000b24 <strchr>:
     b24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b28:	e28db000 	add	fp, sp, #0
     b2c:	e5d02000 	ldrb	r2, [r0]
     b30:	e3520000 	cmp	r2, #0
     b34:	0a00000b 	beq	b68 <strchr+0x44>
     b38:	e1510002 	cmp	r1, r2
     b3c:	1a000002 	bne	b4c <strchr+0x28>
     b40:	ea000005 	b	b5c <strchr+0x38>
     b44:	e1530001 	cmp	r3, r1
     b48:	0a000003 	beq	b5c <strchr+0x38>
     b4c:	e5f03001 	ldrb	r3, [r0, #1]!
     b50:	e3530000 	cmp	r3, #0
     b54:	1afffffa 	bne	b44 <strchr+0x20>
     b58:	e1a00003 	mov	r0, r3
     b5c:	e28bd000 	add	sp, fp, #0
     b60:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b64:	e12fff1e 	bx	lr
     b68:	e1a00002 	mov	r0, r2
     b6c:	eafffffa 	b	b5c <strchr+0x38>

00000b70 <gets>:
     b70:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     b74:	e1a08000 	mov	r8, r0
     b78:	e28db018 	add	fp, sp, #24
     b7c:	e1a07001 	mov	r7, r1
     b80:	e24dd00c 	sub	sp, sp, #12
     b84:	e2406001 	sub	r6, r0, #1
     b88:	e3a05000 	mov	r5, #0
     b8c:	ea000008 	b	bb4 <gets+0x44>
     b90:	eb000082 	bl	da0 <read>
     b94:	e3500000 	cmp	r0, #0
     b98:	da00000b 	ble	bcc <gets+0x5c>
     b9c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
     ba0:	e1a05004 	mov	r5, r4
     ba4:	e353000d 	cmp	r3, #13
     ba8:	1353000a 	cmpne	r3, #10
     bac:	e5e63001 	strb	r3, [r6, #1]!
     bb0:	0a000005 	beq	bcc <gets+0x5c>
     bb4:	e3a02001 	mov	r2, #1
     bb8:	e0854002 	add	r4, r5, r2
     bbc:	e1540007 	cmp	r4, r7
     bc0:	e24b101d 	sub	r1, fp, #29
     bc4:	e3a00000 	mov	r0, #0
     bc8:	bafffff0 	blt	b90 <gets+0x20>
     bcc:	e3a03000 	mov	r3, #0
     bd0:	e1a00008 	mov	r0, r8
     bd4:	e7c83005 	strb	r3, [r8, r5]
     bd8:	e24bd018 	sub	sp, fp, #24
     bdc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000be0 <stat>:
     be0:	e92d4830 	push	{r4, r5, fp, lr}
     be4:	e1a04001 	mov	r4, r1
     be8:	e28db00c 	add	fp, sp, #12
     bec:	e3a01000 	mov	r1, #0
     bf0:	eb0000ab 	bl	ea4 <open>
     bf4:	e2505000 	subs	r5, r0, #0
     bf8:	ba000006 	blt	c18 <stat+0x38>
     bfc:	e1a01004 	mov	r1, r4
     c00:	eb0000ce 	bl	f40 <fstat>
     c04:	e1a04000 	mov	r4, r0
     c08:	e1a00005 	mov	r0, r5
     c0c:	eb00007d 	bl	e08 <close>
     c10:	e1a00004 	mov	r0, r4
     c14:	e8bd8830 	pop	{r4, r5, fp, pc}
     c18:	e3e04000 	mvn	r4, #0
     c1c:	eafffffb 	b	c10 <stat+0x30>

00000c20 <atoi>:
     c20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c24:	e28db000 	add	fp, sp, #0
     c28:	e5d02000 	ldrb	r2, [r0]
     c2c:	e2423030 	sub	r3, r2, #48	; 0x30
     c30:	e3530009 	cmp	r3, #9
     c34:	e3a03000 	mov	r3, #0
     c38:	8a000006 	bhi	c58 <atoi+0x38>
     c3c:	e3a0c00a 	mov	ip, #10
     c40:	e023239c 	mla	r3, ip, r3, r2
     c44:	e5f02001 	ldrb	r2, [r0, #1]!
     c48:	e2421030 	sub	r1, r2, #48	; 0x30
     c4c:	e3510009 	cmp	r1, #9
     c50:	e2433030 	sub	r3, r3, #48	; 0x30
     c54:	9afffff9 	bls	c40 <atoi+0x20>
     c58:	e1a00003 	mov	r0, r3
     c5c:	e28bd000 	add	sp, fp, #0
     c60:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c64:	e12fff1e 	bx	lr

00000c68 <memmove>:
     c68:	e3520000 	cmp	r2, #0
     c6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c70:	e28db000 	add	fp, sp, #0
     c74:	da000005 	ble	c90 <memmove+0x28>
     c78:	e0812002 	add	r2, r1, r2
     c7c:	e2403001 	sub	r3, r0, #1
     c80:	e4d1c001 	ldrb	ip, [r1], #1
     c84:	e1510002 	cmp	r1, r2
     c88:	e5e3c001 	strb	ip, [r3, #1]!
     c8c:	1afffffb 	bne	c80 <memmove+0x18>
     c90:	e28bd000 	add	sp, fp, #0
     c94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c98:	e12fff1e 	bx	lr

00000c9c <fork>:
     c9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ca0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ca4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ca8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     cac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     cb0:	e3a00001 	mov	r0, #1
     cb4:	ef000040 	svc	0x00000040
     cb8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cbc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cc0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     cc4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     cc8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ccc:	e12fff1e 	bx	lr

00000cd0 <exit>:
     cd0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     cd4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     cd8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     cdc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ce0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ce4:	e3a00002 	mov	r0, #2
     ce8:	ef000040 	svc	0x00000040
     cec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cf0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cf4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     cf8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     cfc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d00:	e12fff1e 	bx	lr

00000d04 <wait>:
     d04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d08:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d0c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d10:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d14:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d18:	e3a00003 	mov	r0, #3
     d1c:	ef000040 	svc	0x00000040
     d20:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d24:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d28:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d2c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d34:	e12fff1e 	bx	lr

00000d38 <lseek>:
     d38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d3c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d40:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d44:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d48:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d4c:	e3a00016 	mov	r0, #22
     d50:	ef000040 	svc	0x00000040
     d54:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d58:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d5c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d60:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d68:	e12fff1e 	bx	lr

00000d6c <pipe>:
     d6c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d70:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d74:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d78:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d7c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d80:	e3a00004 	mov	r0, #4
     d84:	ef000040 	svc	0x00000040
     d88:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d8c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d90:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d94:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d98:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d9c:	e12fff1e 	bx	lr

00000da0 <read>:
     da0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     da4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     da8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     dac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     db0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     db4:	e3a00005 	mov	r0, #5
     db8:	ef000040 	svc	0x00000040
     dbc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dc0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dc4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     dc8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     dcc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     dd0:	e12fff1e 	bx	lr

00000dd4 <write>:
     dd4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     dd8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ddc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     de0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     de4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     de8:	e3a00010 	mov	r0, #16
     dec:	ef000040 	svc	0x00000040
     df0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     df4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     df8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     dfc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e00:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e04:	e12fff1e 	bx	lr

00000e08 <close>:
     e08:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e0c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e10:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e14:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e18:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e1c:	e3a00015 	mov	r0, #21
     e20:	ef000040 	svc	0x00000040
     e24:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e28:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e2c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e30:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e34:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e38:	e12fff1e 	bx	lr

00000e3c <kill>:
     e3c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e40:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e44:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e48:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e4c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e50:	e3a00006 	mov	r0, #6
     e54:	ef000040 	svc	0x00000040
     e58:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e5c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e60:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e64:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e6c:	e12fff1e 	bx	lr

00000e70 <exec>:
     e70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e74:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e78:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e7c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e80:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e84:	e3a00007 	mov	r0, #7
     e88:	ef000040 	svc	0x00000040
     e8c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e90:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e94:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e98:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e9c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ea0:	e12fff1e 	bx	lr

00000ea4 <open>:
     ea4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ea8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     eac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     eb0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     eb4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     eb8:	e3a0000f 	mov	r0, #15
     ebc:	ef000040 	svc	0x00000040
     ec0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ec4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ec8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ecc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ed0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ed4:	e12fff1e 	bx	lr

00000ed8 <mknod>:
     ed8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     edc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ee0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ee4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ee8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     eec:	e3a00011 	mov	r0, #17
     ef0:	ef000040 	svc	0x00000040
     ef4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ef8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     efc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f00:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f04:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f08:	e12fff1e 	bx	lr

00000f0c <unlink>:
     f0c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f10:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f14:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f18:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f1c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f20:	e3a00012 	mov	r0, #18
     f24:	ef000040 	svc	0x00000040
     f28:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f2c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f30:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f34:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f38:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f3c:	e12fff1e 	bx	lr

00000f40 <fstat>:
     f40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f44:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f48:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f4c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f50:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f54:	e3a00008 	mov	r0, #8
     f58:	ef000040 	svc	0x00000040
     f5c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f60:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f64:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f68:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f6c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f70:	e12fff1e 	bx	lr

00000f74 <link>:
     f74:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f78:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f7c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f80:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f84:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f88:	e3a00013 	mov	r0, #19
     f8c:	ef000040 	svc	0x00000040
     f90:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f94:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f98:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f9c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fa0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fa4:	e12fff1e 	bx	lr

00000fa8 <mkdir>:
     fa8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fb0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fb4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fb8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fbc:	e3a00014 	mov	r0, #20
     fc0:	ef000040 	svc	0x00000040
     fc4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fc8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fcc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fd0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fd4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fd8:	e12fff1e 	bx	lr

00000fdc <chdir>:
     fdc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fe0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fe4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fe8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ff0:	e3a00009 	mov	r0, #9
     ff4:	ef000040 	svc	0x00000040
     ff8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ffc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1000:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1004:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1008:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    100c:	e12fff1e 	bx	lr

00001010 <dup>:
    1010:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1014:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1018:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    101c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1020:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1024:	e3a0000a 	mov	r0, #10
    1028:	ef000040 	svc	0x00000040
    102c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1030:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1034:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1038:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    103c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1040:	e12fff1e 	bx	lr

00001044 <getpid>:
    1044:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1048:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    104c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1050:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1054:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1058:	e3a0000b 	mov	r0, #11
    105c:	ef000040 	svc	0x00000040
    1060:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1064:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1068:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    106c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1070:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1074:	e12fff1e 	bx	lr

00001078 <sbrk>:
    1078:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    107c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1080:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1084:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1088:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    108c:	e3a0000c 	mov	r0, #12
    1090:	ef000040 	svc	0x00000040
    1094:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1098:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    109c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10a8:	e12fff1e 	bx	lr

000010ac <sleep>:
    10ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10c0:	e3a0000d 	mov	r0, #13
    10c4:	ef000040 	svc	0x00000040
    10c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10dc:	e12fff1e 	bx	lr

000010e0 <uptime>:
    10e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10f4:	e3a0000e 	mov	r0, #14
    10f8:	ef000040 	svc	0x00000040
    10fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1100:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1104:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1108:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    110c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1110:	e12fff1e 	bx	lr

00001114 <printint>:
    1114:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    1118:	e1a09fa1 	lsr	r9, r1, #31
    111c:	e3530000 	cmp	r3, #0
    1120:	03a09000 	moveq	r9, #0
    1124:	12099001 	andne	r9, r9, #1
    1128:	e28db01c 	add	fp, sp, #28
    112c:	e3590000 	cmp	r9, #0
    1130:	e3018644 	movw	r8, #5700	; 0x1644
    1134:	1261e000 	rsbne	lr, r1, #0
    1138:	e3408000 	movt	r8, #0
    113c:	e24b602d 	sub	r6, fp, #45	; 0x2d
    1140:	e1a04000 	mov	r4, r0
    1144:	13a09001 	movne	r9, #1
    1148:	01a0e001 	moveq	lr, r1
    114c:	e3a07000 	mov	r7, #0
    1150:	e3a05001 	mov	r5, #1
    1154:	e24dd018 	sub	sp, sp, #24
    1158:	e3a0c000 	mov	ip, #0
    115c:	e3a0301f 	mov	r3, #31
    1160:	e1a0100c 	mov	r1, ip
    1164:	e1a0033e 	lsr	r0, lr, r3
    1168:	e2000001 	and	r0, r0, #1
    116c:	e1801081 	orr	r1, r0, r1, lsl #1
    1170:	e1520001 	cmp	r2, r1
    1174:	90411002 	subls	r1, r1, r2
    1178:	918cc315 	orrls	ip, ip, r5, lsl r3
    117c:	e2533001 	subs	r3, r3, #1
    1180:	2afffff7 	bcs	1164 <printint+0x50>
    1184:	e061e29c 	mls	r1, ip, r2, lr
    1188:	e35c0000 	cmp	ip, #0
    118c:	e1a0e00c 	mov	lr, ip
    1190:	e2873001 	add	r3, r7, #1
    1194:	e7d81001 	ldrb	r1, [r8, r1]
    1198:	e5e61001 	strb	r1, [r6, #1]!
    119c:	11a07003 	movne	r7, r3
    11a0:	1affffec 	bne	1158 <printint+0x44>
    11a4:	e3590000 	cmp	r9, #0
    11a8:	124b201c 	subne	r2, fp, #28
    11ac:	10822003 	addne	r2, r2, r3
    11b0:	13a0102d 	movne	r1, #45	; 0x2d
    11b4:	12873002 	addne	r3, r7, #2
    11b8:	15421010 	strbne	r1, [r2, #-16]
    11bc:	e24b202c 	sub	r2, fp, #44	; 0x2c
    11c0:	e2435001 	sub	r5, r3, #1
    11c4:	e0826003 	add	r6, r2, r3
    11c8:	e5763001 	ldrb	r3, [r6, #-1]!
    11cc:	e2455001 	sub	r5, r5, #1
    11d0:	e3a02001 	mov	r2, #1
    11d4:	e24b102d 	sub	r1, fp, #45	; 0x2d
    11d8:	e1a00004 	mov	r0, r4
    11dc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    11e0:	ebfffefb 	bl	dd4 <write>
    11e4:	e3750001 	cmn	r5, #1
    11e8:	1afffff6 	bne	11c8 <printint+0xb4>
    11ec:	e24bd01c 	sub	sp, fp, #28
    11f0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000011f4 <div>:
    11f4:	e92d4810 	push	{r4, fp, lr}
    11f8:	e3a02000 	mov	r2, #0
    11fc:	e28db008 	add	fp, sp, #8
    1200:	e1a0e000 	mov	lr, r0
    1204:	e3a0301f 	mov	r3, #31
    1208:	e1a00002 	mov	r0, r2
    120c:	e3a04001 	mov	r4, #1
    1210:	e1a0c33e 	lsr	ip, lr, r3
    1214:	e20cc001 	and	ip, ip, #1
    1218:	e18c2082 	orr	r2, ip, r2, lsl #1
    121c:	e1520001 	cmp	r2, r1
    1220:	20422001 	subcs	r2, r2, r1
    1224:	21800314 	orrcs	r0, r0, r4, lsl r3
    1228:	e2533001 	subs	r3, r3, #1
    122c:	2afffff7 	bcs	1210 <div+0x1c>
    1230:	e8bd8810 	pop	{r4, fp, pc}

00001234 <printf>:
    1234:	e92d000e 	push	{r1, r2, r3}
    1238:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    123c:	e28db018 	add	fp, sp, #24
    1240:	e24dd008 	sub	sp, sp, #8
    1244:	e59b6004 	ldr	r6, [fp, #4]
    1248:	e5d64000 	ldrb	r4, [r6]
    124c:	e3540000 	cmp	r4, #0
    1250:	0a00002b 	beq	1304 <printf+0xd0>
    1254:	e1a07000 	mov	r7, r0
    1258:	e28b8008 	add	r8, fp, #8
    125c:	e3a05000 	mov	r5, #0
    1260:	ea00000a 	b	1290 <printf+0x5c>
    1264:	e3540025 	cmp	r4, #37	; 0x25
    1268:	01a05004 	moveq	r5, r4
    126c:	0a000004 	beq	1284 <printf+0x50>
    1270:	e24b1018 	sub	r1, fp, #24
    1274:	e3a02001 	mov	r2, #1
    1278:	e1a00007 	mov	r0, r7
    127c:	e5614006 	strb	r4, [r1, #-6]!
    1280:	ebfffed3 	bl	dd4 <write>
    1284:	e5f64001 	ldrb	r4, [r6, #1]!
    1288:	e3540000 	cmp	r4, #0
    128c:	0a00001c 	beq	1304 <printf+0xd0>
    1290:	e3550000 	cmp	r5, #0
    1294:	0afffff2 	beq	1264 <printf+0x30>
    1298:	e3550025 	cmp	r5, #37	; 0x25
    129c:	1afffff8 	bne	1284 <printf+0x50>
    12a0:	e3540064 	cmp	r4, #100	; 0x64
    12a4:	0a000037 	beq	1388 <printf+0x154>
    12a8:	e20430f7 	and	r3, r4, #247	; 0xf7
    12ac:	e3530070 	cmp	r3, #112	; 0x70
    12b0:	0a000017 	beq	1314 <printf+0xe0>
    12b4:	e3540073 	cmp	r4, #115	; 0x73
    12b8:	0a00001c 	beq	1330 <printf+0xfc>
    12bc:	e3540063 	cmp	r4, #99	; 0x63
    12c0:	0a000037 	beq	13a4 <printf+0x170>
    12c4:	e3540025 	cmp	r4, #37	; 0x25
    12c8:	0a000027 	beq	136c <printf+0x138>
    12cc:	e3a02001 	mov	r2, #1
    12d0:	e24b1019 	sub	r1, fp, #25
    12d4:	e1a00007 	mov	r0, r7
    12d8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    12dc:	ebfffebc 	bl	dd4 <write>
    12e0:	e3a02001 	mov	r2, #1
    12e4:	e24b101a 	sub	r1, fp, #26
    12e8:	e1a00007 	mov	r0, r7
    12ec:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    12f0:	ebfffeb7 	bl	dd4 <write>
    12f4:	e5f64001 	ldrb	r4, [r6, #1]!
    12f8:	e3a05000 	mov	r5, #0
    12fc:	e3540000 	cmp	r4, #0
    1300:	1affffe2 	bne	1290 <printf+0x5c>
    1304:	e24bd018 	sub	sp, fp, #24
    1308:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    130c:	e28dd00c 	add	sp, sp, #12
    1310:	e12fff1e 	bx	lr
    1314:	e3a03000 	mov	r3, #0
    1318:	e3a02010 	mov	r2, #16
    131c:	e4981004 	ldr	r1, [r8], #4
    1320:	e1a00007 	mov	r0, r7
    1324:	ebffff7a 	bl	1114 <printint>
    1328:	e3a05000 	mov	r5, #0
    132c:	eaffffd4 	b	1284 <printf+0x50>
    1330:	e4984004 	ldr	r4, [r8], #4
    1334:	e3540000 	cmp	r4, #0
    1338:	0a000021 	beq	13c4 <printf+0x190>
    133c:	e5d45000 	ldrb	r5, [r4]
    1340:	e3550000 	cmp	r5, #0
    1344:	0affffce 	beq	1284 <printf+0x50>
    1348:	e3a02001 	mov	r2, #1
    134c:	e24b101d 	sub	r1, fp, #29
    1350:	e1a00007 	mov	r0, r7
    1354:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
    1358:	ebfffe9d 	bl	dd4 <write>
    135c:	e5f45001 	ldrb	r5, [r4, #1]!
    1360:	e3550000 	cmp	r5, #0
    1364:	1afffff7 	bne	1348 <printf+0x114>
    1368:	eaffffc5 	b	1284 <printf+0x50>
    136c:	e24b1018 	sub	r1, fp, #24
    1370:	e3a02001 	mov	r2, #1
    1374:	e1a00007 	mov	r0, r7
    1378:	e5615003 	strb	r5, [r1, #-3]!
    137c:	e3a05000 	mov	r5, #0
    1380:	ebfffe93 	bl	dd4 <write>
    1384:	eaffffbe 	b	1284 <printf+0x50>
    1388:	e3a03001 	mov	r3, #1
    138c:	e3a0200a 	mov	r2, #10
    1390:	e4981004 	ldr	r1, [r8], #4
    1394:	e1a00007 	mov	r0, r7
    1398:	ebffff5d 	bl	1114 <printint>
    139c:	e3a05000 	mov	r5, #0
    13a0:	eaffffb7 	b	1284 <printf+0x50>
    13a4:	e4983004 	ldr	r3, [r8], #4
    13a8:	e24b1018 	sub	r1, fp, #24
    13ac:	e3a02001 	mov	r2, #1
    13b0:	e1a00007 	mov	r0, r7
    13b4:	e3a05000 	mov	r5, #0
    13b8:	e5613004 	strb	r3, [r1, #-4]!
    13bc:	ebfffe84 	bl	dd4 <write>
    13c0:	eaffffaf 	b	1284 <printf+0x50>
    13c4:	e3014658 	movw	r4, #5720	; 0x1658
    13c8:	e3a05028 	mov	r5, #40	; 0x28
    13cc:	e3404000 	movt	r4, #0
    13d0:	eaffffdc 	b	1348 <printf+0x114>

000013d4 <free>:
    13d4:	e301c674 	movw	ip, #5748	; 0x1674
    13d8:	e340c000 	movt	ip, #0
    13dc:	e92d4810 	push	{r4, fp, lr}
    13e0:	e2401008 	sub	r1, r0, #8
    13e4:	e28db008 	add	fp, sp, #8
    13e8:	e59c3000 	ldr	r3, [ip]
    13ec:	ea000004 	b	1404 <free+0x30>
    13f0:	e1510002 	cmp	r1, r2
    13f4:	3a000009 	bcc	1420 <free+0x4c>
    13f8:	e1530002 	cmp	r3, r2
    13fc:	2a000007 	bcs	1420 <free+0x4c>
    1400:	e1a03002 	mov	r3, r2
    1404:	e1530001 	cmp	r3, r1
    1408:	e5932000 	ldr	r2, [r3]
    140c:	3afffff7 	bcc	13f0 <free+0x1c>
    1410:	e1530002 	cmp	r3, r2
    1414:	3afffff9 	bcc	1400 <free+0x2c>
    1418:	e1510002 	cmp	r1, r2
    141c:	2afffff7 	bcs	1400 <free+0x2c>
    1420:	e510e004 	ldr	lr, [r0, #-4]
    1424:	e58c3000 	str	r3, [ip]
    1428:	e081418e 	add	r4, r1, lr, lsl #3
    142c:	e1520004 	cmp	r2, r4
    1430:	05922004 	ldreq	r2, [r2, #4]
    1434:	0082e00e 	addeq	lr, r2, lr
    1438:	0500e004 	streq	lr, [r0, #-4]
    143c:	05932000 	ldreq	r2, [r3]
    1440:	05922000 	ldreq	r2, [r2]
    1444:	e5002008 	str	r2, [r0, #-8]
    1448:	e5932004 	ldr	r2, [r3, #4]
    144c:	e083e182 	add	lr, r3, r2, lsl #3
    1450:	e151000e 	cmp	r1, lr
    1454:	15831000 	strne	r1, [r3]
    1458:	05101004 	ldreq	r1, [r0, #-4]
    145c:	00812002 	addeq	r2, r1, r2
    1460:	05832004 	streq	r2, [r3, #4]
    1464:	05102008 	ldreq	r2, [r0, #-8]
    1468:	05832000 	streq	r2, [r3]
    146c:	e8bd8810 	pop	{r4, fp, pc}

00001470 <malloc>:
    1470:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1474:	e3017674 	movw	r7, #5748	; 0x1674
    1478:	e3407000 	movt	r7, #0
    147c:	e2804007 	add	r4, r0, #7
    1480:	e28db014 	add	fp, sp, #20
    1484:	e5973000 	ldr	r3, [r7]
    1488:	e1a041a4 	lsr	r4, r4, #3
    148c:	e2844001 	add	r4, r4, #1
    1490:	e3530000 	cmp	r3, #0
    1494:	0a000027 	beq	1538 <malloc+0xc8>
    1498:	e5930000 	ldr	r0, [r3]
    149c:	e5902004 	ldr	r2, [r0, #4]
    14a0:	e1540002 	cmp	r4, r2
    14a4:	9a000019 	bls	1510 <malloc+0xa0>
    14a8:	e3540a01 	cmp	r4, #4096	; 0x1000
    14ac:	21a05004 	movcs	r5, r4
    14b0:	33a05a01 	movcc	r5, #4096	; 0x1000
    14b4:	e1a06185 	lsl	r6, r5, #3
    14b8:	ea000003 	b	14cc <malloc+0x5c>
    14bc:	e5930000 	ldr	r0, [r3]
    14c0:	e5902004 	ldr	r2, [r0, #4]
    14c4:	e1540002 	cmp	r4, r2
    14c8:	9a000010 	bls	1510 <malloc+0xa0>
    14cc:	e5972000 	ldr	r2, [r7]
    14d0:	e1a03000 	mov	r3, r0
    14d4:	e1520000 	cmp	r2, r0
    14d8:	1afffff7 	bne	14bc <malloc+0x4c>
    14dc:	e1a00006 	mov	r0, r6
    14e0:	ebfffee4 	bl	1078 <sbrk>
    14e4:	e1a03000 	mov	r3, r0
    14e8:	e3730001 	cmn	r3, #1
    14ec:	e2800008 	add	r0, r0, #8
    14f0:	0a000004 	beq	1508 <malloc+0x98>
    14f4:	e5835004 	str	r5, [r3, #4]
    14f8:	ebffffb5 	bl	13d4 <free>
    14fc:	e5973000 	ldr	r3, [r7]
    1500:	e3530000 	cmp	r3, #0
    1504:	1affffec 	bne	14bc <malloc+0x4c>
    1508:	e3a00000 	mov	r0, #0
    150c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    1510:	e1540002 	cmp	r4, r2
    1514:	e5873000 	str	r3, [r7]
    1518:	10422004 	subne	r2, r2, r4
    151c:	15802004 	strne	r2, [r0, #4]
    1520:	05902000 	ldreq	r2, [r0]
    1524:	10800182 	addne	r0, r0, r2, lsl #3
    1528:	e2800008 	add	r0, r0, #8
    152c:	15004004 	strne	r4, [r0, #-4]
    1530:	05832000 	streq	r2, [r3]
    1534:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    1538:	e2870004 	add	r0, r7, #4
    153c:	e5873008 	str	r3, [r7, #8]
    1540:	e5870000 	str	r0, [r7]
    1544:	e5870004 	str	r0, [r7, #4]
    1548:	eaffffd6 	b	14a8 <malloc+0x38>
