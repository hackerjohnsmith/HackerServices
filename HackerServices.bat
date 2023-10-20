@echo off

rem 如果输入空白参数 则去start
if "%~1"=="" (
    goto start
    pause
    exit /b
)

rem 如果输入-h参数 则输出帮助
if "%~1"=="-h" (
    echo.
    echo 基础帮助 参数介绍
    echo.
    echo 软件介绍
    echo 该软件是用于Hacker系列软件的基础验证软件。
    echo Hacker全系软件都会在打开时调用该软件以确保Hacker系列软件的正常运行
    echo.
    echo 参数介绍
    echo 使用 "-h" 参数可以打开帮助。如您不知道上面参数,可以使用这个查看
    echo 使用 "-v" 参数可以查看当前软件版本。如您不确定是否成功安装,可以在Windows终端输入"HackerServices.exe -v" 已确认安装和版本
    echo.
    title %ComSpec%
    cmd /k

rem 如果输入-v参数 则输出版本号
) else if "%~1"=="-v" (
    echo HackerServices v1.0
    echo Writen By HackerJohnSmith.2023
    echo.
    title %ComSpec%
    cmd /k

rem 如果以上参数都不是 则输出错误的参数
) else (
    echo 您输入了错误的参数
    echo 您可以输入-h来寻求帮助
    echo.
    title %ComSpec%
    cmd /k
)

