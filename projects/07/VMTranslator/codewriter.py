import os
from cmdtable import CmdTable

class CodeWriter():
    """
    Generates assembly code from the parsed VM command
    """

    def __init__(self, outputfile):
        self.ctable = CmdTable()
        self.outputfile = outputfile
        self.file = open(self.outputfile, mode='w')
        self.t  = 0
        self.filename = os.path.basename(outputfile).partition(".")[0]

    def writeArithmetic(self, cmdstr):
        self.file.write("// " + cmdstr + "\n")
        self.cmds = self.ctable.getArithmetic(cmdstr)
        for cmd in self.cmds:
            self.file.write(cmd + "\n")

    def writePushPop(self, cmdstr, segment, index):
        self.file.write("// " + cmdstr[2:].lower() + " " + segment + " " + index + "\n")
        self.cmds = self.ctable.getPushPop(cmdstr, segment, index)
        for cmd in self.cmds:   
            self.file.write(cmd.replace("static",self.filename) + "\n")

    def close(self):
        self.file.close()
