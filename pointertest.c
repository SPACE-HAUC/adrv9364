#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// recasts pointer to 32-bit to void
void * ret_void_ptr ( uint32_t * ptr )
{
    return (void *) ptr ;
}

int main (void)
{
    uint32_t * buf = NULL ; // buffer
    buf = ( uint32_t * ) malloc ( 4 * sizeof(uint32_t)); // allocate for 4 32-bit numbers
    if ( buf == NULL ) // check alloc
        perror("Alloc failed\n") ;
    buf[0] = 0xdeadbeef; // constants
    buf[1] = 0xbaad3838;
    buf[2] = 0xa991ebad;
    buf[3] = 0xaa00bb11;

    unsigned int p_inc = 4 ; // sizeof uint32_t

    char * p_dat , * p_end ; // two pointers to bytes to traverse the buffer
    p_dat = (char*) ret_void_ptr(buf) ; // recast uint32_t* to char*
    p_end = (char*)((unsigned int)(&buf[3])+4) ; // byte next to end of buffer
    printf("P_dat: 0x%x, Pointer end: 0x%x, Pointer begin: 0x%x or 0x%x\n", (unsigned int) p_dat, (unsigned int)p_end, (unsigned int)ret_void_ptr(buf), (unsigned int)buf); // debug
    printf("Raw data:\n"); // print out the raw data byte by byte
    for ( char * dat = (char *)buf; dat < (char*)((unsigned int)(&buf[3])+4); dat += 1)
        printf("Addr: 0x%x | Data: 0x%2x\n", (unsigned int) dat, *dat) ; // shows that data is in LE format in memory
    for ( p_dat = (char*) ret_void_ptr(buf); p_dat < p_end ; p_dat += p_inc )
    {
        const int16_t i = ((int16_t*)p_dat)[0] ; // take byte, recast it to uint16_t 
        const int16_t q = ((int16_t*)p_dat)[1] ;
	// basically breaks the uint32_t into two int16_t parts without doing fancy rotations etc
	// evil pointer hack!
        printf("Pointer: 0x%x || Q: 0x%4x | I: 0x%4x\n", (unsigned int) p_dat, q & 0x0000ffff, i & 0x0000ffff) ;
	// Q and I are printed out of order because of LE format.
	// Bitwise and with 0x0000ffff to get it to print nicely. Should keep in mind while bitshifting right
	// as that introduces 1 in front.
    }
    return 0 ;
}
