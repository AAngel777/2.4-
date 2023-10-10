	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"Fibonacci.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Invalid input. The position should be a positive in"
	.ascii	"teger.\000"
	.text
	.align	2
	.global	fibonacci
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	fibonacci, %function
fibonacci:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L2
	ldr	r0, .L8
	bl	puts
	mvn	r3, #0
	b	.L3
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	beq	.L4
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L5
.L4:
	mov	r3, #1
	b	.L3
.L5:
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L6
.L7:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L6:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L7
	ldr	r3, [fp, #-16]
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L9:
	.align	2
.L8:
	.word	.LC0
	.size	fibonacci, .-fibonacci
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Enter the position of the Fibonacci number to calcu"
	.ascii	"late: \000"
	.align	2
.LC2:
	.ascii	"%d\000"
	.align	2
.LC3:
	.ascii	"The Fibonacci number at position %d is: %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L13
	bl	printf
	sub	r3, fp, #12
	mov	r1, r3
	ldr	r0, .L13+4
	bl	__isoc99_scanf
	ldr	r3, [fp, #-12]
	mov	r0, r3
	bl	fibonacci
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	beq	.L11
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	mov	r1, r3
	ldr	r0, .L13+8
	bl	printf
.L11:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L14:
	.align	2
.L13:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
