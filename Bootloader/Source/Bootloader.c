//
// Created by cocon on 21.04.2025.
//
/**
* this is the bootloader for my custom OS -(esp32 -specific) FREEMxsxllTos.
It is called after Startup.s is run to finish the loading and initializing of the Chip
it is flashed to 0x10000
*/
#include <stdint.h>
#define UART ((volatile uint32_t*) 0x6000_0000)


extern void main (void);

void boot_main (void){
    while(1){
      *UART = 'c'
    }
}