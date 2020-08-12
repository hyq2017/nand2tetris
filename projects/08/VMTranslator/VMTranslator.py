import sys
from pathlib import Path
from parse import Parse
from codewriter import CodeWriter
from cmdtable import CmdTable

def write_vm1(inputfile, in_filename, ctabel, cw):
    par = Parse(inputfile, ctabel)
    cw.setInputname(in_filename)

    while par.hasMoreCommands():
        par.advance()
        ctype = par.cmdType()
        if ctype == "C_ARITHMETIC":
            cw.writeArithmetic(par.arg1())
        elif ctype == "C_PUSH" or ctype == "C_POP":
            cw.writePushPop(ctype, par.arg1(), int(par.arg2()))
        elif ctype == "C_LABEL":
            cw.writeLabel(par.arg1())
        elif ctype == "C_IF":
            cw.writeIf(par.arg1())
        elif ctype == "C_GOTO":
            cw.writeGoto(par.arg1())
        elif ctype == "C_FUNCTION":
            cw.writeFunction(par.arg1(), int(par.arg2()))
        elif ctype == "C_RETURN":
            cw.writeReturn()
        elif ctype == "C_CALL":
            cw.writeCall(par.arg1(), int(par.arg2()))

    #cw.getarith_jump()

def main():
    p=Path(sys.argv[1])
    ctabel = CmdTable()
    out_filename= p.stem
    inputfile_list = {}
    if p.is_file():
        outputfile = str(p.parent / (out_filename + ".asm"))
        inputfile_list[str(p)] = p.stem
    elif p.is_dir():
        outputfile = p / (out_filename + ".asm")
        for pfile in p.glob('*.vm'):
            inputfile_list[str(pfile)] = pfile.stem

    fout = open(outputfile, mode='w')
    cw = CodeWriter(fout, ctabel)
    if p.is_dir():
        cw.writeBoot()

    for inf, infname in inputfile_list.items():
        write_vm1(inf, infname, ctabel, cw)
    fout.close()

    # debug: write line number 
    #newfile = p / (out_filename + ".txt")
    #print(newfile)
    #with open(newfile, 'w') as file_linenum:
    #    line_count = 0
    #    with open(outputfile) as file_asm:
    #        for line in file_asm:
    #            if ("//" not in line) and ("(" not in line):
    #                line_count += 1
    #                line = str(line_count) + " " + line
    #            file_linenum.write(line)

if __name__ == "__main__":
    main()
