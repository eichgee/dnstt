param(
    [string]$method_name
)

$src = "dnstt-client"

function windows_386{
    go env -u GOARM
    go env -w GOARCH=386 GOOS=windows
    go build -v -o ../build/386/dnstt-client.exe -trimpath -ldflags "-s -w -buildid="
}

function windows_amd64{
    go env -u GOARM
    go env -w GOARCH=amd64 GOOS=windows
    go build -v -o ../build/amd64/dnstt-client.exe -trimpath -ldflags "-s -w -buildid="
}

if ($method_name -eq "386"){
    cd $src
    windows_386
	cd ..
 }elseif ($method_name -eq "amd64"){
    cd $src
    windows_amd64
	cd ..
 }elseif ($method_name -eq "all"){
    cd $src
    windows_386
    windows_amd64
	cd ..
 }