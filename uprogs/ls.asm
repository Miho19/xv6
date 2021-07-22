
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d4830 	push	{r4, r5, fp, lr}
   8:	c0815100 	addgt	r5, r1, r0, lsl #2
   c:	e28db00c 	add	fp, sp, #12
  10:	c2814004 	addgt	r4, r1, #4
  if(argc < 2){
  14:	da000004 	ble	2c <main+0x2c>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  18:	e4940004 	ldr	r0, [r4], #4
  1c:	eb000030 	bl	e4 <ls>
  for(i=1; i<argc; i++)
  20:	e1540005 	cmp	r4, r5
  24:	1afffffb 	bne	18 <main+0x18>
  exit();
  28:	eb000147 	bl	54c <exit>
    ls(".");
  2c:	e3000e10 	movw	r0, #3600	; 0xe10
  30:	e3400000 	movt	r0, #0
  34:	eb00002a 	bl	e4 <ls>
    exit();
  38:	eb000143 	bl	54c <exit>

0000003c <fmtname>:
{
  3c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  40:	e28db014 	add	fp, sp, #20
  44:	e1a04000 	mov	r4, r0
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  48:	eb0000b2 	bl	318 <strlen>
  4c:	e0943000 	adds	r3, r4, r0
  50:	2a000021 	bcs	dc <fmtname+0xa0>
  54:	e7d42000 	ldrb	r2, [r4, r0]
  58:	e352002f 	cmp	r2, #47	; 0x2f
  5c:	1a000003 	bne	70 <fmtname+0x34>
  60:	ea00001d 	b	dc <fmtname+0xa0>
  64:	e5732001 	ldrb	r2, [r3, #-1]!
  68:	e352002f 	cmp	r2, #47	; 0x2f
  6c:	0a000002 	beq	7c <fmtname+0x40>
  70:	e1530004 	cmp	r3, r4
  74:	e1a05003 	mov	r5, r3
  78:	1afffff9 	bne	64 <fmtname+0x28>
  if(strlen(p) >= DIRSIZ)
  7c:	e1a00005 	mov	r0, r5
  80:	eb0000a4 	bl	318 <strlen>
  84:	e350000d 	cmp	r0, #13
  88:	8a000011 	bhi	d4 <fmtname+0x98>
  memmove(buf, p, strlen(p));
  8c:	e1a00005 	mov	r0, r5
  90:	e3004e30 	movw	r4, #3632	; 0xe30
  94:	eb00009f 	bl	318 <strlen>
  98:	e3404000 	movt	r4, #0
  9c:	e1a01005 	mov	r1, r5
  a0:	e1a02000 	mov	r2, r0
  a4:	e1a00004 	mov	r0, r4
  a8:	eb00010d 	bl	4e4 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ac:	e1a00005 	mov	r0, r5
  b0:	eb000098 	bl	318 <strlen>
  b4:	e1a06000 	mov	r6, r0
  b8:	e1a00005 	mov	r0, r5
  bc:	eb000095 	bl	318 <strlen>
  c0:	e3a01020 	mov	r1, #32
  return buf;
  c4:	e1a05004 	mov	r5, r4
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  c8:	e260200e 	rsb	r2, r0, #14
  cc:	e0840006 	add	r0, r4, r6
  d0:	eb0000a2 	bl	360 <memset>
}
  d4:	e1a00005 	mov	r0, r5
  d8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  dc:	e2835001 	add	r5, r3, #1
  e0:	eaffffe5 	b	7c <fmtname+0x40>

000000e4 <ls>:
{
  e4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  if((fd = open(path, 0)) < 0){
  e8:	e3a01000 	mov	r1, #0
{
  ec:	e28db020 	add	fp, sp, #32
  f0:	e24ddf8f 	sub	sp, sp, #572	; 0x23c
  f4:	e1a08000 	mov	r8, r0
  if((fd = open(path, 0)) < 0){
  f8:	eb000188 	bl	720 <open>
  fc:	e2506000 	subs	r6, r0, #0
 100:	ba00004f 	blt	244 <ls+0x160>
  if(fstat(fd, &st) < 0){
 104:	e24b4f8e 	sub	r4, fp, #568	; 0x238
 108:	e1a01004 	mov	r1, r4
 10c:	eb0001aa 	bl	7bc <fstat>
 110:	e3500000 	cmp	r0, #0
 114:	ba000056 	blt	274 <ls+0x190>
  switch(st.type){
 118:	e1d450f0 	ldrsh	r5, [r4]
 11c:	e3550001 	cmp	r5, #1
 120:	0a000011 	beq	16c <ls+0x88>
 124:	e3550002 	cmp	r5, #2
 128:	0a000003 	beq	13c <ls+0x58>
  close(fd);
 12c:	e1a00006 	mov	r0, r6
 130:	eb000153 	bl	684 <close>
}
 134:	e24bd020 	sub	sp, fp, #32
 138:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 13c:	e1a00008 	mov	r0, r8
 140:	ebffffbd 	bl	3c <fmtname>
 144:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 148:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 14c:	e3001dec 	movw	r1, #3564	; 0xdec
 150:	e1d430f0 	ldrsh	r3, [r4]
 154:	e3401000 	movt	r1, #0
 158:	e88d1004 	stm	sp, {r2, ip}
 15c:	e1a02000 	mov	r2, r0
 160:	e3a00001 	mov	r0, #1
 164:	eb000251 	bl	ab0 <printf>
    break;
 168:	eaffffef 	b	12c <ls+0x48>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16c:	e1a00008 	mov	r0, r8
 170:	eb000068 	bl	318 <strlen>
 174:	e2800010 	add	r0, r0, #16
 178:	e3500c02 	cmp	r0, #512	; 0x200
 17c:	8a000037 	bhi	260 <ls+0x17c>
    strcpy(buf, path);
 180:	e24b7f89 	sub	r7, fp, #548	; 0x224
        printf(1, "ls: cannot stat %s\n", buf);
 184:	e3003dd8 	movw	r3, #3544	; 0xdd8
    strcpy(buf, path);
 188:	e1a01008 	mov	r1, r8
        printf(1, "ls: cannot stat %s\n", buf);
 18c:	e1a05003 	mov	r5, r3
    strcpy(buf, path);
 190:	e1a00007 	mov	r0, r7
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 194:	e300adec 	movw	sl, #3564	; 0xdec
    strcpy(buf, path);
 198:	eb000043 	bl	2ac <strcpy>
    p = buf+strlen(buf);
 19c:	e1a00007 	mov	r0, r7
 1a0:	eb00005c 	bl	318 <strlen>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 1a4:	e340a000 	movt	sl, #0
        printf(1, "ls: cannot stat %s\n", buf);
 1a8:	e1a02005 	mov	r2, r5
 1ac:	e24b5f92 	sub	r5, fp, #584	; 0x248
    *p++ = '/';
 1b0:	e3a0302f 	mov	r3, #47	; 0x2f
        printf(1, "ls: cannot stat %s\n", buf);
 1b4:	e3402000 	movt	r2, #0
 1b8:	e50b2250 	str	r2, [fp, #-592]	; 0xfffffdb0
    p = buf+strlen(buf);
 1bc:	e0879000 	add	r9, r7, r0
    *p++ = '/';
 1c0:	e7c73000 	strb	r3, [r7, r0]
 1c4:	e2898001 	add	r8, r9, #1
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1c8:	e3a02010 	mov	r2, #16
 1cc:	e1a01005 	mov	r1, r5
 1d0:	e1a00006 	mov	r0, r6
 1d4:	eb000110 	bl	61c <read>
      memmove(p, de.name, DIRSIZ);
 1d8:	e3a0200e 	mov	r2, #14
 1dc:	e2851002 	add	r1, r5, #2
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e0:	e3500010 	cmp	r0, #16
      memmove(p, de.name, DIRSIZ);
 1e4:	e1a00008 	mov	r0, r8
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e8:	1affffcf 	bne	12c <ls+0x48>
      if(de.inum == 0)
 1ec:	e1d530b0 	ldrh	r3, [r5]
 1f0:	e3530000 	cmp	r3, #0
 1f4:	0afffff3 	beq	1c8 <ls+0xe4>
      memmove(p, de.name, DIRSIZ);
 1f8:	eb0000b9 	bl	4e4 <memmove>
      p[DIRSIZ] = 0;
 1fc:	e3a03000 	mov	r3, #0
      if(stat(buf, &st) < 0){
 200:	e1a01004 	mov	r1, r4
 204:	e1a00007 	mov	r0, r7
      p[DIRSIZ] = 0;
 208:	e5c9300f 	strb	r3, [r9, #15]
      if(stat(buf, &st) < 0){
 20c:	eb000092 	bl	45c <stat>
 210:	e3500000 	cmp	r0, #0
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 214:	e1a00007 	mov	r0, r7
      if(stat(buf, &st) < 0){
 218:	ba00001e 	blt	298 <ls+0x1b4>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 21c:	ebffff86 	bl	3c <fmtname>
 220:	e51b2230 	ldr	r2, [fp, #-560]	; 0xfffffdd0
 224:	e51bc228 	ldr	ip, [fp, #-552]	; 0xfffffdd8
 228:	e1a0100a 	mov	r1, sl
 22c:	e1d430f0 	ldrsh	r3, [r4]
 230:	e88d1004 	stm	sp, {r2, ip}
 234:	e1a02000 	mov	r2, r0
 238:	e3a00001 	mov	r0, #1
 23c:	eb00021b 	bl	ab0 <printf>
 240:	eaffffe0 	b	1c8 <ls+0xe4>
    printf(2, "ls: cannot open %s\n", path);
 244:	e1a02008 	mov	r2, r8
 248:	e3a00002 	mov	r0, #2
 24c:	e3001dc4 	movw	r1, #3524	; 0xdc4
 250:	e3401000 	movt	r1, #0
 254:	eb000215 	bl	ab0 <printf>
}
 258:	e24bd020 	sub	sp, fp, #32
 25c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
      printf(1, "ls: path too long\n");
 260:	e1a00005 	mov	r0, r5
 264:	e3001dfc 	movw	r1, #3580	; 0xdfc
 268:	e3401000 	movt	r1, #0
 26c:	eb00020f 	bl	ab0 <printf>
      break;
 270:	eaffffad 	b	12c <ls+0x48>
    printf(2, "ls: cannot stat %s\n", path);
 274:	e1a02008 	mov	r2, r8
 278:	e3a00002 	mov	r0, #2
 27c:	e3001dd8 	movw	r1, #3544	; 0xdd8
 280:	e3401000 	movt	r1, #0
 284:	eb000209 	bl	ab0 <printf>
    close(fd);
 288:	e1a00006 	mov	r0, r6
 28c:	eb0000fc 	bl	684 <close>
}
 290:	e24bd020 	sub	sp, fp, #32
 294:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
        printf(1, "ls: cannot stat %s\n", buf);
 298:	e1a02007 	mov	r2, r7
 29c:	e51b1250 	ldr	r1, [fp, #-592]	; 0xfffffdb0
 2a0:	e3a00001 	mov	r0, #1
 2a4:	eb000201 	bl	ab0 <printf>
        continue;
 2a8:	eaffffc6 	b	1c8 <ls+0xe4>

000002ac <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e2402001 	sub	r2, r0, #1
 2b4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b8:	e4d13001 	ldrb	r3, [r1], #1
 2bc:	e3530000 	cmp	r3, #0
 2c0:	e5e23001 	strb	r3, [r2, #1]!
 2c4:	1afffffb 	bne	2b8 <strcpy+0xc>
    ;
  return os;
}
 2c8:	e28bd000 	add	sp, fp, #0
 2cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d0:	e12fff1e 	bx	lr

000002d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2d8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 2dc:	e5d03000 	ldrb	r3, [r0]
 2e0:	e5d12000 	ldrb	r2, [r1]
 2e4:	e3530000 	cmp	r3, #0
 2e8:	1a000004 	bne	300 <strcmp+0x2c>
 2ec:	ea000005 	b	308 <strcmp+0x34>
 2f0:	e5f03001 	ldrb	r3, [r0, #1]!
 2f4:	e5f12001 	ldrb	r2, [r1, #1]!
 2f8:	e3530000 	cmp	r3, #0
 2fc:	0a000001 	beq	308 <strcmp+0x34>
 300:	e1530002 	cmp	r3, r2
 304:	0afffff9 	beq	2f0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 308:	e0430002 	sub	r0, r3, r2
 30c:	e28bd000 	add	sp, fp, #0
 310:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 314:	e12fff1e 	bx	lr

00000318 <strlen>:

uint
strlen(char *s)
{
 318:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 31c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 320:	e5d03000 	ldrb	r3, [r0]
 324:	e3530000 	cmp	r3, #0
 328:	0a000008 	beq	350 <strlen+0x38>
 32c:	e2601001 	rsb	r1, r0, #1
 330:	e1a03000 	mov	r3, r0
    ;
 334:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 338:	e5f32001 	ldrb	r2, [r3, #1]!
 33c:	e3520000 	cmp	r2, #0
 340:	1afffffb 	bne	334 <strlen+0x1c>
  return n;
}
 344:	e28bd000 	add	sp, fp, #0
 348:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 34c:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 350:	e1a00003 	mov	r0, r3
}
 354:	e28bd000 	add	sp, fp, #0
 358:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 35c:	e12fff1e 	bx	lr

00000360 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 360:	e3520000 	cmp	r2, #0
{
 364:	e1a03000 	mov	r3, r0
 368:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 36c:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 370:	0a000004 	beq	388 <memset+0x28>
 374:	e6ef1071 	uxtb	r1, r1
 378:	e0800002 	add	r0, r0, r2
 37c:	e4c31001 	strb	r1, [r3], #1
 380:	e1500003 	cmp	r0, r3
 384:	1afffffc 	bne	37c <memset+0x1c>
  return (void *)p;
}
 388:	e28bd000 	add	sp, fp, #0
 38c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <strchr>:

char*
strchr(const char *s, char c)
{
 394:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 398:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 39c:	e5d02000 	ldrb	r2, [r0]
 3a0:	e3520000 	cmp	r2, #0
 3a4:	0a00000b 	beq	3d8 <strchr+0x44>
    if(*s == c)
 3a8:	e1520001 	cmp	r2, r1
 3ac:	1a000002 	bne	3bc <strchr+0x28>
 3b0:	ea000005 	b	3cc <strchr+0x38>
 3b4:	e1530001 	cmp	r3, r1
 3b8:	0a000003 	beq	3cc <strchr+0x38>
  for(; *s; s++)
 3bc:	e5f03001 	ldrb	r3, [r0, #1]!
 3c0:	e3530000 	cmp	r3, #0
 3c4:	1afffffa 	bne	3b4 <strchr+0x20>
      return (char*)s;
  return 0;
 3c8:	e1a00003 	mov	r0, r3
}
 3cc:	e28bd000 	add	sp, fp, #0
 3d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d4:	e12fff1e 	bx	lr
  return 0;
 3d8:	e1a00002 	mov	r0, r2
 3dc:	eafffffa 	b	3cc <strchr+0x38>

000003e0 <gets>:

char*
gets(char *buf, int max)
{
 3e0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 3e4:	e1a03000 	mov	r3, r0
 3e8:	e28db014 	add	fp, sp, #20
 3ec:	e1a07000 	mov	r7, r0
 3f0:	e24dd008 	sub	sp, sp, #8
 3f4:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f8:	e3a04000 	mov	r4, #0
 3fc:	ea000008 	b	424 <gets+0x44>
    cc = read(0, &c, 1);
 400:	eb000085 	bl	61c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 404:	e1a03005 	mov	r3, r5
    if(cc < 1)
 408:	e3500000 	cmp	r0, #0
 40c:	da00000b 	ble	440 <gets+0x60>
    buf[i++] = c;
 410:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 414:	e352000d 	cmp	r2, #13
 418:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 41c:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 420:	0a00000b 	beq	454 <gets+0x74>
    cc = read(0, &c, 1);
 424:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 428:	e0844002 	add	r4, r4, r2
 42c:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 430:	e24b1015 	sub	r1, fp, #21
 434:	e3a00000 	mov	r0, #0
 438:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 43c:	baffffef 	blt	400 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 440:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 444:	e3a03000 	mov	r3, #0
 448:	e5c53000 	strb	r3, [r5]
}
 44c:	e24bd014 	sub	sp, fp, #20
 450:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 454:	e0875004 	add	r5, r7, r4
 458:	eafffff8 	b	440 <gets+0x60>

0000045c <stat>:

int
stat(char *n, struct stat *st)
{
 45c:	e92d4830 	push	{r4, r5, fp, lr}
 460:	e1a04001 	mov	r4, r1
 464:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 468:	e3a01000 	mov	r1, #0
 46c:	eb0000ab 	bl	720 <open>
  if(fd < 0)
 470:	e2505000 	subs	r5, r0, #0
 474:	ba000006 	blt	494 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 478:	e1a01004 	mov	r1, r4
 47c:	eb0000ce 	bl	7bc <fstat>
 480:	e1a04000 	mov	r4, r0
  close(fd);
 484:	e1a00005 	mov	r0, r5
 488:	eb00007d 	bl	684 <close>
  return r;
}
 48c:	e1a00004 	mov	r0, r4
 490:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 494:	e3e04000 	mvn	r4, #0
 498:	eafffffb 	b	48c <stat+0x30>

0000049c <atoi>:

int
atoi(const char *s)
{
 49c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4a0:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a4:	e5d02000 	ldrb	r2, [r0]
 4a8:	e2423030 	sub	r3, r2, #48	; 0x30
 4ac:	e3530009 	cmp	r3, #9
  n = 0;
 4b0:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 4b4:	8a000006 	bhi	4d4 <atoi+0x38>
    n = n*10 + *s++ - '0';
 4b8:	e3a0c00a 	mov	ip, #10
 4bc:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 4c0:	e5f02001 	ldrb	r2, [r0, #1]!
 4c4:	e2421030 	sub	r1, r2, #48	; 0x30
 4c8:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 4cc:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 4d0:	9afffff9 	bls	4bc <atoi+0x20>
  return n;
}
 4d4:	e1a00003 	mov	r0, r3
 4d8:	e28bd000 	add	sp, fp, #0
 4dc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e4:	e3520000 	cmp	r2, #0
{
 4e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4ec:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 4f0:	da000005 	ble	50c <memmove+0x28>
 4f4:	e0812002 	add	r2, r1, r2
 4f8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 4fc:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 500:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 504:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 508:	1afffffb 	bne	4fc <memmove+0x18>
  return vdst;
}
 50c:	e28bd000 	add	sp, fp, #0
 510:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <fork>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00001 	mov	r0, #1
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <exit>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00002 	mov	r0, #2
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <wait>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00003 	mov	r0, #3
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <lseek>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00016 	mov	r0, #22
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <pipe>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00004 	mov	r0, #4
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <read>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a00005 	mov	r0, #5
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <write>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a00010 	mov	r0, #16
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <close>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a00015 	mov	r0, #21
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <kill>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a00006 	mov	r0, #6
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <exec>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a00007 	mov	r0, #7
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <open>:
 720:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 724:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 728:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 72c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 730:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 734:	e3a0000f 	mov	r0, #15
 738:	ef000040 	svc	0x00000040
 73c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 740:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 744:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 748:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 74c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 750:	e12fff1e 	bx	lr

00000754 <mknod>:
 754:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 758:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 75c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 760:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 764:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 768:	e3a00011 	mov	r0, #17
 76c:	ef000040 	svc	0x00000040
 770:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 774:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 778:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 77c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 780:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 784:	e12fff1e 	bx	lr

00000788 <unlink>:
 788:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 78c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 790:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 794:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 798:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 79c:	e3a00012 	mov	r0, #18
 7a0:	ef000040 	svc	0x00000040
 7a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7b8:	e12fff1e 	bx	lr

000007bc <fstat>:
 7bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d0:	e3a00008 	mov	r0, #8
 7d4:	ef000040 	svc	0x00000040
 7d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ec:	e12fff1e 	bx	lr

000007f0 <link>:
 7f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 800:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 804:	e3a00013 	mov	r0, #19
 808:	ef000040 	svc	0x00000040
 80c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 810:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 814:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 818:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 81c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 820:	e12fff1e 	bx	lr

00000824 <mkdir>:
 824:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 828:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 82c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 830:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 834:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 838:	e3a00014 	mov	r0, #20
 83c:	ef000040 	svc	0x00000040
 840:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 844:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 848:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 84c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 850:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 854:	e12fff1e 	bx	lr

00000858 <chdir>:
 858:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 85c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 860:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 864:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 868:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 86c:	e3a00009 	mov	r0, #9
 870:	ef000040 	svc	0x00000040
 874:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 878:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 87c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 880:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 884:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 888:	e12fff1e 	bx	lr

0000088c <dup>:
 88c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 890:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 894:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 898:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 89c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8a0:	e3a0000a 	mov	r0, #10
 8a4:	ef000040 	svc	0x00000040
 8a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8bc:	e12fff1e 	bx	lr

000008c0 <getpid>:
 8c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8d4:	e3a0000b 	mov	r0, #11
 8d8:	ef000040 	svc	0x00000040
 8dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8f0:	e12fff1e 	bx	lr

000008f4 <sbrk>:
 8f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 900:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 904:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 908:	e3a0000c 	mov	r0, #12
 90c:	ef000040 	svc	0x00000040
 910:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 914:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 918:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 91c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 920:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 924:	e12fff1e 	bx	lr

00000928 <sleep>:
 928:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 92c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 930:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 934:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 938:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 93c:	e3a0000d 	mov	r0, #13
 940:	ef000040 	svc	0x00000040
 944:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 948:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 94c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 950:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 954:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 958:	e12fff1e 	bx	lr

0000095c <uptime>:
 95c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 960:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 964:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 968:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 96c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 970:	e3a0000e 	mov	r0, #14
 974:	ef000040 	svc	0x00000040
 978:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 97c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 980:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 984:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 988:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 98c:	e12fff1e 	bx	lr

00000990 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 990:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 994:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 998:	e0133fa1 	ands	r3, r3, r1, lsr #31
 99c:	e24b4034 	sub	r4, fp, #52	; 0x34
 9a0:	e3009e14 	movw	r9, #3604	; 0xe14
    neg = 1;
    x = -xx;
 9a4:	1261e000 	rsbne	lr, r1, #0
 9a8:	e3409000 	movt	r9, #0
{
 9ac:	e1a05000 	mov	r5, r0
    neg = 1;
 9b0:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 9b4:	01a0e001 	moveq	lr, r1
  neg = 0;
 9b8:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 9bc:	e3a07000 	mov	r7, #0
  b = base;
 9c0:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 9c4:	e3a06001 	mov	r6, #1
{
 9c8:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 9cc:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 9d0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 9d4:	e3a0c000 	mov	ip, #0
 9d8:	ea000002 	b	9e8 <printint+0x58>
        if(r >= d) {
 9dc:	e1520000 	cmp	r2, r0
            r = r - d;
 9e0:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 9e4:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 9e8:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 9ec:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 9f0:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 9f4:	e2011001 	and	r1, r1, #1
 9f8:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 9fc:	1afffff6 	bne	9dc <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a00:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 a04:	e35c0000 	cmp	ip, #0
 a08:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 a0c:	e2871001 	add	r1, r7, #1
 a10:	e7d93003 	ldrb	r3, [r9, r3]
 a14:	e4c83001 	strb	r3, [r8], #1
 a18:	11a07001 	movne	r7, r1
 a1c:	1affffea 	bne	9cc <printint+0x3c>
  if(neg)
 a20:	e35a0000 	cmp	sl, #0
 a24:	0a000005 	beq	a40 <printint+0xb0>
    buf[i++] = '-';
 a28:	e24b3024 	sub	r3, fp, #36	; 0x24
 a2c:	e3a0202d 	mov	r2, #45	; 0x2d
 a30:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 a34:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 a38:	e1a03002 	mov	r3, r2
 a3c:	e5402010 	strb	r2, [r0, #-16]
 a40:	e0847007 	add	r7, r4, r7
 a44:	ea000000 	b	a4c <printint+0xbc>
 a48:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 a4c:	e3a02001 	mov	r2, #1
 a50:	e24b1035 	sub	r1, fp, #53	; 0x35
 a54:	e1a00005 	mov	r0, r5
 a58:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 a5c:	ebfffefb 	bl	650 <write>

  while(--i >= 0)
 a60:	e1570004 	cmp	r7, r4
 a64:	1afffff7 	bne	a48 <printint+0xb8>
    putc(fd, buf[i]);
}
 a68:	e24bd020 	sub	sp, fp, #32
 a6c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000a70 <div>:
{
 a70:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 a74:	e3a02000 	mov	r2, #0
{
 a78:	e28db008 	add	fp, sp, #8
 a7c:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 a80:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 a84:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 a88:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 a8c:	e1a0c33e 	lsr	ip, lr, r3
 a90:	e20cc001 	and	ip, ip, #1
 a94:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 a98:	e1520001 	cmp	r2, r1
            r = r - d;
 a9c:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 aa0:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 aa4:	e2533001 	subs	r3, r3, #1
 aa8:	38bd8810 	popcc	{r4, fp, pc}
 aac:	eafffff6 	b	a8c <div+0x1c>

00000ab0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 ab0:	e92d000e 	push	{r1, r2, r3}
 ab4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 ab8:	e28db018 	add	fp, sp, #24
 abc:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ac0:	e59b6004 	ldr	r6, [fp, #4]
 ac4:	e5d64000 	ldrb	r4, [r6]
 ac8:	e3540000 	cmp	r4, #0
 acc:	0a00002b 	beq	b80 <printf+0xd0>
 ad0:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 ad4:	e28b8008 	add	r8, fp, #8
  state = 0;
 ad8:	e3a05000 	mov	r5, #0
 adc:	ea00000a 	b	b0c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 ae0:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 ae4:	01a05004 	moveq	r5, r4
      if(c == '%'){
 ae8:	0a000004 	beq	b00 <printf+0x50>
  write(fd, &c, 1);
 aec:	e3a02001 	mov	r2, #1
 af0:	e24b1019 	sub	r1, fp, #25
 af4:	e1a00007 	mov	r0, r7
 af8:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 afc:	ebfffed3 	bl	650 <write>
  for(i = 0; fmt[i]; i++){
 b00:	e5f64001 	ldrb	r4, [r6, #1]!
 b04:	e3540000 	cmp	r4, #0
 b08:	0a00001c 	beq	b80 <printf+0xd0>
    if(state == 0){
 b0c:	e3550000 	cmp	r5, #0
 b10:	0afffff2 	beq	ae0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b14:	e3550025 	cmp	r5, #37	; 0x25
 b18:	1afffff8 	bne	b00 <printf+0x50>
      if(c == 'd'){
 b1c:	e3540064 	cmp	r4, #100	; 0x64
 b20:	0a000021 	beq	bac <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b24:	e20430f7 	and	r3, r4, #247	; 0xf7
 b28:	e3530070 	cmp	r3, #112	; 0x70
 b2c:	0a000017 	beq	b90 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b30:	e3540073 	cmp	r4, #115	; 0x73
 b34:	0a00002e 	beq	bf4 <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b38:	e3540063 	cmp	r4, #99	; 0x63
 b3c:	0a000021 	beq	bc8 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b40:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 b44:	e3a02001 	mov	r2, #1
 b48:	e24b1019 	sub	r1, fp, #25
 b4c:	e1a00007 	mov	r0, r7
 b50:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 b54:	0a000023 	beq	be8 <printf+0x138>
  write(fd, &c, 1);
 b58:	ebfffebc 	bl	650 <write>
 b5c:	e3a02001 	mov	r2, #1
 b60:	e24b1019 	sub	r1, fp, #25
 b64:	e1a00007 	mov	r0, r7
 b68:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 b6c:	ebfffeb7 	bl	650 <write>
  for(i = 0; fmt[i]; i++){
 b70:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b74:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 b78:	e3540000 	cmp	r4, #0
 b7c:	1affffe2 	bne	b0c <printf+0x5c>
    }
  }
}
 b80:	e24bd018 	sub	sp, fp, #24
 b84:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 b88:	e28dd00c 	add	sp, sp, #12
 b8c:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 b90:	e3a03000 	mov	r3, #0
 b94:	e3a02010 	mov	r2, #16
 b98:	e4981004 	ldr	r1, [r8], #4
 b9c:	e1a00007 	mov	r0, r7
 ba0:	ebffff7a 	bl	990 <printint>
      state = 0;
 ba4:	e3a05000 	mov	r5, #0
 ba8:	eaffffd4 	b	b00 <printf+0x50>
        printint(fd, *ap, 10, 1);
 bac:	e3a03001 	mov	r3, #1
 bb0:	e3a0200a 	mov	r2, #10
 bb4:	e4981004 	ldr	r1, [r8], #4
 bb8:	e1a00007 	mov	r0, r7
 bbc:	ebffff73 	bl	990 <printint>
      state = 0;
 bc0:	e3a05000 	mov	r5, #0
 bc4:	eaffffcd 	b	b00 <printf+0x50>
        putc(fd, *ap);
 bc8:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 bcc:	e3a02001 	mov	r2, #1
 bd0:	e24b1019 	sub	r1, fp, #25
 bd4:	e1a00007 	mov	r0, r7
      state = 0;
 bd8:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 bdc:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 be0:	ebfffe9a 	bl	650 <write>
        ap++;
 be4:	eaffffc5 	b	b00 <printf+0x50>
  write(fd, &c, 1);
 be8:	ebfffe98 	bl	650 <write>
      state = 0;
 bec:	e3a05000 	mov	r5, #0
 bf0:	eaffffc2 	b	b00 <printf+0x50>
        s = (char*)*ap;
 bf4:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 bf8:	e3540000 	cmp	r4, #0
 bfc:	0a00000b 	beq	c30 <printf+0x180>
        while(*s != 0){
 c00:	e5d45000 	ldrb	r5, [r4]
 c04:	e3550000 	cmp	r5, #0
 c08:	0affffbc 	beq	b00 <printf+0x50>
  write(fd, &c, 1);
 c0c:	e3a02001 	mov	r2, #1
 c10:	e24b1019 	sub	r1, fp, #25
 c14:	e1a00007 	mov	r0, r7
 c18:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 c1c:	ebfffe8b 	bl	650 <write>
        while(*s != 0){
 c20:	e5f45001 	ldrb	r5, [r4, #1]!
 c24:	e3550000 	cmp	r5, #0
 c28:	1afffff7 	bne	c0c <printf+0x15c>
 c2c:	eaffffb3 	b	b00 <printf+0x50>
          s = "(null)";
 c30:	e3004e28 	movw	r4, #3624	; 0xe28
        while(*s != 0){
 c34:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 c38:	e3404000 	movt	r4, #0
 c3c:	eafffff2 	b	c0c <printf+0x15c>

00000c40 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c40:	e300ce40 	movw	ip, #3648	; 0xe40
 c44:	e340c000 	movt	ip, #0
{
 c48:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 c4c:	e2401008 	sub	r1, r0, #8
{
 c50:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c54:	e59c3000 	ldr	r3, [ip]
 c58:	ea000004 	b	c70 <free+0x30>
 c5c:	e1510002 	cmp	r1, r2
 c60:	3a000009 	bcc	c8c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c64:	e1530002 	cmp	r3, r2
 c68:	2a000007 	bcs	c8c <free+0x4c>
{
 c6c:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c70:	e1530001 	cmp	r3, r1
 c74:	e5932000 	ldr	r2, [r3]
 c78:	3afffff7 	bcc	c5c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c7c:	e1530002 	cmp	r3, r2
 c80:	3afffff9 	bcc	c6c <free+0x2c>
 c84:	e1510002 	cmp	r1, r2
 c88:	2afffff7 	bcs	c6c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c8c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 c90:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 c94:	e081418e 	add	r4, r1, lr, lsl #3
 c98:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 c9c:	05922004 	ldreq	r2, [r2, #4]
 ca0:	0082e00e 	addeq	lr, r2, lr
 ca4:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ca8:	05932000 	ldreq	r2, [r3]
 cac:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 cb0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 cb4:	e5932004 	ldr	r2, [r3, #4]
 cb8:	e083e182 	add	lr, r3, r2, lsl #3
 cbc:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 cc0:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 cc4:	05101004 	ldreq	r1, [r0, #-4]
 cc8:	00812002 	addeq	r2, r1, r2
 ccc:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 cd0:	05102008 	ldreq	r2, [r0, #-8]
 cd4:	05832000 	streq	r2, [r3]
}
 cd8:	e8bd8810 	pop	{r4, fp, pc}

00000cdc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 cdc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ce0:	e3007e40 	movw	r7, #3648	; 0xe40
 ce4:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ce8:	e2804007 	add	r4, r0, #7
{
 cec:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 cf0:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cf4:	e1a041a4 	lsr	r4, r4, #3
 cf8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 cfc:	e3510000 	cmp	r1, #0
 d00:	0a000029 	beq	dac <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d04:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 d08:	e5932004 	ldr	r2, [r3, #4]
 d0c:	e1520004 	cmp	r2, r4
 d10:	2a000019 	bcs	d7c <malloc+0xa0>
 d14:	e3540a01 	cmp	r4, #4096	; 0x1000
 d18:	21a05004 	movcs	r5, r4
 d1c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 d20:	e1a06185 	lsl	r6, r5, #3
 d24:	ea000005 	b	d40 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d28:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d2c:	e5902004 	ldr	r2, [r0, #4]
 d30:	e1520004 	cmp	r2, r4
 d34:	2a000012 	bcs	d84 <malloc+0xa8>
 d38:	e5971000 	ldr	r1, [r7]
 d3c:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d40:	e1510003 	cmp	r1, r3
 d44:	1afffff7 	bne	d28 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 d48:	e1a00006 	mov	r0, r6
 d4c:	ebfffee8 	bl	8f4 <sbrk>
 d50:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 d54:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 d58:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 d5c:	0a000004 	beq	d74 <malloc+0x98>
  hp->s.size = nu;
 d60:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 d64:	ebffffb5 	bl	c40 <free>
  return freep;
 d68:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 d6c:	e3530000 	cmp	r3, #0
 d70:	1affffec 	bne	d28 <malloc+0x4c>
        return 0;
 d74:	e3a00000 	mov	r0, #0
  }
}
 d78:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 d7c:	e1a00003 	mov	r0, r3
 d80:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 d84:	e1540002 	cmp	r4, r2
      freep = prevp;
 d88:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 d8c:	10422004 	subne	r2, r2, r4
 d90:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 d94:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 d98:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 d9c:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 da0:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 da4:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 da8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 dac:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 db0:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 db4:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 db8:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 dbc:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 dc0:	eaffffd3 	b	d14 <malloc+0x38>
