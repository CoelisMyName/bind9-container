sudo cp bind9/etc/bind/named.conf.options /etc/bind
sudo cp bind9/etc/bind/named.conf.default-zones /etc/bind
sudo cp bind9/var/lib/bind/db.* /var/lib/bind
sudo named-checkconf