/************************************************************************

	prusa_mk3s_bracket.scad
    
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

module frame_hook()
{
    move([0,100,0]) {
        difference() {
            cuboid([30,52,19], chamfer = 1.5);
            move([0,4,6.5 - 2]) cuboid([52 + 2,45,12]);
        }

        // Bottom shelf
        move([0,23,2.5]) cuboid([30,6,10], chamfer = 1.5, edges=EDGE_TOP_BK+EDGE_BK_LF+EDGE_BK_RT+EDGE_TOP_LF+EDGE_TOP_RT);

        move([0,-20,7]) cuboid([30,6,5], chamfer = 1.5, edges=EDGE_TOP_BK+EDGE_TOP_LF+EDGE_TOP_RT+EDGE_BOT_BK); // Top lip
        move([0,20,6]) cuboid([30-2,2,3], chamfer = 1); // Bottom lip
    }
}

module case_bracket()
{
    move([26,3.5,-9.5]) {
        difference() {
            lugx = -22.5;
            union() {
                move([-15,35,0]) cuboid([30,85,10], chamfer = 1.5);

                // Mounting lugs
                move([lugx,0,3 + 2.4]) cyl(h=4, d=7.8);
                move([lugx,49,3 + 2.4]) cyl(h=4, d=7.8);
            }

            // Screw shaft holes
            move([lugx,0,3]) cyl(h=10, d=2.8);
            move([lugx,49,3]) cyl(h=10, d=2.8);

            // Screw head recess holes
            move([lugx,0,-12 + 8]) cyl(h=14, d=6);
            move([lugx,49,-12 + 8]) cyl(h=14, d=6);
        }
    }
}

module prusa_mk3s_bracket()
{
    move([11,12,35]) rotate([-30,0,0]) frame_hook();
    case_bracket();
}