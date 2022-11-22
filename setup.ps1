New-Item -Path . -Name "./bind9/var/cache/lib" -ItemType "directory"

$CWD=(Get-Location).Path

docker run -d `
--name bind9-container `
-e TZ=UTC `
-p 30053:53/tcp `
-p 30053:53/udp `
-p 30953:953/tcp `
-e BIND9_USER=bind `
-v "$CWD/bind9/etc/bind/named.conf.options:/etc/bind/named.conf.options" `
-v "$CWD/bind9/etc/bind/named.conf.default-zones:/etc/bind/named.conf.default-zones" `
-v "$CWD/bind9/var/cache/bind:/var/cache/bind" `
-v "$CWD/bind9/var/lib/bind:/var/lib/bind" `
ubuntu/bind9:latest

nslookup -port=30053 hcr.cloud-service 127.0.0.1