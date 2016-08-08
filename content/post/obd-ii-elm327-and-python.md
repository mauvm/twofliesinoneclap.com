+++
date = "2016-08-06T14:00:00+01:00"
description = "Read live data from a car using the OBD-connector and Python."
title = "TED1: OBD-II, ELM327 and Python"
series = ["Ted"]
slug = "obd-ii-elm327-and-python"
author = "Auke Willem Oosterhoff"
+++

In the [previous post]({{< relref "post/have-you-met-ted.md" >}}) I
introduced you to Ted, a car computer that I plan to build. In this posts I
describe my first steps: getting live data from the car using the OBD-II
connector and Python.

## OBD
[OBD][obd] stands for On-board Diagnostics and every car sold in Europe after
2003 must have an OBD-II connector located near the steering wheel. To qoute
Wikipedia: “OBD systems give the vehicle owner or repair technician access to
the status of the various vehicle subsystems.” So the OBD interface can be used
to obtain all kinds of information about the car. Think of error codes, the
current speed, temperature of the engine oil, the engine RPM and so on. Each
parameter has his own Paramater ID (PID). A big list of PID’s can be found on
[Wikipedia][pid]. Most car manufactores don’t implement all PID’s. In fact, my
car has only 7 PIDs implemented.

{{<figure src="/img/obd-ii-connector.jpg" title="The OBD-II connector in a 2006 Smart Forfour is located right below the steering wheel." >}}

Car manufacturers can choose out of 5 procotols to speak over the OBD-II
interface. Most cars only implement only 1 procotols, as does my car. My cars
talks CAN.

It’s very easy to use the OBD-II interface to read the status of your car. For
less than € 20 you can get yourself a diagnostic tool or an adapter which you
can connect to the OBD-II connector. I bought a this [OBD-II Bluetooth
adapter](bluetooth adapter). I paired my phone with this adapter. The app
markets for Android and iOS contain several apps for displaying car info.
I’ve tested my adapter with the Android app [Torque Pro][torque pro] and it
worked pretty well.

## ELM327
The Bluetooth adapter contains a [ELM327](elm327) microcontroller. This chip
acts as a proxy between you and the OBD-II connector. You can controll the
chip by sending commands. In order to get the current speed of the car you send
010D.  010D is de PID of the current speed. The ELM327 controller translates
this command. In my case it sends out a request on the CAN bus.

## Python-OBD
Because I couldn’t get the Bluetooth adapter working on my laptop I bought this
[OBD-II USB adapter][usb adapter] as well. After plugging in in my laptop (and
starting the engine) it comes up as a serial device at /dev/ttyUSB0.

With the package [brendan-w/python-OBD][python-obd] you only need a few lines
of code to read data from the OBD-II connector. Below you can find some sample
code with reads the current speed and RPM every second and print it to STDOUT.

``` python
#!/usr/bin/env python
import sys
import time
from obd import OBD, commands


def execute_command(con, cmd):
    """ Exucte AT command and return result. """
    return connection.query(cmd).value


if __name__ == '__main__':
    connection = OBD('/dev/ttyUSB0')

    try:
        while True:
            # Do you recognize 010D, the PID of speed?
            # You could also writes this using base 10 instead of hexadecimals,
            # as:
            #
            #   execute_command(commands[1][13])
            #
            # or like this:
            #
            #   execute_command(commands['SPEED'])
            speed = execute_command(connection, commands[0x01][0x0D])

            rpm = execute_command(connection, commands[0x01][0x0C])

            print('{:3d} kmh - {:4d} RPM'.format(speed.magnitude, int(rpm.magnitude)))

            time.sleep(1)
    except KeyboardInterrupt:
        sys.exit(0)

    sys.exit(1)
```

A little trip around the parking to demonstrate this code:

``` shell
$ python read_obd_data.py
 0 kmh - 1304 RPM
 2 kmh - 1183 RPM
 5 kmh - 1152 RPM
 9 kmh - 1542 RPM
11 kmh - 1871 RPM
13 kmh - 2039 RPM
15 kmh - 2132 RPM
16 kmh - 2226 RPM
17 kmh - 2367 RPM
18 kmh - 2281 RPM
16 kmh - 2121 RPM
15 kmh - 1937 RPM
14 kmh - 1886 RPM
14 kmh - 1906 RPM
14 kmh - 1835 RPM
12 kmh - 1621 RPM
13 kmh - 1949 RPM
15 kmh - 2218 RPM
17 kmh - 2132 RPM
16 kmh -  984 RPM
15 kmh -  878 RPM
13 kmh -  851 RPM
11 kmh -  863 RPM
 9 kmh -  816 RPM
 4 kmh -  843 RPM
 1 kmh -  847 RPM
 0 kmh -  808 RPM
```

I’m able to read live data of my car! It’s legen - wait for it - dary!

[bluetooth adapter]: http://www.obdshop.nl/obd-2-universeel/interfaces/obd-bluetooth/obd-2-bluetooth-interface-micro-blauw-129.html
[elm327]: https://www.elmelectronics.com/wp-content/uploads/2016/07//ELM327DS.pdf
[obd]: https://en.wikipedia.org/wiki/On-board_diagnostics
[pid]: https://en.wikipedia.org/wiki/OBD-II_PIDs
[python-obd]: https://github.com/brendan-w/python-OBD
[torque pro]: https://play.google.com/store/apps/details?id=org.prowl.torque&hl=nl
[usb adapter]: http://www.obdshop.nl/obd-2-universeel/interfaces/obd-usb/obd-elm327-usb-interface-universeel-can-bus.html
