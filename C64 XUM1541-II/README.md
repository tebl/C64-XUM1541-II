# C64 XUM1541-II
If you came to this github-repository looking for the implementation of an XUM1541, then you've come to the correct place and this folder contains all of the files needed to build one for yourself. The necessary details first of course, I didn't design the original XUM1541 - the earlier heavy lifting was already done and detailed in an  article [online](https://myoldcomputer.nl/commodore-64/xum1541-promicro/). My contribution was reading it, then adapting it for easier use by designing a PCB as part of a personal project available at [C64 XUM1541](https://github.com/tebl/C64-XUM1541).

![C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_005.jpg)

This however is an updated version from that design, mainly by integrating the 7406 inverter as described in the [OpenCBM](https://github.com/zyonee/opencbm/tree/master/xum1541) documentation. In theory this should allow the device some more durability when used together with multiple devices connected to the IEC-bus, but while I haven't had any issue with the original device - the main objective was to modify it for use with the later versions of the OpenCBM firmware (0.8). A secondary objective was to make it a more visually pleasing device from the original, which is pretty hard when dealing with a bare PCB - so I designed a separate faceplate to be installed on the top though this is a completely optional addition.

![C64 XUM1541-II with faceplate](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_006.jpg)

- [1> Building the C64 XUM1541-II](#1-building-the-c64-xum1541-ii)
  - [1.1> Soldering it together](#11-soldering-it-together)
  - [1.2> Assembling the unit](#12-assembling-the-unit)
  - [1.3> Testing it out](#13-testing-it-out)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building the C64 XUM1541-II
Building the unit assumes you have at least minor experience soldering things together, recommended is at least a soldering station with adjustable temperature to get started. Commonly you'll want to start out with some 60/40 solder tin, but this'll naturally depend on availability in your area.

With the requirements when it comes to equipment sorted, now it's time to do even more shopping - head on over to the [BOM](#3-bom)-section for a somewhat specific list over components needed. Note that with sites such as ebay, AliExpress and similar sites that sell cheap chinese components, you'll need to treat these more as a suggested search term and look for something that for the most part matches the gallery pictures. I tend to use only the cheapest components available, so it should be somewhere in the top of your results.


## 1.1> Soldering it together
The construction of this unit should be straight-forward, specifically as there are only a handful of components to deal with. None of the components overlap in any way, so while there are certainly an easier route - that one would normally go from first installing the smallest components and working your way up from there. 

![Build C64 XUM1541-II 001](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_001.jpg)

I suggest that you start out by studying the PCB so that you have a general overview over the components that are needed, possibly also making a mental note over the components specificly listed in the BOM as optional (component count in parenthesis). In particular, pay attention to the markings on the board for the components that need to be installed in a specific orientation (LEDs and the single IC socket).

![Build C64 XUM1541-II 002](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_002.jpg)

Here we've gone ahead and installed all of the resistors, if you've bought the components as part of a kit you should note that there are two different values that you can easily pick out based on their colour bands and the number included. The IC socket have an indent on one side, this should be matched to the silkscreen on the board.

![Build C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_003.jpg)

The single capacitor doesn't have a polarity so just stick it in place. The LEDs won't function when installed in the wrong orientation, ideally this should be as easy as matching the flat side to the one on the board. However there are quite a few cheaper LEDs where this isn't as easy to determine, so instead I'll just recommend that you put the shortest pin into the hole on the *flat* side. Given that you'll no doubt want a faceplate, you need to get this on the board straight - what I recommend is that you solder one of the pins, then reheat and push the component flush with the board before soldering the remaining pin.

![Build C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_004.jpg)
![Build C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/pro_micro_001.jpg)

Here we've jumped a bit ahead and finally you've found the answer to one of your original questions; why does the outline for the Arduino Pro Micro have three sets of pins on it? As you can see from the other picture added, there are a few different layouts for the Arduino Pro Micro boards - one is wider than the other! Pick the one that matches your boards before soldering pin headers onto either of the modules.

The last component that we really need to discuss is the momentary switch, mainly that it needs to be tall enough to poke through the faceplate on top. I've not found out how ebay listings measure the height of their switches, mainly because I just picked up a kit with different size switches and picked what fit. What I can tell you is that measuring just the black protruding plastic part, it needs to be around 8mm - measured from the PCB it sits around 11.5mnm above it.

Time to shut off the soldering iron. Feel the strongth welling, return to the next chapter for the exciting conclusion to this documentation. Spoiler warning: there will be a section after that one.

## 1.2> Assembling the unit
At this point we've added just about everything but the 7406, mainly just because I like dragging things out. Before doing so, I recommend spending some time to get the firmware installed onto the Arduino Pro Micro. It shouldn't matter, but it given the number of fake 7406 chips floating around it's better doing it this way. Given that installing the firmware and the accompanying OpenCBM software can be a bit more difficult than it should be, I've put together a separate [document](https://github.com/tebl/C64-XUM1541-II/blob/main/documentation/firmware.md) that should go into just about every bit of details needed to get all that set up. Return here when you're ready to move onto testing things out.

![Build C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_005.jpg)

Here we've inserted the aforementioned 7406, and the device should now be ready for actual testing. Skip to the next chapter if you don't want a faceplate, because - why wouldn't you want a faceplate? They're cool.

![Build C64 XUM1541-II](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_006.jpg)

The faceplate is just a simple PCB, the suggested way of attaching it is by using components found in cheap *M3 nylon hex* kits. It will look at its best when using an 8mm nylon hex standoff (F-F), then adding screws from both sides. If, on the other hand, you want to stay within the kit - then I suggest using the 8mm M-F standoffs, add M3 nuts on the bottom and snip off the remaining part of the nylon screw that'll poke through. Add screws on top.

## 1.3> Testing it out
When ready to test things out, we need to do some safety notifications - mainly, you can't buy any new and unused Commodore 1541 disk drives so treat them with care. They aren't plug and play like we're used to today, if you start plugging and unplugging cables while things are powered on you should probably say a prayer. Neither probably won't actually cause your vintage computer hardware to explode, but it'll happily kill your hardware in less spectacular ways. Got that? Good.

Ensure that the 1541 disk drive as well as the C64 XUM1541-II is not powered on, now connect the  IEC cable between them. Power on the disk drive, then plug the device into your modern computer. Go through the final section of my [firmware]([document](https://github.com/tebl/C64-XUM1541-II/blob/main/documentation/firmware.md)) document for some initial hints on copying your first disk, check out the software directory for a few of the batch files I personally use with the device if you just want some basic functionality without looking into all of the options (see OpenCBM documentation for that).

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/C64-XUM1541-II/tree/main/documentation/schematic) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). 

| Reference             | Item                                                              | Count | Order  |
| --------------------- | ----------------------------------------------------------------- | ----- | ------ |
| Cartridge PCB         | Fabricate using Gerber files                                      |     1 | [PCBWay](https://www.pcbway.com/project/shareproject/C64_XUM1541_II.html)
| Faceplate PCB         | Fabricate using Gerber files                                      |    (1)| [PCBWay FA1](https://www.pcbway.com/project/shareproject/C64_XUM1541_II__Faceplate_FA1_.html)
| A1 *                  | Arduino Pro Micro                                                 |     1 |
| C1                    | 100nF ceramic capacitor (5mm pin spacing)                         |     1 |
| D1,D2                 | 5mm LED                                                           |    (2)|
| J1                    | Female S-terminal 6pin DIN PCB                                    |     1 |
| J2                    | 2x10 male IDC socket                                              |   (1) |
| R1,R4 **              | 470 ohm resistor                                                  |    (2)| 
| R2,R3,R5,R6,R7        | 100k ohm resistor                                                 |     5 | 
| SW1                   | 6x6x11mm right-angle momentary button                             |     1 |
| U1					| 7406 (DIP-14)                                                     |     1 |
| Mounting ***          | Nylon M3 hex standoffs 8mm                                        |    (4)|
| Mounting ***          | Nylon M3x6mm nylon screws                                         |    (4)|
| Mounting ***          | M3 nylon nut                                                      |    (4)|  

*) I've purchased a couple of different Arduino Pro Micro boards that had a different physical size, so take care to match up the pins to the PCB so that you solder it up to match the board you own. 

**) The value to be installed here needs to match the LEDs installed, value should be acceptable for most cheaper LEDs. If the using LEDs in any way listed as bright or are in any way clear, you'll need to calculate a suitable value in order to not blind yourself when looking at them.

***) The easiest way of ordering these is to just one of the M3 nylon standoff kits on ebay, AliExpress or any similar sites. That way you'll get more than what you need in various sizes for future projects as well.
