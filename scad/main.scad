/************************************************************************

	main.scad
    
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

include <./rasppi4b/rasppi4b.scad>
include <./hyperpixel/hyperpixel.scad>
include <case.scad>
include <prusa_mk3s_bracket.scad>
include <desk_stand.scad>

// Rendering quality
$fn = 20;

// Choose what to display:
display_upper_case = "Yes"; // [Yes, No]
display_lower_case = "Yes"; // [Yes, No]
display_pi4 = "Yes"; // [Yes, No]
display_hyperpixel = "Yes"; // [Yes, No]
display_prusa_bracket = "Yes"; // [Yes, No]
display_desk_stand = "2"; // [0, 1, 2]

// Lift the upper case?
lift_upper_case = "Yes"; // [Yes, No]

// Render the Raspberry Pi 4B board
if (display_pi4 == "Yes") rasppi4b();

// Render the Hyperpixel 4.0 display
if (display_hyperpixel == "Yes") hyperpixel();

// Render the lower case
if (display_lower_case == "Yes") lower_case();

// Render the upper case
lift = (lift_upper_case == "Yes") ? 30:0;
if (display_upper_case == "Yes") upper_case(lift);

// Render the Prusa MK3S bracket
if (display_prusa_bracket == "Yes") prusa_mk3s_bracket();

// Render the desk stand
if (display_desk_stand != "0") desk_stand(display_desk_stand);
