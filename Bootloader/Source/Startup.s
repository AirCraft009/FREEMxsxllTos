/* Startup.s - esp32 specific Startup code for FREEMxsxllTos OS
 * Copyright (C) 2025  cocon
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
.section .entry makes it clear that this is the start
the flags "ax" stand for:
    a:
        allocated(this needs space in memory
    x:
        executable()
*/

.section .entry, "ax"
/*
global ._start makes the _start label global so its clear what has to be
run first
*/
.global ._start
/*
clarifies that boot_main is not to find in this assembly file but is
defined somewhere else
*/
.extern boot_main

_start:
    /*
    sets up the stack top
    a1 is the stack pointer in xtensa
    then it calls boot_main with calling convention 0 (simple no-windowed call),
    meaning it saves the return adress in this case in a0
    and sets up a basic call frame
    */
    l32r a1, _stack_top
    /*
    goes into the C method
    */
    call0 boot_main

_stack_top:
    .word 0x4007FFFF