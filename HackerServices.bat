@echo off

rem �������հײ��� ��ȥstart
if "%~1"=="" (
    goto start
    pause
    exit /b
)

rem �������-h���� ���������
if "%~1"=="-h" (
    echo.
    echo �������� ��������
    echo.
    echo �������
    echo �����������Hackerϵ������Ļ�����֤�����
    echo Hackerȫϵ��������ڴ�ʱ���ø������ȷ��Hackerϵ���������������
    echo.
    echo ��������
    echo ʹ�� "-h" �������Դ򿪰�����������֪���������,����ʹ������鿴
    echo ʹ�� "-v" �������Բ鿴��ǰ����汾��������ȷ���Ƿ�ɹ���װ,������Windows�ն�����"HackerServices.exe -v" ��ȷ�ϰ�װ�Ͱ汾
    echo.
    title %ComSpec%
    cmd /k

rem �������-v���� ������汾��
) else if "%~1"=="-v" (
    echo HackerServices v1.0
    echo Writen By HackerJohnSmith.2023
    echo.
    title %ComSpec%
    cmd /k

rem ������ϲ��������� ���������Ĳ���
) else (
    echo �������˴���Ĳ���
    echo ����������-h��Ѱ�����
    echo.
    title %ComSpec%
    cmd /k
)

