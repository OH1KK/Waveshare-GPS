#!/bin/bash

#    GPS script for Waveshare GSM/GPRS/GNSS/Bluetooth for Raspberry Pi hat
#    Copyright (C) 2018  Kari Karvonen
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

tty=/dev/ttyAMA0

function SerialWriteAndRead() {
	exec 4<$tty 5>$tty
        stty -F $tty 9600 -echo
	echo "$1" >&5
	while IFS='' read -t 1 -r line || [[ -n "$line" ]]; do
	    echo "$line"
	done <&4
}

case "$1" in
	towertimesync)
		# Use time from cell tower. 
		# You need to physically poweroff and poweron hat after this
		# Without correct time GPS satellites are hard to find
		SerialWriteAndRead "AT+CLTS=1"
		SerialWriteAndRead "AT&W"
		;;
	poweron)
		# Power on GPS 
		SerialWriteAndRead "AT+CGNSPWR=1"
		;;
	poweroff)
		# Power off GPS
	        SerialWriteAndRead "AT+CGNSPWR=0"
	        ;;
	loc)
		# Location / postition
		SerialWriteAndRead "AT+CGNSINF"
		;;
	time)
		# Time
		SerialWriteAndRead "AT+CCLK?"
		;;
	status)
		# GPS timesync status
		SerialWriteAndRead "AT+CLTS?"
		# Power status
		SerialWriteAndRead "AT+CGNSPWR?"
		# GPS Fix status
		SerialWriteAndRead "AT+CGPSSTATUS?"
		;;
	*)
		echo "Simple GPS-script for Waveshare GSM/GPRS/GNSS/Bluetooth for Raspberry Pi hat"
		echo ""
		echo "$0  {loc|time|status|poweron|poweroff|towertimesync}"
		echo ""
		echo "See more info and AT command: https://www.waveshare.com/wiki/GSM/GPRS/GNSS_HAT"
		exit 1
		;;
esac
exit 0
