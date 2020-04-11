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

module connector_cutouts()
{
    // Power in
    move([6.25,-3.5,1.5]) {
        move([0,0,0]) cuboid([10,4,3.5], center=false, fillet = 1, edges=EDGES_Y_ALL);
        move([-2,-1,-2]) cuboid([10 + 4,3,3.5+4], center=false, fillet = 1, edges=EDGES_Y_ALL);

        move([-2 - 0.5,-2,-2 - 0.25]) cuboid([10 + 5,3,3.5+5], center=false, fillet = 1);
    }

    // HDMI
    move([22,-3.5,1.5]) {
        move([0.5,0,-0.5]) cuboid([7.25,4,3.25], center=false, fillet = 0.5, edges=EDGES_Y_ALL);
        move([13.75,0,-0.5]) cuboid([7.25,4,3.25], center=false, fillet = 0.5, edges=EDGES_Y_ALL);
        move([-2,-1,-2]) cuboid([25.5,3,3.5+4], center=false, fillet = 1, edges=EDGES_Y_ALL);

        move([-2 - 0.5,-2,-2 - 0.25]) cuboid([25.5 + 1,3,3.5+5], center=false, fillet = 1);
    }

    // Audio
    move([51,-3.5,1.5]) {
        move([3.125,1,3.125]) rotate([90,0,0]) cyl(h=6, d=6.5);
        move([-2,-1,-2]) cuboid([6.5 + 4,3,3.5+7], center=false, fillet = 1, edges=EDGES_Y_ALL);

        move([-2 - 0.75,-2,-2 - 0.25]) cuboid([12,3,3.5+8], center=false, fillet = 1);
    }

    // Decoration
    move([6.5,-3.5,11]) {
        move([-2 - 0.5,-2,-2 - 0.25]) cuboid([42,3,2], center=false, fillet = 0.5);
    }

