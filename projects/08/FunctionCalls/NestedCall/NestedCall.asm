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
// push constant 4000
@4000
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D
// push constant 5000
@5000
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 1
@SP
AM=M-1
D=M
@THAT
M=D
// call Sys.main 0
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
@Sys.main
0;JMP
// set_retlabel
(Sys.init$ret.2)
// pop temp 1
@SP
AM=M-1
D=M
@6
M=D
// label LOOP
(Sys.init$LOOP)
// goto LOOP
@Sys.init$LOOP
0;JMP
// function Sys.main 5
(Sys.main)
// push constant 0
@0
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 0
@0
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 0
@0
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 0
@0
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 0
@0
D=A
@SP
AM=M+1
A=A-1
M=D
// push constant 4001
@4001
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D
// push constant 5001
@5001
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 1
@SP
AM=M-1
D=M
@THAT
M=D
// push constant 200
@200
D=A
@SP
AM=M+1
A=A-1
M=D
// pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// push constant 40
@40
D=A
@SP
AM=M+1
A=A-1
M=D
// pop local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// push constant 6
@6
D=A
@SP
AM=M+1
A=A-1
M=D
// pop local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// push constant 123
@123
D=A
@SP
AM=M+1
A=A-1
M=D
// call Sys.add12 1
// push_Label
@Sys.main$ret.3
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
@Sys.add12
0;JMP
// set_retlabel
(Sys.main$ret.3)
// pop temp 0
@SP
AM=M-1
D=M
@5
M=D
// push local 0
@LCL
D=M
@0
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push local 1
@LCL
D=M
@1
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push local 2
@LCL
D=M
@2
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push local 3
@LCL
D=M
@3
A=A+D
D=M
@SP
AM=M+1
A=A-1
M=D
// push local 4
@LCL
D=M
@4
A=A+D
D=M
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
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
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
// function Sys.add12 0
(Sys.add12)
// push constant 4002
@4002
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D
// push constant 5002
@5002
D=A
@SP
AM=M+1
A=A-1
M=D
// pop pointer 1
@SP
AM=M-1
D=M
@THAT
M=D
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
// push constant 12
@12
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
