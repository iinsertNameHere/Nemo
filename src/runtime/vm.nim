import "../asm/datatypes"
import "../asm/bytecode"

import std/monotimes

type CVM* = object
    ## Virtual Machine that holds a Stack, a program, a programSize and a memory 
    stack*: Stack

    returnAddressStack*: seq[uint64]

    program*: Program
    programSize: uint
    cursorIndex*: uint64

    monotime*: MonoTime

proc CreateCVM*(program: Program): CVM =
    ## Function that Creates a new CVM instance
    result.program = program
    result.programSize = uint(program.len)
    result.cursorIndex = 0

    result.monotime = getMonoTime()