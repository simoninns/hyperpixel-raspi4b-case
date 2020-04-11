/************************************************************************

	components.scad
    
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

module components()
{
    move([0,0,1.6]) {
        // RF shield
        color("silver") move([6.5,36,0]) cuboid([11,13,2], center=false, fillet=0.25);

        // CPU
        color([0.2,0.2,0.2]) move([21.9,25,0]) cuboid([15,15,1], center=false);
        color("grey") move([21.9,25,1]) cuboid([15,15,0.25], center=false, fillet = 1, edges=EDGES_Z_ALL);
        color("grey") move([21.9+1,25+1,1.25]) cuboid([13,13,0.75], center=false, fillet = 1, edges=EDGES_Z_ALL);

        // RAM
        color([0.2,0.2,0.2]) move([39,25,0]) cuboid([11.75,15,1], center=false);

        // Chip 1
        color([0.2,0.2,0.2]) move([55.6,35,0]) cuboid([6.1,6.1,1], center=false);

        // Chip 2
        color([0.2,0.2,0.2]) move([55.7,20,0]) cuboid([8,8,1], center=false);

        // Activity LED
        color("red") move([0.5,10.75,0]) cuboid([1,1.5,1], center=false, fillet = 0.25, edges=EDGES_Z_ALL);

        // Power LED
        color("red") move([0.5,7.15,0]) cuboid([1,1.5,1], center=false, fillet = 0.25, edges=EDGES_Z_ALL);

    }
}