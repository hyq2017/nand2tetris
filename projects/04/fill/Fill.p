
LOOP:
    addr=SCREEN
    kaddr=RAM[KBD] 
    k=RAM[kaddr]
    if k/=0 goto BLOOP
    if k=0 goto WLOOP



BLOOP:
    if addr = k goto LOOP
    RAM[addr]=-1
    addr = addr+1
    goto BLOOP

WLOOP:
    if addr = k goto LOOP
    RAM[addr]=0
    addr = addr+1
    goto WLOOP
