// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
@8192
D = A
@SCREEN
D = D + A
@MAXSCREEN
M = D
(KEYBOARDLOOP)
    @SCREEN
    D = A
    @address
    M = D
    @KBD
    D = M
    @WHITE
    D;JEQ
    @BLACK
    0;JMP
(WHITE)
    @color
    M = 0
    @SCREENLOOP
    0;JMP
(BLACK)
    @color
    M = -1
    @SCREENLOOP
    0;JMP

(SCREENLOOP)
    @color
    D = M
    @address
    A = M
    M = D
    D = A + 1
    @address
    M = D
    @MAXSCREEN
    D = D - M
    @SCREENLOOP
    D;JNE

@KEYBOARDLOOP
0;JMP
(END)