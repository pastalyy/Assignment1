.data

element1: .word PLACEHOLDER

element2: .word PLACEHOLDER

element3: .word PLACEHOLDER

element4: .word PLACEHOLDER

element5: .word PLACEHOLDER

num_elements: .word 5

#...to here---

sum_msg: .string "Sum: "

count_msg: .string "Count positive: "

max_msg: .string "Max: "

min_msg: .string "Min: "

newline: .string "\n"
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

#sums numbers into s0, a saved register

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
ecall
jump2:
blt t2, s2, jump3
addi s1, s1, 1
ecall
jump3:
blt t3, s2, jump4
addi s1, s1, 1
ecall
jump4:
blt t4, s2, jump5
addi s1, s1, 1
ecall
jump5:

#starts max at t0

mv s3, t0

#checks if max is greater than current number, if yes skips to next number, if no moves number to max

bge s3, t1, jump6
mv s3, t1

jump6: 
bge s3, t2, jump7
mv s3, t2
ecall

jump7: 
bge s3, t3, jump8
mv s3, t3
ecall

jump8: 
bge s3, t4, jump9
mv s3, t4
ecall

jump9:

#starts min at t0

mv s4, t0

#checks if min is less than current number, if yes skips to next number, if no moves number to min

blt s4, t1, jump10
mv s4, t1

jump10: 
blt s4, t2, jump11
mv s4, t2
ecall

jump11: 
blt s4, t3, jump12
mv s4, t3
ecall

jump12: 
blt s4, t4, jump13
mv s4, t4
ecall

jump13:

#printing 

#loads the message into a0 the return register, prints it, loads the corresponding value into a0, prints it, loads newline into a0, prints it

la a0, sum_msg
print_string

mv a0, s0
print_int

la a0, newline
print_string

la a0, count_msg
print_string

mv a0, s1
print_int

la a0, newline
print_string

la a0, max_msg
print_string

mv a0, s3
print_int

la a0, newline
print_string

la a0, min_msg
print_string

mv a0, s4
print_int

la a0, newline
print_string

done:

 li a7, 10

 ecall
