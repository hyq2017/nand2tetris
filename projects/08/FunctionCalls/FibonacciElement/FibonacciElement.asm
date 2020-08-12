// Bootstrap code
@256
D=A
@SP
M=D
// call Sys.init 0
// push_Label
@ret.1
D=A
@SP
AM=M+1
A=A-1
M=D
// push_LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push_ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// set_ARG
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Sys.init
0;JMP
// set_retlabel
(ret.1)
// function Sys.init 0
(Sys.init)
// push constant 4
@4
D=A
@SP
AM=M+1
A=A-1
M=D
// call Main.fibonacci 1
// push_Label
@Sys.init$ret.2
D=A
@SP
AM=M+1
A=A-1
M=D
// push_LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push_ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// set_ARG
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Main.fibonacci
0;JMP
// set_retlabel
(Sys.init$ret.2)
// label WHILE
(Sys.init$WHILE)
// goto WHILE
@Sys.init$WHILE
0;JMP
// function Main.fibonacci 0
(Main.fibonacci)
// push argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push constant 2
@2
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
// if-goto IF_TRUE
@SP
AM=M-1
D=M
@Main.fibonacci$IF_TRUE
D;JNE
// goto IF_FALSE
@Main.fibonacci$IF_FALSE
0;JMP
// label IF_TRUE
(Main.fibonacci$IF_TRUE)
// push argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// return
// set_endFrame
@LCL
D=M
@endFrame
M=D
// set_retAddr
@endFrame
D=M
@5
A=D-A
D=M
@retAddr1
M=D
// get_retvalue
@SP
AM=M-1
D=M
@ARG
A=M
M=D
// reset_SP
@ARG
D=M
@1
D=D+A
@SP
M=D
// restore_THAT
@endFrame
D=M
@1
A=D-A
D=M
@THAT
M=D
// restore_THIS
@endFrame
D=M
@2
A=D-A
D=M
@THIS
M=D
// restore_ARG
@endFrame
D=M
@3
A=D-A
D=M
@ARG
M=D
// restore_LCL
@endFrame
D=M
@4
A=D-A
D=M
@LCL
M=D
// goto_retAddr
@retAddr1
A=M
0;JMP
// label IF_FALSE
(Main.fibonacci$IF_FALSE)
// push argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push constant 2
@2
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
// call Main.fibonacci 1
// push_Label
@Main.fibonacci$ret.3
D=A
@SP
AM=M+1
A=A-1
M=D
// push_LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push_ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// set_ARG
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Main.fibonacci
0;JMP
// set_retlabel
(Main.fibonacci$ret.3)
// push argument 0
@ARG
D=M
@0
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push constant 1
@1
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
// call Main.fibonacci 1
// push_Label
@Main.fibonacci$ret.4
D=A
@SP
AM=M+1
A=A-1
M=D
// push_LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push_ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push_THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// set_ARG
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Main.fibonacci
0;JMP
// set_retlabel
(Main.fibonacci$ret.4)
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// return
// set_endFrame
@LCL
D=M
@endFrame
M=D
// set_retAddr
@endFrame
D=M
@5
A=D-A
D=M
@retAddr2
M=D
// get_retvalue
@SP
AM=M-1
D=M
@ARG
A=M
M=D
// reset_SP
@ARG
D=M
@1
D=D+A
@SP
M=D
// restore_THAT
@endFrame
D=M
@1
A=D-A
D=M
@THAT
M=D
// restore_THIS
@endFrame
D=M
@2
A=D-A
D=M
@THIS
M=D
// restore_ARG
@endFrame
D=M
@3
A=D-A
D=M
@ARG
M=D
// restore_LCL
@endFrame
D=M
@4
A=D-A
D=M
@LCL
M=D
// goto_retAddr
@retAddr2
A=M
0;JMP
