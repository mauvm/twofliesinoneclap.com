+++
date = "2016-07-14"
description = "Introducing Ted, a car computer I'm going to build myself."
title = "Have you met Ted?"
series = ["Ted"]
draft = true
slug = "have-you-met-ted"
author = "Auke Willem Oosterhoff"

+++

Recently I bought my first car. It's an Smart forfour build in 2006. It's just
a normal car without fancy features. The dashboard contains 2 gauges showing
the speed and the RPM. A handfull indicicators show if my the engine has a failure
or if a turn signal is enabled. A little display shows how many
kilometers the care drove, what time it is and how much fuel is left.

{{<figure src="dasboard_smart.jpg" title="Dashboard of a 2006 Smart forfour." >}}
The radio is not very exciting as well. It's a Smart Radio Five a CD player,
some programmable buttons and a AUX input.

Modern and more expensive cars often are shipped with computer and a touchscreen.
With this system you can control the whole car: manage audio, call people, use
it to navigate to your destination, it says when you need to shift gears and so
on.

I want such a system and I'm going to build it myself. Why? The most important reason
is because it's fun. It's also great way to learn a lot. This blog is the first
of a series in which I'm going to describe the progress of the system I've called
Ted.

## Goals
Ted must be lightweight so it can run on cheap hardware. I've a an old
Raspberry Pi Model B lying around and I'll start development of Ted on that
device.  It has a 700 MHz ARM chip and 256 Mb of memory. There are [touch
screens][touch screen] around which are compatible with the Raspberry Pi.
Currently I don't if I stay with the Raspberry Pi or switch to different
hardware later on in the process.

I'm going to start with creating a virtual car dashboard showing metrics and
stats obtained using the OBD connector. The next section tells a bit more about
OBD. This will probably take a while. I've to descide what display server and
GUI library to use. Currently I don't even have descided what language(s) I'm
going to use.

In a later stage I want to add features to control the audio and navigation
functionality. I'm also thinking of building a assistant which help you to
shift gears on the correct moment to save fuel.

## OBD
A bit more about OBD. [OBD][obd] stands for On-board Diagnostics and every car
sold in Europe after 2003 must have a OBD-II connector located near the
steering wheel. To qoute Wikipedia: "OBD systems give the vehicle owner or
repair technician access to the status of the various vehicle subsystems." So
the can OBD interface can be used get all kinds of information about the car.
Think of error codes, the current speed, temperature of the engine oil, the
engine RPM and so on. Each parameter has his own ID (PID). A big list of PID's
can be found on [Wikipedia][pid].

Car manufactorers can choose out of 5 procotols to speak over the OBD-II interface.
One these procotols in CAN. Most cars only implement only 1 protocols, as does my car.
My cars "talks" CAN.

It's very easy to use the OBD-II interface to read the status of your car. For
less than $20 dollars you can get yourself a diagnostic tool or an adapter
which you can connect to the OBD-II connector. I bought a [this OBD-II
Bluetooth][adapter]. I can pair for example my phone with this adapter and use
the OBD-II interface via Bluetooth. The app markets for Android and iOS contain
several apps for displaying car info while. I've tested my adapter with the
Android app [Torque Light][torque light] and it worked pretty well.

## Open source
Ted is going to open source is going to licensed under [Mozilla Public License][mpl].
You can find the project on [GitHub][github].

[obd]: https://en.wikipedia.org/wiki/On-board_diagnostics
[pid]: https://en.wikipedia.org/wiki/OBD-II_PIDs
[adapter]: http://www.obdshop.nl/obd-2-universeel/interfaces/obd-bluetooth/obd-2-bluetooth-interface-micro-blauw-129.html
[torque light]: https://play.google.com/store/apps/details?id=org.prowl.torquefree&hl=nl
[touch screen]: https://www.raspberrypi.org/blog/the-eagerly-awaited-raspberry-pi-display/
[mpl]: https://github.com/OrangeTux/Ted/blob/master/LICENSE
[github]: https://github.com/OrangeTux/Ted
