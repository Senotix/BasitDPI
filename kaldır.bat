@ECHO OFF
title BasitDPI Turkiye - Kaldirma Islemi
PUSHD "%~dp0\data_klasor"

echo --------------------------------------------------
echo    BasitDPI kaldirma islemine hosgeldiniz.
echo --------------------------------------------------
echo.

:: Yonetici yetkisi kontrolu
net session >nul 2>&1
IF %errorLevel% NEQ 0 (
    echo [!] Lutfen bu dosyayi **Yonetici olarak calistirin!**
    pause
    POPD
    exit
)

echo [*] BasitDPI ile ilgili servisler ve dosyalar kaldiriliyor...

:: BasitDPI ile iliskili servisleri durdur ve sil
sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1

sc stop "WinDivert" >nul 2>&1
sc delete "WinDivert" >nul 2>&1

sc stop "WinDivert14" >nul 2>&1
sc delete "WinDivert14" >nul 2>&1

:: Arka planda calisan uygulamalari sonlandir
taskkill /F /IM goodbyedpi.exe >nul 2>&1
taskkill /F /IM WinDivert64.sys >nul 2>&1
taskkill /F /IM WinDivert32.sys >nul 2>&1

echo.
echo [+] BasitDPI ve bagli servisler kaldirildi.
echo    Gerekirse "data_klasor" klasorunu manuel silebilirsiniz.
echo    Bilgisayarinizi yeniden baslatmaniz tavsiye edilir.
echo.
POPD
pause
exit
