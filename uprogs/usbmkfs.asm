
_usbmkfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  struct dinode din;


  _static_assert(sizeof(int) == 4, "Integers must be 4 bytes!");

  if(argc < 2){
       0:	e3500001 	cmp	r0, #1
{
       4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
       8:	e28db018 	add	fp, sp, #24
       c:	e24ddf9b 	sub	sp, sp, #620	; 0x26c
  if(argc < 2){
      10:	da000086 	ble	230 <main+0x230>
  }

  assert(512 % sizeof(struct dinode) == 0);

  /** Create the dev */
  mknod(argv[1], 15, 15);
      14:	e3a0200f 	mov	r2, #15
      18:	e1a04001 	mov	r4, r1
      1c:	e5910004 	ldr	r0, [r1, #4]
      20:	e1a01002 	mov	r1, r2
      24:	eb000398 	bl	e8c <mknod>
  fsfd = open(argv[1], O_RDWR);
      28:	e3a01002 	mov	r1, #2
      2c:	e5940004 	ldr	r0, [r4, #4]
      30:	eb000388 	bl	e58 <open>
      34:	e3013644 	movw	r3, #5700	; 0x1644
      38:	e3403000 	movt	r3, #0

  if(fsfd < 0){
      3c:	e3500000 	cmp	r0, #0
  fsfd = open(argv[1], O_RDWR);
      40:	e5830000 	str	r0, [r3]
  if(fsfd < 0){
      44:	ba000073 	blt	218 <main+0x218>
    printf(1, "%s\n", argv[1]);
    exit();
  }

  sb.size = xint(size);
      48:	e3015608 	movw	r5, #5640	; 0x1608
      4c:	e3405000 	movt	r5, #0
      50:	e301c630 	movw	ip, #5680	; 0x1630
      54:	e340c000 	movt	ip, #0
      58:	e5953008 	ldr	r3, [r5, #8]
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
  sb.ninodes = xint(ninodes);
  sb.nlog = xint(nlog);

  bitblocks = size/(512*8) + 1;
      5c:	e301e640 	movw	lr, #5696	; 0x1640
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
      60:	e595200c 	ldr	r2, [r5, #12]
  bitblocks = size/(512*8) + 1;
      64:	e340e000 	movt	lr, #0
      68:	e2834eff 	add	r4, r3, #4080	; 0xff0
  sb.ninodes = xint(ninodes);
      6c:	e5951004 	ldr	r1, [r5, #4]
  bitblocks = size/(512*8) + 1;
      70:	e3530000 	cmp	r3, #0
      74:	e284400f 	add	r4, r4, #15
  a[0] = x;
      78:	e54b321c 	strb	r3, [fp, #-540]	; 0xfffffde4
  a[1] = x >> 8;
      7c:	e1a06423 	lsr	r6, r3, #8
  a[2] = x >> 16;
      80:	e1a00823 	lsr	r0, r3, #16
  a[1] = x >> 8;
      84:	e54b621b 	strb	r6, [fp, #-539]	; 0xfffffde5
  a[2] = x >> 16;
      88:	e54b021a 	strb	r0, [fp, #-538]	; 0xfffffde6
  a[3] = x >> 24;
      8c:	e1a06c23 	lsr	r6, r3, #24
      90:	e54b6219 	strb	r6, [fp, #-537]	; 0xfffffde7
  bitblocks = size/(512*8) + 1;
      94:	b1a03004 	movlt	r3, r4
  return y;
      98:	e51b621c 	ldr	r6, [fp, #-540]	; 0xfffffde4
  a[1] = x >> 8;
      9c:	e1a04422 	lsr	r4, r2, #8
  sb.nlog = xint(nlog);
      a0:	e5950010 	ldr	r0, [r5, #16]
  bitblocks = size/(512*8) + 1;
      a4:	e1a03643 	asr	r3, r3, #12
  a[0] = x;
      a8:	e54b221c 	strb	r2, [fp, #-540]	; 0xfffffde4
  bitblocks = size/(512*8) + 1;
      ac:	e2833001 	add	r3, r3, #1
  a[1] = x >> 8;
      b0:	e54b421b 	strb	r4, [fp, #-539]	; 0xfffffde5
  a[2] = x >> 16;
      b4:	e1a04822 	lsr	r4, r2, #16
      b8:	e54b421a 	strb	r4, [fp, #-538]	; 0xfffffde6
  a[3] = x >> 24;
      bc:	e1a04c22 	lsr	r4, r2, #24
      c0:	e54b4219 	strb	r4, [fp, #-537]	; 0xfffffde7
  a[1] = x >> 8;
      c4:	e1a04421 	lsr	r4, r1, #8
  return y;
      c8:	e51b821c 	ldr	r8, [fp, #-540]	; 0xfffffde4
  usedblocks = ninodes / IPB + 3 + bitblocks;
  freeblock = usedblocks;

  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
      cc:	e0822000 	add	r2, r2, r0
  a[0] = x;
      d0:	e54b121c 	strb	r1, [fp, #-540]	; 0xfffffde4
  a[1] = x >> 8;
      d4:	e54b421b 	strb	r4, [fp, #-539]	; 0xfffffde5
  a[2] = x >> 16;
      d8:	e1a04821 	lsr	r4, r1, #16
      dc:	e54b421a 	strb	r4, [fp, #-538]	; 0xfffffde6
  a[3] = x >> 24;
      e0:	e1a04c21 	lsr	r4, r1, #24
      e4:	e54b4219 	strb	r4, [fp, #-537]	; 0xfffffde7
  usedblocks = ninodes / IPB + 3 + bitblocks;
      e8:	e1a011a1 	lsr	r1, r1, #3
  return y;
      ec:	e51b721c 	ldr	r7, [fp, #-540]	; 0xfffffde4
  a[1] = x >> 8;
      f0:	e1a04420 	lsr	r4, r0, #8
  a[0] = x;
      f4:	e54b021c 	strb	r0, [fp, #-540]	; 0xfffffde4
  a[1] = x >> 8;
      f8:	e54b421b 	strb	r4, [fp, #-539]	; 0xfffffde5
  a[2] = x >> 16;
      fc:	e1a04820 	lsr	r4, r0, #16
     100:	e54b421a 	strb	r4, [fp, #-538]	; 0xfffffde6
  a[3] = x >> 24;
     104:	e1a04c20 	lsr	r4, r0, #24
     108:	e54b4219 	strb	r4, [fp, #-537]	; 0xfffffde7
  usedblocks = ninodes / IPB + 3 + bitblocks;
     10c:	e2814003 	add	r4, r1, #3
  sb.nblocks = xint(nblocks); // so whole disk is size sectors
     110:	e88c0140 	stm	ip, {r6, r8}
  usedblocks = ninodes / IPB + 3 + bitblocks;
     114:	e0844003 	add	r4, r4, r3
  return y;
     118:	e51b821c 	ldr	r8, [fp, #-540]	; 0xfffffde4
  usedblocks = ninodes / IPB + 3 + bitblocks;
     11c:	e301662c 	movw	r6, #5676	; 0x162c
  sb.ninodes = xint(ninodes);
     120:	e58c7008 	str	r7, [ip, #8]
  usedblocks = ninodes / IPB + 3 + bitblocks;
     124:	e3406000 	movt	r6, #0
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
     128:	e2817001 	add	r7, r1, #1
  freeblock = usedblocks;
     12c:	e3011628 	movw	r1, #5672	; 0x1628
     130:	e3401000 	movt	r1, #0
  bitblocks = size/(512*8) + 1;
     134:	e58e3000 	str	r3, [lr]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
     138:	e0822004 	add	r2, r2, r4
  sb.nlog = xint(nlog);
     13c:	e58c800c 	str	r8, [ip, #12]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
     140:	e58d200c 	str	r2, [sp, #12]
     144:	e1a02004 	mov	r2, r4
  freeblock = usedblocks;
     148:	e5814000 	str	r4, [r1]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
     14c:	e30115a0 	movw	r1, #5536	; 0x15a0
  usedblocks = ninodes / IPB + 3 + bitblocks;
     150:	e5864000 	str	r4, [r6]
  printf(1, "usedblocks number %d (bit %d ninode %d) free %d log %d total %d\n", usedblocks,
     154:	e3401000 	movt	r1, #0
     158:	e58d0008 	str	r0, [sp, #8]
     15c:	e3a00001 	mov	r0, #1
     160:	e58d4004 	str	r4, [sp, #4]
     164:	e58d7000 	str	r7, [sp]
     168:	eb000419 	bl	11d4 <printf>
         bitblocks, ninodes/IPB + 1, freeblock, nlog, nblocks+usedblocks+nlog);

  assert(nblocks + usedblocks + nlog == size);
     16c:	e5952010 	ldr	r2, [r5, #16]
     170:	e595300c 	ldr	r3, [r5, #12]
     174:	e5961000 	ldr	r1, [r6]
     178:	e0833002 	add	r3, r3, r2
     17c:	e5952008 	ldr	r2, [r5, #8]
     180:	e0833001 	add	r3, r3, r1
     184:	e1530002 	cmp	r3, r2
     188:	1a00002d 	bne	244 <main+0x244>

  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     18c:	e3530000 	cmp	r3, #0
    wsect(i, zeroes);
     190:	13017648 	movwne	r7, #5704	; 0x1648
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     194:	13a04000 	movne	r4, #0
    wsect(i, zeroes);
     198:	13407000 	movtne	r7, #0
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     19c:	0a00000a 	beq	1cc <main+0x1cc>
    wsect(i, zeroes);
     1a0:	e1a01007 	mov	r1, r7
     1a4:	e1a00004 	mov	r0, r4
     1a8:	eb0000a4 	bl	440 <wsect>
  for(i = 0; i < nblocks + usedblocks + nlog; i++)
     1ac:	e595300c 	ldr	r3, [r5, #12]
     1b0:	e5951010 	ldr	r1, [r5, #16]
     1b4:	e2844001 	add	r4, r4, #1
     1b8:	e5962000 	ldr	r2, [r6]
     1bc:	e0833001 	add	r3, r3, r1
     1c0:	e0833002 	add	r3, r3, r2
     1c4:	e1530004 	cmp	r3, r4
     1c8:	8afffff4 	bhi	1a0 <main+0x1a0>

  memset(buf, 0, sizeof(buf));
     1cc:	e3a02c02 	mov	r2, #512	; 0x200
     1d0:	e3a01000 	mov	r1, #0
     1d4:	e24b0f87 	sub	r0, fp, #540	; 0x21c
     1d8:	eb00022f 	bl	a9c <memset>
  memmove(buf, &sb, sizeof(sb));
     1dc:	e3a02010 	mov	r2, #16
     1e0:	e24b0f87 	sub	r0, fp, #540	; 0x21c
     1e4:	e3011630 	movw	r1, #5680	; 0x1630
     1e8:	e3401000 	movt	r1, #0
     1ec:	eb00028a 	bl	c1c <memmove>
  wsect(1, buf);
     1f0:	e24b1f87 	sub	r1, fp, #540	; 0x21c
     1f4:	e3a00001 	mov	r0, #1
     1f8:	eb000090 	bl	440 <wsect>

  rootino = ialloc(T_DIR);
     1fc:	e3a00001 	mov	r0, #1
     200:	eb00014b 	bl	734 <ialloc>
  assert(rootino == ROOTINO);
     204:	e3500001 	cmp	r0, #1
  rootino = ialloc(T_DIR);
     208:	e1a04000 	mov	r4, r0
  assert(rootino == ROOTINO);
     20c:	0a00000e 	beq	24c <main+0x24c>
     210:	e3a000a6 	mov	r0, #166	; 0xa6
     214:	eb000037 	bl	2f8 <failure>
    printf(1, "%s\n", argv[1]);
     218:	e5942004 	ldr	r2, [r4, #4]
     21c:	e301159c 	movw	r1, #5532	; 0x159c
     220:	e3a00001 	mov	r0, #1
     224:	e3401000 	movt	r1, #0
     228:	eb0003e9 	bl	11d4 <printf>
    exit();
     22c:	eb000294 	bl	c84 <exit>
    printf(1, "Usage: mkfs fs.img files...\n");
     230:	e301157c 	movw	r1, #5500	; 0x157c
     234:	e3a00001 	mov	r0, #1
     238:	e3401000 	movt	r1, #0
     23c:	eb0003e4 	bl	11d4 <printf>
    exit();
     240:	eb00028f 	bl	c84 <exit>
  assert(nblocks + usedblocks + nlog == size);
     244:	e3a0009c 	mov	r0, #156	; 0x9c
     248:	eb00002a 	bl	2f8 <failure>

  
  memset(&de, 0, sizeof(de));
     24c:	e24b5f9b 	sub	r5, fp, #620	; 0x26c
  a[0] = x;
     250:	e24b7f97 	sub	r7, fp, #604	; 0x25c
  memset(&de, 0, sizeof(de));
     254:	e3a02010 	mov	r2, #16
     258:	e3a01000 	mov	r1, #0
  de.inum = xshort(rootino);
     25c:	e1a08005 	mov	r8, r5
  memset(&de, 0, sizeof(de));
     260:	e1a00005 	mov	r0, r5
     264:	eb00020c 	bl	a9c <memset>
  de.inum = xshort(rootino);
     268:	e0c840b2 	strh	r4, [r8], #2
  strcpy(de.name, ".");
     26c:	e30115e4 	movw	r1, #5604	; 0x15e4
     270:	e1a00008 	mov	r0, r8
     274:	e3401000 	movt	r1, #0
  a[0] = x;
     278:	e1c740b0 	strh	r4, [r7]
  strcpy(de.name, ".");
     27c:	eb0001db 	bl	9f0 <strcpy>
  iappend(rootino, &de, sizeof(de));
     280:	e1a01005 	mov	r1, r5
     284:	e3a02010 	mov	r2, #16
     288:	e1a00004 	mov	r0, r4
     28c:	eb00019d 	bl	908 <iappend>

  memset(&de, 0, sizeof(de));
     290:	e3a02010 	mov	r2, #16
     294:	e3a01000 	mov	r1, #0
     298:	e1a00005 	mov	r0, r5
     29c:	eb0001fe 	bl	a9c <memset>
  de.inum = xshort(rootino);
  strcpy(de.name, "..");
     2a0:	e1a00008 	mov	r0, r8
     2a4:	e30115e8 	movw	r1, #5608	; 0x15e8
  a[0] = x;
     2a8:	e1c740b0 	strh	r4, [r7]
  strcpy(de.name, "..");
     2ac:	e3401000 	movt	r1, #0
  de.inum = xshort(rootino);
     2b0:	e1c540b0 	strh	r4, [r5]
  strcpy(de.name, "..");
     2b4:	eb0001cd 	bl	9f0 <strcpy>
  iappend(rootino, &de, sizeof(de));
     2b8:	e3a02010 	mov	r2, #16
     2bc:	e1a01005 	mov	r1, r5
     2c0:	e1a00004 	mov	r0, r4
     2c4:	eb00018f 	bl	908 <iappend>


  // fix size of root inode dir
  rinode(rootino, &din);
     2c8:	e1a01007 	mov	r1, r7
     2cc:	e1a00004 	mov	r0, r4
     2d0:	eb0000b5 	bl	5ac <rinode>
  din.size = xint(BSIZE);
  winode(rootino, &din);
     2d4:	e1a01007 	mov	r1, r7
     2d8:	e1a00004 	mov	r0, r4
  a[0] = x;
     2dc:	e3a03c02 	mov	r3, #512	; 0x200
     2e0:	e50b3270 	str	r3, [fp, #-624]	; 0xfffffd90
  din.size = xint(BSIZE);
     2e4:	e50b3254 	str	r3, [fp, #-596]	; 0xfffffdac
  winode(rootino, &din);
     2e8:	eb000093 	bl	53c <winode>

  balloc(usedblocks);
     2ec:	e5960000 	ldr	r0, [r6]
     2f0:	eb00012c 	bl	7a8 <balloc>

  exit();
     2f4:	eb000262 	bl	c84 <exit>

000002f8 <failure>:
void failure(int line){
     2f8:	e92d4800 	push	{fp, lr}
  printf(1, "assert failure at line: %d\n", line);
     2fc:	e1a02000 	mov	r2, r0
void failure(int line){
     300:	e28db004 	add	fp, sp, #4
  printf(1, "assert failure at line: %d\n", line);
     304:	e30114ec 	movw	r1, #5356	; 0x14ec
     308:	e3a00001 	mov	r0, #1
     30c:	e3401000 	movt	r1, #0
     310:	eb0003af 	bl	11d4 <printf>
  exit();
     314:	eb00025a 	bl	c84 <exit>

00000318 <strncpy>:
  if(!src || !dst)
     318:	e3500000 	cmp	r0, #0
     31c:	13510000 	cmpne	r1, #0
     320:	0a000012 	beq	370 <strncpy+0x58>
  while(*src && n) {
     324:	e5d1c000 	ldrb	ip, [r1]
char* strncpy(char* dst, const char* src, uint n) {
     328:	e92d4800 	push	{fp, lr}
  while(*src && n) {
     32c:	e3520000 	cmp	r2, #0
     330:	135c0000 	cmpne	ip, #0
char* strncpy(char* dst, const char* src, uint n) {
     334:	e28db004 	add	fp, sp, #4
  while(*src && n) {
     338:	e1a0e000 	mov	lr, r0
     33c:	0a000008 	beq	364 <strncpy+0x4c>
     340:	e2522001 	subs	r2, r2, #1
    *dst = *src;
     344:	e4cec001 	strb	ip, [lr], #1
  while(*src && n) {
     348:	e5f1c001 	ldrb	ip, [r1, #1]!
     34c:	13a03001 	movne	r3, #1
     350:	03a03000 	moveq	r3, #0
     354:	e35c0000 	cmp	ip, #0
     358:	03a03000 	moveq	r3, #0
     35c:	e3530000 	cmp	r3, #0
     360:	1afffff6 	bne	340 <strncpy+0x28>
  *dst = '\0';
     364:	e3a03000 	mov	r3, #0
     368:	e5ce3000 	strb	r3, [lr]
}
     36c:	e8bd8800 	pop	{fp, pc}
    return 0;
     370:	e3a00000 	mov	r0, #0
}
     374:	e12fff1e 	bx	lr

00000378 <index>:
  if(!src || !*src)
     378:	e2503000 	subs	r3, r0, #0
     37c:	0a000015 	beq	3d8 <index+0x60>
     380:	e5d32000 	ldrb	r2, [r3]
     384:	e3520000 	cmp	r2, #0
     388:	0a000012 	beq	3d8 <index+0x60>
char* index(char* src, char c) {
     38c:	e92d4830 	push	{r4, r5, fp, lr}
     390:	e1a05003 	mov	r5, r3
     394:	e28db00c 	add	fp, sp, #12
     398:	e1a04001 	mov	r4, r1
  length = strlen(src);
     39c:	eb0001ae 	bl	a5c <strlen>
  while(*src && length--){
     3a0:	e5d52000 	ldrb	r2, [r5]
     3a4:	e3a03000 	mov	r3, #0
     3a8:	ea000004 	b	3c0 <index+0x48>
     3ac:	e1500003 	cmp	r0, r3
     3b0:	e2833001 	add	r3, r3, #1
     3b4:	0a000003 	beq	3c8 <index+0x50>
    if(*src == c)
     3b8:	e1520004 	cmp	r2, r4
     3bc:	0a000003 	beq	3d0 <index+0x58>
  while(*src && length--){
     3c0:	e3520000 	cmp	r2, #0
     3c4:	1afffff8 	bne	3ac <index+0x34>
    return 0;
     3c8:	e3a00000 	mov	r0, #0
     3cc:	e8bd8830 	pop	{r4, r5, fp, pc}
     3d0:	e1a00005 	mov	r0, r5
}
     3d4:	e8bd8830 	pop	{r4, r5, fp, pc}
    return 0;
     3d8:	e3a00000 	mov	r0, #0
}
     3dc:	e12fff1e 	bx	lr

000003e0 <xshort>:
{
     3e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     3e4:	e28db000 	add	fp, sp, #0
     3e8:	e24dd00c 	sub	sp, sp, #12
  a[0] = x;
     3ec:	e54b0006 	strb	r0, [fp, #-6]
  a[1] = x >> 8;
     3f0:	e1a00420 	lsr	r0, r0, #8
     3f4:	e54b0005 	strb	r0, [fp, #-5]
}
     3f8:	e15b00b6 	ldrh	r0, [fp, #-6]
     3fc:	e28bd000 	add	sp, fp, #0
     400:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     404:	e12fff1e 	bx	lr

00000408 <xint>:
{
     408:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     40c:	e28db000 	add	fp, sp, #0
  a[1] = x >> 8;
     410:	e1a02420 	lsr	r2, r0, #8
{
     414:	e24dd00c 	sub	sp, sp, #12
  a[2] = x >> 16;
     418:	e1a03820 	lsr	r3, r0, #16
  a[0] = x;
     41c:	e54b0008 	strb	r0, [fp, #-8]
  a[3] = x >> 24;
     420:	e1a00c20 	lsr	r0, r0, #24
  a[1] = x >> 8;
     424:	e54b2007 	strb	r2, [fp, #-7]
  a[2] = x >> 16;
     428:	e54b3006 	strb	r3, [fp, #-6]
  a[3] = x >> 24;
     42c:	e54b0005 	strb	r0, [fp, #-5]
}
     430:	e51b0008 	ldr	r0, [fp, #-8]
     434:	e28bd000 	add	sp, fp, #0
     438:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     43c:	e12fff1e 	bx	lr

00000440 <wsect>:
}

void
wsect(uint sec, void *buf)
{
     440:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     444:	e1a05480 	lsl	r5, r0, #9
     448:	e3014644 	movw	r4, #5700	; 0x1644
     44c:	e3404000 	movt	r4, #0
{
     450:	e28db014 	add	fp, sp, #20
     454:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     458:	e3a02000 	mov	r2, #0
     45c:	e1a01005 	mov	r1, r5
     460:	e5940000 	ldr	r0, [r4]
     464:	eb000220 	bl	cec <lseek>
     468:	e1550000 	cmp	r5, r0
     46c:	1a00000a 	bne	49c <wsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(write(fsfd, buf, 512) != 512){
     470:	e1a01006 	mov	r1, r6
     474:	e5940000 	ldr	r0, [r4]
     478:	e3a02c02 	mov	r2, #512	; 0x200
     47c:	eb000241 	bl	d88 <write>
     480:	e3500c02 	cmp	r0, #512	; 0x200
     484:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "write");
     488:	e3011510 	movw	r1, #5392	; 0x1510
     48c:	e3a00001 	mov	r0, #1
     490:	e3401000 	movt	r1, #0
     494:	eb00034e 	bl	11d4 <printf>
    exit();
     498:	eb0001f9 	bl	c84 <exit>
    printf(1, "lseek");
     49c:	e3011508 	movw	r1, #5384	; 0x1508
     4a0:	e3a00001 	mov	r0, #1
     4a4:	e3401000 	movt	r1, #0
     4a8:	eb000349 	bl	11d4 <printf>
    exit();
     4ac:	eb0001f4 	bl	c84 <exit>

000004b0 <i2b>:
}

uint
i2b(uint inum)
{
  return (inum / IPB) + 2;
     4b0:	e1a001a0 	lsr	r0, r0, #3
{
     4b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
}
     4b8:	e2800002 	add	r0, r0, #2
{
     4bc:	e28db000 	add	fp, sp, #0
}
     4c0:	e28bd000 	add	sp, fp, #0
     4c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     4c8:	e12fff1e 	bx	lr

000004cc <rsect>:
  *ip = *dip;
}

void
rsect(uint sec, void *buf)
{
     4cc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     4d0:	e1a05480 	lsl	r5, r0, #9
     4d4:	e3014644 	movw	r4, #5700	; 0x1644
     4d8:	e3404000 	movt	r4, #0
{
     4dc:	e28db014 	add	fp, sp, #20
     4e0:	e1a06001 	mov	r6, r1
  if(lseek(fsfd, sec * 512L, 0) != sec * 512L){
     4e4:	e3a02000 	mov	r2, #0
     4e8:	e1a01005 	mov	r1, r5
     4ec:	e5940000 	ldr	r0, [r4]
     4f0:	eb0001fd 	bl	cec <lseek>
     4f4:	e1550000 	cmp	r5, r0
     4f8:	1a00000a 	bne	528 <rsect+0x5c>
    printf(1, "lseek");
    exit();
  }
  if(read(fsfd, buf, 512) != 512){
     4fc:	e1a01006 	mov	r1, r6
     500:	e5940000 	ldr	r0, [r4]
     504:	e3a02c02 	mov	r2, #512	; 0x200
     508:	eb000211 	bl	d54 <read>
     50c:	e3500c02 	cmp	r0, #512	; 0x200
     510:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
    printf(1, "read");
     514:	e3011518 	movw	r1, #5400	; 0x1518
     518:	e3a00001 	mov	r0, #1
     51c:	e3401000 	movt	r1, #0
     520:	eb00032b 	bl	11d4 <printf>
    exit();
     524:	eb0001d6 	bl	c84 <exit>
    printf(1, "lseek");
     528:	e3011508 	movw	r1, #5384	; 0x1508
     52c:	e3a00001 	mov	r0, #1
     530:	e3401000 	movt	r1, #0
     534:	eb000326 	bl	11d4 <printf>
    exit();
     538:	eb0001d1 	bl	c84 <exit>

0000053c <winode>:
{
     53c:	e92d4870 	push	{r4, r5, r6, fp, lr}
  return (inum / IPB) + 2;
     540:	e1a061a0 	lsr	r6, r0, #3
     544:	e2866002 	add	r6, r6, #2
{
     548:	e28db010 	add	fp, sp, #16
     54c:	e1a04000 	mov	r4, r0
     550:	e24ddf81 	sub	sp, sp, #516	; 0x204
     554:	e1a05001 	mov	r5, r1
  rsect(bn, buf);
     558:	e24b1f85 	sub	r1, fp, #532	; 0x214
     55c:	e1a00006 	mov	r0, r6
     560:	ebffffd9 	bl	4cc <rsect>
  *dip = *ip;
     564:	e1a0e005 	mov	lr, r5
     568:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
  dip = ((struct dinode*)buf) + (inum % IPB);
     56c:	e204c007 	and	ip, r4, #7
  *dip = *ip;
     570:	e24b4014 	sub	r4, fp, #20
     574:	e084c30c 	add	ip, r4, ip, lsl #6
     578:	e24ccc02 	sub	ip, ip, #512	; 0x200
     57c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     580:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
     584:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     588:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
     58c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
     590:	e89e000f 	ldm	lr, {r0, r1, r2, r3}
     594:	e88c000f 	stm	ip, {r0, r1, r2, r3}
  wsect(bn, buf);
     598:	e1a00006 	mov	r0, r6
     59c:	e24b1f85 	sub	r1, fp, #532	; 0x214
     5a0:	ebffffa6 	bl	440 <wsect>
}
     5a4:	e24bd010 	sub	sp, fp, #16
     5a8:	e8bd8870 	pop	{r4, r5, r6, fp, pc}

000005ac <rinode>:
{
     5ac:	e92d4830 	push	{r4, r5, fp, lr}
     5b0:	e1a04000 	mov	r4, r0
     5b4:	e28db00c 	add	fp, sp, #12
  return (inum / IPB) + 2;
     5b8:	e1a001a0 	lsr	r0, r0, #3
{
     5bc:	e24ddc02 	sub	sp, sp, #512	; 0x200
     5c0:	e1a05001 	mov	r5, r1
  rsect(bn, buf);
     5c4:	e24b1f83 	sub	r1, fp, #524	; 0x20c
     5c8:	e2800002 	add	r0, r0, #2
     5cc:	ebffffbe 	bl	4cc <rsect>
  dip = ((struct dinode*)buf) + (inum % IPB);
     5d0:	e204c007 	and	ip, r4, #7
  *ip = *dip;
     5d4:	e24b300c 	sub	r3, fp, #12
     5d8:	e1a0e005 	mov	lr, r5
     5dc:	e083c30c 	add	ip, r3, ip, lsl #6
     5e0:	e24ccc02 	sub	ip, ip, #512	; 0x200
     5e4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     5e8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     5ec:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     5f0:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     5f4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
     5f8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
     5fc:	e89c000f 	ldm	ip, {r0, r1, r2, r3}
     600:	e88e000f 	stm	lr, {r0, r1, r2, r3}
}
     604:	e24bd00c 	sub	sp, fp, #12
     608:	e8bd8830 	pop	{r4, r5, fp, pc}

0000060c <bmap.part.2>:
  wsect(ninodes / IPB + 3, buf);
}

#define min(a, b) ((a) < (b) ? (a) : (b))

uint bmap(uint inum, struct dinode *din, uint bn) {
     60c:	e92d4870 	push	{r4, r5, r6, fp, lr}
     610:	e28db010 	add	fp, sp, #16
     614:	e24ddf83 	sub	sp, sp, #524	; 0x20c
		return xint(address);
	}

	bn -= NDIRECT;

	if(din->addrs[NDIRECT] == 0) {
     618:	e591303c 	ldr	r3, [r1, #60]	; 0x3c
uint bmap(uint inum, struct dinode *din, uint bn) {
     61c:	e1a05001 	mov	r5, r1
	bn -= NDIRECT;
     620:	e242600c 	sub	r6, r2, #12
	if(din->addrs[NDIRECT] == 0) {
     624:	e3530000 	cmp	r3, #0
     628:	0a000014 	beq	680 <bmap.part.2+0x74>
		din->addrs[NDIRECT] = xint(freeblock++);
		usedblocks++;
		winode(inum, din);
	}
	memset(buffer, 0, sizeof buffer);
     62c:	e24b4f85 	sub	r4, fp, #532	; 0x214
     630:	e3a02c02 	mov	r2, #512	; 0x200
     634:	e3a01000 	mov	r1, #0
     638:	e1a00004 	mov	r0, r4
     63c:	eb000116 	bl	a9c <memset>
	rsect(din->addrs[NDIRECT], buffer);
     640:	e1a01004 	mov	r1, r4
     644:	e595003c 	ldr	r0, [r5, #60]	; 0x3c
     648:	ebffff9f 	bl	4cc <rsect>

	a = (uint *)buffer;

	address = a[bn];
     64c:	e7943106 	ldr	r3, [r4, r6, lsl #2]

	if(address == 0) {
     650:	e3530000 	cmp	r3, #0
     654:	0a00001e 	beq	6d4 <bmap.part.2+0xc8>
  a[0] = x;
     658:	e54b3218 	strb	r3, [fp, #-536]	; 0xfffffde8
  a[1] = x >> 8;
     65c:	e1a01423 	lsr	r1, r3, #8
  a[2] = x >> 16;
     660:	e1a02823 	lsr	r2, r3, #16
  a[1] = x >> 8;
     664:	e54b1217 	strb	r1, [fp, #-535]	; 0xfffffde9
  a[2] = x >> 16;
     668:	e54b2216 	strb	r2, [fp, #-534]	; 0xfffffdea
  a[3] = x >> 24;
     66c:	e1a03c23 	lsr	r3, r3, #24
     670:	e54b3215 	strb	r3, [fp, #-533]	; 0xfffffdeb
		wsect(din->addrs[NDIRECT], buffer);
		address = a[bn];
	}

	return xint(address);
}
     674:	e51b0218 	ldr	r0, [fp, #-536]	; 0xfffffde8
     678:	e24bd010 	sub	sp, fp, #16
     67c:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
		din->addrs[NDIRECT] = xint(freeblock++);
     680:	e301c628 	movw	ip, #5672	; 0x1628
     684:	e340c000 	movt	ip, #0
		usedblocks++;
     688:	e301262c 	movw	r2, #5676	; 0x162c
     68c:	e3402000 	movt	r2, #0
		din->addrs[NDIRECT] = xint(freeblock++);
     690:	e59c3000 	ldr	r3, [ip]
     694:	e283e001 	add	lr, r3, #1
     698:	e58ce000 	str	lr, [ip]
  a[0] = x;
     69c:	e54b3214 	strb	r3, [fp, #-532]	; 0xfffffdec
  a[1] = x >> 8;
     6a0:	e1a0c423 	lsr	ip, r3, #8
     6a4:	e54bc213 	strb	ip, [fp, #-531]	; 0xfffffded
  a[2] = x >> 16;
     6a8:	e1a0c823 	lsr	ip, r3, #16
  a[3] = x >> 24;
     6ac:	e1a03c23 	lsr	r3, r3, #24
  a[2] = x >> 16;
     6b0:	e54bc212 	strb	ip, [fp, #-530]	; 0xfffffdee
  a[3] = x >> 24;
     6b4:	e54b3211 	strb	r3, [fp, #-529]	; 0xfffffdef
  return y;
     6b8:	e51bc214 	ldr	ip, [fp, #-532]	; 0xfffffdec
		usedblocks++;
     6bc:	e5923000 	ldr	r3, [r2]
		din->addrs[NDIRECT] = xint(freeblock++);
     6c0:	e581c03c 	str	ip, [r1, #60]	; 0x3c
		usedblocks++;
     6c4:	e2833001 	add	r3, r3, #1
     6c8:	e5823000 	str	r3, [r2]
		winode(inum, din);
     6cc:	ebffff9a 	bl	53c <winode>
     6d0:	eaffffd5 	b	62c <bmap.part.2+0x20>
		a[bn] = xint(freeblock++);
     6d4:	e3011628 	movw	r1, #5672	; 0x1628
     6d8:	e3401000 	movt	r1, #0
		usedblocks++;
     6dc:	e301262c 	movw	r2, #5676	; 0x162c
     6e0:	e3402000 	movt	r2, #0
		a[bn] = xint(freeblock++);
     6e4:	e5913000 	ldr	r3, [r1]
		wsect(din->addrs[NDIRECT], buffer);
     6e8:	e595003c 	ldr	r0, [r5, #60]	; 0x3c
		a[bn] = xint(freeblock++);
     6ec:	e283c001 	add	ip, r3, #1
     6f0:	e581c000 	str	ip, [r1]
  a[0] = x;
     6f4:	e54b3218 	strb	r3, [fp, #-536]	; 0xfffffde8
  a[1] = x >> 8;
     6f8:	e1a01423 	lsr	r1, r3, #8
     6fc:	e54b1217 	strb	r1, [fp, #-535]	; 0xfffffde9
  a[2] = x >> 16;
     700:	e1a01823 	lsr	r1, r3, #16
  a[3] = x >> 24;
     704:	e1a03c23 	lsr	r3, r3, #24
  a[2] = x >> 16;
     708:	e54b1216 	strb	r1, [fp, #-534]	; 0xfffffdea
  a[3] = x >> 24;
     70c:	e54b3215 	strb	r3, [fp, #-533]	; 0xfffffdeb
		wsect(din->addrs[NDIRECT], buffer);
     710:	e1a01004 	mov	r1, r4
  return y;
     714:	e51bc218 	ldr	ip, [fp, #-536]	; 0xfffffde8
		usedblocks++;
     718:	e5923000 	ldr	r3, [r2]
		a[bn] = xint(freeblock++);
     71c:	e784c106 	str	ip, [r4, r6, lsl #2]
		usedblocks++;
     720:	e2833001 	add	r3, r3, #1
     724:	e5823000 	str	r3, [r2]
		wsect(din->addrs[NDIRECT], buffer);
     728:	ebffff44 	bl	440 <wsect>
		address = a[bn];
     72c:	e7943106 	ldr	r3, [r4, r6, lsl #2]
     730:	eaffffc8 	b	658 <bmap.part.2+0x4c>

00000734 <ialloc>:
  uint inum = freeinode++;
     734:	e3013608 	movw	r3, #5640	; 0x1608
     738:	e3403000 	movt	r3, #0
{
     73c:	e92d4830 	push	{r4, r5, fp, lr}
     740:	e28db00c 	add	fp, sp, #12
     744:	e24dd048 	sub	sp, sp, #72	; 0x48
  uint inum = freeinode++;
     748:	e5935000 	ldr	r5, [r3]
{
     74c:	e1a04000 	mov	r4, r0
  memset(&din, 0, sizeof(din));
     750:	e3a02040 	mov	r2, #64	; 0x40
     754:	e24b004c 	sub	r0, fp, #76	; 0x4c
     758:	e3a01000 	mov	r1, #0
  uint inum = freeinode++;
     75c:	e285c001 	add	ip, r5, #1
     760:	e583c000 	str	ip, [r3]
  memset(&din, 0, sizeof(din));
     764:	eb0000cc 	bl	a9c <memset>
  a[0] = x;
     768:	e54b4050 	strb	r4, [fp, #-80]	; 0xffffffb0
  a[1] = x >> 8;
     76c:	e1a04424 	lsr	r4, r4, #8
     770:	e54b404f 	strb	r4, [fp, #-79]	; 0xffffffb1
  winode(inum, &din);
     774:	e1a00005 	mov	r0, r5
  return y;
     778:	e15b25b0 	ldrh	r2, [fp, #-80]	; 0xffffffb0
  winode(inum, &din);
     77c:	e24b104c 	sub	r1, fp, #76	; 0x4c
  a[0] = x;
     780:	e3a03000 	mov	r3, #0
  a[0] = x;
     784:	e3a0c001 	mov	ip, #1
  a[0] = x;
     788:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
  din.nlink = xshort(1);
     78c:	e14bc4b6 	strh	ip, [fp, #-70]	; 0xffffffba
  din.type = xshort(type);
     790:	e14b24bc 	strh	r2, [fp, #-76]	; 0xffffffb4
  din.size = xint(0);
     794:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
  winode(inum, &din);
     798:	ebffff67 	bl	53c <winode>
}
     79c:	e1a00005 	mov	r0, r5
     7a0:	e24bd00c 	sub	sp, fp, #12
     7a4:	e8bd8830 	pop	{r4, r5, fp, pc}

000007a8 <balloc>:
{
     7a8:	e92d4810 	push	{r4, fp, lr}
  printf(1, "balloc: first %d blocks have been allocated\n", used);
     7ac:	e1a02000 	mov	r2, r0
{
     7b0:	e28db008 	add	fp, sp, #8
     7b4:	e1a04000 	mov	r4, r0
     7b8:	e24ddf81 	sub	sp, sp, #516	; 0x204
  printf(1, "balloc: first %d blocks have been allocated\n", used);
     7bc:	e3011520 	movw	r1, #5408	; 0x1520
     7c0:	e3401000 	movt	r1, #0
     7c4:	e3a00001 	mov	r0, #1
     7c8:	eb000281 	bl	11d4 <printf>
  assert(used < 512*8);
     7cc:	e3540a01 	cmp	r4, #4096	; 0x1000
     7d0:	aa000020 	bge	858 <balloc+0xb0>
  memset(buf, 0, 512);
     7d4:	e3a02c02 	mov	r2, #512	; 0x200
     7d8:	e3a01000 	mov	r1, #0
     7dc:	e24b0f83 	sub	r0, fp, #524	; 0x20c
     7e0:	eb0000ad 	bl	a9c <memset>
  for(i = 0; i < used; i++){
     7e4:	e3540000 	cmp	r4, #0
     7e8:	da00000a 	ble	818 <balloc+0x70>
     7ec:	e3a03000 	mov	r3, #0
    buf[i/8] = buf[i/8] | (0x1 << (i%8));
     7f0:	e3a0c001 	mov	ip, #1
     7f4:	e24b200c 	sub	r2, fp, #12
     7f8:	e2030007 	and	r0, r3, #7
     7fc:	e08211c3 	add	r1, r2, r3, asr #3
  for(i = 0; i < used; i++){
     800:	e2833001 	add	r3, r3, #1
     804:	e1540003 	cmp	r4, r3
    buf[i/8] = buf[i/8] | (0x1 << (i%8));
     808:	e5512200 	ldrb	r2, [r1, #-512]	; 0xfffffe00
     80c:	e182201c 	orr	r2, r2, ip, lsl r0
     810:	e5412200 	strb	r2, [r1, #-512]	; 0xfffffe00
  for(i = 0; i < used; i++){
     814:	1afffff6 	bne	7f4 <balloc+0x4c>
  printf(1, "balloc: write bitmap block at sector %d\n", ninodes/IPB + 3);
     818:	e3014608 	movw	r4, #5640	; 0x1608
     81c:	e3404000 	movt	r4, #0
     820:	e3a00001 	mov	r0, #1
     824:	e3011550 	movw	r1, #5456	; 0x1550
     828:	e5942004 	ldr	r2, [r4, #4]
     82c:	e3401000 	movt	r1, #0
     830:	e1a021a2 	lsr	r2, r2, #3
     834:	e2822003 	add	r2, r2, #3
     838:	eb000265 	bl	11d4 <printf>
  wsect(ninodes / IPB + 3, buf);
     83c:	e5940004 	ldr	r0, [r4, #4]
     840:	e24b1f83 	sub	r1, fp, #524	; 0x20c
     844:	e1a001a0 	lsr	r0, r0, #3
     848:	e2800003 	add	r0, r0, #3
     84c:	ebfffefb 	bl	440 <wsect>
}
     850:	e24bd008 	sub	sp, fp, #8
     854:	e8bd8810 	pop	{r4, fp, pc}
  assert(used < 512*8);
     858:	e300010e 	movw	r0, #270	; 0x10e
     85c:	ebfffea5 	bl	2f8 <failure>

00000860 <bmap>:
	if(bn < NDIRECT) {
     860:	e352000b 	cmp	r2, #11
     864:	8a000010 	bhi	8ac <bmap+0x4c>
uint bmap(uint inum, struct dinode *din, uint bn) {
     868:	e92d4810 	push	{r4, fp, lr}
     86c:	e0814102 	add	r4, r1, r2, lsl #2
     870:	e28db008 	add	fp, sp, #8
     874:	e24dd00c 	sub	sp, sp, #12
		address = din->addrs[bn];
     878:	e594300c 	ldr	r3, [r4, #12]
		if(address == 0) {
     87c:	e3530000 	cmp	r3, #0
     880:	0a00000a 	beq	8b0 <bmap+0x50>
  a[0] = x;
     884:	e54b3010 	strb	r3, [fp, #-16]
  a[1] = x >> 8;
     888:	e1a01423 	lsr	r1, r3, #8
  a[2] = x >> 16;
     88c:	e1a02823 	lsr	r2, r3, #16
  a[1] = x >> 8;
     890:	e54b100f 	strb	r1, [fp, #-15]
  a[2] = x >> 16;
     894:	e54b200e 	strb	r2, [fp, #-14]
  a[3] = x >> 24;
     898:	e1a03c23 	lsr	r3, r3, #24
     89c:	e54b300d 	strb	r3, [fp, #-13]
  return y;
     8a0:	e51b0010 	ldr	r0, [fp, #-16]
}
     8a4:	e24bd008 	sub	sp, fp, #8
     8a8:	e8bd8810 	pop	{r4, fp, pc}
     8ac:	eaffff56 	b	60c <bmap.part.2>
			din->addrs[bn] = xint(freeblock++);
     8b0:	e301c628 	movw	ip, #5672	; 0x1628
     8b4:	e340c000 	movt	ip, #0
			usedblocks++;
     8b8:	e301262c 	movw	r2, #5676	; 0x162c
     8bc:	e3402000 	movt	r2, #0
			din->addrs[bn] = xint(freeblock++);
     8c0:	e59c3000 	ldr	r3, [ip]
     8c4:	e283e001 	add	lr, r3, #1
     8c8:	e58ce000 	str	lr, [ip]
  a[0] = x;
     8cc:	e54b3010 	strb	r3, [fp, #-16]
  a[1] = x >> 8;
     8d0:	e1a0c423 	lsr	ip, r3, #8
     8d4:	e54bc00f 	strb	ip, [fp, #-15]
  a[2] = x >> 16;
     8d8:	e1a0c823 	lsr	ip, r3, #16
  a[3] = x >> 24;
     8dc:	e1a03c23 	lsr	r3, r3, #24
  a[2] = x >> 16;
     8e0:	e54bc00e 	strb	ip, [fp, #-14]
  a[3] = x >> 24;
     8e4:	e54b300d 	strb	r3, [fp, #-13]
  return y;
     8e8:	e51bc010 	ldr	ip, [fp, #-16]
			usedblocks++;
     8ec:	e5923000 	ldr	r3, [r2]
			din->addrs[bn] = xint(freeblock++);
     8f0:	e584c00c 	str	ip, [r4, #12]
			usedblocks++;
     8f4:	e2833001 	add	r3, r3, #1
     8f8:	e5823000 	str	r3, [r2]
			winode(inum, din);
     8fc:	ebffff0e 	bl	53c <winode>
			address = din->addrs[bn];
     900:	e594300c 	ldr	r3, [r4, #12]
     904:	eaffffde 	b	884 <bmap+0x24>

00000908 <iappend>:


void iappend(uint inum, void *xp, int n){
     908:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     90c:	e28db01c 	add	fp, sp, #28
     910:	e1a07000 	mov	r7, r0
     914:	e24ddf92 	sub	sp, sp, #584	; 0x248
     918:	e1a06002 	mov	r6, r2
	uint total = 0;
	uint m = 0;
	uint offset = 0;
	uint bn = 0;

	memset(&din, 0, sizeof din);
     91c:	e3a02040 	mov	r2, #64	; 0x40
void iappend(uint inum, void *xp, int n){
     920:	e1a08001 	mov	r8, r1
	memset(&din, 0, sizeof din);
     924:	e24b0f97 	sub	r0, fp, #604	; 0x25c
     928:	e3a01000 	mov	r1, #0
     92c:	eb00005a 	bl	a9c <memset>
	rinode(inum, &din);
     930:	e24b1f97 	sub	r1, fp, #604	; 0x25c
     934:	e1a00007 	mov	r0, r7
     938:	ebffff1b 	bl	5ac <rinode>

	offset = din.size;

	for(total = 0; total < n; total += m, offset += m) {
     93c:	e3560000 	cmp	r6, #0
	offset = din.size;
     940:	e51b4254 	ldr	r4, [fp, #-596]	; 0xfffffdac
	for(total = 0; total < n; total += m, offset += m) {
     944:	0a00001b 	beq	9b8 <iappend+0xb0>
     948:	e3a05000 	mov	r5, #0
		memset(buf, 0, sizeof buf);
     94c:	e3a02c02 	mov	r2, #512	; 0x200
     950:	e3a01000 	mov	r1, #0
     954:	e24b0f87 	sub	r0, fp, #540	; 0x21c
     958:	eb00004f 	bl	a9c <memset>
		bn = bmap(inum, &din, offset / 512);
     95c:	e1a024a4 	lsr	r2, r4, #9
     960:	e24b1f97 	sub	r1, fp, #604	; 0x25c
     964:	e1a00007 	mov	r0, r7
     968:	ebffffbc 	bl	860 <bmap>
		rsect(bn, buf);
     96c:	e24b1f87 	sub	r1, fp, #540	; 0x21c
		bn = bmap(inum, &din, offset / 512);
     970:	e1a09000 	mov	r9, r0
		rsect(bn, buf);
     974:	ebfffed4 	bl	4cc <rsect>
		m = min(n - total, 512 - offset%512);
     978:	e7e80054 	ubfx	r0, r4, #0, #9
     97c:	e0463005 	sub	r3, r6, r5
     980:	e2602c02 	rsb	r2, r0, #512	; 0x200
		memmove(buf + offset % 512, p + total, m);
     984:	e24b1f87 	sub	r1, fp, #540	; 0x21c
		m = min(n - total, 512 - offset%512);
     988:	e1520003 	cmp	r2, r3
		memmove(buf + offset % 512, p + total, m);
     98c:	e0810000 	add	r0, r1, r0
     990:	e0881005 	add	r1, r8, r5
		m = min(n - total, 512 - offset%512);
     994:	21a02003 	movcs	r2, r3
	for(total = 0; total < n; total += m, offset += m) {
     998:	e0855002 	add	r5, r5, r2
     99c:	e0844002 	add	r4, r4, r2
		memmove(buf + offset % 512, p + total, m);
     9a0:	eb00009d 	bl	c1c <memmove>
		wsect(bn, buf);	
     9a4:	e24b1f87 	sub	r1, fp, #540	; 0x21c
     9a8:	e1a00009 	mov	r0, r9
     9ac:	ebfffea3 	bl	440 <wsect>
	for(total = 0; total < n; total += m, offset += m) {
     9b0:	e1550006 	cmp	r5, r6
     9b4:	3affffe4 	bcc	94c <iappend+0x44>
  a[0] = x;
     9b8:	e54b4260 	strb	r4, [fp, #-608]	; 0xfffffda0
  a[1] = x >> 8;
     9bc:	e1a02424 	lsr	r2, r4, #8
  a[2] = x >> 16;
     9c0:	e1a03824 	lsr	r3, r4, #16
  a[1] = x >> 8;
     9c4:	e54b225f 	strb	r2, [fp, #-607]	; 0xfffffda1
  a[2] = x >> 16;
     9c8:	e54b325e 	strb	r3, [fp, #-606]	; 0xfffffda2
  a[3] = x >> 24;
     9cc:	e1a04c24 	lsr	r4, r4, #24
     9d0:	e54b425d 	strb	r4, [fp, #-605]	; 0xfffffda3
	}

	din.size = xint(offset);
	winode(inum, &din); 	
     9d4:	e24b1f97 	sub	r1, fp, #604	; 0x25c
  return y;
     9d8:	e51b3260 	ldr	r3, [fp, #-608]	; 0xfffffda0
	winode(inum, &din); 	
     9dc:	e1a00007 	mov	r0, r7
	din.size = xint(offset);
     9e0:	e50b3254 	str	r3, [fp, #-596]	; 0xfffffdac
	winode(inum, &din); 	
     9e4:	ebfffed4 	bl	53c <winode>
}
     9e8:	e24bd01c 	sub	sp, fp, #28
     9ec:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000009f0 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     9f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     9f4:	e2402001 	sub	r2, r0, #1
     9f8:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     9fc:	e4d13001 	ldrb	r3, [r1], #1
     a00:	e3530000 	cmp	r3, #0
     a04:	e5e23001 	strb	r3, [r2, #1]!
     a08:	1afffffb 	bne	9fc <strcpy+0xc>
    ;
  return os;
}
     a0c:	e28bd000 	add	sp, fp, #0
     a10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a14:	e12fff1e 	bx	lr

00000a18 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a1c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
     a20:	e5d03000 	ldrb	r3, [r0]
     a24:	e5d12000 	ldrb	r2, [r1]
     a28:	e3530000 	cmp	r3, #0
     a2c:	1a000004 	bne	a44 <strcmp+0x2c>
     a30:	ea000005 	b	a4c <strcmp+0x34>
     a34:	e5f03001 	ldrb	r3, [r0, #1]!
     a38:	e5f12001 	ldrb	r2, [r1, #1]!
     a3c:	e3530000 	cmp	r3, #0
     a40:	0a000001 	beq	a4c <strcmp+0x34>
     a44:	e1530002 	cmp	r3, r2
     a48:	0afffff9 	beq	a34 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     a4c:	e0430002 	sub	r0, r3, r2
     a50:	e28bd000 	add	sp, fp, #0
     a54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a58:	e12fff1e 	bx	lr

00000a5c <strlen>:

uint
strlen(char *s)
{
     a5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     a60:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
     a64:	e5d03000 	ldrb	r3, [r0]
     a68:	e3530000 	cmp	r3, #0
     a6c:	01a00003 	moveq	r0, r3
     a70:	0a000006 	beq	a90 <strlen+0x34>
     a74:	e1a02000 	mov	r2, r0
     a78:	e3a03000 	mov	r3, #0
     a7c:	e5f21001 	ldrb	r1, [r2, #1]!
     a80:	e2833001 	add	r3, r3, #1
     a84:	e3510000 	cmp	r1, #0
     a88:	e1a00003 	mov	r0, r3
     a8c:	1afffffa 	bne	a7c <strlen+0x20>
    ;
  return n;
}
     a90:	e28bd000 	add	sp, fp, #0
     a94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     a98:	e12fff1e 	bx	lr

00000a9c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     a9c:	e3520000 	cmp	r2, #0
{
     aa0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     aa4:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
     aa8:	0a000004 	beq	ac0 <memset+0x24>
     aac:	e6ef1071 	uxtb	r1, r1
     ab0:	e0802002 	add	r2, r0, r2
     ab4:	e4c01001 	strb	r1, [r0], #1
     ab8:	e1520000 	cmp	r2, r0
     abc:	1afffffc 	bne	ab4 <memset+0x18>
  return (void *)p;
}
     ac0:	e28bd000 	add	sp, fp, #0
     ac4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     ac8:	e12fff1e 	bx	lr

00000acc <strchr>:

char*
strchr(const char *s, char c)
{
     acc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ad0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
     ad4:	e5d02000 	ldrb	r2, [r0]
     ad8:	e3520000 	cmp	r2, #0
     adc:	0a00000b 	beq	b10 <strchr+0x44>
    if(*s == c)
     ae0:	e1510002 	cmp	r1, r2
     ae4:	1a000002 	bne	af4 <strchr+0x28>
     ae8:	ea000005 	b	b04 <strchr+0x38>
     aec:	e1530001 	cmp	r3, r1
     af0:	0a000003 	beq	b04 <strchr+0x38>
  for(; *s; s++)
     af4:	e5f03001 	ldrb	r3, [r0, #1]!
     af8:	e3530000 	cmp	r3, #0
     afc:	1afffffa 	bne	aec <strchr+0x20>
      return (char*)s;
  return 0;
     b00:	e1a00003 	mov	r0, r3
}
     b04:	e28bd000 	add	sp, fp, #0
     b08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b0c:	e12fff1e 	bx	lr
  return 0;
     b10:	e1a00002 	mov	r0, r2
     b14:	eafffffa 	b	b04 <strchr+0x38>

00000b18 <gets>:

char*
gets(char *buf, int max)
{
     b18:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     b1c:	e1a03000 	mov	r3, r0
     b20:	e28db014 	add	fp, sp, #20
     b24:	e1a07000 	mov	r7, r0
     b28:	e24dd008 	sub	sp, sp, #8
     b2c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b30:	e3a04000 	mov	r4, #0
     b34:	ea000008 	b	b5c <gets+0x44>
    cc = read(0, &c, 1);
     b38:	eb000085 	bl	d54 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
     b3c:	e1a03005 	mov	r3, r5
    if(cc < 1)
     b40:	e3500000 	cmp	r0, #0
     b44:	da00000b 	ble	b78 <gets+0x60>
    buf[i++] = c;
     b48:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
     b4c:	e352000d 	cmp	r2, #13
     b50:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
     b54:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
     b58:	0a00000b 	beq	b8c <gets+0x74>
    cc = read(0, &c, 1);
     b5c:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
     b60:	e0844002 	add	r4, r4, r2
     b64:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
     b68:	e24b1015 	sub	r1, fp, #21
     b6c:	e3a00000 	mov	r0, #0
     b70:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
     b74:	baffffef 	blt	b38 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
     b78:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
     b7c:	e3a03000 	mov	r3, #0
     b80:	e5c53000 	strb	r3, [r5]
}
     b84:	e24bd014 	sub	sp, fp, #20
     b88:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     b8c:	e0875004 	add	r5, r7, r4
     b90:	eafffff8 	b	b78 <gets+0x60>

00000b94 <stat>:

int
stat(char *n, struct stat *st)
{
     b94:	e92d4830 	push	{r4, r5, fp, lr}
     b98:	e1a04001 	mov	r4, r1
     b9c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ba0:	e3a01000 	mov	r1, #0
     ba4:	eb0000ab 	bl	e58 <open>
  if(fd < 0)
     ba8:	e2505000 	subs	r5, r0, #0
     bac:	ba000006 	blt	bcc <stat+0x38>
    return -1;
  r = fstat(fd, st);
     bb0:	e1a01004 	mov	r1, r4
     bb4:	eb0000ce 	bl	ef4 <fstat>
     bb8:	e1a04000 	mov	r4, r0
  close(fd);
     bbc:	e1a00005 	mov	r0, r5
     bc0:	eb00007d 	bl	dbc <close>
  return r;
}
     bc4:	e1a00004 	mov	r0, r4
     bc8:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
     bcc:	e3e04000 	mvn	r4, #0
     bd0:	eafffffb 	b	bc4 <stat+0x30>

00000bd4 <atoi>:

int
atoi(const char *s)
{
     bd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bd8:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     bdc:	e5d02000 	ldrb	r2, [r0]
     be0:	e2423030 	sub	r3, r2, #48	; 0x30
     be4:	e3530009 	cmp	r3, #9
  n = 0;
     be8:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
     bec:	8a000006 	bhi	c0c <atoi+0x38>
    n = n*10 + *s++ - '0';
     bf0:	e3a0c00a 	mov	ip, #10
     bf4:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
     bf8:	e5f02001 	ldrb	r2, [r0, #1]!
     bfc:	e2421030 	sub	r1, r2, #48	; 0x30
     c00:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
     c04:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
     c08:	9afffff9 	bls	bf4 <atoi+0x20>
  return n;
}
     c0c:	e1a00003 	mov	r0, r3
     c10:	e28bd000 	add	sp, fp, #0
     c14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c18:	e12fff1e 	bx	lr

00000c1c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c1c:	e3520000 	cmp	r2, #0
{
     c20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c24:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
     c28:	da000005 	ble	c44 <memmove+0x28>
     c2c:	e0812002 	add	r2, r1, r2
     c30:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
     c34:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
     c38:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
     c3c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
     c40:	1afffffb 	bne	c34 <memmove+0x18>
  return vdst;
}
     c44:	e28bd000 	add	sp, fp, #0
     c48:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c4c:	e12fff1e 	bx	lr

00000c50 <fork>:
     c50:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     c54:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     c58:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     c5c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     c60:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     c64:	e3a00001 	mov	r0, #1
     c68:	ef000040 	svc	0x00000040
     c6c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     c70:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     c74:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     c78:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     c7c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     c80:	e12fff1e 	bx	lr

00000c84 <exit>:
     c84:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     c88:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     c8c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     c90:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     c94:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     c98:	e3a00002 	mov	r0, #2
     c9c:	ef000040 	svc	0x00000040
     ca0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ca4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ca8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     cac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     cb0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     cb4:	e12fff1e 	bx	lr

00000cb8 <wait>:
     cb8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     cbc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     cc0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     cc4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     cc8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ccc:	e3a00003 	mov	r0, #3
     cd0:	ef000040 	svc	0x00000040
     cd4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cd8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     cdc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ce0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ce4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ce8:	e12fff1e 	bx	lr

00000cec <lseek>:
     cec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     cf0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     cf4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     cf8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     cfc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d00:	e3a00016 	mov	r0, #22
     d04:	ef000040 	svc	0x00000040
     d08:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d0c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d10:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d14:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d18:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d1c:	e12fff1e 	bx	lr

00000d20 <pipe>:
     d20:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d24:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d28:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d2c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d30:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d34:	e3a00004 	mov	r0, #4
     d38:	ef000040 	svc	0x00000040
     d3c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d40:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d44:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d48:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d4c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d50:	e12fff1e 	bx	lr

00000d54 <read>:
     d54:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d58:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d5c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d60:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d64:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d68:	e3a00005 	mov	r0, #5
     d6c:	ef000040 	svc	0x00000040
     d70:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d74:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     d78:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     d7c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     d80:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d84:	e12fff1e 	bx	lr

00000d88 <write>:
     d88:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d8c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     d90:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     d94:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     d98:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     d9c:	e3a00010 	mov	r0, #16
     da0:	ef000040 	svc	0x00000040
     da4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     da8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     db0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     db4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     db8:	e12fff1e 	bx	lr

00000dbc <close>:
     dbc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     dc0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     dc4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     dc8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     dcc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     dd0:	e3a00015 	mov	r0, #21
     dd4:	ef000040 	svc	0x00000040
     dd8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ddc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     de0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     de4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     de8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     dec:	e12fff1e 	bx	lr

00000df0 <kill>:
     df0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     df4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     df8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     dfc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e00:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e04:	e3a00006 	mov	r0, #6
     e08:	ef000040 	svc	0x00000040
     e0c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e10:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e14:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e18:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e1c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e20:	e12fff1e 	bx	lr

00000e24 <exec>:
     e24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e28:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e2c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e30:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e34:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e38:	e3a00007 	mov	r0, #7
     e3c:	ef000040 	svc	0x00000040
     e40:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e44:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e48:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e4c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e50:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e54:	e12fff1e 	bx	lr

00000e58 <open>:
     e58:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e5c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e60:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e64:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e68:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e6c:	e3a0000f 	mov	r0, #15
     e70:	ef000040 	svc	0x00000040
     e74:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e78:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e7c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e80:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e88:	e12fff1e 	bx	lr

00000e8c <mknod>:
     e8c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e90:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e94:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e98:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e9c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ea0:	e3a00011 	mov	r0, #17
     ea4:	ef000040 	svc	0x00000040
     ea8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     eac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     eb0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     eb4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     eb8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ebc:	e12fff1e 	bx	lr

00000ec0 <unlink>:
     ec0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ec4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ec8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ecc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ed0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ed4:	e3a00012 	mov	r0, #18
     ed8:	ef000040 	svc	0x00000040
     edc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ee0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ee4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ee8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     eec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ef0:	e12fff1e 	bx	lr

00000ef4 <fstat>:
     ef4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ef8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     efc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f00:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f04:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f08:	e3a00008 	mov	r0, #8
     f0c:	ef000040 	svc	0x00000040
     f10:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f14:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f18:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f1c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f20:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f24:	e12fff1e 	bx	lr

00000f28 <link>:
     f28:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f2c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f30:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f34:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f38:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f3c:	e3a00013 	mov	r0, #19
     f40:	ef000040 	svc	0x00000040
     f44:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f48:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f4c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f50:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f54:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f58:	e12fff1e 	bx	lr

00000f5c <mkdir>:
     f5c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f60:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f64:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f68:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f6c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f70:	e3a00014 	mov	r0, #20
     f74:	ef000040 	svc	0x00000040
     f78:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f7c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f80:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f84:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f88:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f8c:	e12fff1e 	bx	lr

00000f90 <chdir>:
     f90:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f94:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f98:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f9c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fa0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fa4:	e3a00009 	mov	r0, #9
     fa8:	ef000040 	svc	0x00000040
     fac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fb0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fb4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fb8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fbc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fc0:	e12fff1e 	bx	lr

00000fc4 <dup>:
     fc4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fc8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fcc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fd0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fd4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fd8:	e3a0000a 	mov	r0, #10
     fdc:	ef000040 	svc	0x00000040
     fe0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fe4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fe8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ff0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ff4:	e12fff1e 	bx	lr

00000ff8 <getpid>:
     ff8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ffc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1000:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1004:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1008:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    100c:	e3a0000b 	mov	r0, #11
    1010:	ef000040 	svc	0x00000040
    1014:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1018:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    101c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1020:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1024:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1028:	e12fff1e 	bx	lr

0000102c <sbrk>:
    102c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1030:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1034:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1038:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    103c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1040:	e3a0000c 	mov	r0, #12
    1044:	ef000040 	svc	0x00000040
    1048:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    104c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1050:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1054:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1058:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    105c:	e12fff1e 	bx	lr

00001060 <sleep>:
    1060:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1064:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1068:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    106c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1070:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1074:	e3a0000d 	mov	r0, #13
    1078:	ef000040 	svc	0x00000040
    107c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1080:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1084:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1088:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    108c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1090:	e12fff1e 	bx	lr

00001094 <uptime>:
    1094:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1098:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    109c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10a8:	e3a0000e 	mov	r0, #14
    10ac:	ef000040 	svc	0x00000040
    10b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10c4:	e12fff1e 	bx	lr

000010c8 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    10c8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    10cc:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    10d0:	e013afa1 	ands	sl, r3, r1, lsr #31
    10d4:	e24b4034 	sub	r4, fp, #52	; 0x34
    10d8:	e30195ec 	movw	r9, #5612	; 0x15ec
    neg = 1;
    x = -xx;
    10dc:	1261e000 	rsbne	lr, r1, #0
    10e0:	e3409000 	movt	r9, #0
{
    10e4:	e1a05000 	mov	r5, r0
    neg = 1;
    10e8:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
    10ec:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
    10f0:	e3a08000 	mov	r8, #0
  b = base;
    10f4:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
    10f8:	e3a06001 	mov	r6, #1
{
    10fc:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
    1100:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
    1104:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    1108:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
    110c:	e1a0033e 	lsr	r0, lr, r3
    1110:	e2000001 	and	r0, r0, #1
    1114:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
    1118:	e1520001 	cmp	r2, r1
            r = r - d;
    111c:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
    1120:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
    1124:	e2533001 	subs	r3, r3, #1
    1128:	2afffff7 	bcs	110c <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    112c:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
    1130:	e35c0000 	cmp	ip, #0
    1134:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
    1138:	e2883001 	add	r3, r8, #1
    113c:	e7d91001 	ldrb	r1, [r9, r1]
    1140:	e4c71001 	strb	r1, [r7], #1
    1144:	11a08003 	movne	r8, r3
    1148:	1affffec 	bne	1100 <printint+0x38>
  if(neg)
    114c:	e35a0000 	cmp	sl, #0
    1150:	0a000004 	beq	1168 <printint+0xa0>
    buf[i++] = '-';
    1154:	e24b2024 	sub	r2, fp, #36	; 0x24
    1158:	e3a0102d 	mov	r1, #45	; 0x2d
    115c:	e0822003 	add	r2, r2, r3
    1160:	e2883002 	add	r3, r8, #2
    1164:	e5421010 	strb	r1, [r2, #-16]
    1168:	e0846003 	add	r6, r4, r3
    116c:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
    1170:	e3a02001 	mov	r2, #1
    1174:	e24b1035 	sub	r1, fp, #53	; 0x35
    1178:	e1a00005 	mov	r0, r5
    117c:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
    1180:	ebffff00 	bl	d88 <write>

  while(--i >= 0)
    1184:	e1540006 	cmp	r4, r6
    1188:	1afffff7 	bne	116c <printint+0xa4>
    putc(fd, buf[i]);
}
    118c:	e24bd020 	sub	sp, fp, #32
    1190:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00001194 <div>:
{
    1194:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    1198:	e3a02000 	mov	r2, #0
{
    119c:	e28db008 	add	fp, sp, #8
    11a0:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
    11a4:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    11a8:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
    11ac:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
    11b0:	e1a0c33e 	lsr	ip, lr, r3
    11b4:	e20cc001 	and	ip, ip, #1
    11b8:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    11bc:	e1520001 	cmp	r2, r1
            r = r - d;
    11c0:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
    11c4:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
    11c8:	e2533001 	subs	r3, r3, #1
    11cc:	38bd8810 	popcc	{r4, fp, pc}
    11d0:	eafffff6 	b	11b0 <div+0x1c>

000011d4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    11d4:	e92d000e 	push	{r1, r2, r3}
    11d8:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    11dc:	e28db018 	add	fp, sp, #24
    11e0:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    11e4:	e59b5004 	ldr	r5, [fp, #4]
    11e8:	e5d54000 	ldrb	r4, [r5]
    11ec:	e3540000 	cmp	r4, #0
    11f0:	0a00002b 	beq	12a4 <printf+0xd0>
    11f4:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
    11f8:	e28b8008 	add	r8, fp, #8
  state = 0;
    11fc:	e3a06000 	mov	r6, #0
    1200:	ea00000a 	b	1230 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1204:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    1208:	01a06004 	moveq	r6, r4
      if(c == '%'){
    120c:	0a000004 	beq	1224 <printf+0x50>
    1210:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    1214:	e3a02001 	mov	r2, #1
    1218:	e1a00007 	mov	r0, r7
    121c:	e5614006 	strb	r4, [r1, #-6]!
    1220:	ebfffed8 	bl	d88 <write>
  for(i = 0; fmt[i]; i++){
    1224:	e5f54001 	ldrb	r4, [r5, #1]!
    1228:	e3540000 	cmp	r4, #0
    122c:	0a00001c 	beq	12a4 <printf+0xd0>
    if(state == 0){
    1230:	e3560000 	cmp	r6, #0
    1234:	0afffff2 	beq	1204 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1238:	e3560025 	cmp	r6, #37	; 0x25
    123c:	1afffff8 	bne	1224 <printf+0x50>
      if(c == 'd'){
    1240:	e3540064 	cmp	r4, #100	; 0x64
    1244:	0a000030 	beq	130c <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1248:	e20430f7 	and	r3, r4, #247	; 0xf7
    124c:	e3530070 	cmp	r3, #112	; 0x70
    1250:	0a000017 	beq	12b4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1254:	e3540073 	cmp	r4, #115	; 0x73
    1258:	0a00001c 	beq	12d0 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    125c:	e3540063 	cmp	r4, #99	; 0x63
    1260:	0a000037 	beq	1344 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1264:	e3540025 	cmp	r4, #37	; 0x25
    1268:	0a00002e 	beq	1328 <printf+0x154>
  write(fd, &c, 1);
    126c:	e3a02001 	mov	r2, #1
    1270:	e24b1019 	sub	r1, fp, #25
    1274:	e1a00007 	mov	r0, r7
    1278:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
    127c:	ebfffec1 	bl	d88 <write>
    1280:	e3a02001 	mov	r2, #1
    1284:	e24b101a 	sub	r1, fp, #26
    1288:	e1a00007 	mov	r0, r7
    128c:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
    1290:	ebfffebc 	bl	d88 <write>
  for(i = 0; fmt[i]; i++){
    1294:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1298:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
    129c:	e3540000 	cmp	r4, #0
    12a0:	1affffe2 	bne	1230 <printf+0x5c>
    }
  }
}
    12a4:	e24bd018 	sub	sp, fp, #24
    12a8:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    12ac:	e28dd00c 	add	sp, sp, #12
    12b0:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
    12b4:	e3a03000 	mov	r3, #0
    12b8:	e3a02010 	mov	r2, #16
    12bc:	e4981004 	ldr	r1, [r8], #4
    12c0:	e1a00007 	mov	r0, r7
    12c4:	ebffff7f 	bl	10c8 <printint>
      state = 0;
    12c8:	e3a06000 	mov	r6, #0
    12cc:	eaffffd4 	b	1224 <printf+0x50>
        s = (char*)*ap;
    12d0:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
    12d4:	e3540000 	cmp	r4, #0
    12d8:	0a000021 	beq	1364 <printf+0x190>
        while(*s != 0){
    12dc:	e5d46000 	ldrb	r6, [r4]
    12e0:	e3560000 	cmp	r6, #0
    12e4:	0affffce 	beq	1224 <printf+0x50>
  write(fd, &c, 1);
    12e8:	e3a02001 	mov	r2, #1
    12ec:	e24b101d 	sub	r1, fp, #29
    12f0:	e1a00007 	mov	r0, r7
    12f4:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
    12f8:	ebfffea2 	bl	d88 <write>
        while(*s != 0){
    12fc:	e5f46001 	ldrb	r6, [r4, #1]!
    1300:	e3560000 	cmp	r6, #0
    1304:	1afffff7 	bne	12e8 <printf+0x114>
    1308:	eaffffc5 	b	1224 <printf+0x50>
        printint(fd, *ap, 10, 1);
    130c:	e3a03001 	mov	r3, #1
    1310:	e3a0200a 	mov	r2, #10
    1314:	e4981004 	ldr	r1, [r8], #4
    1318:	e1a00007 	mov	r0, r7
    131c:	ebffff69 	bl	10c8 <printint>
      state = 0;
    1320:	e3a06000 	mov	r6, #0
    1324:	eaffffbe 	b	1224 <printf+0x50>
    1328:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    132c:	e3a02001 	mov	r2, #1
    1330:	e1a00007 	mov	r0, r7
    1334:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
    1338:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
    133c:	ebfffe91 	bl	d88 <write>
    1340:	eaffffb7 	b	1224 <printf+0x50>
        putc(fd, *ap);
    1344:	e4983004 	ldr	r3, [r8], #4
    1348:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
    134c:	e3a02001 	mov	r2, #1
    1350:	e1a00007 	mov	r0, r7
      state = 0;
    1354:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
    1358:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
    135c:	ebfffe89 	bl	d88 <write>
    1360:	eaffffaf 	b	1224 <printf+0x50>
          s = "(null)";
    1364:	e3014600 	movw	r4, #5632	; 0x1600
        while(*s != 0){
    1368:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
    136c:	e3404000 	movt	r4, #0
    1370:	eaffffdc 	b	12e8 <printf+0x114>

00001374 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1374:	e301c61c 	movw	ip, #5660	; 0x161c
    1378:	e340c000 	movt	ip, #0
{
    137c:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
    1380:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1384:	e59c3000 	ldr	r3, [ip]
{
    1388:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    138c:	e1530001 	cmp	r3, r1
    1390:	e5932000 	ldr	r2, [r3]
    1394:	2a000017 	bcs	13f8 <free+0x84>
    1398:	e1510002 	cmp	r1, r2
    139c:	3a000001 	bcc	13a8 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13a0:	e1530002 	cmp	r3, r2
    13a4:	3a000017 	bcc	1408 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13a8:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    13ac:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
    13b0:	e081418e 	add	r4, r1, lr, lsl #3
    13b4:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
    13b8:	05922004 	ldreq	r2, [r2, #4]
    13bc:	0082e00e 	addeq	lr, r2, lr
    13c0:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    13c4:	05932000 	ldreq	r2, [r3]
    13c8:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
    13cc:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    13d0:	e5932004 	ldr	r2, [r3, #4]
    13d4:	e083e182 	add	lr, r3, r2, lsl #3
    13d8:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
    13dc:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
    13e0:	05101004 	ldreq	r1, [r0, #-4]
    13e4:	00812002 	addeq	r2, r1, r2
    13e8:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    13ec:	05102008 	ldreq	r2, [r0, #-8]
    13f0:	05832000 	streq	r2, [r3]
}
    13f4:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13f8:	e1530002 	cmp	r3, r2
    13fc:	3a000001 	bcc	1408 <free+0x94>
    1400:	e1510002 	cmp	r1, r2
    1404:	3affffe7 	bcc	13a8 <free+0x34>
{
    1408:	e1a03002 	mov	r3, r2
    140c:	eaffffde 	b	138c <free+0x18>

00001410 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1410:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    1414:	e301761c 	movw	r7, #5660	; 0x161c
    1418:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    141c:	e2804007 	add	r4, r0, #7
{
    1420:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
    1424:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1428:	e1a041a4 	lsr	r4, r4, #3
    142c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    1430:	e3530000 	cmp	r3, #0
    1434:	0a000027 	beq	14d8 <malloc+0xc8>
    1438:	e5930000 	ldr	r0, [r3]
    143c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1440:	e1540002 	cmp	r4, r2
    1444:	9a000019 	bls	14b0 <malloc+0xa0>
    1448:	e3540a01 	cmp	r4, #4096	; 0x1000
    144c:	21a05004 	movcs	r5, r4
    1450:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
    1454:	e1a06185 	lsl	r6, r5, #3
    1458:	ea000003 	b	146c <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    145c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    1460:	e5902004 	ldr	r2, [r0, #4]
    1464:	e1520004 	cmp	r2, r4
    1468:	2a000010 	bcs	14b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    146c:	e5972000 	ldr	r2, [r7]
    1470:	e1a03000 	mov	r3, r0
    1474:	e1520000 	cmp	r2, r0
    1478:	1afffff7 	bne	145c <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
    147c:	e1a00006 	mov	r0, r6
    1480:	ebfffee9 	bl	102c <sbrk>
    1484:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    1488:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
    148c:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
    1490:	0a000004 	beq	14a8 <malloc+0x98>
  hp->s.size = nu;
    1494:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
    1498:	ebffffb5 	bl	1374 <free>
  return freep;
    149c:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
    14a0:	e3530000 	cmp	r3, #0
    14a4:	1affffec 	bne	145c <malloc+0x4c>
        return 0;
    14a8:	e3a00000 	mov	r0, #0
  }
}
    14ac:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
    14b0:	e1540002 	cmp	r4, r2
      freep = prevp;
    14b4:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
    14b8:	10422004 	subne	r2, r2, r4
    14bc:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
    14c0:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
    14c4:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
    14c8:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
    14cc:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
    14d0:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
    14d4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
    14d8:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
    14dc:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
    14e0:	e5870000 	str	r0, [r7]
    14e4:	e5870004 	str	r0, [r7, #4]
    14e8:	eaffffd6 	b	1448 <malloc+0x38>