rem 开始start
:start
cls
color F0
title HackerServices
echo.
echo 正在验证基础服务...
echo 请勿关闭该窗口(以防止验证失败)
echo 您可以最小化该窗口...
echo 验证完成后会自动关闭该窗口
echo.
timeout /t 1 /nobreak >nul
rem 开始初始化软件
echo [验证]正在初始化...
timeout /t 2 /nobreak >nul
rem 设置工作目录
set workfolder=%userprofile%\Hacker
rem 判断工作目录是否存在
if exist %workfolder% (
    rem 存在就清理
    echo [日志]发现残留，正在清理...
    del /q /s /f %userprofile%\Hacker\* > nul
    timeout /t 2 /nobreak >nul
    echo [日志]清理完成
) else (
    rem 不存在就创建
    echo [日志]请稍等...
    cd %userprofile%
    mkdir Hacker
    timeout /t 1 /nobreak >nul
)
echo [通过]初始化完成
rem 进入工作目录
cd %workfolder%
echo.
timeout /t 2 /nobreak >nul
rem 操作系统版本确认
echo [验证]正在验证操作系统版本...
rem 将ver指令输出的结果的指定位数保存到 if-windows-version-10 变量上
for /f "tokens=4-5 delims=. " %%i in ('ver') do set if-windows-version-10=%%i.%%j
rem 将ver的完整结果保存到 windows-version 变量上
for /f "tokens=*" %%a in ('ver') do set windows-version=%%a
rem 将windows10的变量定义为10.0
set windows10=10.0
timeout /t 2 /nobreak >nul
rem 比较前面ver部分输出的结果和程序定义的windows数字
if %if-windows-version-10% geq %windows10% (
    rem 如果ver输出的部分结果>=程序定义的windows10版本号
    rem 则说明当前操作系统比windows10大，执行这些
    echo [日志]%os%
    echo [日志]%windows-version%
    timeout /t 1 /nobreak >nul
    echo [通过]操作系统版本正常
    rem 操作系统版本验证结束
    echo.
    timeout /t 2 /nobreak >nul
    rem 验证基础网络服务
    echo [验证]正在验证基础网络连接...
    rem ping百度，如果没问题就ok，如果没通就没网络
    ping www.baidu.com > nul
    rem 判断ping的结果
    IF ERRORLEVEL 1 goto network-normal-no
    IF ERRORLEVEL 0 goto network-normal-yes
    rem 这里是没有网络的结果,保存错误日志和解决方法到功做目录的error.txt文件里
    :network-normal-no
        echo [日志]未收到来自www.baidu.com的回复
        echo [错误]基础网络连接失败 > error.txt
        echo [问题]您的网络没有正常连接 >> error.txt
        echo [解决方案1]您可能没有使用 有线网络/无线网络 上网,请您插入网线或连接wifi >> error.txt
        echo [解决方案2]您可能在物理层面上关闭了网卡 或 您的电脑没有网卡。您可以购买 网卡 进行上网 >> error.txt
        echo [解决方案3]您可能在操作系统层面关闭了该程序的网络连接，请您手动在防火墙设置允许方向 >> error.txt
        echo [解决方案4]百度服务器有可能崩了，概率比较小，等一会就好了 >> error.txt
        echo [解决方案5]您的网费欠费了，快去交钱 >> error.txt
        echo [解决方案6]您的DNS服务器可能设置不正确,我推荐您将DNS设置为 1.2.4.8 >> error.txt
        echo [解决方案7]您可能遭受了黑客的攻击,无法联网。概率几乎为0,这边推荐您打死黑客 >> error.txt
        echo [解决方案8]推荐您使用安全软件"火绒"进行断网修复,或者找专业计算机从事着修复网络 >> error.txt
        exit
    :network-normal-yes
        rem 能ping通百度说明网络没问题
        echo [日志]来自 www.baidu.com 的回复: 字节=32 TTL=50
        echo [日志]数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)
        timeout /t 1 /nobreak >nul
        echo [通过]基础网络连接正常
        timeout /t 2 /nobreak >nul
        echo.
        echo [验证]正在验证服务网络连接...
        rem 验证github的网络
        rem 如果github ping 不通，依赖github的服务就用不了
        ping github.com > nul
        rem 和上面一样 判断ping的结果
        IF ERRORLEVEL 1 goto network-github-no
        IF ERRORLEVEL 0 goto network-github-yes
        rem 将错误记录和日志保存到error.txt
        :network-github-no
            echo [日志]未收到来自www.github.com的回复
            echo [错误]服务网络连接失败 > error.txt
            echo [问题]无法正常连接github服务器 >> error.txt
            echo [解决方案1]您所在的地区运营商可能屏蔽了github >> error.txt
            echo [附加解释]您可以联系您的网络运营商以了解详情 >> error.txt
            echo [解决方案2]您所在的国家可能进行了网络封锁,您可能需要代理服务器已正常上网 >> error.txt
            echo [附加解释]您可能在"中国大陆" "朝鲜" "越南" "古巴" 等网络封锁较为严重的地区 >> error.txt
            echo [警告]在部分地区使用未经审查的代理服务器进行 "国际联网" 可能是违法行为 >> error.txt
            echo [解决方案4]您的代理服务器配置不正确 >> error.txt
            echo [附加模式]您需要配置代理服务器开启全局上网而不是代理单个应用 >> error.txt
            echo [解决方案6]您的代理服务器DNS配置可能设置不正确,我推荐您将DNS设置为 1.1.1.1 >> error.txt
            echo [警告]使用代理服务器进行上网 网络可能受到"代理服务器"的"服务商"的网络监控 >> error.txt
            echo [解决方案7]您可能遭受了黑客的攻击,无法联网。概率几乎为0,这边推荐您打死黑客 >> error.txt
            echo [解决方案8]Github服务器有可能崩了,概率比较小,等一会就好了 >> error.txt
            echo [解决方案9]有傻缺在进行DNS污染,换个地方，坐下来喝杯咖啡,能不能连上看命了 >> error.txt
            exit
        :network-github-yes
            rem 通了就没问题
            echo [日志]来自 github.com 的回复: 字节=32 TTL=113
            echo [日志]数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)
            timeout /t 1 /nobreak >nul
            echo [通过]服务网络连接正常
            timeout /t 2 /nobreak >nul
            rem 如果执行到这里说明3个验证都过了，那么就ok
            echo.
            echo [通过]基础服务验证完成 > access.txt 
            rem 将通过验证写入access.txt
            rem Hacker系列软件/第三方软件只需要使用start /min HackerServices.exe最小化运行验证软件
            rem 运行后等待一定时间并判断是有access.txt还是有error.txt
            rem --------------------------------------------------
            rem 如果是有access.txt且没有error.txt说明认证通过,继续执行
            rem 如果是有error.txt且没有access.txt 说明发现错误,程序报错并打开 %userprofile%\Hacker\error.txt文件就ok
            rem 如果既有access.txt又有error.txt 程序提醒用户 请不要更改软件运行目录 并且 从头开始 重新执行一遍
            rem 如果两个都没有说明验证程序没有好，继续等待知道出现一个文件为止。
            rem --------------------------------------------------
            echo [日志]正在写入完成标识
            timeout /t 2 /nobreak >nul
            echo [结束]正在关闭程序
            timeout /t 1 /nobreak >nul
            exit
) else (
    rem 如果ver输出的部分结果<=程序定义的windows10版本号
    rem 则说明操作系统版本比windows10小，执行这些
    echo [日志]%os%
    echo [日志]%windows-version%
    echo [错误]操作系统版本不兼容 > error.txt
    echo [问题]您的操作系统版本可能过老或不兼容 >> error.txt
    echo [解决方案1]如果您是旧版本Miscroft Windows,请您更新或升级到Microsoft Windows 10或更高版本 >> error.txt
    echo [解决方案2]如果您是Linux使用wine,我很抱歉,我在努力兼容该版本。 >> error.txt
    echo [解决方案3]如果您是使用ARM芯片的用户，我很抱歉,我正在努力兼容该版本。 >> error.txt
    echo [解决方案4]您可能没有在用正常的Microsoft Windows环境,如您正在使用 "WinPE" "WinRE" "启动修复模式等" >> error.txt
    echo [附加解释]我的软件兼容了部分"WinPE" "WinRE" 等模式，您的不正常环境可能是过度精简导致 >> error.txt
    echo [解决方案5]您有可能是新的Miscroft Windows内部测试版本,我在此向所有开发者和测试者致以最诚挚的感谢。 >> error.txt
    exit
)
rem Writen by HackerJohnSmith.2023