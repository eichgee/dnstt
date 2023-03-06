param(
    [string]$method_name
)

$src = "dnstt-client"
$NDK_ROOT = $Env:ANDROID_NDK_HOME+"\toolchains\llvm\prebuilt\windows-x86_64\bin"

function android_386{
    go env -u GOARM
    go env -w CGO_ENABLED=1 GOARCH=386 GOOS=android CC=$NDK_ROOT\i686-linux-android21-clang
    go build -v -o ../build/android_386/libdnstt.so -trimpath -ldflags "-s -w -buildid="
}

function android_amd64{
    go env -u GOARM
    go env -w CGO_ENABLED=1 GOARCH=amd64 GOOS=android CC=$NDK_ROOT\x86_64-linux-android21-clang
    go build -v -o ../build/android_amd64/libdnstt.so -trimpath -ldflags "-s -w -buildid="
}
function android_armv7{
    go env -u GOARM
    go env -w CGO_ENABLED=1 GOARCH=arm GOOS=android GOARM=7 CC=$NDK_ROOT\armv7a-linux-androideabi21-clang
    go build -v -o ../build/android_armv7/libdnstt.so -trimpath -ldflags "-s -w -buildid="
}

function android_armv8{
    go env -u GOARM
    go env -w CGO_ENABLED=1 GOARCH=arm64 GOOS=android CC=$NDK_ROOT\aarch64-linux-android21-clang
    go build -v -o ../build/android_armv8/libdnstt.so -trimpath -ldflags "-s -w -buildid="
}

function windows_386{
    go env -u GOARM
    go env -w GOARCH=386 GOOS=windows
    go build -v -o ../build/win_386/dnstt-client.exe -trimpath -ldflags "-s -w -buildid="
}

function windows_amd64{
    go env -u GOARM
    go env -w GOARCH=amd64 GOOS=windows
    go build -v -o ../build/win_amd64/dnstt-client.exe -trimpath -ldflags "-s -w -buildid="
}

if ($method_name -eq "win_386"){
    cd $src
    windows_386
	cd ..
 }elseif ($method_name -eq "win_amd64"){
    cd $src
    windows_amd64
	cd ..
 }elseif ($method_name -eq "win_all"){
    cd $src
    windows_386
    windows_amd64
	cd ..
 }elseif ($method_name -eq "android_386"){
    cd $src
    android_386
    cd ..
 }elseif ($method_name -eq "android_amd64"){
    cd $src
    android_amd64
    cd ..
 }elseif ($method_name -eq "android_armv7"){
    cd $src
    android_armv7
    cd ..
 }elseif ($method_name -eq "android_armv8"){
    cd $src
    android_armv8
    cd ..
 }elseif ($method_name -eq "android_all"){
    cd $src
    android_386
    android_amd64
    android_armv7
    android_armv8
    cd ..
 }