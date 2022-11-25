$TTL	3600
cloud-service.com.	IN	SOA	cloud-service.com. root.cloud-service.com. (
			      1		; Serial
			   3600		; Refresh
			    600		; Retry
			  86400		; Expire
			  86400 )	; Negative Cache TTL

cloud-service.com.		IN	NS	cloud-service.com.
cloud-service.com.		IN	A	192.168.1.100
hcr.cloud-service.com.	IN	A	192.168.1.100
