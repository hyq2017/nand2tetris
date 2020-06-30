// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    @SCREEN
    D=A
    @addr
    M=D  //  addr = 16384

    @KBD
    D=M

    @FILL
    D;JNE  //if k/=0, goto FILL

    @CLEAR
    D;JEQ  //if k=0, goto CLEAR

(CLEAR)
    @addr
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ  // if addr = KBD, goto loop

    @addr
    A=M
    M=0  //RAM[addr]=00000...

    @addr
    M=M+1
    @CLEAR
    0;JMP

(FILL)
    @addr
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ  // if addr = KBD, goto loop

    @addr
    A=M
    M=-1  //RAM[addr]=1111111...

    @addr
    M=M+1
    @FILL
    0;JMP


