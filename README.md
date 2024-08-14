# Kiwi Addon Collection for tsp

## 卡文件  (/mnt/SDCARD/*)

- MainUI Blocks: Emulator/Engine  add for an suffix:X for confilict with offical,  just hide the duplicates.

  | 目录         | 说明                                                         |
  | ------------ | ------------------------------------------------------------ |
  | Apps\PICO8_K | sa版, 需放入PICO8官方aarch64位binary才可用. 摘抄适配自 https://github.com/XK9274/pico-8-wrapper-miyoo 只有基本功能 加入了64位wget供联网 |
  | Emus\PICO8_K | 同Roms\PICO8\*.p8配合调用SA版                     |
  | Emus\GODOT |   同Roms\GODOT\*.pck 和可选的*.runtime *.png *.gptk 配合使用                     |
  | Emus\LOVE |   for love2d 同Roms\LOVE\{,0.10.2\,0.9.2}*.zip *.love *.exe   默认目录下的使用11.5来运行, 配合可选的*.gptk 运行                  |
  | Emus\TIC80 |   lr版本可用, but run sa with black screen |
  | Emus\EASYRPGX | for RPGMaker 2000/2003, lr/sa 版本可用 , zip仍是不太灵光 from: [easyrpg](https://github.com/EasyRPG/Player) |
  | Emus\RPGMAKER | for RPGMaker XP/VX/VXAce , refer to [readme](tree/main/Emus/RPGMAKER). compiled from: [mkxp](https://github.com/Ancurio/mkxp) [mkxp-z](https://github.com/mkxp-z/mkxp-z) |
  
- 截图及查看:	

    | 目录                               | 说明                                                         |
    | ---------------------------------- | ------------------------------------------------------------ |
    | Emus\SCREENSHOT                    | 看截图主屏幕入口 需要在配合下边的脚本                        |
    |                                    | config.json 扩展功能：查看，将截图发送邮件给自己和指定人。   |
    | Roms\SCREENSHOT                    | default show.elf,左右键选择,START键退出. TODO: 加上标题和索引号显示。 保留左右键设定和退出按键提示。 |
    |                                    | x-menu: cmder_view, ugly but works,左右键选择，a键退出       |
    | Screenshots                        | 截图存放目录 hardcoded                                       |
    | Kiwi\bin\screenshot                | 截图程序本体 L2+R2截图                                       |
    | System\starts\starts.screenshot.sh | 截图程序自动启动脚本                                         |

- 工具脚本:

  | 目录       | 说明                                                         |
  | ---------- | ------------------------------------------------------------ |
  | Emus\TOOLS | 主屏幕入口. config.json 扩展功能：查看，编辑，将脚本发送邮件给自己和指定人。 |
  | Roms\TOOLS | 脚本实体 配合用. TODO: add shortcuts or favorite somewhere                |

- PORTS:

  | 目录                   | 说明                                                         |
  | ---------------------- | ------------------------------------------------------------ |
  | Emus\PORTS\            | for ports: x-menu: create short cut to apps (UDISK/Apps) $GAMENAME.png will be icon. can be revoked。if game deleted after this, remove the link mannually |
  |                        | auto-load if available:$GAMENAME-guide.png, guide.png,loading.png ,scrennshot.jpg, /kiwi/icon/loading.png
  |                        | guide need press a to continue。也可用于先转黑屏等待，避免星露谷等长时间加载看上去主界面死机一样 |
  |                        | @tools/ReScan instead of menu-refresh-romlist, when add/remove game，auto-generate config.json(for Apps/Ports) |
  | Roms\PORTS\            | Ports游戏的m3u虚拟列表 提供扫描Vault中的游戏自动生成列表，避免一大堆乱七八糟, create manual.m3u3 will be kept.|
  | Vault\PORTS\           | Ports游戏的真正数据目录 前两者都是为了适应MainUI的游戏列表才做的 |
  | Vault\PORTS\PortMaster | 基本使用PortMaster的约定,只修改适配到launch脚本约定来适应MainUI和兼容link到Apps/Ports |

- 看图:

  | 目录           | 说明                                                         |
  | -------------- | ------------------------------------------------------------ |
  | Emus\PICS\     | 看图的主屏幕入口config.json  扩展功能：TODO: (不想做)设置为墙纸(png)  - [ ] TODO:(不想做,危险): 设置为开机LOGO(bmp) |
  | Vault\PICTURE\ | 图片存放位置，支持多级目录. 预览图受官方目录结构机制限制 只存放于第一层，但支持下基层同名文件。 |

- 看文本:

  | 目录        | 说明                                                         |
  | ----------- | ------------------------------------------------------------ |
  | Emu\TEXT\   | 看文本的主屏幕入口                                           |
  |             | config.json 扩展功能：查看，编辑，发送邮件给自己和指定人。 view with: cmder(默认),tv(适合小文件,小字体,英文) |
  | Vault\TEXT\ | 文本文件 只支持UTF8的                                        |

- 文件管理器:

  | 目录             | 说明                                                         |
  | ---------------- | ------------------------------------------------------------ |
  | Apps\DinguxCmder | 取自OdCommander 增加了参数调用文本/图片, 修订了部分适配，调整在tsp上的文字大小 |
  | Kiwi\cmder       | 环境调用版本 查看模式YB均可退出 编辑模式X出编辑菜单 自动保存 小心使用 |

- 其他:

  | 目录                 | 说明                                                         |
  | -------------------- | ------------------------------------------------------------ |
  | System/starts/mac.sh | 开机自动启动脚本 固定本机ip 参见来源 https://github.com/tGecko/TrimUI-Smart-Pro-resources |
  | Vault/{OTHER}        | SCUMMVM/DOS/TEXT/ real data for them, and the correspond ROMDIR for list clean|
  |                      |                                                              |

   


## kiwi环境
- 目录挂载

  | /mnt/SDCARD/ | 系统内      |                                  |
  | ------------ | ----------- | -------------------------------- |
  | Kiwi         | /kiwi       | backend only. with .profile , load when adb,make some convinient scripts/aliases , shell only |
  | Vault/PORTS  | /roms/ports | make path for portmaster                 |

- /kiwi目录说明 
  - [x] /0 吃参数的公用ContextMenu
  - [x] /1 包装的bin 只吃一个参数 供列表调用
  - [x] /bin	常规无额外依赖或者可直接用的可执行文件 放PATH中更佳
    - [x] curl-aarch64	取自https://github.com/moparisthebest/static-curl?tab=readme-ov-file
    - [x] textviewer	看日志等文本文件用 imgui
    - [x] text1		加载屏幕 放几个文字提示信息用
    - [x] show.elf		可加载loader图 提示信息用  也可不加参数直接黑屏用作模拟响应
    - [x] mail-att.sh	发送自己附件
    - [x] mail2attach.sh	发送文件用
    - [ ] syncthing	服务 22000 UI端口8384 从tools里启动和关闭 [syncthing](https://github.com/syncthing/syncthing)
  - [ ] icon/bin 图标设置脚本 
  - [x] /libs 系统增补库 常规放LD_LIBRARY_PATH中用
  - [x] /logs 邮件发送日志等
  - [x] /mine 用户自定义部分 按约定存放个性化信息 按Sample来定制 如SMTP存放发邮件用户信息, ENV for other user defined varibles or overrides the default.
  - [x] /cmder 被其他脚本调用的cmder 吃参数 --loadfile --loadmode rw(textonly)
  - [ ] /filebrowser	文件web访问, 服务 80端口 从tools里启动和关闭 取自[filebrowser](https://github.com/filebrowser/filebrowser) 

## Credit

- 很多东西取自 Portmaster ，kloptops和Cebion非常慷慨，做了很牛的社区，受益良多。
- 部分源码/约定/命名和灵感 参考来源于Tomato/MinUI/Onion,还有Jelos/ArkOS和右手的改版. 部分二进制文件来源于EmuElec等各处散落的东西
- Special Thanks to Mafty:  the elegant design, creative ideas, passionate info collecting, and various testing. He gave kiwi a name.
