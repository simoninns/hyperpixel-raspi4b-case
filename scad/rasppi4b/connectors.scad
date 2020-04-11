/************************************************************************

	connectors.scad
    
	Raspberry Pi 4B model
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

module male_pin_header(x, y, rows, pins)
{
    // Base
    color("black") move([x,y,0]) cuboid([(2.54 / 2) + (2.54 * pins-1), 2.54 * rows,2.5], center=false, fillet = 0.5, edges=EDGES_Z_ALL);

    // Pins
    color("yellow") {
        for(b=[0:rows-1]) {
            move([x+1.5,y+1.25 + (2.54 * b),2.5]) {
                for (a =[0:pins-1]) {
                    move([a*2.54, 0, 0]) cyl(h=5, d=0.8, center=false);
                    move([a*2.54, 0, 5]) cyl(h=1, d1=0.8, d2=0.6,center=false);

                    move([a*2.54, 0, -5]) cyl(h=1, d1=0.8, d2=1.5,center=false);
                }        
            }
        }
    }   
}

module usb_connector(isUsb3)
{
    color("silver") difference() {
        union() {
            move([0,1,1]) cuboid([17.5,13,14], center=false, fillet=0.25); // Body
            move([17,0,0]) cuboid([1,15,16], center=false, fillet=0.25); // Lip

            // Connector pins
            move([0,1,0]) cuboid([7,1,2], center=false, fillet=0.25);
            move([0,1,-3.5]) cuboid([1,1,5.5], center=false, fillet=0.25);
            move([6,1,-3.5]) cuboid([1,1,5.5], center=false, fillet=0.25);

            move([0,13,0]) cuboid([7,1,2], center=false, fillet=0.25);
            move([0,13,-3.5]) cuboid([1,1,5.5], center=false, fillet=0.25);
            move([6,13,-3.5]) cuboid([1,1,5.5], center=false, fillet=0.25);
        }

        // Cut-out USB sockets
        move([10,7.5,4]) cuboid([17,12.5,5], fillet=0.25);
        move([10,7.5,12]) cuboid([17,12.5,5], fillet=0.25);
    }

    colr = (isUsb3) ? "blue":"black";

    color(colr) {
        move([9,7.5,4.75]) cuboid([17,11.75,1.5], fillet=0.25);
        move([9,7.5,12.75]) cuboid([17,11.75,1.5], fillet=0.25);
    }
}

module usb()
{
    move([70.5,1.5,0]) usb_connector(false);
    move([70.5,19.5,0]) usb_connector(true);
}

module ethernet()
{
    move([66.5,38,0]) {
        color("silver") {
            difference() {
                cuboid([22,15.5,13.4], center=false, fillet=0.25);

                move([2,2,1.5]) cuboid([21,12,9.5], center=false, fillet=0.25);
                move([2,6,0.25]) cuboid([21,4,9], center=false, fillet=0.25);
            }
        }

        color([0.1,0.1,0.1]) {
            difference() {
                union() {
                    move([2,2,1.5]) cuboid([20,12,9.5], center=false, fillet=0.25);
                    move([2,6,0.25]) cuboid([20,4,9], center=false, fillet=0.25);
                }
                move([2.5,2.5,2]) cuboid([21,11,8.5], center=false, fillet=0.25);
                move([18,6.5,0.75]) cuboid([5,3,9], center=false, fillet=0.25);
            }
        }

        color([0.1,0.1,0.1]) {
            move([17.75,2.5,2]) cuboid([4,3,2], center=false, fillet=0.25);
            move([17.75,10.5,2]) cuboid([4,3,2], center=false, fillet=0.25);
            move([6,2.5,2]) cuboid([12,11,2], center=false, fillet=0.25);
        }

        // LEDs
        color("darkgreen") move([18,2.5,2]) cuboid([4,2,1.25], center=false, fillet=0.25);
        color("Gold") move([18,11.5,2]) cuboid([4,2,1.25], center=false, fillet=0.25);

        // Positioning posts
        color([0.1,0.1,0.1]) {
            move([12,2,-1.5]) cyl(h=4, d=2, fillet=0.5);
            move([12,15.5 - 2,-1.5]) cyl(h=4, d=2, fillet=0.5);
        }
    }
}

module powerin()
{
    color("silver") difference() {
        union() {
            move([6.75,-1.5,0]) cuboid([9,7.5,3.2], center=false, fillet = 1.25, edges=EDGES_Y_ALL);
            move([6.75,0,0]) cuboid([9,6,3.2], center=false, fillet = 1.25, edges=EDGES_Y_TOP);
        }

        move([7,-2,0.25]) cuboid([8.5,7,3.2 - 0.5], center=false, fillet = 1.25, edges=EDGES_Y_ALL);
    }

    color([0.1,0.1,0.1]) {
        move([7.50,-2,1.25]) cuboid([7.5,7,1.2 - 0.5], center=false, fillet = 0.25);
    }
}

module hdmi_connector()
{
    color("silver") difference() {
        union() {
            move([0,0,0.5]) cuboid([6.25,7.5,1.5], center=false, fillet = 0.25, edges=EDGES_Y_ALL);
            move([0,0,0]) cuboid([6.25,7.5,1.5], center=false, fillet = 0.75, edges=EDGES_Y_ALL);
            move([0,1,0]) cuboid([6.25,6.5,2], center=false, fillet = 0.25, edges=EDGES_Y_TOP);
            
            move([-0.25,-0.5,0.75]) cuboid([6.75,0.5,1.5], center=false, fillet = 0.25, edges=EDGES_Y_ALL);
            move([-0.25,-0.5,-0.25]) cuboid([6.75,0.5,2], center=false, fillet = 0.75, edges=EDGES_Y_ALL);
        }

        move([0.25,-1,0.75]) cuboid([5.75,7.5,1], center=false, fillet = 0.25, edges=EDGES_Y_ALL);
        move([0.25,-1,0.25]) cuboid([5.75,7.5,1], center=false, fillet = 0.5, edges=EDGES_Y_ALL);
    }

    color([0.1,0.1,0.1]) {
        move([0.5,-0.5,0.6]) cuboid([5,7.5,0.75], center=false, fillet = 0.25);
    }
    
}

module hdmi()
{
    move([23,-1,0]) hdmi_connector();
    move([36.25,-1,0]) hdmi_connector();
}

module audio()
{
    color([0.1,0.1,0.1]) difference() {
        union() {
            move([50.65,0,0]) cuboid([7,12.5,6], center=false, fillet=0.5);
            move([54.15,-1.25,3]) rotate([90,0,0]) cyl(h=2.5, d=6);
        }

        move([54.15,2,3]) rotate([90,0,0]) cyl(h=10, d=3.5);
    }
    color("silver") move([53.65,-2.25,1]) cuboid([1,12.5,0.5], center=false);
    
}

module gpio()
{
    male_pin_header(7,50,2,20);
}

module fpc_socket()
{
    color("white") {
        move([0,1,0]) cuboid([3,21.5,0.5], center=false);
        move([0,3,0]) cuboid([0.5,17.5,5], center=false);
        move([2.5,1,0]) cuboid([0.5,21.5,5.0], center=false);
    }

    color([0.3,0.3,0.3]) {
        move([1,1,0.5]) cuboid([1.5,21.5,5], center=false);
        move([0,1,0.5]) cuboid([1.5,2,5], center=false);
        move([0,20.5,0.5]) cuboid([1.5,2,5], center=false);
        move([1,1,5]) cuboid([2,21.5,0.5], center=false);

        move([0,0,4.5]) cuboid([3,1,1], center=false);
        move([0,22.5,4.5]) cuboid([3,1,1], center=false);
    }
}

module display()
{
    move([45,0.25,0]) fpc_socket();
}

module camera()
{
    move([5.75,40.25,0]) rotate([0,0,180]) fpc_socket();
}

module sdcard_holder()
{
    color("silver") move([1.8,22.1,-0.5]) cuboid([11.5,12.1,1.5], center=false, fillet=0.25);
}

module sdcard()
{
    color("orange") {
        move([-2.25,22.7,-0.25]) cuboid([15,11,1], center=false, fillet = 1, edges=EDGES_Z_ALL);
    }
}

module poe()
{
    male_pin_header(58.9,43.9,2,2);
}

module jumper2()
{
    x = 8.1;
    y = 19.25;
    pins = 3;
    rows = 1;

    male_pin_header(8.1,19.25,1,3);
}

module connectors()
{
    // Top assembly
    move([0,0,1.6]) {
        usb();
        ethernet();
        powerin();
        hdmi();
        audio();
        gpio();
        display();
        camera();
        poe();
        jumper2();
    }

    // Bottom assembly
    move([0,0,-1]) {
        sdcard_holder();
        sdcard();
    }
}