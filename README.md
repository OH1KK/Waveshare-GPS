# Waveshare-GPS
Simple script to use Waveshare GSM/GPRS/GNSS/Bluetooth HAT for Raspberry Pi GPS functions

## Usage

    ./gps.sh  {loc|time|status|poweron|poweroff|towertimesync}

* loc = show current location
* time = show gps time
* status = show gps timesync settings, gps power status and location fix status
* poweron = power on gps functions
* poweroff = power off gps functions
* towertimesync = adjust clock from cellular tower

### Output

Is raw AT command output

````
pi@raspberry:~$ ./gps.sh loc
AT+CGNSINF
+CGNSINF: 1,1,20180215225911.000,63.555119,23.715403,74.602,0.00,269.4,1,,0.8,1.2,0.9,,14,11,,,41,,

OK
pi@raspberry:~$ 
````

### More info

Waveshare GSM/GPRS/GNSS/Bluetooth HAT for Raspberry Pi
https://www.waveshare.com/wiki/GSM/GPRS/GNSS_HAT

NMEA protocol
http://www.gpsinformation.org/dale/nmea.htm
