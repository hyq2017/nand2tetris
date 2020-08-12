import copy
class CmdTable():
    def __init__(self):
        self.funcname = ""
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
            "lt": 0,
            "return": 0,
            "call": 0
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

        self.ifgoto = ["@SP", "AM=M-1", "D=M", "@", "D;JNE"]
        self.goto = ["@", "0;JMP"]

        self.func_cmds = ["()"]

        self.return_cmds = {
            "set_endFrame": ["@LCL", "D=M", "@endFrame", "M=D"],
            "set_retAddr" : ["@endFrame", "D=M", "@5", "A=D-A", "D=M", "@retAddr", "M=D"],
            "get_retvalue": ["@SP", "AM=M-1", "D=M", "@ARG", "A=M", "M=D"],
            "reset_SP"    : ["@ARG", "D=M", "@1", "D=D+A", "@SP", "M=D"],
            "restore_THAT": ["@endFrame", "D=M", "@1", "A=D-A", "D=M", "@THAT", "M=D"],
            "restore_THIS": ["@endFrame", "D=M", "@2", "A=D-A", "D=M", "@THIS", "M=D"],
            "restore_ARG" : ["@endFrame", "D=M", "@3", "A=D-A", "D=M", "@ARG", "M=D"],
            "restore_LCL" : ["@endFrame", "D=M", "@4", "A=D-A", "D=M", "@LCL", "M=D"],
            "goto_retAddr": ["@retAddr", "A=M", "0;JMP"]
        }

        self.call_cmds = {
            "push_Label": ["@", "D=A", "@SP", "AM=M+1", "A=A-1", "M=D"],
            "push_LCL": ["@LCL", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D"],
            "push_ARG": ["@ARG", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D"],
            "push_THIS": ["@THIS", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D"],
            "push_THAT": ["@THAT", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D"],
            "set_ARG": ["@SP", "D=M", "@5", "D=D-A", "@", "D=D-A", "@ARG", "M=D"],
            "ser_LCL": ["@SP", "D=M", "@LCL", "M=D"],
            "goto_func": ["@", "0;JMP"],
            "set_retlabel": ["()"]
        }

        self.boot_cmd = ["@256", "D=A", "@SP", "M=D"]

    def getCmdType(self, cmdstr):
        return self.cmdtypes[cmdstr]

    def getArithmetic(self,cmdstr):
        comment = ["// " + cmdstr]
        arithmetic = self.arithmetics[cmdstr][:]
        if cmdstr == "eq" or cmdstr == "gt" or cmdstr == "lt":
            self.jump_count[cmdstr] += 1
            arithmetic[5] = arithmetic[5] + str(self.jump_count[cmdstr])
            arithmetic[10] = arithmetic[10] + str(self.jump_count[cmdstr])
            arithmetic[12] = arithmetic[12][:-1] + str(self.jump_count[cmdstr]) + arithmetic[12][-1]
            arithmetic[16] = arithmetic[16][:-1] + str(self.jump_count[cmdstr]) + arithmetic[16][-1]
        return comment + arithmetic

    def getPushPop(self, cmdstr, segment, index):
        i = str(index)
        comment = ["// " + cmdstr[2:].lower() + " " + segment + " " + i ]
        if cmdstr == "C_PUSH":
            if segment == "constant":
                cmd = self.pushconst[:]
                cmd[0] = cmd[0] + i
            elif segment == "temp":
                cmd = self.pushtemp[:]
                ii = 5 + index
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
                ii = 5 + index
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
        return comment + cmd

    def getLabel(self, cmdstr):
        comment = ["// label " +cmdstr]
        gotolabel = ["(" + self.funcname + cmdstr + ")"]
        return comment + gotolabel

    def getIf(self, cmdstr):
        comment = ["// if-goto " +cmdstr]
        ifgoto = self.ifgoto[:]
        ifgoto[3] = ifgoto[3] + self.funcname + cmdstr
        return comment + ifgoto

    def getGoto(self, cmdstr):
        comment = ["// goto " +cmdstr]
        goto = self.goto[:]
        goto[0] = goto[0] + self.funcname + cmdstr
        return comment + goto

    def getFunction(self, funcname, nvars):
        comment = ["// function " + funcname + " " + str(nvars)]
        self.funcname = funcname + "$"
        cmdlist = ["(" + funcname + ")"]
        for i in range(nvars):
            cmdlist += self.getPushPop("C_PUSH", "constant", 0)
        return comment + cmdlist

    def getReturn(self):
        comment = ["// return"]
        cmdlist = []
        self.jump_count["return"] += 1
        return_cmds = copy.deepcopy(self.return_cmds)
        return_cmds["set_retAddr"][5] += str(self.jump_count["return"])
        return_cmds["goto_retAddr"][0] += str(self.jump_count["return"])
        for k, v in return_cmds.items():
            v.insert(0,"// " + k)
            cmdlist += v
        return comment + cmdlist

    def getCall(self, funcname, nargs):
        comment = ["// call " + funcname + " " + str(nargs)]
        cmdlist = []
        self.jump_count["call"] += 1
        call_cmds = copy.deepcopy(self.call_cmds)
        call_cmds["push_Label"][0] += self.funcname + "ret." + str(self.jump_count["call"])
        call_cmds["set_ARG"][4] += str(nargs)
        call_cmds["goto_func"][0] += funcname
        call_cmds["set_retlabel"][0] = "(" + self.funcname + "ret." + str(self.jump_count["call"]) + ")"
        for k, v in call_cmds.items():
            v.insert(0,"// " + k)
            cmdlist += v
        return comment + cmdlist

    def getBoot(self):
        comment = ["// Bootstrap code"]
        cmdlist = self.boot_cmd + self.getCall("Sys.init", 0)
        return comment + cmdlist
