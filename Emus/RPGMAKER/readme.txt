1. Add origin games to RomDir, and Rescan to create game placeholder so that will be in list
  if there's no mkxp relevant available, the mkxp.binary, conf and preload (that may differ each game)
  will cp to the game directory and invoke them there, edit them if required.
  game may need some hack to reach the compatibilily which the original game use win32only features. such as TRGSSX and so on,
  or some queer grammer error originated from ruby1.8 and ruby2.0

2. Add RTPs to She Rom/Game Directory  aside from the other Game
so no absolute path needed.

such as 
Standard/...   for XP
RGSSVXAce/...  for VX Ace 
...

can be used for the game which need it,
vim the $SOME_GAME_DIR/mkxp.conf
add add this,ie:

RTP=../Standard

3. based on mkxp/mkxp-freebird from github,with my respect.

