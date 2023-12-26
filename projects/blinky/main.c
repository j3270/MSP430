
#include <msp430.h>
#include <stdbool.h>

unsigned int var1 = 0xDEAD;
unsigned int var2 = 0xBEEF;
unsigned int temp = 0;

#if defined(__LARGE_DATA_MODEL__)
extern long _stack;
#define DATA_PTR_TYPE long
#else
extern int _stack;
#define DATA_PTR_TYPE int
#endif

#define START_OF_RAM (DATA_PTR_TYPE) (0x2400)

int _system_pre_init(void)
{
    // This object is allocated on the stack
    long working_ptr = START_OF_RAM;

    /* From the TI C/C++ compiler manual.
     * _system_pre_init(): This function provides a place to perform application-specific initialization. It is invoked
     * after the stack pointer is initialized but before any C/C++ environment setup is performed. By default,
     * _system_pre_init() should return a non-zero value. The default C/C++ environment setup is bypassed if
     * _system_pre_init() returns 0.
    */

    // Zero RAM before C/C++ enviroment setup

    while(((DATA_PTR_TYPE *) working_ptr) < &_stack)
    {
        *((DATA_PTR_TYPE *) working_ptr) = 0;
        working_ptr += 2;
    }

    //Initialize memory allocated for the stack with a known value to inspect stack consumption
    working_ptr = __get_SP_register();
    // Write 0xAA to stack not being used
    while(((DATA_PTR_TYPE *) working_ptr) > &_stack)
    {
        // Decrement first, so we don't overwrite 'working_ptr', what the SP was pointing at.
        working_ptr -= 2;
        *((DATA_PTR_TYPE *) working_ptr) = 0xAAAA;
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
