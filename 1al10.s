	    @@ Instituto Tecnologico de Tijuana
    @@ Depto de Sistemas y Computación
	@@ Ing. En Sistemas Computacionales
@@   
@@ Autor : Angel Albino Garcia Cerrillo @nickname AAngel77
@@ Repositorio: https://github.com/AAngel777/2.4-.git
@@ 
@
@ Objetivo del programa:
@    Programa que organiza los numeros del 1 al 10
@	 Desensamblado por medio de la Raspberry y ejecutado en ensamblador de manera correcta

@Basado en el siguiente programa en C:
@#include <stdio.h>  
@/**
@ * Orders numbers from 1 to 10.
@ *
@ * @param numbers: An array of integers to store the ordered numbers.
@ */
@void orderNumbers(int numbers[]) {
@    // Initialize the array with numbers from 1 to 10.
@    for (int i = 0; i < 10; i++) {
@        numbers[i] = i + 1;
@    }
@}

@int main() {
@    int numbers[10];  // Declare an array to store the ordered numbers.
@
@    orderNumbers(numbers);  // Call the function to order the numbers.
@
@    // Print the ordered numbers.
@    printf("Ordered numbers from 1 to 10:\n");
@    for (int i = 0; i < 10; i++) {
@        printf("%d ", numbers[i]);
@    }
@    printf("\n");
@
@    return 0;
@}

@ ---------------------------------------
@	Data Section
@ ---------------------------------------

.arch armv6                 @ Configura la arquitectura ARMv6.
.eabi_attribute 28, 1       @ Configura atributos para EABI (Application Binary Interface).
.eabi_attribute 20, 1
.eabi_attribute 21, 1
.eabi_attribute 23, 3
.eabi_attribute 24, 1
.eabi_attribute 25, 1
.eabi_attribute 26, 2
.eabi_attribute 30, 6
.eabi_attribute 34, 1
.eabi_attribute 18, 4
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
.file "1al10.c"             @ El nombre del archivo fuente.
.text                        @ Sección de código comienza aquí.
.align 2                     @ Alinea el código en 4 bytes.
.global orderNumbers        @ La función orderNumbers se declara global.
.arch armv6                 @ Configura la arquitectura ARMv6 nuevamente.
.syntax unified              @ Usa la sintaxis unificada.
.arm                        @ Establece el modo ARM.
.fpu vfp                    @ Configura el uso del coprocesador de punto flotante VFP.
.type orderNumbers, %function @ Declara el tipo de función.

main:                         @ Comienza la función main.
    @ args = 0, pretend = 0, frame = 48
    @ frame_needed = 1, uses_anonymous_args = 0

    push {fp, lr}             @ Guarda fp y lr en la pila.
    add fp, sp, #4            @ Configura fp como puntero de marco.
    sub sp, sp, #48            @ Hace espacio para la pila local.

    sub r3, fp, #48            @ Calcula la dirección del argumento para orderNumbers.
    mov r0, r3                @ Configura r0 con la dirección del argumento.
    bl orderNumbers           @ Llama a la función orderNumbers.

    ldr r0, .L8                @ Carga la dirección de la cadena de caracteres en r0.
    bl puts                   @ Llama a la función puts para imprimir la cadena.

    mov r3, #0                @ Inicializa r3 a 0.
    str r3, [fp, #-8]          @ Guarda r3 en la pila local.

    b .L5                     @ Salta a la etiqueta .L5.

orderNumbers:               @ Comienza la función orderNumbers.
    @ args = 0, pretend = 0, frame = 16
    @ frame_needed = 1, uses_anonymous_args = 0
    @ link register save eliminado.

    str fp, [sp, #-4]!       @ Guarda el registro de enlace (fp) en la pila.
    add fp, sp, #0          @ Configura fp como puntero de marco.
    sub sp, sp, #20          @ Hace espacio para la pila local.

    str r0, [fp, #-16]       @ Guarda el primer argumento en la pila local.
    mov r3, #0              @ Inicializa r3 a 0.
    str r3, [fp, #-8]        @ Guarda r3 en la pila local.

    b .L2                   @ Salta a la etiqueta .L2.

.L3:
    ldr r3, [fp, #-8]        @ Carga r3 desde la pila local.
    lsl r3, r3, #2           @ Desplaza r3 a la izquierda por 2 (multiplica por 4).
    ldr r2, [fp, #-16]       @ Carga el valor almacenado en [fp, #-16] en r2.
    add r3, r2, r3           @ Calcula r2 + (r3 * 4) y guarda el resultado en r3.
    ldr r2, [fp, #-8]        @ Carga r2 desde la pila local.
    add r2, r2, #1           @ Incrementa r2 en 1.
    str r2, [r3]             @ Almacena r2 en la dirección apuntada por r3.

    ldr r3, [fp, #-8]        @ Carga r3 desde la pila local.
    add r3, r3, #1           @ Incrementa r3 en 1.
    str r3, [fp, #-8]        @ Guarda r3 en la pila local.

.L2:
    ldr r3, [fp, #-8]        @ Carga r3 desde la pila local.
    cmp r3, #9               @ Compara r3 con 9.
    ble .L3                  @ Si r3 es menor o igual a 9, salta a .L3.

    nop                       @ No realiza ninguna operación.

    add sp, fp, #0            @ Restablece la pila.
    @ sp needed

    ldr fp, [sp], #4          @ Recupera el registro de enlace (fp) desde la pila.
    bx lr                     @ Devuelve el control a la función que llamó a esta función.

    .size orderNumbers, .-orderNumbers @ Tamaño de la función orderNumbers.

.section .rodata              @ Sección de datos de solo lectura.
.align 2                       @ Alinea en 4 bytes.

.LC0:
    .ascii "Ordered numbers from 1 to 10:\000"  @ Cadena de caracteres.

.align 2                       @ Alinea en 4 bytes.

.LC1:
    .ascii "%d \000"               @ Cadena de formato para printf.

.text                          @ Sección de código comienza aquí.
.align 2                       @ Alinea en 4 bytes.
.global main                    @ La función main se declara global.
.syntax unified                  @ Usa la sintaxis unificada.
.arm                            @ Establece el modo ARM.
.fpu vfp                        @ Configura el uso del coprocesador de punto flotante VFP.
.type main, %function           @ Declara el tipo de función.


.L6:
    ldr r3, [fp, #-8]          @ Carga r3 desde la pila local.
    lsl r3, r3, #2             @ Desplaza r3 a la izquierda por 2 (multiplica por 4).
    sub r2, fp, #4             @ Calcula la dirección de la pila local.
    add r3, r2, r3             @ Calcula la dirección del elemento de la matriz.
    ldr r3, [r3, #-44]         @ Carga el valor almacenado en la dirección calculada.
    mov r1, r3                 @ Configura r1 con el valor cargado.
    ldr r0, .L8+4              @ Carga la dirección


