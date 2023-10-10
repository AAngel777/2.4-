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
	.file	"Division.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Error: Division by zero is not allowed.\000"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	divide
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	divide, %function
divide:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L4
	bl	puts
	mov	r3, #0
	b	.L3
.L2:
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	__aeabi_idiv
	mov	r3, r0
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.size	divide, .-divide
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Quotient: %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #10
	str	r3, [fp, #-8]
	mov	r3, #2
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	divide
	str	r0, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r0, .L8
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L9:
	.align	2
.L8:
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
