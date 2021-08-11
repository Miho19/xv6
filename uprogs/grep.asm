
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
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  20:	13a05002 	movne	r5, #2
  if(argc <= 2){
  24:	0a00000f 	beq	68 <main+0x68>
    if((fd = open(argv[i], 0)) < 0){
  28:	e5940000 	ldr	r0, [r4]
  2c:	e3a01000 	mov	r1, #0
  30:	eb0001d6 	bl	790 <open>
  34:	e1a07004 	mov	r7, r4
  38:	e2844004 	add	r4, r4, #4
  3c:	e2506000 	subs	r6, r0, #0
  40:	ba00000c 	blt	78 <main+0x78>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  44:	e1a01006 	mov	r1, r6
  48:	e1a00009 	mov	r0, r9
  4c:	eb00007e 	bl	24c <grep>
  for(i = 2; i < argc; i++){
  50:	e2855001 	add	r5, r5, #1
    close(fd);
  54:	e1a00006 	mov	r0, r6
  58:	eb0001a5 	bl	6f4 <close>
  for(i = 2; i < argc; i++){
  5c:	e1580005 	cmp	r8, r5
  60:	cafffff0 	bgt	28 <main+0x28>
  }
  exit();
  64:	eb000154 	bl	5bc <exit>
    grep(pattern, 0);
  68:	e1a00009 	mov	r0, r9
  6c:	e3a01000 	mov	r1, #0
  70:	eb000075 	bl	24c <grep>
    exit();
  74:	eb000150 	bl	5bc <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  78:	e5972000 	ldr	r2, [r7]
  7c:	e3001e44 	movw	r1, #3652	; 0xe44
  80:	e3a00001 	mov	r0, #1
  84:	e3401000 	movt	r1, #0
  88:	eb00029f 	bl	b0c <printf>
      exit();
  8c:	eb00014a 	bl	5bc <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	e3001e24 	movw	r1, #3620	; 0xe24
  94:	e3a00002 	mov	r0, #2
  98:	e3401000 	movt	r1, #0
  9c:	eb00029a 	bl	b0c <printf>
    exit();
  a0:	eb000145 	bl	5bc <exit>

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
  c8:	e355002e 	cmp	r5, #46	; 0x2e
  cc:	11530005 	cmpne	r3, r5
  d0:	18bd88f0 	popne	{r4, r5, r6, r7, fp, pc}
    if(matchhere(re, text))
  d4:	e1a01004 	mov	r1, r4
  d8:	e1a00006 	mov	r0, r6
  dc:	eb000003 	bl	f0 <matchhere>
  e0:	e3500000 	cmp	r0, #0
  e4:	0afffff4 	beq	bc <matchstar+0x18>
      return 1;
  e8:	e3a00001 	mov	r0, #1
  return 0;
}
  ec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f0 <matchhere>:
  if(re[0] == '\0')
  f0:	e5d0c000 	ldrb	ip, [r0]
  f4:	e35c0000 	cmp	ip, #0
  f8:	0a000030 	beq	1c0 <matchhere+0xd0>
  if(re[1] == '*')
  fc:	e5d03001 	ldrb	r3, [r0, #1]
 100:	e353002a 	cmp	r3, #42	; 0x2a
 104:	0a00002f 	beq	1c8 <matchhere+0xd8>
  if(re[0] == '$' && re[1] == '\0')
 108:	e35c0024 	cmp	ip, #36	; 0x24
 10c:	03530000 	cmpeq	r3, #0
 110:	e5d12000 	ldrb	r2, [r1]
 114:	0a000033 	beq	1e8 <matchhere+0xf8>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 118:	e3520000 	cmp	r2, #0
 11c:	0a00002d 	beq	1d8 <matchhere+0xe8>
 120:	e35c002e 	cmp	ip, #46	; 0x2e
 124:	115c0002 	cmpne	ip, r2
 128:	03a0c001 	moveq	ip, #1
 12c:	13a0c000 	movne	ip, #0
 130:	1a00002a 	bne	1e0 <matchhere+0xf0>
{
 134:	e92d4800 	push	{fp, lr}
 138:	e280e001 	add	lr, r0, #1
 13c:	e28db004 	add	fp, sp, #4
 140:	ea00000f 	b	184 <matchhere+0x94>
  if(re[1] == '*')
 144:	e5fec001 	ldrb	ip, [lr, #1]!
 148:	e35c002a 	cmp	ip, #42	; 0x2a
 14c:	0a000012 	beq	19c <matchhere+0xac>
  if(re[0] == '$' && re[1] == '\0')
 150:	e3530024 	cmp	r3, #36	; 0x24
 154:	035c0000 	cmpeq	ip, #0
 158:	0a000014 	beq	1b0 <matchhere+0xc0>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 15c:	e5d20000 	ldrb	r0, [r2]
 160:	e1a01002 	mov	r1, r2
 164:	e3500000 	cmp	r0, #0
 168:	08bd8800 	popeq	{fp, pc}
 16c:	e1500003 	cmp	r0, r3
 170:	1353002e 	cmpne	r3, #46	; 0x2e
 174:	e1a0300c 	mov	r3, ip
 178:	03a00001 	moveq	r0, #1
 17c:	13a00000 	movne	r0, #0
 180:	18bd8800 	popne	{fp, pc}
  if(re[0] == '\0')
 184:	e3530000 	cmp	r3, #0
    return matchhere(re+1, text+1);
 188:	e1a0000e 	mov	r0, lr
 18c:	e2812001 	add	r2, r1, #1
  if(re[0] == '\0')
 190:	1affffeb 	bne	144 <matchhere+0x54>
    return 1;
 194:	e3a00001 	mov	r0, #1
}
 198:	e8bd8800 	pop	{fp, pc}
    return matchstar(re[0], re+2, text);
 19c:	e2801002 	add	r1, r0, #2
 1a0:	e1a00003 	mov	r0, r3
}
 1a4:	e24bd004 	sub	sp, fp, #4
 1a8:	e8bd4800 	pop	{fp, lr}
    return matchstar(re[0], re+2, text);
 1ac:	eaffffbc 	b	a4 <matchstar>
 1b0:	e5d12001 	ldrb	r2, [r1, #1]
    return *text == '\0';
 1b4:	e16f0f12 	clz	r0, r2
 1b8:	e1a002a0 	lsr	r0, r0, #5
 1bc:	e8bd8800 	pop	{fp, pc}
    return 1;
 1c0:	e3a00001 	mov	r0, #1
 1c4:	e12fff1e 	bx	lr
  if(re[1] == '*')
 1c8:	e1a02001 	mov	r2, r1
    return matchstar(re[0], re+2, text);
 1cc:	e2801002 	add	r1, r0, #2
 1d0:	e1a0000c 	mov	r0, ip
 1d4:	eaffffb2 	b	a4 <matchstar>
  return 0;
 1d8:	e1a00002 	mov	r0, r2
 1dc:	e12fff1e 	bx	lr
 1e0:	e1a0000c 	mov	r0, ip
 1e4:	e12fff1e 	bx	lr
    return *text == '\0';
 1e8:	e16f0f12 	clz	r0, r2
 1ec:	e1a002a0 	lsr	r0, r0, #5
}
 1f0:	e12fff1e 	bx	lr

000001f4 <match>:
{
 1f4:	e92d4830 	push	{r4, r5, fp, lr}
 1f8:	e1a05000 	mov	r5, r0
  if(re[0] == '^')
 1fc:	e5d03000 	ldrb	r3, [r0]
{
 200:	e28db00c 	add	fp, sp, #12
  if(re[0] == '^')
 204:	e353005e 	cmp	r3, #94	; 0x5e
 208:	11a04001 	movne	r4, r1
 20c:	1a000003 	bne	220 <match+0x2c>
 210:	ea000009 	b	23c <match+0x48>
  }while(*text++ != '\0');
 214:	e4d43001 	ldrb	r3, [r4], #1
 218:	e3530000 	cmp	r3, #0
 21c:	08bd8830 	popeq	{r4, r5, fp, pc}
    if(matchhere(re, text))
 220:	e1a01004 	mov	r1, r4
 224:	e1a00005 	mov	r0, r5
 228:	ebffffb0 	bl	f0 <matchhere>
 22c:	e3500000 	cmp	r0, #0
 230:	0afffff7 	beq	214 <match+0x20>
      return 1;
 234:	e3a00001 	mov	r0, #1
}
 238:	e8bd8830 	pop	{r4, r5, fp, pc}
    return matchhere(re+1, text);
 23c:	e2800001 	add	r0, r0, #1
}
 240:	e24bd00c 	sub	sp, fp, #12
 244:	e8bd4830 	pop	{r4, r5, fp, lr}
    return matchhere(re+1, text);
 248:	eaffffa8 	b	f0 <matchhere>

0000024c <grep>:
{
 24c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 250:	e3008e84 	movw	r8, #3716	; 0xe84
 254:	e28db020 	add	fp, sp, #32
  m = 0;
 258:	e3a06000 	mov	r6, #0
 25c:	e3408000 	movt	r8, #0
{
 260:	e1a05000 	mov	r5, r0
      *q = 0;
 264:	e1a07006 	mov	r7, r6
{
 268:	e24dd00c 	sub	sp, sp, #12
 26c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 270:	e2662b01 	rsb	r2, r6, #1024	; 0x400
 274:	e0881006 	add	r1, r8, r6
 278:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
 27c:	eb000102 	bl	68c <read>
 280:	e2503000 	subs	r3, r0, #0
 284:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
 288:	da000024 	ble	320 <grep+0xd4>
    p = buf;
 28c:	e3009e84 	movw	r9, #3716	; 0xe84
 290:	e3409000 	movt	r9, #0
 294:	ea000000 	b	29c <grep+0x50>
      p = q+1;
 298:	e1a09004 	mov	r9, r4
    while((q = strchr(p, '\n')) != 0){
 29c:	e3a0100a 	mov	r1, #10
 2a0:	e1a00009 	mov	r0, r9
 2a4:	eb000056 	bl	404 <strchr>
      if(match(pattern, p)){
 2a8:	e1a01009 	mov	r1, r9
    while((q = strchr(p, '\n')) != 0){
 2ac:	e250a000 	subs	sl, r0, #0
      if(match(pattern, p)){
 2b0:	e1a00005 	mov	r0, r5
      *q = 0;
 2b4:	e1a0400a 	mov	r4, sl
    while((q = strchr(p, '\n')) != 0){
 2b8:	0a00000a 	beq	2e8 <grep+0x9c>
      *q = 0;
 2bc:	e4c47001 	strb	r7, [r4], #1
      if(match(pattern, p)){
 2c0:	ebffffcb 	bl	1f4 <match>
 2c4:	e3500000 	cmp	r0, #0
 2c8:	0afffff2 	beq	298 <grep+0x4c>
        *q = '\n';
 2cc:	e3a0300a 	mov	r3, #10
        write(1, p, q+1 - p);
 2d0:	e0442009 	sub	r2, r4, r9
        *q = '\n';
 2d4:	e5ca3000 	strb	r3, [sl]
        write(1, p, q+1 - p);
 2d8:	e1a01009 	mov	r1, r9
 2dc:	e3a00001 	mov	r0, #1
 2e0:	eb0000f6 	bl	6c0 <write>
 2e4:	eaffffeb 	b	298 <grep+0x4c>
    if(p == buf)
 2e8:	e1590008 	cmp	r9, r8
      m = 0;
 2ec:	01a0600a 	moveq	r6, sl
    if(p == buf)
 2f0:	0affffde 	beq	270 <grep+0x24>
    m += n;
 2f4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 2f8:	e0866003 	add	r6, r6, r3
    if(m > 0){
 2fc:	e3560000 	cmp	r6, #0
 300:	daffffda 	ble	270 <grep+0x24>
      m -= p - buf;
 304:	e0492008 	sub	r2, r9, r8
      memmove(buf, p, m);
 308:	e3000e84 	movw	r0, #3716	; 0xe84
      m -= p - buf;
 30c:	e0466002 	sub	r6, r6, r2
      memmove(buf, p, m);
 310:	e3400000 	movt	r0, #0
 314:	e1a02006 	mov	r2, r6
 318:	eb00008d 	bl	554 <memmove>
 31c:	eaffffd3 	b	270 <grep+0x24>
}
 320:	e24bd020 	sub	sp, fp, #32
 324:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000328 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 32c:	e2402001 	sub	r2, r0, #1
 330:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 334:	e4d13001 	ldrb	r3, [r1], #1
 338:	e3530000 	cmp	r3, #0
 33c:	e5e23001 	strb	r3, [r2, #1]!
 340:	1afffffb 	bne	334 <strcpy+0xc>
    ;
  return os;
}
 344:	e28bd000 	add	sp, fp, #0
 348:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 34c:	e12fff1e 	bx	lr

00000350 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 350:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 354:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 358:	e5d03000 	ldrb	r3, [r0]
 35c:	e5d12000 	ldrb	r2, [r1]
 360:	e3530000 	cmp	r3, #0
 364:	1a000004 	bne	37c <strcmp+0x2c>
 368:	ea000005 	b	384 <strcmp+0x34>
 36c:	e5f03001 	ldrb	r3, [r0, #1]!
 370:	e5f12001 	ldrb	r2, [r1, #1]!
 374:	e3530000 	cmp	r3, #0
 378:	0a000001 	beq	384 <strcmp+0x34>
 37c:	e1530002 	cmp	r3, r2
 380:	0afffff9 	beq	36c <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 384:	e0430002 	sub	r0, r3, r2
 388:	e28bd000 	add	sp, fp, #0
 38c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 390:	e12fff1e 	bx	lr

00000394 <strlen>:

uint
strlen(char *s)
{
 394:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 398:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 39c:	e5d03000 	ldrb	r3, [r0]
 3a0:	e3530000 	cmp	r3, #0
 3a4:	01a00003 	moveq	r0, r3
 3a8:	0a000006 	beq	3c8 <strlen+0x34>
 3ac:	e1a02000 	mov	r2, r0
 3b0:	e3a03000 	mov	r3, #0
 3b4:	e5f21001 	ldrb	r1, [r2, #1]!
 3b8:	e2833001 	add	r3, r3, #1
 3bc:	e3510000 	cmp	r1, #0
 3c0:	e1a00003 	mov	r0, r3
 3c4:	1afffffa 	bne	3b4 <strlen+0x20>
    ;
  return n;
}
 3c8:	e28bd000 	add	sp, fp, #0
 3cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3d4:	e3520000 	cmp	r2, #0
{
 3d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3dc:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 3e0:	0a000004 	beq	3f8 <memset+0x24>
 3e4:	e6ef1071 	uxtb	r1, r1
 3e8:	e0802002 	add	r2, r0, r2
 3ec:	e4c01001 	strb	r1, [r0], #1
 3f0:	e1520000 	cmp	r2, r0
 3f4:	1afffffc 	bne	3ec <memset+0x18>
  return (void *)p;
}
 3f8:	e28bd000 	add	sp, fp, #0
 3fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 400:	e12fff1e 	bx	lr

00000404 <strchr>:

char*
strchr(const char *s, char c)
{
 404:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 408:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 40c:	e5d02000 	ldrb	r2, [r0]
 410:	e3520000 	cmp	r2, #0
 414:	0a00000b 	beq	448 <strchr+0x44>
    if(*s == c)
 418:	e1510002 	cmp	r1, r2
 41c:	1a000002 	bne	42c <strchr+0x28>
 420:	ea000005 	b	43c <strchr+0x38>
 424:	e1530001 	cmp	r3, r1
 428:	0a000003 	beq	43c <strchr+0x38>
  for(; *s; s++)
 42c:	e5f03001 	ldrb	r3, [r0, #1]!
 430:	e3530000 	cmp	r3, #0
 434:	1afffffa 	bne	424 <strchr+0x20>
      return (char*)s;
  return 0;
 438:	e1a00003 	mov	r0, r3
}
 43c:	e28bd000 	add	sp, fp, #0
 440:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 444:	e12fff1e 	bx	lr
  return 0;
 448:	e1a00002 	mov	r0, r2
 44c:	eafffffa 	b	43c <strchr+0x38>

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 454:	e1a03000 	mov	r3, r0
 458:	e28db014 	add	fp, sp, #20
 45c:	e1a07000 	mov	r7, r0
 460:	e24dd008 	sub	sp, sp, #8
 464:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 468:	e3a04000 	mov	r4, #0
 46c:	ea000008 	b	494 <gets+0x44>
    cc = read(0, &c, 1);
 470:	eb000085 	bl	68c <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 474:	e1a03005 	mov	r3, r5
    if(cc < 1)
 478:	e3500000 	cmp	r0, #0
 47c:	da00000b 	ble	4b0 <gets+0x60>
    buf[i++] = c;
 480:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 484:	e352000d 	cmp	r2, #13
 488:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 48c:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 490:	0a00000b 	beq	4c4 <gets+0x74>
    cc = read(0, &c, 1);
 494:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 498:	e0844002 	add	r4, r4, r2
 49c:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 4a0:	e24b1015 	sub	r1, fp, #21
 4a4:	e3a00000 	mov	r0, #0
 4a8:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 4ac:	baffffef 	blt	470 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b0:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 4b4:	e3a03000 	mov	r3, #0
 4b8:	e5c53000 	strb	r3, [r5]
}
 4bc:	e24bd014 	sub	sp, fp, #20
 4c0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 4c4:	e0875004 	add	r5, r7, r4
 4c8:	eafffff8 	b	4b0 <gets+0x60>

000004cc <stat>:

int
stat(char *n, struct stat *st)
{
 4cc:	e92d4830 	push	{r4, r5, fp, lr}
 4d0:	e1a04001 	mov	r4, r1
 4d4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d8:	e3a01000 	mov	r1, #0
 4dc:	eb0000ab 	bl	790 <open>
  if(fd < 0)
 4e0:	e2505000 	subs	r5, r0, #0
 4e4:	ba000006 	blt	504 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 4e8:	e1a01004 	mov	r1, r4
 4ec:	eb0000ce 	bl	82c <fstat>
 4f0:	e1a04000 	mov	r4, r0
  close(fd);
 4f4:	e1a00005 	mov	r0, r5
 4f8:	eb00007d 	bl	6f4 <close>
  return r;
}
 4fc:	e1a00004 	mov	r0, r4
 500:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 504:	e3e04000 	mvn	r4, #0
 508:	eafffffb 	b	4fc <stat+0x30>

0000050c <atoi>:

int
atoi(const char *s)
{
 50c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 510:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 514:	e5d02000 	ldrb	r2, [r0]
 518:	e2423030 	sub	r3, r2, #48	; 0x30
 51c:	e3530009 	cmp	r3, #9
  n = 0;
 520:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 524:	8a000006 	bhi	544 <atoi+0x38>
    n = n*10 + *s++ - '0';
 528:	e3a0c00a 	mov	ip, #10
 52c:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 530:	e5f02001 	ldrb	r2, [r0, #1]!
 534:	e2421030 	sub	r1, r2, #48	; 0x30
 538:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 53c:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 540:	9afffff9 	bls	52c <atoi+0x20>
  return n;
}
 544:	e1a00003 	mov	r0, r3
 548:	e28bd000 	add	sp, fp, #0
 54c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 550:	e12fff1e 	bx	lr

00000554 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 554:	e3520000 	cmp	r2, #0
{
 558:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 55c:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 560:	da000005 	ble	57c <memmove+0x28>
 564:	e0812002 	add	r2, r1, r2
 568:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 56c:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 570:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 574:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 578:	1afffffb 	bne	56c <memmove+0x18>
  return vdst;
}
 57c:	e28bd000 	add	sp, fp, #0
 580:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 584:	e12fff1e 	bx	lr

00000588 <fork>:
 588:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 58c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 590:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 594:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 598:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 59c:	e3a00001 	mov	r0, #1
 5a0:	ef000040 	svc	0x00000040
 5a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b8:	e12fff1e 	bx	lr

000005bc <exit>:
 5bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d0:	e3a00002 	mov	r0, #2
 5d4:	ef000040 	svc	0x00000040
 5d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5ec:	e12fff1e 	bx	lr

000005f0 <wait>:
 5f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 604:	e3a00003 	mov	r0, #3
 608:	ef000040 	svc	0x00000040
 60c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 618:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 61c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 620:	e12fff1e 	bx	lr

00000624 <lseek>:
 624:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 628:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 62c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 630:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 634:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 638:	e3a00016 	mov	r0, #22
 63c:	ef000040 	svc	0x00000040
 640:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 64c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 650:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 654:	e12fff1e 	bx	lr

00000658 <pipe>:
 658:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 65c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 660:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 664:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 668:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 66c:	e3a00004 	mov	r0, #4
 670:	ef000040 	svc	0x00000040
 674:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 680:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 684:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 688:	e12fff1e 	bx	lr

0000068c <read>:
 68c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 690:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 694:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 698:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 69c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a0:	e3a00005 	mov	r0, #5
 6a4:	ef000040 	svc	0x00000040
 6a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6bc:	e12fff1e 	bx	lr

000006c0 <write>:
 6c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d4:	e3a00010 	mov	r0, #16
 6d8:	ef000040 	svc	0x00000040
 6dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f0:	e12fff1e 	bx	lr

000006f4 <close>:
 6f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 700:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 704:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 708:	e3a00015 	mov	r0, #21
 70c:	ef000040 	svc	0x00000040
 710:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 71c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 720:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 724:	e12fff1e 	bx	lr

00000728 <kill>:
 728:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 72c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 730:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 734:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 738:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 73c:	e3a00006 	mov	r0, #6
 740:	ef000040 	svc	0x00000040
 744:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 750:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 754:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 758:	e12fff1e 	bx	lr

0000075c <exec>:
 75c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 760:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 764:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 768:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 76c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 770:	e3a00007 	mov	r0, #7
 774:	ef000040 	svc	0x00000040
 778:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 784:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 788:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 78c:	e12fff1e 	bx	lr

00000790 <open>:
 790:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 794:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 798:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 79c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a4:	e3a0000f 	mov	r0, #15
 7a8:	ef000040 	svc	0x00000040
 7ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c0:	e12fff1e 	bx	lr

000007c4 <mknod>:
 7c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7d8:	e3a00011 	mov	r0, #17
 7dc:	ef000040 	svc	0x00000040
 7e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f4:	e12fff1e 	bx	lr

000007f8 <unlink>:
 7f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 800:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 804:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 808:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 80c:	e3a00012 	mov	r0, #18
 810:	ef000040 	svc	0x00000040
 814:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 820:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 824:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 828:	e12fff1e 	bx	lr

0000082c <fstat>:
 82c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 830:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 834:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 838:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 83c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 840:	e3a00008 	mov	r0, #8
 844:	ef000040 	svc	0x00000040
 848:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 84c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 850:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 854:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 858:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 85c:	e12fff1e 	bx	lr

00000860 <link>:
 860:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 864:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 868:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 86c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 870:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 874:	e3a00013 	mov	r0, #19
 878:	ef000040 	svc	0x00000040
 87c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 880:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 884:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 888:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 88c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 890:	e12fff1e 	bx	lr

00000894 <mkdir>:
 894:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 898:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 89c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8a8:	e3a00014 	mov	r0, #20
 8ac:	ef000040 	svc	0x00000040
 8b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8c4:	e12fff1e 	bx	lr

000008c8 <chdir>:
 8c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8dc:	e3a00009 	mov	r0, #9
 8e0:	ef000040 	svc	0x00000040
 8e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8f8:	e12fff1e 	bx	lr

000008fc <dup>:
 8fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 900:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 904:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 908:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 90c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 910:	e3a0000a 	mov	r0, #10
 914:	ef000040 	svc	0x00000040
 918:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 91c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 920:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 924:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 928:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 92c:	e12fff1e 	bx	lr

00000930 <getpid>:
 930:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 934:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 938:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 93c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 940:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 944:	e3a0000b 	mov	r0, #11
 948:	ef000040 	svc	0x00000040
 94c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 950:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 954:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 958:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 95c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 960:	e12fff1e 	bx	lr

00000964 <sbrk>:
 964:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 968:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 96c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 970:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 974:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 978:	e3a0000c 	mov	r0, #12
 97c:	ef000040 	svc	0x00000040
 980:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 984:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 988:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 98c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 990:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 994:	e12fff1e 	bx	lr

00000998 <sleep>:
 998:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 99c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9ac:	e3a0000d 	mov	r0, #13
 9b0:	ef000040 	svc	0x00000040
 9b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9c8:	e12fff1e 	bx	lr

000009cc <uptime>:
 9cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9e0:	e3a0000e 	mov	r0, #14
 9e4:	ef000040 	svc	0x00000040
 9e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9fc:	e12fff1e 	bx	lr

00000a00 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a00:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 a04:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 a08:	e013afa1 	ands	sl, r3, r1, lsr #31
 a0c:	e24b4034 	sub	r4, fp, #52	; 0x34
 a10:	e3009e5c 	movw	r9, #3676	; 0xe5c
    neg = 1;
    x = -xx;
 a14:	1261e000 	rsbne	lr, r1, #0
 a18:	e3409000 	movt	r9, #0
{
 a1c:	e1a05000 	mov	r5, r0
    neg = 1;
 a20:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 a24:	01a0e001 	moveq	lr, r1
  }

  b = base;
  i = 0;
 a28:	e3a08000 	mov	r8, #0
  b = base;
 a2c:	e1a07004 	mov	r7, r4
            q = q | (1 << i);
 a30:	e3a06001 	mov	r6, #1
{
 a34:	e24dd01c 	sub	sp, sp, #28
    u32 q=0, r=0;
 a38:	e3a0c000 	mov	ip, #0
    for(i=31;i>=0;i--){
 a3c:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 a40:	e1a0100c 	mov	r1, ip
        r = r | ((n >> i) & 1);
 a44:	e1a0033e 	lsr	r0, lr, r3
 a48:	e2000001 	and	r0, r0, #1
 a4c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 a50:	e1520001 	cmp	r2, r1
            r = r - d;
 a54:	90411002 	subls	r1, r1, r2
            q = q | (1 << i);
 a58:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 a5c:	e2533001 	subs	r3, r3, #1
 a60:	2afffff7 	bcs	a44 <printint+0x44>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a64:	e061e29c 	mls	r1, ip, r2, lr
  }while((x = y) != 0);
 a68:	e35c0000 	cmp	ip, #0
 a6c:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 a70:	e2883001 	add	r3, r8, #1
 a74:	e7d91001 	ldrb	r1, [r9, r1]
 a78:	e4c71001 	strb	r1, [r7], #1
 a7c:	11a08003 	movne	r8, r3
 a80:	1affffec 	bne	a38 <printint+0x38>
  if(neg)
 a84:	e35a0000 	cmp	sl, #0
 a88:	0a000004 	beq	aa0 <printint+0xa0>
    buf[i++] = '-';
 a8c:	e24b2024 	sub	r2, fp, #36	; 0x24
 a90:	e3a0102d 	mov	r1, #45	; 0x2d
 a94:	e0822003 	add	r2, r2, r3
 a98:	e2883002 	add	r3, r8, #2
 a9c:	e5421010 	strb	r1, [r2, #-16]
 aa0:	e0846003 	add	r6, r4, r3
 aa4:	e5763001 	ldrb	r3, [r6, #-1]!
  write(fd, &c, 1);
 aa8:	e3a02001 	mov	r2, #1
 aac:	e24b1035 	sub	r1, fp, #53	; 0x35
 ab0:	e1a00005 	mov	r0, r5
 ab4:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 ab8:	ebffff00 	bl	6c0 <write>

  while(--i >= 0)
 abc:	e1540006 	cmp	r4, r6
 ac0:	1afffff7 	bne	aa4 <printint+0xa4>
    putc(fd, buf[i]);
}
 ac4:	e24bd020 	sub	sp, fp, #32
 ac8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000acc <div>:
{
 acc:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 ad0:	e3a02000 	mov	r2, #0
{
 ad4:	e28db008 	add	fp, sp, #8
 ad8:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 adc:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 ae0:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 ae4:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 ae8:	e1a0c33e 	lsr	ip, lr, r3
 aec:	e20cc001 	and	ip, ip, #1
 af0:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 af4:	e1520001 	cmp	r2, r1
            r = r - d;
 af8:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 afc:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 b00:	e2533001 	subs	r3, r3, #1
 b04:	38bd8810 	popcc	{r4, fp, pc}
 b08:	eafffff6 	b	ae8 <div+0x1c>

00000b0c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b0c:	e92d000e 	push	{r1, r2, r3}
 b10:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 b14:	e28db018 	add	fp, sp, #24
 b18:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b1c:	e59b5004 	ldr	r5, [fp, #4]
 b20:	e5d54000 	ldrb	r4, [r5]
 b24:	e3540000 	cmp	r4, #0
 b28:	0a00002b 	beq	bdc <printf+0xd0>
 b2c:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 b30:	e28b8008 	add	r8, fp, #8
  state = 0;
 b34:	e3a06000 	mov	r6, #0
 b38:	ea00000a 	b	b68 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b3c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 b40:	01a06004 	moveq	r6, r4
      if(c == '%'){
 b44:	0a000004 	beq	b5c <printf+0x50>
 b48:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 b4c:	e3a02001 	mov	r2, #1
 b50:	e1a00007 	mov	r0, r7
 b54:	e5614006 	strb	r4, [r1, #-6]!
 b58:	ebfffed8 	bl	6c0 <write>
  for(i = 0; fmt[i]; i++){
 b5c:	e5f54001 	ldrb	r4, [r5, #1]!
 b60:	e3540000 	cmp	r4, #0
 b64:	0a00001c 	beq	bdc <printf+0xd0>
    if(state == 0){
 b68:	e3560000 	cmp	r6, #0
 b6c:	0afffff2 	beq	b3c <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b70:	e3560025 	cmp	r6, #37	; 0x25
 b74:	1afffff8 	bne	b5c <printf+0x50>
      if(c == 'd'){
 b78:	e3540064 	cmp	r4, #100	; 0x64
 b7c:	0a000030 	beq	c44 <printf+0x138>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b80:	e20430f7 	and	r3, r4, #247	; 0xf7
 b84:	e3530070 	cmp	r3, #112	; 0x70
 b88:	0a000017 	beq	bec <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b8c:	e3540073 	cmp	r4, #115	; 0x73
 b90:	0a00001c 	beq	c08 <printf+0xfc>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b94:	e3540063 	cmp	r4, #99	; 0x63
 b98:	0a000037 	beq	c7c <printf+0x170>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b9c:	e3540025 	cmp	r4, #37	; 0x25
 ba0:	0a00002e 	beq	c60 <printf+0x154>
  write(fd, &c, 1);
 ba4:	e3a02001 	mov	r2, #1
 ba8:	e24b1019 	sub	r1, fp, #25
 bac:	e1a00007 	mov	r0, r7
 bb0:	e54b6019 	strb	r6, [fp, #-25]	; 0xffffffe7
 bb4:	ebfffec1 	bl	6c0 <write>
 bb8:	e3a02001 	mov	r2, #1
 bbc:	e24b101a 	sub	r1, fp, #26
 bc0:	e1a00007 	mov	r0, r7
 bc4:	e54b401a 	strb	r4, [fp, #-26]	; 0xffffffe6
 bc8:	ebfffebc 	bl	6c0 <write>
  for(i = 0; fmt[i]; i++){
 bcc:	e5f54001 	ldrb	r4, [r5, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bd0:	e3a06000 	mov	r6, #0
  for(i = 0; fmt[i]; i++){
 bd4:	e3540000 	cmp	r4, #0
 bd8:	1affffe2 	bne	b68 <printf+0x5c>
    }
  }
}
 bdc:	e24bd018 	sub	sp, fp, #24
 be0:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 be4:	e28dd00c 	add	sp, sp, #12
 be8:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 bec:	e3a03000 	mov	r3, #0
 bf0:	e3a02010 	mov	r2, #16
 bf4:	e4981004 	ldr	r1, [r8], #4
 bf8:	e1a00007 	mov	r0, r7
 bfc:	ebffff7f 	bl	a00 <printint>
      state = 0;
 c00:	e3a06000 	mov	r6, #0
 c04:	eaffffd4 	b	b5c <printf+0x50>
        s = (char*)*ap;
 c08:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 c0c:	e3540000 	cmp	r4, #0
 c10:	0a000021 	beq	c9c <printf+0x190>
        while(*s != 0){
 c14:	e5d46000 	ldrb	r6, [r4]
 c18:	e3560000 	cmp	r6, #0
 c1c:	0affffce 	beq	b5c <printf+0x50>
  write(fd, &c, 1);
 c20:	e3a02001 	mov	r2, #1
 c24:	e24b101d 	sub	r1, fp, #29
 c28:	e1a00007 	mov	r0, r7
 c2c:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
 c30:	ebfffea2 	bl	6c0 <write>
        while(*s != 0){
 c34:	e5f46001 	ldrb	r6, [r4, #1]!
 c38:	e3560000 	cmp	r6, #0
 c3c:	1afffff7 	bne	c20 <printf+0x114>
 c40:	eaffffc5 	b	b5c <printf+0x50>
        printint(fd, *ap, 10, 1);
 c44:	e3a03001 	mov	r3, #1
 c48:	e3a0200a 	mov	r2, #10
 c4c:	e4981004 	ldr	r1, [r8], #4
 c50:	e1a00007 	mov	r0, r7
 c54:	ebffff69 	bl	a00 <printint>
      state = 0;
 c58:	e3a06000 	mov	r6, #0
 c5c:	eaffffbe 	b	b5c <printf+0x50>
 c60:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c64:	e3a02001 	mov	r2, #1
 c68:	e1a00007 	mov	r0, r7
 c6c:	e5616003 	strb	r6, [r1, #-3]!
      state = 0;
 c70:	e3a06000 	mov	r6, #0
  write(fd, &c, 1);
 c74:	ebfffe91 	bl	6c0 <write>
 c78:	eaffffb7 	b	b5c <printf+0x50>
        putc(fd, *ap);
 c7c:	e4983004 	ldr	r3, [r8], #4
 c80:	e24b1018 	sub	r1, fp, #24
  write(fd, &c, 1);
 c84:	e3a02001 	mov	r2, #1
 c88:	e1a00007 	mov	r0, r7
      state = 0;
 c8c:	e3a06000 	mov	r6, #0
        putc(fd, *ap);
 c90:	e5613004 	strb	r3, [r1, #-4]!
  write(fd, &c, 1);
 c94:	ebfffe89 	bl	6c0 <write>
 c98:	eaffffaf 	b	b5c <printf+0x50>
          s = "(null)";
 c9c:	e3004e70 	movw	r4, #3696	; 0xe70
        while(*s != 0){
 ca0:	e3a06028 	mov	r6, #40	; 0x28
          s = "(null)";
 ca4:	e3404000 	movt	r4, #0
 ca8:	eaffffdc 	b	c20 <printf+0x114>

00000cac <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cac:	e300ce78 	movw	ip, #3704	; 0xe78
 cb0:	e340c000 	movt	ip, #0
{
 cb4:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 cb8:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cbc:	e59c3000 	ldr	r3, [ip]
{
 cc0:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cc4:	e1530001 	cmp	r3, r1
 cc8:	e5932000 	ldr	r2, [r3]
 ccc:	2a000017 	bcs	d30 <free+0x84>
 cd0:	e1510002 	cmp	r1, r2
 cd4:	3a000001 	bcc	ce0 <free+0x34>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cd8:	e1530002 	cmp	r3, r2
 cdc:	3a000017 	bcc	d40 <free+0x94>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ce0:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ce4:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 ce8:	e081418e 	add	r4, r1, lr, lsl #3
 cec:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 cf0:	05922004 	ldreq	r2, [r2, #4]
 cf4:	0082e00e 	addeq	lr, r2, lr
 cf8:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 cfc:	05932000 	ldreq	r2, [r3]
 d00:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 d04:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 d08:	e5932004 	ldr	r2, [r3, #4]
 d0c:	e083e182 	add	lr, r3, r2, lsl #3
 d10:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 d14:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 d18:	05101004 	ldreq	r1, [r0, #-4]
 d1c:	00812002 	addeq	r2, r1, r2
 d20:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 d24:	05102008 	ldreq	r2, [r0, #-8]
 d28:	05832000 	streq	r2, [r3]
}
 d2c:	e8bd8810 	pop	{r4, fp, pc}
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d30:	e1530002 	cmp	r3, r2
 d34:	3a000001 	bcc	d40 <free+0x94>
 d38:	e1510002 	cmp	r1, r2
 d3c:	3affffe7 	bcc	ce0 <free+0x34>
{
 d40:	e1a03002 	mov	r3, r2
 d44:	eaffffde 	b	cc4 <free+0x18>

00000d48 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d48:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d4c:	e3007e78 	movw	r7, #3704	; 0xe78
 d50:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d54:	e2804007 	add	r4, r0, #7
{
 d58:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 d5c:	e5973000 	ldr	r3, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d60:	e1a041a4 	lsr	r4, r4, #3
 d64:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d68:	e3530000 	cmp	r3, #0
 d6c:	0a000027 	beq	e10 <malloc+0xc8>
 d70:	e5930000 	ldr	r0, [r3]
 d74:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 d78:	e1540002 	cmp	r4, r2
 d7c:	9a000019 	bls	de8 <malloc+0xa0>
 d80:	e3540a01 	cmp	r4, #4096	; 0x1000
 d84:	21a05004 	movcs	r5, r4
 d88:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 d8c:	e1a06185 	lsl	r6, r5, #3
 d90:	ea000003 	b	da4 <malloc+0x5c>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d94:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d98:	e5902004 	ldr	r2, [r0, #4]
 d9c:	e1520004 	cmp	r2, r4
 da0:	2a000010 	bcs	de8 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 da4:	e5972000 	ldr	r2, [r7]
 da8:	e1a03000 	mov	r3, r0
 dac:	e1520000 	cmp	r2, r0
 db0:	1afffff7 	bne	d94 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 db4:	e1a00006 	mov	r0, r6
 db8:	ebfffee9 	bl	964 <sbrk>
 dbc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 dc0:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 dc4:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 dc8:	0a000004 	beq	de0 <malloc+0x98>
  hp->s.size = nu;
 dcc:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 dd0:	ebffffb5 	bl	cac <free>
  return freep;
 dd4:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 dd8:	e3530000 	cmp	r3, #0
 ddc:	1affffec 	bne	d94 <malloc+0x4c>
        return 0;
 de0:	e3a00000 	mov	r0, #0
  }
}
 de4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
      if(p->s.size == nunits)
 de8:	e1540002 	cmp	r4, r2
      freep = prevp;
 dec:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 df0:	10422004 	subne	r2, r2, r4
 df4:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 df8:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 dfc:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 e00:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 e04:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 e08:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 e0c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 e10:	e2870004 	add	r0, r7, #4
    base.s.size = 0;
 e14:	e5873008 	str	r3, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 e18:	e5870000 	str	r0, [r7]
 e1c:	e5870004 	str	r0, [r7, #4]
 e20:	eaffffd6 	b	d80 <malloc+0x38>
