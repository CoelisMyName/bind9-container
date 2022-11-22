# rm -rf ~/bind9
# mkdir -p ~/bind9/etc/bind
# mkdir -p ~/bind9/var/cache/bind
# mkdir -p ~/bind9/var/lib/bind

# cp bind9/etc/bind/named.conf.options ~/bind9/etc/bind
# cp bind9/etc/bind/named.conf.default-zones ~/bind9/etc/bind
# cp bind9/var/lib/bind/db.* ~/bind9/var/lib/bind

# sudo chmod 777 ~/bind9/var/cache/bind

mkdir -p ./bind9/var/cache/bind

docker run -d \
--name bind9-container \
-e TZ=UTC \
-p 30053:53/tcp \
-p 30053:53/udp \
-p 30953:953/tcp \
-e BIND9_USER=bind \
-v ./bind9/etc/bind/named.conf.options:/etc/bind/named.conf.options \
-v ./bind9/etc/bind/named.conf.default-zones:/etc/bind/named.conf.default-zones \
-v ./bind9/var/cache/bind:/var/cache/bind \
-v ./bind9/var/lib/bind:/var/lib/bind \
ubuntu/bind9:latest

nslookup -port=30053 hcr.cloud-service 127.0.0.1