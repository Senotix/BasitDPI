@ECHO OFF
title GoodbyeDPI Turkiye - Engelleri Kaldir!
PUSHD "%~dp0\data_klasor"

:: Baslangic mesaji
echo --------------------------------------------------
echo    GoodbyeDPI Turkiye baslatiliyor...
echo    DPI ve sansur engeli kaldiriliyor...
echo --------------------------------------------------
echo.

:: Yonetici yetkisi kontrolu
net session >nul 2>&1
IF %errorLevel% NEQ 0 (
    echo [!] Lutfen bu dosyayi **Yonetici olarak calistirin!**
    pause
    exit
)

:: GoodbyeDPI'yi baslat (Turkiye icin optimize edilmis parametrelerle)
echo [*] GoodbyeDPI baslatiliyor...
start "" goodbyedpi.exe -5 --set-ttl 5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253

echo.
echo GoodbyeDPI AKTIF! Engellenmis siteleri test edin.
echo  Kapatmak icin bu pencereyi kapatin.
echo.

:: Sonlandirma mesaji
POPD
pause
exit
