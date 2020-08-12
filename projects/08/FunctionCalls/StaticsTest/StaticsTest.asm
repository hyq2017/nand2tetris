// function Sys.init 0
(Sys.init)
// push constant 6
@6
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 8
@8
D=A
@SP
AM=M+1
A=A-1
M=D
// call Class1.set 2
// push_Label
@Sys.init$ret.1
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
@2
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Class1.set
0;JMP
// set_retlabel
(Sys.init$ret.1)
// pop temp 0
@SP
AM=M-1
D=M
@5
M=D
// push constant 23
@23
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 15
@15
D=A
@SP
AM=M+1
A=A-1
M=D
// call Class2.set 2
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
@2
D=D-A
@ARG
M=D
// ser_LCL
@SP
D=M
@LCL
M=D
// goto_func
@Class2.set
0;JMP
// set_retlabel
(Sys.init$ret.2)
// pop temp 0
@SP
AM=M-1
D=M
@5
M=D
// call Class1.get 0
// push_Label
@Sys.init$ret.3
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
@Class1.get
0;JMP
// set_retlabel
(Sys.init$ret.3)
// call Class2.get 0
// push_Label
@Sys.init$ret.4
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
@Class2.get
0;JMP
// set_retlabel
(Sys.init$ret.4)
// label WHILE
(Sys.init$WHILE)
// goto WHILE
@Sys.init$WHILE
0;JMP
// function Class1.set 0
(Class1.set)
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
// pop Class1 0
@SP
AM=M-1
D=M
@Class1.0
M=D
// push argument 1
@ARG
D=M
@1
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// pop Class1 1
@SP
AM=M-1
D=M
@Class1.1
M=D
// push constant 0
@0
D=A
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
// function Class1.get 0
(Class1.get)
// push Class1 0
@Class1.0
D=M
@SP
AM=M+1
A=A-1
M=D
// push Class1 1
@Class1.1
D=M
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
// function Class2.set 0
(Class2.set)
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
// pop Class2 0
@SP
AM=M-1
D=M
@Class2.0
M=D
// push argument 1
@ARG
D=M
@1
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// pop Class2 1
@SP
AM=M-1
D=M
@Class2.1
M=D
// push constant 0
@0
D=A
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
@retAddr3
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
@retAddr3
A=M
0;JMP
// function Class2.get 0
(Class2.get)
// push Class2 0
@Class2.0
D=M
@SP
AM=M+1
A=A-1
M=D
// push Class2 1
@Class2.1
D=M
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
@retAddr4
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
@retAddr4
A=M
0;JMP
