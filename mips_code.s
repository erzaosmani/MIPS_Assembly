.data  
anArray: .word 10, 324, 45, 90, 9808     
n: .word 5                               
message: .asciiz "Largest in given array is:"

# text segment

.text                               
.globl main
 main:

la $a2, anArray                   # first array address
lw $a1,n                          # number of the elements                            
li $v0,4                             
la $a0,message
syscall                              

jal largestNumber                  # jump and link
li $v0, 10
syscall                            # completely terminates the function

largestNumber:
la $t4, anArray                    # put the address of "anArray" in the $t4 register            
li $t1, 0                                                  
lw $t3,0($t4)                      # put the address of the first element of the array in the $t3 register                                             
                                                 
Loop1:                             # for loop
bgt $t1,5,anArrayEnd1              # if $t1>5 go to anArrayEnd1
                                                      
lw $t0, 0($t4)                                                           
bgt $t0, $t3, change               # if t0 > $t3, go to change
addi $t1, $t1, 1                   # increment i=i+1
addi $t4, $t4, 4                                                     
j Loop1                            # jump to the Loop1

anArrayEnd1:
li $v0, 1                          # printing an integer
addi $a0, $t3,0                    # immediate instruction
syscall
jr $ra                             # jump and return

change:                            # label
add $t3,$t0,$zero                                                        
addi $t1, $t1, 1                   # increment i=i+1 again
 addi $t4, $t4, 4                                                      
j Loop1                                     