// function SimpleFunction.test 2
(SimpleFunction.test)
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
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// not
@SP
A=M-1
M=!M
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
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
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
