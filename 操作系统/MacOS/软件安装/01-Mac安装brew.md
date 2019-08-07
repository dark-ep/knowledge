# 安装 Homebrew

## 安装软件

1.  Homebrew概述

    Homebrew是一款Mac OS上的软件包管理工具，通过它可以很方便的安装/卸载软件工具等，类似于Linux下的apt-get，node的npm等包管理工具。<br>

    Homebrew将工具安装在自己创建的/usr/local/Cellar目录下，并在/usr/local/bin建立这些工具的符号链接。<br>

    > [Homebrew官网][中文官网]

2.  安装brew

    a.  安装xcode

    > 下载地址：https://developer.apple.com/download/more/

    ![第2步](images/01_2_1.png)<br>

    b.  打开终端，执行下面的命令。

    ```ruby
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

3.  使用命令

    a.  通用类

    | 命令                                     | 说明                   |
    | ---------------------------------------- | ---------------------- |
    | brew search [TEXT\|/REGEX/]              | 搜索软件               |
    | brew (info\|home\|options)  [FORMULA...] | 查询软件信息           |
    | brew install FORMULA...                  | 安装软件               |
    | brew update                              | 更新brew和所有软件包   |
    | brew upgrade [FORMULA...]                | 更新软件包             |
    | brew uninstall FORMULA...                | 卸载软件包             |
    | brew list [FORMULA...]                   | 罗列所有已安装的软件包 |
    | brew outdated                            | 查看哪些软件包需要更新 |
    | brew deps FORMULA                        | 显示包依赖             |

    b.  帮助类

    | 命令                | 说明                                         |
    | ------------------- | -------------------------------------------- |
    | man brew            | 查询brew命令的使用手册                       |
    | brew help [COMMAND] | 查询brew子命令的使用帮助，如brew help search |

    c.  排查类

    | 命令                     | 说明                                    |
    | ------------------------ | --------------------------------------- |
    | brew config              | 查看brew的全局配置                      |
    | brew doctor              | 检查系统的潜在问题                      |
    | brew install -vd FORMULA | 安装软件包打印详细信息，并开启debug功能 |

    d.  开发者类

    | 命令                           | 说明           |
    | ------------------------------ | -------------- |
    | brew create [URL [--no-fetch]] | 创建软件包     |
    | brew edit [FORMULA...]         | 编辑软件包源码 |

    > 更多命令使用查看文档：https://docs.brew.sh/Formula-Cookbook.html.

4.  卸载brew

    a.  打开终端，执行下面的命令。

    ```ruby
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    ```

5.  推荐软件包
    - coreutils
    - openssl
    - xz
    - wget
    - lrzsz

6.  替换源为中科大源

    a.  替换brew.git

    ```shell
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
    ```

    b.  替换homebrew-core.git

    ```shell
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
    cd ~
    brew update
    ```

    c.  替换Homebrew Bottles源
    > Homebrew是OS X系统的一款开源的包管理器。出于节省时间的考虑，Homebrew默认从Homebrew Bottles源中下载二进制代码包安装。Homebrew Bottles是Homebrew提供的二进制代码包，目前镜像站收录了以下仓库：<br>
    > homebrew/homebrew-core<br>
    > homebrew/homebrew-dupes<br>
    > homebrew/homebrew-games<br>
    > homebrew/homebrew-gui<br>
    > homebrew/homebrew-python<br>
    > homebrew/homebrew-php<br>
    > homebrew/homebrew-science<br>
    > homebrew/homebrew-versions<br>
    > homebrew/homebrew-x11<br>

    ```shell
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
    source ~/.zshrc
    ```

[中文官网]: https://brew.sh/index_zh-cn