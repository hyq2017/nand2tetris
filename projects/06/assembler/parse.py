'''
@Author: hanyanqiang
@Date: 2020-06-19 20:59:57
@LastEditors: hanyanqiang
@LastEditTime: 2020-06-24 18:01:04
'''
import sys

class Parse():

    def __init__(self,inputfile):
        self.inputfile = inputfile
        self.current_line = -1
        self.current_cmd = -1
        self.lines = []

        with open(self.inputfile) as fo:
            for line in fo:
                normal_line = "".join(line.split()).split("//")[0]
                if normal_line != "":
                    self.lines.append(normal_line) 

        self.num_lines = len(self.lines)

    def advance(self):
        self.current_line += 1
        self.format_str = self.lines[self.current_line]
        if self.format_str[0] != "(":
            self.current_cmd += 1

    def hasMoreCommands(self):
        return self.current_line + 1  < self.num_lines

    def cmdtype(self):
        if self.format_str[0] == "@":
            return "A_cmd"
        elif self.format_str[0] == "(":
            return "L_cmd"
        elif self.format_str != "":
            return "C_cmd"

    def symbol(self):
        if self.cmdtype() == "A_cmd":
            return self.format_str[1:]
        elif self.cmdtype() == "L_cmd":
            return self.format_str[1:-1]


    def normal(self):
        if "=" not in self.format_str:
            self.format_str = "=" + self.format_str

        if ";" not in self.format_str:
            self.format_str = self.format_str + ";"

    def dest(self):
        self.normal()
        return self.format_str.split("=")[0]

    def comp(self):
        self.normal()
        return self.format_str.split("=")[1].split(";")[0]

    def jump(self):
        self.normal()
        return self.format_str.split(";")[1]

    def reset(self):
        self.current_line = -1
        self.current_cmd = -1



