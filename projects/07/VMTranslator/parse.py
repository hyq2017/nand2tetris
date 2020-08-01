import sys
from cmdtable import CmdTable

class Parse():
    """
    Reads a VM command, parses the command into its lexical components, \
        and provides convenient access to these components.
    Ignores all white space and comments
    """

    def __init__(self, inputfile):
        self.ctable = CmdTable()

        self.inputfile = inputfile
        self.lines = []
        self.current_line = -1

        with open(self.inputfile) as fo:
            for line in fo:
                normal_line = line.split("//")[0]
                normal_line = normal_line.strip("\n")
                if normal_line != "":
                    self.lines.append(normal_line)
        
        self.num_lines = len(self.lines)

    def hasMoreCommands(self):
        """ Are there more commands in the input? """
        return self.current_line + 1 < self.num_lines

    def advance(self):
        """ Reads the next command from the input and make it the current command"""
        if self.hasMoreCommands():
            self.current_line += 1
            self.current_cmd = self.lines[self.current_line]
            self.format_cmd = self.current_cmd.split()
        else:
            print("No more line for advance !!!")

    def cmdType(self):
        """ returns a constant representing the type of the current command """
        return self.ctable.getCmdType(self.format_cmd[0])

    def arg1(self):
        """ return the first argument of the current command """
        if self.cmdType() == "C_RETURN":
            print("No argument for command return!")
        elif self.cmdType() == "C_ARITHMETIC":
            return self.format_cmd[0]
        else:
            return self.format_cmd[1]

    def arg2(self):
        """ return the second argument of the current command """
        if self.cmdType() == "C_PUSH" or self.cmdType() == "C_POP" \
            or self.cmdType() =="C_FUNCTION" or self.cmdType() == "C_CALL":
            return self.format_cmd[2]
        else:
            print("No second argument for this command! ")
