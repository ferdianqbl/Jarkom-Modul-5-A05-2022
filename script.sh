#!/bin/bash

# Setup DHCP Relay
cp /root/isc-dhcp-relay-1 /etc/default/isc-dhcp-relay
service isc-dhcp-relay restart

# OSTANIA

# === SOAL NO 5
iptables -A PREROUTING -t nat -p tcp --dport 80 -d 192.171.7.138 -m statistic -$
iptables -A PREROUTING -t nat -p tcp --dport 80 -d 192.171.7.138 -j DNAT --to-d$
iptables -A PREROUTING -t nat -p tcp --dport 443 -d 192.171.7.139 -m statistic $
iptables -A PREROUTING -t nat -p tcp --dport 443 -d 192.171.7.139 -j DNAT --to-$


# STRIX
#=== ROUTING ===  
route add -net 192.171.7.128 netmask 255.255.255.248 gw 192.171.7.146
route add -net 192.171.7.0 netmask 255.255.255.128 gw 192.171.7.146
route add -net 192.171.0.0 netmask 255.255.252.0 gw 192.171.7.146

route add -net 192.171.4.0 netmask 255.255.254.0 gw 192.171.7.150
route add -net 192.171.6.0 netmask 255.255.255.0 gw 192.171.7.150
route add -net 192.171.7.136 netmask 255.255.255.248 gw 192.171.7.150

#=== STRIX ===
iptables -N LOGGING
iptables -A FORWARD -i eth0 -p tcp -d 192.171.7.131 -j LOGGING
iptables -A FORWARD -i eth0 -p udp -d 192.171.7.131 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP

service rsyslog restart



# GARDEN
#=== SOAL NO 4
iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue$
iptables -A INPUT -j REJECT

#=== SOAL NO 6
service apache2 restart
service apache2 restart

iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue$

iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Rejected: "
iptables -A LOGGING -j REJECT

service rsyslog restart

# === Ports-1.conf ===
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 443

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet


# WISE
#=== setup.sh ===
cp /root/isc-dhcp-server-1 /etc/default/isc-dhcp-server
cp /root/dhcpd-1.conf /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart

# === SOAL NO 2
iptables -A FORWARD -d 192.171.7.128/29 -i eth0 -p tcp -j DROP
iptables -A FORWARD -d 192.171.7.128/29 -i eth0 -p udp -j DROP

# === SOAL NO 3
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -$

# === SOAL NO 6
service isc-dhcp-server restart
service isc-dhcp-server restart

iptables -N LOGGING
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -$
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP

service rsyslog restart

# === dhcpd-1.conf ===
#
# Sample configuration file for ISC dhcpd for Debian
#
# Attention: If /etc/ltsp/dhcpd.conf exists, that will be used as
# configuration file instead of this file.
#
#

#Forger
subnet 192.171.7.0 netmask 255.255.255.128 {
    range 192.171.7.2 192.171.7.126;
    option routers 192.171.7.1;
    option broadcast-address 192.171.7.127;
    option domain-name-servers 192.171.7.130;
    default-lease-time 600;
    max-lease-time 7200;
}

#Desmond
subnet 192.171.0.0 netmask 255.255.252.0 {
    range 192.171.0.2 192.171.3.254;
    option routers 192.171.0.1;
    option broadcast-address 192.171.3.255;
    option domain-name-servers 192.171.7.130;
    default-lease-time 600;
    max-lease-time 7200;
}

#Blackbell
subnet 192.171.4.0 netmask 255.255.254.0 {
    range 192.171.4.2 192.171.5.254;
    option routers 192.171.4.1;
    option broadcast-address 192.171.5.255;
    option domain-name-servers 192.171.7.130;
    default-lease-time 600;
    max-lease-time 7200;
}

#Briar
subnet 192.171.6.0 netmask 255.255.255.0 {
    range 192.171.6.2 192.171.6.254;
    option routers 192.171.6.1;
    option broadcast-address 192.171.6.255;
    option domain-name-servers 192.171.7.130;
    default-lease-time 600;
    max-lease-time 7200;
}

subnet 192.171.7.128 netmask 255.255.255.248 {
    option routers 192.171.7.129;
}

# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style none;

# option definitions common to all supported networks...
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
#authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

#subnet 10.152.187.0 netmask 255.255.255.0 {
#}

# This is a very basic subnet declaration.

#subnet 10.254.239.0 netmask 255.255.255.224 {
#  range 10.254.239.10 10.254.239.20;
#  option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
#}

