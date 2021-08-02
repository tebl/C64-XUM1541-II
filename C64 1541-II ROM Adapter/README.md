# C64 1541-II ROM Adapter
The ROM found within the Commodore 1541-II disk drives requires 16KB chips which are somewhat of a pain to source in an age where most kids carry a supercomputer in their pocket, but for some reason the 32KB 27C256 and the 64KB 27C512 are practically leaking out of post box. You could just hardwire the extra pins to use only part of the capacity, or you could add a bunch of switches and a bunch of wires to have a selection firmwares ready at the flick of a switch without needing this adapter. I just love adding little boards everywhere because I'd know that something was hacked in there, so that's the reason this board exists. Note that earlier 1541 drives used two ROM chips, so for those you'd need a different solution that is presented here.

Worthy of noticing early on, is that the 1541-II doesn't really have very much available space to work with, so there will be some compromises that needs to be made in order to fit everything in the space available. For that reason I recommend following the supplied build instructions, only deviating once you've understood the reason for building it in this way.

- [1> Building it](#1-building-it)
  - [1.1> Soldering it together](#11-soldering-it-together)
  - [1.2> Preparing the EPROM](#12-preparing-the-eprom)
  - [1.3> Testing it out](#13-testing-it-out)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building it
Building the unit assumes you have at least minor experience soldering things together, recommended is at least a soldering station with adjustable temperature to get started. Commonly you'll want to start out with some 60/40 solder tin, but this'll naturally depend on availability in your area.

With the requirements when it comes to equipment sorted, now it's time to do even more shopping - head on over to the [BOM](#3-bom)-section for a specific list over components needed. Note that with sites such as ebay, AliExpress and similar sites that sell cheap chinese components, you'll need to treat these more as a suggested search term and look for something that for the most part matches the gallery pictures. I tend to use only the cheapest components available, so it should be somewhere in the top of your results.

Remember that part where I told you there'd be compromises? The first one is that the assembled adapter would be too tall to fit under the drive mechanism, meaning that we'd only be able to fit a single DIP socket. Your options are to either to remove the one already found on the 1541-II mainboard, or you need to solder the EPROM chip directly to the adapter board. I personally prefer the latter, I can always build another adapter board if it comes down to it - so this is also the solution that will be described when going forward.

## 1.1> Soldering it together
I suggest that you start out by studying the PCB so that you have a general overview over the components that are needed, In particular, pay attention to the markings on the board for the components that need to be installed in a specific orientation such as the EPROM. The pins marked with the circles around them will be used for the pins that will pass through the board and into the 1541-II mainboard socket below, note that one of these rows will be underneath the EPROM.

![Build C64 XUM1541-II 002](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/build_rom_002.jpg)

Here we've gone ahead and installed the two resistors needed, there isn't much else to say about the matter. If the silkscreen fits, then you must commit and all that - just to say more than what was strictly needed (there is no polarity).

Here we've gone one step further by getting started on the pins that will go into the socket found on the 1541-II mainboard, because of the height limitations we won't be able to simply use pin headers as expected. We'll instead need to use the *"neat"* method instead, simply put by using the long pin versions of female pin headers. Using a temporary socket as a template, lightly solder the top of the pins to the adapter board using as little solder as possible. When done, observe the result from the underside to ensure that the solder has flowed into and filled the hole completely to ensure that it won't simply fall apart later. Cut off the top of the pins as close as you can to the adapter board, in particular those that will be overlapped by the EPROM. For reference, the holes that we're soldering components to at this point is marked with rings around the holes.

When happy with the results, we're ready to solder in an already prepared EPROM (27c256/27c512) or EEPROM (w27c512). Check out section [1.2> Preparing the EPROM](#12-preparing-the-eprom) if you need a bit of guidance when putting data onto the chip before soldering it to the board. You can have a total of four different ROM images when using the 27c512 or w27c512 chips, but I tend to only install a single DPDT (ON-OFF-ON) switch - giving me three different usable images instead of four without needing to add a second switch. Solder the chip into place once you've got the correct data on it, trim the pins to ensure that they don't accidentally make contact with something it's not supposed to.

![Switch installation](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/2021-08-01%2023.51.54.jpg)

The DPDT has 6 pins, the easiest way of wiring it up is to connect the two center pins to the point marked GND. The two address lines is connected on either of the sides, but not on the same row. Doing it this way means that the first 16K image will never be accessed, putting the switch in the center position will be the last 16K image (ideally the original firmware). Even with the RF-shield in place, there's plenty of room on the sides - just remember to measure once and drill as many times as it takes.

## 1.2> Preparing the EPROM
The Commodore 1541-II drive has a single ROM socket on the mainboard and as already mentioned it is 16K in size, so with a 27c512 in place on the adapter we'll have the capability of selecting between four different 16K slots. When only installing a single DPDT-switch as described in the previous section, we'll only have access to the last three slots though we'll just be putting the default ROM there as well (in case we change our mind about it at a later point).

To be honest there isn't all that much that makes sense to install in the slots, the most common is using [JiffyDOS](http://store.go4retro.com/jiffydos-1541-dos-rom-overlay-image/) as well as the original firmware referred to as [1541-II.251968-03](http://www.zimmers.net/anonftp/pub/cbm/firmware/drives/new/1541/). Given that I wanted to play around with [SpeedDOS](http://www.zimmers.net/anonftp/pub/cbm/firmware/drives/new/1541/hacks/), I'm using that as the third alternative. Merging the four files together into a 64K file ready for flashing onto the aforementioned 27c512 chip can be done like the following:

```
copy /b 1541-II.251968-03.bin + JiffyDOS_1541-II.bin + 1541-II-relocated.bin + 1541-II.251968-03.bin 1541-II-firware.bin
```

Flash the file onto your actual chip using an EPROM burner such as the MiniPro TL866, there should be plenty of information on doing this out there on the wet and wild Internet.

## 1.3> Testing it out
Initial testing of the replaced ROM using the adapter is easily done by simply turning on the drive and observe that is turns on, spins the drive and then finally stops again (this is a good sign that the drive is working as expected). The various ROM replacements will normally write a different string to the error channel, when used with a device such as the XUM1541 or XUM1541-II this is the drive identification when using OpenCBM (*cbmctrl.exe detect*).

With the drive turned off, flick the switch or switches that you may or may not have installed. Probably wouldn't hurt anything if you forget to switch it off, but there's not much of a chance that it'll do much else than crash once the ROM suddenly gets replaced. Note down the values you get and the position of the switches, mark accordingly so that you don't need to guess at a later point.

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/C64-XUM1541-II/tree/main/documentation/schematic) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). 

| Reference             | Item                                                | Count | Order  |
| --------------------- | --------------------------------------------------- | ----- | ------ |
| Adapter PCB         | Fabricate using Gerber files                          |     1 | [PCBWay]()
| R1,R2               | 4k7 (4700) ohm resistor                               |     2
| A1 *                | 2.54mm long female pin headers of suitable length     |     2
| U1                  | 27C256, generic 27C512 EPROM or a W27C512 EEPROM      |     1
| SW                  | DPDT On-Off-On switch and hookup wire

*) Given that we are only using parts of the female pin headers with long pins, we don't really need a specific amount of pins though you'll have an easier time if you kind find ones with at least 14 pins (the remainders would either be cut off or used for a different project). This is described in more detail in the build section.