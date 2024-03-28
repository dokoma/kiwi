# Kiwi Addon Collection for tsp

## 卡文件  (/mnt/SDCARD/*)

- 模拟器:  为避免官方冲突使用_K结尾, 可选择性隐藏

  | 目录         | 说明                                                         |
  | ------------ | ------------------------------------------------------------ |
  | Apps\PICO8_K | sa版, 需放入PICO8官方aarch64位binary才可用. 摘抄适配自 https://github.com/XK9274/pico-8-wrapper-miyoo 只有基本功能 加入了64位wget供联网 |
  | Emus\PICO8_K | 主屏幕入口 同Roms\PICO8\*.p8配合调用SA版                     |
  | Emus\GODOT | 主屏幕入口 同Roms\GODOT\*.pck 和可选的*.runtime *.png *.gptk 配合使用                     |
  | Emus\LOVE | 主屏幕入口 同Roms\LOVE\{,0.10.2\,0.9.2}*.zip *.love *.exe   默认目录下的使用11.5来运行, 配合可选的*.gptk 运行                  |

- 截图及查看:	

    | 目录                      | 说明                                                         |
    | ------------------------- | ------------------------------------------------------------ |
    | Emus\SCREENSHOT           | 看截图主屏幕入口 需要在配合下边的脚本                        |
    |                           | config.json 扩展功能：查看，将截图发送邮件给自己和指定人。   |
    | Roms\SCREENSHOT           | 图片列表目录 @tools/Scan4Files 刷新占位符列表(删除重新构建). 虽然支持2级目录但无法缩略图层次支持 必要性不大不推荐。 |
    |                           | 0000_SHOW浏览当前目录文件(show.elf),左右键选择,START键退出. TODO: 改改show.elf的文件名 并且加上标题和索引号显示。 保留左右键设定和退出按键提示。 |
    |                           | 其他默认用cmder打开, 不太好看,左右键选择，a键退出            |
    | Screenshots               | 截图存放目录 hardcoded                                       |
    | Kiwi\bin\screenshot       | 截图程序本体 L2+R2截图                                       |
    | ~~System\starts\snap.sh~~ | ~~截图程序自动启动脚本 试图增加 失败了 主UI启动时候会杀掉进程~~ |

- 工具脚本:

  | 目录       | 说明                                                         |
  | ---------- | ------------------------------------------------------------ |
  | Emus\TOOLS | 主屏幕入口. config.json 扩展功能：查看，编辑，将脚本发送邮件给自己和指定人。 |
  | Roms\TOOLS | 脚本实体 配合用                                              |

- PORTS:

  | 目录                   | 说明                                                         |
  | ---------------------- | ------------------------------------------------------------ |
  | Emus\PORTS\            | Ports游戏的主屏幕入口                                        |
  |                        | config.json 扩展功能：创建快捷方式到UDISK/Apps来放到应用中 ，游戏同名.png将作为显示图片 也可revoke回来。如果手动删除了的游戏需要自行删除快捷方式。 |
  |                        | 约定加载时guide.png自动加载,按b继续。也可用于先转黑屏等待，避免星露谷等长时间加载看上去主界面死机一样 |
  |                        | 增删游戏时可执行@tools/ReScan来刷新游戏列表，没有config.json的会自动生成 |
  | Roms\PORTS\            | Ports游戏的虚拟列表 提供扫描Vault中的游戏自动生成列表，避免一大堆乱七八糟 |
  | Vault\PORTS\           | Ports游戏的真正数据目录 前两者都是为了适应MainUI的游戏列表才做的 |
  | Vault\PORTS\PortMaster | 基本使用PortMaster的约定,只修改适配到launch脚本约定来适应MainUI和兼容link到Apps |

- 看图:

  | 目录           | 说明                                                         |
  | -------------- | ------------------------------------------------------------ |
  | Emus\PICS\     | 看图的主屏幕入口config.json  扩展功能：TODO: (不想做)设置为墙纸(png)  - [ ] TODO:(不想做,危险): 设置为开机LOGO(bmp) |
  | Roms\PICS\     | 图片占位符列表位，支持自己预览自己,  需要@tools/Rescan 提供扫描Vault中的图片自动生成假文件列表， 因为MainUI不支持图片文件名直接列 |
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
  | System\starts\mac.sh | 开机自动启动脚本 固定本机ip 参见来源 https://github.com/tGecko/TrimUI-Smart-Pro-resources |
  |                      |                                                              |

   


## kiwi环境
- 目录挂载

  | /mnt/SDCARD/ | 系统内      |                                  |
  | ------------ | ----------- | -------------------------------- |
  | Kiwi         | /kiwi       | adb时和调用时更统一便捷 全在后端 |
  | Vault        | /roms/ports | 为portmaster铺路                 |

- /kiwi目录说明 
  - [ ] /0 吃参数的公用ContextMenu
  - [ ] /1 包装的bin 只吃一个参数 供列表调用
  - [ ] /bin	常规无额外依赖或者可直接用的可执行文件 放PATH中更佳
    - [ ] curl-aarch64	取自https://github.com/moparisthebest/static-curl?tab=readme-ov-file
    - [ ] textviewer	看日志等文本文件用 imgui
    - [ ] text1		加载屏幕 放几个文字提示信息用
    - [ ] show.elf		可加载loader图 提示信息用  也可不加参数直接黑屏用作模拟响应
    - [ ] mail-att.sh	发送自己附件
    - [ ] mail2attach.sh	发送文件用
    - [ ] syncthing	服务 22000 UI端口8384 从tools里启动和关闭
  - [ ] /libs 系统增补库 常规放LD_LIBRARY_PATH中用
  - [ ] /logs 邮件发送日志等
  - [ ] /mine 用户自定义部分 按约定存放个性化信息 按Sample来定制 如SMTP存放发邮件用户信息
  - [ ] /cmder 被其他脚本调用的cmder 吃参数
  - [ ] /filebrowser	文件web访问, 服务 80端口 从tools里启动和关闭

- 部分源码/约定/命名和灵感 参考来源于Tomato/MinUI/Onion,还有Jelos/ArkOS和右手的改版. 部分二进制文件来源于EmuElec等各处散落的东西
- Special Thanks to Matfy:  the elegant design, creative ideas, passionate info collecting, and various testing
