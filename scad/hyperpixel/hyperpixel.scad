/************************************************************************

	hyperpixel.scad
    
	Hyperpixel 4.0 Touch (rectangular) Display model
    Copyright (C) 2020 Simon Inns
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <../BOSL/constants.scad>
use <../BOSL/transforms.scad>
use <../BOSL/shapes.scad>

// Dimensions: 58.5x97x12mm (WxHxD, depth includes header and display).

module female_pin_header(x, y, rows, pins)
{
    difference() {
        // Base
        color([0.2,0.2,0.2]) move([x,y,1]) cuboid([(2.54 / 2) + (2.54 * pins-1), 2.54 * rows,6], center=false, fillet = 0.5, edges=EDGES_Z_ALL);

        // Pins
        for(b=[0:rows-1]) {
            move([x+1.5,y+1.25 + (2.54 * b),0]) {
                for (a =[0:pins-1]) {
                    move([a*2.54, 0, 0]) cuboid([0.8,0.8,6]);
                }        
            }
        }
    }
}

module extension_header(x, y, rows, pins)
{
    difference() {
        // Base
        color([0.2,0.2,0.2]) move([x,y,1]) cuboid([(2.54 / 2) + (2.54 * pins-1), 2.54 * rows,8], center=false, fillet = 0.5, edges=EDGES_Z_ALL);

        // Sockets
        for(b=[0:rows-1]) {
            move([x+1.5,y+1.25 + (2.54 * b),0]) {
                for (a =[0:pins-1]) {
                    // Female sockets
                    move([a*2.54, 0, 0]) cuboid([0.8,0.8,9]);
                }        
            }
        }
    }

    // Pins
    color("yellow") {
        for(b=[0:rows-1]) {
            move([x+1.5,y+1.25 + (2.54 * b),0]) {
                for (a =[0:pins-1]) {
                    // Male pins
                    move([a*2.54, 0, 9.0]) cyl(h=4, d=0.8, center=false);
                    move([a*2.54, 0, 13.0]) cyl(h=1, d1=0.8, d2=0.6,center=false);
                }        
            }
        }
    }
}

module hyperpixel()
{
    move([0,0,11.5]) {
        move([-12,0.5 - 2,0]) {
            // Glass of touchscreen (58.5x97)
            difference() {
                color([0.1,0.1,0.1]) move([0,0,12]) cuboid([97.5, 58.5, 1], center=false);
                color([0.1,0.1,0.1]) move([9,(58.5 - 51.8) / 2,12.5]) cuboid([86.4, 51.8, 0.6], center=false);
            }

            // Actual screen is 86.4x51.8mm
            // offset is 7x3
            color([0.2,0.2,0.2]) move([9,(58.5 - 51.8) / 2,12.5]) cuboid([86.4, 51.8, 0.5], center=false);

            // Glass of screen
            color([0.3,0.3,0.3]) move([4,0,12-1]) cuboid([92, 58.5, 1], center=false);

            // Screen
            color([0.9,0.9,0.9]) move([0.25,0.75,12-1-2.6]) cuboid([96.5, 57, 2.4], center=false);

            // PCB
            color([0.3,0.3,0.3]) difference() {
                move([0,0,12-1-2.5-1.6]) cuboid([97, 58.5, 1.6], center=false);
                move([-0.5, (58.5 - 47) / 2 ,12-1-2.5-1.7]) cuboid([7.5, 47, 2], center=false);
            }
        }

        // Mounting holes
        color("silver") {
            move([3.5,3.5,5]) tube(h=2, od=6, id=2.6, center=false);
            move([3.5 + 58,3.5,5]) tube(h=2, od=6, id=2.6, center=false);
            move([3.5,3.5 + 49,5]) tube(h=2, od=6, id=2.6, center=false);
            move([3.5 + 58,3.5 + 49,5]) tube(h=2, od=6, id=2.6, center=false);
        }

        // Mounting posts
        color([0.3,0.3,0.3]) move([0,0,-10]) {
            $fn=6;
            move([3.5,3.5,0]) tube(h=15, od=6, id=2.6, center=false);
            move([3.5 + 58,3.5,0]) tube(h=15, od=6, id=2.6, center=false);
            move([3.5,3.5 + 49,0]) tube(h=15, od=6, id=2.6, center=false);
            move([3.5 + 58,3.5 + 49,0]) tube(h=15, od=6, id=2.6, center=false);

            move([3.5,3.5,15]) cyl(h=3, d=2.5, center=false);
            move([3.5 + 58,3.5,15]) cyl(h=3, d=2.5, center=false);
            move([3.5,3.5 + 49,15]) cyl(h=3, d=2.5, center=false);
            move([3.5 + 58,3.5 + 49,15]) cyl(h=3, d=2.5, center=false);
        }

        // GPIO
        female_pin_header(7,50,2,20);

        move([0,0,-8.25]) extension_header(7,50,2,20);
    }  
}