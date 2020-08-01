// push constant 17
@17
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 17
@17
D=A
@SP
AM=M+1
A=A-1
M=D
// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ1
D;JEQ
@SP
A=M-1
M=0
@NOTEQ1
0;JMP
(EQ1)
@SP
A=M-1
M=-1
(NOTEQ1)
// push constant 17
@17
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 16
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ2
D;JEQ
@SP
A=M-1
M=0
@NOTEQ2
0;JMP
(EQ2)
@SP
A=M-1
M=-1
(NOTEQ2)
// push constant 16
@16
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 17
@17
D=A
@SP
AM=M+1
A=A-1
M=D
// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ3
D;JEQ
@SP
A=M-1
M=0
@NOTEQ3
0;JMP
(EQ3)
@SP
A=M-1
M=-1
(NOTEQ3)
// push constant 892
@892
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 891
@891
D=A
@SP
AM=M+1
A=A-1
M=D
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@LT1
D;JLT
@SP
A=M-1
M=0
@NOTLT1
0;JMP
(LT1)
@SP
A=M-1
M=-1
(NOTLT1)
// push constant 891
@891
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 892
@892
D=A
@SP
AM=M+1
A=A-1
M=D
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@LT2
D;JLT
@SP
A=M-1
M=0
@NOTLT2
0;JMP
(LT2)
@SP
A=M-1
M=-1
(NOTLT2)
// push constant 891
@891
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 891
@891
D=A
@SP
AM=M+1
A=A-1
M=D
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@LT3
D;JLT
@SP
A=M-1
M=0
@NOTLT3
0;JMP
(LT3)
@SP
A=M-1
M=-1
(NOTLT3)
// push constant 32767
@32767
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 32766
@32766
D=A
@SP
AM=M+1
A=A-1
M=D
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@GT1
D;JGT
@SP
A=M-1
M=0
@NOTGT1
0;JMP
(GT1)
@SP
A=M-1
M=-1
(NOTGT1)
// push constant 32766
@32766
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 32767
@32767
D=A
@SP
AM=M+1
A=A-1
M=D
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@GT2
D;JGT
@SP
A=M-1
M=0
@NOTGT2
0;JMP
(GT2)
@SP
A=M-1
M=-1
(NOTGT2)
// push constant 32766
@32766
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 32766
@32766
D=A
@SP
AM=M+1
A=A-1
M=D
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@GT3
D;JGT
@SP
A=M-1
M=0
@NOTGT3
0;JMP
(GT3)
@SP
A=M-1
M=-1
(NOTGT3)
// push constant 57
@57
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 31
@31
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 53
@53
D=A
@SP
AM=M+1
A=A-1
M=D
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// push constant 112
@112
D=A
@SP
AM=M+1
A=A-1
M=D
// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D
// neg
@SP
A=M-1
M=-M
// and
@SP
AM=M-1
D=M
A=A-1
M=D&M
// push constant 82
@82
D=A
@SP
AM=M+1
A=A-1
M=D
// or
@SP
AM=M-1
D=M
A=A-1
M=D|M
// not
@SP
A=M-1
M=!M
