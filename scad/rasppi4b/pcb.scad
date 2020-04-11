/************************************************************************

	pcb.scad
    
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

module pcb()
{
    difference() {
        union() {
            // PCB
            color("green") {
                cuboid([85, 56, 1.6], center=false, fillet = 3, edges = EDGES_Z_ALL);
            }

            // Mounting holes
            color("yellow") {
                move([3.5,3.5,1.6]) cyl(h=.1, d=6);
                move([3.5 + 58,3.5,1.6]) cyl(h=.1, d=6);
                move([3.5,3.5 + 49,1.6]) cyl(h=.1, d=6);
                move([3.5 + 58,3.5 + 49,1.6]) cyl(h=.1, d=6);
            }
        }

        // Drill
        move([3.5,3.5,1]) cyl(h=3, d=2.7);
        move([3.5 + 58,3.5,1]) cyl(h=3, d=2.7);
        move([3.5,3.5 + 49,1]) cyl(h=3, d=2.7);
        move([3.5 + 58,3.5 + 49,1]) cyl(h=3, d=2.7);
    }
}