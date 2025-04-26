/*
ENTRY(_start)
tells the linker that _start is the label in the startup.S that
should get executed as first
 */
ENTRY(_start)

/*
SECTIONS{
}
makes the sections of the memory clear
 */
SECTIONS
{
    /*
    .entry section is placed at 0x400000000,
    because the ESP32 runs Code from IRAM (Instruction RAM)
    at 0x400000000
    It is aligned to 4 or 16 bytes (2^4)
    alignemnt is necesarry so the cpu doesnt crash

     */
    .entry 0x40000000 : ALIGN(4)
    {
        /*
        The linker keeps al content from .entry so that it doesnt belive that it is
        unused.
        This could later be critical
         */
        KEEP(*(.entry))
    }
    .data : ALIGN(4)
    {
        /*
        places al initialized globals in here
         */
        *(.data*)
    }
    .bss : ALIGN(4)
    {
        /*
        place uninitialized variables here
         */
        *(.bss*)
        *(COMMON)
    }
}