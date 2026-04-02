.data

element1: .word 1

element2: .word 2

element3: .word 3

element4: .word 4

element5: .word 5

num_elements: .word 5

#...to here---

.text

main:

#load memory addresses into temporary registers

la t0, element1
la t1, element2
la t2, element3
la t3, element4
la t4, element5

#loads value from address

lw t0, 0(t0)
lw t1, 0(t1)
lw t2, 0(t2)
lw t3, 0(t3)
lw t4, 0(t4)

#sums numbers into s0

add s0, t0, t1
add s0, s0, t2
add s0, s0, t3
add s0, s0, t4

#set count to 0

li s1, 0

#load immediate value of 1 for if statement

li s2, 1

#checks if number is less or equal to 0, if yes skips to next number if no add to counter

blt t0, s2, jump1
addi s1, s1, 1

jump1:
blt t1, s2, jump2
addi s1, s1, 1

jump2:
blt t2, s2, jump3
addi s1, s1, 1

jump3:
blt t3, s2, jump4
addi s1, s1, 1

jump4:
blt t4, s2, jump5
addi s1, s1, 1

jump5:








done:

 li a7, 10

 ecall
