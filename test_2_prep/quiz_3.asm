# Provide exactly two more MIPS instructions so that the code computes the array index where the maximum
# value occurs. Use register $s3 to hold this index. For each of the two new instructions, indicate with an
# arrow where it should be inserted.
.data
    size: .word 5
    a: .word 1 2 3 4 5

.text
    main:

        la $t1, size
        lw $s0, 0($t1)

        la $t1, a
        lw $s1, 0($t1)

        addi $s2, $zero, 1

    loop: 
        bge $s2, $s0, endloop

        addi $t1, $t1, 4
        lw $t2, 0($t1)
        bgt $t2, $s1, newmax
        j label

    newmax: 
        move $s1, $t2

    label: 
        addi $s2, $s2, 1
        j loop

    endloop: