# Hyperpixel 4.0 touch and Raspberry Pi 4B case (with Prusa MK3S bracket)
This project provides a 3D printable case for the Hyperpixel 4.0 touch display and Raspberry Pi 4 B.  The case features a universal mounting system; a bracket for the Prusa i3 MK3S/MMU2S is also provided.

Note: This project is GPLv3 open-source. The github repository for the model (containing the complete OpenSCAD project) can be found at https://github.com/simoninns/hyperpixel-raspi4b-case

<img src="/images/photos/all_ports.jpg" width="800">

# Overview

The case is designed in two parts (the upper and lower case) which snap together without the need for screws.  The Raspberry Pi and Hyperpixel display are held in place using the original mounting hardware provided with the Hyperpixel.

The project also includes an accurate model of the Raspberry Pi 4 B:

<img src="/images/render/raspberry_pi_4b.png" width="800">

As well as an accurate model of the Hyperpixel 4.0 (rectangular) touch screen display:

<img src="/images/render/hyperpixel_40.png" width="800">

# Assembly instructions

The Hyperpixel 4.0 display should have both the GPIO extender and the 4 support posts mounted.  Attach the display to the Raspberry Pi.  Flip the joined boards screen down and place the lower case part onto the 4 posts (ensure the SD card is removed).  Screw together using the M2.5x5mm screws provided with the Hyperpixel display.  The SD card can be reinserted through the provided slot in the lower case.

If required the additional bracket (for the Prusa MK3S) can also be attached.  Ensure there are no screws in the lower case, then press the bracket into place.  The bracket should be secured using M2.5x8mm screws.  Note that the case is designed so brackets can be mounted on either side of the case in both up and down orientations.

<img src="/images/photos/Mounted_on_Prusa.jpg" width="800">

The upper case is attached to the lower case by first lowering the connector-side of the case over the display (as it is too thick to be pressed straight down).  Then rotate the other side of the upper case over the display and clip the upper and lower cases together.

The lower case provides two 1.8mm holes for the LEDs.  You can optionally use two short lengths of transparent/clear 1.75mm filament to act as light-pipes.  These can be glued in place (using superglue) into the mount in the lower case.  This allows a wider viewing angle for the LEDs.

# Printing instructions

## Overview

The model has been printed and tested on the Prusa MK3S/MMU2S printer using PETG filament. All parts fit on a 20x20 printing bed.

The OpenSCAD source files provide a parameter interface that allows you to render either the whole model or the individual parts (ready for STL (or other 3D format) export).  This requires OpenSCAD 2019.05 or later.

## Recommended print settings
### Lower case
* Number required: 1
* Material: Prusament PETG (Prusa Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: Support on build plate only
* Print time (approximate): 1h 51m
* Notes: None

<img src="/images/render/lower_case.png" width="800">

### Upper case
* Number required: 1
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: None
* Print time (approximate): 2h 24m
* Notes: None

<img src="/images/render/upper_case.png" width="800">

### Bracket
* Number required: 1
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: Everywhere
* Print time (approximate): 1h 49m
* Notes: None

<img src="/images/render/bracket.png" width="800">

# Author

The Hyperpixel 4.0 touch and Raspberry Pi 4B case is designed and maintained by Simon Inns.

# Licensing

## OpenSCAD source files - software license (GPLv3)

    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## 3D model files - Creative Commons license (Creative Commons BY-SA 4.0)

Please see the following link for details: https://creativecommons.org/licenses/by-sa/4.0/

You are free to:

Share - copy and redistribute the material in any medium or format
Adapt - remix, transform, and build upon the material
for any purpose, even commercially.

This license is acceptable for Free Cultural Works.

The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

ShareAlike - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.