    // USB2
    move([85,1.25,1.25]) {
        move([0,0,0]) cuboid([5,15.5,16.75], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }

    // USB3
    move([85,19.25,1.25]) {
        move([0,0,0]) cuboid([5,15.5,16.75], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }

    // Ethernet
    move([85,37.5,1.25]) {
        move([0,0,0]) cuboid([5,16.5,14.25], center=false, fillet = 0.5, edges=EDGES_X_ALL);
    }
}

module lower_case()
{
    // Lower case
    difference() {
        union() {
            move([-15,-4,-4.5]) {
                difference() {
                    union() {
                        difference() {
                            cuboid([104, 64, 8], center=false, chamfer = 2, edges = EDGES_Z_ALL+EDGES_BOTTOM);
                            move([2,2,2]) cuboid([104 - 4, 64 - 4, 8], center=false, chamfer = 1, edges = EDGES_Z_ALL);
                        }

                        // Add 1.5mm of thickness to the wall for side connectors
                        move([15,2,0]) cuboid([64,1.5,8], center=false);

                        // Pi stand-offs
                        move([15,4,-3]) {
                            // Internal stand-off, 2.5mm high
                            move([3.5,3.5,5]) tube(h=2.5, od=6, id=2.8, center=false);
                            move([3.5 + 58,3.5,5]) tube(h=2.5, od=6, id=2.8, center=false);
                            move([3.5,3.5 + 49,5]) tube(h=2.5, od=6, id=2.8, center=false);
                            move([3.5 + 58,3.5 + 49,5]) tube(h=2.5, od=6, id=2.8, center=false);
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
                        move([3.5,3.5,5]) cyl(h=5, d=4.5, center=false);
                        move([3.5 + 58,3.5,5]) cyl(h=5, d=4.5, center=false);
                        move([3.5,3.5 + 49,5]) cyl(h=5, d=4.5, center=false);
                        move([3.5 + 58,3.5 + 49,5]) cyl(h=5, d=4.5, center=false);
                    }

                    // Remove material to allow mating with upper case
                    move([0,0,9]) {
                        difference() {
                            move([0.75,0.75,-3]) cuboid([104 - 1.75, 64 - 1.75, 4], center=false, chamfer = 1.5, edges = EDGES_Z_ALL);
                            move([15,0,-6.5]) cuboid([64,5,8], center=false); // Not around side connectors
                        }
                    }

                    // Clip recesses
                    move([3.5,1.25,-1.75 + 8]) rotate([45,0,0]) cuboid([10,1,1], center=false);
                    move([80.5,1.25,-1.75 + 8]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                    move([10,62.75 - 0.25,-1.75 + 8]) rotate([45,0,0]) cuboid([20,1,1], center=false);
                    move([73,62.75 - 0.25,-1.75 + 8]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                    move([0.5,6,-0.75 + 8]) rotate([0,45,0]) cuboid([1,15,1], center=false);
                    move([0.5,43,-0.75 + 8]) rotate([0,45,0]) cuboid([1,15,1], center=false);
                }
            }
        }

        connector_cutouts();

        // SD card cutout
        move([-15,28.2,-5]) {
            rounded_prismoid(size1=[40,17], size2=[8,8], h=5, shift=[9,0], r=2);
        }
    }

    move([-15,28.2,-5]) {
        move([2,-6.25,2.5 + 3]) cuboid([12.5,12.5,1], center=false);
        move([2,-7.25,2.5]) cuboid([12.5,1,4], center=false, chamfer = 0.5, edges = EDGE_TOP_FR);
        move([2,6.25,2.5]) cuboid([12.5,1,4], center=false, chamfer = 0.5, edges = EDGE_TOP_BK);

        move([5,-7.25,2.5]) cuboid([12.5,1,2], center=false);
        move([5,6.25,2.5]) cuboid([12.5,1,2], center=false);
        
    }
}

module upper_case()
{
    lift = 0;
    // Upper case
    difference() {
        union() {
            move([-15,-4,3.5 + lift]) {
                difference() {
                    cuboid([104, 64, 23], center=false, chamfer = 2, edges = EDGES_Z_ALL+EDGES_TOP);
                    move([2,2,-2]) cuboid([104 - 4, 64 - 4, 23], center=false, chamfer = 1, edges = EDGES_Z_ALL);

                    // Screen cut out
                    move([((104 - 90) / 2) + 2,((64 - 54) / 2),19]) cuboid([90 - 2, 54, 6], center=false);

                    // Chamfer the display cutout
                    move([((104 - 92) / 2) + 1,((64 - 56) / 2) -1,22]) cuboid([92, 58, 6], center=false, chamfer = 2);
                }
            }

            // Add 1.5mm of thickness to the wall for side connectors
            move([0,-2,3.5 + lift]) cuboid([64,1.5,8], center=false);

            // Chamfer it at 45 degrees for easier printing
            move([32,-1.25,11.5+lift]) rotate([0,0,90]) right_triangle([1.5,64,1], center=false);

            // Add a lip to mate with the lower case
            move([-15,-4,3.5+lift]) {
                difference() {
                    // Lip
                    move([0.75,0.75,-2]) cuboid([104 - 1.5, 64 - 1.5, 2], center=false, chamfer = 1.5, edges = EDGES_Z_ALL);
                    move([2,2,-3]) cuboid([104 - 4, 64 - 4, 4], center=false, chamfer = 1, edges = EDGES_Z_ALL);
                    move([15,0,-6.5]) cuboid([64,5,8], center=false); // Not around side connectors

                    

                    // union() {
                    //     difference() {
                    //         move([0,0,-1.25]) cuboid([104, 64, 0.5], center=false, chamfer = 1.5, edges = EDGES_Z_ALL);
                    //         move([1.25,1.25,-3]) cuboid([104 - 2.5, 64 - 2.5, 4], center=false, chamfer = 1, edges = EDGES_Z_ALL);
                    //     }
                    // }
                }

                // Clips
                move([3.5,1.25,-1.75]) rotate([45,0,0]) cuboid([10,1,1], center=false);
                move([80.5,1.25,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                move([10,62.75,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);
                move([73,62.75,-1.75]) rotate([45,0,0]) cuboid([20,1,1], center=false);

                move([0.5,6,-0.75]) rotate([0,45,0]) cuboid([1,15,1], center=false);
                move([0.5,43,-0.75]) rotate([0,45,0]) cuboid([1,15,1], center=false);
            }
        }
        move([0,0,lift]) connector_cutouts();
    }
}

