# C64 XUM1541

The thing about old 5 1/4 inch floppies is that no matter the way they are stored, they are inherently in a constant decay until they're all disolved into nostalgia and tears. Because of that I wanted to archive my private collection of less than original floppy disks (I didn't know any better and I had a hard time being able to even afford empty disks). Anyway, I came across an interesting [blog-post](https://myoldcomputer.nl/commodore-64/xum1541-promicro/) where a dedicated superfan used an Arduino Pro Micro to connect the drive directly to a modern computer, allowing a disk to be copied to a D64-file within a minute!

![XUM1541](https://github.com/tebl/C64-XUM1541/raw/master/gallery/2020-06-20%2023.25.41.jpg)

There are more professional solutions out there with a lot more features, but I wanted the simplest version of it all without actually soldering wires myself - so I threw together a simple PCB with the footprints matching parts I already had laying around in my parts-bin from building my Pi1541 module.

## Building the module
The module only consists of a handful of components, so just enure that get the components matching the BOM listed at the bottom of this page and solder it all together (component counts in parenthesis are not needed for a minimal build). The PCB may seem somewhat oversized for what it is, the reason for this is that I wanted it to fit into one of the 70x45x30mm electronic project boxes - when doing so you'd also install the power LED listed as an optional component, but bent out toward the side so that you can see it inside the box.

![Module PCB](https://github.com/tebl/C64-XUM1541/raw/master/gallery/2020-06-20%2020.06.48.jpg)

I you're building more than one of these, you probably won't need to install the reset switch on more than one of them (it is used when initially flashing the Arduino Pro Micro).

## Using the module
Using the actual module is a chapter unto itself, so I've put together a separate [firmware installation document](https://github.com/tebl/C64-XUM1541/blob/master/documentation/firmware.md) describing how to flash the Arduino Pro Micro with the correct firmware as well as set it up with the OpenCBM software for use on a Windows 10 computer. If you're on a different platform, you'll have to look up those guides separately as I only have the one laptop.

There is also an extensive document available that describes the various commands that can be used as part of the [OpenCBM](https://spiro.trikaliotis.net/opencbm#download)-package, this can be found within the install-folder on your computer. With everything working correctly, you're ready to start archiving and for those just wanting to start copying things the command you're looking for is probably the following:
```
d64copy.exe 8 disk.d64
```

**WARNING!** A quick note on the hardware itself is that there is a recommended way of unplugging and plugging in cables, mainly to never do so with the power supplied to it. Commodore 64s and their associated hardware is slowly going extinct like the disks we're trying to archive, so please handle them with the care they deserve!

# Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/C64-XUM1541/raw/master/documentation/schematic/C64%20XUM1541.pdf) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from ebay/AliExpress (free shipping, plan on usually waiting 3-4 weeks though). The list below should be everything you'll need in addition to a workable soldering iron and some 60/40 soldering tin.

Any part counts listed in parenthesis are optional, meaning you can skip installing those features if it is a feature you don't want/need. Male pin headers are usually supplied in breakable 40-pin packages, so you'll just use what you need and discard the rest. Installing female pin headers may be preferable as it makes it easier to recover the Arduino Pro Micro for later projects.

| Reference    | Item                                  | Count |
| ------------ | ------------------------------------- | ----- |
| PCB          | Fabricate using Gerber files ([order](https://www.pcbway.com/project/shareproject/Commodore_64_XUM1541.html?inviteid=88707))          |     1 |
| A1           | Arduino Pro Micro *                    |     1 |
| A1           | 12-pin headers                         |     2 |
| A1           | 12-pin female pin headers              |   (2) |
| D1           | 5mm LED                                |   (1) |    
| J1           | Female S-terminal 6pin DIN PCB         |     1 |
| J2           | 2x8 male pin headers                   |   (1) |
| R1           | 330 ohm resistor                       |   (1) | 
|              | 70x45x30mm electronic project box      |   (1) |
| SW1          | 6x6x5mm right-angle momentary button   |     1 |

*) I've purchased a couple of different Arduino Pro Micro boards that had a different physical size, so take care to match up the pins to the PCB so that you solder it up to match the board you own. 