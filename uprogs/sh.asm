
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
       4:	e3014744 	movw	r4, #5956	; 0x1744
{
       8:	e28db014 	add	fp, sp, #20
  while((fd = open("console", O_RDWR)) >= 0){
       c:	e3404000 	movt	r4, #0
      10:	ea000001 	b	1c <main+0x1c>
    if(fd >= 3){
      14:	e3530002 	cmp	r3, #2
      18:	ca00002e 	bgt	d8 <main+0xd8>
  while((fd = open("console", O_RDWR)) >= 0){
      1c:	e3a01002 	mov	r1, #2
      20:	e1a00004 	mov	r0, r4
      24:	eb0003eb 	bl	fd8 <open>
      28:	e2503000 	subs	r3, r0, #0
      2c:	aafffff8 	bge	14 <main+0x14>
      30:	e3014788 	movw	r4, #6024	; 0x1788
      34:	e3404000 	movt	r4, #0
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      38:	e301674c 	movw	r6, #5964	; 0x174c
      if(chdir(buf+3) < 0)
      3c:	e2847003 	add	r7, r4, #3
  while(getcmd(buf, sizeof(buf)) >= 0){
      40:	e1a05004 	mov	r5, r4
        printf(2, "cannot cd %s\n", buf+3);
      44:	e3406000 	movt	r6, #0
      48:	ea000005 	b	64 <main+0x64>
int
fork1(void)
{
  int pid;
  
  pid = fork();
      4c:	eb00035f 	bl	dd0 <fork>
  if(pid == -1)
      50:	e3700001 	cmn	r0, #1
      54:	0a000025 	beq	f0 <main+0xf0>
    if(fork1() == 0)
      58:	e3500000 	cmp	r0, #0
      5c:	0a00001f 	beq	e0 <main+0xe0>
    wait();
      60:	eb000374 	bl	e38 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      64:	e3a01064 	mov	r1, #100	; 0x64
      68:	e1a00005 	mov	r0, r5
      6c:	eb000022 	bl	fc <getcmd>
      70:	e3500000 	cmp	r0, #0
      74:	ba000016 	blt	d4 <main+0xd4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      78:	e5d43000 	ldrb	r3, [r4]
      7c:	e3530063 	cmp	r3, #99	; 0x63
      80:	1afffff1 	bne	4c <main+0x4c>
      84:	e5d43001 	ldrb	r3, [r4, #1]
      88:	e3530064 	cmp	r3, #100	; 0x64
      8c:	1affffee 	bne	4c <main+0x4c>
      90:	e5d43002 	ldrb	r3, [r4, #2]
      94:	e3530020 	cmp	r3, #32
      98:	1affffeb 	bne	4c <main+0x4c>
      buf[strlen(buf)-1] = 0;  // chop \n
      9c:	e1a00005 	mov	r0, r5
      a0:	eb0002ca 	bl	bd0 <strlen>
      a4:	e3a02000 	mov	r2, #0
      a8:	e0843000 	add	r3, r4, r0
      if(chdir(buf+3) < 0)
      ac:	e1a00007 	mov	r0, r7
      buf[strlen(buf)-1] = 0;  // chop \n
      b0:	e5432001 	strb	r2, [r3, #-1]
      if(chdir(buf+3) < 0)
      b4:	eb000415 	bl	1110 <chdir>
      b8:	e3500000 	cmp	r0, #0
      bc:	aaffffe8 	bge	64 <main+0x64>
        printf(2, "cannot cd %s\n", buf+3);
      c0:	e1a02007 	mov	r2, r7
      c4:	e1a01006 	mov	r1, r6
      c8:	e3a00002 	mov	r0, #2
      cc:	eb0004a5 	bl	1368 <printf>
      d0:	eaffffe3 	b	64 <main+0x64>
  exit();
      d4:	eb00034a 	bl	e04 <exit>
      close(fd);
      d8:	eb000397 	bl	f3c <close>
      break;
      dc:	eaffffd3 	b	30 <main+0x30>
      runcmd(parsecmd(buf));
      e0:	e3010788 	movw	r0, #6024	; 0x1788
      e4:	e3400000 	movt	r0, #0
      e8:	eb00027e 	bl	ae8 <parsecmd>
      ec:	eb00001e 	bl	16c <runcmd>
    panic("fork");
      f0:	e30106ac 	movw	r0, #5804	; 0x16ac
      f4:	e3400000 	movt	r0, #0
      f8:	eb000013 	bl	14c <panic>

000000fc <getcmd>:
{
      fc:	e92d4830 	push	{r4, r5, fp, lr}
     100:	e1a04000 	mov	r4, r0
     104:	e28db00c 	add	fp, sp, #12
     108:	e1a05001 	mov	r5, r1
  printf(2, "$ ");
     10c:	e3a00002 	mov	r0, #2
     110:	e301167c 	movw	r1, #5756	; 0x167c
     114:	e3401000 	movt	r1, #0
     118:	eb000492 	bl	1368 <printf>
  memset(buf, 0, nbuf);
     11c:	e1a02005 	mov	r2, r5
     120:	e1a00004 	mov	r0, r4
     124:	e3a01000 	mov	r1, #0
     128:	eb0002ba 	bl	c18 <memset>
  gets(buf, nbuf);
     12c:	e1a01005 	mov	r1, r5
     130:	e1a00004 	mov	r0, r4
     134:	eb0002d7 	bl	c98 <gets>
  if(buf[0] == 0) // EOF
     138:	e5d40000 	ldrb	r0, [r4]
     13c:	e16f0f10 	clz	r0, r0
     140:	e1a002a0 	lsr	r0, r0, #5
}
     144:	e2600000 	rsb	r0, r0, #0
     148:	e8bd8830 	pop	{r4, r5, fp, pc}

0000014c <panic>:
{
     14c:	e92d4800 	push	{fp, lr}
  printf(2, "%s\n", s);
     150:	e1a02000 	mov	r2, r0
{
     154:	e28db004 	add	fp, sp, #4
  printf(2, "%s\n", s);
     158:	e3011680 	movw	r1, #5760	; 0x1680
     15c:	e3a00002 	mov	r0, #2
     160:	e3401000 	movt	r1, #0
     164:	eb00047f 	bl	1368 <printf>
  exit();
     168:	eb000325 	bl	e04 <exit>

0000016c <runcmd>:
{
     16c:	e92d4810 	push	{r4, fp, lr}
  if(cmd == 0)
     170:	e2504000 	subs	r4, r0, #0
{
     174:	e28db008 	add	fp, sp, #8
     178:	e24dd00c 	sub	sp, sp, #12
  if(cmd == 0)
     17c:	0a00001d 	beq	1f8 <runcmd+0x8c>
  switch(cmd->type){
     180:	e5943000 	ldr	r3, [r4]
     184:	e2433001 	sub	r3, r3, #1
     188:	e3530004 	cmp	r3, #4
     18c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     190:	ea00005a 	b	300 <runcmd+0x194>
     194:	00000214 	.word	0x00000214
     198:	00000260 	.word	0x00000260
     19c:	000001a8 	.word	0x000001a8
     1a0:	00000240 	.word	0x00000240
     1a4:	000001fc 	.word	0x000001fc
    if(pipe(p) < 0)
     1a8:	e24b0014 	sub	r0, fp, #20
     1ac:	eb00033b 	bl	ea0 <pipe>
     1b0:	e3500000 	cmp	r0, #0
     1b4:	ba000038 	blt	29c <runcmd+0x130>
  pid = fork();
     1b8:	eb000304 	bl	dd0 <fork>
  if(pid == -1)
     1bc:	e3700001 	cmn	r0, #1
     1c0:	0a00004b 	beq	2f4 <runcmd+0x188>
    if(fork1() == 0){
     1c4:	e3500000 	cmp	r0, #0
     1c8:	0a000036 	beq	2a8 <runcmd+0x13c>
  pid = fork();
     1cc:	eb0002ff 	bl	dd0 <fork>
  if(pid == -1)
     1d0:	e3700001 	cmn	r0, #1
     1d4:	0a000046 	beq	2f4 <runcmd+0x188>
    if(fork1() == 0){
     1d8:	e3500000 	cmp	r0, #0
     1dc:	0a00003b 	beq	2d0 <runcmd+0x164>
    close(p[0]);
     1e0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     1e4:	eb000354 	bl	f3c <close>
    close(p[1]);
     1e8:	e51b0010 	ldr	r0, [fp, #-16]
     1ec:	eb000352 	bl	f3c <close>
    wait();
     1f0:	eb000310 	bl	e38 <wait>
    wait();
     1f4:	eb00030f 	bl	e38 <wait>
      exit();
     1f8:	eb000301 	bl	e04 <exit>
  pid = fork();
     1fc:	eb0002f3 	bl	dd0 <fork>
  if(pid == -1)
     200:	e3700001 	cmn	r0, #1
     204:	0a00003a 	beq	2f4 <runcmd+0x188>
    if(fork1() == 0)
     208:	e3500000 	cmp	r0, #0
     20c:	1afffff9 	bne	1f8 <runcmd+0x8c>
     210:	ea000019 	b	27c <runcmd+0x110>
    if(ecmd->argv[0] == 0)
     214:	e5940004 	ldr	r0, [r4, #4]
     218:	e3500000 	cmp	r0, #0
     21c:	0afffff5 	beq	1f8 <runcmd+0x8c>
    exec(ecmd->argv[0], ecmd->argv);
     220:	e2841004 	add	r1, r4, #4
     224:	eb00035e 	bl	fa4 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     228:	e5942004 	ldr	r2, [r4, #4]
     22c:	e301168c 	movw	r1, #5772	; 0x168c
     230:	e3a00002 	mov	r0, #2
     234:	e3401000 	movt	r1, #0
     238:	eb00044a 	bl	1368 <printf>
    break;
     23c:	eaffffed 	b	1f8 <runcmd+0x8c>
  pid = fork();
     240:	eb0002e2 	bl	dd0 <fork>
  if(pid == -1)
     244:	e3700001 	cmn	r0, #1
     248:	0a000029 	beq	2f4 <runcmd+0x188>
    if(fork1() == 0)
     24c:	e3500000 	cmp	r0, #0
     250:	0a000009 	beq	27c <runcmd+0x110>
    wait();
     254:	eb0002f7 	bl	e38 <wait>
    runcmd(lcmd->right);
     258:	e5940008 	ldr	r0, [r4, #8]
     25c:	ebffffc2 	bl	16c <runcmd>
    close(rcmd->fd);
     260:	e5940014 	ldr	r0, [r4, #20]
     264:	eb000334 	bl	f3c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     268:	e5941010 	ldr	r1, [r4, #16]
     26c:	e5940008 	ldr	r0, [r4, #8]
     270:	eb000358 	bl	fd8 <open>
     274:	e3500000 	cmp	r0, #0
     278:	ba000001 	blt	284 <runcmd+0x118>
      runcmd(bcmd->cmd);
     27c:	e5940004 	ldr	r0, [r4, #4]
     280:	ebffffb9 	bl	16c <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
     284:	e5942008 	ldr	r2, [r4, #8]
     288:	e301169c 	movw	r1, #5788	; 0x169c
     28c:	e3a00002 	mov	r0, #2
     290:	e3401000 	movt	r1, #0
     294:	eb000433 	bl	1368 <printf>
     298:	eaffffd6 	b	1f8 <runcmd+0x8c>
      panic("pipe");
     29c:	e30106b4 	movw	r0, #5812	; 0x16b4
     2a0:	e3400000 	movt	r0, #0
     2a4:	ebffffa8 	bl	14c <panic>
      close(1);
     2a8:	e3a00001 	mov	r0, #1
     2ac:	eb000322 	bl	f3c <close>
      dup(p[1]);
     2b0:	e51b0010 	ldr	r0, [fp, #-16]
     2b4:	eb0003a2 	bl	1144 <dup>
      close(p[0]);
     2b8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2bc:	eb00031e 	bl	f3c <close>
      close(p[1]);
     2c0:	e51b0010 	ldr	r0, [fp, #-16]
     2c4:	eb00031c 	bl	f3c <close>
      runcmd(pcmd->left);
     2c8:	e5940004 	ldr	r0, [r4, #4]
     2cc:	ebffffa6 	bl	16c <runcmd>
      close(0);
     2d0:	eb000319 	bl	f3c <close>
      dup(p[0]);
     2d4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2d8:	eb000399 	bl	1144 <dup>
      close(p[0]);
     2dc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2e0:	eb000315 	bl	f3c <close>
      close(p[1]);
     2e4:	e51b0010 	ldr	r0, [fp, #-16]
     2e8:	eb000313 	bl	f3c <close>
      runcmd(pcmd->right);
     2ec:	e5940008 	ldr	r0, [r4, #8]
     2f0:	ebffff9d 	bl	16c <runcmd>
    panic("fork");
     2f4:	e30106ac 	movw	r0, #5804	; 0x16ac
     2f8:	e3400000 	movt	r0, #0
     2fc:	ebffff92 	bl	14c <panic>
    panic("runcmd");
     300:	e3010684 	movw	r0, #5764	; 0x1684
     304:	e3400000 	movt	r0, #0
     308:	ebffff8f 	bl	14c <panic>

0000030c <fork1>:
{
     30c:	e92d4800 	push	{fp, lr}
     310:	e28db004 	add	fp, sp, #4
  pid = fork();
     314:	eb0002ad 	bl	dd0 <fork>
  if(pid == -1)
     318:	e3700001 	cmn	r0, #1
     31c:	18bd8800 	popne	{fp, pc}
    panic("fork");
     320:	e30106ac 	movw	r0, #5804	; 0x16ac
     324:	e3400000 	movt	r0, #0
     328:	ebffff87 	bl	14c <panic>

0000032c <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     32c:	e92d4830 	push	{r4, r5, fp, lr}
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     330:	e3a00054 	mov	r0, #84	; 0x54
{
     334:	e28db00c 	add	fp, sp, #12
  cmd = malloc(sizeof(*cmd));
     338:	eb000495 	bl	1594 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     33c:	e3a02054 	mov	r2, #84	; 0x54
     340:	e3a01000 	mov	r1, #0
  cmd = malloc(sizeof(*cmd));
     344:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     348:	eb000232 	bl	c18 <memset>
  cmd->type = EXEC;
     34c:	e3a03001 	mov	r3, #1
  return (struct cmd*)cmd;
}
     350:	e1a00004 	mov	r0, r4
  cmd->type = EXEC;
     354:	e5843000 	str	r3, [r4]
}
     358:	e8bd8830 	pop	{r4, r5, fp, pc}

0000035c <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     35c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     360:	e28db01c 	add	fp, sp, #28
     364:	e1a09000 	mov	r9, r0
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     368:	e3a00018 	mov	r0, #24
{
     36c:	e1a08001 	mov	r8, r1
     370:	e1a07002 	mov	r7, r2
     374:	e1a06003 	mov	r6, r3
     378:	e59b5004 	ldr	r5, [fp, #4]
  cmd = malloc(sizeof(*cmd));
     37c:	eb000484 	bl	1594 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     380:	e3a02018 	mov	r2, #24
     384:	e3a01000 	mov	r1, #0
  cmd = malloc(sizeof(*cmd));
     388:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     38c:	eb000221 	bl	c18 <memset>
  cmd->type = REDIR;
     390:	e3a02002 	mov	r2, #2
  cmd->cmd = subcmd;
     394:	e5849004 	str	r9, [r4, #4]
  cmd->file = file;
     398:	e5848008 	str	r8, [r4, #8]
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}
     39c:	e1a00004 	mov	r0, r4
  cmd->efile = efile;
     3a0:	e584700c 	str	r7, [r4, #12]
  cmd->mode = mode;
     3a4:	e5846010 	str	r6, [r4, #16]
  cmd->fd = fd;
     3a8:	e5845014 	str	r5, [r4, #20]
  cmd->type = REDIR;
     3ac:	e5842000 	str	r2, [r4]
}
     3b0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000003b4 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3b4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3b8:	e1a06000 	mov	r6, r0
     3bc:	e28db014 	add	fp, sp, #20
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c0:	e3a0000c 	mov	r0, #12
{
     3c4:	e1a05001 	mov	r5, r1
  cmd = malloc(sizeof(*cmd));
     3c8:	eb000471 	bl	1594 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3cc:	e3a0200c 	mov	r2, #12
     3d0:	e3a01000 	mov	r1, #0
  cmd = malloc(sizeof(*cmd));
     3d4:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     3d8:	eb00020e 	bl	c18 <memset>
  cmd->type = PIPE;
     3dc:	e3a03003 	mov	r3, #3
  cmd->left = left;
     3e0:	e5846004 	str	r6, [r4, #4]
  cmd->right = right;
     3e4:	e5845008 	str	r5, [r4, #8]
  return (struct cmd*)cmd;
}
     3e8:	e1a00004 	mov	r0, r4
  cmd->type = PIPE;
     3ec:	e5843000 	str	r3, [r4]
}
     3f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000003f4 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3f4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3f8:	e1a06000 	mov	r6, r0
     3fc:	e28db014 	add	fp, sp, #20
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     400:	e3a0000c 	mov	r0, #12
{
     404:	e1a05001 	mov	r5, r1
  cmd = malloc(sizeof(*cmd));
     408:	eb000461 	bl	1594 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40c:	e3a0200c 	mov	r2, #12
     410:	e3a01000 	mov	r1, #0
  cmd = malloc(sizeof(*cmd));
     414:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     418:	eb0001fe 	bl	c18 <memset>
  cmd->type = LIST;
     41c:	e3a03004 	mov	r3, #4
  cmd->left = left;
     420:	e5846004 	str	r6, [r4, #4]
  cmd->right = right;
     424:	e5845008 	str	r5, [r4, #8]
  return (struct cmd*)cmd;
}
     428:	e1a00004 	mov	r0, r4
  cmd->type = LIST;
     42c:	e5843000 	str	r3, [r4]
}
     430:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

00000434 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     434:	e92d4830 	push	{r4, r5, fp, lr}
     438:	e1a05000 	mov	r5, r0
     43c:	e28db00c 	add	fp, sp, #12
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     440:	e3a00008 	mov	r0, #8
     444:	eb000452 	bl	1594 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     448:	e3a02008 	mov	r2, #8
     44c:	e3a01000 	mov	r1, #0
  cmd = malloc(sizeof(*cmd));
     450:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     454:	eb0001ef 	bl	c18 <memset>
  cmd->type = BACK;
     458:	e3a03005 	mov	r3, #5
  cmd->cmd = subcmd;
     45c:	e5845004 	str	r5, [r4, #4]
  return (struct cmd*)cmd;
}
     460:	e1a00004 	mov	r0, r4
  cmd->type = BACK;
     464:	e5843000 	str	r3, [r4]
}
     468:	e8bd8830 	pop	{r4, r5, fp, pc}

0000046c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     46c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     470:	e1a08000 	mov	r8, r0
  char *s;
  int ret;
  
  s = *ps;
     474:	e5904000 	ldr	r4, [r0]
{
     478:	e28db024 	add	fp, sp, #36	; 0x24
     47c:	e1a06001 	mov	r6, r1
     480:	e1a0a002 	mov	sl, r2
  while(s < es && strchr(whitespace, *s))
     484:	e1540001 	cmp	r4, r1
{
     488:	e1a09003 	mov	r9, r3
  while(s < es && strchr(whitespace, *s))
     48c:	2a00000d 	bcs	4c8 <gettoken+0x5c>
     490:	e3017778 	movw	r7, #6008	; 0x1778
     494:	e1a05004 	mov	r5, r4
     498:	e3407000 	movt	r7, #0
     49c:	ea000002 	b	4ac <gettoken+0x40>
     4a0:	e1550006 	cmp	r5, r6
    s++;
     4a4:	e1a04005 	mov	r4, r5
  while(s < es && strchr(whitespace, *s))
     4a8:	0a000006 	beq	4c8 <gettoken+0x5c>
     4ac:	e5d51000 	ldrb	r1, [r5]
     4b0:	e1a00007 	mov	r0, r7
     4b4:	eb0001e4 	bl	c4c <strchr>
     4b8:	e1a04005 	mov	r4, r5
    s++;
     4bc:	e2855001 	add	r5, r5, #1
  while(s < es && strchr(whitespace, *s))
     4c0:	e3500000 	cmp	r0, #0
     4c4:	1afffff5 	bne	4a0 <gettoken+0x34>
  if(q)
     4c8:	e35a0000 	cmp	sl, #0
    *q = s;
     4cc:	158a4000 	strne	r4, [sl]
  ret = *s;
     4d0:	e5d41000 	ldrb	r1, [r4]
  switch(*s){
     4d4:	e3510029 	cmp	r1, #41	; 0x29
     4d8:	8a000033 	bhi	5ac <gettoken+0x140>
     4dc:	e3510028 	cmp	r1, #40	; 0x28
     4e0:	2a00003f 	bcs	5e4 <gettoken+0x178>
     4e4:	e3510000 	cmp	r1, #0
     4e8:	1a000016 	bne	548 <gettoken+0xdc>
     4ec:	e1a07001 	mov	r7, r1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4f0:	e3590000 	cmp	r9, #0
     4f4:	0a000000 	beq	4fc <gettoken+0x90>
    *eq = s;
     4f8:	e5894000 	str	r4, [r9]
  
  while(s < es && strchr(whitespace, *s))
     4fc:	e1540006 	cmp	r4, r6
     500:	2a00000d 	bcs	53c <gettoken+0xd0>
     504:	e3019778 	movw	r9, #6008	; 0x1778
     508:	e1a05004 	mov	r5, r4
     50c:	e3409000 	movt	r9, #0
     510:	ea000002 	b	520 <gettoken+0xb4>
     514:	e1550006 	cmp	r5, r6
    s++;
     518:	e1a04005 	mov	r4, r5
  while(s < es && strchr(whitespace, *s))
     51c:	0a000006 	beq	53c <gettoken+0xd0>
     520:	e5d51000 	ldrb	r1, [r5]
     524:	e1a00009 	mov	r0, r9
     528:	eb0001c7 	bl	c4c <strchr>
     52c:	e1a04005 	mov	r4, r5
    s++;
     530:	e2855001 	add	r5, r5, #1
  while(s < es && strchr(whitespace, *s))
     534:	e3500000 	cmp	r0, #0
     538:	1afffff5 	bne	514 <gettoken+0xa8>
  *ps = s;
     53c:	e5884000 	str	r4, [r8]
  return ret;
}
     540:	e1a00007 	mov	r0, r7
     544:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
  switch(*s){
     548:	e3510026 	cmp	r1, #38	; 0x26
     54c:	0a000024 	beq	5e4 <gettoken+0x178>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     550:	e1560004 	cmp	r6, r4
     554:	9a000028 	bls	5fc <gettoken+0x190>
     558:	e3015778 	movw	r5, #6008	; 0x1778
     55c:	e3405000 	movt	r5, #0
     560:	e1a0a004 	mov	sl, r4
     564:	e2857008 	add	r7, r5, #8
     568:	ea000007 	b	58c <gettoken+0x120>
     56c:	e4da1001 	ldrb	r1, [sl], #1
     570:	eb0001b5 	bl	c4c <strchr>
     574:	e3500000 	cmp	r0, #0
     578:	1a000009 	bne	5a4 <gettoken+0x138>
     57c:	e15a0006 	cmp	sl, r6
      s++;
     580:	e1a0400a 	mov	r4, sl
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     584:	0a00001c 	beq	5fc <gettoken+0x190>
     588:	e5da1000 	ldrb	r1, [sl]
     58c:	e1a00005 	mov	r0, r5
     590:	e1a0400a 	mov	r4, sl
     594:	eb0001ac 	bl	c4c <strchr>
     598:	e3500000 	cmp	r0, #0
     59c:	e1a00007 	mov	r0, r7
     5a0:	0afffff1 	beq	56c <gettoken+0x100>
    ret = 'a';
     5a4:	e3a07061 	mov	r7, #97	; 0x61
     5a8:	eaffffd0 	b	4f0 <gettoken+0x84>
  switch(*s){
     5ac:	e351003e 	cmp	r1, #62	; 0x3e
     5b0:	1a000007 	bne	5d4 <gettoken+0x168>
    if(*s == '>'){
     5b4:	e5d43001 	ldrb	r3, [r4, #1]
    s++;
     5b8:	e2842001 	add	r2, r4, #1
    if(*s == '>'){
     5bc:	e353003e 	cmp	r3, #62	; 0x3e
      s++;
     5c0:	02844002 	addeq	r4, r4, #2
      ret = '+';
     5c4:	03a0702b 	moveq	r7, #43	; 0x2b
    if(*s == '>'){
     5c8:	0affffc8 	beq	4f0 <gettoken+0x84>
    s++;
     5cc:	e1a04002 	mov	r4, r2
     5d0:	eaffffc5 	b	4ec <gettoken+0x80>
  switch(*s){
     5d4:	8a000005 	bhi	5f0 <gettoken+0x184>
     5d8:	e241303b 	sub	r3, r1, #59	; 0x3b
     5dc:	e3530001 	cmp	r3, #1
     5e0:	8affffda 	bhi	550 <gettoken+0xe4>
  ret = *s;
     5e4:	e1a07001 	mov	r7, r1
    s++;
     5e8:	e2844001 	add	r4, r4, #1
    break;
     5ec:	eaffffbf 	b	4f0 <gettoken+0x84>
  switch(*s){
     5f0:	e351007c 	cmp	r1, #124	; 0x7c
     5f4:	0afffffa 	beq	5e4 <gettoken+0x178>
     5f8:	eaffffd4 	b	550 <gettoken+0xe4>
  if(eq)
     5fc:	e3590000 	cmp	r9, #0
     600:	e3a07061 	mov	r7, #97	; 0x61
     604:	1affffbb 	bne	4f8 <gettoken+0x8c>
     608:	eaffffcb 	b	53c <gettoken+0xd0>

0000060c <peek>:

int
peek(char **ps, char *es, char *toks)
{
     60c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     610:	e1a08000 	mov	r8, r0
  char *s;
  
  s = *ps;
     614:	e5905000 	ldr	r5, [r0]
{
     618:	e28db01c 	add	fp, sp, #28
     61c:	e1a09002 	mov	r9, r2
  while(s < es && strchr(whitespace, *s))
     620:	e1550001 	cmp	r5, r1
     624:	2a00000e 	bcs	664 <peek+0x58>
     628:	e3016778 	movw	r6, #6008	; 0x1778
     62c:	e1a07001 	mov	r7, r1
     630:	e1a04005 	mov	r4, r5
     634:	e3406000 	movt	r6, #0
     638:	ea000002 	b	648 <peek+0x3c>
     63c:	e1540007 	cmp	r4, r7
    s++;
     640:	e1a05004 	mov	r5, r4
  while(s < es && strchr(whitespace, *s))
     644:	0a000006 	beq	664 <peek+0x58>
     648:	e5d41000 	ldrb	r1, [r4]
     64c:	e1a00006 	mov	r0, r6
     650:	eb00017d 	bl	c4c <strchr>
     654:	e1a05004 	mov	r5, r4
    s++;
     658:	e2844001 	add	r4, r4, #1
  while(s < es && strchr(whitespace, *s))
     65c:	e3500000 	cmp	r0, #0
     660:	1afffff5 	bne	63c <peek+0x30>
  *ps = s;
     664:	e5885000 	str	r5, [r8]
  return *s && strchr(toks, *s);
     668:	e5d50000 	ldrb	r0, [r5]
     66c:	e3500000 	cmp	r0, #0
     670:	08bd8bf0 	popeq	{r4, r5, r6, r7, r8, r9, fp, pc}
     674:	e1a01000 	mov	r1, r0
     678:	e1a00009 	mov	r0, r9
     67c:	eb000172 	bl	c4c <strchr>
     680:	e2900000 	adds	r0, r0, #0
     684:	13a00001 	movne	r0, #1
}
     688:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000068c <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     68c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     690:	e30186dc 	movw	r8, #5852	; 0x16dc
     694:	e3408000 	movt	r8, #0
{
     698:	e1a07000 	mov	r7, r0
     69c:	e1a06001 	mov	r6, r1
     6a0:	e1a05002 	mov	r5, r2
     6a4:	e28db018 	add	fp, sp, #24
     6a8:	e24dd014 	sub	sp, sp, #20
  while(peek(ps, es, "<>")){
     6ac:	e1a02008 	mov	r2, r8
     6b0:	e1a01005 	mov	r1, r5
     6b4:	e1a00006 	mov	r0, r6
     6b8:	ebffffd3 	bl	60c <peek>
     6bc:	e3500000 	cmp	r0, #0
     6c0:	0a000023 	beq	754 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     6c4:	e3a03000 	mov	r3, #0
     6c8:	e1a01005 	mov	r1, r5
     6cc:	e1a02003 	mov	r2, r3
     6d0:	e1a00006 	mov	r0, r6
     6d4:	ebffff64 	bl	46c <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     6d8:	e24b3020 	sub	r3, fp, #32
     6dc:	e24b2024 	sub	r2, fp, #36	; 0x24
     6e0:	e1a01005 	mov	r1, r5
    tok = gettoken(ps, es, 0, 0);
     6e4:	e1a04000 	mov	r4, r0
    if(gettoken(ps, es, &q, &eq) != 'a')
     6e8:	e1a00006 	mov	r0, r6
     6ec:	ebffff5e 	bl	46c <gettoken>
     6f0:	e3500061 	cmp	r0, #97	; 0x61
     6f4:	1a000019 	bne	760 <parseredirs+0xd4>
      panic("missing file for redirection");
    switch(tok){
     6f8:	e354003c 	cmp	r4, #60	; 0x3c
     6fc:	0a00000c 	beq	734 <parseredirs+0xa8>
     700:	e354003e 	cmp	r4, #62	; 0x3e
     704:	0a000001 	beq	710 <parseredirs+0x84>
     708:	e354002b 	cmp	r4, #43	; 0x2b
     70c:	1affffe6 	bne	6ac <parseredirs+0x20>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     710:	e1a00007 	mov	r0, r7
     714:	e3a02001 	mov	r2, #1
     718:	e3003201 	movw	r3, #513	; 0x201
     71c:	e58d2000 	str	r2, [sp]
     720:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     724:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
     728:	ebffff0b 	bl	35c <redircmd>
     72c:	e1a07000 	mov	r7, r0
      break;
     730:	eaffffdd 	b	6ac <parseredirs+0x20>
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     734:	e3a03000 	mov	r3, #0
     738:	e1a00007 	mov	r0, r7
     73c:	e58d3000 	str	r3, [sp]
     740:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
     744:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
     748:	ebffff03 	bl	35c <redircmd>
     74c:	e1a07000 	mov	r7, r0
      break;
     750:	eaffffd5 	b	6ac <parseredirs+0x20>
    }
  }
  return cmd;
}
     754:	e1a00007 	mov	r0, r7
     758:	e24bd018 	sub	sp, fp, #24
     75c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
      panic("missing file for redirection");
     760:	e30106bc 	movw	r0, #5820	; 0x16bc
     764:	e3400000 	movt	r0, #0
     768:	ebfffe77 	bl	14c <panic>

0000076c <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     76c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     770:	e30126e0 	movw	r2, #5856	; 0x16e0
{
     774:	e28db020 	add	fp, sp, #32
  if(peek(ps, es, "("))
     778:	e3402000 	movt	r2, #0
{
     77c:	e24dd00c 	sub	sp, sp, #12
     780:	e1a04000 	mov	r4, r0
     784:	e1a05001 	mov	r5, r1
  if(peek(ps, es, "("))
     788:	ebffff9f 	bl	60c <peek>
     78c:	e2506000 	subs	r6, r0, #0
     790:	1a000027 	bne	834 <parseexec+0xc8>
    return parseblock(ps, es);

  ret = execcmd();
     794:	ebfffee4 	bl	32c <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     798:	e1a02005 	mov	r2, r5
     79c:	e1a01004 	mov	r1, r4
  while(!peek(ps, es, "|)&;")){
     7a0:	e30196fc 	movw	r9, #5884	; 0x16fc
     7a4:	e3409000 	movt	r9, #0
  ret = execcmd();
     7a8:	e1a0a000 	mov	sl, r0
  ret = parseredirs(ret, ps, es);
     7ac:	ebffffb6 	bl	68c <parseredirs>
     7b0:	e1a0700a 	mov	r7, sl
     7b4:	e1a08000 	mov	r8, r0
  while(!peek(ps, es, "|)&;")){
     7b8:	ea000004 	b	7d0 <parseexec+0x64>
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7bc:	e1a00008 	mov	r0, r8
     7c0:	e1a02005 	mov	r2, r5
     7c4:	e1a01004 	mov	r1, r4
     7c8:	ebffffaf 	bl	68c <parseredirs>
     7cc:	e1a08000 	mov	r8, r0
  while(!peek(ps, es, "|)&;")){
     7d0:	e1a02009 	mov	r2, r9
     7d4:	e1a01005 	mov	r1, r5
     7d8:	e1a00004 	mov	r0, r4
     7dc:	ebffff8a 	bl	60c <peek>
     7e0:	e3500000 	cmp	r0, #0
     7e4:	1a000019 	bne	850 <parseexec+0xe4>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7e8:	e24b3028 	sub	r3, fp, #40	; 0x28
     7ec:	e24b202c 	sub	r2, fp, #44	; 0x2c
     7f0:	e1a01005 	mov	r1, r5
     7f4:	e1a00004 	mov	r0, r4
     7f8:	ebffff1b 	bl	46c <gettoken>
     7fc:	e3500000 	cmp	r0, #0
     800:	0a000012 	beq	850 <parseexec+0xe4>
    if(tok != 'a')
     804:	e3500061 	cmp	r0, #97	; 0x61
     808:	1a000017 	bne	86c <parseexec+0x100>
    cmd->argv[argc] = q;
     80c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    argc++;
     810:	e2866001 	add	r6, r6, #1
    if(argc >= MAXARGS)
     814:	e356000a 	cmp	r6, #10
    cmd->argv[argc] = q;
     818:	e5a73004 	str	r3, [r7, #4]!
    cmd->eargv[argc] = eq;
     81c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     820:	e5873028 	str	r3, [r7, #40]	; 0x28
    if(argc >= MAXARGS)
     824:	1affffe4 	bne	7bc <parseexec+0x50>
      panic("too many args");
     828:	e30106ec 	movw	r0, #5868	; 0x16ec
     82c:	e3400000 	movt	r0, #0
     830:	ebfffe45 	bl	14c <panic>
    return parseblock(ps, es);
     834:	e1a01005 	mov	r1, r5
     838:	e1a00004 	mov	r0, r4
     83c:	eb000054 	bl	994 <parseblock>
     840:	e1a08000 	mov	r8, r0
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     844:	e1a00008 	mov	r0, r8
     848:	e24bd020 	sub	sp, fp, #32
     84c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
  cmd->argv[argc] = 0;
     850:	e08a6106 	add	r6, sl, r6, lsl #2
     854:	e3a03000 	mov	r3, #0
}
     858:	e1a00008 	mov	r0, r8
  cmd->argv[argc] = 0;
     85c:	e5863004 	str	r3, [r6, #4]
  cmd->eargv[argc] = 0;
     860:	e586302c 	str	r3, [r6, #44]	; 0x2c
}
     864:	e24bd020 	sub	sp, fp, #32
     868:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
      panic("syntax");
     86c:	e30106e4 	movw	r0, #5860	; 0x16e4
     870:	e3400000 	movt	r0, #0
     874:	ebfffe34 	bl	14c <panic>

00000878 <parsepipe>:
{
     878:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     87c:	e28db014 	add	fp, sp, #20
     880:	e1a04000 	mov	r4, r0
     884:	e1a05001 	mov	r5, r1
  cmd = parseexec(ps, es);
     888:	ebffffb7 	bl	76c <parseexec>
  if(peek(ps, es, "|")){
     88c:	e1a01005 	mov	r1, r5
     890:	e3012704 	movw	r2, #5892	; 0x1704
     894:	e3402000 	movt	r2, #0
  cmd = parseexec(ps, es);
     898:	e1a06000 	mov	r6, r0
  if(peek(ps, es, "|")){
     89c:	e1a00004 	mov	r0, r4
     8a0:	ebffff59 	bl	60c <peek>
     8a4:	e3500000 	cmp	r0, #0
     8a8:	1a000001 	bne	8b4 <parsepipe+0x3c>
}
     8ac:	e1a00006 	mov	r0, r6
     8b0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    gettoken(ps, es, 0, 0);
     8b4:	e3a03000 	mov	r3, #0
     8b8:	e1a01005 	mov	r1, r5
     8bc:	e1a02003 	mov	r2, r3
     8c0:	e1a00004 	mov	r0, r4
     8c4:	ebfffee8 	bl	46c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8c8:	e1a01005 	mov	r1, r5
     8cc:	e1a00004 	mov	r0, r4
     8d0:	ebffffe8 	bl	878 <parsepipe>
     8d4:	e1a01000 	mov	r1, r0
     8d8:	e1a00006 	mov	r0, r6
}
     8dc:	e24bd014 	sub	sp, fp, #20
     8e0:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8e4:	eafffeb2 	b	3b4 <pipecmd>

000008e8 <parseline>:
{
     8e8:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     8ec:	e28db01c 	add	fp, sp, #28
     8f0:	e1a04000 	mov	r4, r0
     8f4:	e1a05001 	mov	r5, r1
  cmd = parsepipe(ps, es);
     8f8:	ebffffde 	bl	878 <parsepipe>
  while(peek(ps, es, "&")){
     8fc:	e3017708 	movw	r7, #5896	; 0x1708
     900:	e3407000 	movt	r7, #0
  cmd = parsepipe(ps, es);
     904:	e1a06000 	mov	r6, r0
  while(peek(ps, es, "&")){
     908:	ea000003 	b	91c <parseline+0x34>
    gettoken(ps, es, 0, 0);
     90c:	ebfffed6 	bl	46c <gettoken>
    cmd = backcmd(cmd);
     910:	e1a00006 	mov	r0, r6
     914:	ebfffec6 	bl	434 <backcmd>
     918:	e1a06000 	mov	r6, r0
  while(peek(ps, es, "&")){
     91c:	e1a02007 	mov	r2, r7
     920:	e1a01005 	mov	r1, r5
     924:	e1a00004 	mov	r0, r4
     928:	ebffff37 	bl	60c <peek>
    gettoken(ps, es, 0, 0);
     92c:	e3a03000 	mov	r3, #0
     930:	e1a02003 	mov	r2, r3
     934:	e1a01005 	mov	r1, r5
  while(peek(ps, es, "&")){
     938:	e2508000 	subs	r8, r0, #0
    gettoken(ps, es, 0, 0);
     93c:	e1a00004 	mov	r0, r4
  while(peek(ps, es, "&")){
     940:	1afffff1 	bne	90c <parseline+0x24>
  if(peek(ps, es, ";")){
     944:	e301270c 	movw	r2, #5900	; 0x170c
     948:	e3402000 	movt	r2, #0
     94c:	ebffff2e 	bl	60c <peek>
     950:	e3500000 	cmp	r0, #0
     954:	1a000001 	bne	960 <parseline+0x78>
}
     958:	e1a00006 	mov	r0, r6
     95c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    gettoken(ps, es, 0, 0);
     960:	e1a03008 	mov	r3, r8
     964:	e1a02008 	mov	r2, r8
     968:	e1a01005 	mov	r1, r5
     96c:	e1a00004 	mov	r0, r4
     970:	ebfffebd 	bl	46c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     974:	e1a01005 	mov	r1, r5
     978:	e1a00004 	mov	r0, r4
     97c:	ebffffd9 	bl	8e8 <parseline>
     980:	e1a01000 	mov	r1, r0
     984:	e1a00006 	mov	r0, r6
}
     988:	e24bd01c 	sub	sp, fp, #28
     98c:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
    cmd = listcmd(cmd, parseline(ps, es));
     990:	eafffe97 	b	3f4 <listcmd>

00000994 <parseblock>:
{
     994:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  if(!peek(ps, es, "("))
     998:	e30126e0 	movw	r2, #5856	; 0x16e0
{
     99c:	e28db014 	add	fp, sp, #20
  if(!peek(ps, es, "("))
     9a0:	e3402000 	movt	r2, #0
{
     9a4:	e1a04000 	mov	r4, r0
     9a8:	e1a05001 	mov	r5, r1
  if(!peek(ps, es, "("))
     9ac:	ebffff16 	bl	60c <peek>
     9b0:	e3500000 	cmp	r0, #0
     9b4:	0a00001a 	beq	a24 <parseblock+0x90>
  gettoken(ps, es, 0, 0);
     9b8:	e3a03000 	mov	r3, #0
     9bc:	e1a01005 	mov	r1, r5
     9c0:	e1a02003 	mov	r2, r3
     9c4:	e1a00004 	mov	r0, r4
     9c8:	ebfffea7 	bl	46c <gettoken>
  cmd = parseline(ps, es);
     9cc:	e1a01005 	mov	r1, r5
     9d0:	e1a00004 	mov	r0, r4
     9d4:	ebffffc3 	bl	8e8 <parseline>
  if(!peek(ps, es, ")"))
     9d8:	e301271c 	movw	r2, #5916	; 0x171c
     9dc:	e1a01005 	mov	r1, r5
     9e0:	e3402000 	movt	r2, #0
  cmd = parseline(ps, es);
     9e4:	e1a06000 	mov	r6, r0
  if(!peek(ps, es, ")"))
     9e8:	e1a00004 	mov	r0, r4
     9ec:	ebffff06 	bl	60c <peek>
     9f0:	e3500000 	cmp	r0, #0
     9f4:	0a00000d 	beq	a30 <parseblock+0x9c>
  gettoken(ps, es, 0, 0);
     9f8:	e3a03000 	mov	r3, #0
     9fc:	e1a01005 	mov	r1, r5
     a00:	e1a02003 	mov	r2, r3
     a04:	e1a00004 	mov	r0, r4
     a08:	ebfffe97 	bl	46c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a0c:	e1a02005 	mov	r2, r5
     a10:	e1a01004 	mov	r1, r4
     a14:	e1a00006 	mov	r0, r6
}
     a18:	e24bd014 	sub	sp, fp, #20
     a1c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  cmd = parseredirs(cmd, ps, es);
     a20:	eaffff19 	b	68c <parseredirs>
    panic("parseblock");
     a24:	e3010710 	movw	r0, #5904	; 0x1710
     a28:	e3400000 	movt	r0, #0
     a2c:	ebfffdc6 	bl	14c <panic>
    panic("syntax - missing )");
     a30:	e3010720 	movw	r0, #5920	; 0x1720
     a34:	e3400000 	movt	r0, #0
     a38:	ebfffdc3 	bl	14c <panic>

00000a3c <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a3c:	e92d4830 	push	{r4, r5, fp, lr}
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a40:	e2504000 	subs	r4, r0, #0
{
     a44:	e28db00c 	add	fp, sp, #12
  if(cmd == 0)
     a48:	0a00000b 	beq	a7c <nulterminate+0x40>
    return 0;
  
  switch(cmd->type){
     a4c:	e5943000 	ldr	r3, [r4]
     a50:	e2433001 	sub	r3, r3, #1
     a54:	e3530004 	cmp	r3, #4
     a58:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     a5c:	ea000006 	b	a7c <nulterminate+0x40>
     a60:	00000a9c 	.word	0x00000a9c
     a64:	00000acc 	.word	0x00000acc
     a68:	00000a84 	.word	0x00000a84
     a6c:	00000a84 	.word	0x00000a84
     a70:	00000a74 	.word	0x00000a74
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a74:	e5940004 	ldr	r0, [r4, #4]
     a78:	ebffffef 	bl	a3c <nulterminate>
    break;
  }
  return cmd;
}
     a7c:	e1a00004 	mov	r0, r4
     a80:	e8bd8830 	pop	{r4, r5, fp, pc}
    nulterminate(lcmd->left);
     a84:	e5940004 	ldr	r0, [r4, #4]
     a88:	ebffffeb 	bl	a3c <nulterminate>
    nulterminate(lcmd->right);
     a8c:	e5940008 	ldr	r0, [r4, #8]
     a90:	ebffffe9 	bl	a3c <nulterminate>
}
     a94:	e1a00004 	mov	r0, r4
     a98:	e8bd8830 	pop	{r4, r5, fp, pc}
    for(i=0; ecmd->argv[i]; i++)
     a9c:	e5943004 	ldr	r3, [r4, #4]
     aa0:	e3530000 	cmp	r3, #0
     aa4:	0afffff4 	beq	a7c <nulterminate+0x40>
     aa8:	e2843004 	add	r3, r4, #4
      *ecmd->eargv[i] = 0;
     aac:	e3a01000 	mov	r1, #0
     ab0:	e5932028 	ldr	r2, [r3, #40]	; 0x28
     ab4:	e5c21000 	strb	r1, [r2]
    for(i=0; ecmd->argv[i]; i++)
     ab8:	e5b32004 	ldr	r2, [r3, #4]!
     abc:	e3520000 	cmp	r2, #0
     ac0:	1afffffa 	bne	ab0 <nulterminate+0x74>
}
     ac4:	e1a00004 	mov	r0, r4
     ac8:	e8bd8830 	pop	{r4, r5, fp, pc}
    nulterminate(rcmd->cmd);
     acc:	e5940004 	ldr	r0, [r4, #4]
     ad0:	ebffffd9 	bl	a3c <nulterminate>
    *rcmd->efile = 0;
     ad4:	e594300c 	ldr	r3, [r4, #12]
     ad8:	e3a02000 	mov	r2, #0
}
     adc:	e1a00004 	mov	r0, r4
    *rcmd->efile = 0;
     ae0:	e5c32000 	strb	r2, [r3]
}
     ae4:	e8bd8830 	pop	{r4, r5, fp, pc}

00000ae8 <parsecmd>:
{
     ae8:	e92d4830 	push	{r4, r5, fp, lr}
     aec:	e28db00c 	add	fp, sp, #12
     af0:	e24dd008 	sub	sp, sp, #8
  es = s + strlen(s);
     af4:	e1a04000 	mov	r4, r0
{
     af8:	e50b0010 	str	r0, [fp, #-16]
  es = s + strlen(s);
     afc:	eb000033 	bl	bd0 <strlen>
     b00:	e0844000 	add	r4, r4, r0
  cmd = parseline(&s, es);
     b04:	e24b0010 	sub	r0, fp, #16
     b08:	e1a01004 	mov	r1, r4
     b0c:	ebffff75 	bl	8e8 <parseline>
  peek(&s, es, "");
     b10:	e1a01004 	mov	r1, r4
     b14:	e3012700 	movw	r2, #5888	; 0x1700
     b18:	e3402000 	movt	r2, #0
  cmd = parseline(&s, es);
     b1c:	e1a05000 	mov	r5, r0
  peek(&s, es, "");
     b20:	e24b0010 	sub	r0, fp, #16
     b24:	ebfffeb8 	bl	60c <peek>
  if(s != es){
     b28:	e51b2010 	ldr	r2, [fp, #-16]
     b2c:	e1520004 	cmp	r2, r4
     b30:	1a000004 	bne	b48 <parsecmd+0x60>
  nulterminate(cmd);
     b34:	e1a00005 	mov	r0, r5
     b38:	ebffffbf 	bl	a3c <nulterminate>
}
     b3c:	e1a00005 	mov	r0, r5
     b40:	e24bd00c 	sub	sp, fp, #12
     b44:	e8bd8830 	pop	{r4, r5, fp, pc}
    printf(2, "leftovers: %s\n", s);
     b48:	e3a00002 	mov	r0, #2
     b4c:	e3011734 	movw	r1, #5940	; 0x1734
     b50:	e3401000 	movt	r1, #0
     b54:	eb000203 	bl	1368 <printf>
    panic("syntax");
     b58:	e30106e4 	movw	r0, #5860	; 0x16e4
     b5c:	e3400000 	movt	r0, #0
     b60:	ebfffd79 	bl	14c <panic>

00000b64 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     b64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b68:	e2402001 	sub	r2, r0, #1
     b6c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b70:	e4d13001 	ldrb	r3, [r1], #1
     b74:	e3530000 	cmp	r3, #0
     b78:	e5e23001 	strb	r3, [r2, #1]!
     b7c:	1afffffb 	bne	b70 <strcpy+0xc>
    ;
  return os;
}
     b80:	e28bd000 	add	sp, fp, #0
     b84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b88:	e12fff1e 	bx	lr

00000b8c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b90:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
     b94:	e5d03000 	ldrb	r3, [r0]
     b98:	e5d12000 	ldrb	r2, [r1]
     b9c:	e3530000 	cmp	r3, #0
     ba0:	1a000004 	bne	bb8 <strcmp+0x2c>
     ba4:	ea000005 	b	bc0 <strcmp+0x34>
     ba8:	e5f03001 	ldrb	r3, [r0, #1]!
     bac:	e5f12001 	ldrb	r2, [r1, #1]!
     bb0:	e3530000 	cmp	r3, #0
     bb4:	0a000001 	beq	bc0 <strcmp+0x34>
     bb8:	e1530002 	cmp	r3, r2
     bbc:	0afffff9 	beq	ba8 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     bc0:	e0430002 	sub	r0, r3, r2
     bc4:	e28bd000 	add	sp, fp, #0
     bc8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     bcc:	e12fff1e 	bx	lr

00000bd0 <strlen>:

uint
strlen(char *s)
{
     bd0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bd4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
     bd8:	e5d03000 	ldrb	r3, [r0]
     bdc:	e3530000 	cmp	r3, #0
     be0:	0a000008 	beq	c08 <strlen+0x38>
     be4:	e2601001 	rsb	r1, r0, #1
     be8:	e1a03000 	mov	r3, r0
    ;
     bec:	e0810003 	add	r0, r1, r3
  for(n = 0; s[n]; n++)
     bf0:	e5f32001 	ldrb	r2, [r3, #1]!
     bf4:	e3520000 	cmp	r2, #0
     bf8:	1afffffb 	bne	bec <strlen+0x1c>
  return n;
}
     bfc:	e28bd000 	add	sp, fp, #0
     c00:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c04:	e12fff1e 	bx	lr
  for(n = 0; s[n]; n++)
     c08:	e1a00003 	mov	r0, r3
}
     c0c:	e28bd000 	add	sp, fp, #0
     c10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c14:	e12fff1e 	bx	lr

00000c18 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     c18:	e3520000 	cmp	r2, #0
{
     c1c:	e1a03000 	mov	r3, r0
     c20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c24:	e28db000 	add	fp, sp, #0
  while (rc-- > 0) *p++ = c;
     c28:	0a000004 	beq	c40 <memset+0x28>
     c2c:	e6ef1071 	uxtb	r1, r1
     c30:	e0800002 	add	r0, r0, r2
     c34:	e4c31001 	strb	r1, [r3], #1
     c38:	e1500003 	cmp	r0, r3
     c3c:	1afffffc 	bne	c34 <memset+0x1c>
  return (void *)p;
}
     c40:	e28bd000 	add	sp, fp, #0
     c44:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c48:	e12fff1e 	bx	lr

00000c4c <strchr>:

char*
strchr(const char *s, char c)
{
     c4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c50:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
     c54:	e5d02000 	ldrb	r2, [r0]
     c58:	e3520000 	cmp	r2, #0
     c5c:	0a00000b 	beq	c90 <strchr+0x44>
    if(*s == c)
     c60:	e1520001 	cmp	r2, r1
     c64:	1a000002 	bne	c74 <strchr+0x28>
     c68:	ea000005 	b	c84 <strchr+0x38>
     c6c:	e1530001 	cmp	r3, r1
     c70:	0a000003 	beq	c84 <strchr+0x38>
  for(; *s; s++)
     c74:	e5f03001 	ldrb	r3, [r0, #1]!
     c78:	e3530000 	cmp	r3, #0
     c7c:	1afffffa 	bne	c6c <strchr+0x20>
      return (char*)s;
  return 0;
     c80:	e1a00003 	mov	r0, r3
}
     c84:	e28bd000 	add	sp, fp, #0
     c88:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c8c:	e12fff1e 	bx	lr
  return 0;
     c90:	e1a00002 	mov	r0, r2
     c94:	eafffffa 	b	c84 <strchr+0x38>

00000c98 <gets>:

char*
gets(char *buf, int max)
{
     c98:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     c9c:	e1a03000 	mov	r3, r0
     ca0:	e28db014 	add	fp, sp, #20
     ca4:	e1a07000 	mov	r7, r0
     ca8:	e24dd008 	sub	sp, sp, #8
     cac:	e1a06001 	mov	r6, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     cb0:	e3a04000 	mov	r4, #0
     cb4:	ea000008 	b	cdc <gets+0x44>
    cc = read(0, &c, 1);
     cb8:	eb000085 	bl	ed4 <read>
    if(cc < 1)
      break;
    buf[i++] = c;
     cbc:	e1a03005 	mov	r3, r5
    if(cc < 1)
     cc0:	e3500000 	cmp	r0, #0
     cc4:	da00000b 	ble	cf8 <gets+0x60>
    buf[i++] = c;
     cc8:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    if(c == '\n' || c == '\r')
     ccc:	e352000d 	cmp	r2, #13
     cd0:	1352000a 	cmpne	r2, #10
    buf[i++] = c;
     cd4:	e4c32001 	strb	r2, [r3], #1
    if(c == '\n' || c == '\r')
     cd8:	0a00000b 	beq	d0c <gets+0x74>
    cc = read(0, &c, 1);
     cdc:	e3a02001 	mov	r2, #1
  for(i=0; i+1 < max; ){
     ce0:	e0844002 	add	r4, r4, r2
     ce4:	e1540006 	cmp	r4, r6
    cc = read(0, &c, 1);
     ce8:	e24b1015 	sub	r1, fp, #21
     cec:	e3a00000 	mov	r0, #0
     cf0:	e1a05003 	mov	r5, r3
  for(i=0; i+1 < max; ){
     cf4:	baffffef 	blt	cb8 <gets+0x20>
      break;
  }
  buf[i] = '\0';
  return buf;
}
     cf8:	e1a00007 	mov	r0, r7
  buf[i] = '\0';
     cfc:	e3a03000 	mov	r3, #0
     d00:	e5c53000 	strb	r3, [r5]
}
     d04:	e24bd014 	sub	sp, fp, #20
     d08:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
     d0c:	e0875004 	add	r5, r7, r4
     d10:	eafffff8 	b	cf8 <gets+0x60>

00000d14 <stat>:

int
stat(char *n, struct stat *st)
{
     d14:	e92d4830 	push	{r4, r5, fp, lr}
     d18:	e1a04001 	mov	r4, r1
     d1c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d20:	e3a01000 	mov	r1, #0
     d24:	eb0000ab 	bl	fd8 <open>
  if(fd < 0)
     d28:	e2505000 	subs	r5, r0, #0
     d2c:	ba000006 	blt	d4c <stat+0x38>
    return -1;
  r = fstat(fd, st);
     d30:	e1a01004 	mov	r1, r4
     d34:	eb0000ce 	bl	1074 <fstat>
     d38:	e1a04000 	mov	r4, r0
  close(fd);
     d3c:	e1a00005 	mov	r0, r5
     d40:	eb00007d 	bl	f3c <close>
  return r;
}
     d44:	e1a00004 	mov	r0, r4
     d48:	e8bd8830 	pop	{r4, r5, fp, pc}
    return -1;
     d4c:	e3e04000 	mvn	r4, #0
     d50:	eafffffb 	b	d44 <stat+0x30>

00000d54 <atoi>:

int
atoi(const char *s)
{
     d54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d58:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d5c:	e5d02000 	ldrb	r2, [r0]
     d60:	e2423030 	sub	r3, r2, #48	; 0x30
     d64:	e3530009 	cmp	r3, #9
  n = 0;
     d68:	e3a03000 	mov	r3, #0
  while('0' <= *s && *s <= '9')
     d6c:	8a000006 	bhi	d8c <atoi+0x38>
    n = n*10 + *s++ - '0';
     d70:	e3a0c00a 	mov	ip, #10
     d74:	e023239c 	mla	r3, ip, r3, r2
  while('0' <= *s && *s <= '9')
     d78:	e5f02001 	ldrb	r2, [r0, #1]!
     d7c:	e2421030 	sub	r1, r2, #48	; 0x30
     d80:	e3510009 	cmp	r1, #9
    n = n*10 + *s++ - '0';
     d84:	e2433030 	sub	r3, r3, #48	; 0x30
  while('0' <= *s && *s <= '9')
     d88:	9afffff9 	bls	d74 <atoi+0x20>
  return n;
}
     d8c:	e1a00003 	mov	r0, r3
     d90:	e28bd000 	add	sp, fp, #0
     d94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     d98:	e12fff1e 	bx	lr

00000d9c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d9c:	e3520000 	cmp	r2, #0
{
     da0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     da4:	e28db000 	add	fp, sp, #0
  while(n-- > 0)
     da8:	da000005 	ble	dc4 <memmove+0x28>
     dac:	e0812002 	add	r2, r1, r2
     db0:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
     db4:	e4d1c001 	ldrb	ip, [r1], #1
  while(n-- > 0)
     db8:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
     dbc:	e5e3c001 	strb	ip, [r3, #1]!
  while(n-- > 0)
     dc0:	1afffffb 	bne	db4 <memmove+0x18>
  return vdst;
}
     dc4:	e28bd000 	add	sp, fp, #0
     dc8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     dcc:	e12fff1e 	bx	lr

00000dd0 <fork>:
     dd0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     dd4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     dd8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ddc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     de0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     de4:	e3a00001 	mov	r0, #1
     de8:	ef000040 	svc	0x00000040
     dec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     df0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     df4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     df8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     dfc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e00:	e12fff1e 	bx	lr

00000e04 <exit>:
     e04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e08:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e0c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e10:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e14:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e18:	e3a00002 	mov	r0, #2
     e1c:	ef000040 	svc	0x00000040
     e20:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e24:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e28:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e2c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e34:	e12fff1e 	bx	lr

00000e38 <wait>:
     e38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e3c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e40:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e44:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e48:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e4c:	e3a00003 	mov	r0, #3
     e50:	ef000040 	svc	0x00000040
     e54:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e58:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e5c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e60:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e68:	e12fff1e 	bx	lr

00000e6c <lseek>:
     e6c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e70:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e74:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e78:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e7c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e80:	e3a00016 	mov	r0, #22
     e84:	ef000040 	svc	0x00000040
     e88:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e8c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e90:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e94:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e98:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e9c:	e12fff1e 	bx	lr

00000ea0 <pipe>:
     ea0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ea4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ea8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     eac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     eb0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     eb4:	e3a00004 	mov	r0, #4
     eb8:	ef000040 	svc	0x00000040
     ebc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ec0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ec4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ec8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ecc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ed0:	e12fff1e 	bx	lr

00000ed4 <read>:
     ed4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ed8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     edc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ee0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ee4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ee8:	e3a00005 	mov	r0, #5
     eec:	ef000040 	svc	0x00000040
     ef0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ef4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ef8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     efc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f00:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f04:	e12fff1e 	bx	lr

00000f08 <write>:
     f08:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f0c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f10:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f14:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f18:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f1c:	e3a00010 	mov	r0, #16
     f20:	ef000040 	svc	0x00000040
     f24:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f28:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f2c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f30:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f34:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f38:	e12fff1e 	bx	lr

00000f3c <close>:
     f3c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f40:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f44:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f48:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f4c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f50:	e3a00015 	mov	r0, #21
     f54:	ef000040 	svc	0x00000040
     f58:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f5c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f60:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f64:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f6c:	e12fff1e 	bx	lr

00000f70 <kill>:
     f70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f74:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f78:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f7c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f80:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f84:	e3a00006 	mov	r0, #6
     f88:	ef000040 	svc	0x00000040
     f8c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f90:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f94:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f98:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f9c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fa0:	e12fff1e 	bx	lr

00000fa4 <exec>:
     fa4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fa8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fb0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fb4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fb8:	e3a00007 	mov	r0, #7
     fbc:	ef000040 	svc	0x00000040
     fc0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fc4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fc8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fcc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fd0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fd4:	e12fff1e 	bx	lr

00000fd8 <open>:
     fd8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fdc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fe0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fe4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fe8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fec:	e3a0000f 	mov	r0, #15
     ff0:	ef000040 	svc	0x00000040
     ff4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ff8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ffc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1000:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1004:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1008:	e12fff1e 	bx	lr

0000100c <mknod>:
    100c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1010:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1014:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1018:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    101c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1020:	e3a00011 	mov	r0, #17
    1024:	ef000040 	svc	0x00000040
    1028:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    102c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1030:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1034:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1038:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    103c:	e12fff1e 	bx	lr

00001040 <unlink>:
    1040:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1044:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1048:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    104c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1050:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1054:	e3a00012 	mov	r0, #18
    1058:	ef000040 	svc	0x00000040
    105c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1060:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1064:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1068:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    106c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1070:	e12fff1e 	bx	lr

00001074 <fstat>:
    1074:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1078:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    107c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1080:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1084:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1088:	e3a00008 	mov	r0, #8
    108c:	ef000040 	svc	0x00000040
    1090:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1094:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1098:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    109c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10a4:	e12fff1e 	bx	lr

000010a8 <link>:
    10a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10bc:	e3a00013 	mov	r0, #19
    10c0:	ef000040 	svc	0x00000040
    10c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10d8:	e12fff1e 	bx	lr

000010dc <mkdir>:
    10dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10f0:	e3a00014 	mov	r0, #20
    10f4:	ef000040 	svc	0x00000040
    10f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1100:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1104:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1108:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    110c:	e12fff1e 	bx	lr

00001110 <chdir>:
    1110:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1114:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1118:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    111c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1120:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1124:	e3a00009 	mov	r0, #9
    1128:	ef000040 	svc	0x00000040
    112c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1130:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1134:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1138:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    113c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1140:	e12fff1e 	bx	lr

00001144 <dup>:
    1144:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1148:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    114c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1150:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1154:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1158:	e3a0000a 	mov	r0, #10
    115c:	ef000040 	svc	0x00000040
    1160:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1164:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1168:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    116c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1170:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1174:	e12fff1e 	bx	lr

00001178 <getpid>:
    1178:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    117c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1180:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1184:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1188:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    118c:	e3a0000b 	mov	r0, #11
    1190:	ef000040 	svc	0x00000040
    1194:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1198:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    119c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    11a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11a8:	e12fff1e 	bx	lr

000011ac <sbrk>:
    11ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    11c0:	e3a0000c 	mov	r0, #12
    11c4:	ef000040 	svc	0x00000040
    11c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    11d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11dc:	e12fff1e 	bx	lr

000011e0 <sleep>:
    11e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    11f4:	e3a0000d 	mov	r0, #13
    11f8:	ef000040 	svc	0x00000040
    11fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1200:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1204:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1208:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    120c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1210:	e12fff1e 	bx	lr

00001214 <uptime>:
    1214:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1218:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    121c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1220:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1224:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1228:	e3a0000e 	mov	r0, #14
    122c:	ef000040 	svc	0x00000040
    1230:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1234:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1238:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    123c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1240:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1244:	e12fff1e 	bx	lr

00001248 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1248:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    124c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    1250:	e0133fa1 	ands	r3, r3, r1, lsr #31
    1254:	e24b4034 	sub	r4, fp, #52	; 0x34
    1258:	e301975c 	movw	r9, #5980	; 0x175c
    neg = 1;
    x = -xx;
    125c:	1261e000 	rsbne	lr, r1, #0
    1260:	e3409000 	movt	r9, #0
{
    1264:	e1a05000 	mov	r5, r0
    neg = 1;
    1268:	13a0a001 	movne	sl, #1
  } else {
    x = xx;
    126c:	01a0e001 	moveq	lr, r1
  neg = 0;
    1270:	01a0a003 	moveq	sl, r3
  }

  b = base;
  i = 0;
    1274:	e3a07000 	mov	r7, #0
  b = base;
    1278:	e1a08004 	mov	r8, r4
            q = q | (1 << i);
    127c:	e3a06001 	mov	r6, #1
{
    1280:	e24dd01c 	sub	sp, sp, #28
        r = r | ((n >> i) & 1);
    1284:	e1a00fae 	lsr	r0, lr, #31
    for(i=31;i>=0;i--){
    1288:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    128c:	e3a0c000 	mov	ip, #0
    1290:	ea000002 	b	12a0 <printint+0x58>
        if(r >= d) {
    1294:	e1520000 	cmp	r2, r0
            r = r - d;
    1298:	90400002 	subls	r0, r0, r2
            q = q | (1 << i);
    129c:	918cc316 	orrls	ip, ip, r6, lsl r3
    for(i=31;i>=0;i--){
    12a0:	e2433001 	sub	r3, r3, #1
        r = r | ((n >> i) & 1);
    12a4:	e1a0133e 	lsr	r1, lr, r3
    for(i=31;i>=0;i--){
    12a8:	e3730001 	cmn	r3, #1
        r = r | ((n >> i) & 1);
    12ac:	e2011001 	and	r1, r1, #1
    12b0:	e1810080 	orr	r0, r1, r0, lsl #1
    for(i=31;i>=0;i--){
    12b4:	1afffff6 	bne	1294 <printint+0x4c>
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    12b8:	e063e29c 	mls	r3, ip, r2, lr
  }while((x = y) != 0);
    12bc:	e35c0000 	cmp	ip, #0
    12c0:	e1a0e00c 	mov	lr, ip
    buf[i++] = digits[x - y * b];
    12c4:	e2871001 	add	r1, r7, #1
    12c8:	e7d93003 	ldrb	r3, [r9, r3]
    12cc:	e4c83001 	strb	r3, [r8], #1
    12d0:	11a07001 	movne	r7, r1
    12d4:	1affffea 	bne	1284 <printint+0x3c>
  if(neg)
    12d8:	e35a0000 	cmp	sl, #0
    12dc:	0a000005 	beq	12f8 <printint+0xb0>
    buf[i++] = '-';
    12e0:	e24b3024 	sub	r3, fp, #36	; 0x24
    12e4:	e3a0202d 	mov	r2, #45	; 0x2d
    12e8:	e0830001 	add	r0, r3, r1
    buf[i++] = digits[x - y * b];
    12ec:	e1a07001 	mov	r7, r1
    buf[i++] = '-';
    12f0:	e1a03002 	mov	r3, r2
    12f4:	e5402010 	strb	r2, [r0, #-16]
    12f8:	e0847007 	add	r7, r4, r7
    12fc:	ea000000 	b	1304 <printint+0xbc>
    1300:	e5773001 	ldrb	r3, [r7, #-1]!
  write(fd, &c, 1);
    1304:	e3a02001 	mov	r2, #1
    1308:	e24b1035 	sub	r1, fp, #53	; 0x35
    130c:	e1a00005 	mov	r0, r5
    1310:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
    1314:	ebfffefb 	bl	f08 <write>

  while(--i >= 0)
    1318:	e1570004 	cmp	r7, r4
    131c:	1afffff7 	bne	1300 <printint+0xb8>
    putc(fd, buf[i]);
}
    1320:	e24bd020 	sub	sp, fp, #32
    1324:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00001328 <div>:
{
    1328:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    132c:	e3a02000 	mov	r2, #0
{
    1330:	e28db008 	add	fp, sp, #8
    1334:	e1a0e000 	mov	lr, r0
    for(i=31;i>=0;i--){
    1338:	e3a0301f 	mov	r3, #31
    u32 q=0, r=0;
    133c:	e1a00002 	mov	r0, r2
            q = q | (1 << i);
    1340:	e3a04001 	mov	r4, #1
        r = r | ((n >> i) & 1);
    1344:	e1a0c33e 	lsr	ip, lr, r3
    1348:	e20cc001 	and	ip, ip, #1
    134c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    1350:	e1520001 	cmp	r2, r1
            r = r - d;
    1354:	20422001 	subcs	r2, r2, r1
            q = q | (1 << i);
    1358:	21800314 	orrcs	r0, r0, r4, lsl r3
    for(i=31;i>=0;i--){
    135c:	e2533001 	subs	r3, r3, #1
    1360:	38bd8810 	popcc	{r4, fp, pc}
    1364:	eafffff6 	b	1344 <div+0x1c>

00001368 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1368:	e92d000e 	push	{r1, r2, r3}
    136c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    1370:	e28db018 	add	fp, sp, #24
    1374:	e24dd008 	sub	sp, sp, #8
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1378:	e59b6004 	ldr	r6, [fp, #4]
    137c:	e5d64000 	ldrb	r4, [r6]
    1380:	e3540000 	cmp	r4, #0
    1384:	0a00002b 	beq	1438 <printf+0xd0>
    1388:	e1a07000 	mov	r7, r0
  ap = (uint*)(void*)&fmt + 1;
    138c:	e28b8008 	add	r8, fp, #8
  state = 0;
    1390:	e3a05000 	mov	r5, #0
    1394:	ea00000a 	b	13c4 <printf+0x5c>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1398:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    139c:	01a05004 	moveq	r5, r4
      if(c == '%'){
    13a0:	0a000004 	beq	13b8 <printf+0x50>
  write(fd, &c, 1);
    13a4:	e3a02001 	mov	r2, #1
    13a8:	e24b1019 	sub	r1, fp, #25
    13ac:	e1a00007 	mov	r0, r7
    13b0:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
    13b4:	ebfffed3 	bl	f08 <write>
  for(i = 0; fmt[i]; i++){
    13b8:	e5f64001 	ldrb	r4, [r6, #1]!
    13bc:	e3540000 	cmp	r4, #0
    13c0:	0a00001c 	beq	1438 <printf+0xd0>
    if(state == 0){
    13c4:	e3550000 	cmp	r5, #0
    13c8:	0afffff2 	beq	1398 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    13cc:	e3550025 	cmp	r5, #37	; 0x25
    13d0:	1afffff8 	bne	13b8 <printf+0x50>
      if(c == 'd'){
    13d4:	e3540064 	cmp	r4, #100	; 0x64
    13d8:	0a000021 	beq	1464 <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    13dc:	e20430f7 	and	r3, r4, #247	; 0xf7
    13e0:	e3530070 	cmp	r3, #112	; 0x70
    13e4:	0a000017 	beq	1448 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    13e8:	e3540073 	cmp	r4, #115	; 0x73
    13ec:	0a00002e 	beq	14ac <printf+0x144>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    13f0:	e3540063 	cmp	r4, #99	; 0x63
    13f4:	0a000021 	beq	1480 <printf+0x118>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    13f8:	e3540025 	cmp	r4, #37	; 0x25
  write(fd, &c, 1);
    13fc:	e3a02001 	mov	r2, #1
    1400:	e24b1019 	sub	r1, fp, #25
    1404:	e1a00007 	mov	r0, r7
    1408:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
      } else if(c == '%'){
    140c:	0a000023 	beq	14a0 <printf+0x138>
  write(fd, &c, 1);
    1410:	ebfffebc 	bl	f08 <write>
    1414:	e3a02001 	mov	r2, #1
    1418:	e24b1019 	sub	r1, fp, #25
    141c:	e1a00007 	mov	r0, r7
    1420:	e54b4019 	strb	r4, [fp, #-25]	; 0xffffffe7
    1424:	ebfffeb7 	bl	f08 <write>
  for(i = 0; fmt[i]; i++){
    1428:	e5f64001 	ldrb	r4, [r6, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    142c:	e3a05000 	mov	r5, #0
  for(i = 0; fmt[i]; i++){
    1430:	e3540000 	cmp	r4, #0
    1434:	1affffe2 	bne	13c4 <printf+0x5c>
    }
  }
}
    1438:	e24bd018 	sub	sp, fp, #24
    143c:	e8bd49f0 	pop	{r4, r5, r6, r7, r8, fp, lr}
    1440:	e28dd00c 	add	sp, sp, #12
    1444:	e12fff1e 	bx	lr
        printint(fd, *ap, 16, 0);
    1448:	e3a03000 	mov	r3, #0
    144c:	e3a02010 	mov	r2, #16
    1450:	e4981004 	ldr	r1, [r8], #4
    1454:	e1a00007 	mov	r0, r7
    1458:	ebffff7a 	bl	1248 <printint>
      state = 0;
    145c:	e3a05000 	mov	r5, #0
    1460:	eaffffd4 	b	13b8 <printf+0x50>
        printint(fd, *ap, 10, 1);
    1464:	e3a03001 	mov	r3, #1
    1468:	e3a0200a 	mov	r2, #10
    146c:	e4981004 	ldr	r1, [r8], #4
    1470:	e1a00007 	mov	r0, r7
    1474:	ebffff73 	bl	1248 <printint>
      state = 0;
    1478:	e3a05000 	mov	r5, #0
    147c:	eaffffcd 	b	13b8 <printf+0x50>
        putc(fd, *ap);
    1480:	e4983004 	ldr	r3, [r8], #4
  write(fd, &c, 1);
    1484:	e3a02001 	mov	r2, #1
    1488:	e24b1019 	sub	r1, fp, #25
    148c:	e1a00007 	mov	r0, r7
      state = 0;
    1490:	e3a05000 	mov	r5, #0
        putc(fd, *ap);
    1494:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
  write(fd, &c, 1);
    1498:	ebfffe9a 	bl	f08 <write>
        ap++;
    149c:	eaffffc5 	b	13b8 <printf+0x50>
  write(fd, &c, 1);
    14a0:	ebfffe98 	bl	f08 <write>
      state = 0;
    14a4:	e3a05000 	mov	r5, #0
    14a8:	eaffffc2 	b	13b8 <printf+0x50>
        s = (char*)*ap;
    14ac:	e4984004 	ldr	r4, [r8], #4
        if(s == 0)
    14b0:	e3540000 	cmp	r4, #0
    14b4:	0a00000b 	beq	14e8 <printf+0x180>
        while(*s != 0){
    14b8:	e5d45000 	ldrb	r5, [r4]
    14bc:	e3550000 	cmp	r5, #0
    14c0:	0affffbc 	beq	13b8 <printf+0x50>
  write(fd, &c, 1);
    14c4:	e3a02001 	mov	r2, #1
    14c8:	e24b1019 	sub	r1, fp, #25
    14cc:	e1a00007 	mov	r0, r7
    14d0:	e54b5019 	strb	r5, [fp, #-25]	; 0xffffffe7
    14d4:	ebfffe8b 	bl	f08 <write>
        while(*s != 0){
    14d8:	e5f45001 	ldrb	r5, [r4, #1]!
    14dc:	e3550000 	cmp	r5, #0
    14e0:	1afffff7 	bne	14c4 <printf+0x15c>
    14e4:	eaffffb3 	b	13b8 <printf+0x50>
          s = "(null)";
    14e8:	e3014770 	movw	r4, #6000	; 0x1770
        while(*s != 0){
    14ec:	e3a05028 	mov	r5, #40	; 0x28
          s = "(null)";
    14f0:	e3404000 	movt	r4, #0
    14f4:	eafffff2 	b	14c4 <printf+0x15c>

000014f8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14f8:	e301c7ec 	movw	ip, #6124	; 0x17ec
    14fc:	e340c000 	movt	ip, #0
{
    1500:	e92d4810 	push	{r4, fp, lr}
  bp = (Header*)ap - 1;
    1504:	e2401008 	sub	r1, r0, #8
{
    1508:	e28db008 	add	fp, sp, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    150c:	e59c3000 	ldr	r3, [ip]
    1510:	ea000004 	b	1528 <free+0x30>
    1514:	e1510002 	cmp	r1, r2
    1518:	3a000009 	bcc	1544 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    151c:	e1530002 	cmp	r3, r2
    1520:	2a000007 	bcs	1544 <free+0x4c>
{
    1524:	e1a03002 	mov	r3, r2
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1528:	e1530001 	cmp	r3, r1
    152c:	e5932000 	ldr	r2, [r3]
    1530:	3afffff7 	bcc	1514 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1534:	e1530002 	cmp	r3, r2
    1538:	3afffff9 	bcc	1524 <free+0x2c>
    153c:	e1510002 	cmp	r1, r2
    1540:	2afffff7 	bcs	1524 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1544:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1548:	e58c3000 	str	r3, [ip]
  if(bp + bp->s.size == p->s.ptr){
    154c:	e081418e 	add	r4, r1, lr, lsl #3
    1550:	e1520004 	cmp	r2, r4
    bp->s.size += p->s.ptr->s.size;
    1554:	05922004 	ldreq	r2, [r2, #4]
    1558:	0082e00e 	addeq	lr, r2, lr
    155c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    1560:	05932000 	ldreq	r2, [r3]
    1564:	05922000 	ldreq	r2, [r2]
    bp->s.ptr = p->s.ptr;
    1568:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    156c:	e5932004 	ldr	r2, [r3, #4]
    1570:	e083e182 	add	lr, r3, r2, lsl #3
    1574:	e151000e 	cmp	r1, lr
    p->s.ptr = bp;
    1578:	15831000 	strne	r1, [r3]
    p->s.size += bp->s.size;
    157c:	05101004 	ldreq	r1, [r0, #-4]
    1580:	00812002 	addeq	r2, r1, r2
    1584:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    1588:	05102008 	ldreq	r2, [r0, #-8]
    158c:	05832000 	streq	r2, [r3]
}
    1590:	e8bd8810 	pop	{r4, fp, pc}

00001594 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1594:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    1598:	e30177ec 	movw	r7, #6124	; 0x17ec
    159c:	e3407000 	movt	r7, #0
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15a0:	e2804007 	add	r4, r0, #7
{
    15a4:	e28db014 	add	fp, sp, #20
  if((prevp = freep) == 0){
    15a8:	e5971000 	ldr	r1, [r7]
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15ac:	e1a041a4 	lsr	r4, r4, #3
    15b0:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    15b4:	e3510000 	cmp	r1, #0
    15b8:	0a000029 	beq	1664 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15bc:	e5913000 	ldr	r3, [r1]
    if(p->s.size >= nunits){
    15c0:	e5932004 	ldr	r2, [r3, #4]
    15c4:	e1520004 	cmp	r2, r4
    15c8:	2a000019 	bcs	1634 <malloc+0xa0>
    15cc:	e3540a01 	cmp	r4, #4096	; 0x1000
    15d0:	21a05004 	movcs	r5, r4
    15d4:	33a05a01 	movcc	r5, #4096	; 0x1000
  p = sbrk(nu * sizeof(Header));
    15d8:	e1a06185 	lsl	r6, r5, #3
    15dc:	ea000005 	b	15f8 <malloc+0x64>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15e0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    15e4:	e5902004 	ldr	r2, [r0, #4]
    15e8:	e1520004 	cmp	r2, r4
    15ec:	2a000012 	bcs	163c <malloc+0xa8>
    15f0:	e5971000 	ldr	r1, [r7]
    15f4:	e1a03000 	mov	r3, r0
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    15f8:	e1510003 	cmp	r1, r3
    15fc:	1afffff7 	bne	15e0 <malloc+0x4c>
  p = sbrk(nu * sizeof(Header));
    1600:	e1a00006 	mov	r0, r6
    1604:	ebfffee8 	bl	11ac <sbrk>
    1608:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    160c:	e3730001 	cmn	r3, #1
  free((void*)(hp + 1));
    1610:	e2800008 	add	r0, r0, #8
  if(p == (char*)-1)
    1614:	0a000004 	beq	162c <malloc+0x98>
  hp->s.size = nu;
    1618:	e5835004 	str	r5, [r3, #4]
  free((void*)(hp + 1));
    161c:	ebffffb5 	bl	14f8 <free>
  return freep;
    1620:	e5973000 	ldr	r3, [r7]
      if((p = morecore(nunits)) == 0)
    1624:	e3530000 	cmp	r3, #0
    1628:	1affffec 	bne	15e0 <malloc+0x4c>
        return 0;
    162c:	e3a00000 	mov	r0, #0
  }
}
    1630:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    if(p->s.size >= nunits){
    1634:	e1a00003 	mov	r0, r3
    1638:	e1a03001 	mov	r3, r1
      if(p->s.size == nunits)
    163c:	e1540002 	cmp	r4, r2
      freep = prevp;
    1640:	e5873000 	str	r3, [r7]
        p->s.size -= nunits;
    1644:	10422004 	subne	r2, r2, r4
    1648:	15802004 	strne	r2, [r0, #4]
        prevp->s.ptr = p->s.ptr;
    164c:	05902000 	ldreq	r2, [r0]
        p += p->s.size;
    1650:	10800182 	addne	r0, r0, r2, lsl #3
      return (void*)(p + 1);
    1654:	e2800008 	add	r0, r0, #8
        p->s.size = nunits;
    1658:	15004004 	strne	r4, [r0, #-4]
        prevp->s.ptr = p->s.ptr;
    165c:	05832000 	streq	r2, [r3]
      return (void*)(p + 1);
    1660:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    base.s.ptr = freep = prevp = &base;
    1664:	e2873004 	add	r3, r7, #4
    base.s.size = 0;
    1668:	e5871008 	str	r1, [r7, #8]
    base.s.ptr = freep = prevp = &base;
    166c:	e5873000 	str	r3, [r7]
    base.s.size = 0;
    1670:	e1a01003 	mov	r1, r3
    base.s.ptr = freep = prevp = &base;
    1674:	e5873004 	str	r3, [r7, #4]
    if(p->s.size >= nunits){
    1678:	eaffffd3 	b	15cc <malloc+0x38>
