# 1> Firmware installation
The firmware that goes onto the Arduino Pro Micro is often referred to as an  Arduino Sketch, something that isn't actually fitting in this case as the design uses the hardware without the software parts of the Arduino project - we'll be flashing the Atmel Atmega32 MCU directly using more generic tools instead. The next step is installing a suitable USB-driver followed by the OpenCBM software package.

This document will for the most part focus on MS Windows as that is what I have, for all other systems you'll need to fill in quite a few of the gaps yourself. While you may not need to perform all of these steps exactly as described within this document, there are enough of little pitfalls that you can quicly fall into. For that reason I recommend that you read through the entire document before attempting to install any of the components, then do **exactly** as described. 

- [1.1> Flashing AVR](#11-flashing-avr)
- [1.2> Install USB-driver](#12-install-usb-driver)
- [1.3> Install OpenCBM](#13-install-opencbm)
- [1.4> Try copying a disk](#14-try-copying-a-disk)

## 1.1> Flashing AVR
While we could download the source code for the firmware and compile it ourself from the authors [github](https://github.com/zyonee/opencbm)-repository, we're instead going to use a precompiled version of the firmware instead - it'll be distributed as an Intel HEX-file. This is the same file type as used by EPROM burners such as the MiniPro TL866 referred to elsewhere in this project, but that would require knowing intuitively how to set the fuses for the MCU - I have no idea about such things, so I recommend using a program specificly made for dealing with MCUs.

One such program, it is also the one I'll be referring to for the remainder of this document, is usually referred to as just - *avrdude*. A distribution of this software that has been prepared for installation on a modern copy of MS Windows is [WinAVR](https://sourceforge.net/projects/winavr/). With other operating systems you'll probably find a similar package as it's practically available everywhere, ignore the obvious Windows-stuff when going forward.

At this point, you should already have installed a version of *avrdude*. The next step is just simply downloading the HEX-file as mentioned earlier, you can grab current version I've verified working from my [repository](https://github.com/tebl/C64-XUM1541-II/tree/main/software/firmware) or a bleeding edge copy from the original authors [repository](https://github.com/zyonee/opencbm/tree/master/xum1541). Given that the *C64 XUM1541-II* hardware integrates a 7406 inverter, it should be named  "xum1541-PROMICRO_7406-v08.hex" (depending on version).

**NB!** When downloading the file, make sure that you save this file from the raw-format - simply right-clicking a file from within the github-page will save it along with a bunch of html inside it. Click the file, then the *RAW* button - then finally save the file with the proper content. Alternatively you can view the repository in the web-browser, click the green *Code* button and then select *Download ZIP* to get a copy of everything.

Before we can flash the Arduino Pro Micro, we'll need to know which COM-port Windows have assigned to your it. Connect it to your computer using a suitable USB-cable, try a different one if nothing at all happens on your computer at this point - usually it'll make a *ding* sound or something to that effect. Check out *device manager* and take a look at the Ports-section, you should have one here - this is **NOT** the one you want! The one you actually want to use will only be shown for 8 seconds, so keep this window open and reset the Arduino Pro Micro by pressing the reset button **twice**.

![device_manager](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/device_manager.png)

On my computer the port showed up as com4, you need to pay attention and make a note of what this number is on your computer. After the already mentioned 8-second timeout it'll change again, but never mind that - as it is this first one we need to use with *avrdude*. Type in the command as below, substituting your actual com-port, but do **NOT** press ENTER at this point. Reset the Arduino Pro Micro again by pushing *reset* **twice** and then quickly press ENTER to run the command (you'll have 8 seconds). 

```
avrdude -p m32u4 -c avr109 -P com4 -U flash:w:xum1541-PROMICRO_7406-v08.hex
```

If all things go as expected you should get something like the following, just ignore the specifics and ensure that it at the moment verifies that the firmware was written correctly. If it times out or bombs out with an error message, you were probably too late when resetting the Arduino Pro Micro so just try it again until you finally succeed.

![avrdude001](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/avrdude001.png)
![avrdude002](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/avrdude002.png)

At this point the Arduino Pro Micro has seized being an Arduino Pro Micro, it is now a XUM1541. Disconnect the USB-cable and then reconnect it, you should now get a new notification from Windows about an xum1541 having been plugged in instead. Without installing USB-drivers it won't work, so let's do that next.

## 1.2> Install USB-driver
The next step is installing a USB-driver suitable for use with the XUM1541, the easiest way of doing this is by using a driver installer called [Zadig](https://zadig.akeo.ie/). List all devices from the *options* dropdown-menu, then locate the XUM1541 device in the device listing. In the target section of the driver selection, click up/down until it says **libusb-win32**. Now you can finally click install/reinstall driver in a form that should hopefully work (refer to picture below if needed).

![Zadig](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/zadig002.png)

**NB!** Later in this document, we'll get to the installation of OpenCBM. As part of the installation, it'll ask you for permission to install a USB-driver for you - this won't work and it'll just override the driver we just installed. If you did this, then from Zadig - you'll need to enable *List all Devices* from *Options* and then select the xum1541 device from the dropdown list and then click *replace driver*. Do **NOT** randomly mess around with any of the other devices listed, the results probably won't be easy to fix.

Remember earlier when we checked out *Device Manager*? Before continuing I recommend ensuring that the XUM1541 is now listed as expected, it should now show up in a different section than where we found the Arduino Pro Micro (back when it was an Arduino). For reference, see the picture below.

![Device Manager](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/device_manager2.png)

## 1.3> Install OpenCBM
The actual OpenCBM tools can be downloaded from the creators homepage at [spiro.trikaliotis.net/opencbm](https://spiro.trikaliotis.net/opencbm#download), it's a zip-file and you'll need to extract it to a folder somewhere. Open a CMD-shell in administrator mode, find the directory where you left the extracted file and finally "install" the package by using the following command:
```
install.bat xum1541
```
![opencbm001](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/opencbm001.png)

**NB!** At a certain point in the installation, it'll ask if you want to install the USB-driver - answer **NO** to this as the driver will probably only work with the ZoomFloppy board. If you accidentally install it, refer to section [1.2> Install USB-driver](#12-install-usb-driver) details on fixing this. It happens, I've done it and now you need to fix it before continuing.

OpenCBM will now be installed on the system, but it's not a graphical application - it is more a suite of command-line tools. You can verify that the program has been installed correctly by opening up a *Command Prompt* (*cmd.exe*), then change your working directory to *C:\Program Files\opencbm* (or something similar, depending on Windows localization). You can now attempt to run some of the commands in order to verify that Windows is able to communicate with the module, for example the following:
```
cbmctrl.exe detect
```
With no 1541 device connected to the XUM1541 you probably won't get any meaningful feedback, or any at all. In this case, no feedback is good news as that means no error messages. For the love of all things *Commodore*, do **NOT** plug or unplug any sort of cable when either one of the components have power applied to it! Unplug the USB-cable to the XUM-1541, ensure the 1541 is still shut off and then finally connect the IEC cable between the two. Connect the XUM1541 to your computer, and only at this point should you actually switch on the 1541. Running the same command you should now see that a 1541 have been detected, the name will be dependent on the kernal installed in the drive itself.

![opencbm002](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/opencbm002.png)

## 1.4> Try copying a disk
You probably bought or built this device in order to copy your aging floppy disks, so let's just try copying a disk to ensure that everything actually works. The command you're probably looking for is something like the following:
```
d64copy.exe 8 test.d64
```
![opencbm003](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/opencbm003.png)

If all goes well, this should make a copy of the disk in drive 8 to a file called *test.d64*. There is a more comprehensive manual that comes with opencbm, it goes into a lot more detail when it comes to describing the various functions that can be performed when using a XUM1541-device. 

Check out the software directory of this project for a selection of batch-files, they should help somewhat in automating basic tasks and they are what I'm using at this point. There are a few graphical programs made for it, but I find the command line a lot quicker in practice. The *copy.bat* file takes a number as a  parameter, it will then read side A of the disk inserted and then prompt you to turn over the disk before copying side B (it'll one d64-file for each in a sub-directory named disks). 
```
copy.bat 16
```
![opencbm004](https://github.com/tebl/C64-XUM1541-II/raw/main/gallery/documentation/opencbm004.png)

