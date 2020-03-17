echo "Packing artifacts ..."

mkdir release
cd release
mkdir bin
mkdir include
mkdir lib
cd ..

xcopy *.h release\include
xcopy build\*.h release\include
copy build\libqt5keychain.dll release\bin\libqt5keychain.dll
copy build\libqt5keychain.dll.a release\lib\libqt5keychain.dll.a


cd release

if defined COMPILER_NAME (
  7z a qt5keychain-%COMPILER_NAME%.zip .
) else (
  7z a qt5keychain.zip .
)

cd ..