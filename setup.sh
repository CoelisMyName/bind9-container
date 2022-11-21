mkdir -p ~/bind9/etc/bind
sudo cp bind9/etc/bind/named.conf.options ~/bind9/etc/bind
sudo cp bind9/etc/bind/named.conf.default-zones ~/bind9/etc/bind
sudo cp bind9/etc/bind/db.subnet ~/bind9/etc/bind

docker run -d --name bind9-container \
-e TZ=UTC -p 53:53 ubuntu/bind9:latest \
-v ~/bind9/etc/bind/named.conf.options:/etc/bind/named.conf.options