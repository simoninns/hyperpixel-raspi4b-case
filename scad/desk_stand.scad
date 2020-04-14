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

module desk_stand_leg()
{
    // Render the desk for reference
    //move([40,30,-31]) rotate([30,0,0]) cuboid([100,100,10]);

    move([0,3.5,-8.5]) {
        difference() {
            lugx = -26.1;
            union() {
                move([-30,-5.5,-1]) cuboid([8,60,5], chamfer = 1.5, edges=EDGES_ALL-EDGE_TOP_LF-EDGE_TOP_RT, center=false);
                move([-30,4.5,-36]) cuboid([8,40,40], center=false, chamfer = 1.5);

                // Mounting lugs
                move([lugx,0,3 + 1.4]) cyl(h=4, d=7.8);
                move([lugx,49,3 + 1.4]) cyl(h=4, d=7.8);
            }

            // Cut angle into stand
            move([-26,30,-44]) rotate([30,0,0]) cuboid([12,100,50]);

            // Cut out centre
            difference() {
                move([-26,24.5,-14.5]) cuboid([12,28,30]);
                move([-26,25,-30]) rotate([30,0,0]) cuboid([14,60,30]);
            }

            // Chamfer back edge
            move([-26,7,-29.25]) cuboid([14,10,5]);

            // Screw shaft holes
            move([lugx,0,3]) cyl(h=10, d=2.8);
            move([lugx,49,3]) cyl(h=10, d=2.8);

            // Screw head recess holes
            move([lugx,0,-12 + 10.5]) cyl(h=14, d=5);
            move([lugx,49,-12 + 10.5]) cyl(h=14, d=5);

            move([lugx - 2,0,-12 + 8]) cuboid([14, 5, 14]);
            move([lugx - 2,49,-12 + 8]) cuboid([14, 5, 14]);
        }
    }
}

// Desk stand angle is 30 degrees
module desk_stand(number)
{
    if (number == "2") {
        move([29.5,0,0]) desk_stand_leg();
        move([29.5 + 58,0,0]) desk_stand_leg();
    } else {
        move([29.5,0,0]) desk_stand_leg();
    }
}