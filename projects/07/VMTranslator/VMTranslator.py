import sys
from parse import Parse
from codewriter import CodeWriter

def main():
    if sys.argv[1][-2:] != "vm":
        print("Error: wrong file type for input, use \".vm\" file !")
        sys.exit()

    inputfile = sys.argv[1]
    #inputfile = "BasicTest.vm"
    outputfile = inputfile[:-2] + "asm"

    par = Parse(inputfile)
    cw = CodeWriter(outputfile)

    while par.hasMoreCommands():
        par.advance()
        ctype = par.cmdType()
        #print(par.current_cmd)
        #print(par.cmdType())
        #print(par.arg1())
        #print(par.arg2())
        if ctype == "C_ARITHMETIC":
            cw.writeArithmetic(par.arg1())
        elif ctype == "C_PUSH" or ctype == "C_POP":
            cw.writePushPop(ctype, par.arg1(), par.arg2())

    cw.close()

if __name__ == "__main__":
    main()
