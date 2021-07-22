
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
  if(argc <= 2){
  1c:	12814008 	addne	r4, r1, #8
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  20:	13a05002 	movne	r5, #2
  if(argc <= 2){
  24:	1a00000b 	bne	58 <main+0x58>
    grep(pattern, 0);
  28:	e1a00009 	mov	r0, r9
  2c:	e3a01000 	mov	r1, #0
  30:	eb000085 	bl	24c <grep>
    exit();
  34:	eb000166 	bl	5d4 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  38:	e1a01006 	mov	r1, r6
  3c:	e1a00009 	mov	r0, r9
  40:	eb000081 	bl	24c <grep>
  for(i = 2; i < argc; i++){
  44:	e2855001 	add	r5, r5, #1
    close(fd);
  48:	e1a00006 	mov	r0, r6
  4c:	eb0001ae 	bl	70c <close>
  for(i = 2; i < argc; i++){
  50:	e1580005 	cmp	r8, r5
  54:	da00000c 	ble	8c <main+0x8c>
    if((fd = open(argv[i], 0)) < 0){
  58:	e5940000 	ldr	r0, [r4]
  5c:	e3a01000 	mov	r1, #0
  60:	eb0001d0 	bl	7a8 <open>
  64:	e1a07004 	mov	r7, r4
  68:	e2844004 	add	r4, r4, #4
  6c:	e2506000 	subs	r6, r0, #0
  70:	aafffff0 	bge	38 <main+0x38>
      printf(1, "grep: cannot open %s\n", argv[i]);
  74:	e5972000 	ldr	r2, [r7]
  78:	e3001e6c 	movw	r1, #3692	; 0xe6c
  7c:	e3a00001 	mov	r0, #1
  80:	e3401000 	movt	r1, #0
  84:	eb0002ab 	bl	b38 <printf>
      exit();
  88:	eb000151 	bl	5d4 <exit>
  }
  exit();
  8c:	eb000150 	bl	5d4 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	e3001e4c 	movw	r1, #3660	; 0xe4c
  94:	e3a00002 	mov	r0, #2
  98:	e3401000 	movt	r1, #0
  9c:	eb0002a5 	bl	b38 <printf>
    exit();
  a0:	eb00014b 	bl	5d4 <exit>

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
 104:	0a000031 	beq	1d0 <matchhere+0xe0>
  if(re[0] == '$' && re[1] == '\0')
 108:	e35c0024 	cmp	ip, #36	; 0x24
 10c:	03530000 	cmpeq	r3, #0
 110:	e5d12000 	ldrb	r2, [r1]
 114:	0a000033 	beq	1e8 <matchhere+0xf8>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 118:	e3520000 	cmp	r2, #0
 11c:	0a000029 	beq	1c8 <matchhere+0xd8>
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
    return *text == '\0';
 1b0:	e5d12001 	ldrb	r2, [r1, #1]
 1b4:	e16f0f12 	clz	r0, r2
 1b8:	e1a002a0 	lsr	r0, r0, #5
 1bc:	e8bd8800 	pop	{fp, pc}
    return 1;
 1c0:	e3a00001 	mov	r0, #1
 1c4:	e12fff1e 	bx	lr
  return 0;
 1c8:	e1a00002 	mov	r0, r2
 1cc:	e12fff1e 	bx	lr
  if(re[1] == '*')
 1d0:	e1a02001 	mov	r2, r1
    return matchstar(re[0], re+2, text);
 1d4:	e2801002 	add	r1, r0, #2
 1d8:	e1a0000c 	mov	r0, ip
 1dc:	eaffffb0 	b	a4 <matchstar>
  return 0;
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
  m = 0;
 250:	e3a07000 	mov	r7, #0
{
 254:	e28db020 	add	fp, sp, #32
 258:	e1a05000 	mov	r5, r0
      *q = 0;
 25c:	e1a06007 	mov	r6, r7
{
 260:	e24dd014 	sub	sp, sp, #20
 264:	e3003eac 	movw	r3, #3756	; 0xeac
 268:	e3403000 	movt	r3, #0
 26c:	e50b1030 	str	r1, [fp, #-48]	; 0xffffffd0
 270:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 274:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 278:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 27c:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
 280:	e0831007 	add	r1, r3, r7
 284:	eb000106 	bl	6a4 <read>
 288:	e2503000 	subs	r3, r0, #0
 28c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
 290:	da000025 	ble	32c <grep+0xe0>
    p = buf;
 294:	e3004eac 	movw	r4, #3756	; 0xeac
    while((q = strchr(p, '\n')) != 0){
 298:	e3a0800a 	mov	r8, #10
    p = buf;
 29c:	e3404000 	movt	r4, #0
 2a0:	ea000000 	b	2a8 <grep+0x5c>
      p = q+1;
 2a4:	e1a0400a 	mov	r4, sl
    while((q = strchr(p, '\n')) != 0){
 2a8:	e3a0100a 	mov	r1, #10
 2ac:	e1a00004 	mov	r0, r4
 2b0:	eb000059 	bl	41c <strchr>
      if(match(pattern, p)){
 2b4:	e1a01004 	mov	r1, r4
    while((q = strchr(p, '\n')) != 0){
 2b8:	e2509000 	subs	r9, r0, #0
      if(match(pattern, p)){
 2bc:	e1a00005 	mov	r0, r5
      *q = 0;
 2c0:	e1a0a009 	mov	sl, r9
    while((q = strchr(p, '\n')) != 0){
 2c4:	0a000009 	beq	2f0 <grep+0xa4>
      *q = 0;
 2c8:	e4ca6001 	strb	r6, [sl], #1
      if(match(pattern, p)){
 2cc:	ebffffc8 	bl	1f4 <match>
 2d0:	e3500000 	cmp	r0, #0
 2d4:	0afffff2 	beq	2a4 <grep+0x58>
        *q = '\n';
 2d8:	e5c98000 	strb	r8, [r9]
        write(1, p, q+1 - p);
 2dc:	e04a2004 	sub	r2, sl, r4
 2e0:	e1a01004 	mov	r1, r4
 2e4:	e3a00001 	mov	r0, #1
 2e8:	eb0000fa 	bl	6d8 <write>
 2ec:	eaffffec 	b	2a4 <grep+0x58>
    if(p == buf)
 2f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
 2f4:	e1540003 	cmp	r4, r3
      m = 0;
 2f8:	01a07009 	moveq	r7, r9
    if(p == buf)
 2fc:	0affffdc 	beq	274 <grep+0x28>
    m += n;
 300:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
 304:	e0877002 	add	r7, r7, r2
    if(m > 0){
 308:	e3570000 	cmp	r7, #0
 30c:	daffffd8 	ble	274 <grep+0x28>
      m -= p - buf;
 310:	e0443003 	sub	r3, r4, r3
      memmove(buf, p, m);
 314:	e3000eac 	movw	r0, #3756	; 0xeac
      m -= p - buf;
 318:	e0477003 	sub	r7, r7, r3
      memmove(buf, p, m);
 31c:	e3400000 	movt	r0, #0
 320:	e1a02007 	mov	r2, r7
 324:	eb000090 	bl	56c <memmove>
 328:	eaffffd1 	b	274 <grep+0x28>
}
 32c:	e24bd020 	sub	sp, fp, #32
 330:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000334 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 334:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 338:	e2402001 	sub	r2, r0, #1
 33c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 340:	e4d13001 	ldrb	r3, [r1], #1
 344:	e3530000 	cmp	r3, #0
 348:	e5e23001 	strb	r3, [r2, #1]!
 34c:	1afffffb 	bne	340 <strcpy+0xc>
    ;
  return os;
}
 350:	e28bd000 	add	sp, fp, #0
 354:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 358:	e12fff1e 	bx	lr

0000035c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 35c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 360:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 364:	e5d03000 	ldrb	r3, [r0]
 368:	e5d12000 	ldrb	r2, [r1]
 36c:	e3530000 	cmp	r3, #0
 370:	1a000004 	bne	388 <strcmp+0x2c>
 374:	ea000005 	b	390 <strcmp+0x34>
 378:	e5f03001 	ldrb	r3, [r0, #1]!
 37c:	e5f12001 	ldrb	r2, [r1, #1]!
 380:	e3530000 	cmp	r3, #0
 384:	0a000001 	beq	390 <strcmp+0x34>
 388:	e1530002 	cmp	r3, r2
 38c:	0afffff9 	beq	378 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 390:	e0430002 	sub	r0, r3, r2
 394:	e28bd000 	add	sp, fp, #0
 398:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <strlen>:

uint
strlen(char *s)
{
 3a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3a4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 3a8:	e5d03000 	ldrb	r3, [r0]
 3ac:	e3530000 	cmp	r3, #0
 3b0:	0a000008 	beq	3d8 <strlen+0x38>
 3b4:	e2601001 	rsb	r1, r0, #1
 3b8:	e1a03000 	mov	r3, r0
    ;
 3bc:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
 3c0:	e5f32001 	ldrb	r2, [r3, #1]!
 3c4:	e3520000 	cmp	r2, #0
 3c8:	1afffffb 	bne	3bc <strlen+0x1c>
  return n;
}
 3cc:	e28bd000 	add	sp, fp, #0
 3d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d4:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
 3d8:	e1a00003 	mov	r0, r3
}
 3dc:	e28bd000 	add	sp, fp, #0
 3e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3e4:	e12fff1e 	bx	lr

000003e8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3e8:	e3520000 	cmp	r2, #0
{
 3ec:	e1a03000 	mov	r3, r0
 3f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3f4:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
 3f8:	0a000004 	beq	410 <memset+0x28>
 3fc:	e6ef1071 	uxtb	r1, r1
 400:	e0800002 	add	r0, r0, r2
 404:	e4c31001 	strb	r1, [r3], #1
 408:	e1500003 	cmp	r0, r3
 40c:	1afffffc 	bne	404 <memset+0x1c>
  return (void *)p;
}
 410:	e28bd000 	add	sp, fp, #0
 414:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 418:	e12fff1e 	bx	lr

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
 41c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 420:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 424:	e5d02000 	ldrb	r2, [r0]
 428:	e3520000 	cmp	r2, #0
 42c:	0a00000b 	beq	460 <strchr+0x44>
    if(*s == c)
 430:	e1520001 	cmp	r2, r1
 434:	1a000002 	bne	444 <strchr+0x28>
 438:	ea000005 	b	454 <strchr+0x38>
 43c:	e1530001 	cmp	r3, r1
 440:	0a000003 	beq	454 <strchr+0x38>
  for(; *s; s++)
 444:	e5f03001 	ldrb	r3, [r0, #1]!
 448:	e3530000 	cmp	r3, #0
 44c:	1afffffa 	bne	43c <strchr+0x20>
      return (char*)s;
  return 0;
 450:	e1a00003 	mov	r0, r3
}
 454:	e28bd000 	add	sp, fp, #0
 458:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 45c:	e12fff1e 	bx	lr
  return 0;
 460:	e1a00002 	mov	r0, r2
 464:	eafffffa 	b	454 <strchr+0x38>

00000468 <gets>:

char*
gets(char *buf, int max)
{
 468:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
 46c:	e1a03000 	mov	r3, r0
 470:	e28db014 	add	fp, sp, #20
 474:	e1a07000 	mov	r7, r0
 478:	e24dd008 	sub	sp, sp, #8
 47c:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 480:	e3a04000 	mov	r4, #0
 484:	ea000008 	b	4ac <gets+0x44>
    cc = read(0, &c, 1);
 488:	eb000085 	bl	6a4 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
 48c:	e1a03005 	mov	r3, r5
    if(cc < 1)
 490:	e3500000 	cmp	r0, #0
 494:	da00000b 	ble	4c8 <gets+0x60>
    buf[i++] = c;
 498:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
 49c:	e352000d 	cmp	r2, #13
 4a0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
 4a4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
 4a8:	0a00000b 	beq	4dc <gets+0x74>
    cc = read(0, &c, 1);
 4ac:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
 4b0:	e0844002 	add	r4, r4, r2
 4b4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
 4b8:	e24b1015 	sub	r1, fp, #21
 4bc:	e3a00000 	mov	r0, #0
 4c0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
 4c4:	baffffef 	blt	488 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4c8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
 4cc:	e3a03000 	mov	r3, #0
 4d0:	e5c53000 	strb	r3, [r5]
}
 4d4:	e24bd014 	sub	sp, fp, #20
 4d8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
 4dc:	e0875004 	add	r5, r7, r4
 4e0:	eafffff8 	b	4c8 <gets+0x60>

000004e4 <stat>:

int
stat(char *n, struct stat *st)
{
 4e4:	e92d4830 	push	{r4, r5, fp, lr}
 4e8:	e1a04001 	mov	r4, r1
 4ec:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f0:	e3a01000 	mov	r1, #0
 4f4:	eb0000ab 	bl	7a8 <open>
  if(fd < 0)
 4f8:	e2505000 	subs	r5, r0, #0
 4fc:	ba000006 	blt	51c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 500:	e1a01004 	mov	r1, r4
 504:	eb0000ce 	bl	844 <fstat>
 508:	e1a04000 	mov	r4, r0
  close(fd);
 50c:	e1a00005 	mov	r0, r5
 510:	eb00007d 	bl	70c <close>
  return r;
}
 514:	e1a00004 	mov	r0, r4
 518:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
 51c:	e3e04000 	mvn	r4, #0
 520:	eafffffb 	b	514 <stat+0x30>

00000524 <atoi>:

int
atoi(const char *s)
{
 524:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 528:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 52c:	e5d02000 	ldrb	r2, [r0]
 530:	e2423030 	sub	r3, r2, #48	; 0x30
 534:	e3530009 	cmp	r3, #9
  n = 0;
 538:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
 53c:	8a000006 	bhi	55c <atoi+0x38>
    n = n*10 + *s++ - '0';
 540:	e3a0c00a 	mov	ip, #10
 544:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
 548:	e5f02001 	ldrb	r2, [r0, #1]!
 54c:	e2421030 	sub	r1, r2, #48	; 0x30
 550:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
 554:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
 558:	9afffff9 	bls	544 <atoi+0x20>
  return n;
}
 55c:	e1a00003 	mov	r0, r3
 560:	e28bd000 	add	sp, fp, #0
 564:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 568:	e12fff1e 	bx	lr

0000056c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56c:	e3520000 	cmp	r2, #0
{
 570:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 574:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
 578:	da000005 	ble	594 <memmove+0x28>
 57c:	e0812002 	add	r2, r1, r2
 580:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 584:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
 588:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 58c:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
 590:	1afffffb 	bne	584 <memmove+0x18>
  return vdst;
}
 594:	e28bd000 	add	sp, fp, #0
 598:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 59c:	e12fff1e 	bx	lr

000005a0 <fork>:
 5a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b4:	e3a00001 	mov	r0, #1
 5b8:	ef000040 	svc	0x00000040
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d0:	e12fff1e 	bx	lr

000005d4 <exit>:
 5d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e8:	e3a00002 	mov	r0, #2
 5ec:	ef000040 	svc	0x00000040
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 600:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 604:	e12fff1e 	bx	lr

00000608 <wait>:
 608:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 60c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 610:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 614:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 618:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 61c:	e3a00003 	mov	r0, #3
 620:	ef000040 	svc	0x00000040
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 62c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 630:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 634:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 638:	e12fff1e 	bx	lr

0000063c <lseek>:
 63c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 640:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 644:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 648:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 64c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 650:	e3a00016 	mov	r0, #22
 654:	ef000040 	svc	0x00000040
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 660:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 664:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 668:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 66c:	e12fff1e 	bx	lr

00000670 <pipe>:
 670:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 674:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 678:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 67c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 680:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 684:	e3a00004 	mov	r0, #4
 688:	ef000040 	svc	0x00000040
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 694:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 698:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 69c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a0:	e12fff1e 	bx	lr

000006a4 <read>:
 6a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b8:	e3a00005 	mov	r0, #5
 6bc:	ef000040 	svc	0x00000040
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d4:	e12fff1e 	bx	lr

000006d8 <write>:
 6d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ec:	e3a00010 	mov	r0, #16
 6f0:	ef000040 	svc	0x00000040
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 700:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 704:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 708:	e12fff1e 	bx	lr

0000070c <close>:
 70c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 710:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 714:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 718:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 71c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 720:	e3a00015 	mov	r0, #21
 724:	ef000040 	svc	0x00000040
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 730:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 734:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 738:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 73c:	e12fff1e 	bx	lr

00000740 <kill>:
 740:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 744:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 748:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 74c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 750:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 754:	e3a00006 	mov	r0, #6
 758:	ef000040 	svc	0x00000040
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 764:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 768:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 76c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 770:	e12fff1e 	bx	lr

00000774 <exec>:
 774:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 778:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 77c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 780:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 784:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 788:	e3a00007 	mov	r0, #7
 78c:	ef000040 	svc	0x00000040
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 798:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 79c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a4:	e12fff1e 	bx	lr

000007a8 <open>:
 7a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7bc:	e3a0000f 	mov	r0, #15
 7c0:	ef000040 	svc	0x00000040
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d8:	e12fff1e 	bx	lr

000007dc <mknod>:
 7dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7f0:	e3a00011 	mov	r0, #17
 7f4:	ef000040 	svc	0x00000040
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 800:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 804:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 808:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 80c:	e12fff1e 	bx	lr

00000810 <unlink>:
 810:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 814:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 818:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 81c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 820:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 824:	e3a00012 	mov	r0, #18
 828:	ef000040 	svc	0x00000040
 82c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 830:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 834:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 838:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 83c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 840:	e12fff1e 	bx	lr

00000844 <fstat>:
 844:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 848:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 84c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 850:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 854:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 858:	e3a00008 	mov	r0, #8
 85c:	ef000040 	svc	0x00000040
 860:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 864:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 868:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 86c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 870:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 874:	e12fff1e 	bx	lr

00000878 <link>:
 878:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 87c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 880:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 884:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 888:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 88c:	e3a00013 	mov	r0, #19
 890:	ef000040 	svc	0x00000040
 894:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 898:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 89c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8a8:	e12fff1e 	bx	lr

000008ac <mkdir>:
 8ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8c0:	e3a00014 	mov	r0, #20
 8c4:	ef000040 	svc	0x00000040
 8c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8dc:	e12fff1e 	bx	lr

000008e0 <chdir>:
 8e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8f4:	e3a00009 	mov	r0, #9
 8f8:	ef000040 	svc	0x00000040
 8fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 900:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 904:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 908:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 90c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 910:	e12fff1e 	bx	lr

00000914 <dup>:
 914:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 918:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 91c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 920:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 924:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 928:	e3a0000a 	mov	r0, #10
 92c:	ef000040 	svc	0x00000040
 930:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 934:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 938:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 93c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 940:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 944:	e12fff1e 	bx	lr

00000948 <getpid>:
 948:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 94c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 950:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 954:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 958:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 95c:	e3a0000b 	mov	r0, #11
 960:	ef000040 	svc	0x00000040
 964:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 968:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 96c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 970:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 974:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 978:	e12fff1e 	bx	lr

0000097c <sbrk>:
 97c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 980:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 984:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 988:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 98c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 990:	e3a0000c 	mov	r0, #12
 994:	ef000040 	svc	0x00000040
 998:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 99c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9ac:	e12fff1e 	bx	lr

000009b0 <sleep>:
 9b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9c4:	e3a0000d 	mov	r0, #13
 9c8:	ef000040 	svc	0x00000040
 9cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9e0:	e12fff1e 	bx	lr

000009e4 <uptime>:
 9e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9f8:	e3a0000e 	mov	r0, #14
 9fc:	ef000040 	svc	0x00000040
 a00:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 a04:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 a08:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 a0c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 a10:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 a14:	e12fff1e 	bx	lr

00000a18 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a18:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 a1c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 a20:	e0133fa1 	ands	r3, r3, r1, lsr #31
 a24:	e24b4034 	sub	r4, fp, #52	; 0x34
 a28:	e3009e84 	movw	r9, #3716	; 0xe84
    neg = 1;
    x = -xx;
 a2c:	1261e000 	rsbne	lr, r1, #0
 a30:	e3409000 	movt	r9, #0
{
 a34:	e1a05000 	mov	r5, r0
    neg = 1;
 a38:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
 a3c:	01a0e001 	moveq	lr, r1
  neg = 0;
 a40:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
 a44:	e3a07000 	mov	r7, #0
  b = base;
 a48:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
 a4c:	e3a06001 	mov	r6, #1
{
 a50:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
 a54:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
 a58:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 a5c:	e3a0c000 	mov	ip, #0
 a60:	ea000002 	b	a70 <printint+0x58>
        if(r >= d) {
 a64:	e1520000 	cmp	r2, r0
            r = r - d;
 a68:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
 a6c:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
 a70:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
 a74:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
 a78:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
 a7c:	e2011001 	and	r1, r1, #1
 a80:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
 a84:	1afffff6 	bne	a64 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a88:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
 a8c:	e35c0000 	cmp	ip, #0
 a90:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
 a94:	e2871001 	add	r1, r7, #1
 a98:	e7d93003 	ldrb	r3, [r9, r3]
 a9c:	e4c83001 	strb	r3, [r8], #1
 aa0:	11a07001 	movne	r7, r1
 aa4:	1affffea 	bne	a54 <printint+0x3c>
  if(neg)
 aa8:	e35a0000 	cmp	sl, #0
 aac:	0a000005 	beq	ac8 <printint+0xb0>
    buf[i++] = '-';
 ab0:	e24b3024 	sub	r3, fp, #36	; 0x24
 ab4:	e3a0202d 	mov	r2, #45	; 0x2d
 ab8:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
 abc:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
 ac0:	e1a03002 	mov	r3, r2
 ac4:	e5402010 	strb	r2, [r0, #-16]
 ac8:	e0847007 	add	r7, r4, r7
 acc:	ea000000 	b	ad4 <printint+0xbc>
 ad0:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
 ad4:	e3a02001 	mov	r2, #1
 ad8:	e24b1035 	sub	r1, fp, #53	; 0x35
 adc:	e1a00005 	mov	r0, r5
 ae0:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
 ae4:	ebfffefb 	bl	6d8 <write>

  while(--i >= 0)
 ae8:	e1570004 	cmp	r7, r4
 aec:	1afffff7 	bne	ad0 <printint+0xb8>
    putc(fd, buf[i]);
}
 af0:	e24bd020 	sub	sp, fp, #32
 af4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000af8 <div>:
{
 af8:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 afc:	e3a02000 	mov	r2, #0
{
 b00:	e28db008 	add	fp, sp, #8
 b04:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
 b08:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
 b0c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
 b10:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
 b14:	e1a0c33e 	lsr	ip, lr, r3
 b18:	e20cc001 	and	ip, ip, #1
 b1c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 b20:	e1520001 	cmp	r2, r1
            r = r - d;
 b24:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
 b28:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
 b2c:	e2533001 	subs	r3, r3, #1
 b30:	38bd8810 	popcc	{r4, fp, pc}
 b34:	eafffff6 	b	b14 <div+0x1c>

00000b38 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b38:	e92d000e 	push	{r1, r2, r3}
 b3c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 b40:	e28db018 	add	fp, sp, #24
 b44:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b48:	e59b6004 	ldr	r6, [fp, #4]
 b4c:	e5d64000 	ldrb	r4, [r6]
 b50:	e3540000 	cmp	r4, #0
 b54:	0a00002b 	beq	c08 <printf+0xd0>
 b58:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
 b5c:	e28b8008 	add	r8, fp, #8
  state = 0;
 b60:	e3a05000 	mov	r5, #0
 b64:	ea00000a 	b	b94 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b68:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 b6c:	01a05004 	moveq	r5, r4
      if(c == '%'){
 b70:	0a000004 	beq	b88 <printf+0x50>
  write(fd, &c, 1);
 b74:	e3a02001 	mov	r2, #1
 b78:	e24b1019 	sub	r1, fp, #25
 b7c:	e1a00007 	mov	r0, r7
 b80:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 b84:	ebfffed3 	bl	6d8 <write>
  for(i = 0; fmt[i]; i++){
 b88:	e5f64001 	ldrb	r4, [r6, #1]!
 b8c:	e3540000 	cmp	r4, #0
 b90:	0a00001c 	beq	c08 <printf+0xd0>
    if(state == 0){
 b94:	e3550000 	cmp	r5, #0
 b98:	0afffff2 	beq	b68 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b9c:	e3550025 	cmp	r5, #37	; 0x25
 ba0:	1afffff8 	bne	b88 <printf+0x50>
      if(c == 'd'){
 ba4:	e3540064 	cmp	r4, #100	; 0x64
 ba8:	0a000021 	beq	c34 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 bac:	e20430f7 	and	r3, r4, #247	; 0xf7
 bb0:	e3530070 	cmp	r3, #112	; 0x70
 bb4:	0a000017 	beq	c18 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 bb8:	e3540073 	cmp	r4, #115	; 0x73
 bbc:	0a00002e 	beq	c7c <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 bc0:	e3540063 	cmp	r4, #99	; 0x63
 bc4:	0a000021 	beq	c50 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 bc8:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
 bcc:	e3a02001 	mov	r2, #1
 bd0:	e24b1019 	sub	r1, fp, #25
 bd4:	e1a00007 	mov	r0, r7
 bd8:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
 bdc:	0a000023 	beq	c70 <printf+0x138>
  write(fd, &c, 1);
 be0:	ebfffebc 	bl	6d8 <write>
 be4:	e3a02001 	mov	r2, #1
 be8:	e24b1019 	sub	r1, fp, #25
 bec:	e1a00007 	mov	r0, r7
 bf0:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
 bf4:	ebfffeb7 	bl	6d8 <write>
  for(i = 0; fmt[i]; i++){
 bf8:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bfc:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
 c00:	e3540000 	cmp	r4, #0
 c04:	1affffe2 	bne	b94 <printf+0x5c>
    }
  }
}
 c08:	e24bd018 	sub	sp, fp, #24
 c0c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
 c10:	e28dd00c 	add	sp, sp, #12
 c14:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
 c18:	e3a03000 	mov	r3, #0
 c1c:	e3a02010 	mov	r2, #16
 c20:	e4981004 	ldr	r1, [r8], #4
 c24:	e1a00007 	mov	r0, r7
 c28:	ebffff7a 	bl	a18 <printint>
      state = 0;
 c2c:	e3a05000 	mov	r5, #0
 c30:	eaffffd4 	b	b88 <printf+0x50>
        printint(fd, *ap, 10, 1);
 c34:	e3a03001 	mov	r3, #1
 c38:	e3a0200a 	mov	r2, #10
 c3c:	e4981004 	ldr	r1, [r8], #4
 c40:	e1a00007 	mov	r0, r7
 c44:	ebffff73 	bl	a18 <printint>
      state = 0;
 c48:	e3a05000 	mov	r5, #0
 c4c:	eaffffcd 	b	b88 <printf+0x50>
        putc(fd, *ap);
 c50:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
 c54:	e3a02001 	mov	r2, #1
 c58:	e24b1019 	sub	r1, fp, #25
 c5c:	e1a00007 	mov	r0, r7
      state = 0;
 c60:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
 c64:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
 c68:	ebfffe9a 	bl	6d8 <write>
        ap++;
 c6c:	eaffffc5 	b	b88 <printf+0x50>
  write(fd, &c, 1);
 c70:	ebfffe98 	bl	6d8 <write>
      state = 0;
 c74:	e3a05000 	mov	r5, #0
 c78:	eaffffc2 	b	b88 <printf+0x50>
        s = (char*)*ap;
 c7c:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
 c80:	e3540000 	cmp	r4, #0
 c84:	0a00000b 	beq	cb8 <printf+0x180>
        while(*s != 0){
 c88:	e5d45000 	ldrb	r5, [r4]
 c8c:	e3550000 	cmp	r5, #0
 c90:	0affffbc 	beq	b88 <printf+0x50>
  write(fd, &c, 1);
 c94:	e3a02001 	mov	r2, #1
 c98:	e24b1019 	sub	r1, fp, #25
 c9c:	e1a00007 	mov	r0, r7
 ca0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
 ca4:	ebfffe8b 	bl	6d8 <write>
        while(*s != 0){
 ca8:	e5f45001 	ldrb	r5, [r4, #1]!
 cac:	e3550000 	cmp	r5, #0
 cb0:	1afffff7 	bne	c94 <printf+0x15c>
 cb4:	eaffffb3 	b	b88 <printf+0x50>
          s = "(null)";
 cb8:	e3004e98 	movw	r4, #3736	; 0xe98
        while(*s != 0){
 cbc:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
 cc0:	e3404000 	movt	r4, #0
 cc4:	eafffff2 	b	c94 <printf+0x15c>

00000cc8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cc8:	e300cea0 	movw	ip, #3744	; 0xea0
 ccc:	e340c000 	movt	ip, #0
{
 cd0:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
 cd4:	e2401008 	sub	r1, r0, #8
{
 cd8:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cdc:	e59c3000 	ldr	r3, [ip]
 ce0:	ea000004 	b	cf8 <free+0x30>
 ce4:	e1510002 	cmp	r1, r2
 ce8:	3a000009 	bcc	d14 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cec:	e1530002 	cmp	r3, r2
 cf0:	2a000007 	bcs	d14 <free+0x4c>
{
 cf4:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cf8:	e1530001 	cmp	r3, r1
 cfc:	e5932000 	ldr	r2, [r3]
 d00:	3afffff7 	bcc	ce4 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d04:	e1530002 	cmp	r3, r2
 d08:	3afffff9 	bcc	cf4 <free+0x2c>
 d0c:	e1510002 	cmp	r1, r2
 d10:	2afffff7 	bcs	cf4 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 d14:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 d18:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
 d1c:	e081418e 	add	r4, r1, lr, lsl #3
 d20:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
 d24:	05922004 	ldreq	r2, [r2, #4]
 d28:	0082e00e 	addeq	lr, r2, lr
 d2c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 d30:	05932000 	ldreq	r2, [r3]
 d34:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
 d38:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 d3c:	e5932004 	ldr	r2, [r3, #4]
 d40:	e083e182 	add	lr, r3, r2, lsl #3
 d44:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
 d48:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
 d4c:	05101004 	ldreq	r1, [r0, #-4]
 d50:	00812002 	addeq	r2, r1, r2
 d54:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 d58:	05102008 	ldreq	r2, [r0, #-8]
 d5c:	05832000 	streq	r2, [r3]
}
 d60:	e8bd8810 	pop	{r4, fp, pc}

00000d64 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d64:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d68:	e3007ea0 	movw	r7, #3744	; 0xea0
 d6c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d70:	e2804007 	add	r4, r0, #7
{
 d74:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
 d78:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d7c:	e1a041a4 	lsr	r4, r4, #3
 d80:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d84:	e3510000 	cmp	r1, #0
 d88:	0a000029 	beq	e34 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d8c:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
 d90:	e5932004 	ldr	r2, [r3, #4]
 d94:	e1520004 	cmp	r2, r4
 d98:	2a000019 	bcs	e04 <malloc+0xa0>
 d9c:	e3540a01 	cmp	r4, #4096	; 0x1000
 da0:	21a05004 	movcs	r5, r4
 da4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
 da8:	e1a06185 	lsl	r6, r5, #3
 dac:	ea000005 	b	dc8 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 db0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 db4:	e5902004 	ldr	r2, [r0, #4]
 db8:	e1520004 	cmp	r2, r4
 dbc:	2a000012 	bcs	e0c <malloc+0xa8>
 dc0:	e5971000 	ldr	r1, [r7]
 dc4:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 dc8:	e1510003 	cmp	r1, r3
 dcc:	1afffff7 	bne	db0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
 dd0:	e1a00006 	mov	r0, r6
 dd4:	ebfffee8 	bl	97c <sbrk>
 dd8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ddc:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
 de0:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
 de4:	0a000004 	beq	dfc <malloc+0x98>
  hp->s.size = nu;
 de8:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
 dec:	ebffffb5 	bl	cc8 <free>
  return freep;
 df0:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
 df4:	e3530000 	cmp	r3, #0
 df8:	1affffec 	bne	db0 <malloc+0x4c>
        return 0;
 dfc:	e3a00000 	mov	r0, #0
  }
}
 e00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
 e04:	e1a00003 	mov	r0, r3
 e08:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
 e0c:	e1540002 	cmp	r4, r2
      freep = prevp;
 e10:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
 e14:	10422004 	subne	r2, r2, r4
 e18:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
 e1c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
 e20:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
 e24:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
 e28:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
 e2c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
 e30:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
 e34:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
 e38:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
 e3c:	e5873000 	str	r3, [r7]
    base.s.size = 0;
 e40:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
 e44:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
 e48:	eaffffd3 	b	d9c <malloc+0x38>
