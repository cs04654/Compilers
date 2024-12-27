.data
str_nl: .asciz "\n"
j Lmain

L0:
#0 begin_block main_test _ _
sw ra, 0(sp)

L1:
#1 = x _ 10
lw t0, -4(sp)
addi t0, t0, -12
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -12
sw t0, 0(t0)

L2:
#2 = y _ 1
lw t0, -4(sp)
addi t0, t0, -16
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -16
sw t0, 0(t0)

L3:
#3 = i _ 1
lw t0, -4(sp)
addi t0, t0, -20
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -20
sw t0, 0(t0)

L4:
#4 <= i x 6
lw t0, -4(sp)
addi t0, t0, -20
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -12
lw t1, 0(t0)
ble t0, t1, 6

L5:
#5 jump _ _ 14
j L14

L6:
#6 <= y x 8
lw t0, -4(sp)
addi t0, t0, -16
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -12
lw t1, 0(t0)
ble t0, t1, 8

L7:
#7 jump _ _ 13
j L13

L8:
#8 + i 1 T%0
lw t0, -4(sp)
addi t0, t0, -20
lw t0, 0(t0)
li t1, 1
add t0, t1, t0
sw t0, -24(sp)

L9:
#9 = i _ T%0
lw t0, -4(sp)
addi t0, t0, -20
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -20
sw t0, 0(t0)

L10:
#10 + y 1 T%1
lw t0, -4(sp)
addi t0, t0, -16
lw t0, 0(t0)
li t1, 1
add t0, t1, t0
sw t0, -28(sp)

L11:
#11 = y _ T%1
lw t0, -4(sp)
addi t0, t0, -16
lw t0, 0(t0)
lw t0, -4(sp)
addi t0, t0, -16
sw t0, 0(t0)

L12:
#12 jump _ _ 6
j L6

L13:
#13 jump _ _ 4
j L4

L14:
#14 out i _ _
lw t0, -4(sp)
addi t0, t0, -20
lw a0, 0(t0)
li a7, 1
ecall
la a0, str_nl
li a7, 4
ecall

L15:
#15 out y _ _
lw t0, -4(sp)
addi t0, t0, -16
lw a0, 0(t0)
li a7, 1
ecall
la a0, str_nl
li a7, 4
ecall

L16:
#16 end_block main_test _ _
lw ra, 0(sp)
jr ra

Lmain:
sw sp, -4(fp)
addi sp, sp, 32
jal L0
addi sp, sp, -32
li a0, 0
li a7, 93
ecall
