
# Ulti-PET IO-Extensions

This extension taps into the PET's I/O system at the top level.
I.e. it maps certain device numbers you would use in an `OPEN` for 
example to new devices, or remaps the 2nd tape for example.

The 2nd tape in the PET is at device number 2, which conflicts with
the RS232 of the C64, so the tape device gets remapped to 17 
(which is the device address of the 1st tape plus 16).

Device address 2 becomes the first RS232 interface, while the 2nd 
RS232 is on address 18 (2 + 16 - you get the idea).

The shifted keyboard address (16 = 0+16) is mapped to I2C output
The shifted screen address (19 = 3+16) is currently unused.

Here's the mapping table for the new devices:

| addr | device   |
|------|----------|
|  2   |  Serial1 - replaces Tape2        |
|  16  |  I2C                             |
|  17  |  Tape2 (mapped to 2 on original) |
|  18  |  Serial2                         |
|  19  |  (SPI)                           |

## I2C Notes

The secondary address in the open is the device number. An open like

```
OPEN 1,16,48
```
thus opens a channel to I2C device 48.

The I2C protocol is timing sensitive. Any output is thus collected into a buffer
until the output operation is concluded with CLRCH. 
A BASIC `PRINT#` does this automatically.

Using the kernal jump table with CKOUT you can CHKIN open a bidirectional channel
with the I2C device. This mode, however, is experimental.

## RS232 Notes

The Ulti-PET has two UART RS232 interface adapters. Those are way more advanced than the
the ACIA usually used in the 65xx model computers, and are more made to talk real
RS232 not just to a modem.

In the `OPEN` command, like in C64 BASIC, the first two bytes of the filename have a meaning.
Currently only the baud rate is supported:

```
	?, 
	50, 
	75, 
	110, 
	134.5, 
	150,
	300, 
	600, 
	1200, 
	1800, 
	2400, 
	3600, 
	4800, 
	7200, 
	9600, 
	19200      
```

