# Waveshare-GPS
Simple script to use Waveshare GSM/GPRS/GNSS/Bluetooth HAT for Raspberry Pi GPS functions

## Usage

    ./gps.sh  {loc|time|status|poweron|poweroff|towertimesync}

* loc = show current location
* time = show time
* status = show gps timesync settings, gps power status and location fix status
* poweron = power on gps functions
* poweroff = power off gps functions
* towertimesync = adjust clock from cellular tower. With initially correct time satellites found faster.

### Output

loc command outputs raw AT command, response and decoded data

````
pi@raspberry:~$ ./gps.sh loc
AT+CGNSINF
+CGNSINF: 1,1,20180216003145.000,62.455111,22.615210,70.723,0.00,301.3,1,,0.7,1.0,0.7,,14,12,,,34,,

  GNSSrunstatus 1
  Fixstatus 1
  UTCdatetime 20180216003145.000
  latitude 62.455111
  logitude 22.615210
  altitude 70.723
  speedOTG 0.00
  course 301.3
  fixmode 1
  Reserved1 
  HDOP 0.7
  PDOP 1.0
  VDOP 0.7
  Reserverd2 
  GNSSsatellitesinview 14
  GNSSsatellitesused 12
  GLONASSsatellitesused 
  Reserved3 
  cn0max 34
  HPA 
  VPA 

OK
pi@raspberry:~$ 

````
Other commands outputs raw AT command and reply

### More info

Waveshare GSM/GPRS/GNSS/Bluetooth HAT for Raspberry Pi
https://www.waveshare.com/wiki/GSM/GPRS/GNSS_HAT

NMEA protocol
http://www.gpsinformation.org/dale/nmea.htm
