test: clear all
	qemu-system-x86_64 -drive format=raw,file=os-image

all: bootloader kernel
	cat bootloader.bin kernel.bin > os-image

bootloader: boot/bootloader.asm
	nasm $< -f bin -I boot -o $@.bin

clear:
	rm -f *.bin *.o os-image

kernel: kernel_entry kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary -e main

kernel_entry: kernel/kernel_entry.asm
	nasm $< -f elf64 -o $@.o

kernel.o: kernel/kernel.c
	gcc -ffreestanding -c $< -o $@ -masm=intel
