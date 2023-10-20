# HackerServices
The basic service of Hacker 黑客基础服务

### 软件简介
该软件名称为HackerServices.中文名为黑客服务。顾名思义,该软件是用于Hacker系列软件的基础服务软件。绝大多数的Hacker系列软件都需要该软件。如您想要使用Hacker系列的软件，您需要先安装该软件以实现对Hacker系列软件的正常使用。

### 软件安装
Microsoft Windows 10/11 : 
点我访问下载链接https://github.com/hackerjohnsmith/HackerServices/releases，点击Assets将它展开，点击HackerServices.exe 等待下载完成。
下载完成后打开电脑的文件资源管理器。将下载的文件复制到C:\Windows\System32下，复制成功就算安装完成，无需手动运行该软件。
(*注1 : 如您没有更改过相关系统设置，下载完成后默认的文件在您的"下载"文件夹中)
(*注2 : 如您正在使用WindowsPE,WindowsRE等特殊环境，请将该文件复制到您的操作环境系统分区的Windows\System32下)

Linux :
打开终端，输入以下命令 : 
cd /home/$(whoami)/desktop
mkdir Hacker
cd Hacker
sudo apt install git
git clone https://github.com/hackerjohnsmith/HackerServices.git
sudo apt-get install wine
winecfg
wine HackerServices.exe
(*注1 : 安装代码默认在apt包管理器下运行。如您不是apt包管理器, 请您查询教程手动安装git和wine)
(*附加解释 : Linux下软件运用的是Wine运行 Windows 应用的兼容层实现的运行效果)
(*注2 : 请尽量使用windows运行软件,我们无法确认您的操作系统版本是否完全兼容)

### 使用教程
该软件为服务类软件，将其复制到您操作系统分区下的Windows\System32文件夹下就算安装成功。不需要手动运行。
Hacker系列软件会在启用时最小化调用该软件，调用后软件默认会在任务栏最小化显示。您可以在认证进行时，在任务栏点开该软件可以查看。
除了手动双击打开进行验证意外，您可以在终端执行 "HackerServices.exe -h" 进行查看帮助。
终端参数:
-h	查看帮助
-v	查看版本

### 兼容性 & 可用性
已验证作系统 : 	Microsoft Windows 10
				Microsoft Windows 11
兼容操作系统 : 	Microsoft Windows Pocket Edition
				Microsoft Windows Recovery Edition
未验证操作系统 : 	Linux
				MacOS
				Windows Server 2022以下版本(包括Server 2022)
错误的操作系统 : 	Microsoft Windows 8.1
				Microsoft Windows 8
				Microsoft Windows 7
				Microsoft Windows Vista
				Microsoft Windows Longhorn
				Microsoft Windows Fundamentals for Legacy PCs
				Microsoft Windows XP
				Microsoft Windows Me
				Microsoft Windows 2000
				Microsoft Windows 98
				Microsoft Windows NT 4.0 以下版本(包括NT 4.0)
				Windows 95
				Microsoft Windows For Workgroups 3.11以下版本(包括3.11)
				Windows 3.2以下版本(包括3.2)
				MS-DOS全版本
(*注:如您运行软件出现兼容性问题,可以尝试运行bat脚本。软件是通过bat脚本转换来的)
(*注:软件默认为32位 即x86 如您想要16位或64位或其他，请您手动转换exe或直接运行bat脚本)

### 原理讲解
该软件会在启动时自动读取参数,读取到空参数或双击启动时，则开启系统验证。若读取到类似 “-h" "-v" 之类的参数则执行对应脚本
开启系统验证后，先读取%userprofile%, 确定系统所在当前用户的目录位置(因为有可能部分PE或RE环境可能不是在C盘，而是在X盘之类的位置)
所以读取位置，并将工作目录设置成%userprofile%目录下的Hacker文件夹，如果不存在，创建。存在，就删除文件夹下的所有内容。
(因为在通过验证后会写入access.txt, 为了防止上次验证文件继续通过或用户手动创建access.txt跳过验证)
接下来完成后通过ver指令的返回值进行判断是否>=Windows10，是则继续执行，否则输出error.txt，并将解决方案输出到error.txt中
接下来ping 百度和谷歌通过输出的errorleavel 来确认网络连接，ok则完成验证输出access.txt。否则输出error.txt, 并将解决方案输出到error.txt中

### 第三方开发教程
作为验证软件的开发 : 
如您的软件需要验证,且您不介意使用的我的软件服务。
您可以让用户在安装时将该软件安装进入Windows系统盘的system32文件下。
您只需要在您需要验证时,使用start /min HackerServices.exe 然后让您的程序等待约30秒
判断系统盘下当前用户目录根目录下是否有Hacker文件夹下的access.txt 有代表通过,软件放行。
判断系统盘下当前用户目录根目录下是否有Hacker文件夹下的error.txt 有代表失败,软件可以直接打开error.txt里面有报错信息。您的软件也可以读取error.txt里的报错信息输出。
判断系统盘下当前用户目录根目录下是否有Hacker文件夹下是否同时有这两个文件 都有则输出消息 "歪,别乱动验证文件啊喂"
判断系统盘下当前用户目录根目录下是否有Hacker文件夹下是否两个都没有 都没有则代表验证还没结束 重新等待10-30秒
如果等待了1分钟还没出来,则代表软件出BUG了或者出现了奇怪的问题,则输出 "基础服务验证失败,您可能没有安装基础服务软件或基础服务软件出BUG了"

作为私人验证库的开发 : 
您可以根据上文 "作为验证软件的开发" 进行参考,然后修改。请注意遵守LGPL2.1开源协议进行更改。

### 部署教程
使用git将项目git clone后更改上传,项目文件夹中HackerServices.bat是软件源代码。HackerServices.exe是软件本体。LICENSE是开源协议文件。README.md是解释文档。

### 开源协议与开发尊重
该软件是使用用LGPL2.1开源协议.请用户/第三方开发者尊重/理解开源协议。开源协议具有法律效应!
请您尊重开发者,请根据开源协议进行更改。请勿随意删除或更改版权信息。
在此感谢所有的开源软件开发者 与 参与软件开发修改的大佬 或 提供BUG的大佬。谢谢各位!
@HackerJohnSmith.2023 CopyLeft by HackerJohnSmith.