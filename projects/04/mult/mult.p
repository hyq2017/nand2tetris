// compute RAM[2] = RAM[0]*RAM[1]

    n=R1
    i=1
    sum=0

LOOP:
    if i > n goto STOP
    sum = sum + R0
    i = i + 1
    goto LOOP

STOP:
    R2 = sum
