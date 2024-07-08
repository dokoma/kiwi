based on mkxp/mkxp-freebird from github. Awesome work by Ancurio.
RGSS: VX/XP/VXACE works.

- EMU DIR	`/mnt/SDCARD/Emus/`

  1. when it runs from list,if there's no mkxp relevant available in the game dir: the mkxp.binary, conf and preload (that may differ each game) will copy to the game directory.

- GAMES DIR	`/mnt/SDCARD/Vault/RPGMAKER/`

  1. put your game directory, rtp directory here(fixed relative path).  i.e:
     ToTheMoon/...  Game files for To The Moon 
     Standard/...   RTP files for XP  
     RGSSVXAce/...  RTP files for VX Ace 

  2. edit the `mkxp.conf` in the game directoy if required.
  if rtp files required by some game:
  vim `$SOME_GAME_DIR/mkxp.conf`
  add mod/add this , to find rtp in the correspond dir: 
  RTP=../Standard

  3. game file may need some mod to run (some game use win32-only features. such as `TRGSSX` and so on,  or some queer grammar error originated from ruby1.8 and ruby2.0)

- GAMELIST	`/mnt/SDCARD/Roms/the_game_name.m3u`
  1.  the .m3u files here are sample.  they are game placeholder for list simple. 
  2.  .m3u content is the path of game data.
  3.  .m3u will be clear generate by `@tools/Rescan` from `/mnt/SDCARD/Vault/RPGMAKER`
     (i.e:s can from the path 
     `/mnt/SDCARD/Vault/RPGMAKER/the_game_name/the_game_files...`
     generate 
     `/mnt/SDCARD/Roms/the_game_name.m3u`)
  4. you can manual create .m3u3 with set path to other game directory, it won't be clear when ReScan.
