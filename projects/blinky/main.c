
#include <msp430.h>
#include <stdbool.h>

#define START_OF_RAM ((unsigned int *) 0x200)
extern unsigned int * const _stack;

unsigned int var1 = 0xDEAD;
unsigned int var2 = 0xBEEF;
unsigned int temp = 0;

int _system_pre_init(void)
{
    // This object is allocated on the stack
    unsigned int * working_ptr = START_OF_RAM;

    /* From the TI C/C++ compiler manual.
     * _system_pre_init(): This function provides a place to perform application-specific initialization. It is invoked
     * after the stack pointer is initialized but before any C/C++ environment setup is performed. By default,
     * _system_pre_init() should return a non-zero value. The default C/C++ environment setup is bypassed if
     * _system_pre_init() returns 0.
    */

    // Zero RAM before C/C++ enviroment setup
    while(working_ptr < _stack)
    {
        *working_ptr = 0;
        working_ptr++;
    }

    //Initialize memory allocated for the stack with a known value to inspect stack consumption
    working_ptr = (unsigned int *) __get_SP_register();
    // Write 0xAA to stack not being used
    while(working_ptr > _stack)
    {
        // Decrement first, so we don't overwrite 'working_ptr', what the SP was pointing at.
        working_ptr--;
        *working_ptr = 0xAAAA;
    }

    return 1;
}

/**
 * blink.c
 */
void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;		// stop watchdog timer

	P1DIR |= 0x01;                  // configure P1.0 as output
	volatile unsigned int i;		// volatile to prevent optimization
	while(1)
	{
		P1OUT ^= 0x01;				// toggle P1.0
		for(i=10000; i>0; i--);     // delay
		temp = var1;
		var1 = var2;
		var2 = temp;
	}
}
