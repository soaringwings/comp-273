lw	$t0, 0($s0)
addiu	$t1, $zero, 1
and	$t2, $t0, $t1
bnez	$t2, skip
ori	$t0, $t0, 1
skip:	
	# further code
