$TTL 3600
@		IN	SOA	ns1.example.com. hostmaster.example.com. (
				__SERIAL__	;serial
				10800		;refresh
				3600		;retry
				604800		;expire
				600 )		;negative cache

@		IN	NS	ns1.example.com.
@		IN	NS	ns2.example.com.
@		IN	NS	ns3.example.com.
ns1		IN	A	192.0.2.11
ns1		IN	AAAA	2001:db8::192:0:2:11
ns2		IN	A	198.51.100.11
ns2		IN	AAAA	2001:db8::198:51:100:11
ns3		IN	A	203.0.113.11
ns3		IN	AAAA	2001:db8::203:0:113:11

www		IN	A	192.0.2.30

