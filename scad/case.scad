/************************************************************************

	case.scad
    
	Raspberry Pi 4B / Hyperpixel 4.0 case
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

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

// The connector cutouts are in a module so they can be common to both
// the upper and lower case parts
module connector_cutouts()
{
    // Recess
    move([3.25,-11.5,-2.5]) cuboid([57,10,3.5+10], center=false, fillet = 1.5);

    // Power in
    move([6.25,-3.5,1.5]) cuboid([10,4,3.5], center=false, fillet = 1, edges=EDGES_Y_ALL);

    // HDMI
    move([22,-3.5,1.5]) {
        move([0.5,0,-0.5]) cuboid([7.25,4,3.25], center=false, fillet = 0.5, edges=EDGES_Y_ALL);
        move([13.75,0,-0.5]) cuboid([7.25,4,3.25], center=false, fillet = 0.5, edges=EDGES_Y_ALL);
    }

    // Audio
    move([51,-3.5,1.5]) {
        move([3.125,1,3.125]) rotate([90,0,0]) cyl(h=6, d=6.5);
    }

    // USB2
    move([85,1.25,1.25]) {
        move([0,0,0]) cuboid([6,15.5,16.75], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }

    // USB3
    move([85,19.25,1.25]) {
        move([0,0,0]) cuboid([6,15.5,16.75], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }

    // Ethernet
    move([85,37.5,1.25]) {
        move([0,0,0]) cuboid([6,16.5,14.25], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }
}

// Render the lower case part
module lower_case()
{
    // Lower case
    difference() {
        union() {
            move([-15,-4,-4.5]) {
                difference() {
                    union() {
                        difference() {
                            move([-1,-1,0]) cuboid([105, 66, 8], center=false, fillet = 2, edges = EDGES_Z_ALL);
                            move([2,2,2]) cuboid([104 - 5, 66 - 6, 8], center=false, fillet = 1, edges = EDGES_Z_ALL);
                        }

                        union() {
                        // Add 2.5mm of thickness to the wall for side connectors
                        move([15,1,0]) cuboid([64,2.5,8], center=false);

                        // Pi stand-offs
                        move([15,4,-3]) {
                            // Internal stand-off, 2.5mm high (screw dia 2.8mm)
                            move([3.5,3.5,4]) cyl(h=2, d=10, center=false);
                            move([3.5 + 58,3.5,4]) cyl(h=2, d=10, center=false);
                            move([3.5,3.5 + 49,4]) cyl(h=2, d=10, center=false);
                            move([3.5 + 58,3.5 + 49,4]) cyl(h=2, d=10, center=false);
                        }

                        move([15,4,-3]) {
                            // Internal stand-off, 2.5mm high
                            move([3.5,3.5,6]) cyl(h=1.5, d=6, center=false);
                            move([3.5 + 58,3.5,6]) cyl(h=1.5, d=6, center=false);
                            move([3.5,3.5 + 49,6]) cyl(h=1.5, d=6, center=false);
                            move([3.5 + 58,3.5 + 49,6]) cyl(h=1.5, d=6, center=false);
                        }
                        }
                    }

                    // Mounting holes for Pi4 PCB
                    move([15,4,-6]) {
                        move([3.5,3.5,5]) cyl(h=6, d=2.8, center=false);
                        move([3.5 + 58,3.5,5]) cyl(h=6, d=2.8, center=false);
                        move([3.5,3.5 + 49,5]) cyl(h=6, d=2.8, center=false);
                        move([3.5 + 58,3.5 + 49,5]) cyl(h=6, d=2.8, center=false);
                    }

                    move([15,4,-7]) {
                        move([3.5,3.5,4.5]) cyl(h=5, d=8, center=false);
                        move([3.5 + 58,3.5,4.5]) cyl(h=5, d=8, center=false);
                        move([3.5,3.5 + 49,4.5]) cyl(h=5, d=8, center=false);
                        move([3.5 + 58,3.5 + 49,4.5]) cyl(h=5, d=8, center=false);
                    }

                    // LED holes
                    move([-8 +14,7.85 +4,2.25 +4.5]) {
                        xcyl(h=16, d = 1.8);
                    }
                    move([-8 +14,11.5 +4,2.25 +4.5]) {
                        xcyl(h=16, d = 1.8);
                    }
                }
            }

            // Add a lip to mate with the upper case
            move([-15,-4,3.5+2]) {
                difference() {
                    // Lip
                    move([0.75,0.75,-2]) cuboid([104 - 2.5, 64 - 1.5, 2], center=false, fillet = 1.5, edges = EDGES_Z_ALL);
                    move([2,2,-3]) cuboid([104 - 5, 64 - 4, 4], center=false, fillet = 1, edges = EDGES_Z_ALL);
                    move([15,0,-6.5]) cuboid([64,5,8], center=false); // Not around side connectors
                    move([100,6,-6.5]) cuboid([5,52,8], center=false); // Not around front connectors
                }

                // Clips
                move([3.5,1,-1.75]) rotate([45,0,0]) cuboid([10,1,1], center=false);
                move([80.5,1,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                move([10,63,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);
                move([41.5,63,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);
                move([73,63,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                move([0.25,6,-1]) rotate([0,45,0]) cuboid([1,15,1], center=false);
                move([0.25,43,-1]) rotate([0,45,0]) cuboid([1,15,1], center=false);
            }
        }

        // Add the connector cutouts
        connector_cutouts();

        // SD card cutout
        move([-8,28.2,-2.5]) cuboid([19,12.5,6]);
        move([-7,28.2,-6.5]) cuboid([20,14.5,6], chamfer = 1);
    }

    // SD card housing
    move([-15,28.2,-5]) {
        move([2,-6.25,2.5 + 3]) cuboid([12.5,12.5,1], center=false);
        move([2,-7.25,2.5]) cuboid([12.5,1,4], center=false, chamfer = 0.5, edges = EDGE_TOP_FR);
        move([2,6.25,2.5]) cuboid([12.5,1,4], center=false, chamfer = 0.5, edges = EDGE_TOP_BK);

        move([5,-7.25,2.5]) cuboid([12.5,1,2], center=false);
        move([5,6.25,2.5]) cuboid([12.5,1,2], center=false);
    }

    // Light pipe mount for LEDs (use 1.75mm clear filament for pipes)
    difference() {
        move([-7,9.65,0]) {
            cuboid([13,7,4.5], chamfer = 1, edges= EDGE_TOP_BK+EDGE_TOP_FR);
        }
        
        move([-8,7.85,2.25]) {
            xcyl(h=16, d = 1.8);
        }
        move([-8,11.5,2.25]) {
            xcyl(h=16, d = 1.8);
        }
    }
}

// Render the upper case part
module upper_case(lift)
{
    // Upper case
    difference() {
        union() {
            move([-15,-4,3.5 + lift]) {
                difference() {
                    move([-1,-1,0]) cuboid([105, 66, 23], center=false, fillet = 2, edges = EDGES_Z_ALL);
                    move([2,2,-2]) cuboid([104 - 5, 66 - 6, 23], center=false, fillet = 1, edges = EDGES_Z_ALL);

                    // Screen cut out
                    move([((104 - 90) / 2) + 4 - 2,((64 - 54) / 2) - 0.25 - 2,20.9]) cuboid([90 - 1.5 + 4, 54 + 4, 8], center=false, chamfer = 2);

                    // Square the inner edge of the cutout
                    move([((104 - 90) / 2) + 4 - 0.5,((64 - 54) / 2) - 0.25 - 0.5,19]) cuboid([90 - 1.5 + 1, 54 + 1, 6], center=false, chamfer = 0.5);
                }
            }

            // Add 1.5mm of thickness to the wall for side connectors
            move([0,-2,3.5 + lift]) cuboid([64,1.5,8], center=false);

            // Chamfer it at 45 degrees for easier printing
            move([32,-1.25,11.5+lift]) rotate([0,0,90]) right_triangle([1.5,64,1], center=false);
        }

        // Remove material to allow mating with lower case
        move([-15,-4,4.5 + lift]) {
            difference() {
                move([0.75,0.75,-3]) cuboid([104 - 2.5, 64 - 1.5, 4], center=false, fillet = 1.5, edges = EDGES_Z_ALL);
                move([15,0,-6.5]) cuboid([64,5,8], center=false); // Not around side connectors
                move([100,6,-6.5]) cuboid([5,51,8], center=false); // Not around front connectors
            }

            // Clip recesses
            move([3.5,1,-1.75 + 1]) rotate([45,0,0]) cuboid([10,1,1], center=false);
            move([80.5,1,-1.75 + 1]) rotate([45,0,0]) cuboid([20,1,1], center=false);

            move([10,62.75 + 0.25,-1.75 + 1]) rotate([45,0,0]) cuboid([20,1,1], center=false);
            move([41.5,62.75 + 0.25,-1.75 + 1]) rotate([45,0,0]) cuboid([20,1,1], center=false);
            move([73,62.75 + 0.25,-1.75 + 1]) rotate([45,0,0]) cuboid([20,1,1], center=false);

            move([0.25,6,-1 + 1]) rotate([0,45,0]) cuboid([1,15,1], center=false);
            move([0.25,43,-1 + 1]) rotate([0,45,0]) cuboid([1,15,1], center=false);
        }

        // Add the connector cutouts
        move([0,0,lift]) connector_cutouts();

        // Air vents - back left and right
        hgh = 14 + lift;
        offs1 = -10 + 12;
        move([0 + offs1,60,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([5 + offs1,60,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([10 + offs1,60,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([15 + offs1,60,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);

        offs2 = 69 - 12;
        move([0 + offs2,60,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([5 + offs2,60,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([10 + offs2,60,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([15 + offs2,60,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);

        // Air vents connector side
        move([0 + offs1 - 7,-1,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([5 + offs1 - 7,-1,hgh]) rotate([0,30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([10 + offs2 + 7,-1,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
        move([15 + offs2 + 7,-1,hgh]) rotate([0,-30,0]) cuboid([2,10,18], fillet = 1, edges=EDGES_Y_ALL);
    }
}