# This declaration allows BOOTP clients to get dynamic addresses,
# which we don't really recommend.

#subnet 10.254.239.32 netmask 255.255.255.224 {
#  range dynamic-bootp 10.254.239.40 10.254.239.60;
#  option broadcast-address 10.254.239.31;
#  option routers rtr-239-32-1.example.org;
#}

# A slightly different configuration for an internal subnet.
#subnet 10.5.5.0 netmask 255.255.255.224 {
#  range 10.5.5.26 10.5.5.30;
#  option domain-name-servers ns1.internal.example.org;
#}

# A slightly different configuration for an internal subnet.
#subnet 10.5.5.0 netmask 255.255.255.224 {
#  range 10.5.5.26 10.5.5.30;
#  option domain-name-servers ns1.internal.example.org;
#  option domain-name "internal.example.org";
#  option subnet-mask 255.255.255.224;
#  option routers 10.5.5.1;
#  option broadcast-address 10.5.5.31;
#  default-lease-time 600;
#  max-lease-time 7200;
#}

# Hosts which require special configuration options can be listed in
# host statements.   If no address is specified, the address will be
# allocated dynamically (if possible), but the host-specific information
# will still come from the host declaration.

#host passacaglia {
#  hardware ethernet 0:0:c0:5d:bd:95;
#  filename "vmunix.passacaglia";
#  server-name "toccata.fugue.com";
#}

# Fixed IP addresses can also be specified for hosts.   These addresses
# should not also be listed as being available for dynamic assignment.
# Hosts for which fixed IP addresses have been specified can boot using
# BOOTP or DHCP.   Hosts for which no fixed address is specified can only
# be booted with DHCP, unless there is an address range on the subnet
# to which a BOOTP client is connected which has the dynamic-bootp flag
# set.
#host fantasia {
#  hardware ethernet 08:00:07:26:c0:a5;
#  fixed-address fantasia.fugue.com;
#}

# You can declare a class of clients and then do address allocation
# based on that.   The example below shows a case where all clients
# in a certain class get addresses on the 10.17.224/24 subnet, and all
# other clients get addresses on the 10.0.29/24 subnet.

#class "foo" {
#  match if substring (option vendor-class-identifier, 0, 4) = "SUNW";
#}

#shared-network 224-29 {
#  subnet 10.17.224.0 netmask 255.255.255.0 {
#    option routers rtr-224.example.org;
#  }
#  subnet 10.0.29.0 netmask 255.255.255.0 {
#    option routers rtr-29.example.org;
#  }
#  pool {
#    allow members of "foo";
#    range 10.17.224.10 10.17.224.250;
#  }
#  pool {
#    deny members of "foo";
#    range 10.0.29.10 10.0.29.230;
#  }
#}

# === isc-dhcp-server-1 ===
# Defaults for isc-dhcp-server initscript
# sourced by /etc/init.d/isc-dhcp-server
# installed at /etc/default/isc-dhcp-server by the maintainer scripts

#
# This is a POSIX shell fragment
#

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPD_CONF=/etc/dhcp/dhcpd.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPD_PID=/var/run/dhcpd.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACES="eth0"


# WESTALIS
#=== isc-dhcp-server-1 ===
# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="192.171.7.131"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth0 eth1 eth2 eth3"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS=""

# === setup.sh ===
cp /root/isc-dhcp-relay-1 /etc/default/isc-dhcp-relay
service isc-dhcp-relay restart


# SSS
# === SOAL NO 4
iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue$
iptables -A INPUT -j REJECT

# === SOAL NO 6
service apache2 restart
service apache2 restart

iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue$

iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Rejected: "
iptables -A LOGGING -j REJECT

service rsyslog restart

# === ports-1.conf ===

# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 443

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet




# EDEN
#=== setup.sh ===
cp /root/named-1.conf.options /etc/bind/named.conf.options
service bind9 restart

# === SOAL NO 3
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -$

# === SOAL NO 4
# Garden & SSS
iptables -A INPUT -s 192.171.7.136/29 -m time --timestart 07:00 --timestop 16:0$
iptables -A INPUT -s 192.171.7.136/29 -j REJECT

# === SOAL NO 6
service bind9 restart
service bind9 restart

iptables -N LOGGING
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -$
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP

service rsyslog restart

#=== named-1.conf.options ===
options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

        forwarders {
                192.168.122.1;
        };

        //=====================================================================$
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //=====================================================================$
        //dnssec-validation auto;
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};