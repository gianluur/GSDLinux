#!/bin/bash
INTERFACE=$1
ACTION=$2

# We check if the connection changes (connect to anothe wifi for example)
[ "$ACTION" != "connectivity-change" ] && exit 0

# Small delay to let the interface settle (helps with race conditions)
sleep 0.5

STATE=$(nmcli -t -f GENERAL.CONNECTIVITY dev show "$INTERFACE" | cut -d: -f2)

get_dhcp_dns() {
    local iface=$1
    # Try IPv4 first, then IPv6
    nmcli -g dhcp4.option dev show "$iface" 2>/dev/null | grep -i "domain_name_servers" | cut -d= -f2-
    nmcli -g dhcp6.option dev show "$iface" 2>/dev/null | grep -i "domain_name_servers" | cut -d= -f2-
}

case "$STATE" in
    portal|limited)
        # While we're inside the portal we lower our security
        # because we need to connect to the portal and not all
        # routers on free wifi support DoT and DNSSEC

        DHCP_DNS=$(get_dhcp_dns "$INTERFACE" | head -1)
        
        if [ -n "$DHCP_DNS" ]; then
            resolvectl dns "$INTERFACE" $DHCP_DNS
        else
            GATEWAY=$(ip route show dev "$INTERFACE" | grep default | awk '{print $3}')
            if [ -n "$GATEWAY" ]; then
                resolvectl dns "$INTERFACE" "$GATEWAY"
            else
                resolvectl dns "$INTERFACE" "9.9.9.9"
            fi
        fi

        # We route all the traffic through what should be the wifi interface
        resolvectl domain "$INTERFACE" "~."
        # -------------------------------------------------------------------

        # Disable strict TLS and strict DNSSEC to avoid portal breakage
        resolvectl dnsovertls "$INTERFACE" opportunistic
        resolvectl dnssec "$INTERFACE" allow-downgrade
        resolvectl flush-caches
        ;;
        
    full)
        # Revert ALL settings (DNS, Domain, DNSSEC, DoT) back to global config
        resolvectl revert "$INTERFACE"
        resolvectl flush-caches
        ;;
        
    *)
        ;;
esac