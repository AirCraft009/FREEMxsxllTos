

ENTRY(_start)

SECTIONS{
    .entry 0x40000000 : ALIGN(4){
    KEEP(*)
    }
}