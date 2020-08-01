class CmdTable():
    def __init__(self):
        self.cmdtypes = {
            "push"    : "C_PUSH",
            "pop"     : "C_POP",
            "add"     : "C_ARITHMETIC",
            "sub"     : "C_ARITHMETIC",
            "neg"     : "C_ARITHMETIC",
            "eq"      : "C_ARITHMETIC",
            "gt"      : "C_ARITHMETIC",
            "lt"      : "C_ARITHMETIC",
            "and"     : "C_ARITHMETIC",
            "or"      : "C_ARITHMETIC",
            "not"     : "C_ARITHMETIC",
            "label"   : "C_LABEL",
            "goto"    : "C_GOTO",
            "if-goto" : "C_IF",
            "function": "C_FUNCTION",
            "return"  : "C_RETURN",
            "call"    : "C_CALL"
        }

        self.arithmetics = {
            "add": ["@SP", "AM=M-1", "D=M", "A=A-1", "M=D+M"],
            "sub": ["@SP", "AM=M-1", "D=M", "A=A-1", "M=M-D"],
            "eq" : ["@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@EQ", "D;JEQ", \
                    "@SP", "A=M-1", "M=0", "@NOTEQ", "0;JMP", "(EQ)", "@SP", \
                    "A=M-1", "M=-1", "(NOTEQ)"],
            "gt" : ["@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@GT", "D;JGT", \
                    "@SP", "A=M-1", "M=0", "@NOTGT", "0;JMP", "(GT)", "@SP", \
                    "A=M-1", "M=-1", "(NOTGT)"],
            "lt" : ["@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@LT", "D;JLT", \
                    "@SP", "A=M-1", "M=0", "@NOTLT", "0;JMP", "(LT)", "@SP", \
                    "A=M-1", "M=-1", "(NOTLT)"],
            "neg": ["@SP", "A=M-1", "M=-M"],
            "not": ["@SP", "A=M-1", "M=!M"],
            "and": ["@SP", "AM=M-1", "D=M", "A=A-1", "M=D&M"],
            "or" : ["@SP", "AM=M-1", "D=M", "A=A-1", "M=D|M"]
        }

        self.jump_count = {
            "eq": 0,
            "gt": 0,
            "lt": 0
        }

        self.pushconst = ["@", "D=A", "@SP", "AM=M+1", "A=A-1", "M=D"]
        self.pushlocal     = ["@", "D=M", "@", "A=A+D", "D=M", \
                         "@SP", "AM=M+1", "A=A-1", "M=D"]
        self.pushtemp      = ["@", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D"]
 
        self.poplocal  = ["@", "D=M", "@", "D=D+A", "@R13", "M=D", \
                         "@SP", "AM=M-1", "D=M", "@R13", "A=M", "M=D"]
        self.poptemp   = ["@SP", "AM=M-1", "D=M", "@", "M=D"]

        self.baseaddr = {
            "local": "LCL",
            "argument": "ARG",
            "this": "THIS",
            "that": "THAT"
        }

        self.pointer = {
            "0": "THIS", 
            "1": "THAT"
        }

    def getCmdType(self, cmdstr):
        return self.cmdtypes[cmdstr]

    def getArithmetic(self,cmdstr):
        arithmetic = self.arithmetics[cmdstr][:]
        if cmdstr == "eq" or cmdstr == "gt" or cmdstr == "lt":
            self.jump_count[cmdstr] += 1
            arithmetic[5] = arithmetic[5] + str(self.jump_count[cmdstr])
            arithmetic[10] = arithmetic[10] + str(self.jump_count[cmdstr])
            arithmetic[12] = arithmetic[12][:-1] + str(self.jump_count[cmdstr]) + arithmetic[12][-1]
            arithmetic[16] = arithmetic[16][:-1] + str(self.jump_count[cmdstr]) + arithmetic[16][-1]
        return arithmetic

    def getPushPop(self, cmdstr, segment, i):
        if cmdstr == "C_PUSH":
            if segment == "constant":
                cmd = self.pushconst[:]
                cmd[0] = cmd[0] + i
            elif segment == "temp":
                cmd = self.pushtemp[:]
                ii = 5 + int(i)
                cmd[0] = cmd[0] + str(ii)
            elif segment == "pointer":
                cmd = self.pushtemp[:]
                cmd[0] = cmd[0] + self.pointer[i]
            elif segment == "static":
                cmd = self.pushtemp[:]
                cmd[0] = cmd[0] + "static." + i
            else:
                cmd = self.pushlocal[:]
                cmd[0] = cmd[0] + self.baseaddr[segment]
                cmd[2] = cmd[2] + i
        else:
            if segment == "temp":
                cmd = self.poptemp[:]
                ii = 5 + int(i)
                cmd[3] = cmd[3] + str(ii)
            elif segment == "pointer":
                cmd = self.poptemp[:]
                cmd[3] = cmd[3] + self.pointer[i]
            elif segment == "static":
                cmd = self.poptemp[:]
                cmd[3] = cmd[3] + "static." + i
            else:
                cmd = self.poplocal[:]
                cmd[0] = cmd[0] + self.baseaddr[segment]
                cmd[2] = cmd[2] + i
        return cmd
