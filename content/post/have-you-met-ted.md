+++
date = "2016-08-06T13:00:00+01:00"
description = "Introducing Ted, a car computer I'm going to build."
title = "TED0: Have you met Ted?"
series = ["Ted"]
slug = "have-you-met-ted"
author = "Auke Willem Oosterhoff"
+++

Recently I bought my first car. It’s a 2006 Smart Forfour. It’s just a normal
car without fancy features. The dashboard contains 2 gauges showing the speed
and the RPM. A handfull indicicators show if my the engine has a failure or if
a turn signal is enabled. A little display shows how many kilometers the care
drove, what time it is and how much fuel is left.

{{<figure src="/img/dashboard.jpg" title="Dashboard of a 2006 Smart Forfour." >}}

The radio isn’t very exciting as well. It’s a Smart Radio Five with a CD
player, some programmable buttons and an AUX input.

Modern and more expensive cars are often shipped with computer and a
touchscreen. With this system you can control the whole car: manage audio, call
people, use it to navigate to your destination and so on.

I want such a system and I’m going to build it myself. Why? The most important
reason is because it’s fun. It’s also great way to learn a lot. This blog is
the first post of a series in which I’m going to describe the progress of the
system I’ve called Ted.

## Goals
Ted must be lightweight so it can run on cheap hardware. I’ve a an old
Raspberry Pi Model B lying around and I’ll start development of Ted on that
device. It has a 700 MHz ARM chip and 256 Mb of memory. There are [touch
screens][touch screen] around which are compatible with the Raspberry Pi.
Currently I don’t know if I stay with the Raspberry Pi or if I switch to
different hardware later on in the process.

I’m going to start with creating a virtual car dashboard showing metrics and
stats obtained using the OBD-II connector. In the [next post]({{< relref
"post/obd-ii-elm327-and-python.md" >}}) you can read more about the OBD-II
connector. I’ve to descide what display server and GUI library to use.
Currently I don’t even have descided what language(s) I’m going to use.

In a later stage I want to add features to control the audio and navigation
functionality. I’m also thinking of building a assistant which help you to
shift gears on the correct moment to save fuel.

## Open source
Ted is going to open source is going to licensed under [Mozilla Public
License][mpl].  You can find the project on [GitHub][github].

[touch screen]: https://www.raspberrypi.org/blog/the-eagerly-awaited-raspberry-pi-display/
[mpl]: https://github.com/OrangeTux/Ted/blob/master/LICENSE
[github]: https://github.com/OrangeTux/Ted
