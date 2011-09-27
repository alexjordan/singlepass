/****************************************************************************/
/*  lnk.cmd   v#####                                                        */
/*  Copyright (c) 1996@%%%%  Texas Instruments Incorporated                 */
/*    Usage:  cl6x  -z <obj files...> -o <out file> -m <map file> lnk.cmd   */
/*            cl6x  <src files...> -z -o <out file> -m <map file> lnk.cmd   */
/*                                                                          */
/*    Description: This file is a sample linker command file that can be    */
/*                 used for linking programs built with the C compiler and  */
/*                 running the resulting .out file on a C620x/C670x         */
/*                 simulator.  Use it as a guideline.  You will want to     */
/*                 change the memory layout to match your specific C6xxx    */
/*                 target system.  You may want to change the allocation    */
/*                 scheme according to the size of your program.            */
/*                                                                          */
/*    Notes: (1)   You must specivy a directory in which rts6x00.lib is     */
/*                 located.  either add a -i"<directory>" line to this      */
/*                 file or use the system environment variable C6X_C_DIR    */
/*                 to specify a search path for the libraries.              */
/*                                                                          */
/****************************************************************************/
-c
-heap  0x800000 /* 8M heap */
-stack 0x6000

/* Memory Map 1 - the default */
/* Note: 16M BMEM to accomodate heap */
MEMORY
{
        PMEM:   o = 00000020h   l = 0000ffe0h 
        EXT0:   o = 00400000h   l = 01000000h
        EXT1:   o = 01400000h   l = 00400000h
        EXT2:   o = 02000000h   l = 01000000h
        EXT3:   o = 03000000h   l = 01000000h
        BMEM:   o = 80000000h   l = 01000000h
} 

/* Memory Map 0 */
/* 
MEMORY
{
        EXT0:   o = 00000000h   l = 01000000h
        EXT1:   o = 01000000h   l = 00400000h
        PMEM:   o = 01400000h   l = 00010000h 
        EXT2:   o = 02000000h   l = 01000000h
        EXT3:   o = 03000000h   l = 01000000h
        BMEM:   o = 80000000h   l = 00010000h 
}
*/

SECTIONS
{
    .text       >       PMEM | EXT0 | EXT1 | EXT3
    .stack      >       BMEM
    
    /*-----------------------------------------------------------------------*/
    /* In EABI (--abi=eabi) mode, the compiler generates the following       */
    /* sections that are accessed using the near DP addressing (DP[15-bit]): */
    /*   .neardata - initialized read-write data                             */
    /*   .rodata   - initialized read-only  data                             */
    /*   .bss      - uninitialized data                                      */
    /* These sections should be co-located so that they are placed within    */
    /* DP range.                                                             */
    /*                                                                       */
    /* In COFF (--abi=coffabi) mode, the compiler only generates .bss section*/
    /*-----------------------------------------------------------------------*/
    GROUP (NEARDP)
    {
       .neardata   /* ELF only */
       .rodata     /* ELF only */
       .bss        /* COFF & ELF */
    }           >       BMEM

    .cinit      >       BMEM
    .cio        >       BMEM 
    .const      >       BMEM
    .data       >       BMEM
    .switch     >       BMEM 
    .sysmem     >       BMEM
    .far        >       EXT2
    .fardata    >       EXT2   /* ELF only */
    .ppdata     >       EXT2
}
