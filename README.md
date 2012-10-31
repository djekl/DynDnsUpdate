#DynDns Update Script

##About
This script is designed to simply to update your Dynamic dns hosts from [Dyn](http://dyndns.com/ "Managed DNS, Outsourced DNS & Anycast DNS").

##Usage
To use it could not be simpler. Clone the repo into the root of your account;

    git clone https://github.com/djekl/DynDnsUpdate.git ~/DynDnsUpdate/


Now you have this cloned in, we need to do some configuration:

+   1st we need to edit the `~/DynDnsUpdate/.dyndns.cfg` with our credentials. As you can see I have put some demo credentials in for you.
+   Now we have our credentials in, we need to choose an update uri (See Below). This is us finished with this file.
+   We now need to add our domains into `~/DynDnsUpdate/.dyndns.domains`

Now we have configured our basic setup, we can now move onto the script itself.
If we wish to automatically get the external IP address then we are done :)

However if you (like me) are using a VPN client (say [Hamachi](https://secure.logmein.com/labs/)) then you may want to get the IP from a specific interface.
To do this then comment out line #18 and uncomment lines #21-#23 and set the interface name on line #21.

***

###cron example

```
# Update Dyndns hosts every 6 hours
    *       */6         *               *                 *             ./DynDnsUpdate/dyndns-update.sh
```
