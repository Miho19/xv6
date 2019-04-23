
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
main(int argc, char *argv[])
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
{
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	e28db01c 	add	fp, sp, #28
  if(argc <= 1){
   c:	da00001f 	ble	90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
  10:	e3500002 	cmp	r0, #2
  14:	e1a08000 	mov	r8, r0
  pattern = argv[1];
  18:	e5919004 	ldr	r9, [r1, #4]
  1c:	12814008 	addne	r4, r1, #8
  if(argc <= 2){
  20:	13a05002 	movne	r5, #2
  24:	0a000015 	beq	80 <main+0x80>
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  28:	e5940000 	ldr	r0, [r4]
  2c:	e3a01000 	mov	r1, #0
  30:	eb0001ce 	bl	770 <open>
  34:	e1a07004 	mov	r7, r4
  38:	e2844004 	add	r4, r4, #4
  3c:	e2506000 	subs	r6, r0, #0
  40:	ba000008 	blt	68 <main+0x68>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  44:	e1a01006 	mov	r1, r6
  48:	e1a00009 	mov	r0, r9
  4c:	eb000083 	bl	260 <grep>
  for(i = 2; i < argc; i++){
  50:	e2855001 	add	r5, r5, #1
    close(fd);
  54:	e1a00006 	mov	r0, r6
  58:	eb00019d 	bl	6d4 <close>
  for(i = 2; i < argc; i++){
  5c:	e1580005 	cmp	r8, r5
  60:	cafffff0 	bgt	28 <main+0x28>
  }
  exit();
  64:	eb000159 	bl	5d0 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  68:	e5972000 	ldr	r2, [r7]
  6c:	e3001e38 	movw	r1, #3640	; 0xe38
  70:	e3a00001 	mov	r0, #1
  74:	e3401000 	movt	r1, #0
  78:	eb0002a0 	bl	b00 <printf>
      exit();
  7c:	eb000153 	bl	5d0 <exit>
    grep(pattern, 0);
  80:	e1a00009 	mov	r0, r9
  84:	e3a01000 	mov	r1, #0
  88:	eb000074 	bl	260 <grep>
    exit();
  8c:	eb00014f 	bl	5d0 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	e3001e18 	movw	r1, #3608	; 0xe18
  94:	e3a00002 	mov	r0, #2
  98:	e3401000 	movt	r1, #0
  9c:	eb000297 	bl	b00 <printf>
    exit();
  a0:	eb00014a 	bl	5d0 <exit>

000000a4 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  a4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  a8:	e1a05000 	mov	r5, r0
  ac:	e28db014 	add	fp, sp, #20
  b0:	e1a06001 	mov	r6, r1
  b4:	e1a04002 	mov	r4, r2
  b8:	ea000005 	b	d4 <matchstar+0x30>
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  bc:	e4d43001 	ldrb	r3, [r4], #1
  c0:	e3530000 	cmp	r3, #0
  c4:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
  c8:	e1530005 	cmp	r3, r5
  cc:	1355002e 	cmpne	r5, #46	; 0x2e
  d0:	1a000006 	bne	f0 <matchstar+0x4c>
    if(matchhere(re, text))
  d4:	e1a01004 	mov	r1, r4
  d8:	e1a00006 	mov	r0, r6
  dc:	eb000004 	bl	f4 <matchhere>
  e0:	e3500000 	cmp	r0, #0
  e4:	0afffff4 	beq	bc <matchstar+0x18>
      return 1;
  e8:	e3a00001 	mov	r0, #1
  return 0;
}
  ec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f4 <matchhere>:
  if(re[0] == '\0')
  f4:	e5d02000 	ldrb	r2, [r0]
  f8:	e3520000 	cmp	r2, #0
  fc:	0a000035 	beq	1d8 <matchhere+0xe4>
  if(re[1] == '*')
 100:	e5d03001 	ldrb	r3, [r0, #1]
 104:	e353002a 	cmp	r3, #42	; 0x2a
 108:	0a000034 	beq	1e0 <matchhere+0xec>
  if(re[0] == '$' && re[1] == '\0')
 10c:	e3520024 	cmp	r2, #36	; 0x24
 110:	03530000 	cmpeq	r3, #0
 114:	0a00002b 	beq	1c8 <matchhere+0xd4>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 118:	e5d1c000 	ldrb	ip, [r1]
 11c:	e35c0000 	cmp	ip, #0
 120:	0a000033 	beq	1f4 <matchhere+0x100>
 124:	e352002e 	cmp	r2, #46	; 0x2e
 128:	1152000c 	cmpne	r2, ip
 12c:	03a02001 	moveq	r2, #1
 130:	13a02000 	movne	r2, #0
 134:	1a000030 	bne	1fc <matchhere+0x108>
{
 138:	e92d4810 	push	{r4, fp, lr}
 13c:	e280c001 	add	ip, r0, #1
 140:	e28db008 	add	fp, sp, #8
 144:	e281e001 	add	lr, r1, #1
  if(re[0] == '\0')
 148:	e3530000 	cmp	r3, #0
    return matchhere(re+1, text+1);
 14c:	e1a0000c 	mov	r0, ip
 150:	e1a0100e 	mov	r1, lr
  if(re[0] == '\0')
 154:	0a000015 	beq	1b0 <matchhere+0xbc>
  if(re[1] == '*')
 158:	e5fc4001 	ldrb	r4, [ip, #1]!
 15c:	e354002a 	cmp	r4, #42	; 0x2a
 160:	0a00000c 	beq	198 <matchhere+0xa4>
  if(re[0] == '$' && re[1] == '\0')
 164:	e3530024 	cmp	r3, #36	; 0x24
 168:	03540000 	cmpeq	r4, #0
 16c:	0a000011 	beq	1b8 <matchhere+0xc4>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 170:	e4de0001 	ldrb	r0, [lr], #1
 174:	e3500000 	cmp	r0, #0
 178:	08bd8810 	popeq	{r4, fp, pc}
 17c:	e1500003 	cmp	r0, r3
 180:	1353002e 	cmpne	r3, #46	; 0x2e
 184:	e1a03004 	mov	r3, r4
 188:	03a00001 	moveq	r0, #1
 18c:	13a00000 	movne	r0, #0
 190:	0affffec 	beq	148 <matchhere+0x54>
 194:	e8bd8810 	pop	{r4, fp, pc}
    return matchstar(re[0], re+2, text);
 198:	e1a02001 	mov	r2, r1
 19c:	e2801002 	add	r1, r0, #2
 1a0:	e1a00003 	mov	r0, r3
}
 1a4:	e24bd008 	sub	sp, fp, #8
 1a8:	e8bd4810 	pop	{r4, fp, lr}
    return matchstar(re[0], re+2, text);
 1ac:	eaffffbc 	b	a4 <matchstar>
    return 1;
 1b0:	e3a00001 	mov	r0, #1
 1b4:	e8bd8810 	pop	{r4, fp, pc}
    return *text == '\0';
 1b8:	e5d10000 	ldrb	r0, [r1]
 1bc:	e16f0f10 	clz	r0, r0
 1c0:	e1a002a0 	lsr	r0, r0, #5
 1c4:	e8bd8810 	pop	{r4, fp, pc}
 1c8:	e5d10000 	ldrb	r0, [r1]
 1cc:	e16f0f10 	clz	r0, r0
 1d0:	e1a002a0 	lsr	r0, r0, #5
}
 1d4:	e12fff1e 	bx	lr
    return 1;
 1d8:	e3a00001 	mov	r0, #1
 1dc:	e12fff1e 	bx	lr
  if(re[1] == '*')
 1e0:	e1a03002 	mov	r3, r2
    return matchstar(re[0], re+2, text);
 1e4:	e1a02001 	mov	r2, r1
 1e8:	e2801002 	add	r1, r0, #2
 1ec:	e1a00003 	mov	r0, r3
 1f0:	eaffffab 	b	a4 <matchstar>
  return 0;
 1f4:	e1a0000c 	mov	r0, ip
 1f8:	e12fff1e 	bx	lr
 1fc:	e1a00002 	mov	r0, r2
 200:	e12fff1e 	bx	lr

00000204 <match>:
{
 204:	e92d4830 	push	{r4, r5, fp, lr}
 208:	e1a05000 	mov	r5, r0
  if(re[0] == '^')
 20c:	e5d03000 	ldrb	r3, [r0]
{
 210:	e28db00c 	add	fp, sp, #12
  if(re[0] == '^')
 214:	e353005e 	cmp	r3, #94	; 0x5e
 218:	11a04001 	movne	r4, r1
 21c:	1a000003 	bne	230 <match+0x2c>
 220:	ea00000a 	b	250 <match+0x4c>
  }while(*text++ != '\0');
 224:	e4d43001 	ldrb	r3, [r4], #1
 228:	e3530000 	cmp	r3, #0
 22c:	0a000006 	beq	24c <match+0x48>
    if(matchhere(re, text))
 230:	e1a01004 	mov	r1, r4
 234:	e1a00005 	mov	r0, r5
 238:	ebffffad 	bl	f4 <matchhere>
 23c:	e3500000 	cmp	r0, #0
 240:	0afffff7 	beq	224 <match+0x20>
      return 1;
 244:	e3a00001 	mov	r0, #1
}
 248:	e8bd8830 	pop	{r4, r5, fp, pc}
 24c:	e8bd8830 	pop	{r4, r5, fp, pc}
    return matchhere(re+1, text);
 250:	e2800001 	add	r0, r0, #1
}
 254:	e24bd00c 	sub	sp, fp, #12
 258:	e8bd4830 	pop	{r4, r5, fp, lr}
    return matchhere(re+1, text);
 25c:	eaffffa4 	b	f4 <matchhere>

00000260 <grep>:
{
 260:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 264:	e3009e78 	movw	r9, #3704	; 0xe78
 268:	e28db020 	add	fp, sp, #32
  m = 0;
 26c:	e3a07000 	mov	r7, #0
 270:	e3409000 	movt	r9, #0
{
 274:	e1a05000 	mov	r5, r0
      *q = 0;
 278:	e1a06007 	mov	r6, r7
{
 27c:	e24dd00c 	sub	sp, sp, #12
 280:	e50b1028 	str	r1, [fp, #-40]	; 0xffffffd8
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 284:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 288:	e0891007 	add	r1, r9, r7
 28c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
 290:	eb0000f5 	bl	66c <read>
 294:	e3500000 	cmp	r0, #0
 298:	da000022 	ble	328 <grep+0xc8>
    m += n;
 29c:	e0877000 	add	r7, r7, r0
    p = buf;
 2a0:	e1a04009 	mov	r4, r9
    while((q = strchr(p, '\n')) != 0){
 2a4:	e3a0800a 	mov	r8, #10
 2a8:	e3a0100a 	mov	r1, #10
 2ac:	e1a00004 	mov	r0, r4
 2b0:	eb00005b 	bl	424 <strchr>
      if(match(pattern, p)){
 2b4:	e1a01004 	mov	r1, r4
    while((q = strchr(p, '\n')) != 0){
 2b8:	e250a000 	subs	sl, r0, #0
      if(match(pattern, p)){
 2bc:	e1a00005 	mov	r0, r5
    while((q = strchr(p, '\n')) != 0){
 2c0:	0a00000c 	beq	2f8 <grep+0x98>
      *q = 0;
 2c4:	e5ca6000 	strb	r6, [sl]
      if(match(pattern, p)){
 2c8:	ebffffcd 	bl	204 <match>
 2cc:	e3500000 	cmp	r0, #0
 2d0:	028a4001 	addeq	r4, sl, #1
 2d4:	0afffff3 	beq	2a8 <grep+0x48>
        *q = '\n';
 2d8:	e1a0300a 	mov	r3, sl
        write(1, p, q+1 - p);
 2dc:	e1a01004 	mov	r1, r4
        *q = '\n';
 2e0:	e4c38001 	strb	r8, [r3], #1
        write(1, p, q+1 - p);
 2e4:	e3a00001 	mov	r0, #1
 2e8:	e0432004 	sub	r2, r3, r4
 2ec:	e1a04003 	mov	r4, r3
 2f0:	eb0000ea 	bl	6a0 <write>
 2f4:	eaffffeb 	b	2a8 <grep+0x48>
    if(p == buf)
 2f8:	e1540009 	cmp	r4, r9
      m = 0;
 2fc:	01a0700a 	moveq	r7, sl
    if(p == buf)
 300:	0affffdf 	beq	284 <grep+0x24>
    if(m > 0){
 304:	e3570000 	cmp	r7, #0
 308:	daffffdd 	ble	284 <grep+0x24>
      m -= p - buf;
 30c:	e0443009 	sub	r3, r4, r9
      memmove(buf, p, m);
 310:	e3000e78 	movw	r0, #3704	; 0xe78
      m -= p - buf;
 314:	e0477003 	sub	r7, r7, r3
      memmove(buf, p, m);
 318:	e3400000 	movt	r0, #0
 31c:	e1a02007 	mov	r2, r7
 320:	eb000090 	bl	568 <memmove>
 324:	eaffffd6 	b	284 <grep+0x24>
}
 328:	e24bd020 	sub	sp, fp, #32
 32c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000330 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 330:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 334:	e2402001 	sub	r2, r0, #1
 338:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33c:	e4d13001 	ldrb	r3, [r1], #1
 340:	e3530000 	cmp	r3, #0
 344:	e5e23001 	strb	r3, [r2, #1]!
 348:	1afffffb 	bne	33c <strcpy+0xc>
    ;
  return os;
}
 34c:	e28bd000 	add	sp, fp, #0
 350:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 354:	e12fff1e 	bx	lr

00000358 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 358:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 35c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 360:	e5d03000 	ldrb	r3, [r0]
 364:	e5d12000 	ldrb	r2, [r1]
 368:	e3530000 	cmp	r3, #0
 36c:	1a000004 	bne	384 <strcmp+0x2c>
 370:	ea000005 	b	38c <strcmp+0x34>
 374:	e5f03001 	ldrb	r3, [r0, #1]!
 378:	e3530000 	cmp	r3, #0
 37c:	0a000006 	beq	39c <strcmp+0x44>
 380:	e5f12001 	ldrb	r2, [r1, #1]!
 384:	e1530002 	cmp	r3, r2
 388:	0afffff9 	beq	374 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 38c:	e0430002 	sub	r0, r3, r2
 390:	e28bd000 	add	sp, fp, #0
 394:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 398:	e12fff1e 	bx	lr
 39c:	e5d12001 	ldrb	r2, [r1, #1]
 3a0:	e0430002 	sub	r0, r3, r2
 3a4:	e28bd000 	add	sp, fp, #0
 3a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3ac:	e12fff1e 	bx	lr

000003b0 <strlen>:

uint
strlen(char *s)
{
 3b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3b4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 3b8:	e5d03000 	ldrb	r3, [r0]
 3bc:	e3530000 	cmp	r3, #0
 3c0:	0a000009 	beq	3ec <strlen+0x3c>
 3c4:	e1a02000 	mov	r2, r0
 3c8:	e3a03000 	mov	r3, #0
 3cc:	e5f21001 	ldrb	r1, [r2, #1]!
 3d0:	e2833001 	add	r3, r3, #1
 3d4:	e3510000 	cmp	r1, #0
 3d8:	e1a00003 	mov	r0, r3
 3dc:	1afffffa 	bne	3cc <strlen+0x1c>
    ;
  return n;
}
 3e0:	e28bd000 	add	sp, fp, #0
 3e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e8:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 3ec:	e1a00003 	mov	r0, r3
 3f0:	eafffffa 	b	3e0 <strlen+0x30>

000003f4 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3f4:	e3520000 	cmp	r2, #0
{
 3f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3fc:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 400:	0a000004 	beq	418 <memset+0x24>
 404:	e6ef1071 	uxtb	r1, r1
 408:	e0802002 	add	r2, r0, r2
 40c:	e4c01001 	strb	r1, [r0], #1
 410:	e1520000 	cmp	r2, r0
 414:	1afffffc 	bne	40c <memset+0x18>
  return (void *)p;
}
 418:	e28bd000 	add	sp, fp, #0
 41c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 420:	e12fff1e 	bx	lr

00000424 <strchr>:

char*
strchr(const char *s, char c)
{
 424:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 428:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 42c:	e5d02000 	ldrb	r2, [r0]
 430:	e3520000 	cmp	r2, #0
 434:	0a00000b 	beq	468 <strchr+0x44>
    if(*s == c)
 438:	e1510002 	cmp	r1, r2
 43c:	1a000002 	bne	44c <strchr+0x28>
 440:	ea000005 	b	45c <strchr+0x38>
 444:	e1530001 	cmp	r3, r1
 448:	0a000003 	beq	45c <strchr+0x38>
  for(; *s; s++)
 44c:	e5f03001 	ldrb	r3, [r0, #1]!
 450:	e3530000 	cmp	r3, #0
 454:	1afffffa 	bne	444 <strchr+0x20>
      return (char*)s;
  return 0;
 458:	e1a00003 	mov	r0, r3
}
 45c:	e28bd000 	add	sp, fp, #0
 460:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 464:	e12fff1e 	bx	lr
  return 0;
 468:	e1a00002 	mov	r0, r2
 46c:	eafffffa 	b	45c <strchr+0x38>

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 474:	e1a08000 	mov	r8, r0
 478:	e28db018 	add	fp, sp, #24
 47c:	e1a07001 	mov	r7, r1
 480:	e24dd00c 	sub	sp, sp, #12
 484:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 488:	e3a05000 	mov	r5, #0
 48c:	ea000008 	b	4b4 <gets+0x44>
    cc = read(0, &c, 1);
 490:	eb000075 	bl	66c <read>
    if(cc < 1)
 494:	e3500000 	cmp	r0, #0
 498:	da00000b 	ble	4cc <gets+0x5c>
      break;
    buf[i++] = c;
 49c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 4a0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 4a4:	e353000d 	cmp	r3, #13
 4a8:	1353000a 	cmpne	r3, #10
    buf[i++] = c;
 4ac:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 4b0:	0a000005 	beq	4cc <gets+0x5c>
    cc = read(0, &c, 1);
 4b4:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 4b8:	e0854002 	add	r4, r5, r2
 4bc:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 4c0:	e24b101d 	sub	r1, fp, #29
 4c4:	e3a00000 	mov	r0, #0
  for(i=0; i+1 < max; ){
 4c8:	bafffff0 	blt	490 <gets+0x20>
      break;
  }
  buf[i] = '\0';
 4cc:	e3a03000 	mov	r3, #0
  return buf;
}
 4d0:	e1a00008 	mov	r0, r8
  buf[i] = '\0';
 4d4:	e7c83005 	strb	r3, [r8, r5]
}
 4d8:	e24bd018 	sub	sp, fp, #24
 4dc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000004e0 <stat>:

int
stat(char *n, struct stat *st)
{
 4e0:	e92d4830 	push	{r4, r5, fp, lr}
 4e4:	e1a04001 	mov	r4, r1
 4e8:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ec:	e3a01000 	mov	r1, #0
 4f0:	eb00009e 	bl	770 <open>
  if(fd < 0)
 4f4:	e2505000 	subs	r5, r0, #0
 4f8:	ba000006 	blt	518 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 4fc:	e1a01004 	mov	r1, r4
 500:	eb0000c1 	bl	80c <fstat>
 504:	e1a04000 	mov	r4, r0
  close(fd);
 508:	e1a00005 	mov	r0, r5
 50c:	eb000070 	bl	6d4 <close>
  return r;
}
 510:	e1a00004 	mov	r0, r4
 514:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 518:	e3e04000 	mvn	r4, #0
 51c:	eafffffb 	b	510 <stat+0x30>

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 524:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 528:	e5d02000 	ldrb	r2, [r0]
 52c:	e2423030 	sub	r3, r2, #48	; 0x30
 530:	e3530009 	cmp	r3, #9
 534:	e3a03000 	mov	r3, #0
 538:	8a000006 	bhi	558 <atoi+0x38>
    n = n*10 + *s++ - '0';
 53c:	e3a0c00a 	mov	ip, #10
 540:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 544:	e5f02001 	ldrb	r2, [r0, #1]!
 548:	e2421030 	sub	r1, r2, #48	; 0x30
 54c:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 550:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 554:	9afffff9 	bls	540 <atoi+0x20>
  return n;
}
 558:	e1a00003 	mov	r0, r3
 55c:	e28bd000 	add	sp, fp, #0
 560:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 568:	e3520000 	cmp	r2, #0
{
 56c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 570:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 574:	da000005 	ble	590 <memmove+0x28>
 578:	e0812002 	add	r2, r1, r2
 57c:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 580:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 584:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 588:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 58c:	1afffffb 	bne	580 <memmove+0x18>
  return vdst;
}
 590:	e28bd000 	add	sp, fp, #0
 594:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <fork>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00001 	mov	r0, #1
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <exit>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a00002 	mov	r0, #2
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <wait>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00003 	mov	r0, #3
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <pipe>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a00004 	mov	r0, #4
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <read>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00005 	mov	r0, #5
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <write>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a00010 	mov	r0, #16
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <close>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a00015 	mov	r0, #21
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <kill>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a00006 	mov	r0, #6
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <exec>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a00007 	mov	r0, #7
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <open>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a0000f 	mov	r0, #15
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <mknod>:
 7a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b8:	e3a00011 	mov	r0, #17
 7bc:	ef000040 	svc	0x00000040
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d4:	e12fff1e 	bx	lr

000007d8 <unlink>:
 7d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ec:	e3a00012 	mov	r0, #18
 7f0:	ef000040 	svc	0x00000040
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 800:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 804:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 808:	e12fff1e 	bx	lr

0000080c <fstat>:
 80c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 810:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 814:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 818:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 81c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 820:	e3a00008 	mov	r0, #8
 824:	ef000040 	svc	0x00000040
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 830:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 834:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 838:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 83c:	e12fff1e 	bx	lr

00000840 <link>:
 840:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 844:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 848:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 84c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 850:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 854:	e3a00013 	mov	r0, #19
 858:	ef000040 	svc	0x00000040
 85c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 860:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 864:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 868:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 86c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 870:	e12fff1e 	bx	lr

00000874 <mkdir>:
 874:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 878:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 87c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 880:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 884:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 888:	e3a00014 	mov	r0, #20
 88c:	ef000040 	svc	0x00000040
 890:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 894:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 898:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 89c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8a4:	e12fff1e 	bx	lr

000008a8 <chdir>:
 8a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8bc:	e3a00009 	mov	r0, #9
 8c0:	ef000040 	svc	0x00000040
 8c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8d8:	e12fff1e 	bx	lr

000008dc <dup>:
 8dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8f0:	e3a0000a 	mov	r0, #10
 8f4:	ef000040 	svc	0x00000040
 8f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 900:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 904:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 908:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 90c:	e12fff1e 	bx	lr

00000910 <getpid>:
 910:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 914:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 918:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 91c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 920:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 924:	e3a0000b 	mov	r0, #11
 928:	ef000040 	svc	0x00000040
 92c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 930:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 934:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 938:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 93c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 940:	e12fff1e 	bx	lr

00000944 <sbrk>:
 944:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 948:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 94c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 950:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 954:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 958:	e3a0000c 	mov	r0, #12
 95c:	ef000040 	svc	0x00000040
 960:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 964:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 968:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 96c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 970:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 974:	e12fff1e 	bx	lr

00000978 <sleep>:
 978:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 97c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 980:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 984:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 988:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 98c:	e3a0000d 	mov	r0, #13
 990:	ef000040 	svc	0x00000040
 994:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 998:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 99c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9a8:	e12fff1e 	bx	lr

000009ac <uptime>:
 9ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9c0:	e3a0000e 	mov	r0, #14
 9c4:	ef000040 	svc	0x00000040
 9c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9dc:	e12fff1e 	bx	lr

000009e0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9e0:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 9e4:	e1a09fa1 	lsr	r9, r1, #31
 9e8:	e3530000 	cmp	r3, #0
 9ec:	03a09000 	moveq	r9, #0
 9f0:	12099001 	andne	r9, r9, #1
{
 9f4:	e28db01c 	add	fp, sp, #28
  if(sgn && xx < 0){
 9f8:	e3590000 	cmp	r9, #0
 9fc:	e3008e50 	movw	r8, #3664	; 0xe50
    neg = 1;
    x = -xx;
 a00:	1261e000 	rsbne	lr, r1, #0
 a04:	e3408000 	movt	r8, #0
 a08:	e24b602d 	sub	r6, fp, #45	; 0x2d
{
 a0c:	e1a04000 	mov	r4, r0
    neg = 1;
 a10:	13a09001 	movne	r9, #1
  } else {
    x = xx;
 a14:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 a18:	e3a07000 	mov	r7, #0
            q = q | (1 << i);
 a1c:	e3a05001 	mov	r5, #1
{
 a20:	e24dd018 	sub	sp, sp, #24
    u32 q=0, r=0;
 a24:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 a28:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 a2c:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 a30:	e1a0033e 	lsr	r0, lr, r3
 a34:	e2000001 	and	r0, r0, #1
 a38:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 a3c:	e1520001 	cmp	r2, r1
            r = r - d;
 a40:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 a44:	918cc315 	orrls	ip, ip, r5, lsl r3
    for(i=31;i>=0;i--){
 a48:	e2533001 	subs	r3, r3, #1
 a4c:	2afffff7 	bcs	a30 <printint+0x50>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a50:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 a54:	e35c0000 	cmp	ip, #0
 a58:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 a5c:	e2873001 	add	r3, r7, #1
 a60:	e7d81001 	ldrb	r1, [r8, r1]
 a64:	e5e61001 	strb	r1, [r6, #1]!
 a68:	11a07003 	movne	r7, r3
 a6c:	1affffec 	bne	a24 <printint+0x44>
  if(neg)
 a70:	e3590000 	cmp	r9, #0
    buf[i++] = '-';
 a74:	124b201c 	subne	r2, fp, #28
 a78:	10822003 	addne	r2, r2, r3
 a7c:	13a0102d 	movne	r1, #45	; 0x2d
 a80:	12873002 	addne	r3, r7, #2
 a84:	15421010 	strbne	r1, [r2, #-16]
 a88:	e24b202c 	sub	r2, fp, #44	; 0x2c

  while(--i >= 0)
 a8c:	e2435001 	sub	r5, r3, #1
 a90:	e0826003 	add	r6, r2, r3
 a94:	e5763001 	ldrb	r3, [r6, #-1]!
 a98:	e2455001 	sub	r5, r5, #1
  write(fd, &c, 1);
 a9c:	e3a02001 	mov	r2, #1
 aa0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 aa4:	e1a00004 	mov	r0, r4
 aa8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 aac:	ebfffefb 	bl	6a0 <write>
  while(--i >= 0)
 ab0:	e3750001 	cmn	r5, #1
 ab4:	1afffff6 	bne	a94 <printint+0xb4>
    putc(fd, buf[i]);
}
 ab8:	e24bd01c 	sub	sp, fp, #28
 abc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000ac0 <div>:
{
 ac0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 ac4:	e3a02000 	mov	r2, #0
{
 ac8:	e28db008 	add	fp, sp, #8
 acc:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 ad0:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 ad4:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 ad8:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 adc:	e1a0c33e 	lsr	ip, lr, r3
 ae0:	e20cc001 	and	ip, ip, #1
 ae4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 ae8:	e1520001 	cmp	r2, r1
            r = r - d;
 aec:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 af0:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 af4:	e2533001 	subs	r3, r3, #1
 af8:	2afffff7 	bcs	adc <div+0x1c>
}
 afc:	e8bd8810 	pop	{r4, fp, pc}

00000b00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b00:	e92d000e 	push	{r1, r2, r3}
 b04:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 b08:	e28db018 	add	fp, sp, #24
 b0c:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b10:	e59b6004 	ldr	r6, [fp, #4]
 b14:	e5d64000 	ldrb	r4, [r6]
 b18:	e3540000 	cmp	r4, #0
 b1c:	0a00002b 	beq	bd0 <printf+0xd0>
 b20:	e1a07000 	mov	r7, r0
 b24:	e28b8008 	add	r8, fp, #8
 b28:	e3a05000 	mov	r5, #0
 b2c:	ea00000a 	b	b5c <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b30:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 b34:	01a05004 	moveq	r5, r4
      if(c == '%'){
 b38:	0a000004 	beq	b50 <printf+0x50>
 b3c:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 b40:	e3a02001 	mov	r2, #1
 b44:	e1a00007 	mov	r0, r7
 b48:	e5614006 	strb	r4, [r1, #-6]!
 b4c:	ebfffed3 	bl	6a0 <write>
  for(i = 0; fmt[i]; i++){
 b50:	e5f64001 	ldrb	r4, [r6, #1]!
 b54:	e3540000 	cmp	r4, #0
 b58:	0a00001c 	beq	bd0 <printf+0xd0>
    if(state == 0){
 b5c:	e3550000 	cmp	r5, #0
 b60:	0afffff2 	beq	b30 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b64:	e3550025 	cmp	r5, #37	; 0x25
 b68:	1afffff8 	bne	b50 <printf+0x50>
      if(c == 'd'){
 b6c:	e3540064 	cmp	r4, #100	; 0x64
 b70:	0a000037 	beq	c54 <printf+0x154>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b74:	e20430f7 	and	r3, r4, #247	; 0xf7
 b78:	e3530070 	cmp	r3, #112	; 0x70
 b7c:	0a000017 	beq	be0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b80:	e3540073 	cmp	r4, #115	; 0x73
 b84:	0a00001c 	beq	bfc <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b88:	e3540063 	cmp	r4, #99	; 0x63
 b8c:	0a000037 	beq	c70 <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b90:	e3540025 	cmp	r4, #37	; 0x25
 b94:	0a000027 	beq	c38 <printf+0x138>
  write(fd, &c, 1);
 b98:	e3a02001 	mov	r2, #1
 b9c:	e24b1019 	sub	r1, fp, #25
 ba0:	e1a00007 	mov	r0, r7
 ba4:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 ba8:	ebfffebc 	bl	6a0 <write>
 bac:	e3a02001 	mov	r2, #1
 bb0:	e24b101a 	sub	r1, fp, #26
 bb4:	e1a00007 	mov	r0, r7
 bb8:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 bbc:	ebfffeb7 	bl	6a0 <write>
  for(i = 0; fmt[i]; i++){
 bc0:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bc4:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 bc8:	e3540000 	cmp	r4, #0
 bcc:	1affffe2 	bne	b5c <printf+0x5c>
    }
  }
}
 bd0:	e24bd018 	sub	sp, fp, #24
 bd4:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 bd8:	e28dd00c 	add	sp, sp, #12
 bdc:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 be0:	e3a03000 	mov	r3, #0
 be4:	e3a02010 	mov	r2, #16
 be8:	e4981004 	ldr	r1, [r8], #4
 bec:	e1a00007 	mov	r0, r7
 bf0:	ebffff7a 	bl	9e0 <printint>
      state = 0;
 bf4:	e3a05000 	mov	r5, #0
 bf8:	eaffffd4 	b	b50 <printf+0x50>
        s = (char*)*ap;
 bfc:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 c00:	e3540000 	cmp	r4, #0
 c04:	0a000021 	beq	c90 <printf+0x190>
        while(*s != 0){
 c08:	e5d45000 	ldrb	r5, [r4]
 c0c:	e3550000 	cmp	r5, #0
 c10:	0affffce 	beq	b50 <printf+0x50>
  write(fd, &c, 1);
 c14:	e3a02001 	mov	r2, #1
 c18:	e24b101d 	sub	r1, fp, #29
 c1c:	e1a00007 	mov	r0, r7
 c20:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
 c24:	ebfffe9d 	bl	6a0 <write>
        while(*s != 0){
 c28:	e5f45001 	ldrb	r5, [r4, #1]!
 c2c:	e3550000 	cmp	r5, #0
 c30:	1afffff7 	bne	c14 <printf+0x114>
 c34:	eaffffc5 	b	b50 <printf+0x50>
 c38:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c3c:	e3a02001 	mov	r2, #1
 c40:	e1a00007 	mov	r0, r7
 c44:	e5615003 	strb	r5, [r1, #-3]!
      state = 0;
 c48:	e3a05000 	mov	r5, #0
  write(fd, &c, 1);
 c4c:	ebfffe93 	bl	6a0 <write>
 c50:	eaffffbe 	b	b50 <printf+0x50>
        printint(fd, *ap, 10, 1);
 c54:	e3a03001 	mov	r3, #1
 c58:	e3a0200a 	mov	r2, #10
 c5c:	e4981004 	ldr	r1, [r8], #4
 c60:	e1a00007 	mov	r0, r7
 c64:	ebffff5d 	bl	9e0 <printint>
      state = 0;
 c68:	e3a05000 	mov	r5, #0
 c6c:	eaffffb7 	b	b50 <printf+0x50>
        putc(fd, *ap);
 c70:	e4983004 	ldr	r3, [r8], #4
 c74:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c78:	e3a02001 	mov	r2, #1
 c7c:	e1a00007 	mov	r0, r7
      state = 0;
 c80:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 c84:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 c88:	ebfffe84 	bl	6a0 <write>
 c8c:	eaffffaf 	b	b50 <printf+0x50>
          s = "(null)";
 c90:	e3004e64 	movw	r4, #3684	; 0xe64
        while(*s != 0){
 c94:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 c98:	e3404000 	movt	r4, #0
 c9c:	eaffffdc 	b	c14 <printf+0x114>

00000ca0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ca0:	e300ce6c 	movw	ip, #3692	; 0xe6c
 ca4:	e340c000 	movt	ip, #0
{
 ca8:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 cac:	e2401008 	sub	r1, r0, #8
{
 cb0:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cb4:	e59c3000 	ldr	r3, [ip]
 cb8:	ea000004 	b	cd0 <free+0x30>
 cbc:	e1510002 	cmp	r1, r2
 cc0:	3a000009 	bcc	cec <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cc4:	e1530002 	cmp	r3, r2
 cc8:	2a000007 	bcs	cec <free+0x4c>
{
 ccc:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cd0:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cd4:	e5932000 	ldr	r2, [r3]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cd8:	3afffff7 	bcc	cbc <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cdc:	e1530002 	cmp	r3, r2
 ce0:	3afffff9 	bcc	ccc <free+0x2c>
 ce4:	e1510002 	cmp	r1, r2
 ce8:	2afffff7 	bcs	ccc <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 cec:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 cf0:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 cf4:	e081418e 	add	r4, r1, lr, lsl #3
 cf8:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 cfc:	05922004 	ldreq	r2, [r2, #4]
 d00:	0082e00e 	addeq	lr, r2, lr
 d04:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 d08:	05932000 	ldreq	r2, [r3]
 d0c:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 d10:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 d14:	e5932004 	ldr	r2, [r3, #4]
 d18:	e083e182 	add	lr, r3, r2, lsl #3
 d1c:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 d20:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 d24:	05101004 	ldreq	r1, [r0, #-4]
 d28:	00812002 	addeq	r2, r1, r2
 d2c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 d30:	05102008 	ldreq	r2, [r0, #-8]
 d34:	05832000 	streq	r2, [r3]
}
 d38:	e8bd8810 	pop	{r4, fp, pc}

00000d3c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d3c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d40:	e3007e6c 	movw	r7, #3692	; 0xe6c
 d44:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d48:	e2804007 	add	r4, r0, #7
{
 d4c:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 d50:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d54:	e1a041a4 	lsr	r4, r4, #3
 d58:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d5c:	e3530000 	cmp	r3, #0
 d60:	0a000027 	beq	e04 <malloc+0xc8>
 d64:	e5930000 	ldr	r0, [r3]
 d68:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 d6c:	e1540002 	cmp	r4, r2
 d70:	9a000019 	bls	ddc <malloc+0xa0>
 d74:	e3540a01 	cmp	r4, #4096	; 0x1000
 d78:	21a05004 	movcs	r5, r4
 d7c:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 d80:	e1a06185 	lsl	r6, r5, #3
 d84:	ea000003 	b	d98 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d88:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d8c:	e5902004 	ldr	r2, [r0, #4]
 d90:	e1540002 	cmp	r4, r2
 d94:	9a000010 	bls	ddc <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d98:	e5972000 	ldr	r2, [r7]
 d9c:	e1a03000 	mov	r3, r0
 da0:	e1520000 	cmp	r2, r0
 da4:	1afffff7 	bne	d88 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 da8:	e1a00006 	mov	r0, r6
 dac:	ebfffee4 	bl	944 <sbrk>
 db0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 db4:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 db8:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 dbc:	0a000004 	beq	dd4 <malloc+0x98>
  hp->s.size = nu;
 dc0:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 dc4:	ebffffb5 	bl	ca0 <free>
  return freep;
 dc8:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 dcc:	e3530000 	cmp	r3, #0
 dd0:	1affffec 	bne	d88 <malloc+0x4c>
        return 0;
 dd4:	e3a00000 	mov	r0, #0
  }
}
 dd8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 ddc:	e1540002 	cmp	r4, r2
      freep = prevp;
 de0:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 de4:	10422004 	subne	r2, r2, r4
 de8:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 dec:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 df0:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 df4:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 df8:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 dfc:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 e00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 e04:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 e08:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 e0c:	e5870000 	str	r0, [r7]
 e10:	e5870004 	str	r0, [r7, #4]
 e14:	eaffffd6 	b	d74 <malloc+0x38>
