#! /bin/bash

#
# in the ~/DynDnsUpdate/.dyndns.cfg file, set the variables
# LOGIN: set this to "username:password"
# UPDATE_URL: base url for DynDNS updates, e.g.:
# UPDATE_URL="http://members.dyndns.org/nic/update" # DynDNS service
# UPDATE_URL="https://dyndns.strato.com/nic/update" # Strato's DynDNS service
#
. ${HOME}/DynDnsUpdate/.dyndns.cfg
DOMAINS=$(cat ${HOME}/DynDnsUpdate/.dyndns.domains)

echo "$(date '+%Y-%m-%d %H:%M') $(basename $0)"
for domain in ${DOMAINS}; do
        echo -n "  ${domain} - "

        ## Use this line for automatic IP resolution
        curl --silent --show-error --user ${LOGIN} "${UPDATE_URL}?hostname=${domain}"

        ## Get the ip from a specific interface (ham0 == Hamachi, eth0 == Ethernet, wlan0 == WiFi)
        # INTERFACE=ham0
        # ip=$(ifconfig ${INTERFACE} | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
        # curl --silent --show-error --user ${LOGIN} "${UPDATE_URL}?hostname=${domain}&myip={$ip}"

done

echo ""

## cron example ##
## # Update Dyndns hosts every 6 hours
##     *       */6         *               *                 *             ./DynDnsUpdate/cron-dyndns-update.sh