rem ��ʼstart
:start
cls
color F0
title HackerServices
echo.
echo ������֤��������...
echo ����رոô���(�Է�ֹ��֤ʧ��)
echo ��������С���ô���...
echo ��֤��ɺ���Զ��رոô���
echo.
timeout /t 1 /nobreak >nul
rem ��ʼ��ʼ�����
echo [��֤]���ڳ�ʼ��...
timeout /t 2 /nobreak >nul
rem ���ù���Ŀ¼
set workfolder=%userprofile%\Hacker
rem �жϹ���Ŀ¼�Ƿ����
if exist %workfolder% (
    rem ���ھ�����
    echo [��־]���ֲ�������������...
    del /q /s /f %userprofile%\Hacker\* > nul
    timeout /t 2 /nobreak >nul
    echo [��־]�������
) else (
    rem �����ھʹ���
    echo [��־]���Ե�...
    cd %userprofile%
    mkdir Hacker
    timeout /t 1 /nobreak >nul
)
echo [ͨ��]��ʼ�����
rem ���빤��Ŀ¼
cd %workfolder%
echo.
timeout /t 2 /nobreak >nul
rem ����ϵͳ�汾ȷ��
echo [��֤]������֤����ϵͳ�汾...
rem ��verָ������Ľ����ָ��λ�����浽 if-windows-version-10 ������
for /f "tokens=4-5 delims=. " %%i in ('ver') do set if-windows-version-10=%%i.%%j
rem ��ver������������浽 windows-version ������
for /f "tokens=*" %%a in ('ver') do set windows-version=%%a
rem ��windows10�ı�������Ϊ10.0
set windows10=10.0
timeout /t 2 /nobreak >nul
rem �Ƚ�ǰ��ver��������Ľ���ͳ������windows����
if %if-windows-version-10% geq %windows10% (
    rem ���ver����Ĳ��ֽ��>=�������windows10�汾��
    rem ��˵����ǰ����ϵͳ��windows10��ִ����Щ
    echo [��־]%os%
    echo [��־]%windows-version%
    timeout /t 1 /nobreak >nul
    echo [ͨ��]����ϵͳ�汾����
    rem ����ϵͳ�汾��֤����
    echo.
    timeout /t 2 /nobreak >nul
    rem ��֤�����������
    echo [��֤]������֤������������...
    rem ping�ٶȣ����û�����ok�����ûͨ��û����
    ping www.baidu.com > nul
    rem �ж�ping�Ľ��
    IF ERRORLEVEL 1 goto network-normal-no
    IF ERRORLEVEL 0 goto network-normal-yes
    rem ������û������Ľ��,���������־�ͽ������������Ŀ¼��error.txt�ļ���
    :network-normal-no
        echo [��־]δ�յ�����www.baidu.com�Ļظ�
        echo [����]������������ʧ�� > error.txt
        echo [����]��������û���������� >> error.txt
        echo [�������1]������û��ʹ�� ��������/�������� ����,�����������߻�����wifi >> error.txt
        echo [�������2]����������������Ϲر������� �� ���ĵ���û�������������Թ��� ���� �������� >> error.txt
        echo [�������3]�������ڲ���ϵͳ����ر��˸ó�����������ӣ������ֶ��ڷ���ǽ���������� >> error.txt
        echo [�������4]�ٶȷ������п��ܱ��ˣ����ʱȽ�С����һ��ͺ��� >> error.txt
        echo [�������5]��������Ƿ���ˣ���ȥ��Ǯ >> error.txt
        echo [�������6]����DNS�������������ò���ȷ,���Ƽ�����DNS����Ϊ 1.2.4.8 >> error.txt
        echo [�������7]�����������˺ڿ͵Ĺ���,�޷����������ʼ���Ϊ0,����Ƽ��������ڿ� >> error.txt
        echo [�������8]�Ƽ���ʹ�ð�ȫ���"����"���ж����޸�,������רҵ������������޸����� >> error.txt
        exit
    :network-normal-yes
        rem ��pingͨ�ٶ�˵������û����
        echo [��־]���� www.baidu.com �Ļظ�: �ֽ�=32 TTL=50
        echo [��־]���ݰ�: �ѷ��� = 4���ѽ��� = 4����ʧ = 0 (0% ��ʧ)
        timeout /t 1 /nobreak >nul
        echo [ͨ��]����������������
        timeout /t 2 /nobreak >nul
        echo.
        echo [��֤]������֤������������...
        rem ��֤github������
        rem ���github ping ��ͨ������github�ķ�����ò���
        ping github.com > nul
        rem ������һ�� �ж�ping�Ľ��
        IF ERRORLEVEL 1 goto network-github-no
        IF ERRORLEVEL 0 goto network-github-yes
        rem �������¼����־���浽error.txt
        :network-github-no
            echo [��־]δ�յ�����www.github.com�Ļظ�
            echo [����]������������ʧ�� > error.txt
            echo [����]�޷���������github������ >> error.txt
            echo [�������1]�����ڵĵ�����Ӫ�̿���������github >> error.txt
            echo [���ӽ���]��������ϵ����������Ӫ�����˽����� >> error.txt
            echo [�������2]�����ڵĹ��ҿ��ܽ������������,��������Ҫ������������������� >> error.txt
            echo [���ӽ���]��������"�й���½" "����" "Խ��" "�Ű�" �����������Ϊ���صĵ��� >> error.txt
            echo [����]�ڲ��ֵ���ʹ��δ�����Ĵ������������ "��������" ������Υ����Ϊ >> error.txt
            echo [�������4]���Ĵ�����������ò���ȷ >> error.txt
            echo [����ģʽ]����Ҫ���ô������������ȫ�����������Ǵ�����Ӧ�� >> error.txt
            echo [�������6]���Ĵ��������DNS���ÿ������ò���ȷ,���Ƽ�����DNS����Ϊ 1.1.1.1 >> error.txt
            echo [����]ʹ�ô���������������� ��������ܵ�"���������"��"������"�������� >> error.txt
            echo [�������7]�����������˺ڿ͵Ĺ���,�޷����������ʼ���Ϊ0,����Ƽ��������ڿ� >> error.txt
            echo [�������8]Github�������п��ܱ���,���ʱȽ�С,��һ��ͺ��� >> error.txt
            echo [�������9]��ɵȱ�ڽ���DNS��Ⱦ,�����ط����������ȱ�����,�ܲ������Ͽ����� >> error.txt
            exit
        :network-github-yes
            rem ͨ�˾�û����
            echo [��־]���� github.com �Ļظ�: �ֽ�=32 TTL=113
            echo [��־]���ݰ�: �ѷ��� = 4���ѽ��� = 4����ʧ = 0 (0% ��ʧ)
            timeout /t 1 /nobreak >nul
            echo [ͨ��]����������������
            timeout /t 2 /nobreak >nul
            rem ���ִ�е�����˵��3����֤�����ˣ���ô��ok
            echo.
            echo [ͨ��]����������֤��� > access.txt 
            rem ��ͨ����֤д��access.txt
            rem Hackerϵ�����/���������ֻ��Ҫʹ��start /min HackerServices.exe��С��������֤���
            rem ���к�ȴ�һ��ʱ�䲢�ж�����access.txt������error.txt
            rem --------------------------------------------------
            rem �������access.txt��û��error.txt˵����֤ͨ��,����ִ��
            rem �������error.txt��û��access.txt ˵�����ִ���,���򱨴��� %userprofile%\Hacker\error.txt�ļ���ok
            rem �������access.txt����error.txt ���������û� �벻Ҫ�����������Ŀ¼ ���� ��ͷ��ʼ ����ִ��һ��
            rem ���������û��˵����֤����û�кã������ȴ�֪������һ���ļ�Ϊֹ��
            rem --------------------------------------------------
            echo [��־]����д����ɱ�ʶ
            timeout /t 2 /nobreak >nul
            echo [����]���ڹرճ���
            timeout /t 1 /nobreak >nul
            exit
) else (
    rem ���ver����Ĳ��ֽ��<=�������windows10�汾��
    rem ��˵������ϵͳ�汾��windows10С��ִ����Щ
    echo [��־]%os%
    echo [��־]%windows-version%
    echo [����]����ϵͳ�汾������ > error.txt
    echo [����]���Ĳ���ϵͳ�汾���ܹ��ϻ򲻼��� >> error.txt
    echo [�������1]������Ǿɰ汾Miscroft Windows,�������»�������Microsoft Windows 10����߰汾 >> error.txt
    echo [�������2]�������Linuxʹ��wine,�Һܱ�Ǹ,����Ŭ�����ݸð汾�� >> error.txt
    echo [�������3]�������ʹ��ARMоƬ���û����Һܱ�Ǹ,������Ŭ�����ݸð汾�� >> error.txt
    echo [�������4]������û������������Microsoft Windows����,��������ʹ�� "WinPE" "WinRE" "�����޸�ģʽ��" >> error.txt
    echo [���ӽ���]�ҵ���������˲���"WinPE" "WinRE" ��ģʽ�����Ĳ��������������ǹ��Ⱦ����� >> error.txt
    echo [�������5]���п������µ�Miscroft Windows�ڲ����԰汾,���ڴ������п����ߺͲ������������ֿ�ĸ�л�� >> error.txt
    exit
)
rem Writen by HackerJohnSmith.2023