'''
@Author: hanyanqiang
@Date: 2020-06-19 20:55:39
@LastEditors: hanyanqiang
@LastEditTime: 2020-06-24 18:14:06
'''

import sys
from parse import Parse
from codetrans import CodeTrans
from symboltable import SymbolTable

def symbol_search(par, symbols):
    par.reset()
    while par.hasMoreCommands():
        par.advance()
        if par.cmdtype() == "L_cmd":
            sym = par.symbol()
            if not symbols.contains(sym):
                symbols.addEntry(sym, par.current_cmd+1)
                print("{} , {}" .format(sym, par.current_cmd))

def variable_search(par, symbols):
    par.reset()
    vs_num = 16
    while par.hasMoreCommands():
        par.advance()
        if par.cmdtype() == "A_cmd":
            sym = par.symbol()
            if not sym.isdigit() and not symbols.contains(sym):
                symbols.addEntry(sym, vs_num)
                print("{} , {}" .format(sym, vs_num))
                vs_num += 1

def assembler(par, symbols, code):
    par.reset()
    binary_list = []
    while par.hasMoreCommands():
        par.advance()
        if par.cmdtype() == "C_cmd":
            d = par.dest()
            c = par.comp()
            j = par.jump()
            binary_code = "111" + code.comp(c) + code.dest(d) + code.jump(j)
            binary_list.append(binary_code)
        elif par.cmdtype() == "A_cmd":
            sym = par.symbol()
            if sym.isdigit():
                binary_code = "0" + "{:015b}".format(int(sym))
            else:
                binary_code = "0" + "{:015b}".format(int(symbols.getAddress(sym)))
            binary_list.append(binary_code)
        return binary_list

def main():

    if sys.argv[1][-3:] != "asm":
        print("Error: wrong file type for input, use \".ams\" file !")
        sys.exit()

    inputfile = sys.argv[1]
    outputfile = inputfile[:-3] + "hack"

    par = Parse(inputfile)
    code = CodeTrans()
    symbols = SymbolTable()


    symbol_search(par, symbols)
    variable_search(par, symbols)
    binary_list = assembler(par, symbols, code)

    with open(outputfile,"w") as of:
        for bcode in binary_list:
            of.write(bcode + "\n")

if __name__ == "__main__":
    main()
