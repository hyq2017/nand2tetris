
class CodeWriter():
    """
    Generates assembly code from the parsed VM command
    """

    def __init__(self, fout, ctable):
        self.file = fout
        self.ctable = ctable

    def writeBoot(self):
        self.boot_cmds = self.ctable.getBoot()
        for cmd in self.boot_cmds:
            self.file.write(cmd + "\n")

    def writeArithmetic(self, cmdstr):
        self.cmds = self.ctable.getArithmetic(cmdstr)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writePushPop(self, cmdstr, segment, index):
        self.cmds = self.ctable.getPushPop(cmdstr, segment, index)
        for cmd in self.cmds:   
            self.file.write(cmd.replace("static",self.in_filename) + "\n")

    def writeLabel(self, cmdstr):
        self.cmds = self.ctable.getLabel(cmdstr)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writeIf(self, cmdstr):
        self.cmds = self.ctable.getIf(cmdstr)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writeGoto(self, cmdstr):
        self.cmds = self.ctable.getGoto(cmdstr)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writeFunction(self, funcname, numvars):
        self.cmds = self.ctable.getFunction(funcname, numvars)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writeReturn(self):
        self.cmds = self.ctable.getReturn()
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writeCall(self, funcname, numargs):
        self.cmds = self.ctable.getCall(funcname, numargs)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def close(self):
        self.file.close()

    def setInputname(self, in_filename):
        self.in_filename = in_filename
