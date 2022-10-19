#	Afaryan, Roy
#	Project 2
#	10/20/2022
#	cs-2640-04-f22
#
#	Description:
#		A program that prompts for a date and outputs if the year is leap or 
#		not and the day of the week of the date.

	.data
name:	.asciiz	"Dates by R. Afaryan."
mPrompt:	.asciiz	"Enter the Month? "
dPrompt:	.asciiz	"Enter the Day? "
yPrompt:	.asciiz	"Enter the Year? "
leap:	.asciiz	" is a leap year and "
notLeap:	.asciiz	" is not a leap year and "
newLine:	.asciiz	"\n"
slash:	.asciiz	"/"
Sun:	.asciiz	" is a Sunday.\n"
Mon:	.asciiz	" is a Monday.\n"
Tue:	.asciiz	" is a Tuesday.\n"
Wed:	.asciiz	" is a Wednesday.\n"
Thur:	.asciiz	" is a Thursday.\n"
Fri:	.asciiz	" is a Friday.\n"
Sat:	.asciiz	" is a Saturday.\n"
	.text

main:
	la	$a0, name
	li	$v0, 4
	syscall			# print name
	la	$a0, newLine
	li	$v0, 4
	syscall			# print new line
	la	$a0, newLine
	la	$v0, 4
	syscall			# print new line
	
	la	$a0, mPrompt	# month
	li	$v0, 4
	syscall			# print month prompt
	li	$v0, 5		
	syscall			# read user input month
	move	$t0, $v0		# store month in $t0

	la	$a0, dPrompt	# day
	li	$v0, 4
	syscall			# print day prompt
	li	$v0, 5		
	syscall			# read user input day
	move	$t1, $v0		# store day in $t1
	
	la	$a0, yPrompt	# year
	li	$v0, 4
	syscall			# print year prompt
	li	$v0, 5		
	syscall			# read user input year
	move	$t2, $v0		# store year in $t2

	la	$a0, newLine
	la	$v0, 4
	syscall			# print new line

	li	$t9, 14
	sub	$t3, $t9, $t0
	div	$t3, $t3, 12	# a is stored in $t3 ((14 - month) / 2))

	sub	$t4, $t2, $t3	# y is stored in $t4 (year - a)

	mul	$t5, $t3, 12
	add	$t5, $t5, $t0
	sub	$t5, 2		# m is stored in $t5 (month + 12𝑎 − 2)

	add	$t6, $t1, $t4	# $t6 = day + year
	div	$t7, $t4, 4	# $t7 = y/4
	add	$t6, $t6, $t7	# day + year + y/4
	div	$t7, $t4, 100	# $t7 = y/100
	sub	$t6, $t6, $t7	# day + year + y/4 - y/100
	div	$t7, $t4, 400	# $t7 = y/400
	add	$t6, $t6, $t7	# day + year + y/4 - y/100 + y/400
	mul	$t7, $t5, 31	# 31 * m
	div	$t7, $t7, 12	# 31m/12
	add	$t6, $t6, $t7	# day + year + y/4 - y/100 + y/400 + 31m/12
	rem	$t6, $t6, 7	# (day + year + y/4 - y/100 + y/400 + 31m/12) mod 7
				# d is stored in $t6

	div	$t3, $t2, 4	# $t3 now holds year / 4
	div	$t4, $t2, 100	# $t4 now holds year / 100
	div 	$t5, $t2, 400	# $t5 now holds year / 400


isLeapYear:
	bnez	$t3, isNotLeapYear	# determine if it is leap year or not
	beqz	$t4, isNotLeapYear
	beqz	$t5, isNotLeapYear

	move	$a0, $t2
	li	$v0, 1
	syscall			# print year
	la	$a0, leap
	li	$v0, 4
	syscall			# print leap label
	b	printDate
	

isNotLeapYear:
	move	$a0, $t2
	li	$v0, 1
	syscall			# print year
	la	$a0, notLeap
	li	$v0, 4
	syscall			# print notLeap label

printDate:
	move	$a0, $t0
	li	$v0, 1
	syscall			# print month
	la	$a0, slash
	li	$v0, 4
	syscall			# print slash label
	move	$a0, $t1
	li	$v0, 1
	syscall			# print day
	la	$a0, slash
	li	$v0, 4
	syscall			# print slash label
	move	$a0, $t2
	li	$v0, 1
	syscall			# print year

	beq	$t6, 0, Sunday	# determine which day of the week it is
	beq	$t6, 1, Monday
	beq	$t6, 2, Tuesday
	beq	$t6, 3, Wednesday
	beq	$t6, 4, Thursday
	beq	$t6, 5, Friday
	beq	$t6, 6, Saturday

Sunday:
	la	$a0, Sun
	li	$v0, 4
	syscall			# print Sun label
	li	$v0, 10
	syscall			# exit
Monday:
	la	$a0, Mon
	li	$v0, 4
	syscall			# print Mon label
	li	$v0, 10
	syscall			# exit
Tuesday:
	la	$a0, Tue
	li	$v0, 4
	syscall			# print Tue label
	li	$v0, 10
	syscall			# exit
Wednesday:
	la	$a0, Wed
	li	$v0, 4
	syscall			# print Wed label
	li	$v0, 10
	syscall			# exit
Thursday:
	la	$a0, Thur
	li	$v0, 4
	syscall			# print Thur label
	li	$v0, 10
	syscall			# exit
Friday:
	la	$a0, Fri
	li	$v0, 4
	syscall			# print Fri label
	li	$v0, 10
	syscall			# exit
Saturday:
	la	$a0, Sat
	li	$v0, 4
	syscall			# print Sat label
	li	$v0, 10
	syscall			# exit