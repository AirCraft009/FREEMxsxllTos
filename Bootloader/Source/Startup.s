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

.section .entry, "ax"
.global ._start
.extern boot_main

_start:
    l32r a1, _stack_top
    call0 boot_main

_stack_top:
    .word 0x3FFD_FFFF